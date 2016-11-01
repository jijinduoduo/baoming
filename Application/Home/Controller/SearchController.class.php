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
 * 搜索控制器
 * 文档模型列表和详情
 */
class SearchController extends HomeController {

    /* 文档模型频道页 */
	public function index(){
        $keyword= I('words');
        $keyword=safe_replace($keyword);//过滤
        $key=I('get.order');
        $key=safe_replace($key);//过滤
		$sort=I('get.sort');  
        $sort=safe_replace($sort);//过滤
        if($key){  
		
		     if(!is_numeric($key)){
		         $this->error('排序ID错误！');
		     }
		    switch ($key){
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
	   else{
		 $key="1";
	     $see="asc";
		 $order="view";
	     $sort="asc";
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

	  $map['title|name|description']  = array('like','%'.$keyword.'%');
      $count=M('Document')->where($map)->count();
      $Page= new \Think\Page($count,12);
	  $Page->setConfig('prev','上一页');
      $Page->setConfig('next','下一页');
      $Page->setConfig('first','第一页');
      $Page->setConfig('last','尾页');
      $Page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
      $show= $Page->show();    
      $list=M('Document')->where($map)->order($listsort)->limit($Page->firstRow.','.$Page->listRows)->select();
     $this->assign('list',$list);// 赋值数据集
     $this->assign('page',$show);
     /*销量排行*/
	 $sales=R('Article/ranks');
	 $this->assign('sales', $sales);
	 /*最近访问*/
	 $recent=R('Article/view_recent');
	 $this->assign('recent', $recent);
     $this->assign('searchlist', $list);
	 $this->assign('keyword', $keyword);	
	 $this->meta_title = $keyword.'的搜索结果';
	 $this->display();
	}
}
