<?php
namespace Home\Controller;
/*****购物车控制器**/
class ShopcartController extends HomeController {

    /*
    添加商品
    param int $id 商品主键
          string $name 商品名称
          float $price 商品价格
          int $num 购物数量
    */
	public  function addItem($id) {
		$num=I('post.num',0,'intval');
		$id=I('post.id',0,'intval'); // 用intval过滤$_POST['id']
        $price=I('post.price');
		$price=safe_replace($price);//过滤
		$parameters=I('post.i'); // 用intval过滤$_POST['i']
        $parameters=safe_replace($parameters);//过滤
	    $sort=I('post.sort');
		$sort=safe_replace($sort);//过滤
		if(!isset($_SESSION['cart'])){
		    $_SESSION['cart'] = array();
		};
		//如果该商品已存在则直接加其数量
		if(isset($_SESSION['cart'][$sort])) {
			$_SESSION['cart'][$sort]['num'] += $num;
			$item['id'] = $id;
			$item['price'] = $price;
			$item['sort'] = $sort;
			$item['parameters'] = $parameters;
			$item['num'] = $_SESSION['cart'][$sort]['num'];		
			$_SESSION['cart'][$sort] = $item;
			$exsit=$_SESSION['cart'][$sort]?1:0;
		}
		else{
			$item['id'] = $id;
			$item['price'] = $price;
			$item['num'] = $num;
			$item['sort'] = $sort;
			$item['parameters'] = $parameters;
			$_SESSION['cart'][$sort] = $item;
			$exsit="0";

		}
		//登录用户，处理详情页ajaxt提交的数据保存到数据库
		if(is_login()){
			$table=D("shopcart");
			$data['goodid']=$id;
			$member=D("member");
			$uid=$member->uid();
			$data['uid']=$uid;
			$data['price']=$price;
			$data['sort']=$sort;
			$data['parameters']=$parameters;
			$datanum=M("shopcart")->where("goodid='$id'and uid='$uid' and parameters='$parameters'")->getField("num");
			if($datanum){$exsit="1";
				$data['num']=$datanum+$num;
				$table->where("goodid='$id'and uid='$uid' and parameters='$parameters'")->save($data);
			}
			else{
				$data['create_time']=NOW_TIME;
				$data['num']=$num;
				$table->add($data);
				$exsit="0";
			}
			$data['sql'] ='sql';
			$data['status'] =1;
			$data['num'] = M("shopcart")->where("goodid='$id'and uid='$uid' and parameters='$parameters'")->getField("num");
			$data['msg'] = '已添加到购物车';
			$data['exsit'] = $exsit;
			$data['sum']=D("shopcart")->getNumByuid();
			$data['fee']=$table->getPriceByuid(); /* 购物车中商品的总金额*/
			$this->ajaxReturn($data);
		}
		else{    
			$data['exsit'] = $exsit;
			$data['fee']=$this->getPrice(); /* 购物车中商品的总金额*/
			$data['status'] = 1;
			$itemid= $this->getItem($sort);
			$data['num']=$itemid['num'];
			$data['sum'] =$this->getNum();
			$data['msg'] = '已添加到购物车';
			$this->ajaxReturn($data);
		}
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
    public function incNum($sort,$num=1) {
         $sort=I('post.sort',0,'intval');
         if (isset($_SESSION['cart'][$sort])) {
            $_SESSION['cart'][$sort]['num'] += $num;
			   
        }
		$count=$this->getCnt(); /*查询购物车中商品的种类 */
        $sum= $this->getNum();/* 查询购物车中商品的个数*/
        $price=$this->getPrice(); /* 购物车中商品的总金额*/
	    $data['count'] =$count;
	 	$data['price'] =$price;
		$data['sum'] =  $sum;
        $data['status'] = 1;
        $this->ajaxReturn($data);
    }
 
    /*
    商品数量-1
    */
    public function decNum($sort,$num=1) { 
		$sort=I('post.sort',0,'intval');
		if (isset($_SESSION['cart'][$sort])) {
            $_SESSION['cart'][$sort]['num'] -= $num;
        }
 
        //如果减少后，数量为0，则把这个商品删掉
        if ($_SESSION['cart'][$sort]['num'] <1) {
            unset($_SESSION['cart'][$sort]);
        }
		$count=$this->getCnt(); /*查询购物车中商品的种类 */
        $sum= $this->getNum();/* 查询购物车中商品的个数*/
        $price=$this->getPrice(); /* 购物车中商品的总金额*/
	    $data['count'] =$count;
	 	$data['price'] =$price;
		$data['sum'] =  $sum;
        $data['status'] = 1;
        $this->ajaxReturn($data); 
    }
 
 public function index() {
 /*查询购物车*/
     $count=count($_SESSION['cart']); 
	 if(is_login()){ 
	    $cart=D("shopcart");
        $result= $cart->getcart();
        $this->assign('sqlcart',$result); 
	    $count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
	    $member=D("member");
        $uid=$member->uid();
	  }
	  else{
		$uid="";
		$count=$this->getCnt(); /*查询购物车中商品的种类 */
        $sum= $this->getNum();/* 查询购物车中商品的个数*/
        $price=$this->getPrice(); /* 购物车中商品的总金额*/
	    $usercart=$_SESSION['cart'];
        $this->assign('usercart',$usercart);
	  }
		$this->assign('uid',$uid);
		$address=get_address($uid);
		$this->assign('address',$address);
		$this->assign('count',$count);
        $this->assign('sum', $sum);
	    $this->assign('price',$price);
		$this->meta_title = '我的购物车';
		$this->display();
    }

    public function delItem() {
		$sort=I('post.sort',0,'intval');
		unset($_SESSION['cart'][$sort]);
		$count=$this->getCnt(); /*查询购物车中商品的种类 */
		$sum= $this->getNum();/* 查询购物车中商品的个数*/
		$price=$this->getPrice(); /* 购物车中商品的总金额*/
		$data['count'] =$count;
		$data['price'] =$price;
		$Item=$this->getItem($sort);
		$data['num'] =$_SESSION['cart'][$sort]["num"];
		$data['sum'] =  $sum;
		$data['status'] = 1;
		$this->ajaxReturn($data);
	}
    /*
    获取单个商品
    */
    public function getItem($sort) {
        return $_SESSION['cart'][$sort];
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
    public function incNumByuid(){
		$sort=I('post.sort',0,'intval');
		$cart=D("Shopcart");
        $result= $cart->inc($sort);
        $count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
		if($result){
			$data['new'] ='新个数'.$result;
			$data['count'] = $count;
			$data['status'] = 1;
			$data['price'] =$price;
		    $data['sum'] = $sum;
            $data['msg'] = '处理成功';
		    $this->ajaxReturn($data);
		}
	}
    public function decNumByuid(){
		$cart=D("shopcart");
		$sort=I('post.sort',0,'intval');
		$result= $cart->dec($sort);
		$count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
        $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
        $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
		if($result){$data['new'] ='新个数'.$result;
			$data['count'] = $count;
			$data['status'] = 1;
			$data['price'] =$price;
		    $data['sum'] = $sum;
            $data['msg'] = '处理成功';
		    $this->ajaxReturn($data);
		}
    }
    public function delItemByuid(){
		$cart=D("shopcart");
		$sort=I('post.sort',0,'intval');
		$user=D("member");
	    $uid=$user->uid();
	    if($result= $cart->where("sort='$sort'and uid='$uid'")->delete()){
		   $count=$cart->getCntByuid(); /*查询购物车中商品的种类 */
           $sum= $cart->getNumByuid();/* 查询购物车中商品的个数*/
           $price=$cart->getPriceByuid(); /* 购物车中商品的总金额*/
		   $data['status'] = 1;
		   $data['goodid'] =$id;
		   $data['price'] =$price;
		   $data['count'] = $count;
		   $data['num'] =  $sum;
		   $data['sum'] =  $sum;
           $data['msg'] = '处理成功';
		   $this->ajaxReturn($data);
	   }		
    }
}
