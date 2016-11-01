<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 模块模型
 */
class ModuleModel extends Model{

    /* 自动验证规则 */
    protected $_validate = array(
        array('name', '1,50', '模块名长度不能超过50', self::MUST_VALIDATE , 'length', self::MODEL_INSERT),
        array('name', '', '该模块标识已存在', self::MUST_VALIDATE, 'unique', self::MODEL_BOTH),
        array('title', '1,100', '标题长度不能超过30个字符', self::MUST_VALIDATE, 'length', self::MODEL_BOTH),
    );

    /* 自动完成规则 */
    protected $_auto = array(
    	array('status', '1', self::MODEL_INSERT, 'string'),
        array('create_time', 'time', self::MODEL_INSERT, 'function'),
    	array('name', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
    	array('title', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
    	array('description', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
    );

    /**
     * 新增或更新一个模块
     * @return boolean fasle 失败 ， int  成功 返回完整的数据
     * @author huajie <banhuajie@163.com>
     */
    public function update($data = null){
        /* 获取数据对象 */
        $data = $this->create($data);
        if(empty($data)){
            return false;
        }

        /* 添加或新增基础内容 */
        if(empty($data['id'])){ //新增数据
            $id = $this->add(); //添加基础内容
            if(!$id){
                return false;
            }
        } else { //更新数据
            $status = $this->save(); //更新基础内容
            if(false === $status){
                return false;
            }
        }

        //内容添加或更新完成
        return $data;
    }

    /**
     * 获取指定状态的模块
     * @author huajie <banhuajie@163.com>
     */
    public function getModulesByStatus($allow = true, $merge = true){
    	$return = array();
    	$status = $allow ? 1 : array('neq'=>1);
    	$list = $this->where(array('status'=>$status))->field('name')->select();
    	if($merge){
    		foreach ($list as $v){
    			$return[] = $v['name'];
    		}
    	}else{
    		$return = $list;
    	}
    	return $return;
    }

    /**
     * 设置默认模块
     * @author huajie <banhuajie@163.com>
     */
    public function setDefault($id){
    	if($this->where(array('default'=>1))->setField('default', 0) !== false){
    		return $this->where(array('id'=>$id))->setField('default', 1);
    	}
    	return false;
    }
}
