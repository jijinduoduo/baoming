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
 * 后台频道控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class CheckController extends AdminController {

    /**
     * 频道列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        $pid = I('get.pid', 0);
        /* 获取频道列表 */
        $map  = array('status' => array('gt', -1), 'pid'=>$pid);
       // $list = M('Shop')->where($map)->order('id desc')->select();
 $list   =   $this->getDocumentList($cate_id,2,$position,$fields);// $model_id用2替代
        $this->assign('list', $list);
        $this->assign('pid', $pid);
        $this->meta_title = '商家管理';
        $this->display();
    }
/**
     * 设置一条或者多条数据的状态
     * @author huajie <banhuajie@163.com>
     */
    public function setStatus($model='shop'){
        return parent::setStatus('shop');
    }
    /**
     * 添加频道
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function add(){
        if(IS_POST){
            $shop = D('shop');
            $data = $shop->create();
            if($data){
                $id = $shop->add();
                if($id){
                    $this->success('新增成功', U('index'));
                    //记录行为
                    action_log('update_shop', 'shop', $id, UID);
                } else {
                    $this->error('新增失败');
                }
            } else {
                $this->error($shop->getError());
            }
        } else {
            $pid = I('get.pid', 0);
            //获取父导航
            if(!empty($pid)){
                $parent = M('shop')->where(array('id'=>$pid))->field('title')->find();
                $this->assign('parent', $parent);
            }

            $this->assign('pid', $pid);
            $this->assign('info',null);
            $this->meta_title = '新增导航';
            $this->display('edit');
        }
    }

    /**
     * 编辑频道
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function edit($id = 0){
  $Shop = D('Shop');
 if(IS_POST){ //提交表单

            if(false !== $Shop->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $Shop->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        }
 else {
            $info = array();
            /* 获取数据 */
            $info = M('shop')->find($id);

            if(false === $info){
                $this->error('获取配置信息错误');
            }

            $pid = I('get.pid', 0);
            //获取父导航
            if(!empty($pid)){
            	$parent = M('shop')->where(array('id'=>$pid))->field('title')->find();
            	$this->assign('parent', $parent);
            }

            $this->assign('pid', $pid);
            $this->assign('info', $info);
            $this->meta_title = '编辑导航';
            $this->display();
        }
    }

    /**
     * 删除频道
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function del(){
        $id = array_unique((array)I('id',0));

        if ( empty($id) ) {
            $this->error('请选择要操作的数据!');
        }

        $map = array('id' => array('in', $id) );
        if(M('shop')->where($map)->delete()){
            //记录行为
            action_log('update_shop', 'shop', $id, UID);
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
    }

    /**
     * 导航排序
     * @author huajie <banhuajie@163.com>
     */
    public function sort(){
        if(IS_GET){
            $ids = I('get.ids');
            $pid = I('get.pid');

            //获取排序的数据
            $map = array('status'=>array('gt',-1));
            if(!empty($ids)){
                $map['id'] = array('in',$ids);
            }else{
                if($pid !== ''){
                    $map['pid'] = $pid;
                }
            }
            $list = M('shop')->where($map)->field('id,title')->order('sort asc,id asc')->select();

            $this->assign('list', $list);
            $this->meta_title = '导航排序';
            $this->display();
        }elseif (IS_POST){
            $ids = I('post.ids');
            $ids = explode(',', $ids);
            foreach ($ids as $key=>$value){
                $res = M('shop')->where(array('id'=>$value))->setField('sort', $key+1);
            }
            if($res !== false){
                $this->success('排序成功！');
            }else{
                $this->error('排序失败！');
            }
        }else{
            $this->error('非法请求！');
        }
    }
    /**
     * 默认文档列表方法
     * @param integer $cate_id 分类id
     * @param integer $model_id 模型id
     * @param integer $position 推荐标志
     * @param mixed $field 字段列表
     * @param integer $group_id 分组id
     */
    protected function getDocumentList($cate_id=0,$model_id=null,$position=null,$field=true,$group_id=null){
        /* 查询条件初始化 */
        $map = array();
        if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)I('title').'%');
        }
        if(isset($_GET['status'])){
            $map['status'] = I('status');
            $status = $map['status'];
        }else{
            $status = null;
            $map['status'] = array('in', '0,1,2');
        }
        if ( isset($_GET['time-start']) ) {
            $map['update_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $map['update_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }
        if ( isset($_GET['nickname']) ) {
            $map['uid'] = M('Member')->where(array('nickname'=>I('nickname')))->getField('uid');
        }

        // 构建列表数据
        $Document = M('Shop');

        if($cate_id){
            $map['category_id'] =   $cate_id;
        }
        $map['pid']         =   I('pid',0);
        if($map['pid']){ // 子文档列表忽略分类
            unset($map['category_id']);
        }
        $Document->alias('DOCUMENT');
        if(!is_null($model_id)){
            $map['model_id']    =   $model_id;
            if(is_array($field) && array_diff($Document->getDbFields(),$field)){
                $modelName  =   M('Model')->getFieldById($model_id,'name');
                $Document->join('__DOCUMENT_'.strtoupper($modelName).'__ '.$modelName.' ON DOCUMENT.id='.$modelName.'.id');
                $key = array_search('id',$field);
                if(false  !== $key){
                    unset($field[$key]);
                    $field[] = 'DOCUMENT.id';
                }
            }            
        }
        if(!is_null($position)){
            $map[] = "position & {$position} = {$position}";
        }
		if(!is_null($group_id)){
			$map['group_id']	=	$group_id;
		}
        $list = $this->lists($Document,$map,'level DESC,DOCUMENT.id DESC',$field);

        if($map['pid']){
            // 获取上级文档
            $article    =   $Document->field('id,title,type')->find($map['pid']);
            $this->assign('article',$article);
        }
        //检查该分类是否允许发布内容
        $allow_publish  =   get_category($cate_id, 'allow_publish');

        $this->assign('status', $status);
        $this->assign('allow',  $allow_publish);
        $this->assign('pid',    $map['pid']);

        $this->meta_title = '文档列表';
        return $list;
    }

}