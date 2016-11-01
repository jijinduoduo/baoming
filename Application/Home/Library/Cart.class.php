<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
/*****购物车的类
 功能：添加商品、添加/删除/查看某一个商品的数量、查看商品的总类/总数量、清空购物车、计算购物车总价格、返回购物车商品列表
***************/
namespace Home\Controller;

/**
 * 文件控制器
 * 主要用于下载模型的文件上传和下载
 */

 class Cart{

    public function __cunstruct() {
        if(!isset($_SESSION['cart'])){
            $_SESSION['cart'] = array();
        }
    }
 
    /*
    添加商品
    param int $id 商品主键
          string $name 商品名称
          float $price 商品价格
          int $num 购物数量
    */
    public  function addItem($id,$name,$price,$num,$img) {
        //如果该商品已存在则直接加其数量
        if (isset($_SESSION['cart'][$id])) {
            $this->incNum($id,$num);
            return;
        }
			$name=$_POST['name'];
            $num=$_POST['num'];
            $id=$_POST['id'];
            $price=$_POST['price']; 
        $item = array();
        $item['id'] = $id;
        $item['name'] = $name;
        $item['price'] = $price;
        $item['num'] = $num;
        $_SESSION['cart'][$id] = $item;
    }
 
    /*
    修改购物车中的商品数量
    int $id 商品主键
    int $num 某商品修改后的数量，即直接把某商品
    的数量改为$num
    */
    public function modNum($id,$num=1) {
        if (!isset($_SESSION['cart'][$id])) {
            return false;
        }
       
	    $_SESSION['cart'][$id]['num'] = $num;
    }
 
    /*
    商品数量+1
    */
    public function incNum($id,$num=1) {
        if (isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['num'] += $num;
        }
    }
 
    /*
    商品数量-1
    */
    public function decNum($id,$num=1) {
        if (isset($_SESSION['cart'][$id])) {
            $_SESSION['cart'][$id]['num'] -= $num;
        }
 
        //如果减少后，数量为0，则把这个商品删掉
        if ($_SESSION['cart'][$id]['num'] <1) {
            $this->delItem($id);
        }
    }
 
    /*
    删除商品
    */
    public function delItem($id) {
        unset($_SESSION['cart'][$id]);
    }
     
    /*
    获取单个商品
    */
    public function getItem($id) {
        return $_SESSION['cart'][$id];
    }
 
    /*
    查询购物车中商品的种类
    */
    public function getCnt() {
        return count($_SESSION['cart']);
    }
     
    /*
    查询购物车中商品的个数
    */
    public function getNum(){
        if ($this->getCnt() == 0) {
            //种数为0，个数也为0
            return 0;
        }
 
        $sum = 0;
        $data = $_SESSION['cart'];
        foreach ($data as $item) {
            $sum += $item['num'];
        }
        return $sum;
    }
 
    /*
    购物车中商品的总金额
    */
    public function getPrice() {
        //数量为0，价钱为0
        if ($this->getCnt() == 0) {
            return 0;
        }
        $price = 0.00;
        $data = $_SESSION['cart'];
        foreach ($data as $item) {
            $price += $item['num'] * $item['price'];
        }
        return sprintf("%01.2f", $price);
    }
 
    /*
    清空购物车
    */
    public function clear() {
        $_SESSION['cart'] = array();
    }
}