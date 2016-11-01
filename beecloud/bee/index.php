<?php session_start(); ?>
<!Doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>BeeCloud支付示例</title>
    <link rel="stylesheet" href="statics/index.css" type="text/css">
</head>
<body>
<div>
    <h2>订单号：<?php echo $_SESSION['orderid']; ?></h2>
    <h2>应付总额：<?php echo $_SESSION['money']; ?> 元</h2>
    <h2>支付项目：<?php echo$_SESSION['title']; ?></h2>
    <p>请选择支付方式</p>
</div>
<form action="" method="POST" target="_blank">
    <div>
        <ul class="clear" style="margin-top:20px">
            <li class="clicked" onclick="clickSwitch(this)">
                <input type="radio" value="ALI_WEB" name="paytype" checked="checked">
                <img src="http://beeclouddoc.qiniudn.com/ali.png" alt="">
            </li>
            <li onclick="clickSwitch(this)">
                <input type="radio" value="WX_NATIVE" name="paytype">
                <img src="http://beeclouddoc.qiniudn.com/wechats.png" alt="">
            </li>
            <li onclick="clickSwitch(this)">
                <input type="radio" value="WX_JSAPI" name="paytype">
                <img src="http://7xavqo.com1.z0.glb.clouddn.com/wechatgzh.png" alt="">
            </li>
        </ul>
    </div>
    <div>
        <input type="button" id="btn_pay" class="button" value="确认付款">
    </div>
</form>

</body>
<script type="text/javascript" src="statics/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
    function clickSwitch(that) {
        var li = that.parentNode.children;
        for (var i = 0; i < li.length; i++) {
            li[i].className = "";
            li[i].childNodes[1].removeAttribute("checked");
        }
        that.className = "clicked";
        that.childNodes[1].setAttribute("checked", "checked");
    }

    $("#btn_pay").click(function(){
        var type = $("input[name='paytype']:checked").val();
        if(!type){
            alert("请选择支付方式");return;
        }
        if(type == 'BC_WX_JSAPI'){
            window.open('./bc.wxjsapi.php');
        }else{
            window.open('./pay.bill.php?type=' + type);
        }
    });
	
</script>
</html>
