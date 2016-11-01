$.ajax({
	type:"get",
	url:"Application/Admin/View/Baoming/header.html",
	dataType:"html",
	success:function(data){
		$("#head").html(data);
	}
	
});