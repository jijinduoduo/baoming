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
 * 后台短信管理控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class SmsController extends AdminController {

    /**
     * 短信管理列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){ 
    
       $list = $this->lists('sms', '','id desc');
         $this->assign('list', $list);
		 $this->meta_title = '短信管理';
        $this->display();
    }

    /**
     * 显示短信树，仅支持内部调
     * @param  array $tree 短信树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
 
    /* 编辑短信 */
    public function edit($id = null, $pid = 0){
        $sms = D('sms');

        if(IS_POST){ //提交表单
            if(false !== $sms->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $sms->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级短信信息 */
                $cate = $sms->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级短信不存在或被禁用！');
                }
            }

            /* 获取短信信息 */
            $info = $id ? $sms->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('sms',   $cate);
            $this->meta_title = '编辑短信';
            $this->display();
        }
    }

    /* 新增短信 */
    public function add($pid = 0){
        $sms = D('sms');

        if(IS_POST){ //提交表单
            if(false !== $sms->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $sms->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级短信信息 */
                $cate = $sms->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级短信不存在或被禁用！');
                }
            }

            /* 获取短信信息 */
            $this->assign('info',       null);
            $this->assign('sms', $cate);
            $this->meta_title = '新增短信';
            $this->display('edit');
        }
    }

    /**
     * 删除一个短信
     * @author huajie <banhuajie@163.com>
     */
    public function del(){
        $cate_id = I('id');
        if(empty($cate_id)){
            $this->error('参数错误!');
        }      
        //删除该短信信息
        $res = M('sms')->delete($cate_id);
        if($res !== false){
            //记录行为
            action_log('update_sms', 'sms', $cate_id, UID);
            $this->success('删除成功！');
        }else{
            $this->error('删除失败！');
        }
    }


 


}
