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
class SlideModel extends Model{

    protected $_validate = array(
       
      
        array('title', 'require', '名称不能为空', self::MUST_VALIDATE , 'regex', self::MODEL_BOTH),
    
    	 array('title', '', '名称已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
    	
    );

  protected $_auto = array(
 
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
       
    );

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

        //更新优惠券缓存
        S('sys_brand_list', null);

        //记录行为
        action_log('update_Slide', 'Slide', $data['id'] ? $data['id'] : $res, UID);

        return $res;
    }

    
}
