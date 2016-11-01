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
class CancelController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	
      $status=$_GET['status'];
		 if(isset($_GET['status'])){
		 switch ($status) {
                case '1': 
				     $map['status']=$status;
				     $meta_title="已提交取消订单";
                break;
				case '2':
				      $map['status']=$status;
				      $meta_title="已同意取消订单";
                  break;
				

			   case '3': 
				     $map['status']=$status;
			         $meta_title="已拒绝取消订单";

                  break;
             
				}
         } 
		
		 else{
		    $status=1;
			$map  = array('status' =>1);
	        $meta_title="已提交取消订单";
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
       $list = $this->lists('cancel', $map,'id');

        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
      
        $this->display();
    }

    /**
     * 新增订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function add(){
        if(IS_POST){
            $Cancel = D('Cancel');
            if(false !==$Cancel->update()){
               
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
           
        } else {
            $this->meta_title = '新增订单';
            $this->assign('info',null);
            $this->display();
        }
    }

    /**
     * 编辑订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function edit($id = 0){
       if(IS_POST){
            $Cancel = D('Cancel');
            if(false !==$Cancel->update()){
                    //记录行为
                   
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
            
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('cancel')->find($id);
            $orderid=$info["orderid"];
            $list=M('order')->where("orderid='$orderid'")->select();
			$detail=M('shoplist');
            foreach($list as $n=> $val){
            $list[$n]['id']=$detail->where('orderid=\''.$val['id'].'\'')->select(); 
     }
     $trans=M('address');
	   foreach($list as $k=> $va){
         $list[$k]['addressid']=$trans->where('id=\''.$va['addressid'].'\'')->select(); 
     }
            if(false === $info){
                $this->error('获取订单信息错误');
            }
            $this->assign('list', $list);

			 $this->assign('info', $info);
            $this->meta_title = '编辑订单';
            $this->display();
        }
    }
 /**
     * 同意取消订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function agree(){
  if(IS_POST){
           
          $Cancel = D('Cancel');

            if(false !==$Cancel->update()){
               $this->success('操作成功，订单已取消');
            }
		else{
                $this->error('取消失败');
            }	
       }    else {
            $this->meta_title = '同意取消订单';
          
            $this->display();
        }  
   
        
 }

 public function refuse(){
  if(IS_POST){         
          $Cancel = D('Cancel');

            if(false !==$Cancel->update()){
               $this->success('操作成功，订单已取消');
            }
		else{
                $this->error('取消失败');
        }      }	
         else {
            $this->meta_title = '拒绝取消订单';
          
            $this->display();
        }  
        
 } 
 
 /**
     * 删除订单
     * @author yangweijie <yangweijiester@gmail.com>
     */
    public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("cancel");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("cancel");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }



}