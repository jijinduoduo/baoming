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
class ExpressController extends AdminController {

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
				     $meta_title="未使用快递管理";
                break;
				case '2':
				      $map['status']=$status;
				      $meta_title="已使用快递管理";
                  break;                
				}
         } 
		
		 else{
		    $status='';		
	        $meta_title="快递管理";
		 }
    
        if ( isset($_GET['time-start']) ) {
            $map['update_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $map['update_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }
       
         $this->assign('status', $status);
	    $this->meta_title = $meta_title;

		 $list = $this->lists('Express', $map,'id desc');
	
        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
       
        $this->display();
    }

  /* 编辑分类 */
    public function edit($id = null, $pid = 0){
        $Express = D('Express');
        if(IS_POST){ //提交表单
            if(false !== $Express->update()){
                $this->success('编辑成功！', U('index'));
            } else {
                $error = $Express->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
          

            /* 获取分类信息 */
            $info = $id ? $Express->info($id) : '';

            $this->assign('info',       $info);
            $this->assign('category',   $cate);
            $this->meta_title = '编辑快递';
            $this->display();
        }
    }

    /* 新增分类 */
    public function add(){
        $Express = D('Express');
        if(IS_POST){ //提交表单
            if(false !== $Express->update()){
                $this->success('新增成功！', U('index'));
            } else {
                $error = $Express->getError();
                $this->error(empty($error) ? '未知错误！' : $error);
            }
        } else {
            $cate = array();
            if($pid){
                /* 获取上级优惠券信息 */
                $cate = $Express->info($pid, 'id,title,status');
                if(!($cate && 1 == $cate['status'])){
                    $this->error('指定的上级分类不存在或被禁用！');
                }
            }

            /* 获取优惠券信息 */
            $this->assign('info',       null);
            $this->assign('category', $cate);
            $this->meta_title = '新增快递';
            $this->display('edit');
        }
    }



function sendChoose() {
	   if(IS_POST){
             $ids = I('post.id');
             $Express = M("Express");
			 $list = M("order")->where("status=1")->select();
            if(is_array($ids)){ 
							 foreach($ids as $id){	
								 $condition['status']  = 1; 
                                 $condition['id']  = $id;
                                 $info=$Express->where($condition)->find();
                                 $data['status']=2; 
								 $data['tool']=$info['title'];
                                 $data['toolid']=$info['code'];
								 $data['send_name']=C('SHOPNAME');
                                 $data['send_contact']=C('CONTACT');
								 $data['send_address']=C('ADDRESS');
						         $data['create_time']=NOW_TIME;
                                 foreach($list as $n=> $val){	
                                 M("order")->where('id=\''.$val['id'].'\'')->save($data);
                                 M("Express")->where('id=\''.$info['id'].'\'')->setField('status',2);
								   $sum += $val['id'];
							  }
                }
           }
		if ($sum){
                $this->success("批量发货成功！");
            }
			
			else{
                $this->error("批量发货失败！");
            }
	} 
 }

function sendWhole() {
	   if(IS_POST){
			  $condition['status']  = 1; 
               $Express=M("Express")->where($condition)->select();
				$list = M("order")->where("status=1")->select();
							 foreach($Express as $n=> $vo){	
                                 $data['status']=2; 
								 $data['tool']=$vo['title'];
                                 $data['toolid']=$vo['code'];
								 $data['send_name']=C('SHOPNAME');
                                 $data['send_contact']=C('CONTACT');
								 $data['send_address']=C('ADDRESS');
						         $data['create_time']=NOW_TIME;
                                 foreach($list as $n=> $val){	
                                 M("order")->where('id=\''.$val['id'].'\'')->save($data);
                                  M("Express")->where('id=\''.$vo['id'].'\'')->setField('status',2); $sum += $val['id'];
							  }
                }
           
		if ($sum){
                $this->success("批量发货成功！");
            }
			
			else{
                $this->error("批量发货失败！");
            }
	} 
 }
 public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $Express = M("Express");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $Express->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("Express");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }

}