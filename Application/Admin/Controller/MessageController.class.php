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
 * 后台留言管理控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class MessageController extends AdminController {

    /**
     * 留言管理列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){ 
     
       $list = $this->lists('Message',"" ,'id desc');
         $this->assign('list', $list);
		 $this->meta_title = '留言管理';
        $this->display();
    }

    /**
     * 显示留言树，仅支持内部调
     * @param  array $tree 留言树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
 
    /* 编辑留言 */
    public function edit($id = null, $pid = 0){
        $Message = D('Message');

        if(IS_POST){ //提交表单
            if(false !== $Message->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $Message->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级留言信息 */
                $cate = $Message->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级留言不存在或被禁用！');
                }
            }

            /* 获取留言信息 */
            $info = $id ? $Message->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('Message',   $cate);
            $this->meta_title = '编辑留言';
            $this->display();
        }
    }

    /**
     * 显示留言树，仅支持内部调
     * @param  array $tree 留言树
     * @author  <zuojiazi@vip.qq.com>
     */
 
    /* 回复留言 */
    public function reply($id = null, $pid = 0){
       
        if(IS_POST){ //提交表单
			 $reply = D('reply');
             if(false !==  $reply ->update()){
                $this->success('回复成功！', U('index'));
            } else {
                $error =  $reply ->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级留言信息 */
                $cate =  $reply ->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级留言不存在或被禁用！');
                }
            }

            /* 获取留言信息 */
			 $Message = D('Message');
            $info = $id ? $Message->info($id) : '';
            $this->assign('info',$info);
           
            $this->meta_title = '回复留言';
            $this->display();
        }
    }



    /* 新增留言 */
    public function add($pid = 0){
        $Message = D('Message');

        if(IS_POST){ //提交表单
            if(false !== $Message->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $Message->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级留言信息 */
                $cate = $Message->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级留言不存在或被禁用！');
                }
            }
         $info = $id ? $brand->info($id) : '';
            /* 获取留言信息 */
            $this->assign('info',       null);
            $this->assign('Message', $cate);
            $this->meta_title = '新增留言';
            $this->display('edit');
        }
    }

    /**
     * 删除一个留言
     * @author huajie <banhuajie@163.com>
     */
public function del(){
     if(IS_GET){
		  $id=I('get.id');  
          $document   =   M('Message');
        
        if( $document->where("id='$id'")->delete()){
            $this->success('删除成功');
        }
		else{
            
		 $this->error('删除失败');
        }
		}
		
  if(IS_POST){
             $ids = I('post.id');
            $document = M("Message");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $document->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }

	}
   


 


}
