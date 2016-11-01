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
 * 会员模型控制器
 */
class MemberController extends HomeController {
    public function index(){
        if(!is_login()) {
		    $this->error( "您还没有登陆",U("User/login") );
		}		
        $uid=is_login();
        $faceid=D('UcenterMember')->getfaceid($uid);
		$this->assign('faceid', $faceid);
	    $lists=M("Member")->where("uid='$uid'")->select();
		$this->meta_title = get_username().'个人中心';
	    $this->assign('information', $lists);	
		$this->display();
    }

    public  function update() {
        if(!is_login()) {
			$this->error( "您还没有登陆",U("User/login") );
		}		
        $member=D("member");
	    if(IS_POST){ //提交表单
            if(false !== $member->update()){
                $this->success('更新成功！');
            } else {
                $error = $member->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } 	    
    }
}
