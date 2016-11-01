<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 分类模型
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class ShopModel extends Model{

    protected $_validate = array(
        array('shopname', 'require', '名称不能为空', self::EXISTS_VALIDATE, 'regex', self::MODEL_BOTH),
        array('shopname', '', '名称已经存在', self::VALUE_VALIDATE, 'unique', self::MODEL_BOTH),
      
    );

    protected $_auto = array(
      
      
        array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('update_time', NOW_TIME, self::MODEL_BOTH),
       
    );


    /**
     * 获取分类详细信息
     * @param  milit   $id 分类ID或标识
     * @param  boolean $field 查询字段
     * @return array     分类信息
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function info($id, $field = true){
        /* 获取分类信息 */
        $map = array();
        if(is_numeric($id)){ //通过ID查询
            $map['id'] = $id;
        } else { //通过标识查询
            $map['name'] = $id;
        }
        return $this->field($field)->where($map)->find();
    }

 
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

        //更新分类缓存
        S('sys_category_list', null);

        //记录行为
        action_log('update_category', 'category', $data['id'] ? $data['id'] : $res, UID);

        return $res;
    }

 

}
