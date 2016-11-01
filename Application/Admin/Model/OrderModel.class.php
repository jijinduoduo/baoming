<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;
/**
 * 配置模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */

class OrderModel extends Model {
    protected $_validate = array(
        array('orderid','require','订单号必须填写'), 
        array('assistant','require','操作人必须填写'), 
    );

    /* 自动完成规则 */
    protected $_auto = array(
        array('orderid', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
    );

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

            
			 $id=safe_replace($_POST["id"]); 		 
			$orderid=M('order')->where("id='$id'")->getField("orderid");
            $status=I('status');
			 /* 根据状态判断操作 */
			if($status){
		 switch ($status) {
                case '1': 
				    M('order')->where("orderid='$orderid'")->setField('status','1');
                   
                break;
				case '2':
						M('order')->where("id='$id'")->setField('status','2');
				    
//根据订单id获取购物清单
$list=M("shoplist")->where("orderid='$id'")->select();

foreach($list as $k=>$val)
	{
//获取购物清单数据表产品id，字段id
$byid=$val["id"];
$goodid=$val["goodid"];
		   //销量加1 库存减1
              $sales= M('document')->where("id='$goodid'")->setInc('sale');
              $stock= M('document')->where("id='$goodid'")->setDec('stock');
$data['status']=2;
 M("shoplist")->where("id='$byid'")->save($data);
}
                  break;
				

			   case '3': 
				   M('order')->where("id='$id'")->setField('status','3');
			       
//根据订单id获取购物清单,设置商品状态为已完成.，status=3
$del=M("shoplist")->where("orderid='$id'")->select();

foreach($del as $k=>$val)
	{
//获取购物清单数据表产品id，字段id
$byid=$val["id"];
$data['iscomment']=1;
$data['status']=3;
$shop=M("shoplist");
$shop->where("id='$byid'")->save($data);
}
   
                  break;
              
				}
         }

        return $res;
    }


}
