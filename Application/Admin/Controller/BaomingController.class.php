<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Admin\Controller;
use Think\Controller;
use Admin\Model\AuthRuleModel;
use Admin\Model\AuthGroupModel;
/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class BaomingController extends Controller {

    /**
     * 后台控制器初始化
     */
    protected function _initialize(){
        // 获取当前用户ID
        if(defined('UID')) return ;
        define('UID',is_login());
        if( !UID ){// 还没登录 跳转到登录页面
            $this->redirect('Public/login');
        }
        /* 读取数据库中的配置 */
        $config =   S('DB_CONFIG_DATA');
        if(!$config){
            $config =   api('Config/lists');
            S('DB_CONFIG_DATA',$config);
        }
        C($config); //添加配置

        // 是否是超级管理员
        define('IS_ROOT',   is_administrator());
        if(!IS_ROOT && C('ADMIN_ALLOW_IP')){
            // 检查IP地址访问
            if(!in_array(get_client_ip(),explode(',',C('ADMIN_ALLOW_IP')))){
                $this->error('403:禁止访问');
            }
        }
        // 检测访问权限
        $access =   $this->accessControl();
        if ( $access === false ) {
            $this->error('403:禁止访问');
        }elseif( $access === null ){
            $dynamic        =   $this->checkDynamic();//检测分类栏目有关的各项动态权限
            if( $dynamic === null ){
                //检测非动态权限
                $rule  = strtolower(MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME);
                if ( !$this->checkRule($rule,array('in','1,2')) ){
                    $this->error('未授权访问!');
                }
            }elseif( $dynamic === false ){
                $this->error('未授权访问!');
            }
        }
        $this->assign('__MENU__', $this->getMenus());
    }

    /**
     * 权限检测
     * @param string  $rule    检测的规则
     * @param string  $mode    check模式
     * @return boolean
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function checkRule($rule, $type=AuthRuleModel::RULE_URL, $mode='url'){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        static $Auth    =   null;
        if (!$Auth) {
            $Auth       =   new \Think\Auth();
        }
        if(!$Auth->check($rule,UID,$type,$mode)){
            return false;
        }
        return true;
    }

    /**
     * 检测是否是需要动态判断的权限
     * @return boolean|null
     *      返回true则表示当前访问有权限
     *      返回false则表示当前访问无权限
     *      返回null，则会进入checkRule根据节点授权判断权限
     *
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    protected function checkDynamic(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        return null;//不明,需checkRule
    }


    /**
     * action访问控制,在 **登陆成功** 后执行的第一项权限检测任务
     *
     * @return boolean|null  返回值必须使用 `===` 进行判断
     *
     *   返回 **false**, 不允许任何人访问(超管除外)
     *   返回 **true**, 允许任何管理员访问,无需执行节点权限检测
     *   返回 **null**, 需要继续执行节点权限检测决定是否允许访问
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final protected function accessControl(){
        if(IS_ROOT){
            return true;//管理员允许访问任何页面
        }
        $allow = C('ALLOW_VISIT');
        $deny  = C('DENY_VISIT');
        $check = strtolower(CONTROLLER_NAME.'/'.ACTION_NAME);
        if ( !empty($deny)  && in_array_case($check,$deny) ) {
            return false;//非超管禁止访问deny中的方法
        }
        if ( !empty($allow) && in_array_case($check,$allow) ) {
            return true;
        }
        return null;//需要检测节点权限
    }

    /**
     * 对数据表中的单行或多行记录执行修改 GET参数id为数字或逗号分隔的数字
     *
     * @param string $model 模型名称,供M函数使用的参数
     * @param array  $data  修改的数据
     * @param array  $where 查询时的where()方法的参数
     * @param array  $msg   执行正确和错误的消息 array('success'=>'','error'=>'', 'url'=>'','ajax'=>false)
     *                     url为跳转页面,ajax是否ajax方式(数字则为倒数计时秒数)
     *
     * @author 朱亚杰  <zhuyajie@topthink.net>
     */
    final protected function editRow ( $model ,$data, $where , $msg ){
        $id    = array_unique((array)I('id',0));
        $id    = is_array($id) ? implode(',',$id) : $id;
        //如存在id字段，则加入该条件
        $fields = M($model)->getDbFields();
        if(in_array('id',$fields) && !empty($id)){
            $where = array_merge( array('id' => array('in', $id )) ,(array)$where );
        }

        $msg   = array_merge( array( 'success'=>'操作成功！', 'error'=>'操作失败！', 'url'=>'' ,'ajax'=>IS_AJAX) , (array)$msg );
        if( M($model)->where($where)->save($data)!==false ) {
            $this->success($msg['success'],$msg['url'],$msg['ajax']);
        }else{
            $this->error($msg['error'],$msg['url'],$msg['ajax']);
        }
    }

 

   
    /**
     * 获取控制器菜单数组,二级菜单元素位于一级菜单的'_child'元素中
     * @author 朱亚杰  <xcoolcc@gmail.com>
     */
    final public function getMenus($controller=CONTROLLER_NAME){
        $menus  =   session('ADMIN_MENU_LIST'.$controller);
        if(empty($menus)){
            // 获取主菜单
            $where['pid']   =   0;
            $where['hide']  =   0;
            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                $where['is_dev']    =   0;
            }
            $menus['main']  =   M('Menu')->where($where)->order('sort asc')->field('id,title,url')->select();
            $menus['child'] =   array(); //设置子节点
            foreach ($menus['main'] as $key => $item) {
                // 判断主菜单权限
                if ( !IS_ROOT && !$this->checkRule(strtolower(MODULE_NAME.'/'.$item['url']),AuthRuleModel::RULE_MAIN,null) ) {
                    unset($menus['main'][$key]);
                    continue;//继续循环
                }
                if(strtolower(CONTROLLER_NAME.'/'.ACTION_NAME)  == strtolower($item['url'])){
                    $menus['main'][$key]['class']='current';
                }
            }

            // 查找当前子菜单
            $pid = M('Menu')->where("pid !=0 AND url like '%{$controller}/".ACTION_NAME."%'")->getField('pid');
            if($pid){
                // 查找当前主菜单
                $nav =  M('Menu')->find($pid);
                if($nav['pid']){
                    $nav    =   M('Menu')->find($nav['pid']);
                }
                foreach ($menus['main'] as $key => $item) {
                    // 获取当前主菜单的子菜单项
                    if($item['id'] == $nav['id']){
                        $menus['main'][$key]['class']='current';
                        //生成child树
                        $groups = M('Menu')->where(array('group'=>array('neq',''),'pid' =>$item['id']))->distinct(true)->getField("group",true);
                        //获取二级分类的合法url
                        $where          =   array();
                        $where['pid']   =   $item['id'];
                        $where['hide']  =   0;
                        if(!C('DEVELOP_MODE')){ // 是否开发者模式
                            $where['is_dev']    =   0;
                        }
                        $second_urls = M('Menu')->where($where)->getField('id,url');

                        if(!IS_ROOT){
                            // 检测菜单权限
                            $to_check_urls = array();
                            foreach ($second_urls as $key=>$to_check_url) {
                                if( stripos($to_check_url,MODULE_NAME)!==0 ){
                                    $rule = MODULE_NAME.'/'.$to_check_url;
                                }else{
                                    $rule = $to_check_url;
                                }
                                if($this->checkRule($rule, AuthRuleModel::RULE_URL,null))
                                    $to_check_urls[] = $to_check_url;
                            }
                        }
                        // 按照分组生成子菜单树
                        foreach ($groups as $g) {
                            $map = array('group'=>$g);
                            if(isset($to_check_urls)){
                                if(empty($to_check_urls)){
                                    // 没有任何权限
                                    continue;
                                }else{
                                    $map['url'] = array('in', $to_check_urls);
                                }
                            }
                            $map['pid']     =   $item['id'];
                            $map['hide']    =   0;
                            if(!C('DEVELOP_MODE')){ // 是否开发者模式
                                $map['is_dev']  =   0;
                            }
                            $menuList = M('Menu')->where($map)->field('id,pid,title,url,tip')->order('sort asc')->select();
                            $menus['child'][$g] = list_to_tree($menuList, 'id', 'pid', 'operater', $item['id']);
                        }
                    }
                }
            }
            session('ADMIN_MENU_LIST'.$controller,$menus);
        }
        return $menus;
    }

    /**
     * 返回后台节点数据
     * @param boolean $tree    是否返回多维数组结构(生成菜单时用到),为false返回一维数组(生成权限节点时用到)
     * @retrun array
     *
     * 注意,返回的主菜单节点数组中有'controller'元素,以供区分子节点和主节点
     *
     * @author 朱亚杰 <xcoolcc@gmail.com>
     */
    final protected function returnNodes($tree = true){
        static $tree_nodes = array();
        if ( $tree && !empty($tree_nodes[(int)$tree]) ) {
            return $tree_nodes[$tree];
        }
        if((int)$tree){
            $list = M('Menu')->field('id,pid,title,url,tip,hide')->order('sort asc')->select();
            foreach ($list as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $list[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
            $nodes = list_to_tree($list,$pk='id',$pid='pid',$child='operator',$root=0);
            foreach ($nodes as $key => $value) {
                if(!empty($value['operator'])){
                    $nodes[$key]['child'] = $value['operator'];
                    unset($nodes[$key]['operator']);
                }
            }
        }else{
            $nodes = M('Menu')->field('title,url,tip,pid')->order('sort asc')->select();
            foreach ($nodes as $key => $value) {
                if( stripos($value['url'],MODULE_NAME)!==0 ){
                    $nodes[$key]['url'] = MODULE_NAME.'/'.$value['url'];
                }
            }
        }
        $tree_nodes[(int)$tree]   = $nodes;
        return $nodes;
    }


    /**
     * 通用分页列表数据集获取方法
     *
     *  可以通过url参数传递where条件,例如:  index.html?name=asdfasdfasdfddds
     *  可以通过url空值排序字段和方式,例如: index.html?_field=id&_order=asc
     *  可以通过url参数r指定每页数据条数,例如: index.html?r=5
     *
     * @param sting|Model  $model   模型名或模型实例
     * @param array        $where   where查询条件(优先级: $where>$_REQUEST>模型设定)
     * @param array|string $order   排序条件,传入null时使用sql默认排序或模型属性(优先级最高);
     *                              请求参数中如果指定了_order和_field则据此排序(优先级第二);
     *                              否则使用$order参数(如果$order参数,且模型也没有设定过order,则取主键降序);
     *
     * @param array        $base    基本的查询条件
     * @param boolean      $field   单表模型用不到该参数,要用在多表join时为field()方法指定参数
     * @author 朱亚杰 <xcoolcc@gmail.com>
     *
     * @return array|false
     * 返回数据集
     */
    protected function lists ($model,$where=array(),$order='',$field=true){
        $options    =   array();
        $REQUEST    =   (array)I('request.');
        if(is_string($model)){
            $model  =   M($model);
        }

        $OPT        =   new \ReflectionProperty($model,'options');
        $OPT->setAccessible(true);

        $pk         =   $model->getPk();
        if($order===null){
            //order置空
        }else if ( isset($REQUEST['_order']) && isset($REQUEST['_field']) && in_array(strtolower($REQUEST['_order']),array('desc','asc')) ) {
            $options['order'] = '`'.$REQUEST['_field'].'` '.$REQUEST['_order'];
        }elseif( $order==='' && empty($options['order']) && !empty($pk) ){
            $options['order'] = $pk.' desc';
        }elseif($order){
            $options['order'] = $order;
        }
        unset($REQUEST['_order'],$REQUEST['_field']);

        if(empty($where)){
            $where  =   array('status'=>array('egt',0));
        }
        if( !empty($where)){
            $options['where']   =   $where;
        }
        $options      =   array_merge( (array)$OPT->getValue($model), $options );
        $total        =   $model->where($options['where'])->count();

        if( isset($REQUEST['r']) ){
            $listRows = (int)$REQUEST['r'];
        }else{
            $listRows = C('LIST_ROWS') > 0 ? C('LIST_ROWS') : 10;
        }
        $page = new \Think\Page($total, $listRows, $REQUEST);
        if($total>$listRows){
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        }
        $p =$page->show();
        $this->assign('_page', $p? $p: '');
        $this->assign('_total',$total);
        $options['limit'] = $page->firstRow.','.$page->listRows;

        $model->setProperty('options',$options);

        return $model->field($field)->select();
    }

    /**
     * 处理文档列表显示
     * @param array $list 列表数据
     * @param integer $model_id 模型id
     */
    protected function parseDocumentList($list,$model_id=null){
        $attrList = get_model_attribute($model_id ? $model_id : 1,false,'id,name,type,extra');
        // 对列表数据进行显示处理
        if(is_array($list)){
            foreach ($list as $k=>$data){
                foreach($data as $key=>$val){
                    if(isset($attrList[$key])){
                        $extra      =   $attrList[$key]['extra'];
                        $type       =   $attrList[$key]['type'];
                        if('select'== $type || 'checkbox' == $type || 'radio' == $type || 'bool' == $type) {
                            // 枚举/多选/单选/布尔型
                            $options    =   parse_field_attr($extra);
                            if($options && array_key_exists($val,$options)) {
                                $data[$key]    =   $options[$val];
                            }                        
                        }elseif('date'==$type){ // 日期型
                            $data[$key]    =   date('Y-m-d',$val);
                        }elseif('datetime' == $type){ // 时间型
                            $data[$key]    =   date('Y-m-d H:i',$val);
                        }
                    }
                }
                $list[$k]   =   $data;
            }
        }
        return $list;
    }
	
	
	/*
	 *首页部分
	 *
	 */
	public function index(){
		//实例化model类
		$ac = M('ac');
		$_GET['p'] = $_GET['p']?$_GET['p']:1;
		if(is_login() != 1){
			$owner = ' and owner='.is_login();
		}
		//根据id查询数据
		$data = $ac->field('id,title,see,total,status')->where('status>0'.$owner)->page($_GET['p'].',5')->select();
		//分配变量
		$this->assign('data',$data);
		$count = $ac->where('status>0'.$owner)->count();
		$Page = new \Think\Page($count,5);
		$show = $Page->show();
		$this->assign('page',$show);
		
		
		
		//获取当天报名人数
		$ac_uinfo = M('ac_uinfo');
		$today = strtotime(date('Y-m-d'));
		$nextday = strtotime(date('Y-m-d',strtotime('+1 day')));
		$number = $ac_uinfo->query("select count(id) as number from baoming_ac_uinfo where baotime>$today and baotime<$nextday".$owner);
		$this->assign('number',$number);
		
		$owners = ' and a.owner='.is_login();
		//获取当天付款金额
		$zonghe = $ac_uinfo->query("select sum(b.price) as zonghe from baoming_ac_uinfo a left join baoming_ac b on a.tid=b.id where a.paytime>$today and a.paytime<$nextday and a.ispay=1 ".$owners);
		//var_dump($zonghe);
		$this->assign('zonghe',$zonghe);
		
		//获取待审核人数
		$number1 = $ac_uinfo->query("select count(id) as numbers from baoming_ac_uinfo where ispass=0 ".$owner);
		$this->assign('number1',$number1);
		
		$this->display();
	}
	
	public function shuju()
	{
		//实例化model类
		$ac_uinfo = M('ac_uinfo');
		$ac = M('ac');
		$_GET['p'] = $_GET['p']?$_GET['p']:1;
		
		//项目条件
		$where['tid'] = $_GET['tid']?$_GET['tid']: ' ';
		
		//状态条件
		$where['status'] = $_GET['status']?$_GET['status']:0;
		
		//搜索条件
		//$where['search'] = $_POST['search']?' and (B.name like "%'.$_POST['search'].'%" or B.phone like "%'.$_POST['search'].'%)"':'';
		$where['search'] = $_POST['search']?' and B.name like "%'.$_POST['search'].'%" ':'';
		
		//所属条件
		if(is_login() != 1){
			$owner = ' and owner='.is_login();
			$owners = ' and A.owner='.is_login();
		}		
		if($_GET['tid']){
			$urls='A.status='.$where['status'].' and A.tid='.$where['tid'].$where['search'];
			//$urlss='status='.$where['status'].' and tid='.$where['tid'].$where['search'];
		}else{
			$urls='A.status='.$where['status'].$where['search'];
			//$urlss='status='.$where['status'].$where['search'];
		}
		//var_dump($urls);die;
		//查询数据
		//$data = $ac_uinfo->query('select a.*,b.path,c.price from (baoming_ac_uinfo a left join baoming_ac_user b on a.uid=b.id) left join baoming_ac c on a.tid=c.id where a.status=0');
		$data = $ac_uinfo->table('baoming_ac_uinfo A')->field('A.*,B.path,C.price')->where('C.status>0 and '.$urls.$owners)->join('baoming_ac_user B on A.uid = B.id')->join('baoming_ac C on A.tid=C.id')->page($_GET['p'].',5')->select();
		$this->assign('data0',$data);
		//var_dump($data);die;
		//分页部分
		//$count = $ac_uinfo->where($urlss)->count();
		$count = $ac_uinfo->table('baoming_ac_uinfo A')->field('A.*,B.path,C.price')->where('C.status>0 and '.$urls.$owners)->join('baoming_ac_user B on A.uid = B.id')->join('baoming_ac C on A.tid=C.id')->count();
		$Page = new \Think\Page($count,5);
		$show = $Page->show();
		$this->assign('page',$show);
		
		//查所有项目名称和id,数据部分菜单栏
		$data1 = $ac->field('id,title')->where('status>0'.$owner)->select();
		
		$this->assign('data1',$data1);
		
		//传递当前页类别数据
		$this->assign('tid',$where['tid']);
		
		$this->display();
	}
	
	public function admin(){
		//实例化model类
		$ac = M('ac');
		
		//根据id查询数据
		$data = $ac->where($_GET)->select();
		
		//输出数据
		$this->assign('data',$data);
		//var_dump($data);die;
		$this->display();
	}
	//添加项目
	public function add_title()
	{
		//实例化model类
		$ac = M('ac');
		$_POST['owner'] = is_login();
		//存入数据库
		$res = $ac->add($_POST);
		
		//判断
		if($res){
			echo json_encode($res);
		}else{
			echo json_encode('失败！');
		}
		
		//成功后将id值存入到session中
		$_SESSION['tid'] = $res;	
		
	}
	
	//编辑项目
	public function updata()
	{
		
		//实例化model类
		$ac = M('ac');
		
		//存入数据库
		$res = $ac->save($_POST);
		
		//判断
		if($res){
			echo json_encode('成功！');
		}else{
			echo json_encode('失败！');
		}
	}
	
	
	public function get_title()
	{
		//实例化model类
		$ac = M('ac');
		
		//根据id查询数据
		$data = $ac->where($_POST)->select();
		
		//输出数据
		echo json_encode($data);
		
		
	}
	public function get_body(){
		//实例化model类
		$ac = M('ac');
		
		//根据id查询数据
		$data = $ac->where($_POST)->select();
		
		
		
		echo json_encode($data);
	}
	
	public function add_body(){
		//实例化model类
		$ac = M('ac');
		//echo json_encode($_POST);die;
		//保存数据
		$where['id'] = $_POST['id'];
		$data['body'] = json_encode($_POST['data']);
		$data['ziduan'] = json_encode($_POST['ziduan']);
		//echo json_encode($_POST['ziduan']);die;
		$res = $ac->where($where)->save($data);
		if($res){
			echo json_encode('成功！');
		}else{
			echo json_encode('失败！');
		}
		
	}
	
	
	public function add_success()
	{
		//实例化model类
		$ac = M('ac');
		//echo json_encode($_POST);die;
		//保存数据
		$where['id'] = $_POST['id'];
		$data['success'] = json_encode($_POST['data']);
		//echo json_encode($_POST);die;
		$res = $ac->where($where)->save($data);
		if($res){
			echo json_encode('成功！');
		}else{
			echo json_encode('失败！');
		}
	}
	
	public function delete()
	{
		//实例化model类
		$ac = M('ac');

		$data['status'] = 0;
		//根据id改变其状态为0
		$res = $ac->where($_GET)->save($data);
		if($res){
			//$this->success('删除成功！',U('Baoming/index'));
			echo json_encode('删除成功！');
		}else{
			//$this->error('删除失败！');
			echo json_encode('删除失败！');
		}
	}
	
	/*
	 *改变首页项目状态
	 *
	 */
	public function change()
	{
		//实例化model类
		$ac = M('ac');
		//查询当前状态
		$status['status'] = $_POST['status'];
		$id = $_POST['id'];
		//判断 如果是1改为2，如果是2改为1
		if($status['status']==1){
			$data['status'] = 2;
			//根据id改变其状态为0
			$res = $ac->where('id='.$id)->save($data);
			if($res){
				echo json_encode(2);
			}else{
				echo json_encode('操作失败！！');
			}
		}else{
			$data['status'] = 1;
			//根据id改变其状态为0
			$res = $ac->where('id='.$id)->save($data);
			if($res){
				echo json_encode(1);
			}else{
				echo json_encode('操作失败！');
			}
		}
		
	}
	
	//数据也批量删除与单个删除操作
	public function clean()
	{
		$ac_uinfo = M('ac_uinfo');
		
		$where = "(".implode(',',$_POST['data']).")";
		//根据id改变其状态为0
		
		$data['status'] = -2;
		//$res = $ac_uinfo->query("update baoming_ac_uinfo set status=-2 where id=1");
		$res = $ac_uinfo->where("id in $where")->save($data);
		//echo json_encode($ac_uinfo->getLastSql());die;
		if($res){
			echo json_encode('删除成功！');
		}else{
			echo json_encode('删除失败！');
		} 
		 
	}
	
	//审核
	public function shenhe()
	{
		$where = "(".implode(',',$_POST['id']).")";
		
		$ac_uinfo = M('ac_uinfo');
		$data['status'] = $_POST['status'];
		$content = '【北京信息网】'.$_POST['text'];
		$num = count($_POST['id']);
		$res = $ac_uinfo->where("id in $where")->save($data);
		if($res){
			echo json_encode('成功！');
			for($i=0;$i<$num;$i++){
				$ms = $ac_uinfo->field('data')->where('id='.$_POST['id'][$i])->find();
				$phone = json_decode($ms['data'])->data;
				$phone = json_decode($ms['data']);
				//$this->msg($phone[2],$content);
			}	
		}else{
			echo json_encode('失败！');
		}
		//echo json_encode($res);
		/*
		for($i=0;$i<$num;$i++){
			$res = $ac_uinfo->where('id='.$_POST['id'][$i])->save($data);
			if($res){
				
				$ms = $ac_uinfo->field('data')->where('id='.$_POST['id'][$i])->find();
				$phone = json_decode($ms['data'])->data;
				//$phone = json_decode($ms['data']);
				//$this->msg($phone[2],$content);
				echo json_encode('成功！');
			}else{
				echo json_encode('失败！');
			}
		} */
	}
	
		 // 执行发送短信
    public function msg($phone,$content)
    {
    	/*
			第一步：开启curl扩展：php.ini中开启extension=php.curl.dll
			第二部：将Sms文件夹导入到Thinkphp/Library/Org下面
			第三部：接收用户的手机号码，执行发送
    	*/
   
    	// 3.执行发送(短信发送需要借助于curl扩展，php.ini配置文件中开启extension=php_curl.dll扩展)
    	$sms = new \Org\Sms\SmsBao('bjxxw123','bjxxw888');
    	$result = $sms->sendSms($phone, $content);
		//var_dump(session($yzm));
    	// 4.直接返回给客户端消息
    	//$this->ajaxReturn($result);
    }
	
	/*
	 *详情页部分
	 *
	 */
	 
	public function xq()
	{	
		//实例化model类
		$ac = M('ac');
		$ac_uinfo = M('ac_uinfo');
		//$_GET['id'] = 71;
		
		//查询数据
		$data = $ac_uinfo->field('id,tid,data')->where('id='.$_GET['id'])->find();
		
		$datas = json_decode($data['data']);
		$arr = array();
		foreach($datas as $k=>$v){
			if(is_array($v)){
				$arr = array_merge($arr,$v);
			}else{
				if($k != 'yzm'){
					$arr[] = $v;
				}
			}
		}
		//var_dump($arr);die;
		$arr[0] = $data['id'];
		
		
		//查询该项目的所有字段
		$ziduan = $ac->field('ziduan')->where('id='.$data['tid'])->find();
	
		//var_dump($ziduan);
		$ziduan = json_decode($ziduan['ziduan']);
		array_unshift($ziduan,"编号","姓名", "手机号");
		$ziduan = array_unique($ziduan);
		$number = count($ziduan);
		//var_dump($ziduan);die;
		
		$this->assign('number',$number);
		$this->assign('datas',$arr);
		$this->assign('ziduan',$ziduan);
		$this->display();
	}
	 
	//导出数据到exce文件
	 public function ExcelOut()
    {
    	/*
			将数据库中的数据导出到excel表格中
			1.先获取user数据表中的数据
			2.借助PHPExcel类将获取到数据信息写入到excel表格中
				先写入行，通过行写入到列
    	*/
		// 1.查询数据
		
		//实例化model类
		$ac = M('ac');
		$ac_uinfo = M('ac_uinfo');
		//$_GET['id'] = 163;
		if(!$_GET['tid']){
			$this->error('请选择一个项目');die;
		}
		
		//所属条件
		if(is_login() != 1){
			$owner = ' and owner='.is_login();
		}
		
		//查询数据
		$data = $ac_uinfo->field('id,tid,data,ispay')->where('status>-1 and tid='.$_GET['tid'].$owner)->select();
		//查询该项目的所有字段
		$ziduan = $ac->field('ziduan,title')->where('id='.$_GET['tid'].$owner)->find();
		$title = $ziduan['title'];
		
		$ziduan = json_decode($ziduan['ziduan']);
		array_unshift($ziduan,"编号","姓名", "手机号");
		array_push($ziduan,'付费');
		$ziduan = array_unique($ziduan);
		// 2.执行excel的导出
		/**
		 * ExcelOut()Excel导出函数
		 * @param array $data 需要导出的数据
		 * @param array $cn   输出的第一行中文字段信息  ['编号','姓名','年龄']
		 * @param array $en   数据表对应的字段信息    ['id','username','age']
		 * @param string $title   输出表格的中文标题
		 * @return 输出表格
		 */
		$cn = $ziduan;
		$en = '';
		//$title = $ziduan['title'];
		ExcelOut($data, $cn, $en, $title);
    }
	
	/*
	 *图片下载
	 */
	public function get_img()
	{
		//获取要下载的用户信息及图片路径
		if(!$_GET['tid']){
			$this->error('请选择一个项目');die;
		}else{
			$id = $_GET['tid'];
		}
		//实例化model类
		$ac_user = M('ac_user');
		//$ac_uinfo = M('ac_uinfo');
		$ac = M('ac');
		//查询数据
		$data = $ac_user->query("select * from baoming_ac_user where id in (select uid from baoming_ac_uinfo where tid=$id)");
		$title = $ac->field('title')->where('id='.$id)->find();
		//var_dump($title);die;
		//获取列表
		$filename = "./".$title['title'].".zip"; //最终生成的文件名（含路径）   
		if(!file_exists($filename)){   
		//重新生成文件 
		
		$zip = new \ZipArchive();//使用本类，linux需开启zlib，windows需取消php_zip.dll前的注释   
		if ($zip->open($filename, \ZIPARCHIVE::CREATE)!==TRUE) {   
			exit('无法打开文件，或者文件创建失败');
		} 
		//var_dump($data);die;
		foreach( $data as $val){   
			if(file_exists($val['path'])){  
				$hz = '.'.substr(strrchr($val['path'], '.'), 1);
				$zip->addFile( $val['path'], $val['name']."\n".$val['phone'].$hz);//第二个参数是放在压缩包中的文件名称，如果文件可能会有重复，就需要注意一下   
			}   
		}   
		$zip->close();//关闭   
		} 
		//echo 'bbb';die;
		if(!file_exists($filename)){   
			exit("无法找到文件"); //即使创建，仍有可能失败。。。。   
		}   
		header("Cache-Control: public"); 
		header("Content-Description: File Transfer"); 
		header('Content-disposition: attachment; filename='.basename($filename)); //文件名   
		header("Content-Type: application/zip"); //zip格式的   
		header("Content-Transfer-Encoding: binary"); //告诉浏览器，这是二进制文件    
		header('Content-Length: '. filesize($filename)); //告诉浏览器，文件大小   
		@readfile($filename);
		@unlink($filename);
	}
	 
	 
	
	/**
	 * Excel导入函数
	 * @param string $filename Excel文件名
	 * @param array $words 栏目的英文单词
	 * @param array $fields 数据表的字段值
	 * @return array 返回需要添加到数据库的数据
	 */
	function ExcelIn($filename, $words, $fields)
	{
		// 1.引入外部插件
		vendor('PHPExcel.PHPExcel');
		vendor('PHPExcel.PHPExcel.Writer.Excel2007');
		vendor('PHPExcel.PHPExcel.Writer.Excel5');

		// 2.创建excel对象，并读取文件是否合法
		/**默认用excel2007读取excel，若格式不对，则用之前的版本进行读取*/
		$PHPReader = new \PHPExcel_Reader_Excel2007();

		if(!$PHPReader->canRead($filename)){
			$PHPReader = new \PHPExcel_Reader_Excel5();
			if(!$PHPReader->canRead($filename)){
				exit('文件不能别识别');
			}
		}

		// 3.文件检验通过，获取excel表中的行数和列数
		$PHPExcel = $PHPReader->load($filename);
		$currentSheet = $PHPExcel->getSheet(0);  //读取excel文件中的第一个工作表
		$allColumn = $currentSheet->getHighestColumn(); //取得最大的列号
		$allRow = $currentSheet->getHighestRow(); //取得一共有多少行

		// 4.根据行数和列数，循环获取excel中的数据
		$data = array();  //声明数组

		// 5.合并字母和字段值
		$info = array_combine($words, $fields);

		/**从第二行开始输出，因为excel表中第一行为列名*/
		for($currentRow = 2;$currentRow <= $allRow;$currentRow++){
			/**从第A列开始输出*/
			for($currentColumn= 'A';$currentColumn<= $allColumn; $currentColumn++){
				// 获取单元格的数据(不能是主键)
				if ($info[$currentColumn] != 'id') {
					$data[$currentRow][$info[$currentColumn]] = $currentSheet->getCellByColumnAndRow(ord($currentColumn) - 65,$currentRow)->getValue();
				}
			}
		}

		// 5.返回数据
		return $data;
	}
}
