<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2014 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;

/**
 * 模型管理控制器
 * @author huajie <banhuajie@163.com>
 */
class ModuleController extends AdminController {

	/**
	 * 模块列表
	 * @author huajie <banhuajie@163.com>
	 */
	public function index(){

		//所有模块列表
		$list = array();
		//系统默认模块
		$defaultModules = array('.','..','Admin','Common','Install','User');
		//检测所有模块
		$dirHandle = opendir(APP_PATH);
		//获取已安装的模块
		$installedModules = M('Module')->field(true)->select();
		$installedNames = array();
		if(!empty($installedModules)){
			foreach ($installedModules as $v){
				$installedNames[] = $v['name'];
			}
		}
		while (false !== ($moduleDir = readdir($dirHandle))){
			//不处理的模块
			if (in_array($moduleDir, $defaultModules) || in_array($moduleDir, $installedNames)){
				continue;
			}
			$module = array();
			//获取未安装模块
			if ($this->checkModule($moduleDir) === true){
				$confPath = APP_PATH.$moduleDir.'/Conf/config.php';
				//获取配置信息
				$config = include_once $confPath;
				$module['name']			= $moduleDir;
				$module['title'] 		= $config['MODULE_TITLE'];
				$module['description'] 	= $config['MODULE_DESCRIPTION'];
			}
			!empty($module) && array_push($list, $module);
		}
		closedir($dirHandle);
		$list = empty($installedModules) ? $list : array_merge($list, $installedModules);
		int_to_string($list);

		$this->assign('list', $list);
		$this->meta_title = '模块管理';
		$this->display();
	}

	/**
	 * 安装一个模块
	 * @author huajie <banhuajie@163.com>
	 */
	public function install($name = ''){
		//检查模块
		if(($check = $this->checkModule($name)) !== true){
			$this->error($check);
		}
		//获取模块信息
		$config = include_once APP_PATH.$name.'/Conf/config.php';
		$module['name']			= 	$name;
		$module['title'] 		= 	$config['MODULE_TITLE'];
		$module['description'] 	= 	$config['MODULE_DESCRIPTION'];

		//执行模块的自定义安装方法
		$this->execModuleMethod($name, $config);

		//保存模块信息
		$Model 	=  D('Module');
		$res 	=  $Model->update($module);

		if($res === false){
			$this->error($Model->getError());
		}else{
			$this->success('模块安装成功！');
		}
	}

	/**
	 * 卸载一个模块
	 * @author huajie <banhuajie@163.com>
	 */
	public function uninstall($id = 0){
		(empty($id) || !is_numeric($id)) && $this->error('参数错误！');
		$Model 	= 	M('Module');
		$name 	= 	$Model->getFieldById($id, 'name');
		$config = 	include_once APP_PATH.$name.'/Conf/config.php';

		//执行模块的自定义卸载方法
		$this->execModuleMethod($name, $config, 'uninstall');

		$res 	= 	$Model->delete($id);

		if($res !== false){
			$this->success('卸载成功！');
		}else{
			$this->error($Model->getError());
		}
	}

	/**
	 * 设置默认模块
	 * @author huajie <banhuajie@163.com>
	 */
	public function setDefault($id = 0){
		empty($id) && $this->error('参数错误！');
		$Model 	=  D('Module');
		$res 	=  $Model->setDefault($id);
		if($res === false){
			$this->error($Model->getError());
		}else{
			$this->success('设置成功！');
		}
	}

	/**
	 * 配置模块
	 * @author huajie <banhuajie@163.com>
	 */
	public function edit($id = 0){
		empty($id) && $this->error('参数错误！');
		$moduleName = M('Module')->getFieldById($id, 'name');
		$configPath = APP_PATH . $moduleName . '/Conf/config.php';
		if(IS_POST){
			$config = I('post.config');
			$res = file_put_contents($configPath, $config);
			if($res !== false){
				$this->success('更新配置成功！');
			}else{
				$this->error('更新配置失败！');
			}
		}else{
			$config = file_get_contents($configPath);
			$this->assign('config', $config);
			$this->assign('id', $id);
			$this->meta_title = '配置模块';
			$this->display();
		}
	}


	/**
	 * 检查模块规范
	 * @author huajie <banhuajie@163.com>
	 */
	protected function checkModule($name = ''){
		$configPath = APP_PATH.$name.'/Conf/config.php';
		if (empty($name)) {
			return '参数错误！';
		} elseif (!is_dir(APP_PATH.$name)){
			return '该模块不存在！';
		} elseif (!file_exists($configPath)){
			return '该模块配置文件缺失！';
		} elseif (!is_writeable($configPath)){
			return '模块配置文件不可写！';
		}
		//TODO:检查目录权限
		return true;
	}

	/**
	 * 执行模块自定义安装\卸载方法
	 * @author huajie <banhuajie@163.com>
	 */
	protected function execModuleMethod($moduleName, $config = array() ,$method = 'install'){
		$methodStr = $method == 'install' ? '安装' : '卸载';
		$configMethod = $method == 'install' ? $config['MODULE_INSTALL'] : $config['MODULE_UNINSTALL'];

		list($controller, $method) = explode('/', $configMethod);
		(empty($controller) || empty($method)) && $this->error("未配置模块自定义{$methodStr}方法！");
		$class = '\\' . $moduleName . '\\' . ($config['DEFAULT_C_LAYER'] ? $config['DEFAULT_C_LAYER'] : C('DEFAULT_C_LAYER')) . '\\' . $controller . 'Controller';
		$class = new $class;
		$methods =   new \ReflectionMethod($class, $method);
		if($methods->isPublic() && !$methods->isStatic()){
			if(!$methods->invoke($class)){
				$this->error("模块自定义{$methodStr}方法出错！");
			}
		}else{
			$this->error("模块自定义{$methodStr}方法需为Public,且不能为static！");
		}
	}

}