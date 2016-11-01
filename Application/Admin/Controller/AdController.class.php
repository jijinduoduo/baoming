<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
  * @author 烟消云散 <1010422715@qq.com>
 */
class AdController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	
     
  
		 $list = $this->lists('Ad', $map,'id desc');
	
        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
        $this->meta_title = '广告管理';
        $this->display();
    }

  /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        $ad = D('ad');
       
        if(IS_POST){ //提交表单
            if(false !== $ad->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $ad->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
           $list=flist(); /* 获取一级分类 */
        $this->assign('list',$list);
            $info = $id ? $ad->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('category',   $cate);
            $this->meta_title = '编辑广告';
            $this->display();
        }
    }

    /* 新增分类 */
    public function add(){
       
        if(IS_POST){ //提交表单
 $ad = D('ad');
            if(false !== $ad->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $ad->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
           
   $list=flist(); /* 获取一级分类 */
$this->assign('list',$list);
            /* 获取优惠券信息 */
            $this->assign('info',       null);
            $this->assign('category', $cate);
            $this->meta_title = '新增广告';
            $this->display('edit');
        }
    }


 public function setStatus($model='ad'){
        return parent::setStatus('ad');
    }
 

 public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("ad");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("ad");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }

}