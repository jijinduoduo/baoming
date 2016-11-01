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
 * 换货模型控制器
 * 文档模型列表和详情
 */
class ExchangeController extends HomeController {

    /* 取消订单 */
    public function index(){
        if ( !is_login() ) {
		       $this->error( "您还没有登陆",U("User/login") );
		}
		if (IS_POST){
		     $id= I('post.id',0,'intval');//获取id
            if(!is_numeric($id)){
		         $this->error('ID错误！');
		    }
            $info=M("shoplist")->find($id);
			$postnum=I('post.num');
            if(!is_numeric($postnum)){
		         $this->error('数量错误！');
		    }
            if($postnum<1){
		         $this->error('无效数量！');
		    }
			$num= $info['num'];//获取num
			$price=$info['price'];//获取价格
			$goodid=$info['goodid'];//获取goodid
			$parameters=$info['parameters'];
			$Exchange=D("Exchange");
			$Exchange->create(); 
			$Exchange->create_time=NOW_TIME;
			$Exchange->total=$num*$price;
			$Exchange->goodid=$goodid;
			$Exchange->status=1;
			$Exchange->parameters=$parameters; 
			$Exchange->add();
			addUserLog('申请换货，商品名称'.get_good_name($goodid).'参数'.$parameters, is_login())	;
			$data['status']=-4;			 //更改商品的售后信息
			$shop=M("shoplist");
				  if ($shop->where("id='$id'")->save($data)) {
					 $this->success('申请成功',U("center/index"));
				  } else{
					  $this->error('申请失败，或重复操作');
				  }
		}else{
			   $id= I('get.id',0,'intval');//获取id
			   $msg="Tips，提交换货单";
			   $this->meta_title = '填写换货单';
			   $detail=M("shoplist")->find($id);
			   $this->assign('list',$detail); 
			   $this->assign('msg',$msg); 
			   $this->display();
       }
    }
    public function detail(){
        if ( !is_login() ) {
		       $this->error( "您还没有登陆",U("User/login") );
		}
		$id= I('get.id',0,'intval');//获取id
		if(!is_numeric($id)){
		         $this->error('ID错误！');
		}
		$Exchange=M("Exchange");
		$list= $Exchange->where("shopid='$id'")->find();
		$info= M("Exchange")->where("shopid='$id'")->getField("backinfo");
		$this->assign('info',$list);
		$this->assign('backinfo',$info);
		$this->assign('id',$id);
		$this->meta_title = '换货单'.$list['id'].'详情';
		$msg="换货:";
		$this->assign('msg',$msg);
		$this->display();
    }
}
