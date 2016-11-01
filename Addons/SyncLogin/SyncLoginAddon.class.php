<?php
/**
 * 同步登陆插件
 * @author jry
 */
 
namespace Addons\SyncLogin;
use Common\Controller\Addon;


class SyncLoginAddon extends Addon{

    public $info = array(
        'name' => 'SyncLogin',
        'title' => '第三方账号同步登陆',
        'description' => '第三方账号同步登陆',
        'status' => 1,
        'author' => 'yidian',
        'version' => '0.1'
    );

    public function install(){ 
        $prefix = C("DB_PREFIX");
        $model = D();
        $model->execute("DROP TABLE IF EXISTS {$prefix}sync_login;");
        $model->execute("CREATE TABLE {$prefix}sync_login ( `uid` int(11) NOT NULL,  `openid` varchar(255) NOT NULL,  `type` varchar(255) NOT NULL,  `access_token` varchar(255) NOT NULL,  `refresh_token` varchar(255) NOT NULL,  `status` tinyint(4) NOT NULL  )");
        /* 先判断插件需要的钩子是否存在 */
        $this->getisHook($this->info['name'], $this->info['name'], $this->info['description']);
        return true;
    }

    public function uninstall(){
        //删除钩子
        $this->deleteHook($this->info['name']);
        $prefix = C("DB_PREFIX");
        $model->execute("DROP TABLE IF EXISTS {$prefix}sync_login;");
        return true;
    }

    //登录按钮钩子
    public function SyncLogin($param)
    {
        $this->assign($param);
        $config = $this->getConfig();
        $this->assign('config',$config);
        $this->display('login');
    }

    /**=13-61
     * meta代码钩子
     * @param $param
     * autor:xjw129xjt
     */
    public function syncMeta($param)
    {
        $platform_options = $this->getConfig();
        echo $platform_options['meta'];
    }
    
}