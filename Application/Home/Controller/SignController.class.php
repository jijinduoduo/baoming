<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;
/**
 * 签到模型控制器
 * 文档模型列表和详情
 */
class SignController extends HomeController {
    public function index(){
     /*****用户中心签到****/     
		if ( !is_login() ) {
			 $this->error( "您还没有登陆",U("User/login") );
		}
	    $uid=is_login();
	    $Sign=D("Sign");
	    $nowtime=NOW_TIME;
	    $d=date('H:i:s',$nowtime);
	    $time=$Sign->where("uid='$uid'")->order("id desc")->limit(1)->getfield('create_time');
	    $member=D("member"); // 实例化对象
	    if($time){/*签过到*/
		   $a=date('Ymd',$nowtime);/*格式时间戳为 20141024*/
		   $b=date('Ymd',$time);
		   $c=date('H:i:s',$time);
		   if($a!==$b){/*比较*/
				  /*新增签到*/
			  $data['uid'] = $uid;
			  $data['status'] = "1";
			  $data['create_time']=NOW_TIME;
			 if ($Sign->add($data)){
				 $member->where("uid='$uid'")->setInc('score',10); // 用户的积分加10
				 $data['score']=$member->where("uid='$uid'")->getfield('score');
				 $c=date('y-m-d:h:i:s',$time);
				 $data['msg'] = "已签到，积分+10";
				 $data['status'] = "1";
				 $this->ajaxreturn($data); 
			  }
	 
			}else{
				 /*签过到*/
				  $data['status'] = "0";
				  $data['msg'] = "今天".$c."已签过到";
				  $data['score']=$member->where("uid='$uid'")->getfield('score');
				  $this->ajaxreturn($data); 
			}

	    } else{/*首次签到*/
			$data['uid'] = $uid;
			$data['status'] = "1";
			$data['create_time']=NOW_TIME;
			$member->where("uid='$uid'")->setInc('score',10); // 用户的积分加10
			if ($Sign->add($data)) {  
				$data['score']=$member->where("uid='$uid'")->getfield('score');
				$data['msg'] = "首次签到，已签到，积分+10,签到时间：".$d;
				$this->ajaxreturn($data);
			 }	  	  
	    } 
    }
}
