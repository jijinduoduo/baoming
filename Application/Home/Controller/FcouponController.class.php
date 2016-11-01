<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 烟消云散 <1010422715@qq.com> <http://www.yershop.com>
// +----------------------------------------------------------------------
namespace Home\Controller;
use User\Api\UserApi;

/**
 * 优惠券控制器
 */
class FcouponController extends HomeController {	
 
    public function check(){
	    
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		/***接受代码 */
        $code=I('post.couponid'); 
	    $code=safe_replace($code);//过滤
	    $fcoupon=M("fcoupon");
	    $id=$fcoupon->where("code='$code' ")->getfield("id");
	    /***获取优惠券id,优惠券存在 */
	    if (isset($id)){
		   $member=D("member");
		   $uid=$member->uid(); 
		   $coupon=M("UserCoupon");
			  /***用户优惠券存在 */
			  if($coupon->where("uid='$uid'and couponid='$id' and status='1'")->select()){
				   $data["info"] = "该优惠券可以使用";
				   $data["msg"] = "yes";
				   $data["status"] = "1";
				   $this->ajaxreturn($data); 
			  
			  }
			  else{
				 $data["info"] = "该优惠券已使用或未领取";
			     $data["msg"] = "no";
				 $data["status"] = "1";
				 $this->ajaxreturn($data);
			  
			  }
         }
         /***获取优惠券id,优惠券不存在 */
         else{
		   $data["info"] = "查询不到该优惠券";
		   $data["msg"] = "out of date";
		   $data["status"] = "1";
		   $this->ajaxreturn($data);
         }
      } 
}
