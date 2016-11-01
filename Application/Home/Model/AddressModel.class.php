<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------
namespace Home\Model;
use Think\Model;

/**
 * 优惠券模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class AddressModel extends Model{

protected $_validate = array(     
   array('province', 'require', '省不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
   array('city', 'require', '城市不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
   array('area', 'require', '地区不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
   array('address', 'require', '详细地址不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
   array('address', '1,200', '详细地址长度不能超过200个字符', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
   array('realname', 'require', '联系人不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH),
   array('cellphone', 'require', '手机号码不能为空', self::MUST_VALIDATE, 'regex', self::MODEL_BOTH), 	
    );

  protected $_auto = array(
        array('uid', 'is_login', self::MODEL_INSERT, 'function'),
        array('address', 'getAddress', self::MODEL_BOTH, 'callback'),
        array('realname', 'getRealname', self::MODEL_BOTH, 'callback'),
        array('province', 'getProvince', self::MODEL_BOTH, 'callback'),
        array('city', 'getCity', self::MODEL_BOTH, 'callback'),
        array('area', 'getArea', self::MODEL_BOTH, 'callback'),
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),     
    );
 protected function getAddress(){
        $address = I('post.address');
        return safe_replace($address);//安全过滤
    }
  protected function getRealname(){
        $realname = I('post.realname');
        return safe_replace($realname);//安全过滤
    }
	protected function getProvince(){
        $map["id"] = I('post.province',0,'intval');
        if(!$map["id"]){
            return '';
        }
	    $info=M("area")->where($map)->find();
       
        return $info['area'];
    }
protected function getCity(){
        $map["id"] = I('post.city',0,'intval');
        if(!$map["id"]){
            return '';
        }
	    $info=M("area")->where($map)->find();
       
        return $info['area'];
    }
protected function getArea(){
        $map["id"] = I('post.area',0,'intval');
        if(!$map["id"]){
            return '';
        }
	    $info=M("area")->where($map)->find();
       
        return $info['area'];
    }
    /**
     * 获取优惠券详细信息
     * @param  milit   $id 优惠券ID或标识
     * @param  boolean $field 查询字段
     * @return array     优惠券信息
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function info($id, $field = true){
        /* 获取优惠券信息 */
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

        return $res;
    }

    
}
