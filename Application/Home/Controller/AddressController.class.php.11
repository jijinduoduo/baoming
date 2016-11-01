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
 * 地址模型控制器
 */
class AddressController extends HomeController {

	 /* 取消订单 */
	public function index(){
		if ( !is_login() ) {
					$this->error( "您还没有登陆",U("User/login") );
				}		
		$uid=is_login();	
		$address=M("address");
		$list=$address->where("uid='$uid'")->select();
		$this->assign('list', $list);
		$this->meta_title = get_username().'的地址管理';
		$this->display();
	}

		// 增加地址
	public  function save() {
	    if ( !is_login() ) {
				$this->error( "您还没有登陆",U("User/login") );
		}
		$address = M("address"); // 实例化address对象
		$data['address'] = I('post.posi','','strip_tags');//$_POST["posi"];
		$data['cellphone'] = I('post.pho',0,'intval'); // 用intval过滤$_POST["pho"];
		$data['realname'] = I('post.rel','','strip_tags'); // 用strip_tags过滤$_POST["rel"];
		$data['address'] =safe_replace($data['address']);//过滤
		$data['realname'] =safe_replace($data['realname']);//过滤
		$uid=is_login();
		$data['uid'] = $uid;
		$data['status'] = 0;
		$data['create_time']=NOW_TIME;
		$thisid=$address->add($data);
		if($thisid){
		   $this->ajaxreturn($thisid);
		}
		else{
		  $this->ajaxreturn($data);
		}
   }
   public  function add($id = null, $pid = 0){
       if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		
		$address = D('address');    
        if(IS_POST){ //提交表单
            if(false !==  $address->update()){
                $this->success('新增成功！', U('address/index'));
            } else {
                $error = $address->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } 
		else {
         $info = $id ?  $address->info($id) : '';
         $map["pid"]=0;
	     $list=M("area")->where($map)->select();
         $this->assign('list', $list);
         $this->assign('info',       $info);
         $this->assign('category',   $cate);
         $this->meta_title = '新增地址';
         $this->display();
      }     
   }
   public function change($pid){
       $pid=I('post.pid',0,'intval'); // 用intval过滤$_POST['pid']
	   $pid=safe_replace($pid);//过滤
	   $map["pid"]=$pid;
	   if($data=M("area")->where($map)->select()){
		  $this->ajaxReturn($data);
	   }
   }
		// 删除地址
   public  function deleteAddress() {
			 if ( !is_login() ) {
				$this->error( "您还没有登陆",U("User/login") );
			}
			$address = M("address"); // 实例化address对象
			$uid=is_login();
			$id=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
			if($address->where("uid='$uid' and id='$id'")->delete()){
				$data['msg'] = "删除成功";
				$data['status'] = 1;
				$this->ajaxreturn($data);
			}
			else{ 
				$data['msg'] = "删除失败";
				$data['status'] = 0;
				$this->ajaxreturn($data);
			}
	}
    public  function shezhi() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if(IS_AJAX){
			$uid=is_login();
			$address = M("address"); // 实例化address对象
			$data['status'] = 0;
			$address->where("uid='$uid'")->save($data);
			$id=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
			$result=$address->where("uid='$uid' and id='$id'")->setField("status",1);
			if($result){
				$msg = "设置成功";
				$this->ajaxreturn($msg);
			}
			else{
				$msg = "设置失败";
				$this->ajaxreturn($msg);
			}
	    }
	}
    public  function update() {
		
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		$uid=is_login();
		$member=M("member");
		$data = $member->create();
		$result =$member->where("uid='$uid'")->save();
		if($result) {
		  $this->success('修改成功！',U("center/information"));
		}else{
		  $this->error('修改失败！');
		}
	}

    public function build() {
 
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		$address = M("address"); // 实例化address对象
		$id=I('post.id'); // 用intval过滤$_POST['id']
		$id=safe_replace($id);//过滤
		$uid=D("member")->uid();
		$province=I('post.province');
		$province=safe_replace($province);//过滤
		$city=I('post.city'); 
		$city=safe_replace($city);//过滤
		$area=I('post.area');
		$area=safe_replace($area);//过滤
		$data['province'] = $province;
	    if($province==$city){
		   $data['city'] = '';
		}else{
		   $data['city'] = $city;
		}
		if($area==$city){
		   $data['area'] = '';
		}else{
		   $data['area'] = $area;
		}  
		$data['address'] = safe_replace(I('post.posi')); 
		$data['cellphone'] =safe_replace(I('post.pho')); 
		$data['realname'] = safe_replace(I('post.rel'));
		
	   if($_POST["msg"]=="yes"){
//地址库有默认地址，有则保存
          if($address->where("uid='$uid' and status='1'")->getField("id")){ 	  
			  $address->where("uid='$uid' and status='1'")->save($data);  
			  $addressid=$address->where("uid='$uid' and status='1'")->getField("id");
			  addUserLog('修改默认地址',$uid);
          }
             //地址库有默认地址，有则保存	
          else{	
		    $data['status'] = 1;
		    $data['create_time']=NOW_TIME;
		    $data['orderid'] = $id;
		    $data['uid'] = $uid;
		    $addressid=$address->add($data);
		    addUserLog('新增默认地址',$uid);
	      } 
		  $data['addressid']=$addressid;
		  $data['value'] = "default";
			  // 返回新增标识
		  $data['msg'] = 'yes';
	  }
	  else{
		$data['status'] = 0;
		$data['time']=NOW_TIME;
        $data['orderid'] = $id;
		$addressid=$address->add($data); // 根据条件保存修改的数据
        addUserLog('新增非默认地址',$uid);
	    $data['addressid'] =$addressid;
	    $data['msg'] = 'no';
	  }
      $this->ajaxReturn($data);
    }
}
