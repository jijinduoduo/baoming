<?php
/**
 * Site http://www.yershop.com 
// +----------------------------------------------------------------------
 * Controller 预约控制器
// +---------------------------------------------------------------------- */ 
namespace Home\Controller;
use Think\Controller;
/**
 * 预约模型控制器
 * 文档模型列表和详情
 */
class ReserveController extends Controller {
  /* 商品预约处理操作 */
    public function index($cellphone='') { 
		$reserve = M('reserve');
		$cellphone=I('post.phone',0,'intval');
		$goodid=I('post.goodid',0,'intval');
		$map['cellphone'] = $cellphone;
		$map['goodid'] = $goodid;
		addUserLog('预约商品，商品名称'.get_good_name($goodid), $uid);
		$info=$reserve->where($map)->find(); 
		if ( empty($info) ) {
				$data['cellphone'] = $cellphone;
				$data['create_time'] = NOW_TIME;
				$data['status'] = 1;
				$data['goodid'] = $goodid;
				$data['title'] = get_good_name($goodid);
				$reserve->add($data);
				$data['info']='预约成功!';
	     }else{
		    $data['status'] = -1;
		    $data['info']='您已经预约过了!';
		 }  
       $this->ajaxreturn($data); 
    }
}