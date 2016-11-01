<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <title>微信扫码付款</title>
</head>
<body>
<?php
    try {
        $result = $api->bill($data);
        if ($result->result_code != 0) {
            //print_r($result);
            //exit();
			if ($result->result_code = 7){
				echo '<div align="center" id="qrcode" ></div>
						
						<div align="center"> 
							<p>订单已支付</p>
						</div></body>';die;
			}else{
				echo '支付失败';
			} 
        }
        $code_url = $result->code_url;
    } catch (Exception $e) {
        die($e->getMessage());
    }
?>
<div align="center" id="qrcode" ></div>
<div align="center"> 
    <p>订单号：<?php echo $data["bill_no"]; ?></p>
    <button id="query">查询订单状态</button>
    <p id="query-result"></p>
</div>
</body>
<script src="statics/jquery-1.11.1.min.js"></script>
<script src="statics/qrcode.js"></script>
<script>
    if(<?php echo $code_url != NULL; ?>) {
        var options = {text: "<?php echo $code_url;?>"};
        //参数1表示图像大小，取值范围1-10；参数2表示质量，取值范围'L','M','Q','H'
        var canvas = BCUtil.createQrCode(options);
        var wording=document.createElement('p');
         var ua = window.navigator.userAgent.toLowerCase();
	    if(ua.match(/MicroMessenger/i) == 'micromessenger'){
	         wording.innerHTML = "长按二维码扫码";
	    }else{
	         wording.innerHTML = "扫描二维码付款";
	    }
      
        var element=document.getElementById("qrcode");
        element.appendChild(wording);
        //element.appendChild(canvas);
        var image = new Image(); 
        image.src = canvas.toDataURL("image/png"); 
        element.appendChild(image);
    }
    //备注: 同渠道同一个订单号会有多条记录
    // 1. WX_NATIVE, 更新的是最后一次订单记录
    // 2. BC_NATIVE, 更新的是第一条订单记录
    $('#query').click(function(){
        $.getJSON('wx/wx.native.query.php', {'billNo' : '<?php echo $data["bill_no"]; ?>', 'channel' : '<?php echo $data["channel"]; ?>'}, function(res){
            var str = '';
            if (res && res.result_code == 0 ) {
                var spay_result = false;
                for(var i = 0; i < res.count; i++){
                    if(res.bills[i].spay_result){
                        spay_result = true;
                        break;
                    }
                }
                str = spay_result ? "<span style='color:green'>支付成功</span>" : "<span style='color:red'>未支付</span>";
            }else if (res && res.result_code != 0) {
                str = 'Error: ' + res.err_detail;
            }else {
                str = 'Notice: 该记录不存在';
            }
            $('#query-result').html("支付状态："+str);
        })
    });
	setInterval(function(){
    	
    	$("#query").trigger("click");
    	
    	if($("#query-result span").text()=="支付成功"){
    		location.href= "<?php echo $data["return_url"]; ?>";
    	}
    },500);
	
</script>
</body>
</html>