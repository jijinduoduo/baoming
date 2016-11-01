<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com  All rights reserved.
// +----------------------------------------------------------------------
// |  Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------
namespace Home\Controller;
use Think\Controller;
/*****安全中心***********/
class AccountController extends HomeController {
  
    public  function security() {
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}			
		$uid=is_login();	
		$this->assign('uid', $uid);
		/*最后一次登录时间*/
		$time=M("member")->where("uid='$uid'")->limit(1)->find();
		$this->assign('time', $time);	
		$this->meta_title = '安全中心';
		$verification=M("verification");
		$uid=D("member")->uid();
		$condition['uid'] = $uid;
		$condition['mobile'] = $mobile;
		if($verification->where($condition)->select()){
		   $mobile='手机已验证';
		
		}
		else{
		  $mobile="";
		}
       //支付密码设置判断
        $str=D("member")->where("uid='$uid'")->getField('paykey');
		$code= encrypt($str,'D',$key); //解密
		$this->assign('code', $code);	
        $mail=get_email($uid);
		$verid=$verification->where("email='$mail'")->getField('id');
		$this->assign('emailid', $verid);
		if($mobile){
			$num1=1;
		}else{
			$num1=0;
		}
		if($verid){
			$num2=1;
		}else{
			$num2=0;
		}
	    if($code){
			$num3=1;
		}else{
			$num3=0;
		}
	    $num=$num1+$num2+$num3;
        $this->assign('num', $num);  
        $this->display();
		
	}

    public  function checkemail() {
		$uid=D("member")->uid();
		$this->assign('uid', $uid);	
		$uid=D("member")->uid();
		$email=get_email($uid);
		$this->assign('email', $email);
		$this->meta_title = '验证邮箱';
		$this->display();

	}
    public  function paykey() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		/* uid调用*/
		$uid=D("member")->uid();
		$this->assign('uid', $uid);	
		$email=get_email($uid);
		$this->assign('email', $email);
		$this->meta_title = '支付密码设置';
		$str=D("member")->where("uid='$uid'")->getField('paykey');
		$code= encrypt($str,'D',$key); //解密
		$this->assign('code', $code);
		$this->display();
	}
    public  function savepaykey() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if(IS_POST){
			$member=D("member");
		    $member->create();
			$uid=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
			$str=I('post.paykey','','strip_tags');	
			$str =safe_replace($str);//过滤
			$data['paykey']=encrypt($str,'E',$key);
		    if($member->where("uid='$uid'")->save($data)){
		       $this->success("设置成功",U('account/security')) ; 
		    }
	       else{
		     $this->error("设置失败")  ;
		   }		
		}

	}
    public  function checkmobile() {
		$uid=D("member")->uid();	
		$this->assign('uid', $uid);
		$_SESSION['send_code'] = random(6,1);//生成随机加密码
		$this->meta_title = '验证手机';
		$this->display();
	}
     /** 发送短信验证 **/
    public  function send_sms() {
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if(IS_AJAX){
		//判断是否验证过
			$mobile = $_POST['mobile'];
			$mobile=safe_replace($mobile);//过滤
			$send_code = $_POST['send_code'];//获取提交随机加密码
			$send_code=safe_replace($send_code);//过滤
			$content="您的验证码是：".$mobile_code."。请不要把验证码泄露给其他人。";
			$result=sendsmscode($mobile,$content,$send_code);
			$this->ajaxReturn($result);

		}
	}
		/** 验证短信 **/
    public  function checksmscode() {
        if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if($_POST['mobile']!=$_SESSION['mobile'] or $_POST['mobile_code']!=$_SESSION['mobile_code'] or   empty($_POST['mobile']) or empty($_POST['mobile_code'])){
			$data['msg']="手机验证码输入错误";
			$data['status']=0;
		}
		else{
			$_SESSION['mobile'] = '';
			$_SESSION['mobile_code'] = '';
			$data['msg']="验证成功";
			$data['status']=1;
			$verification=M("verification");
			$uid=D("member")->uid();
			$data['mobile']=I('post.mobile',0,'intval'); // 用intval过滤$_POST['mobile'];;
			$data['create_time']=NOW_TIME;
			$data['tag']=2;
			$data['uid']=$uid;
			$verification->create();
			$verification->add($data);
	    }
			$this->ajaxReturn($data);
	}
		/** 发送邮箱验证 **/
	public  function send_email() {
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
		if(IS_AJAX){
			$uid=is_login();	
			$mail=get_email($uid);
			$title="邮箱验证";
			$auth=sha1(C('DATA_AUTH_KEY'));
			$name= $_SERVER['SERVER_NAME'];
			$url = $_SERVER['SERVER_NAME'].U("account/confirm_email",array('regid'=>$uid,'type'=>"email",'auth'=>$auth,'url'=>$name));
			$words=sha1($url);
			$content="您正在进行邮箱验证,<a href=\"".$url."\" target='_blank'>".$words.'</a>，请点击链接激活';
			if(SendMail($mail,$title,$content)){
				$data['msg'] = '发送成功';
				$data['damain'] =$url;
				$data['uid']=$uid;
				$data['content']= $content;
				$data['account']= $mail;
				$data['username']=get_regname($uid);
				$data['create_time']=NOW_TIME;
				$email=M("email");
				$data['sendname']="system";
				$data['status']=1;
				$email->create();
				$email->add($data);
				$this->ajaxReturn($data);

			}
			else{
				$data['msg'] = '发送失败';
				$data['damain'] =$url;
				$this->ajaxReturn($data);
			}
	    }
	}
      /** 激活邮箱 **/
    public  function confirm_email() {
		$type=I("get.type");
        $type =safe_replace($type);//过滤
		$regid=I("get.regid",0,'intval');
		if($type&&$regid){
			$verification=M("verification");
			$mail=get_email($uid);
			$data['email']= $mail;
			$data['create_time']=NOW_TIME;
			$data['status']=1;
			$data['tag']=1;
			$data['uid']=$regid;
			$verification->create();
			$verification->add($data);
			$this->display("success");
		}
		else{
		  $this->redirect("index/index");
		}
    }

    public function history() {
		if ( !is_login() ) {
			$this->error( "您还没有登陆",U("User/login") );
		}
        $uid=is_login();	
		/**必须**/
		$User =M("history");
		$count= $User->where("uid='$uid'")->count();
		$this->assign('count',$count);// 赋值输出
		$Page= new \Think\Page($count,10);
		$Page->setConfig('prev','上一页');
		$Page->setConfig('next','下一页');
		$Page->setConfig('first','第一页');
		$Page->setConfig('last','尾页');
		$Page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
		$show= $Page->show();
		$list=$User->where("uid='$uid'")->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->meta_title = '登录历史';
		$this->display();
	}
}
