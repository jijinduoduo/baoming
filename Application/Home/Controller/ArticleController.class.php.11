<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Controller;
/**
* 文档模型控制器
* 文档模型列表和详情
*/
class ArticleController extends HomeController {
		/* 频道封面页 */
    public function index(){

		$pid=I('get.pid',0,'intval'); 	
        if(!is_numeric($pid)){
		         $this->error('分类ID错误！');
		   }
		$category = D('Category')->info($pid);
		/* 分类信息 */
		$category = $this->category();
		$cid = D('Category')->getChildrenId($pid);
		$map['category_id']=array("in",$cid);
        //品牌
		$condition['ypid'] = array('in',$cid); 
		$condition['status'] = 1;
        $bdata= M('brand')->where($condition)->order("id desc")->select();
        $this->assign('bdata',$bdata);		
	   //推荐商品
		$pos=M('Document')->where("position!=0")->select();
		$this->assign("poslist",$pos);
		$key=I('get.order');
		$key=safe_replace($key);//过滤
		$sort=I('get.sort');  
        $sort=safe_replace($sort);//过滤
		if($key){ 
		   if(!is_numeric($key)){
		         $this->error('排序ID错误！');
		   }
		   switch ($key) { 
		        case '1': 
				    $listsort="view"." ".$sort;
                break;
				case '2':
				   $listsort="id"." ".$sort;
                  break;				
			   case '3': 
				   $listsort="price"." ".$sort;
                  break;
                case '4':                    
				   $listsort="sale"." ".$sort;
					 break;              
		   }  	
	   } 
	   else {
		 $key="1";$see="asc";
		 $order="view";$sort="asc";
		 $listsort=$order." ".$sort;			
	   }
		
       if($sort=="asc"){
		  $see="desc";
	   }
       if($sort=="desc"){
		  $see="asc";
	   }
       $this->assign('see',$see);
       $this->assign('order',$key);
	   $this->assign('value',$sort);
	   if(isset($_GET['brandid'])){
			$brandid=I('get.brandid',0,'intval');
			$title=M('brand')->where("id='$brandid'")->order("id desc")->getField('title');
            $map['brand']  = array('like', '%'.$title.'%');
            $this->assign('brandid',$brandid);
        }
        if ( isset($_GET['start_price']) ) {
            $map['price'][] = array('egt',I('start_price',0,'intval'));
           $this->assign('start_price',$_GET['start_price']);
        }
        if ( isset($_GET['end_price']) ) {
            $map['price'][] = array('elt',I('end_price',0,'intval'));
            $this->assign('end_price',$_GET['end_price']);
        }
		$map['status']=1;   
		/* 数据分页*/
		$list=D("Document")->getLists($map,$category['list_row'],$listsort);
		$this->assign('list',$list);// 赋值数据集      
		$page=D("Document")->getPage($map,$category['list_row'],$listsort);
		$this->assign('page',$page);//
		
		//获取分类的name
		$name=$category['name'];
		$child=M('Category')->where("pid='$pid'")->select();
		$this->assign('num', $count);
		$this->assign('childlist', $child);
		
		/*栏目页统计代码实现，status=2*/
		if(1==C('IP_TONGJI')){
		   $record=IpLookup("",2,$name);
		}
		
		//频道页循环3级分类
		$this->meta_title = $category['title'];
		/*销量排行*/
		$sales=$this->ranks();
		$this->assign('sales', $sales);
		/*最近访问*/
		$recent=$this->view_recent();
		$this->assign('recent', $recent);
		/* 模板赋值并渲染模板 */
		$this->assign('ctg', $category);

		$this->display($category['template_index']);
	}

    /* 列表页 */
    public function lists($p = 1){
		$pid=I('get.pid',0,'intval'); 	
        $category = D('Category')->info($pid);
		/* 分类信息 */
		$category = $this->category();
		$cid = D('Category')->getChildrenId($pid);
		$map['category_id']=array("in",$cid);
       
		//品牌
		$condition['ypid'] = array('in',$cid); 
		$condition['status'] = 1;
        $bdata= M('brand')->where($condition)->order("id desc")->select();
        $this->assign('bdata',$bdata);

		$map['status']=1;      
	   //推荐商品
		$pos=M('Document')->where("position!=0")->select();
	    $this->assign("poslist",$pos);
		$key=I('get.order');
		/* 标识正确性检测 */
		
		
		$key=safe_replace($key);//过滤
		$sort=I('get.sort');  
        $sort=safe_replace($sort);//过滤
		if($key){ 
		   if(!is_numeric($key)){
		         $this->error('排序ID错误！');
		   }
		   switch ($key) { 
		        case '1': 
				    $listsort="view"." ".$sort;
                break;
				case '2':
				   $listsort="id"." ".$sort;
                  break;				
			   case '3': 
				   $listsort="price"." ".$sort;
                  break;
                case '4':                    
				   $listsort="sale"." ".$sort;
					 break;              
		   }  	
	   } 
	   else {
		 $key="1";$see="asc";
		 $order="view";$sort="asc";
		 $listsort=$order." ".$sort;			
	   }
		
       if($sort=="asc"){
		  $see="desc";
	   }
       if($sort=="desc"){
		  $see="asc";
	   }
       $this->assign('see',$see);
       $this->assign('order',$key);
	   $this->assign('value',$sort);
		if(isset($_GET['brandid'])){
			$brandid=I('get.brandid',0,'intval');
			$title=M('brand')->where("id='$brandid'")->order("id desc")->getField('title');
            $map['brand']  = array('like', '%'.$title.'%');
            $this->assign('brandid',$brandid);
        }
        if ( isset($_GET['start_price']) ) {
            $map['price'][] = array('egt',I('start_price',0,'intval'));
           $this->assign('start_price',$_GET['start_price']);
        }
        if ( isset($_GET['end_price']) ) {
            $map['price'][] = array('elt',I('end_price',0,'intval'));
            $this->assign('end_price',$_GET['end_price']);
        }

		/* 数据分页*/
		$list=D("Document")->getLists($map,$category['list_row'],$listsort);
		$this->assign('list',$list);// 赋值数据集      
		$page=D("Document")->getPage($map,$category['list_row'],$listsort);
		$this->assign('page',$page);//


		//获取分类的id
		$name=$category['name'];
		$child=M('Category')->where("pid='$pid'")->select();
		$this->assign('num', $count);
		$this->assign('childlist', $child);
		
		/*栏目页统计代码实现，tag=2*/
		if(1==C('IP_TONGJI')){
		$record=IpLookup("",2,$name);
		}
		
		//频道页循环3级分类
		$this->meta_title = $category['title'];

		/*销量排行*/
		$sales=$this->ranks();
		$this->assign('sales', $sales);
		/*最近访问*/
		$recent=$this->view_recent();
		$this->assign('recent', $recent);
		/* 模板赋值并渲染模板 */
		$this->assign('ctg', $category);
		$this->display($category['template_lists']);
    }

     /* 商品详情页 */
    public function detail($id = 0, $p = 1){			
		/* 浏览量排行前7个商品*/
		$view=M('Document')->where("display=1 and status=1")->order("view desc")->select();
		$this->assign('viewlist', $view);

		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
		   $this->error('文档ID错误！');
		}	
		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
		   $this->error($Document->getError());
		} 
		/* 分类信息 */
		$category = $this->category($info['category_id']);
		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
		   $tmpl = $info['template'];
		} 
		else if (!empty($category['template_detail'])){ 
			//分类已定制模板
		  $tmpl = $category['template_detail'];
		} else { 
			//使用默认模板
		    $tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}
		
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');
		/*内容页统计代码实现，tag=3*/
		if(1==C('IP_TONGJI')){
		   $record=IpLookup("",3,$id);
		}
		/*获取商品所有评论*/
		$comment = M('comment');	
		$count = $comment->where("status='1' and goodid='$id'")->count(); //计算记录数
        $this->assign('count', $count);
		$limitRows = 5; // 设置每页记录数
		$p = new \Think\AjaxPage($count, $limitRows,"comment"); //第三个参数是你需要调用换页的ajax函数名
		$limit_value = $p->firstRow . "," . $p->listRows;
		$data = $comment->where("status='1' and goodid='$id'")->order('id desc')->limit($limit_value)->select(); // 查询数据
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('list',$data);
		$this->assign('page',$page);

       /*获取商品所有好评*/
	    $comment = M('comment');	
		$countbetter = $comment->where("status='1' and goodid='$id' and score='3'")->count(); //计算记录数
        $this->assign('countbetter',$countbetter);
		$limitRowsbetter = 5; // 设置每页记录数
		$pbetter = new \Think\AjaxPage($countbetter, $limitRowsbetter,"commentgood"); //第三个参数是你需要调用换页的ajax函数名
		$limitbetter = $pbetter->firstRow . "," . $pbetter->listRows;
		$listbetter = $comment->where("status='1' and goodid='$id' and score='3'")->order('id desc')->limit($limitbetter)->select(); // 查询数据
		$pagebetter = $pbetter->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('listbetter',$listbetter);
		$this->assign('pagebetter',$pagebetter);

      /*获取商品所有中评*/
		$comment = M('comment');	
		$countmiddle= $comment->where("status='1' and goodid='$id' and score='2'")->count(); //计算记录数
        $this->assign('countmiddle ', $countmiddle);
		$limitRows = 5; // 设置每页记录数
		$pmiddle = new \Think\AjaxPage($countmiddle, $limitRows,"commentmiddle"); //第三个参数是你需要调用换页的ajax函数名
		$limitmiddle = $pmiddle->firstRow . "," . $pmiddle->listRows;
		$datamiddle = $comment->where("status='1' and goodid='$id' and score='2'")->order('id desc')->limit($limitmiddle)->select(); // 查询数据
		$pagemiddle = $pmiddle->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('listmiddle',$datamiddle);
		$this->assign('pagemiddle',$pagemiddle);
          
		 /*获取商品所有差评*/
		$comment = M('comment');	
		$countworse= $comment->where("status='1' and goodid='$id' and score='1'")->count(); //计算记录数
        $this->assign('countworse ', $countworse);
		$limitRows = 5; // 设置每页记录数
		$pworse = new \Think\AjaxPage($countworse, $limitRows,"commentworse"); 
		//第三个参数是你需要调用换页的ajax函数名
		$limitworse = $pworse->firstRow . "," . $pworse->listRows;
		$dataworse = $comment->where("status='1' and goodid='$id' and score='1'")->order('id desc')->limit($limitworse)->select(); // 查询数据
		$pageworse = $pworse->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('listworse',$dataworse);
		$this->assign('pageworse',$pageworse);
    	/* 好评率 */
		$rate=($countbetter/$count)*100;
        $this->assign('rate', $rate);
         /* 咨询管理 */
		$message=M("message");
		$reply=M("reply");
		$countmessage=$message->where(" goodid='$id'")->count();
		$Pagequestion=new \Think\AjaxPage($countmessage,5,"quest");	
		$limitquestion = $Pagequestion->firstRow . "," . $Pagequestion->listRows;
		$showquestion= $Pagequestion->show();
		$listquestion=$message->where("goodid='$id'")->order('id desc')->limit($limitquestion)->select();
		foreach($listquestion as $n=> $val){
		   $listquestion[$n]['id']=$reply->where('messageid=\''.$val['id'].'\'')->select();
		}
		$this->assign('listquestion',$listquestion);// 赋值数据集
		$this->assign('pagequestion',$showquestion);//
	
		$this->assign('info', $info);
		$this->meta_title = $info["title"];
		$this->display($tmpl);
	}
    /* ajax评论-所有评论 */
    public function comment(){	
	    if($_POST["goodid"]){  
			$goodid=I('post.goodid',0,'intval');	 	
		    $this->assign('goodid',$goodid);
		}	
		session('goodid',null);//ajax评论session
	    session('goodid',$goodid);
        $comment = M('comment');
		$count = $comment->where("status='1' and goodid='$goodid'")->count(); //计算记录数
		$limitRows = 5; // 设置每页记录数
		$p = new \Think\AjaxPage($count, $limitRows,"comment"); //第三个参数是你需要调用换页的ajax函数名
		$limit_value = $p->firstRow . "," . $p->listRows;
		$data = $comment->where("status='1' and id='$goodid'")->order('id desc')->limit($limit_value)->select(); // 查询数据
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('list',$data);
		$this->assign('page',$page);
		$this->display(); 
     }
      /* ajax评论-好评 */
     public function commentgood(){
	     if($_POST["goodid"]){  
		    $goodid=I('post.goodid',0,'intval');	 	
		    $this->assign('goodid',$goodid);
	     }	
	    session('goodid',null);//ajax评论session
	    session('goodid',$goodid);
        $comment = M('comment');
		$count = $comment->where("status='1' and goodid='$goodid' and score='3'")->count(); //计算记录数
		$limitRows = 5; // 设置每页记录数
		$p = new \Think\AjaxPage($count, $limitRows,"commentgood"); //第三个参数是你需要调用换页的ajax函数名
		$limit_value = $p->firstRow . "," . $p->listRows;
		$data = $comment->where("status='1' and goodid='$goodid' and score='3'")->order('id desc')->limit($limit_value)->select(); // 查询数据
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('list',$data);
		$this->assign('page',$page);
		$this->display(); 
     }
        /* ajax评论-中评 */
     public function commentmiddle(){
	     if($_POST["goodid"]) {  
		    $goodid=I('post.goodid',0,'intval');	
		    $this->assign('goodid',$goodid);
		 }	
		session('goodid',null);//ajax评论session
	    session('goodid',$goodid);
        $comment = M('comment');
		$count = $comment->where("status='1' and goodid='$goodid' and score='2'")->count(); //计算记录数
		$limitRows = 5; // 设置每页记录数
		$p = new \Think\AjaxPage($count, $limitRows,"commentmiddle"); //第三个参数是你需要调用换页的ajax函数名
		$limit_value = $p->firstRow . "," . $p->listRows;
		$data = $comment->where("status='1' and goodid='$goodid' and score='2'")->order('id desc')->limit($limit_value)->select(); // 查询数据
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('list',$data);
		$this->assign('page',$page);
		$this->display(); 
     }
      /* ajax评论-差评 */
     public function commentworse(){	
	     if($_POST["goodid"]){
			 $goodid=I('post.goodid',0,'intval');	
		     $this->assign('goodid',$goodid);
		}	
		session('goodid',null);//ajax评论session
	    session('goodid',$goodid);
        $comment = M('comment');
		$count = $comment->where("status='1' and goodid='$goodid' and score='1'")->count(); //计算记录数
		$limitRows = 5; // 设置每页记录数
		$p = new \Think\AjaxPage($count, $limitRows,"commentworse"); //第三个参数是你需要调用换页的ajax函数名
		$limit_value = $p->firstRow . "," . $p->listRows;
		$data = $comment->where("status='1' and goodid='$goodid' and score='1'")->order('id desc')->limit($limit_value)->select(); // 查询数据
		$page = $p->show(); // 产生分页信息，AJAX的连接在此处生成
		$this->assign('list',$data);
		$this->assign('page',$page);
		$this->display(); 
    }
    public function quest(){	
	    if($_POST["goodid"]){   
		   $goodid=I('post.goodid',0,'intval');
		   $this->assign('goodid',$goodid);
	    }	
	    session('goodid',null);//ajax评论session
	    session('goodid',$goodid);
        $message=M("message");
		$reply=M("reply");
		$count=$message->where(" goodid='42'")->count();
		$p=new \Think\AjaxPage($count,5,"quest");	
		$limit= $p->firstRow . "," . $p->listRows;
		$page= $p->show();
		$list=$message->where("goodid='42'")->order('id desc')->limit($limit)->select();
		foreach($list as $n=> $val){
		    $list[$n]['id']=$reply->where('messageid=\''.$val['id'].'\'')->select();
		}
		$this->assign('list',$list);
		$this->assign('page',$page);
		$this->display(); 
     }
      /* 文档分类检测 */
     private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.pid', 0);
		if(empty($id)){
		   $this->error('没有指定文档分类！');
		}
		/* 获取分类信息 */
		$category = D('Category')->info($id);
		if($category && 1 == $category['status']){
		   switch ($category['display']) {
		       case 0:
		           $this->error('该分类禁止显示！');
		       break;
		       //TODO: 更多分类显示状态判断
		       default:
		           return $category;
		    }
		} else {
		    $this->error('分类不存在或被禁用！');
		}
	}

		//销量排行
    public function ranks($name){
		////获取商品访问来源来自url的商品数组，tag=3
		$list=M('document')->limit(5)->order("sale desc")->select();	
		return $list;
	}
   //最近浏览
    public function view_recent($name){
		//访客ip
		$ip=getip();
		//根据ip获取会员最近浏览商品，status=3
		$list=M('records')->where(" status='3' and ip='$ip'")->limit(5)->order("id desc")->select();
		return $list;
	}
}
