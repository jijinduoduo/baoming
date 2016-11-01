$(function(){
	//频道页，内容页商品分类子类的显示与隐藏
	$('.all-goods .item').hover(function(){
		$(this).addClass('active').find('s').hide();
		$(this).find('.product-wrap').show();
	},function(){
		$(this).removeClass('active').find('s').show();
		$(this).find('.product-wrap').hide();
	});
	});
	//tab菜单切换
$(document).ready(function () {
	  $(".note ul li").mouseenter(function(){$(this).addClass("selected").siblings().removeClass("selected")
   });
 $(".note ul li").mouseenter(function(){
var index=$(".note ul li").index(this);
 $("#msg>div").eq(index).css("display", "block")
                                 .siblings().css("display", "none"); })
        })
	

 window.onload = function ()
        { 
//分类菜单的显示隐藏                                                                

var oDiv3 = document.getElementById('all-class');
            var oDiv4 = document.getElementById('all-goods');
            var timer2 = null;//定义定时器变量
            //鼠标移入div1或div2都把定时器关闭了，不让他消失
            oDiv3.onmouseover = oDiv4.onmouseover = function ()
            {	$("i#iarrow").attr("class","glyphicon glyphicon-chevron-up");
                oDiv4.style.display = 'block';
                clearTimeout(timer2);
            }
            //鼠标移出div1或div2都重新开定时器，让他延时消失
            oDiv3.onmouseout = oDiv4.onmouseout = function ()
            {$("i#iarrow").attr("class","glyphicon glyphicon-chevron-down");
                //开定时器
                timer2 = setTimeout(function () { 
                    oDiv4.style.display = 'none'; },300);
            }
		}

$(document).ready(function () {
	  $("h3.tab a").mouseenter(function(){$(this).addClass("selected").siblings().removeClass("selected")
   });
 $("h3.tab a").mouseenter(function(){
var index=$("h3.tab a").index(this);
 $(".tab_view>div").eq(index).css("display", "block")
                                 .siblings().css("display", "none"); })
        })
	$(document).ready(function(){
  $("a.search_btn").click(function(){
var words=$("input.search_input").val();
  if(words){document.Searchform.submit();
  }
  else{
  alert("搜索内容不能为空")
  }


  });
});
var gid="ajax";
 $.ajax({
              type: "post",
              url:'',
            dataType: "json",
             success: function(data){
                         //清空resText里面的所有内容
                         var arr=data;
                      var a='{:get_username()}';
					   for(i=0;i<arr.length;i++){
html=a+'<a href="/mobile/article/'+arr[i].goodid+'">'+arr[i].num+'</a>';
               $('div.top_main').append(html);                   
	  
					   }
                          
                   
                      }
         });
