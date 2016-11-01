<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// |  Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------
namespace Home\Controller;
use OT\DataDictionary;
use User\Api\UserApi;
/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 $url= $_SERVER[HTTP_HOST]; //获取当前域名  
 */
class IndexController extends HomeController {
 

	/**系统首页**/
    public function index(){
        // cookie自动登录
		if(!is_login()&&cookie('username')&&cookie('password')){
		    $username=cookie('username'); 
            $password=cookie('password'); 
            $username =safe_replace($username);//过滤
			$user = new UserApi;
			$uid = $user->login($username, $password);
			if(0 < $uid){ //UC登录成功
					/* 登录用户 */
				$Member = D("Member");
				if($Member->login($uid)){ 
						//登录用户，记录日志
						addUserLog('cookie登陆成功',$uid);
			    }
		    }
       }
	   if( 1==C('IP_TONGJI') ){
		     $title="index";	   
		      /**首页统计代码实现 status=1**/
			 $record=IpLookup("",1,$title);
		}		
		/** 幻灯片* */
		$slide=D( 'slide' )->get_slide( );
		$this->assign( 'slide',$slide );
        /** 顶级栏目* */
		$tree=D( 'Category' )->maketree( ) ;
		$this->assign ( 'tree', $tree );
         /** 公告分类**/
		$notice=M('document')->order('id desc')->where("category_id='56'")->limit(8)->select();		
		$this->assign( 'notice',$notice );
       /** 活动分类**/
		$activity=M( 'document' )->order('id desc')->where("category_id='70'")->limit(8)->select();		
		$this->assign( 'activity',$activity );		
		$this->meta_title = '首页';		
		$this->display();
	}

    public function getGoodlist($cateid=null){
        $cateid=I( 'cateid',0,'intval' ); // 用intval过滤$_POST['id'];  
		$data = D( 'Category' )->getDatalist( $cateid );
        $this->ajaxReturn($data);
    }
}