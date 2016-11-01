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
 * Ucenter用户模型控制器
 * 文档模型列表和详情
 */
class UcenterMemberController extends HomeController {


    public  function edit() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		$uid=is_login();	
	    $info=M("ucenter_member")->where("id='$uid'")->find();
		$this->assign('info',$info);  
        $this->meta_title = '修改图像';
	    $this->display();
    }
    public  function update() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if (IS_POST){
	         $uid=is_login();		
		     $face =I("post.face",0,'intval');
             $res =D("UcenterMember")->update();
             if(false!==$res){
                $this->success("修改成功！");
             }else{
                $this->error('修改失败');
             }
        }
    }
}
