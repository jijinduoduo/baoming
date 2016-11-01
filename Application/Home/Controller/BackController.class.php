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
 * 退货模型控制器
 */
class BackController extends HomeController {

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
		 if ($postnum>$num) {
			 $this->error('超出购买数量');
		 } else {
				//保存信息到退货表
			 $back= D("backlist");
			 $back->create();//Create方法创建的数据对象是保存在内存,并没有实际写入到数据库，直到使用add或者save   方法才会真正写入数据库
			 $back->create_time=NOW_TIME;
			 $back->status=1;
			 $back->goodid=$goodid;
			 $back->total=$num*$price; 
			 $back->parameters=$parameters; 
			 $result=$back->add();
			 addUserLog('申请退货，商品名称'.get_good_name($goodid).'参数'.$parameters, is_login())	;
			   //更改商品的售后信息   
			 $data['status']=4;
			 $shop=M("shoplist");
			 $add=$shop->where("id='$id'")->save($data);
				  if ($add) {
							$this->success('提交成功',U("center/index"));
				  }else{
							$this->error('申请失败',U("center/index"));
				  }
			 }
		 }else{
			$this->meta_title = '提交退货单';
			$id= I('get.id',0,'intval');//获取id
			if(!is_numeric($id)){
		       $this->error('ID错误！');
		   }
		   $msg="Tips，提交退货单";
		   $detail=M("shoplist")->find($id);
			//获取购物清单
			$this->assign('list',$detail); 
		   //获取物品id
			$this->assign('id',$id); 
			$this->assign('msg',$msg); 
			$this->display();
		}
	}
    public function detail(){

        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}	
		$id= I('get.id',0,'intval');//获取orderid
		$back=M("backlist");
		$list= $back->where("shopid='$id'")->find();
		$info= M("backlist")->where("shopid='$id'")->getField("backinfo");
		$this->assign('info',$list); 
		$this->assign('backinfo',$info); 
		$msg="退货单"; 
		$this->assign('msg',$msg); 
		$this->display(); 
     }
}
