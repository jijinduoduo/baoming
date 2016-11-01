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
 * 用户站内信模型控制器
 */
class UserEnvelopeController extends HomeController {
     /* 站内信首页*/
	public function index(){
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		/* 数据分页*/
		$uid=is_login();
		$condition['uid'] = $uid;
		$condition['group'] ="2";
		$condition['username'] =get_regname($uid);
		$condition['_logic'] = 'OR';
		$list=D("UserEnvelope")->getLists($map);
		$this->assign('list',$list);// 赋值数据集
		$page=D("UserEnvelope")->getPage($map);
		$this->assign('page',$page);// 
		$this->meta_title = '我的站内信';
		$this->display();

	}
     /* 读取站内信*/
	public function detail(){
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		$UserEnvelope= M("UserEnvelope");
		$uid=D("member")->uid();
		$id=I("get.id",0,'intval');
		/* 更新浏览数 */
		$map = array('id' => $id);
		$UserEnvelope->where($map)->setInc('view');
		$UserEnvelope->where($map)->setField("status",2);
		$info=$UserEnvelope->find($id);
		$this->assign("info",$info);
		$this->meta_title = '查看站内信';
		$this->display();
	}
}
