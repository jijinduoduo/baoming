<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------
namespace Admin\Model;
use Think\Model;

/**
 * 优惠券模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class CancelModel extends Model{

    protected $_validate = array(

    );

 protected $_auto = array(
 
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
       
    );

    /**
     * 获取优惠券详细信息
     * @param  milit   $id ID或标识
     * @param  boolean $field 查询字段
     * @return array  
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function info($id, $field = true){
        /* 获取信息 */
        $map = array();
        if(is_numeric($id)){ //通过ID查询
            $map['id'] = $id;
        } else { //通过标识查询
            $map['name'] = $id;
        }
        return $this->field($field)->where($map)->find();
    }

    /**
     * 获取优惠券树，指定优惠券则返回指定优惠券极其子优惠券，不指定则返回所有优惠券树
     * @param  integer $id    优惠券ID
     * @param  boolean $field 查询字段
     * @return array          优惠券树
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */


    /**
     * 更新优惠券信息
     * @return boolean 更新状态
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function update(){
        $data = $this->create();
        if(!$data){ //数据对象创建错误
            return false;
        }

        /* 添加或更新数据 */
        if(empty($data['id'])){
            $res = $this->add();
        }else{
            $res = $this->save();
        }

            $orderid=safe_replace($_POST["orderid"]）;
            $status=I('status');
			 /* 根据状态判断操作 */
			if($status){
		   switch ($status) {
                case '1':
				
				    $data = array('status'=>'4','backinfo'=>'订单已申请取消','act_cancel'=>$act);//设置订单为订单已提交取消
	                M("order")->where("orderid='$orderid'")->setField($data);
                break;
				case '2':
				   
				    $data = array('status'=>'5','backinfo'=>'订单已拒绝','act_cancel'=>$act);//设置订单为订单已拒绝
                   M("order")->where("orderid='$orderid'")->setField($data);
                  break;
				

			   case '3': 
				   $data = array('status'=>'6','backinfo'=>'订单已关闭','act_cancel'=>$act);//设置订单为订单已取消
				    M("order")->where("orderid='$orderid'")->setField($data);
					

                  break;
             
				}
         }

        return $res;
    }

    
}
