add($("#myTabContent .aa li"),"click");
bs();
csstyle();
function add(element,even){
	$(element).unbind().bind(even,function(){
		var val=prompt("请输入名称");
		var data_val=$(this).attr('data-val');
		//console.log(data_val)
		var time=Date.parse(new Date()); 
		console.log(time);
		var name="a"+''+time;
		if(val){
				switch(data_val)
			{
				case "text":
				$("#houm").before('<div data-val="text" class="wy"><input type="text" class="form-control weiyi" placeholder="'+val+'" data-val="text" name="'+name+'"  required="required"  /></div>');
				break;
				case "radio":
				$("#houm").before('<div data-val="radio" class="wy"><select name="'+name+'" class="selectpicker weiyi form-control"  data-live-search="false" title="'+val+'" placeholder="'+val+'"></select></div>');
				break;
				case "check":
				$("#houm").before('<div data-val="check" class="wy"><select name="'+name+'"  class=" form-control" multiple  size="1" value="'+val+'" ></select></div>');
				break;
				case "number":
				$("#houm").before('<div data-val="number" class="wy"><input type="number" class="form-control weiyi" placeholder="'+val+'" data-val="number" name="'+name+'"  required="required" /></div>')
				break;
				case "date":
				$("#houm").before('<div data-val="date" class="wy"><span id="riqi">'+val+'</span><br><input type="date" class="form-control weiyi" placeholder="'+val+'" data-val="date" name="'+name+'"  required="required" /></div>')
				break;
				case "tel":
				$("#houm").before('<div data-val="tel" class="wy"><input type="tel" class="form-control weiyi" placeholder="'+val+'" data-val="tel" name="'+name+'"  required="required" /></div>')
				break;
				case "mail":
				$("#houm").before('<div data-val="mail" class="wy"><input type="email" class="form-control weiyi" placeholder="'+val+'" data-val="mail" name="'+name+'"  required="required" "/></div>')
				break;
				case "shuoming":
				$("#houm").before('<div data-val="shuoming" class="wy"><textarea class="form-control weiyi" placeholder="'+val+'" data-val="shuoming"  required="required" name="'+name+'" /></textarea></div>')
				break;
				case "shoufei":
				$("#houm").before('<div data-val="shoufei"><button class="input input-sm" placeholder="'+val+'" data-val="shoufei" name="'+name+'" ><span class="glyphicon glyphicon-ok"><span>"'+val+'"</button></div>')
				break;
				case "guanli":
				$("#houm").before('<p data-val="guanli"><input type="text" class="form-control" placeholder="'+val+'" data-val="guanli" name="'+name+'"/></p>')
				break;
				default :
				
				break;
			}
		}
		box();
	})
}
var dxkg=false;
var photo=true;
function bs(){
	var zhuangtai=$(".gongnengkaiguan li:eq(0)").attr("data");
	var zhuangtai2=$(".gongnengkaiguan li:eq(1)").attr("data");
	if(zhuangtai=="on"){
		$(".gongnengkaiguan li:eq(0)").css("background","#999");
		$(".gongnengkaiguan li:eq(0)").text("短信校验-关");
		 dxkg=false;
//		$(".gongnengkaiguan li:eq(0)").attr("data","on");
	}
	else
	{
		$(".gongnengkaiguan li:eq(0)").css("background","#3bb4f2");
		$(".gongnengkaiguan li:eq(0)").text("短信校验-开");
		 dxkg=true;
//		$(".gongnengkaiguan li:eq(0)").attr("data","off");
	}
	$(".gongnengkaiguan li").unbind().bind("click",function(){
		if($(this).index()==0){
			if(dxkg){
				$(this).css("background","#3bb4f2");
				dxkg=false;
				$(this).text("短信校验-开");
				$(this).attr("data","on");
				$("#yanzhengma").css("display","block");
				$("#yanzhengma input.a70").prop("required","required");
			}
			else{
				$(this).css("background","#999");
				dxkg=true;
				$(this).text("短信校验-关");
				$(this).attr("data","off");
				$("#yanzhengma input.a70").removeAttr("required");
				$("#yanzhengma").css("display","none");
				
			}
		}
		else{
			if(photo){
			$(this).css("background","#3bb4f2");
			photo=false;
			$(this).text("上传照片-开");
			$(this).attr("data","on");
				$("#zhaopianyanzheng").css("display","block");
				
			}
			else{
				$(this).text("上传照片-关");
				$(this).attr("data","off");
				$(this).css("background","#999");
				photo=true;
				$("#zhaopianyanzheng").css("display","none");
				
			}
		}
	})
}
function csstyle(){
	$(".fenge-ul .ul-3-1").click(function(){
		$(".panel #titles")[0].style.cssText="background: #3bb4f2 !important;";
		$("#bodys")[0].style.cssText="border-color: #3BB4F2 !important;";
		$("#picker").css("border-color","#3BB4F2");
		$("#picker").val("3bb4f2");
		$("#yanzhengma .btn-info").css("background",'#3bb4f2').css("border-color",'#3bb4f2');
		$(".tjiao .btn-primary").css("background",'#3bb4f2').css("border-color",'#3bb4f2');
		
	})
}

