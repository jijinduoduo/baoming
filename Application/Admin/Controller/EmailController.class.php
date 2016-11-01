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
 * 后台分类管理控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class EmailController extends AdminController {

    /**
     * 分类管理列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){ 
       
         $list = $this->lists('email',"",'id desc');
         $this->assign('list', $list);
		 $this->meta_title = '邮件管理';
        $this->display();
    }

    /**
     * 显示分类树，仅支持内部调
     * @param  array $tree 分类树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
 
    /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        $email = D('email');

        if(IS_POST){ //提交表单
            if(false !== $email->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $email->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级分类信息 */
                $cate = $email->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }

            /* 获取分类信息 */
            $info = $id ? $email->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('email',   $cate);
            $this->meta_title = '编辑分类';
            $this->display();
        }
    }

    /* 新增分类 */
    public function add($pid = 0){
        $email = D('email');

        if(IS_POST){ //提交表单
            if(false !== $email->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $email->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级分类信息 */
                $cate = $email->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }

            /* 获取分类信息 */
            $this->assign('info',       null);
            $this->assign('email', $cate);
            $this->meta_title = '新增分类';
            $this->display('edit');
        }
    }

    /**
     * 删除一个分类
     * @author huajie <banhuajie@163.com>
     */
    public function del(){
        $cate_id = I('id');
        if(empty($cate_id)){
            $this->error('参数错误!');
        }      
        //删除该分类信息
        $res = M('email')->delete($cate_id);
        if($res !== false){
            //记录行为
            action_log('update_email', 'email', $cate_id, UID);
            $this->success('删除成功！');
        }else{
            $this->error('删除失败！');
        }
    }


 


}
