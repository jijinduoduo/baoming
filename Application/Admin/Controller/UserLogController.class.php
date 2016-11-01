<?php
// +----------------------------------------------------------------------
// | yershop@2015
// +----------------------------------------------------------------------
// | author    yershop.com
// +----------------------------------------------------------------------
// | contact   service@yershop.com
// +----------------------------------------------------------------------
namespace Admin\Controller;

/**
 * 后台短信管理控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class UserLogController extends AdminController {

    /**
     * 短信管理列表
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){ 
                $status=$_GET['status'];
		 if(isset($_GET['status'])){
		 switch ($status) {
                case '1': 
				     $map['status']=$status;
				     $meta_title="日志管理";
                break;
			
				}
         } 
		
		 else{
		    $status=1;
			$map  = array('status' =>1);
	        $meta_title="日志管理";
		 }
       if(isset($_GET['title'])){
            $map['title']  = array('like', '%'.(string)I('title').'%');
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

	    $this->meta_title = $meta_title;
		$this->assign('status', $status);
		$list = $this->lists('UserLog', $map,'id desc');

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
      
        $this->display();
    }

    /**
     * 显示短信树，仅支持内部调
     * @param  array $tree 短信树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
 
    /* 编辑短信 */
    public function edit($id = null, $pid = 0){
        $UserLog = D('UserLog');

        if(IS_POST){ //提交表单
            if(false !== $UserLog->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $UserLog->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = '';
            if($pid){
                /* 获取上级短信信息 */
                $cate = $UserLog->info($pid, 'id,name,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级短信不存在或被禁用！');
                }
            }

            /* 获取短信信息 */
            $info = $id ? $UserLog->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('UserLog',   $cate);
            $this->meta_title = '编辑短信';
            $this->display();
        }
    }

    /* 新增短信 */
    public function add($pid = 0){
        $UserLog = D('UserLog');

        if(IS_POST){ //提交表单
            if(false !== $UserLog->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $UserLog->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
           
            $this->meta_title = '新增日志管理';
            $this->display('edit');
        }
    }

    /**
     * 删除一个日志
     * @author huajie <banhuajie@163.com>
     */
    public function del(){
        $cate_id = I('id');
        if(empty($cate_id)){
            $this->error('参数错误!');
        }      
        //删除该短信信息
        $res = M('UserLog')->delete($cate_id);
        if($res !== false){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败！');
        }
    }

  /**
     * 清空日志
     * @author huajie <banhuajie@163.com>
     */
    public function clear(){
       
        //删除该短信信息
        $res = M('UserLog')->where('id>0')->delete();
        if($res !== false){
            $this->success('清空成功！');
        }else{
            $this->error('清空失败！');
        }
    }
 


}