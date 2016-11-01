<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Home\Model;
use Think\Model;
use Think\Page;

/**
 * 文档基础模型
 */
class CollectModel extends Model{

   
public  function getfavor($uid) {
	 if (!$uid){
	     $uid=is_login();
	 }
	 $favorlist=$this->where("uid='$uid'")->select();
	 return $favorlist; 
    
  }
  //数据分页
 function getLists($map){     	  
	   $count=$this->where($map)->count();
	   $Page= new \Think\Page($count,20);      
	   $list=$this->where($map)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();  
	   return $list;
 }
  //分页码
function getPage($map){     	   
	   $count=$this->where($map)->count();
	   $Page= new \Think\Page($count,20);
	   $Page->setConfig('prev','上一页');
       $Page->setConfig('next','下一页');
       $Page->setConfig('first','第一页');
       $Page->setConfig('last','尾页');
       $Page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');        
       $show= $Page->show();       
	  return $show;
    } 
}
