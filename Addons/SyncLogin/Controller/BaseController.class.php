<?php

namespace Addons\SyncLogin\Controller;
use Think\Hook;
use User\Api\UserApi;
use Home\Controller\AddonsController;
require_once(dirname(dirname(__FILE__))."/ThinkSDK/ThinkOauth.class.php");


class BaseController extends AddonsController{

    //登录地址
    public function login(){
        $type= I('get.type');
		$type=safe_replace($type);//过滤
        empty($type) && $this->error('参数错误');
        //加载ThinkOauth类并实例化一个对象
        $sns  = \ThinkOauth::getInstance($type);
        //跳转到授权页面
        redirect($sns->getRequestCodeURL());
    }

    //登陆后回调地址
    public function callback(){
        $code =  I('get.code');$code=safe_replace($code);//过滤
        $type= I('get.type');$type=safe_replace($type);//过滤
        $sns  = \ThinkOauth::getInstance($type);

        //腾讯微博需传递的额外参数
        $extend = null;
        if($type == 'tencent'){
            $extend = array('openid' => I('get.openid'), 'openkey' =>  I('get.openkey'));
        }

        $token = $sns->getAccessToken($code , $extend);
        $user_info = D('Addons://SyncLogin/SyncLogin')->$type($token); //获取传递回来的用户信息
        $condition = array(
            'openid' => $token['openid'],
            'type' => $type,
            'status' => 1,
        );
        $user_info_sync_login = D('sync_login')->where($condition)->find(); // 根据openid等参数查找同步登录表中的用户信息
		
        if($user_info_sync_login) {//曾经绑定过
            $user_info_user_center = D('UcenterMember')->find($user_info_sync_login ['uid']); 
			//根据UID查找Ucenter中是否有此用户
            if($user_info_user_center){
                $syncdata ['access_token'] = $token['access_token'];
                $syncdata ['refresh_token'] = $token['refresh_token'];
                D('sync_login')->where( array('uid' =>$user_info_user_center ['id'] ) )->save($syncdata); //更新Token
                $Member = D('Member');                   
                if( $Member->login($user_info_user_center['id']) ){    
                    $this->assign('jumpUrl', U('Home/Index/index'));
                    $this->success('同步登录成功');  
					
					
                }
				else{
                    $this->error($Member->getError());
                }
            }
			else{
                $condition = array(
                    'openid' => $token['openid'],
                    'type' => $type
                );
                D('sync_login')->where($condition)->delete();
            }
        } else { //没绑定过，去注册
            //$this->assign ( 'user', $user_info );
            //$this->assign ( 'token', $token );
           // $this->display(T('Addons://SyncLogin@./default/reg'));
            $User = new UserApi;
			$username=$user_info['name'];
			$password="11111111111111111";
			$email="xxxxx@qq.com";
			$uid = $User->register($username, $password, $email);
           if(0 < $uid){
				//TODO: 发送验证邮件
			  $data['uid'] = $uid;
              $data['openid'] = $token['openid'];
              $data['type'] = $type; 
			  $data['status'] = 1;
              $data['access_token'] = $token['access_token'];
              M('sync_login')->add($data);
				 /* 登录用户 */
				$Member = D('Member');
				if($Member->login($uid)){ //登录用户
					//TODO:跳转到登录前页面
					$this->success('登录成功！',U('Home/Index/index'));
				}
			} else { //注册失败，显示错误信息
				//$this->error($this->showRegError($uid));
				//echo $uid.$token['access_token'];
			}

        }
    }

}