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
 * 取消订单模型控制器
 * 文档模型列表和详情
 */
class CancelController extends HomeController {

     /* 取消订单 */
    public function index(){
	    if ( !is_login() ) {
			  $this->error( "您还没有登陆",U("User/login") );
		    }
	    $this->meta_title = '取消订单';
	    if (IS_POST){
			 $id= I('post.id','','strip_tags');//获取orderid
			 $id =safe_replace($id);//过滤
			 $order=M("order");
			 $status=$order->where("orderid='$id'")->getField("status");
			 $num=$order->where("orderid='$id'")->getField("ispay");
			 $shopid=$order->where("orderid='$id'")->getField("id");
			 $data=$order->where("id='$shopid'")->select();
			    foreach ($data as $k=>$val) {
					$goodid=$val['goodid'];
					$price=get_good_price($goodid);
					 /*取消的商品总额*/
					$cash+= $val['num'] * $price;
					/*退货中的商品件数*/
					$num+=$val['num'];
					 /*退货中的商品种类数*/
					$count+=1;
                  }
	          //订单已提交或未支付直接取消
				if (($num==-1&&$status==1)||($num==1&&$status==-1)){
				//设置订单取消
				//保存数据到取消表中后台调用
				$cancel=D("cancel");
				$cancel->create();
				$cancel->create_time=NOW_TIME;
				$cancel->status=3;
				$cancel->orderid=$id;
				$cancel->cash=$cash;//取消的金额
				$cancel->num=$num;//取消的数量
				$cancel->count=$count;//取消的种类
				$cancel->info="自助取消";
				$cancel ->add();
				addUserLog('取消订单', $uid)    ;
                  //设置订单为订单已取消
                $data = array('status'=>'6','backinfo'=>'订单已关闭');
	              //更新订单列表订单状态为已取消，清空取消订单操作
					if ($order->where("orderid='$id'")->setField($data)) {
						$this->success('申请成功，订单已取消',U("center/index"));
					}else{
					   $this->error('申请失败，请重试');
					}	
            } //订单已发货，或已支付未发货,需申请，申请状态码4，拒绝5，同意6
            else{
			   $cancel=D("cancel");
			   $cancel->create();
			   $cancel->time=NOW_TIME;
			   $cancel->status=1;
			   $cancel->orderid=$id;
			   $cancel->cash=$cash;//取消的金额
			   $cancel->num=$num;//取消的数量
			   $cancel->count=$count;//取消的种类
			   $cancel ->add();
			   addUserLog('申请取消订单', $uid)	;
			   $data = array('status'=>'4');//设置订单状态为已提交，发货等状态不变
				  if ($order->where("orderid='$id'")->setField($data)) {
					  $this->success('申请成功',U("center/allorder"));
				  }else{
					 $this->error('申请失败，请重试');
				  }	  
			  }
          }
          else{
			$id= I('get.id','','strip_tags');//获取orderid
			$msg="申请取消订单:";
			$id =safe_replace($id);//过滤
			$order=M("order");
			$detail=$order->where("orderid='$id'")->select(); 
			$num=$order->where("orderid='$id'")->getField("status");
			if ($num=="1"){ 
					$paynum=$order->where("orderid='$id'")->getField("ispay");
					  if($paynum=="1"){
						 $info="当前订单状态为未完成支付";
					  }
					  if(!$paynum){
						 $info="当前订单已提交等待发货中";
				  
					  }
				}
				if ($num=="2"){
				   $info="当前提交的订单已发货,需审核通过后取消";
				}
		  $list=M("shoplist");
			  foreach($detail as $n=> $val){
					  $detail[$n]['id']=$list->where('orderid=\''.$val['id'].'\'')->select();	  
			  }
		  $this->assign('info',$info); 
		  $this->assign('detaillist',$detail); 
		  $this->assign('id',$id); 
		  $this->assign('msg',$msg); 
		  $this->display();
		  $this->meta_title = '取消订单';
		}
   } 
   public function detail(){
		 if ( !is_login() ) {
				$this->error( "您还没有登陆",U("User/login") );
		 }		
		  $orderid= I('get.id','','strip_tags');//获取orderid
		  $orderid =safe_replace($orderid);//过滤
		  $cancel=M("cancel");
		  $list= $cancel->where("orderid='$orderid'")->select();
		  $info= M("order")->where("orderid='$orderid'")->getField("backinfo");
		  $this->assign('list',$list); 
		  $this->assign('backinfo',$info); 
		  $this->assign('id',$orderid); 
		  $msg="申请取消订单:";
		  $this->meta_title = '取消订单详情';
		  $this->assign('msg',$msg); 
		  $this->display(); 
      }
}
