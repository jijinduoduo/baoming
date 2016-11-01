<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2014 1010422715@qq.com  All rights reserved.
// +----------------------------------------------------------------------
// | Author: 烟消云散 <1010422715@qq.com> 
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台数据统计控制器
 *  Author: 烟消云散 <1010422715@qq.com> 

php获取今日开始时间戳和结束时间戳

 $a=date('Ymd',$qtime);/*格式时间戳为 20141024

$beginToday=mktime(0,0,0,date('m'),date('d'),date('Y')); 

$endToday=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;

php获取本月起始时间戳和结束时间戳
 
$beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
$endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
PHP mktime() 函数用于返回一个日期的 Unix 时间戳。
 */
class StatisticsController extends AdminController {

    public function index(){
        $this->meta_title = '管理首页';
		$title="今日数据统计 ";
        $this->assign('title',$title);
		 $dtime=date('Y.m.d',NOW_TIME);/*本周一结束时间*/
	    $this->assign('dtime',$dtime);
		 /*销售统计*/
	   $order=M("order")->where("total!=''")->select();
	   $qtime=NOW_TIME;
      foreach($order as $n=> $val){
      $time=$val['create_time'];
      $a=date('Ymd',$qtime);/*格式时间戳为 20141024*/
	  $b=date('Ymd',$time);
     if($a==$b){//当天
		 /*商品销售额*/
       $salesmoney+=$val['total']; 
	    /*运费*/
       $trans+=$val['shipprice']; 
	   /*总销售额*/
	   $total+=$val['pricetotal']; 
      $id=$val['id'];
	  $list=M("shoplist")->where("orderid='$id'")->select();
	  foreach($list as $k=> $vo){
	  /*退货中的商品id*/
		  $goodid=$vo['goodid'];
			$price=get_good_price($goodid);
          
			/*销售的商品件数*/
			$salenum+=$vo['num'];
			 /*销售的商品种类数*/
			$salecount+=1;
	  }


	   }
     }
	  $this->assign('salecount',$salecount);
	 
	   $this->assign('salenum',$salenum);
      $this->assign('trans',$trans);
	  $this->assign('salesmoney',$salesmoney); 
	  $this->assign('total',$total);
	  /**
     * 当天退货金额、种类、数量计算
     */
     $data = M("backlist")->where("status='1'")->select();
     $cqtime=NOW_TIME;
        foreach ($data as $k=>$val) {
    /*格式时间戳为 20141024*/
     $c=date('Ymd',$cqtime);
	 $time=$val['create_time'];
	  $d=date('Ymd',$time);
     if($c==$d){//当天
		  /*退货中的商品id*/
		  $goodid=$val['goodid'];
			
			 /*退货中的商品总额*/
            $back+= $val['total'] ;
			/*退货中的商品件数*/
			$backnum+=$val['num'];
			 /*退货中的商品种类数*/
			$backcount+=1;
			}
        }
		
	   $this->assign('back',$back);
	   $this->assign('backcount',$backcount);
	   $this->assign('backnum',$backnum);
     /**
     * 当天换货金额、种类、数量计算
     */
    $data = M("exchange")->where("status='1'")->select();
        $eqtime=NOW_TIME;
        foreach ($data as $k=>$val) {
     $e=date('Ymd',$eqtime);/*格式时间戳为 20141024*/
	 $time=$val['create_time'];
	 $f=date('Ymd',$time);
     if($e==$f){//当天
		 /*换货中的商品总额*/
			$goodid=$val['goodid'];
			$price=get_good_price($goodid);
             $change += $val['num'] * $price;
          /*换货中的商品件数*/
			 $changenum+=$val['num'];
			   /*换货中的商品种类数*/
			$changecount+=1;
			}
        }
	   $this->assign('change',$change);
	   $this->assign('changecount',$changecount);
	   $this->assign('changenum',$changenum);
 /**
     * 当天申请取消订单金额、种类、数量计算
     */
     $cdata = M("cancel")->where("status='1'")->select();
     $cqtime=NOW_TIME;
       foreach ($cdata as $k=>$val)
		{
    /*格式时间戳为 20141024*/
     $q=date('Ymd',$cqtime);
	 $time=$val['create_time'];
	  $s=date('Ymd',$time);
     if($q==$s){
	 //当天
			 /*取消订单的商品总额*/
            $cancel+= $val['cash'];
			/*取消订单的商品件数*/
			$cancelnum+=$val['num'];
			 /*取消订单的商品种类数*/
			$cancelcount+=$val['count'];
	 }
        }
	   $this->assign('cancel',$cancel);
	   $this->assign('cancelcount',$cancelcount);
	   $this->assign('cancelnum',$cancelnum);

       /*比率统计*/
     $percent_a=$total/($total+$back+$change+$cancel);
     $percent_b=$back/($total+$back+$change+$cancel);
	 $percent_c=$change/($total+$back+$change+$cancel);
      $percent_d=$cancel/($total+$back+$change+$cancel);
	 
     $this->assign('a',$percent_a);
	  $this->assign('b',$percent_b); 
	  $this->assign('c',$percent_c);
	   $this->assign('d',$percent_d);
   /*利润*/
	$profits=$total-$back-$change-$cancel;
	$this->assign('profits',$profits);
	  /*保存数据到数据库*/
     $turnover=M("turnover");
     $data["sales"]=$total;
     $data["back"]=$back;
     $data["change"]=$change;
	 $data["cancel"]=$cancel;
	 $data["profits"]=$profits;
	 $user= session('user_auth');
	$data["uid"]=$user["uid"];
$data["status"]='1';
	 $q=date('Ymd',$qtime);/*格式时间戳为 20141024*/
      $data["info"]=date('Ymd',$qtime);
     $t_time=$turnover->where("status='1'")->order("id desc")->limit(1)->getField("create_time");
     /*格式时间戳为 20141024*/
	 $r=date('Ymd',$t_time);/*格式时间戳为 20141024*/
	 if($q==$r){
		 /*当天已统计过数据，保存，创建时间不变，更新时间变化*/
     $data["update_time"]=NOW_TIME;
	 $turnover->where("create_time='$t_time' and status='1'")->save($data);
	 }
  else{ 
	  /*未统计过数据，新增*/
   $data["create_time"]=NOW_TIME;
   $data["update_time"]=NOW_TIME;
   $turnover->add($data);
  }

	 $this->display();
    }

 public function week(){
//date('w',$time); 取到的是星期几 0-6
//date('W',$time); 取到的是本年度的第几周 1-53
$time = time();
//判断当天是星期几，0表星期天，1表星期一，6表星期六
$w_day=date("w",$time);
 //php处理当前星期时间点上，根据当天是否为星期一区别对待
  if($w_day=='1'){
        $cflag = '+0';
        $lflag = '-1';
   }
  else {
          $cflag = '-1';
          $lflag = '-2';
   }
    //本周一零点的时间戳
    $start_time = strtotime(date('Y-m-d',strtotime("$cflag week Monday", $time)));        
    //本周末零点的时间戳
    $stop_time = strtotime(date('Y-m-d',strtotime("$cflag week Monday", $time)))+7*24*3600;

		$this->meta_title = '管理首页';
		$title="本周数据统计 ";
      $q=date('YmdHis',$start_time);/*本周一零点格式时间戳为20141020000000*/
	  $b=date('YmdHis', $stop_time);/*本周末格式时间戳为201410270000000*/
	  $stime=date('Y.m.d H:i:s',$start_time);/*本周一开始时间*/
      $etime=date('Y.m.d H:i:s',$stop_time);/*本周一结束时间*/
	    $this->assign('stime',$stime);
   $this->assign('etime',$etime);

      /*本周销量统计*/ 
      $order=M("order")->where("total!=''")->select();
      foreach($order as $n=> $val){
      $time=$val['create_time'];
      $a=date('YmdHis',$time);/*格式时间戳为 20141020000*/

     if($b>$a&&$a>$q){//本周
		 /*商品销售额*/
       $salesmoney+=$val['total']; 
	    /*运费*/
       $trans+=$val['shipprice']; 
	   /*总销售额*/
	   $total+=$val['pricetotal']; 
      $id=$val['id'];
	  $list=M("shoplist")->where("orderid='$id'")->select();
	  foreach($list as $k=> $vo){
	  /*退货中的商品id*/
		  $goodid=$vo['goodid'];
			$price=get_good_price($goodid);
          
			/*销售的商品件数*/
			$salenum+=$vo['num'];
			 /*销售的商品种类数*/
			$salecount+=1;
	  }


	   }
     }

        $this->assign('salecount',$salecount);
	    $this->assign('salenum',$salenum);
	    $this->assign('total',$total);

  /**
     * 本周退货金额、种类、数量计算
     */
     $data = M("backlist")->where("status='1'")->select();
  
        foreach ($data as $n=>$val) {
    /*格式时间戳为 201410240000*/
	 $dtime=$val['create_time'];
	  $d=date('YmdHis',$dtime);
     if($b>$d&&$d>$q){//当天
		  /*退货中的商品id*/
		  $goodid=$val['goodid'];
			$price=get_good_price($goodid);
			 /*退货中的商品总额*/
            $back+= $val['num'] * $price;
			/*退货中的商品件数*/
			$backnum+=$val['num'];
			 /*退货中的商品种类数*/
			$backcount+=1;
			}
        }
	   $this->assign('back',$back);
	   $this->assign('backcount',$backcount);
	   $this->assign('backnum',$backnum);
      /**
     * 本周换货金额、种类、数量计算
     */
    $data = M("exchange")->where("status='1'")->select();
      
        foreach ($data as $k=>$vo) {
	 $qtime=$vo['create_time'];
	 $f=date('YmdHis',$qtime);
     if($b>$f&&$f>$q){
		 /*换货中的商品总额*/
			$goodid=$vo['goodid'];
			$price=get_good_price($goodid);
             $change += $vo['num'] * $price;
          /*换货中的商品件数*/
			 $changenum+=$vo['num'];
			   /*换货中的商品种类数*/
			$changecount+=1;
			}
        }
	   $this->assign('change',$change);
	   $this->assign('changecount',$changecount);
	   $this->assign('changenum',$changenum);
 /**
     * 本周申请取消订单金额、种类、数量计算
     */
     $cdata = M("cancel")->where("status='1'")->select();
       foreach ($cdata as $k=>$val)
		{
    /*格式时间戳为 20141024*/
	 $cantime=$val['create_time'];
	  $s=date('YmdHis',$cantime);
     if($b>$s&&$s>$q){
	 //当天
			 /*取消订单的商品总额*/
            $cancel+= $val['cash'];
			/*取消订单的商品件数*/
			$cancelnum+=$val['num'];
			 /*取消订单的商品种类数*/
			$cancelcount+=$val['count'];
	 }
        }
	   $this->assign('cancel',$cancel);
	   $this->assign('cancelcount',$cancelcount);
	   $this->assign('cancelnum',$cancelnum);
       /*比率统计*/
     $percent_a=$total/($total+$back+$change+$cancel);
     $percent_b=$back/($total+$back+$change+$cancel);
	 $percent_c=$change/($total+$back+$change+$cancel);
     $percent_d=$cancel/($total+$back+$change+$cancel);
     $this->assign('a',$percent_a);
	  $this->assign('b',$percent_b); 
	  $this->assign('c',$percent_c);
	   $this->assign('d',$percent_d);
   /*利润*/
	$profits=$total-$back-$change-$cancel;
	$this->assign('profits',$profits);
	  /*保存数据到数据库*/
     $turnover=M("turnover");
     $data["sales"]=$total;
     $data["back"]=$back;
     $data["change"]=$change;
	  $data["cancel"]=$cancel;
	 $data["profits"]=$profits;
	 $user= session('user_auth');
	 $data["uid"]=$user["uid"];
	 $y=date('W',NOW_TIME);/*本年度的第几周*/
	 $data["info"]=$y;
     $t_time=$turnover->where("status='2'")->order("id desc")->limit(1)->getField("create_time");
     /*格式时间戳为 20141024*/
	 $r=date('W',$t_time);/*本年度的第几周*/
	 if($y==$r){
		 /*本周已统计过数据，保存，创建时间不变，更新时间变化*/
     $data["update_time"]=NOW_TIME;
	 $turnover->where("create_time='$t_time' and status='2'")->save($data);
	 }
  else{ 
	  /*未统计过数据，新增*/
   $data["status"]='2';
   $data["create_time"]=NOW_TIME;
   $data["update_time"]=NOW_TIME;
   $turnover->add($data);
  }
       $this->assign('title',$title); 
	   $this->display();
    }

 public function month(){  
	 $month=date('Y年m月',NOW_TIME);/*格式时间戳为 201410*/
 $this->assign('month',$month);
//date('w',$time); 取到的是星期几 0-6
//date('W',$time); 取到的是本年度的第几周 1-53

// php获取本月起始时间戳和结束时间戳
 
$beginThismonth=mktime(0,0,0,date('m'),1,date('Y'));
$endThismonth=mktime(23,59,59,date('m'),date('t'),date('Y'));
 
		$this->meta_title = '管理首页';
		$title="本月数据统计 ";
      $q=date('YmdHis',$beginThismonth);/*本月一零点格式时间戳为20141020000000*/
	  $b=date('YmdHis', $endThismonth);/*本月末格式时间戳为201410270000000*/
	
      /*本月销量统计*/ 
      $order=M("order")->where("total!=''")->select();
      foreach($order as $n=> $val){
      $time=$val['create_time'];
      $a=date('YmdHis',$time);/*格式时间戳为 20141020000*/

     if($b>$a&&$a>$q){//本月
		 /*商品销售额*/
       $salesmoney+=$val['total']; 
	    /*运费*/
       $trans+=$val['shipprice']; 
	   /*总销售额*/
	   $total+=$val['pricetotal']; 
      $id=$val['id'];
	  $list=M("shoplist")->where("orderid='$id'")->select();
	  foreach($list as $k=> $vo){
	  /*退货中的商品id*/
		  $goodid=$vo['goodid'];
			$price=get_good_price($goodid);
          
			/*销售的商品件数*/
			$salenum+=$vo['num'];
			 /*销售的商品种类数*/
			$salecount+=1;
	  }


	   }
     }

        $this->assign('salecount',$salecount);
	    $this->assign('salenum',$salenum);
	    $this->assign('total',$total);

  /**
     * 本月退货金额、种类、数量计算
     */
     $data = M("backlist")->where("status='1'")->select();
  
        foreach ($data as $n=>$val) {
    /*格式时间戳为 201410240000*/
	 $dtime=$val['create_time'];
	  $d=date('YmdHis',$dtime);
     if($b>$d&&$d>$q){//当天
		  /*退货中的商品id*/
		  $goodid=$val['goodid'];
			$price=get_good_price($goodid);
			 /*退货中的商品总额*/
            $back+= $val['num'] * $price;
			/*退货中的商品件数*/
			$backnum+=$val['num'];
			 /*退货中的商品种类数*/
			$backcount+=1;
			}
        }
	   $this->assign('back',$back);
	   $this->assign('backcount',$backcount);
	   $this->assign('backnum',$backnum);
      /**
     * 本月换货金额、种类、数量计算
     */
    $data = M("exchange")->where("status='1'")->select();
      
        foreach ($data as $k=>$vo) {
	 $qtime=$vo['create_time'];
	 $f=date('YmdHis',$qtime);
     if($b>$f&&$f>$q){
		 /*换货中的商品总额*/
			$goodid=$vo['goodid'];
			$price=get_good_price($goodid);
             $change += $vo['num'] * $price;
          /*换货中的商品件数*/
			 $changenum+=$vo['num'];
			   /*换货中的商品种类数*/
			$changecount+=1;
			}
        }
	   $this->assign('change',$change);
	   $this->assign('changecount',$changecount);
	   $this->assign('changenum',$changenum);
	   /**
     * 本月申请取消订单金额、种类、数量计算
     */
     $cdata = M("cancel")->where("status='1'")->select();
       foreach ($cdata as $k=>$val)
		{
    /*格式时间戳为 20141024*/
	 $cantime=$val['create_time'];
	  $s=date('YmdHis',$cantime);
     if($b>$s&&$s>$q){
	 //当天
			 /*取消订单的商品总额*/
            $cancel+= $val['cash'];
			/*取消订单的商品件数*/
			$cancelnum+=$val['num'];
			 /*取消订单的商品种类数*/
			$cancelcount+=$val['count'];
	 }
        }
	   $this->assign('cancel',$cancel);
	   $this->assign('cancelcount',$cancelcount);
	   $this->assign('cancelnum',$cancelnum);
       /*比率统计*/
    $percent_a=$total/($total+$back+$change+$cancel);
     $percent_b=$back/($total+$back+$change+$cancel);
	 $percent_c=$change/($total+$back+$change+$cancel);
      $percent_d=$cancel/($total+$back+$change+$cancel);
     $this->assign('a',$percent_a);
	  $this->assign('b',$percent_b); 
	  $this->assign('c',$percent_c);
	   $this->assign('d',$percent_d);
   /*利润*/
	$profits=$total-$back-$change-$cancel;
	$this->assign('profits',$profits);
	  /*保存数据到数据库*/
     $turnover=M("turnover");
     $data["sales"]=$total;
     $data["back"]=$back;
     $data["change"]=$change;
	  $data["cancel"]=$cancel;
	 $data["profits"]=$profits;
	 $user= session('user_auth');
	$data["uid"]=$user["uid"];
	 $t=date('Ym',NOW_TIME);/*格式时间戳为 201410*/
    $data["info"]=$t;
     $sqtime=$turnover->where("status='3'")->order("id desc")->limit(1)->getField("create_time");
     /*格式时间戳为 20141024*/
	 $r=date('Ym',$sqtime);/*格式时间戳为 20141024*/
	
	 if($t==$r){
		 /*当天已统计过数据，保存，创建时间不变，更新时间变化*/
     $data["update_time"]=NOW_TIME;
	 $turnover->where("create_time='$sqtime' and status='3'")->save($data);
	 }
  else{ 
	  /*未统计过数据，新增*/
$data["status"]='3';
   $data["create_time"]=NOW_TIME;
   $data["update_time"]=NOW_TIME;
   $turnover->add($data);
  }
       $this->assign('title',$title); 
	   $this->display();
    }

	
}
