$(function(){
	
	$(".left-list li").click(function(){
	this.active();	
	$(this).siblings().attr("class","huifu");
	var data=$(".content-left").attr("data-val");
	if(data==1){
		$(".content-left").css("left", "-80%");
		$(".content-left").attr("data-val","0");
	}
	
	if($(this).index()==0){
		$(".jichu-page").show();
		$(".jichu-page").siblings().hide();
	}
	else if($(this).index()==1){
		
		$('.baoming').show();
		$('.baoming').siblings().hide();
	}
	else if($(this).index()==2){
		
		$('.success_page').show();
		$('.success_page').siblings().hide();
	}
	})
	$(".p22").click(function(){
		var s=$(this).attr("data");
		if(s!=1){
		$(".content-left").css({"left":0,"z-index":999});	
		$(this).attr("data","1");
		}
		else{
			$(".content-left").css({"left":"-80%","z-index":999});	
			$(this).attr("data","0");
		}
		
		
	})
	$(".content-left-1-1 li").click(function(){
		var s=$('.p22').attr("data");
		if(s!=1){
		$(".content-left").css({"left":0,"z-index":999});	
		$(this).attr("data","1");
		}
		else{
			$(".content-left").css({"left":"-80%","z-index":999});	
			$(this).attr("data","0");
		}
	})
	$(".yinchang-1").click(function(){
		var data=$(".content-left").attr("data-val");
		if(data=="0"){
		$(".content-left").css({"left":'0px',"z-index":'99'});
		$(".content-left").attr("data-val","1");
		}
		else{
			$(".content-left").css({"left":'-80%',"z-index":'99'});
			$(".content-left").attr("data-val","0");
		}
		
		
	})
$('#picker').colpick({

	layout:'hex',

	submit:0,

	colorScheme:'dark',

	onChange:function(hsb,hex,rgb,el,bySetColor) {

		$(el).css('border-color','#'+hex);
		$("#titles").css({"background":'#'+hex});
		$("#bodys").css("border-color","#"+hex);
		$("#yanzhengma .btn-info").css("background",'#'+hex).css("border-color",'#'+hex);
		$(".tjiao .btn-primary").css("background",'#'+hex).css("border-color",'#'+hex);
		$(".btn-info:focus").css("background","#"+hex+"!important");
	
		
		// Fill the text box just if the color was set using the picker, and not the colpickSetColor function.

		if(!bySetColor) $(el).val(hex);

	}

}).keyup(function(){

	$(this).colpickSetColor(this.value);


});

})
Element.prototype.active=function(){
	return this.className="active-1";
}
function appends(){
	prompt("请输入内容","")
}
