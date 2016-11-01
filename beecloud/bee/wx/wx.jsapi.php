<?php
session_start();
/**
 * 微信用户的openid获取请参考官方demo sdk和文档
 * https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=11_1
 * 微信获取openid php代码, 运行环境是微信内置浏览器访问时
 *
 * 注意:
 *      请修改lib/WxPayPubHelper/WxPay.pub.config.php配置文件中的参数:
 *      1.APPID, APPSECRET请修改为商户自己的微信参数(MCHID, KEY在beecloud平台创建的应用中配置);
 *      2.JS_API_CALL_URL针对当前的demo,应该是http(s)://<your domain>/<your path>/pay.bill.php?type=WX_JSAPI,
 *        可根据具体情况进行配置调整;
 *      3.请检查方法createOauthUrlForCode是否对回调链接地址(redirect_uri)进行urlencode处理,如果没有请自行添加
 *      3.特别要强调的是JS_API_CALL_URL的访问域名必须与微信公众平台配置的授权回调页面域名一致.
 */
header("Content-type: text/html; charset=utf-8");
include_once('lib/WxPayPubHelper/WxPayPubHelper.php');
$jsApi = new JsApi_pub();
//网页授权获取用户openid============
//通过code获得openid

if (!isset($_GET['code']))  
{  
    //触发微信返回code码  
    $url = $jsApi->createOauthUrlForCode(WxPayConf_pub::JS_API_CALL_URL);
	//重定向的URL里面有个STATE,把GET到的数据参数放在一个数组后转换成json格式的字符串   	 	
    $state = json_encode(array(  
               "bill_no" => $data["bill_no"],  //订单号           
			   "title" => $data["title"],  //标题
			   "return_url" => $data["return_url"],  //返回地址
               "total_fee" => $data["total_fee"] //金额
			));  
	//替换这个STATE			
    $url = str_replace("STATE", $state, $url);
	//重定向后会带上state参数，开发者可以填写a-zA-Z0-9的参数值，最多128字节	
    Header("Location: $url");  
} else {  
    //获取code码，以获取openid  
    $code = $_GET['code'];  
    $jsApi->setCode($code);  
    $openid = $jsApi->getOpenId();  
    $state = $_GET['state'];  
    $state = str_replace("\\", "", $state);  //去掉\\要不解析不了
    $param = json_decode($state, true);  //解析
    $data["bill_no"] = $param['bill_no'];  //订单号
    $data["total_fee"] = $param['total_fee']; //金额
	$data["title"] = $param['title'];  	//标题
	$data["return_url"] = $param['return_url'].'&tag='. $data["bill_no"];  	//返回地址
}  

$data["openid"] = $openid;

?>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>支付</title>
</head>
<?php
    try {
        $result = $api->bill($data);
        if ($result->result_code != 0) {
            print_r($result);
            exit();
        }
        $jsApiParam = array(
            "appId" => $result->app_id,
            "timeStamp" => $result->timestamp,
            "nonceStr" => $result->nonce_str,
            "package" => $result->package,
            "signType" => $result->sign_type,
            "paySign" => $result->pay_sign
        );
    } catch (Exception $e) {
        die($e->getMessage());
    }
?>
<script type="text/javascript">
    //调用微信JS api 支付
    function jsApiCall() {
        WeixinJSBridge.invoke(
            'getBrandWCPayRequest',
            <?php echo json_encode($jsApiParam);?>,
            function(res){
                /* 参考:https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=7_7&index=6
                 * res.err_msg的返回值
                 * 1.支付成功, get_brand_wcpay_request：ok
                 * 2.支付过程中用户取消, get_brand_wcpay_request：cancel
                 * 3.支付失败, get_brand_wcpay_request：fail
                 */
               // alert(JSON.stringify(res)) //供调试使用
                if(res.err_msg == "get_brand_wcpay_request:ok" ) {
					
                     window.location.href ="<?php echo $data['return_url']?>";
                }else{
                    //用户自己的操作, eg: window.location.href = '用户自己的URL';
                    alert("付款失败")
                }
            }
        );
    }
    function callpay() {
        if (typeof WeixinJSBridge == "undefined"){
            if( document.addEventListener ){
                document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
            }else if (document.attachEvent){
                document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
            }
        }else{
            jsApiCall();
        }
    }
</script>
<body onload="callpay();"> </body>
</html>
