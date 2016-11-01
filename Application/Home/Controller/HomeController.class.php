<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
/**
 * 前台公共控制器
 * 为防止多分组Controller名称冲突，公共Controller名称统一使用分组名称
 */
class HomeController extends Controller {

	/* 空操作，用于输出404页面 */
	public function _empty(){
		$this->redirect('Index/index');
	}

    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('Config/lists');
        C($config); //添加配置
        if(!C('WEB_SITE_CLOSE')){
            $this->error('站点已经关闭，请稍后访问~');
        }

       /**垂直菜单**/
		$category=D( 'Category' )->getCategory() ;
		$this->assign('category', $category);		
		
		/**购物车**/
		$cart=D( 'shopcart' )->getcart( );
		$this->assign( 'usercart',$cart );
        
		/* 热门搜索 */
		$str=M( 'config' )->where( 'id="40"' )->getField( "value" );	
		$hotsearch=explode(",",$str);
		$this->assign( 'hotsearch' , $hotsearch );
		
		/* 广告位 */
	    $adData= D( 'ad' )->getlist();
        $this->assign( 'adData', $adData );      
      
		/**底部菜单**/
	    $footer=D( 'Category' )->getfooter() ;
	    $this->assign( 'footer',$footer );      
       
		/**所在地**/
	    if(!session("user_area")){
		     $arr=get_ip_address( );
		     $area=$arr->city;
	    }else{
	         $area= session("user_area");
	    }
	    $this->assign("user_area",$area);  
    }

	/* 用户登录检测 */
	protected function login(){
		/* 用户登录检测 */
		is_login() || $this->error('您还没有登录，请先登录！', U('User/login'));
	}


}
