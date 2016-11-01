<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
  * @author 烟消云散 <1010422715@qq.com>
 */
class LookupController extends AdminController {

    /**
     * 首页访问统计
     * author 烟消云散 <1010422715@qq.com>
     */
     public function index(){
        /* 查询条件初始化 */	
         $status=$_GET['status'];
		 if(isset($_GET['status'])){
		 switch ($status) {
                case '1': 
				     $map['status']=$status;
				     $meta_title="首页统计";
                break;
				case '2':
				      $map['status']=$status;
				      $meta_title="列表页统计";
                  break;
				

			   case '3': 
				     $map['status']=$status;
			         $meta_title="内容页统计";

                  break;
                
				}
         } 
		
		 else{
		   
			$map  ='';
	        $meta_title="全部统计";
		 }
        if(isset($_GET['ip'])){
            $map['ip']  = array('ip', '%'.(string)I('ip').'%');
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
         $this->assign('status', $status);
	    $this->meta_title = $meta_title;
		  $list = $this->lists('records', $map,'id desc');
        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
       
        $this->display();
    }
	/**
     * 分类页访问统计
     * author 烟消云散 <1010422715@qq.com>
     */
   public function add($id = 0){
        if(IS_POST){
            $records = D('records');
           
           if(false !==$records->update()){
               
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
            
        } else {
           
            $this->meta_title = '编辑记录';
            $this->display();
        }
    }
    /**
     * 编辑
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function edit($id = 0){
        if(IS_POST){
            $records = D('records');
           
           if(false !==$records->update()){
                    //记录行为
                    
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
           
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('records')->find($id);

            $list=M('records')->where("id='$id'")->select();

            if(false === $info){
                $this->error('获取订单信息错误');
            }
            $this->assign('list', $list);

			 $this->assign('info', $info);
            $this->meta_title = '编辑订单';
            $this->display();
        }
    }
 public function clear(){
       $status=I('get.status',0,'intval') ; // 用intval过滤$_POST['id']
       if($status>0){
           $map['status']=$status;
        }else{
		$map['status']=array('gt',0);	
		}

        //删除该短信信息
        $res = M('records')->where($map)->delete();
        if($res !== false){
            $this->success('清空成功！');
        }else{
            $this->error('清空失败！');
        }
    }

    public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $arr = M("records");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $arr->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("records");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }



}