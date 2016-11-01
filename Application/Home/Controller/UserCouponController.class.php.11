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
 * 用户优惠券模型控制器
 * 文档模型列表和详情
 */
class UserCouponController extends HomeController {


	public  function index() {
		if (!is_login()) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		/* 会员调用*/
		$uid=is_login();
		/* 优惠券调用*/
		$coupon=M("UserCoupon")->where("uid='$uid' ")->select();
		$this->assign('couponlist', $coupon);
		$fcoupon=M("fcoupon")->where("display='1' and status='1' ")->select();;
		$this->assign('fcouponlist', $fcoupon);
		$this->meta_title = '我的优惠券';
		$this->display();
	}
      /*****领优惠券**********/
	public  function get() {
		if ( !is_login() ) {
		     $this->error( "您还没有登陆",U("User/login") );
		}

		$id=I('post.couponid',0,'intval'); // 用intval过滤$_POST["couponid"];
		$uid=is_login();
		$coupon=M("UserCoupon");
		if($coupon->where("uid='$uid'and couponid='$id'")->select() ){
			$data["msg"] = "已领取过";
			$data["status"] = "0";
			$this->ajaxreturn($data);
		}else{ 
			$data["uid"] = $uid;
			$data["couponid"] = $id;
			$data["time"] = NOW_TIME;
			$data["status"] = "1";
			$data["info"] = "未使用";
			$coupon->add($data);
			$data["msg"] = "已成功领取，请刷新查看";
			$this->ajaxreturn($data);
	    }
    }
}
