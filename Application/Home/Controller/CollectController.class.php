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
 * 收藏模型控制器
 * 文档模型列表和详情
 */
class CollectController extends HomeController {


	public function index(){
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}	
		$collect=D("collect"); 
		$uid=is_login();
		$this->meta_title = '我的收藏';
		$type=I("type",0,'intval');
		if($type=="2"){
			$map['uid']=$uid;
			$map['type']=2;
			$list=D("collect")->getLists($map);  //数据分页
			$this->assign('list',$list);  
			$page=D("collect")->getPage($map); //分页码
			$this->assign('page',$page);// 
			$this->display("collect_type2");
		}else{
			$map['uid']=$uid;
			$map['type']=1;
			$list=D("collect")->getLists($map);
			$this->assign('list',$list);// 赋值数据集   
			$page=D("collect")->getPage($map);
			$this->assign('page',$page);// 
			$this->display();
	    }
   }
    //增加收藏
   public function add(){
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if(IS_POST){
			$id=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
			$price=I('post.price');
			$price=safe_replace($price);//安全过滤
			$data["id"] = $id;
			$uid=is_login();
			$data["uid"]=$uid;
			$fav=M("collect");	
            $exsit=$fav->where("goodid='$id' and uid='$uid' and  type=1 and status=1")->getField("id");
			if (isset($exsit)){
				$data["status"] = 1; 
				$data["type"] = 1;
				$data["msg"] = "已收藏过，请不要重复收藏";
				$this->ajaxReturn($data); 
			}
			else{	
			   $fav->create();
			   $fav->status=1;
			   $fav->type=1;
			   $fav->goodid=$id;
			   $fav->price=$price;
			   $fav->create_time=NOW_TIME;
			   $fav->uid=$uid;
			   $fav->add();
			   $data["status"] = 1; 
			   $data["type"] = 1;
			   $data["msg"] = "已收藏";
			   $this->ajaxReturn($data); 
		   }
	   }
   }

   public function delete(){
	   $id=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
	   $map["id"]=array("in",$id);
	   if(M("collect")->where($map)->delete()){
		  $this->success("删除成功");
	   }else{
		  $this->error("删除失败");
	   }
   }
}
