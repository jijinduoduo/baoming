<?php
namespace Home\Controller;
use Think\Controller;
class PayController extends HomeController {

	public function index() {
		
		if (IS_POST) {
		//页面上通过表单选择在线支付类型，支付宝为alipay 财付通为tenpay
		        /* 支付设置 */
	        $payment= array(
				'tenpay' => array(
					// 加密key，开通财付通账户后给予
					'key' =>  C('TENPAYKEY'),
					// 合作者ID，财付通有该配置，开通财付通账户后给予
					'partner' => C('TENPAYPARTNER')
				),
				'alipay' => array(
					// 收款账号邮箱
					'email' =>C('ALIPAYEMAIL'),
					// 加密key，开通支付宝账户后给予
					'key' => C('ALIPAYKEY'),
					// 合作者ID，支付宝有该配置，开通易宝账户后给予
					'partner' => C('ALIPAYPARTNER')
				),
				'palpay' => array(
					'business' =>  C('PALPAYPARTNER')
				),
				'yeepay' => array(
					'key' =>  C('YEEPAYPARTNER'),
					'partner' =>  C('YEEPAYKEY')
				),
				'kuaiqian' => array(
					'key' =>  C('KUAIQIANPARTNER'),
					'partner' =>  C('KUAIQIANKEY')
				),
				'unionpay' => array(
					'key' =>  C('UNIONPARTNER'),
					'partner' =>  C('UNIONKEY')
				)
			);
		
            $paytype = safe_replace(I('post.paytype'));
			
            $pay = new \Think\Pay($paytype, $payment[$paytype]);
			if(!empty($_POST['orderid'])){
				$_SESSION['tag'] = $_POST['orderid'];
				 $order_no=safe_replace(I('post.orderid'));
				 $data=M("ac_uinfo")->where("tag='$order_no'")->find();
				 $tid = $data['tid'];
				 $info=M("ac")->field('price')->where("id='$tid'")->find();
				 $money=$info['price'];	
				 $body= C('SITENAME')."订单支付";//商品描述
				 $title=C('SITENAME')."订单支付";//设置商品名称
			}
		
			$vo = new \Think\Pay\PayVo();
			$vo->setBody($body)
				->setFee($money) //支付金额
				->setOrderNo($order_no)//订单号
				->setTitle($title)//设置商品名称
				->setCallback("Home/Pay/success")/*** 设置支付完成后的后续操作接口 */
				->setUrl(U("Home/Pay/over")) /* 设置支付完成后的跳转地址*/
				->setParam(array('order_id' => $order_no));
			echo $pay->buildRequestForm($vo);
		}
		else {
		
			$this->meta_title = '支付订单';
			//在此之前goods1的业务订单已经生成，状态为等待支付
			$id=safe_replace(I("get.orderid"));
			$order=D("order");
			$this->assign('codeid',$id);
			$total=$order->where("orderid='$id'")->getField('total_money');
			$this->assign('goodprice',$total);
			$this->display();
		}
	}

		/**
		* 订单支付成功
		* @param type $money
		* @param type $param
		*/
	public function success($money, $param) {
		if (session("pay_verify") == true) {
			 session("pay_verify", null);
			//处理订单
			$data = array('status'=>'1','ispay'=>'2');//订单已经支付,状态为已提交
			M('order')->where(array('tag' => $param['order_id']))->setField($data);
			// 发送邮件
			$uid=M("pay")->where(array('out_trade_no' => $param['order_id']))->getField('uid');
			$mail=get_email($uid);//获取会员邮箱
			$title="支付提醒";
			$content="您在<a href=\"".C('DAMAIN')."\" target='_blank'>".C('SITENAME').'</a>支付了订单，交易号'.$param['order_id'];
			if(C('MAIL_PASSWORD')){
				SendMail($mail,$title,$content);
			}
	    }
	    else {
		  E("Access Denied");
	    }
	}
	public function over() {
		$this->meta_title = '支付成功';
		
		//支付成功后改变状态为已付款
		$ac_uinfo = M('ac_uinfo');
		$data['ispay'] = 1;
		$data['paytime'] = time();
		$where['tag'] = $_SESSION['tag'];
		$data1 = $ac_uinfo->field('tid')->where($where)->find();
		$res = $ac_uinfo->where($where)->save($data);
		echo $ac_uinfo->getLastSql();
		//var_dump($res);die;
		//$this->success(U('Baoming/chenggong','id='.$data['tid']));
		//$this->redirect('Baoming/chenggong', array('id' => $data['tid']), 1);
		header("Location: http://b.bjxxw.com/index.php?s=/Home/Baoming/chenggong/id/".$data1['tid']);
		//$this->display('Baoming/chenggong');
	}
	
	public function zhifu()
	{
		$this->display();
	}

}
