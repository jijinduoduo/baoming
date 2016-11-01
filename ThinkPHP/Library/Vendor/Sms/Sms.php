<?php 
/**
 * PHPMailer - PHP email transport class
 * NOTE: Requires PHP version 5 or later
 * @package PHPMailer
 * @author Andy Prevost
 * @author Marcus Bointon
 * @author Jim Jagielski
 * @copyright 2010 - 2011 Jim Jagielski
 * @copyright 2004 - 2009 Andy Prevost
 * @version $Id: class.phpmailer.php 450 2010-06-23 16:46:33Z coolbru $
 * @license http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License
 */
namespace Vendor\Sms;
class Sms {	
	var $target ="http://106.ihuyi.cn/webservice/sms.php?method=Submit";//短信post提交地址;
	//var $username='用户名';//互亿短信平台上注册的用户名，每个账号可以获得10条测试短信;
	//var $password='密码';//密码;
	
	function __construct() {
		$this->Sms();
	}
	function Sms()
    {

    }
	//curl post 方式提交请求获取响应信息。
	function Post($curlPost,$url){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
		$return_str = curl_exec($curl);
		curl_close($curl);
		return $return_str;
	}
	//将xml格式的数据转化成为数组
	function xml_to_array($xml){
		$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
		if(preg_match_all($reg, $xml, $matches)){
			$count = count($matches[0]);
			for($i = 0; $i < $count; $i++){
			$subxml= $matches[2][$i];
			$key = $matches[1][$i];
				if(preg_match( $reg, $subxml )){
					$arr[$key] = $this->xml_to_array( $subxml );
				}else{
					$arr[$key] = $subxml;
				}
			}
		}
		return $arr;
	}
	//短信发送函数，实际上调用的是Curl_Post 函数发送的,$mobile为发送的对象手机号，$msg为发送的内容，注意：$msg的模板内容必须经过了互亿短信平台的审核方可发送成功
	
	
	function sendcode($mobile,$content,$send_code,$mobile_code){

if(empty($mobile)){
	exit('手机号码不能为空');
}

if(empty($_SESSION['send_code']) or $send_code!=$_SESSION['send_code']){
	//防用户恶意请求
	exit('请求超时，请刷新页面后重试');
}

		$post_data = "account=".C('SMSACCOUNT')."&password=".C('SMSPASSWORD')."&mobile=".$mobile."&content=".rawurlencode($content);//密码可以使用明文密码或使用32位MD5加密
		$gets=  $this->xml_to_array($this->Post($post_data,$target));
		if($gets['SubmitResult']['code']==2){//返回码等于2的时候
			$_SESSION['mobile'] = $mobile;//注册session

	        $_SESSION['mobile_code'] = $mobile_code;
	//验证记录
			 $verification=M("verification");
   $data['mobile']= $mail;
   $data['create_time']=NOW_TIME;
   $data['status']=1;
   $data['group']=2;
   $data['uid']=D("member")->uid();
   $verification->create();
   $verification->add($data);
   //短信记录
    $sms=M("sms");
   $sms->content=$content;
  $sms->mobile=$mobile;
   $sms->create_time=NOW_TIME;
   $sms->group=1;//验证
   $sms->create();
  $sms->add();

			echo $gets['SubmitResult']['msg'];//提交成功
		}else{
			echo $gets['SubmitResult']['msg'];//发送失败！
		}
		
	}


function send($mobile,$content){

if(empty($mobile)){
	exit('手机号码不能为空');
}

		$post_data = "account=".$this->username."&password=".$this->password."&mobile=".$mobile."&content=".rawurlencode($content);//密码可以使用明文密码或使用32位MD5加密
		$gets=  $this->xml_to_array($this->Post($post_data,$target));
		if($gets['SubmitResult']['code']==2){//返回码等于2的时候
			$result= "发送成功！";
			//短信记录
    $sms=M("sms");
   $sms->content=$content;
  $sms->mobile=$mobile;
   $sms->create_time=NOW_TIME;
   $sms->group=2;//通知
   $sms->create();
  $sms->add();
		}else{
			$result= '发送失败！,错误码'.$results['SubmitResult']['code'];
		}
		
		return $result;
	}


  }

?>