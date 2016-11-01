<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
  * @author 烟消云散 <1010422715@qq.com>
 */
class EnvelopeController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	
       $map  = '';
	   $title=trim(I('get.title'));
      if($title){ 
		 $map['content'] = array('like',"%{$title}%");
        $list   =   M("Envelope")->where($map)->field(true)->order('id desc')->select();}
     else 
		 { 
		 $list = $this->lists('Envelope', $map,'id desc');
	 }

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
        $this->meta_title = '站内信管理';
        $this->display();
    }

  /* 编辑分类 */
    public function edit($id = null, $pid = 0){
       
	    $Envelope = D('Envelope');    
        if(IS_POST){ //提交表单
            if(	false !== $Envelope->update()){
			
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $Envelope->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级分类信息 */
                $cate = $Envelope->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级站内信不存在或被禁用！');
                }
            }

            /* 获取分类信息 */
            $info = $id ? $Envelope->info($id) : '';        
            $this->assign('info',$info);

            $this->meta_title = '编辑站内信';
            $this->display();
        }
    }

    /* 新增分类 */
    public function add(){
        $Envelope = D('Envelope');
      
	 
        if(IS_POST){ //提交表单
	      
			if(false !== $Envelope->update()){
				$UserEnvelope=M('UserEnvelope');
				$UserEnvelope->create();
				$UserEnvelope->title=$_POST['title'];
				$UserEnvelope->content=$_POST['content'];
				$UserEnvelope->group=$_POST['group'];
				$UserEnvelope->uid=$_POST['uid'];
				$UserEnvelope->status=1;
				$UserEnvelope->create_time=NOW_TIME;
				$UserEnvelope->add();
				$this->success('新增成功！', U('index'));
            } else {
                $error = $Envelope->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级信息 */
                $cate = $Envelope->info($pid, 'id,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的站内信不存在或被禁用！');
                }
            }

  $info = $id ? $Envelope->info($id) : '';
            $this->assign('info',$info);
           
            $this->meta_title = '新增站内信';
            $this->display("edit");
        }
    }


 public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("Envelope");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("Envelope");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }

}