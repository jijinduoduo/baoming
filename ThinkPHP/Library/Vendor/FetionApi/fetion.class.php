<?php
 /*
Fetion Api
License	:部分代码来自bit.kevin@gmail.com 本人增加了群发  所需PHP扩展：curl, simplexml。字符编码均为UTF-8
Author:threesky@gmail.com, http://www.heqee.com/
*/
 namespace Vendor\FetionApi;
class fetion {
    
    //communicate url
    private static $sd_url = "http://221.176.31.42/ht/sd.aspx";
    //sign in url
    private static $sign_in_url = "https://uid.fetion.com.cn/ssiportal/SSIAppSignIn.aspx";
    //SSIC
    private $ssic;
    //guid
    private $guid;
    
    //user
    private $user;

    //mobile no.
    private $mobileno;
    //pwd
    private $pwd;
    
    //error
    public $error;
    
    //version
    public static $version = "0.1";
    
    public function __construct($mobileno, $pwd)
    {
    	$this->guid = self::guid();
    	$this->mobileno = $mobileno;
    	$this->pwd = $pwd;
		$this->init();
    }
    
    /**
     * init. sign in and reg on server
     *
     * @return bool
     */
    public function init()
    {
    	return $this->sign_in() && $this->reg_server();
    }
    
    /**
     * 生成GUID
     *
     * @return string
     */
    private static function guid()
    {
        if (function_exists('com_create_guid')){
            return com_create_guid();
        }else{
            mt_srand((double)microtime()*10000);//optional for php 4.2.0 and up.
            $charid = strtoupper(md5(uniqid(rand(), true)));
            $hyphen = chr(45);// "-"
            $uuid = chr(123)// "{"
                    .substr($charid, 0, 8).$hyphen
                    .substr($charid, 8, 4).$hyphen
                    .substr($charid,12, 4).$hyphen
                    .substr($charid,16, 4).$hyphen
                    .substr($charid,20,12)
                    .chr(125);// "}"
            return $uuid;
        }
    }    
    
    /**
     * 获取通信次数
     *
     * @return int
     */
    private function call_id()
    {
        static $call_id=0;
        return ++$call_id;
    }
        
    /**
     * 请求URL
     *
     * @param string $t
     * @return string
     */
    private function request_url($t='s') {
    	static $seq = 0;
    	++$seq;
    	return self::$sd_url."?t=$t&i=$seq";
    }

    //hex to binary
    private function hex2bin($hex) {
    	$bin = '';
    	$len = strlen($hex);
    	for ($I = 0; $I < $len; $I += 2) {
    		$bin .= chr(hexdec(substr($hex, $I, 2)));
    	}
    	return $bin;
    }
    
    //get hash password
    private function hash_password() {
    	// in fact, salt is constant value
    	$salt = chr(0x77).chr(0x7A).chr(0x6D).chr(0x03);
    	$src = $salt.hash('sha1', $this->pwd, true);
    	return strtoupper(bin2hex($salt.sha1($src, true)));
    }
    
    //create a random cnonce
    private function calc_cnonce() {
    	return sprintf("%04X%04X%04X%04X%04X%04X%04X%04X",
    		rand() & 0xFFFF, rand() & 0xFFFF, rand() & 0xFFFF,
    		rand() & 0xFFFF, rand() & 0xFFFF, rand() & 0xFFFF,
    		rand() & 0xFFFF, rand() & 0xFFFF);
    }
    
    //get salt from real password
    private function calc_salt() {
    	return substr($this->hash_password(), 0, 8);
    }
    
    //calculate response
    private function calc_response($nonce, $cnonce) {
    	$str = $this->hex2bin(substr($this->hash_password(), 8));
    	$key = sha1($this->user['sid'].':'.$this->user['domain'].':'.$str, true);
    	$h1 = strtoupper(md5("$key:$nonce:$cnonce"));
    	$h2 = strtoupper(md5("REGISTER:".$this->user['sid']));
    	$res = strtoupper(md5("$h1:$nonce:$h2"));
    	return $res;
    }

    //create sip package
    private function sip_request_create($request_line, $fields, $arg = '') {
    	$sip = $request_line."\r\n";
    	foreach ($fields as $k=>$v) {
    		$sip .= "$k: $v\r\n";
    	}
    	$sip .= "L: ".strval(strlen($arg))."\r\n\r\n{$arg}";
    	return $sip;
    }
    
    
    /**
     * 发起一个GET、POST的HTTP请求
     *
     * @param string $url
     * @param mixed $post_data
     * @param bool $do_exec
     * @return mixed
     */
    private function http_request($url, $post_data=null, $do_exec=true)
    {   
        $headers = array('Content-Type: application/oct-stream', 'Pragma: xz4BBcV'.$this->guid);
        
    	$ch = curl_init();
    	curl_setopt($ch, CURLOPT_URL, $url);
    	curl_setopt($ch, CURLOPT_USERAGENT, 'IIC2.0/PC 3.2.0540');
    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    	curl_setopt($ch, CURLOPT_HEADER, true);
    	
        if( stripos($url, "https://") !== FALSE ) {
            curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
        }
    
    	//ssic
    	if( $this->ssic!="" ) {
    	    curl_setopt($ch, CURLOPT_COOKIE, "ssic={$this->ssic}");
    	}
    	
        //post data
    	if( $post_data != null ) {
    		curl_setopt($ch, CURLOPT_POST, true);
    		if( is_array($post_data) )
    		{
        		$encoded = "";
                foreach ( $post_data as $k=>$v)
                {
                    $encoded .= ($encoded ? "&" : "");
                    $encoded .= rawurlencode($k)."=".rawurlencode($v);
                }
                curl_setopt($ch, CURLOPT_POSTFIELDS, $encoded);
    		}else{
    		    curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
    		}
    		
    	}
    	
    	//no exec
    	if( $do_exec == false ) {
    	    return $ch;
    	}
    	
    	$res = curl_exec($ch);
    	if( !$res ) {
    		$this->error(curl_error($ch));
    		exit;//exit!
    	}
    	curl_close($ch);
    
    	$res = explode("\r\n\r\n", $res);
    	
    	//SIP协议的HTTP承载方式中，其头部和消息主题也是采用\r\n\r\n分割
    	return $res;//$res[0]=>header $res[1]=>body $res[...]=>... 
    }
    
    /**
     * 获取好友列表
     *
     * @return mixed
     */
    public function get_friends_list()
    {   
    	$arg = '<args><contacts><buddy-lists /><buddies attributes="all" /><mobile-buddies attributes="all" /><chat-friends /><blacklist /></contacts></args>';
    	$msg = $this->sip_request_create('S fetion.com.cn SIP-C/2.0', array('F'=>$this->user['sid'], 'I'=>$this->call_id(), 'Q'=>'1 S', 'N'=>'GetContactList'), $arg)."SIPP";
    	
    	$this->http_request($this->request_url(), $msg);    	
    	$res = $this->http_request($this->request_url(), "SIPP");
    	
    	$list_xml = substr($res[2], 0, strlen($res[2])-4);

    	$buddy_list = simplexml_load_string($list_xml);
    	
    	$buddies = array();
    	foreach ($buddy_list->contacts->buddies->buddy as $buddy) {
    		$buddies[strval($buddy['uri'])] = strval($buddy['local-name']);
    	}
    	foreach ($buddy_list->contacts->{'mobile-buddies'}->{'mobile-buddy'} as $buddy) {
    		$buddies[strval($buddy['uri'])] = strval($buddy['local-name']);
    	}
    	
    	return $buddies;
    }
    /**
     * 单点登录
     * @return mixed
     */
    private function sign_in()
    {
        $ssiportal_url = self::$sign_in_url."?mobileno=".rawurlencode($this->mobileno)."&pwd=".rawurlencode($this->pwd);
        $value = array();
        
        $res = $this->http_request($ssiportal_url);
        
        $matches = array();
        if( preg_match("/Set-Cookie: ssic=(.*);/", $res[0], $matches)==0 ) {
            $this->error("登录失败。可能原因：用户名和密码错误！");
            return false;
        }
        $this->ssic = $matches[1];
        
        $xml = simplexml_load_string($res[1]);
        $value['uri'] = (string)$xml->user['uri'];
        $value['status-code'] = (string)$xml['status-code'];
        $value['mobile-no'] = (string)$xml->user['mobile-no'];
        $value['user-status'] = (string)$xml->user['user-status'];
    
    	if( preg_match("/sip:(\d+)@(.+);/", $value['uri'], $matches)==0 ) {
    		$this->error("无法解析出sip相关信息。");
    		return false;
    	}
    	$value['sid'] = $matches[1];
        $value['domain'] = $matches[2];
        
        //set ues info
        $this->user = $value;
        
        return $value;
    }
    
    /**
     * 注册到服务器
     *
     * @return bool
     */
    private function reg_server()
    {   
    	$arg = '<args><device type="PC" version="44" client-version="3.2.0540" />';
    	$arg .= '<caps value="simple-im;im-session;temp-group;personal-group" />';
    	$arg .= '<events value="contact;permission;system-message;personal-group" />';
    	$arg .= '<user-info attributes="all" /><presence><basic value="400" desc="" /></presence></args>';
    
    	//$res = $this->http_request($this->request_url(), "SIPP");
    	
    	$msg = $this->sip_request_create('R fetion.com.cn SIP-C/2.0', array('F'=>$this->user['sid'], 'I'=>$this->call_id(), 'Q'=>'1 R'), $arg)."SIPP";

    	$this->http_request($this->request_url('i'), $msg);		
    	$res = $this->http_request($this->request_url(), "SIPP");
    	    	
    	$matches = array();
    	if( preg_match('/nonce="(\w+)"/s', $res[1], $matches)==0 ) {
    		$this->error('Fetion Error: no nonce found');
    	}
    	
    	//nonce
    	$nonce = $matches[1];

    	$cnone = $this->calc_cnonce();
    	$response = $this->calc_response($nonce, $cnone);
    
    	$msg = $this->sip_request_create('R fetion.com.cn SIP-C/2.0', array('F'=>$this->user['sid'], 'I'=>$this->call_id(), 'Q'=>'2 R', 'A'=>"Digest algorithm=\"SHA1-sess\",response=\"{$response}\",cnonce=\"{$cnone}\",salt=\"".$this->calc_salt().'"'), $arg)."SIPP";
    
    	$this->http_request($this->request_url(), $msg);
    	$res = $this->http_request($this->request_url(), "SIPP");
    	
    	if( substr($res[1], 0, 16) != "SIP-C/2.0 200 OK" ) {
    	    $this->error("注册到服务器失败.");
    	    return false;
    	}
    	
    	return true;
    }


    /**
     * 发送短信
     *
     * @param string $to
     * @param string $content
     * @return bool
     */
    public function sent_sms($to, $content)
    {   
    	$msg = $this->sip_request_create('M fetion.com.cn SIP-C/2.0', array('F'=>$this->user['sid'], 'I'=>$this->call_id(), 'Q'=>'1 M', 'T'=>$to, 'N'=>'SendSMS'), $content)."SIPP";
    
    	$this->http_request($this->request_url(), $msg);	
    	$res = $this->http_request($this->request_url(), "SIPP");
    	
        if( substr($res[1], 0, 25) != "SIP-C/2.0 280 Send SMS OK" ) {
    	    $this->error("发送短息失败！");
    	    return false;
    	}
    	
    	return true;
    }
	public function send($to,$smstxt){
		$to = $this->make_semiangle($to);
		if(strstr($to,','))
		{
			$to=explode(',',$to);
		}else{
			$to=array($to);
		}
		foreach ($to as $v)
		{
			$this ->sent_sms('tel:'.$v,$smstxt);
		}
		return true;
	
	}
	private function make_semiangle($str)
	{
		$arr = array('（' => '(', '）' => ')','％' => '%', '＋' => '+', '—' => '-', '－' => '-', '–' => '-',
					 '：' => ':', '。' => '.', '、' => ',', '，' => ',', '--' => '-','’' => "'", '‘' => "'","ˊ" => "'");
		return strtr($str, $arr);
	}
    /**
     * error handle
     *
     * @param string $emsg
     */
    private function error($emsg)
    {
    	$this->error = $emsg;
    	echo "<b>HEQEE INFO</b>: ".$emsg;
		//exit;
    }
}




?>