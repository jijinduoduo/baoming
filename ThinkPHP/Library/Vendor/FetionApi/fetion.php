<?php
header("Content-Type: text/html; charset=utf-8");

error_reporting(0);

include "./libs/fetion.class.php"; 


$demo = $_GET[demo];

$help = '帮助：如果需要群发多号用英文逗号(,)分隔(159..,159..)，有更多建议请联系 QQ:85431993<br>E-mail:threesky@gmail.com';

$api = "本站接口:<br>http://api.heqee.com/fetion/?username=飞信手机号码&passowrd=飞信手机密码&to=接收人号码&message=短信内容<br>或者<br>http://api.heqee.com/fetion/?u=飞信手机号码&p=飞信手机密码&t=接收人号码&m=短信内容";

if($demo!=""){
  if(!in_array($demo,array("send","code","help","api"))){error("参数错误!");}
  switch($demo){
	case "code":
		exit(highlight_file("demo.php",TRUE));
	break;
	case "help":
		exit($help);
	break;
	case "api":
		exit($api);
	break;
  }
}
function getval($key){
	if(!isset($_POST[$key])||$_POST[$key]==NULL||$_POST[$key]==''){
		return ($_GET[$key] !=''&& isset($_GET[$key])) ? trim($_GET[$key]) : NULL;
	}else{
		return ($_POST[$key] !=''&& isset($_POST[$key])) ? trim($_POST[$key]) : NULL;
	}
}

function error($msg){
	exit("<b>HEQEE INFO:</b> ".$msg);
}
function gbkToUtf8 ($value) { 
	return iconv("gbk", "UTF-8", $value); 
}
$send=array();
$send['username'] = getval('username') != NULL ? getval('username') : getval('u');
$send['password'] = getval('password') != NULL ? getval('password') : getval('p');
$send['to']   = getval('to') != NULL ? getval('to') : getval('t');
$send['message']  = gbkToUtf8(getval('message') != NULL ? getval('message') : getval('m'));
$send['message_len']=strlen($send['message']);

switch($send){
	case $send['username']==NULL:
		error('请输入登陆手机的号码.');
	break;
	case $send['password']==NULL:
		error('请输入登陆手机的密码.');
	break;
	case $send['to']==NULL:
		error('请输入接收手机的号码.');
	break;
	case $send['message']==NULL:
		error('请输入短信内容.');
	break;
	case $send['message_len'] >360:
		error('消息内容不能超过180个字符.');
	break;
}

$fetion = new fetion($send['username'], $send['password']);

$fetion->send($send['to'],$send['message']); 



?>