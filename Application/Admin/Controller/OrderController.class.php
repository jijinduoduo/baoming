<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | author 烟消云散 <1010422715@qq.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 后台订单控制器
  * @author 烟消云散 <1010422715@qq.com>
 */
class OrderController extends AdminController {

    /**
     * 订单管理
     * author 烟消云散 <1010422715@qq.com>
     */
    public function index(){
        /* 查询条件初始化 */	
         $status=$_GET['status'];
		 if(isset($_GET['status'])){
		 switch ($status) {
			   case '0': 
				    
				     $meta_title="所有订单";
                break;
                case '1': 
				     $map['status']=$status;
				     $meta_title="已提交订单";
                break;
				case '2':
				      $map['status']=$status;
				      $meta_title="已发货订单";
                  break;
				

			   case '3': 
				     $map['status']=$status;
			         $meta_title="已签收订单";

                  break;
                
				}
         } 
		
		 else{
		    $status='';
		
	        $meta_title="所有订单";
		 }
        if(isset($_GET['title'])){
            $map['orderid']  = array('like', '%'.(string)I('title').'%');
        }
        if ( isset($_GET['time-start']) ) {
            $map['update_time'][] = array('egt',strtotime(I('time-start')));
        }
        if ( isset($_GET['time-end']) ) {
            $map['update_time'][] = array('elt',24*60*60 + strtotime(I('time-end')));
        }
        if ( isset($_GET['nickname']) ) {
            $map['uid'] = M('Member')->where(array('nickname'=>I('nickname')))->getField('uid');
        }
         $this->assign('status', $status);
	    $this->meta_title = $meta_title;
		  $list = $this->lists('Order', $map,'id desc');
        $this->assign('list', $list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
       
        $this->display();
    }
//导出excel
public function out(){    
        $xlsName  = CONTROLLER_NAME;      
        $Field='id,total_money,tag,orderid,ship_price,score,coupon_money,uid';
        if(isset($_GET['status'])){
            $map['status']  = array('like', '%'.(int)I('status').'%');
        }
		else{
		 $map['status']=array('gt',0);//有效订单
		}
		$xlsCell  = array(
            array('id','编号'),
            array('orderid','订单号'),
            array('tag','支付订单号'),
            array('total_money','实际金额'),
			array('ship_price','运费'),
            array('score','消耗积分'),
            array('coupon_money','消耗优惠券金额'),
            array('uid','用户uid')
        );
        $xlsModel = M($xlsName);
        $xlsData  = $xlsModel->where($map)->Field($Field)->select();      
		 if(!$xlsData){               
                    $this->error('无数据');
                }
		exportExcel($xlsName,$xlsCell,$xlsData); 
	}
    
public function out2(){  	
 $Field='id,pricetotal,orderid,shipprice,score,codeid';
 // 输出Excel文件头，可把user.csv换成你要的文件名
header('Content-Type: application/vnd.ms-excel');
header('Content-Disposition: attachment;filename="user.csv"');
header('Cache-Control: max-age=0');

// 从数据库中获取数据，为了节省内存，不要把数据一次性读到内存，从句柄中一行一行读即可
$sql = 'select * from tbl where ……';
$stmt =  M('order')->Field($Field)->limit(10)->select();;

// 打开PHP文件句柄，php://output 表示直接输出到浏览器
$fp = fopen('php://output', 'a');

// 输出Excel列名信息
$head = array('姓名', '性别', '年龄', 'Email', '电话', '……');
foreach ($head as $i => $v) {
// CSV的Excel支持GBK编码，一定要转换，否则乱码
$head[$i] = iconv('utf-8', 'gbk', $v);
}

// 将数据通过fputcsv写到文件句柄
fputcsv($fp, $head);

// 计数器
$cnt = 0;
// 每隔$limit行，刷新一下输出buffer，不要太大，也不要太小
$limit = 100000;

// 逐行取出数据，不浪费内存
while ($row = $stmt->fetch(Zend_Db::FETCH_NUM)) {

$cnt ++;
if ($limit == $cnt) { //刷新一下输出buffer，防止由于数据过多造成问题
ob_flush();
flush();
$cnt = 0;
}

foreach ($row as $i => $v) {
$row[$i] = iconv('utf-8', 'gbk', $v);
}
fputcsv($fp, $row);
} 
} 	
	/**
     * 新增订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function add(){
        if(IS_POST){
            $order = D('order');
           
           if(false !==$order->update()){
                
                    $this->success('新增成功', U('index'));
                } else {
                    $this->error('新增失败');
                }
            
        } else {
            $this->meta_title = '新增配置';
            $this->assign('info',null);
            $this->display();
        }
    }

    /**
     * 编辑订单
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function edit($id = 0){
           if(IS_POST){
			   $order = D('order');
           
           if(false !==$order->update()){
  
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败55'.$id);
                }
           
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('order')->find($id);
$detail= M('order')->where("id='$id'")->select();
$list=M('shoplist')->where("orderid='$id'")->select();
$addressid=M('order')->where("id='$id'")->getField("addressid");
 
 $trans=M("address")->where("id='$addressid'")->select();
  $this->assign('trans', $trans);
 $this->assign('alist', $address);
            if(false === $info){
                $this->error('获取订单信息错误');
            }
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			 $this->assign('a', $orderid);
            $this->meta_title = '编辑订单';
            $this->display();
        }
    }
  /**
     * 订单发货
     * @author 烟消云散 <1010422715@qq.com>
     */
    public function send($id = 0){
      
            if(IS_POST){
			   $order = D('order');
           
               if(false !==$order->update()){
                    //记录行为
                    action_log('update_order', 'order', $data['id'], UID);
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
            
        } else {
            $info = array();
            /* 获取数据 */
            $info = M('order')->find($id);
$detail= M('order')->where("id='$id'")->select();
$list=M('shoplist')->where("orderid='$id'")->select();
$addressid=M('order')->where("id='$id'")->getField("addressid");
 $trans=M("address")->where("id='$addressid'")->select();
  $this->assign('trans', $trans);
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			 
            $this->meta_title = '订单发货';
            $this->display();
        }
    }

   public function complete($id = 0){
        if(IS_POST){
             $order = D('order');       
               if(false !==$order->update()){
                    //记录行为
                    action_log('update_order', 'order', $data['id'], UID);
                    $this->success('更新成功', Cookie('__forward__'));
                } else {
                    $this->error('更新失败'.$id);
                }
           
 } 
		
		else {
            $info = array();
            /* 获取数据 */
            $info = M('order')->find($id);
$detail= M('order')->where("id='$id'")->select();
$list=M('shoplist')->where("orderid='$id'")->select();
 $addressid=M('order')->where("id='$id'")->getField("addressid");
 
 $trans=M("address")->where("id='$addressid'")->select();
  $this->assign('trans', $trans);
            if(false === $info){
                $this->error('获取订单信息错误');
            }
$this->assign('list', $list);
            $this->assign('detail', $detail);
			 $this->assign('info', $info);
			
            $this->meta_title = '订单发货';
            $this->display();
        }
    }


   /**
     * 删除订单
     * @author yangweijie <yangweijiester@gmail.com>
     */
    public function del(){
       if(IS_POST){
             $ids = I('post.id');
            $order = M("order");
			
            if(is_array($ids)){
                             foreach($ids as $id){
		
                             $order->where("id='$id'")->delete();
							 $shop=M("shoplist");
							 $shop->where("orderid='$id'")->delete(); 
                }
            }
           $this->success("删除成功！");
        }else{
            $id = I('get.id');
            $db = M("order");
            $status = $db->where("id='$id'")->delete();
            if ($status){
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        } 
    }




}