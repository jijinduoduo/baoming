<?php
namespace Home\Controller;
use Think\Controller;
class BaomingController extends HomeController {
	public function index()
	{
		
		//实例化model类
		$ac = M('ac');
		$where['id'] = $_GET['id'];
		//查询数据库
		$data = $ac->where($where)->select();
		//var_dump($data);die;
		if($data[0]['status']==2){
			$content = '项目暂停中';
			$this->assign('content',$content);
			$this->display('stop');
		}elseif($data[0]['status']==0){
			$content = '项目不存在';
			$this->assign('content',$content);
			$this->display('stop');
		}else{
			//查看一次，查看人数加一
			$data1['see'] = $data[0]['see']+1;
			$res = $ac->where($where)->save($data1);
			$this->assign('data',$data);

			$this->display();
		}
		
	}
	public function chenggong()
	{
		$ac_uinfo = M('ac_uinfo');
		$data['ispay'] = 1;
		$data['paytime'] = time();
		$where['tag'] = $_SESSION['datas']["bill_no"];
		if(!$where['tag']){
			$where['tag'] = $_GET['tag'];
		}
		
		$data1 = $ac_uinfo->field('tid')->where($where)->find();
		$res = $ac_uinfo->where($where)->save($data);
		//实例化model类
		$ac = M('ac');
		$where['id'] = $_GET['id'];
		//查询数据库
		$data = $ac->where($where)->select();
		
		$this->assign('data',$data);

		$this->display();
	}
	
	public function add_user()
	{
		
		//实例化model类
		$ac_user = M('ac_user');
		$ac_uinfo = M('ac_uinfo');
		$ac = M('ac');
		$ac_data = $ac->field('sum,price,owner')->where("id=".$_POST['data'][0])->find();
		//查询是否到达人数上限,如果$sum等于0，则无上限，如果不等于0，则根据上限进行判断
		
		//$sum = $ac->field('sum')->where("id=".$_POST['data'][0])->find();
		$bsum = $ac_uinfo->query("select count(id) as bsum from baoming_ac_uinfo where status>-1 and tid = ". $_POST['data'][0]);
		if($ac_data['sum']!= 0){
			if($bsum[0]['bsum']>=$ac_data['sum']){
				$this->error('报名人数已达上限，谢谢参与！');die;
			}
		}
		
		if($_FILES){
			
		// 配置参数
   		$config = array(
   				'rootPath'	=>	'Uploads/',	// 上传的根路径，必选项
   				'savePath'	=>	'baoming/',	// 指定上传文件的子级目录
   				'maxSize'	=>	1048576,	// 上传文件的最大大小
   				'exts'		=>	array('png','gif','jpg'),	// 后缀名
   				'saveName'	=>	date('YmdHis'),	// 自定义的命名规则
   			);
			$upload = new \Think\Upload($config);

			// 2.单文件执行上传
			$res = $upload->uploadOne($_FILES['photo']);
		
			// 3.判断是否上传成功
			if ($res) {
				
				// 如果上传成功，返回的上传成功之后的文件信息
				
			    $path = 'Uploads/'.$res['savepath'].$res['savename'];
				//var_dump($path);
			} else {
				
				// 上传失败，$res为false，通过$upload->getError()返回错误信息
				//dump($upload->getError());
				//$this->error('图片上传失败！请重试');
			}
		}
		
		
		//查询付款金额
		//$price = $ac->field('price')->where("id=".$_POST['data'][0])->find();
		
		
		$data['name'] = $_POST['data'][1];
		$data['phone'] = $_POST['data'][2];
		$data['path'] = $path;
		
		//查询用户是否报过名
		$res1 = $ac_user->field('id,name')->where('phone='.$data['phone'])->select();
		if($res1){
			if($res1[0]['name']!=$data['name']){
				$this->error('此手机号已报名了，请用其他手机报名');
			}
			if($data['path']){
					$img['path'] = $data['path'];
				
					$ress = $ac_user->where('id='.$res1[0]['id'])->save($img);
				}
			//查询该项目是否报过名
			$res11 = $ac_uinfo->field('id')->where("status>-2 and uid=".$res1[0]['id']." and tid=".$_POST['data'][0])->select();
		
			if($res11){
				
				$res3 = $res11[0]['id'];
				if($ac_data['price']>0){
					$this->success('您已报名成功,去支付',U('Order/save','oid='.$res3));
				}else{
					//$this->success('您已报名成功,去支付',U('Baoming/chenggong/','id='.$_POST['data'][0]));
					header("Location: ".U('Baoming/chenggong','id='.$_POST['data'][0]));
				}
				
			}else{
				$data2['data'] = json_encode($_POST);
				$data2['uid'] = $res1[0]['id'];
				$data2['baotime'] = time();
				$data2['tid'] = $_POST['data'][0];
				$data2['tag'] = time().mt_rand(1000,9999);
				$data2['owner'] = $ac_data['owner'];
				//var_dump($data2);die;
				$res3 = $ac_uinfo->add($data2);
				
				if($res3){
					
					//$this->success('报名成功',U('Baoming/chenggong','id='.$_POST['data'][0]));
					
					if($ac_data['price']>0){
						$this->success('去支付',U('Order/save','oid='.$res3));
					}else{
						//var_dump($res3);die;
						$pay['ispay'] = 1;
						$ac_uinfo->where('id='.$res3)->save($pay);
						//$this->success('您已报名成功,去支付',U('Baoming/chenggong/','id='.$_POST['data'][0]));
						header("Location: ".U('Baoming/chenggong','id='.$_POST['data'][0]));
					}
					
				}else{
					$this->error('报名失败');
				}
			}
			
			
		}else{
			//先添加user表
			$res2 = $ac_user ->add($data);
			
			if($res2){
				$data2['data'] = json_encode($_POST);
				$data2['uid'] = $res2;
				$data2['baotime'] = time();
				$data2['tid'] = $_POST['data'][0];
				$data2['path'] = $path;
				$data2['tag'] = time().mt_rand(1000,9999);
				$data2['owner'] = $ac_data['owner'];
				$res3 = $ac_uinfo->add($data2);

				if($res3){

					//$this->success('报名成功',U('Baoming/chenggong','id='.$_POST['data'][0]));
					if($ac_data['price']>0){
						$this->success('去支付',U('Order/save','oid='.$res3));
					}else{
						//var_dump($res3);die;
						$pay['ispay'] = 1;
						$ac_uinfo->where('id='.$res3)->save($pay);
						header("Location: ".U('Baoming/chenggong','id='.$_POST['data'][0]));
					}
				}else{
					$this->error('报名失败');
				}
			}else{
				$this->error('报名失败');
			}
		}
	}
	
	
	 // 执行发送短信
    public function msg()
    {
    	/*
			第一步：开启curl扩展：php.ini中开启extension=php.curl.dll
			第二部：将Sms文件夹导入到Thinkphp/Library/Org下面
			第三部：接收用户的手机号码，执行发送
    	*/
    	// 通过输出ok确认前端和PHP通话了
    	 //echo 'ok';
		
    	// 1.接收传递过来的手机号码
    	$phone = I('post.phone');
		
    	// 2.发送的内容	mt_rand(1000,9999)	mt-rand(10000,99999)
		$yzm = mt_rand(100000,999999);
		//session('yzm',$yzm);
		cookie('yzm',$yzm,300);
		//session(array('yzm'=>$yzm,'expire'=>60));
    	$content = "[北京信息网]您的报名验证码是$yzm";
		
    	// 将验证码的信息存入到session中，然后当用户提交表单的时候，我们再去验证提交的验证码和session中短信验证码是否一样，如果相同，通过，不同，则退回去
		
    	// 3.执行发送(短信发送需要借助于curl扩展，php.ini配置文件中开启extension=php_curl.dll扩展)
    	$sms = new \Org\Sms\SmsBao('bjxxw123','bjxxw888');
    	$result = $sms->sendSms($phone, $content);
		//var_dump(session($yzm));
    	// 4.直接返回给客户端消息
    	$this->ajaxReturn($result);
    }
	
	//验证短信验证码
	public function checkyzm()
	{
		$yzm = $_POST['yzm'];
		//var_dump(session('yzm'));die;
		
		if(cookie('yzm')==$yzm && !empty($yzm)){
			echo json_encode(0);
		}else{
			echo json_encode(1);
		}
	}
	
	
	//查询是否报名页面
	public function search()
	{
		//var_dump($_GET);die;
		$this->assign('id',$_GET['id']);
		$this->display(); 
	}
	
	//查询操作
	public function searched()
	{
		//echo json_encode($_POST);die;
		//$_POST['id'] = 255;
		//$_POST['name'] = 'bajie';
		//$_POST['phone'] = '13648765842';

		//实例化model类
		$ac_user = M('ac_user');
		$ac_uinfo = M('ac_uinfo');
		$ac = M('ac');
		//查询姓名是否一致
		$data = $ac_user->field('id,name')->where('phone='.$_POST['phone'])->find();
		
		if($data['name'] == $_POST['name']){
			$title = $ac->field('title')->where('id='.$_POST['id'])->find();
			$res = $ac_uinfo->field('id')->where('uid='.$data['id'].' and tid='.$_POST['id'])->find();
			if($res){
				echo json_encode('您报名--'.$title['title'].'项目');
			}else{
				echo json_encode('您未进行报名'.$title['title'].'项目');
			}
		}else{
			echo json_encode('姓名或电话不正确');
		}
	}
}
