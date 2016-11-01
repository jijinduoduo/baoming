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
class ReserveController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	
       $map  = array('status' => 1);
  
		 $list = $this->lists('reserve', $map,'id desc');
	
        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        
        $this->meta_title = '预约管理';
        $this->display();
    }



    /* 新增分类 */
    public function sendPublic(){
        $reserve = D('reserve');
    if(IS_POST){
             $ids = I('post.id');
			
             $map['status']=1;
             $list= M("reserve")->where($map)->select();
			 $count=M("reserve")->where($map)->count();
                if($list){
                       foreach($list  as $key=> $val){
		                 $mobile=$val["cellphone"];
                         $content="您预约的".$val["title"]."，即将开始，谢谢-".C('SITENAME');
                        sendsms($mobile,$content);     
                       $id=$val['id']; 
					   $data['status']=2;
					   $n=M("reserve")->where("id='$id'")->save($data);
                            }

               }
           if($n==$count){
               $this->success("发送成功！");
		   
		      }
            else{ $this->success("发送失败！".$count);
             
			  
			  }

           }
    }



 

 public function del(){
       if(IS_POST){   
             $ids = I('post.id');
            $order = M("reserve");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
						
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("reserve");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }

}