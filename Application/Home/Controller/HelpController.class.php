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
 * 帮助中心模型控制器
 * 文档模型列表和详情
 */
class HelpController extends HomeController {
    /* 频道封面页 */

	public function lists(){
        /*栏目页统计代码实现，tag=2*/
		if(1==C('IP_TONGJI')){
		    $record=IpLookup("",2,$name); 
		}
		/* 分类信息id */
		$pid= I('get.pid',0,'intval');
		if(!is_numeric($pid)){
		    $this->error('分类ID错误！');
		}
		$pid=safe_replace($pid);//过滤	
		;//获取最大的文章id
		$list=M("document")->where("category_id='$pid'")->select();
		$this->assign('list',$list);
		$category=M("category")->where("id='$pid'")->find();
		$this->meta_title = $category['title'];	
		$condition['pid'] = 0; 
		$condition['ismenu'] = array('gt',2);  
		$doc=M("category")->where($condition)->order("id asc")->select();
		$this->assign('article',$doc);
	    $this->display();
	}

	public function detail(){
        /*栏目页统计代码实现，tag=2*/
        if (1==C('IP_TONGJI')){
	         $record=IpLookup("",2,$name); 
	    }
	
		$id= I('get.id',0,'intval');
	    /*获取文章明细*/
	    if(!empty($id)){
		    $info = D('Document')->detail($id);
		}
		$pid=$info['category_id'];
		//分类一维数组
		$category=M("category")->where("id='$pid'")->find();
		/*设置网站标题，一维数组*/
	    $this->meta_title = $category['title'];
		$this->assign('info',$info);
        $this->display();
	}

    public function add(){
	    $data=M("member")->limit(1)->find();
	    $this->assign('info',$data);
        $this->display();
    }

    public function addmessage(){
        if(IS_POST){
			$message=M("message");
			$message->create();
			$content =I('post.content','','strip_tags');//过滤
			$data["content"]=safe_replace($content); // 用strip_tags过滤$_POST["content"];
			$data["goodid"]=I('post.goodid',0,'intval'); // 用intval过滤$_POST["goodid"];
			$data["uid"]=D('member')->uid();
			$data["create_time"]=NOW_TIME;
			$data["time"]=date("Y-m-d H:i:s",time());
	        $data["status"]=1;
            if($message->add($data)){	
	           $this->ajaxreturn($data);	
	        }
	    }
    }
}
