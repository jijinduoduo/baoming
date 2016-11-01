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
})
Element.prototype.active=function(){
	return this.className="active-1";
}
