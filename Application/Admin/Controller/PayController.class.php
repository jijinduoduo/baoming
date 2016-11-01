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
class PayController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */
	    $status=$_GET['status'];
		 if(isset($_GET['status'])){
		 switch ($status) {
			   case '0': 
				     $map['status']=$status;
				     $meta_title="待支付";
                break;
                case '1': 
				     $map['status']=$status;
				     $meta_title="在线支付";
                break;
			  case '2': 
				     $map['status']=$status;
				     $meta_title="货到付款";
                break;

				}
         } 
		
		 else{
		  
			$map  = '';
	        $meta_title="财务管理";
		 }
       if(isset($_GET['out_trade_no'])){
             $out_trade_no=I('out_trade_no');
			 $out_trade_no=safe_replace($out_trade_no);//过滤
			 $map['out_trade_no']  = array('like', '%'.$out_trade_no.'%');
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
  
       $list = $this->lists('pay',$map,'id desc');

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
			 $pay = D('pay');
            if(false !==$pay->update()){
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
           
        } else {
            $this->meta_title = '新增财务管理';
            $this->assign('info',null);
            $this->display('edit');
        }
    }

    /**
     * 编辑订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function edit($id = 0){
        if(IS_POST){
            $pay = D('pay');
            if(false !==$pay->update()){
                    //记录行为
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
            
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('pay')->find($id);
$detail= M('pay')->where("id='$id'")->select();
$codeid=M('pay')->where("id='$id'")->getfield("out_trade_no");
$oid=M('order')->where("orderid='$codeid'")->getfield("id");
$list=M('shoplist')->where("orderid='$id'")->select();

            if(false === $info){
                $this->error('获取订单信息错误');
            }
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			 $this->assign('a', $payid);
            $this->meta_title = '编辑财务管理';
            $this->display();
        }
    }
 
   /**
     * 删除
     * @author yangweijie <yangweijiester@gmail.com>
     */
    public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $pay = M("pay");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $pay->where("id='$id'")->delete();
							 
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("pay");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }




}