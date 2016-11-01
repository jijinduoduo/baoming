/*
Think MySQL Data Transfer
Date: 2015-10-08 12:39:20
*/

-- ----------------------------
-- Table structure for `yershop_action`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_action`;
CREATE TABLE `yershop_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of yershop_action
-- ----------------------------
INSERT INTO `yershop_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `yershop_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `yershop_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `yershop_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `yershop_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `yershop_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `yershop_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `yershop_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `yershop_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `yershop_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `yershop_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- ----------------------------
-- Table structure for `yershop_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_action_log`;
CREATE TABLE `yershop_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';


-- ----------------------------
-- Table structure for `yershop_ad`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_ad`;
CREATE TABLE `yershop_ad` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(225) NOT NULL DEFAULT '' COMMENT '金额',
  `partner` varchar(255) NOT NULL DEFAULT '' COMMENT '关联商品',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `meta_title` varchar(225) NOT NULL DEFAULT '',
  `place` varchar(225) NOT NULL DEFAULT '' COMMENT '位置',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) DEFAULT '1' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `ypid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='广告表';

-- ----------------------------
-- Records of yershop_ad
-- ----------------------------
INSERT INTO `yershop_ad` VALUES ('1', '', '广告位', '', '', '', '', '1', '1', '1442578278', '1442580187', '0', '129', '52');
INSERT INTO `yershop_ad` VALUES ('2', '', '服装', '', '', '', '', '1', '1', '1442582288', '1442582490', '0', '130', '107');
INSERT INTO `yershop_ad` VALUES ('3', '', '首页广告位1', 'Article/detail?id=74', '', '', '', '1', '1', '1442583801', '1442816116', '0', '131', '0');
INSERT INTO `yershop_ad` VALUES ('4', '', '首页广告位2', 'Article/detail?id=68', '', '', '', '2', '1', '1442815361', '1442816407', '1', '148', '0');

-- ----------------------------
-- Table structure for `yershop_addons`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_addons`;
CREATE TABLE `yershop_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of yershop_addons
-- ----------------------------
INSERT INTO `yershop_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `yershop_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `yershop_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `yershop_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `yershop_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `yershop_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `yershop_addons` VALUES ('23', 'SyncLogin', '第三方账号同步登陆', '第三方账号同步登陆', '1', '{\"type\":[\"Qq\",\"Sina\",\"Tencent\",\"Renren\",\"Douban\",\"Github\",\"Google\",\"Msn\",\"Diandian\",\"Taobao\",\"Baidu\",\"Kaixin\",\"T163\",\"X360\",\"Sohu\"],\"meta\":\"<meta property=\\\\\\\\\\\\\\\"qc:admins\\\\\\\\\\\\\\\" content=\\\\\\\\\\\\\\\"1450655062615230706375\\\\\\\\\\\\\\\" \\/>\",\"QqKEY\":\"\",\"QqSecret\":\"\",\"TencentKEY\":\"\",\"TencentSecret\":\"\",\"SinaKEY\":\"\",\"SinaSecret\":\"\",\"T163KEY\":\"\",\"T163Secret\":\"\",\"RenrenKEY\":\"\",\"RenrenSecret\":\"\",\"X360KEY\":\"\",\"X360Secret\":\"\",\"DoubanKEY\":\"\",\"DoubanSecret\":\"\",\"GithubKEY\":\"\",\"GithubSecret\":\"\",\"GoogleKEY\":\"\",\"GoogleSecret\":\"\",\"MsnKEY\":\"\",\"MsnSecret\":\"\",\"DiandianKEY\":\"\",\"DiandianSecret\":\"\",\"TaobaoKEY\":\"\",\"TaobaoSecret\":\"\",\"BaiduKEY\":\"\",\"BaiduSecret\":\"\",\"KaixinKEY\":\"\",\"KaixinSecret\":\"\",\"SohuKEY\":\"\",\"SohuSecret\":\"\"}', 'yidian', '0.1', '1412762818', '0');

-- ----------------------------
-- Table structure for `yershop_address`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_address`;
CREATE TABLE `yershop_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(225) DEFAULT '0',
  `cellphone` varchar(225) NOT NULL DEFAULT '',
  `province` varchar(225) NOT NULL DEFAULT '',
  `city` varchar(225) NOT NULL DEFAULT '',
  `area` varchar(225) NOT NULL DEFAULT '',
  `address` varchar(225) NOT NULL DEFAULT '',
  `realname` varchar(225) NOT NULL DEFAULT '',
  `phone` varchar(225) NOT NULL DEFAULT '',
  `youbian` varchar(225) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='收件人地址表';

-- ----------------------------
-- Records of yershop_address
-- ----------------------------
INSERT INTO `yershop_address` VALUES ('6', '0', '45345', '', '天津市', '和平区', '4535', '43543', '', '', '0', '0', '1');
INSERT INTO `yershop_address` VALUES ('17', '0', '43543535', '河北省', '唐山市', '开平区', '2432', '34542543', '', '', '1444240297', '0', '1');
INSERT INTO `yershop_address` VALUES ('8', '0', '23422246576', '北京市', '', '西城区', 'erw', 'erw', '', '', '0', '1', '1');
INSERT INTO `yershop_address` VALUES ('9', '0', '', '', '', '', '', '', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('10', '0', 'yyii', '天津市', '', '河东区', '112234', '1234', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('11', '0', 'yyii', '北京市', '', '西城区', '112234', '1234', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('12', '0', '1134yuu', '北京市', '', '崇文区', '225', '22468', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('13', '0', '1111111', '请选择省份', '请选择城市', '请选择地区', '11344', '23455', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('14', 'E9266949523187457446', '1111111', '请选择省份', '请选择城市', '请选择地区', '11344', '23455', '', '', '0', '0', '0');
INSERT INTO `yershop_address` VALUES ('15', '0', '而二人哦哦', '河北省', '秦皇岛市', '山海关区', 'yyyy', '3334', '', '', '1443325173', '0', '1');
INSERT INTO `yershop_address` VALUES ('16', '0', '23423', '河北省', '唐山市', '路南区', '23424', '2342', '', '', '1444240083', '0', '1');

-- ----------------------------
-- Table structure for `yershop_area`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_area`;
CREATE TABLE `yershop_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(225) NOT NULL DEFAULT '地区名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8 COMMENT='地址联动表';

-- ----------------------------
-- Records of yershop_area
-- ----------------------------
INSERT INTO `yershop_area` VALUES ('110101', '东城区', '110100');
INSERT INTO `yershop_area` VALUES ('110102', '西城区', '110100');
INSERT INTO `yershop_area` VALUES ('110103', '崇文区', '110100');
INSERT INTO `yershop_area` VALUES ('110104', '宣武区', '110100');
INSERT INTO `yershop_area` VALUES ('110105', '朝阳区', '110100');
INSERT INTO `yershop_area` VALUES ('110106', '丰台区', '110100');
INSERT INTO `yershop_area` VALUES ('110107', '石景山区', '110100');
INSERT INTO `yershop_area` VALUES ('110108', '海淀区', '110100');
INSERT INTO `yershop_area` VALUES ('110109', '门头沟区', '110100');
INSERT INTO `yershop_area` VALUES ('110111', '房山区', '110100');
INSERT INTO `yershop_area` VALUES ('110112', '通州区', '110100');
INSERT INTO `yershop_area` VALUES ('110113', '顺义区', '110100');
INSERT INTO `yershop_area` VALUES ('110114', '昌平区', '110100');
INSERT INTO `yershop_area` VALUES ('110115', '大兴区', '110100');
INSERT INTO `yershop_area` VALUES ('110116', '怀柔区', '110100');
INSERT INTO `yershop_area` VALUES ('110117', '平谷区', '110100');
INSERT INTO `yershop_area` VALUES ('110228', '密云县', '110200');
INSERT INTO `yershop_area` VALUES ('110229', '延庆县', '110200');
INSERT INTO `yershop_area` VALUES ('120101', '和平区', '120100');
INSERT INTO `yershop_area` VALUES ('120102', '河东区', '120100');
INSERT INTO `yershop_area` VALUES ('120103', '河西区', '120100');
INSERT INTO `yershop_area` VALUES ('120104', '南开区', '120100');
INSERT INTO `yershop_area` VALUES ('120105', '河北区', '120100');
INSERT INTO `yershop_area` VALUES ('120106', '红桥区', '120100');
INSERT INTO `yershop_area` VALUES ('120107', '塘沽区', '120100');
INSERT INTO `yershop_area` VALUES ('120108', '汉沽区', '120100');
INSERT INTO `yershop_area` VALUES ('120109', '大港区', '120100');
INSERT INTO `yershop_area` VALUES ('120110', '东丽区', '120100');
INSERT INTO `yershop_area` VALUES ('120111', '西青区', '120100');
INSERT INTO `yershop_area` VALUES ('120112', '津南区', '120100');
INSERT INTO `yershop_area` VALUES ('120113', '北辰区', '120100');
INSERT INTO `yershop_area` VALUES ('120114', '武清区', '120100');
INSERT INTO `yershop_area` VALUES ('120115', '宝坻区', '120100');
INSERT INTO `yershop_area` VALUES ('120221', '宁河县', '120200');
INSERT INTO `yershop_area` VALUES ('120223', '静海县', '120200');
INSERT INTO `yershop_area` VALUES ('120225', '蓟　县', '120200');
INSERT INTO `yershop_area` VALUES ('130101', '市辖区', '130100');
INSERT INTO `yershop_area` VALUES ('130102', '长安区', '130100');
INSERT INTO `yershop_area` VALUES ('130103', '桥东区', '130100');
INSERT INTO `yershop_area` VALUES ('130104', '桥西区', '130100');
INSERT INTO `yershop_area` VALUES ('130105', '新华区', '130100');
INSERT INTO `yershop_area` VALUES ('130107', '井陉矿区', '130100');
INSERT INTO `yershop_area` VALUES ('130108', '裕华区', '130100');
INSERT INTO `yershop_area` VALUES ('130121', '井陉县', '130100');
INSERT INTO `yershop_area` VALUES ('130123', '正定县', '130100');
INSERT INTO `yershop_area` VALUES ('130124', '栾城县', '130100');
INSERT INTO `yershop_area` VALUES ('130125', '行唐县', '130100');
INSERT INTO `yershop_area` VALUES ('130126', '灵寿县', '130100');
INSERT INTO `yershop_area` VALUES ('130127', '高邑县', '130100');
INSERT INTO `yershop_area` VALUES ('130128', '深泽县', '130100');
INSERT INTO `yershop_area` VALUES ('130129', '赞皇县', '130100');
INSERT INTO `yershop_area` VALUES ('130130', '无极县', '130100');
INSERT INTO `yershop_area` VALUES ('130131', '平山县', '130100');
INSERT INTO `yershop_area` VALUES ('130132', '元氏县', '130100');
INSERT INTO `yershop_area` VALUES ('130133', '赵　县', '130100');
INSERT INTO `yershop_area` VALUES ('130181', '辛集市', '130100');
INSERT INTO `yershop_area` VALUES ('130182', '藁城市', '130100');
INSERT INTO `yershop_area` VALUES ('130183', '晋州市', '130100');
INSERT INTO `yershop_area` VALUES ('130184', '新乐市', '130100');
INSERT INTO `yershop_area` VALUES ('130185', '鹿泉市', '130100');
INSERT INTO `yershop_area` VALUES ('130201', '市辖区', '130200');
INSERT INTO `yershop_area` VALUES ('130202', '路南区', '130200');
INSERT INTO `yershop_area` VALUES ('130203', '路北区', '130200');
INSERT INTO `yershop_area` VALUES ('130204', '古冶区', '130200');
INSERT INTO `yershop_area` VALUES ('130205', '开平区', '130200');
INSERT INTO `yershop_area` VALUES ('130207', '丰南区', '130200');
INSERT INTO `yershop_area` VALUES ('130208', '丰润区', '130200');
INSERT INTO `yershop_area` VALUES ('130223', '滦　县', '130200');
INSERT INTO `yershop_area` VALUES ('130224', '滦南县', '130200');
INSERT INTO `yershop_area` VALUES ('130225', '乐亭县', '130200');
INSERT INTO `yershop_area` VALUES ('130227', '迁西县', '130200');
INSERT INTO `yershop_area` VALUES ('130229', '玉田县', '130200');
INSERT INTO `yershop_area` VALUES ('130230', '唐海县', '130200');
INSERT INTO `yershop_area` VALUES ('130281', '遵化市', '130200');
INSERT INTO `yershop_area` VALUES ('130283', '迁安市', '130200');
INSERT INTO `yershop_area` VALUES ('130301', '市辖区', '130300');
INSERT INTO `yershop_area` VALUES ('130302', '海港区', '130300');
INSERT INTO `yershop_area` VALUES ('130303', '山海关区', '130300');
INSERT INTO `yershop_area` VALUES ('130304', '北戴河区', '130300');
INSERT INTO `yershop_area` VALUES ('130321', '青龙满族自治县', '130300');
INSERT INTO `yershop_area` VALUES ('130322', '昌黎县', '130300');
INSERT INTO `yershop_area` VALUES ('130323', '抚宁县', '130300');
INSERT INTO `yershop_area` VALUES ('130324', '卢龙县', '130300');
INSERT INTO `yershop_area` VALUES ('130401', '市辖区', '130400');
INSERT INTO `yershop_area` VALUES ('130402', '邯山区', '130400');
INSERT INTO `yershop_area` VALUES ('130403', '丛台区', '130400');
INSERT INTO `yershop_area` VALUES ('130404', '复兴区', '130400');
INSERT INTO `yershop_area` VALUES ('130406', '峰峰矿区', '130400');
INSERT INTO `yershop_area` VALUES ('130421', '邯郸县', '130400');
INSERT INTO `yershop_area` VALUES ('130423', '临漳县', '130400');
INSERT INTO `yershop_area` VALUES ('130424', '成安县', '130400');
INSERT INTO `yershop_area` VALUES ('130425', '大名县', '130400');
INSERT INTO `yershop_area` VALUES ('130426', '涉　县', '130400');
INSERT INTO `yershop_area` VALUES ('130427', '磁　县', '130400');
INSERT INTO `yershop_area` VALUES ('130428', '肥乡县', '130400');
INSERT INTO `yershop_area` VALUES ('130429', '永年县', '130400');
INSERT INTO `yershop_area` VALUES ('130430', '邱　县', '130400');
INSERT INTO `yershop_area` VALUES ('130431', '鸡泽县', '130400');
INSERT INTO `yershop_area` VALUES ('130432', '广平县', '130400');
INSERT INTO `yershop_area` VALUES ('130433', '馆陶县', '130400');
INSERT INTO `yershop_area` VALUES ('130434', '魏　县', '130400');
INSERT INTO `yershop_area` VALUES ('130435', '曲周县', '130400');
INSERT INTO `yershop_area` VALUES ('130481', '武安市', '130400');
INSERT INTO `yershop_area` VALUES ('130501', '市辖区', '130500');
INSERT INTO `yershop_area` VALUES ('130502', '桥东区', '130500');
INSERT INTO `yershop_area` VALUES ('130503', '桥西区', '130500');
INSERT INTO `yershop_area` VALUES ('130521', '邢台县', '130500');
INSERT INTO `yershop_area` VALUES ('130522', '临城县', '130500');
INSERT INTO `yershop_area` VALUES ('130523', '内丘县', '130500');
INSERT INTO `yershop_area` VALUES ('130524', '柏乡县', '130500');
INSERT INTO `yershop_area` VALUES ('130525', '隆尧县', '130500');
INSERT INTO `yershop_area` VALUES ('130526', '任　县', '130500');
INSERT INTO `yershop_area` VALUES ('130527', '南和县', '130500');
INSERT INTO `yershop_area` VALUES ('130528', '宁晋县', '130500');
INSERT INTO `yershop_area` VALUES ('130529', '巨鹿县', '130500');
INSERT INTO `yershop_area` VALUES ('130530', '新河县', '130500');
INSERT INTO `yershop_area` VALUES ('130531', '广宗县', '130500');
INSERT INTO `yershop_area` VALUES ('130532', '平乡县', '130500');
INSERT INTO `yershop_area` VALUES ('130533', '威　县', '130500');
INSERT INTO `yershop_area` VALUES ('130534', '清河县', '130500');
INSERT INTO `yershop_area` VALUES ('130535', '临西县', '130500');
INSERT INTO `yershop_area` VALUES ('130581', '南宫市', '130500');
INSERT INTO `yershop_area` VALUES ('130582', '沙河市', '130500');
INSERT INTO `yershop_area` VALUES ('130601', '市辖区', '130600');
INSERT INTO `yershop_area` VALUES ('130602', '新市区', '130600');
INSERT INTO `yershop_area` VALUES ('130603', '北市区', '130600');
INSERT INTO `yershop_area` VALUES ('130604', '南市区', '130600');
INSERT INTO `yershop_area` VALUES ('130621', '满城县', '130600');
INSERT INTO `yershop_area` VALUES ('130622', '清苑县', '130600');
INSERT INTO `yershop_area` VALUES ('130623', '涞水县', '130600');
INSERT INTO `yershop_area` VALUES ('130624', '阜平县', '130600');
INSERT INTO `yershop_area` VALUES ('130625', '徐水县', '130600');
INSERT INTO `yershop_area` VALUES ('130626', '定兴县', '130600');
INSERT INTO `yershop_area` VALUES ('130627', '唐　县', '130600');
INSERT INTO `yershop_area` VALUES ('130628', '高阳县', '130600');
INSERT INTO `yershop_area` VALUES ('130629', '容城县', '130600');
INSERT INTO `yershop_area` VALUES ('130630', '涞源县', '130600');
INSERT INTO `yershop_area` VALUES ('130631', '望都县', '130600');
INSERT INTO `yershop_area` VALUES ('130632', '安新县', '130600');
INSERT INTO `yershop_area` VALUES ('130633', '易　县', '130600');
INSERT INTO `yershop_area` VALUES ('130634', '曲阳县', '130600');
INSERT INTO `yershop_area` VALUES ('130635', '蠡　县', '130600');
INSERT INTO `yershop_area` VALUES ('130636', '顺平县', '130600');
INSERT INTO `yershop_area` VALUES ('130637', '博野县', '130600');
INSERT INTO `yershop_area` VALUES ('130638', '雄　县', '130600');
INSERT INTO `yershop_area` VALUES ('130681', '涿州市', '130600');
INSERT INTO `yershop_area` VALUES ('130682', '定州市', '130600');
INSERT INTO `yershop_area` VALUES ('130683', '安国市', '130600');
INSERT INTO `yershop_area` VALUES ('130684', '高碑店市', '130600');
INSERT INTO `yershop_area` VALUES ('130701', '市辖区', '130700');
INSERT INTO `yershop_area` VALUES ('130702', '桥东区', '130700');
INSERT INTO `yershop_area` VALUES ('130703', '桥西区', '130700');
INSERT INTO `yershop_area` VALUES ('130705', '宣化区', '130700');
INSERT INTO `yershop_area` VALUES ('130706', '下花园区', '130700');
INSERT INTO `yershop_area` VALUES ('130721', '宣化县', '130700');
INSERT INTO `yershop_area` VALUES ('130722', '张北县', '130700');
INSERT INTO `yershop_area` VALUES ('130723', '康保县', '130700');
INSERT INTO `yershop_area` VALUES ('130724', '沽源县', '130700');
INSERT INTO `yershop_area` VALUES ('130725', '尚义县', '130700');
INSERT INTO `yershop_area` VALUES ('130726', '蔚　县', '130700');
INSERT INTO `yershop_area` VALUES ('130727', '阳原县', '130700');
INSERT INTO `yershop_area` VALUES ('130728', '怀安县', '130700');
INSERT INTO `yershop_area` VALUES ('130729', '万全县', '130700');
INSERT INTO `yershop_area` VALUES ('130730', '怀来县', '130700');
INSERT INTO `yershop_area` VALUES ('130731', '涿鹿县', '130700');
INSERT INTO `yershop_area` VALUES ('130732', '赤城县', '130700');
INSERT INTO `yershop_area` VALUES ('130733', '崇礼县', '130700');
INSERT INTO `yershop_area` VALUES ('130801', '市辖区', '130800');
INSERT INTO `yershop_area` VALUES ('130802', '双桥区', '130800');
INSERT INTO `yershop_area` VALUES ('130803', '双滦区', '130800');
INSERT INTO `yershop_area` VALUES ('130804', '鹰手营子矿区', '130800');
INSERT INTO `yershop_area` VALUES ('130821', '承德县', '130800');
INSERT INTO `yershop_area` VALUES ('130822', '兴隆县', '130800');
INSERT INTO `yershop_area` VALUES ('130823', '平泉县', '130800');
INSERT INTO `yershop_area` VALUES ('130824', '滦平县', '130800');
INSERT INTO `yershop_area` VALUES ('130825', '隆化县', '130800');
INSERT INTO `yershop_area` VALUES ('130826', '丰宁满族自治县', '130800');
INSERT INTO `yershop_area` VALUES ('130827', '宽城满族自治县', '130800');
INSERT INTO `yershop_area` VALUES ('130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `yershop_area` VALUES ('130901', '市辖区', '130900');
INSERT INTO `yershop_area` VALUES ('130902', '新华区', '130900');
INSERT INTO `yershop_area` VALUES ('130903', '运河区', '130900');
INSERT INTO `yershop_area` VALUES ('130921', '沧　县', '130900');
INSERT INTO `yershop_area` VALUES ('130922', '青　县', '130900');
INSERT INTO `yershop_area` VALUES ('130923', '东光县', '130900');
INSERT INTO `yershop_area` VALUES ('130924', '海兴县', '130900');
INSERT INTO `yershop_area` VALUES ('130925', '盐山县', '130900');
INSERT INTO `yershop_area` VALUES ('130926', '肃宁县', '130900');
INSERT INTO `yershop_area` VALUES ('130927', '南皮县', '130900');
INSERT INTO `yershop_area` VALUES ('130928', '吴桥县', '130900');
INSERT INTO `yershop_area` VALUES ('130929', '献　县', '130900');
INSERT INTO `yershop_area` VALUES ('130930', '孟村回族自治县', '130900');
INSERT INTO `yershop_area` VALUES ('130981', '泊头市', '130900');
INSERT INTO `yershop_area` VALUES ('130982', '任丘市', '130900');
INSERT INTO `yershop_area` VALUES ('130983', '黄骅市', '130900');
INSERT INTO `yershop_area` VALUES ('130984', '河间市', '130900');
INSERT INTO `yershop_area` VALUES ('131001', '市辖区', '131000');
INSERT INTO `yershop_area` VALUES ('131002', '安次区', '131000');
INSERT INTO `yershop_area` VALUES ('131003', '广阳区', '131000');
INSERT INTO `yershop_area` VALUES ('131022', '固安县', '131000');
INSERT INTO `yershop_area` VALUES ('131023', '永清县', '131000');
INSERT INTO `yershop_area` VALUES ('131024', '香河县', '131000');
INSERT INTO `yershop_area` VALUES ('131025', '大城县', '131000');
INSERT INTO `yershop_area` VALUES ('131026', '文安县', '131000');
INSERT INTO `yershop_area` VALUES ('131028', '大厂回族自治县', '131000');
INSERT INTO `yershop_area` VALUES ('131081', '霸州市', '131000');
INSERT INTO `yershop_area` VALUES ('131082', '三河市', '131000');
INSERT INTO `yershop_area` VALUES ('131101', '市辖区', '131100');
INSERT INTO `yershop_area` VALUES ('131102', '桃城区', '131100');
INSERT INTO `yershop_area` VALUES ('131121', '枣强县', '131100');
INSERT INTO `yershop_area` VALUES ('131122', '武邑县', '131100');
INSERT INTO `yershop_area` VALUES ('131123', '武强县', '131100');
INSERT INTO `yershop_area` VALUES ('131124', '饶阳县', '131100');
INSERT INTO `yershop_area` VALUES ('131125', '安平县', '131100');
INSERT INTO `yershop_area` VALUES ('131126', '故城县', '131100');
INSERT INTO `yershop_area` VALUES ('131127', '景　县', '131100');
INSERT INTO `yershop_area` VALUES ('131128', '阜城县', '131100');
INSERT INTO `yershop_area` VALUES ('131181', '冀州市', '131100');
INSERT INTO `yershop_area` VALUES ('131182', '深州市', '131100');
INSERT INTO `yershop_area` VALUES ('140101', '市辖区', '140100');
INSERT INTO `yershop_area` VALUES ('140105', '小店区', '140100');
INSERT INTO `yershop_area` VALUES ('140106', '迎泽区', '140100');
INSERT INTO `yershop_area` VALUES ('140107', '杏花岭区', '140100');
INSERT INTO `yershop_area` VALUES ('140108', '尖草坪区', '140100');
INSERT INTO `yershop_area` VALUES ('140109', '万柏林区', '140100');
INSERT INTO `yershop_area` VALUES ('140110', '晋源区', '140100');
INSERT INTO `yershop_area` VALUES ('140121', '清徐县', '140100');
INSERT INTO `yershop_area` VALUES ('140122', '阳曲县', '140100');
INSERT INTO `yershop_area` VALUES ('140123', '娄烦县', '140100');
INSERT INTO `yershop_area` VALUES ('140181', '古交市', '140100');
INSERT INTO `yershop_area` VALUES ('140201', '市辖区', '140200');
INSERT INTO `yershop_area` VALUES ('140202', '城　区', '140200');
INSERT INTO `yershop_area` VALUES ('140203', '矿　区', '140200');
INSERT INTO `yershop_area` VALUES ('140211', '南郊区', '140200');
INSERT INTO `yershop_area` VALUES ('140212', '新荣区', '140200');
INSERT INTO `yershop_area` VALUES ('140221', '阳高县', '140200');
INSERT INTO `yershop_area` VALUES ('140222', '天镇县', '140200');
INSERT INTO `yershop_area` VALUES ('140223', '广灵县', '140200');
INSERT INTO `yershop_area` VALUES ('140224', '灵丘县', '140200');
INSERT INTO `yershop_area` VALUES ('140225', '浑源县', '140200');
INSERT INTO `yershop_area` VALUES ('140226', '左云县', '140200');
INSERT INTO `yershop_area` VALUES ('140227', '大同县', '140200');
INSERT INTO `yershop_area` VALUES ('140301', '市辖区', '140300');
INSERT INTO `yershop_area` VALUES ('140302', '城　区', '140300');
INSERT INTO `yershop_area` VALUES ('140303', '矿　区', '140300');
INSERT INTO `yershop_area` VALUES ('140311', '郊　区', '140300');
INSERT INTO `yershop_area` VALUES ('140321', '平定县', '140300');
INSERT INTO `yershop_area` VALUES ('140322', '盂　县', '140300');
INSERT INTO `yershop_area` VALUES ('140401', '市辖区', '140400');
INSERT INTO `yershop_area` VALUES ('140402', '城　区', '140400');
INSERT INTO `yershop_area` VALUES ('140411', '郊　区', '140400');
INSERT INTO `yershop_area` VALUES ('140421', '长治县', '140400');
INSERT INTO `yershop_area` VALUES ('140423', '襄垣县', '140400');
INSERT INTO `yershop_area` VALUES ('140424', '屯留县', '140400');
INSERT INTO `yershop_area` VALUES ('140425', '平顺县', '140400');
INSERT INTO `yershop_area` VALUES ('140426', '黎城县', '140400');
INSERT INTO `yershop_area` VALUES ('140427', '壶关县', '140400');
INSERT INTO `yershop_area` VALUES ('140428', '长子县', '140400');
INSERT INTO `yershop_area` VALUES ('140429', '武乡县', '140400');
INSERT INTO `yershop_area` VALUES ('140430', '沁　县', '140400');
INSERT INTO `yershop_area` VALUES ('140431', '沁源县', '140400');
INSERT INTO `yershop_area` VALUES ('140481', '潞城市', '140400');
INSERT INTO `yershop_area` VALUES ('140501', '市辖区', '140500');
INSERT INTO `yershop_area` VALUES ('140502', '城　区', '140500');
INSERT INTO `yershop_area` VALUES ('140521', '沁水县', '140500');
INSERT INTO `yershop_area` VALUES ('140522', '阳城县', '140500');
INSERT INTO `yershop_area` VALUES ('140524', '陵川县', '140500');
INSERT INTO `yershop_area` VALUES ('140525', '泽州县', '140500');
INSERT INTO `yershop_area` VALUES ('140581', '高平市', '140500');
INSERT INTO `yershop_area` VALUES ('140601', '市辖区', '140600');
INSERT INTO `yershop_area` VALUES ('140602', '朔城区', '140600');
INSERT INTO `yershop_area` VALUES ('140603', '平鲁区', '140600');
INSERT INTO `yershop_area` VALUES ('140621', '山阴县', '140600');
INSERT INTO `yershop_area` VALUES ('140622', '应　县', '140600');
INSERT INTO `yershop_area` VALUES ('140623', '右玉县', '140600');
INSERT INTO `yershop_area` VALUES ('140624', '怀仁县', '140600');
INSERT INTO `yershop_area` VALUES ('140701', '市辖区', '140700');
INSERT INTO `yershop_area` VALUES ('140702', '榆次区', '140700');
INSERT INTO `yershop_area` VALUES ('140721', '榆社县', '140700');
INSERT INTO `yershop_area` VALUES ('140722', '左权县', '140700');
INSERT INTO `yershop_area` VALUES ('140723', '和顺县', '140700');
INSERT INTO `yershop_area` VALUES ('140724', '昔阳县', '140700');
INSERT INTO `yershop_area` VALUES ('140725', '寿阳县', '140700');
INSERT INTO `yershop_area` VALUES ('140726', '太谷县', '140700');
INSERT INTO `yershop_area` VALUES ('140727', '祁　县', '140700');
INSERT INTO `yershop_area` VALUES ('140728', '平遥县', '140700');
INSERT INTO `yershop_area` VALUES ('140729', '灵石县', '140700');
INSERT INTO `yershop_area` VALUES ('140781', '介休市', '140700');
INSERT INTO `yershop_area` VALUES ('140801', '市辖区', '140800');
INSERT INTO `yershop_area` VALUES ('140802', '盐湖区', '140800');
INSERT INTO `yershop_area` VALUES ('140821', '临猗县', '140800');
INSERT INTO `yershop_area` VALUES ('140822', '万荣县', '140800');
INSERT INTO `yershop_area` VALUES ('140823', '闻喜县', '140800');
INSERT INTO `yershop_area` VALUES ('140824', '稷山县', '140800');
INSERT INTO `yershop_area` VALUES ('140825', '新绛县', '140800');
INSERT INTO `yershop_area` VALUES ('140826', '绛　县', '140800');
INSERT INTO `yershop_area` VALUES ('140827', '垣曲县', '140800');
INSERT INTO `yershop_area` VALUES ('140828', '夏　县', '140800');
INSERT INTO `yershop_area` VALUES ('140829', '平陆县', '140800');
INSERT INTO `yershop_area` VALUES ('140830', '芮城县', '140800');
INSERT INTO `yershop_area` VALUES ('140881', '永济市', '140800');
INSERT INTO `yershop_area` VALUES ('140882', '河津市', '140800');
INSERT INTO `yershop_area` VALUES ('140901', '市辖区', '140900');
INSERT INTO `yershop_area` VALUES ('140902', '忻府区', '140900');
INSERT INTO `yershop_area` VALUES ('140921', '定襄县', '140900');
INSERT INTO `yershop_area` VALUES ('140922', '五台县', '140900');
INSERT INTO `yershop_area` VALUES ('140923', '代　县', '140900');
INSERT INTO `yershop_area` VALUES ('140924', '繁峙县', '140900');
INSERT INTO `yershop_area` VALUES ('140925', '宁武县', '140900');
INSERT INTO `yershop_area` VALUES ('140926', '静乐县', '140900');
INSERT INTO `yershop_area` VALUES ('140927', '神池县', '140900');
INSERT INTO `yershop_area` VALUES ('140928', '五寨县', '140900');
INSERT INTO `yershop_area` VALUES ('140929', '岢岚县', '140900');
INSERT INTO `yershop_area` VALUES ('140930', '河曲县', '140900');
INSERT INTO `yershop_area` VALUES ('140931', '保德县', '140900');
INSERT INTO `yershop_area` VALUES ('140932', '偏关县', '140900');
INSERT INTO `yershop_area` VALUES ('140981', '原平市', '140900');
INSERT INTO `yershop_area` VALUES ('141001', '市辖区', '141000');
INSERT INTO `yershop_area` VALUES ('141002', '尧都区', '141000');
INSERT INTO `yershop_area` VALUES ('141021', '曲沃县', '141000');
INSERT INTO `yershop_area` VALUES ('141022', '翼城县', '141000');
INSERT INTO `yershop_area` VALUES ('141023', '襄汾县', '141000');
INSERT INTO `yershop_area` VALUES ('141024', '洪洞县', '141000');
INSERT INTO `yershop_area` VALUES ('141025', '古　县', '141000');
INSERT INTO `yershop_area` VALUES ('141026', '安泽县', '141000');
INSERT INTO `yershop_area` VALUES ('141027', '浮山县', '141000');
INSERT INTO `yershop_area` VALUES ('141028', '吉　县', '141000');
INSERT INTO `yershop_area` VALUES ('141029', '乡宁县', '141000');
INSERT INTO `yershop_area` VALUES ('141030', '大宁县', '141000');
INSERT INTO `yershop_area` VALUES ('141031', '隰　县', '141000');
INSERT INTO `yershop_area` VALUES ('141032', '永和县', '141000');
INSERT INTO `yershop_area` VALUES ('141033', '蒲　县', '141000');
INSERT INTO `yershop_area` VALUES ('141034', '汾西县', '141000');
INSERT INTO `yershop_area` VALUES ('141081', '侯马市', '141000');
INSERT INTO `yershop_area` VALUES ('141082', '霍州市', '141000');
INSERT INTO `yershop_area` VALUES ('141101', '市辖区', '141100');
INSERT INTO `yershop_area` VALUES ('141102', '离石区', '141100');
INSERT INTO `yershop_area` VALUES ('141121', '文水县', '141100');
INSERT INTO `yershop_area` VALUES ('141122', '交城县', '141100');
INSERT INTO `yershop_area` VALUES ('141123', '兴　县', '141100');
INSERT INTO `yershop_area` VALUES ('141124', '临　县', '141100');
INSERT INTO `yershop_area` VALUES ('141125', '柳林县', '141100');
INSERT INTO `yershop_area` VALUES ('141126', '石楼县', '141100');
INSERT INTO `yershop_area` VALUES ('141127', '岚　县', '141100');
INSERT INTO `yershop_area` VALUES ('141128', '方山县', '141100');
INSERT INTO `yershop_area` VALUES ('141129', '中阳县', '141100');
INSERT INTO `yershop_area` VALUES ('141130', '交口县', '141100');
INSERT INTO `yershop_area` VALUES ('141181', '孝义市', '141100');
INSERT INTO `yershop_area` VALUES ('141182', '汾阳市', '141100');
INSERT INTO `yershop_area` VALUES ('150101', '市辖区', '150100');
INSERT INTO `yershop_area` VALUES ('150102', '新城区', '150100');
INSERT INTO `yershop_area` VALUES ('150103', '回民区', '150100');
INSERT INTO `yershop_area` VALUES ('150104', '玉泉区', '150100');
INSERT INTO `yershop_area` VALUES ('150105', '赛罕区', '150100');
INSERT INTO `yershop_area` VALUES ('150121', '土默特左旗', '150100');
INSERT INTO `yershop_area` VALUES ('150122', '托克托县', '150100');
INSERT INTO `yershop_area` VALUES ('150123', '和林格尔县', '150100');
INSERT INTO `yershop_area` VALUES ('150124', '清水河县', '150100');
INSERT INTO `yershop_area` VALUES ('150125', '武川县', '150100');
INSERT INTO `yershop_area` VALUES ('150201', '市辖区', '150200');
INSERT INTO `yershop_area` VALUES ('150202', '东河区', '150200');
INSERT INTO `yershop_area` VALUES ('150203', '昆都仑区', '150200');
INSERT INTO `yershop_area` VALUES ('150204', '青山区', '150200');
INSERT INTO `yershop_area` VALUES ('150205', '石拐区', '150200');
INSERT INTO `yershop_area` VALUES ('150206', '白云矿区', '150200');
INSERT INTO `yershop_area` VALUES ('150207', '九原区', '150200');
INSERT INTO `yershop_area` VALUES ('150221', '土默特右旗', '150200');
INSERT INTO `yershop_area` VALUES ('150222', '固阳县', '150200');
INSERT INTO `yershop_area` VALUES ('150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `yershop_area` VALUES ('150301', '市辖区', '150300');
INSERT INTO `yershop_area` VALUES ('150302', '海勃湾区', '150300');
INSERT INTO `yershop_area` VALUES ('150303', '海南区', '150300');
INSERT INTO `yershop_area` VALUES ('150304', '乌达区', '150300');
INSERT INTO `yershop_area` VALUES ('150401', '市辖区', '150400');
INSERT INTO `yershop_area` VALUES ('150402', '红山区', '150400');
INSERT INTO `yershop_area` VALUES ('150403', '元宝山区', '150400');
INSERT INTO `yershop_area` VALUES ('150404', '松山区', '150400');
INSERT INTO `yershop_area` VALUES ('150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `yershop_area` VALUES ('150422', '巴林左旗', '150400');
INSERT INTO `yershop_area` VALUES ('150423', '巴林右旗', '150400');
INSERT INTO `yershop_area` VALUES ('150424', '林西县', '150400');
INSERT INTO `yershop_area` VALUES ('150425', '克什克腾旗', '150400');
INSERT INTO `yershop_area` VALUES ('150426', '翁牛特旗', '150400');
INSERT INTO `yershop_area` VALUES ('150428', '喀喇沁旗', '150400');
INSERT INTO `yershop_area` VALUES ('150429', '宁城县', '150400');
INSERT INTO `yershop_area` VALUES ('150430', '敖汉旗', '150400');
INSERT INTO `yershop_area` VALUES ('150501', '市辖区', '150500');
INSERT INTO `yershop_area` VALUES ('150502', '科尔沁区', '150500');
INSERT INTO `yershop_area` VALUES ('150521', '科尔沁左翼中旗', '150500');
INSERT INTO `yershop_area` VALUES ('150522', '科尔沁左翼后旗', '150500');
INSERT INTO `yershop_area` VALUES ('150523', '开鲁县', '150500');
INSERT INTO `yershop_area` VALUES ('150524', '库伦旗', '150500');
INSERT INTO `yershop_area` VALUES ('150525', '奈曼旗', '150500');
INSERT INTO `yershop_area` VALUES ('150526', '扎鲁特旗', '150500');
INSERT INTO `yershop_area` VALUES ('150581', '霍林郭勒市', '150500');
INSERT INTO `yershop_area` VALUES ('150602', '东胜区', '150600');
INSERT INTO `yershop_area` VALUES ('150621', '达拉特旗', '150600');
INSERT INTO `yershop_area` VALUES ('150622', '准格尔旗', '150600');
INSERT INTO `yershop_area` VALUES ('150623', '鄂托克前旗', '150600');
INSERT INTO `yershop_area` VALUES ('150624', '鄂托克旗', '150600');
INSERT INTO `yershop_area` VALUES ('150625', '杭锦旗', '150600');
INSERT INTO `yershop_area` VALUES ('150626', '乌审旗', '150600');
INSERT INTO `yershop_area` VALUES ('150627', '伊金霍洛旗', '150600');
INSERT INTO `yershop_area` VALUES ('150701', '市辖区', '150700');
INSERT INTO `yershop_area` VALUES ('150702', '海拉尔区', '150700');
INSERT INTO `yershop_area` VALUES ('150721', '阿荣旗', '150700');
INSERT INTO `yershop_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `yershop_area` VALUES ('150723', '鄂伦春自治旗', '150700');
INSERT INTO `yershop_area` VALUES ('150724', '鄂温克族自治旗', '150700');
INSERT INTO `yershop_area` VALUES ('150725', '陈巴尔虎旗', '150700');
INSERT INTO `yershop_area` VALUES ('150726', '新巴尔虎左旗', '150700');
INSERT INTO `yershop_area` VALUES ('150727', '新巴尔虎右旗', '150700');
INSERT INTO `yershop_area` VALUES ('150781', '满洲里市', '150700');
INSERT INTO `yershop_area` VALUES ('150782', '牙克石市', '150700');
INSERT INTO `yershop_area` VALUES ('150783', '扎兰屯市', '150700');
INSERT INTO `yershop_area` VALUES ('150784', '额尔古纳市', '150700');
INSERT INTO `yershop_area` VALUES ('150785', '根河市', '150700');
INSERT INTO `yershop_area` VALUES ('150801', '市辖区', '150800');
INSERT INTO `yershop_area` VALUES ('150802', '临河区', '150800');
INSERT INTO `yershop_area` VALUES ('150821', '五原县', '150800');
INSERT INTO `yershop_area` VALUES ('150822', '磴口县', '150800');
INSERT INTO `yershop_area` VALUES ('150823', '乌拉特前旗', '150800');
INSERT INTO `yershop_area` VALUES ('150824', '乌拉特中旗', '150800');
INSERT INTO `yershop_area` VALUES ('150825', '乌拉特后旗', '150800');
INSERT INTO `yershop_area` VALUES ('150826', '杭锦后旗', '150800');
INSERT INTO `yershop_area` VALUES ('150901', '市辖区', '150900');
INSERT INTO `yershop_area` VALUES ('150902', '集宁区', '150900');
INSERT INTO `yershop_area` VALUES ('150921', '卓资县', '150900');
INSERT INTO `yershop_area` VALUES ('150922', '化德县', '150900');
INSERT INTO `yershop_area` VALUES ('150923', '商都县', '150900');
INSERT INTO `yershop_area` VALUES ('150924', '兴和县', '150900');
INSERT INTO `yershop_area` VALUES ('150925', '凉城县', '150900');
INSERT INTO `yershop_area` VALUES ('150926', '察哈尔右翼前旗', '150900');
INSERT INTO `yershop_area` VALUES ('150927', '察哈尔右翼中旗', '150900');
INSERT INTO `yershop_area` VALUES ('150928', '察哈尔右翼后旗', '150900');
INSERT INTO `yershop_area` VALUES ('150929', '四子王旗', '150900');
INSERT INTO `yershop_area` VALUES ('150981', '丰镇市', '150900');
INSERT INTO `yershop_area` VALUES ('152201', '乌兰浩特市', '152200');
INSERT INTO `yershop_area` VALUES ('152202', '阿尔山市', '152200');
INSERT INTO `yershop_area` VALUES ('152221', '科尔沁右翼前旗', '152200');
INSERT INTO `yershop_area` VALUES ('152222', '科尔沁右翼中旗', '152200');
INSERT INTO `yershop_area` VALUES ('152223', '扎赉特旗', '152200');
INSERT INTO `yershop_area` VALUES ('152224', '突泉县', '152200');
INSERT INTO `yershop_area` VALUES ('152501', '二连浩特市', '152500');
INSERT INTO `yershop_area` VALUES ('152502', '锡林浩特市', '152500');
INSERT INTO `yershop_area` VALUES ('152522', '阿巴嘎旗', '152500');
INSERT INTO `yershop_area` VALUES ('152523', '苏尼特左旗', '152500');
INSERT INTO `yershop_area` VALUES ('152524', '苏尼特右旗', '152500');
INSERT INTO `yershop_area` VALUES ('152525', '东乌珠穆沁旗', '152500');
INSERT INTO `yershop_area` VALUES ('152526', '西乌珠穆沁旗', '152500');
INSERT INTO `yershop_area` VALUES ('152527', '太仆寺旗', '152500');
INSERT INTO `yershop_area` VALUES ('152528', '镶黄旗', '152500');
INSERT INTO `yershop_area` VALUES ('152529', '正镶白旗', '152500');
INSERT INTO `yershop_area` VALUES ('152530', '正蓝旗', '152500');
INSERT INTO `yershop_area` VALUES ('152531', '多伦县', '152500');
INSERT INTO `yershop_area` VALUES ('152921', '阿拉善左旗', '152900');
INSERT INTO `yershop_area` VALUES ('152922', '阿拉善右旗', '152900');
INSERT INTO `yershop_area` VALUES ('152923', '额济纳旗', '152900');
INSERT INTO `yershop_area` VALUES ('210101', '市辖区', '210100');
INSERT INTO `yershop_area` VALUES ('210102', '和平区', '210100');
INSERT INTO `yershop_area` VALUES ('210103', '沈河区', '210100');
INSERT INTO `yershop_area` VALUES ('210104', '大东区', '210100');
INSERT INTO `yershop_area` VALUES ('210105', '皇姑区', '210100');
INSERT INTO `yershop_area` VALUES ('210106', '铁西区', '210100');
INSERT INTO `yershop_area` VALUES ('210111', '苏家屯区', '210100');
INSERT INTO `yershop_area` VALUES ('210112', '东陵区', '210100');
INSERT INTO `yershop_area` VALUES ('210113', '新城子区', '210100');
INSERT INTO `yershop_area` VALUES ('210114', '于洪区', '210100');
INSERT INTO `yershop_area` VALUES ('210122', '辽中县', '210100');
INSERT INTO `yershop_area` VALUES ('210123', '康平县', '210100');
INSERT INTO `yershop_area` VALUES ('210124', '法库县', '210100');
INSERT INTO `yershop_area` VALUES ('210181', '新民市', '210100');
INSERT INTO `yershop_area` VALUES ('210201', '市辖区', '210200');
INSERT INTO `yershop_area` VALUES ('210202', '中山区', '210200');
INSERT INTO `yershop_area` VALUES ('210203', '西岗区', '210200');
INSERT INTO `yershop_area` VALUES ('210204', '沙河口区', '210200');
INSERT INTO `yershop_area` VALUES ('210211', '甘井子区', '210200');
INSERT INTO `yershop_area` VALUES ('210212', '旅顺口区', '210200');
INSERT INTO `yershop_area` VALUES ('210213', '金州区', '210200');
INSERT INTO `yershop_area` VALUES ('210224', '长海县', '210200');
INSERT INTO `yershop_area` VALUES ('210281', '瓦房店市', '210200');
INSERT INTO `yershop_area` VALUES ('210282', '普兰店市', '210200');
INSERT INTO `yershop_area` VALUES ('210283', '庄河市', '210200');
INSERT INTO `yershop_area` VALUES ('210301', '市辖区', '210300');
INSERT INTO `yershop_area` VALUES ('210302', '铁东区', '210300');
INSERT INTO `yershop_area` VALUES ('210303', '铁西区', '210300');
INSERT INTO `yershop_area` VALUES ('210304', '立山区', '210300');
INSERT INTO `yershop_area` VALUES ('210311', '千山区', '210300');
INSERT INTO `yershop_area` VALUES ('210321', '台安县', '210300');
INSERT INTO `yershop_area` VALUES ('210323', '岫岩满族自治县', '210300');
INSERT INTO `yershop_area` VALUES ('210381', '海城市', '210300');
INSERT INTO `yershop_area` VALUES ('210401', '市辖区', '210400');
INSERT INTO `yershop_area` VALUES ('210402', '新抚区', '210400');
INSERT INTO `yershop_area` VALUES ('210403', '东洲区', '210400');
INSERT INTO `yershop_area` VALUES ('210404', '望花区', '210400');
INSERT INTO `yershop_area` VALUES ('210411', '顺城区', '210400');
INSERT INTO `yershop_area` VALUES ('210421', '抚顺县', '210400');
INSERT INTO `yershop_area` VALUES ('210422', '新宾满族自治县', '210400');
INSERT INTO `yershop_area` VALUES ('210423', '清原满族自治县', '210400');
INSERT INTO `yershop_area` VALUES ('210501', '市辖区', '210500');
INSERT INTO `yershop_area` VALUES ('210502', '平山区', '210500');
INSERT INTO `yershop_area` VALUES ('210503', '溪湖区', '210500');
INSERT INTO `yershop_area` VALUES ('210504', '明山区', '210500');
INSERT INTO `yershop_area` VALUES ('210505', '南芬区', '210500');
INSERT INTO `yershop_area` VALUES ('210521', '本溪满族自治县', '210500');
INSERT INTO `yershop_area` VALUES ('210522', '桓仁满族自治县', '210500');
INSERT INTO `yershop_area` VALUES ('210601', '市辖区', '210600');
INSERT INTO `yershop_area` VALUES ('210602', '元宝区', '210600');
INSERT INTO `yershop_area` VALUES ('210603', '振兴区', '210600');
INSERT INTO `yershop_area` VALUES ('210604', '振安区', '210600');
INSERT INTO `yershop_area` VALUES ('210624', '宽甸满族自治县', '210600');
INSERT INTO `yershop_area` VALUES ('210681', '东港市', '210600');
INSERT INTO `yershop_area` VALUES ('210682', '凤城市', '210600');
INSERT INTO `yershop_area` VALUES ('210701', '市辖区', '210700');
INSERT INTO `yershop_area` VALUES ('210702', '古塔区', '210700');
INSERT INTO `yershop_area` VALUES ('210703', '凌河区', '210700');
INSERT INTO `yershop_area` VALUES ('210711', '太和区', '210700');
INSERT INTO `yershop_area` VALUES ('210726', '黑山县', '210700');
INSERT INTO `yershop_area` VALUES ('210727', '义　县', '210700');
INSERT INTO `yershop_area` VALUES ('210781', '凌海市', '210700');
INSERT INTO `yershop_area` VALUES ('210782', '北宁市', '210700');
INSERT INTO `yershop_area` VALUES ('210801', '市辖区', '210800');
INSERT INTO `yershop_area` VALUES ('210802', '站前区', '210800');
INSERT INTO `yershop_area` VALUES ('210803', '西市区', '210800');
INSERT INTO `yershop_area` VALUES ('210804', '鲅鱼圈区', '210800');
INSERT INTO `yershop_area` VALUES ('210811', '老边区', '210800');
INSERT INTO `yershop_area` VALUES ('210881', '盖州市', '210800');
INSERT INTO `yershop_area` VALUES ('210882', '大石桥市', '210800');
INSERT INTO `yershop_area` VALUES ('210901', '市辖区', '210900');
INSERT INTO `yershop_area` VALUES ('210902', '海州区', '210900');
INSERT INTO `yershop_area` VALUES ('210903', '新邱区', '210900');
INSERT INTO `yershop_area` VALUES ('210904', '太平区', '210900');
INSERT INTO `yershop_area` VALUES ('210905', '清河门区', '210900');
INSERT INTO `yershop_area` VALUES ('210911', '细河区', '210900');
INSERT INTO `yershop_area` VALUES ('210921', '阜新蒙古族自治县', '210900');
INSERT INTO `yershop_area` VALUES ('210922', '彰武县', '210900');
INSERT INTO `yershop_area` VALUES ('211001', '市辖区', '211000');
INSERT INTO `yershop_area` VALUES ('211002', '白塔区', '211000');
INSERT INTO `yershop_area` VALUES ('211003', '文圣区', '211000');
INSERT INTO `yershop_area` VALUES ('211004', '宏伟区', '211000');
INSERT INTO `yershop_area` VALUES ('211005', '弓长岭区', '211000');
INSERT INTO `yershop_area` VALUES ('211011', '太子河区', '211000');
INSERT INTO `yershop_area` VALUES ('211021', '辽阳县', '211000');
INSERT INTO `yershop_area` VALUES ('211081', '灯塔市', '211000');
INSERT INTO `yershop_area` VALUES ('211101', '市辖区', '211100');
INSERT INTO `yershop_area` VALUES ('211102', '双台子区', '211100');
INSERT INTO `yershop_area` VALUES ('211103', '兴隆台区', '211100');
INSERT INTO `yershop_area` VALUES ('211121', '大洼县', '211100');
INSERT INTO `yershop_area` VALUES ('211122', '盘山县', '211100');
INSERT INTO `yershop_area` VALUES ('211201', '市辖区', '211200');
INSERT INTO `yershop_area` VALUES ('211202', '银州区', '211200');
INSERT INTO `yershop_area` VALUES ('211204', '清河区', '211200');
INSERT INTO `yershop_area` VALUES ('211221', '铁岭县', '211200');
INSERT INTO `yershop_area` VALUES ('211223', '西丰县', '211200');
INSERT INTO `yershop_area` VALUES ('211224', '昌图县', '211200');
INSERT INTO `yershop_area` VALUES ('211281', '调兵山市', '211200');
INSERT INTO `yershop_area` VALUES ('211282', '开原市', '211200');
INSERT INTO `yershop_area` VALUES ('211301', '市辖区', '211300');
INSERT INTO `yershop_area` VALUES ('211302', '双塔区', '211300');
INSERT INTO `yershop_area` VALUES ('211303', '龙城区', '211300');
INSERT INTO `yershop_area` VALUES ('211321', '朝阳县', '211300');
INSERT INTO `yershop_area` VALUES ('211322', '建平县', '211300');
INSERT INTO `yershop_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `yershop_area` VALUES ('211381', '北票市', '211300');
INSERT INTO `yershop_area` VALUES ('211382', '凌源市', '211300');
INSERT INTO `yershop_area` VALUES ('211401', '市辖区', '211400');
INSERT INTO `yershop_area` VALUES ('211402', '连山区', '211400');
INSERT INTO `yershop_area` VALUES ('211403', '龙港区', '211400');
INSERT INTO `yershop_area` VALUES ('211404', '南票区', '211400');
INSERT INTO `yershop_area` VALUES ('211421', '绥中县', '211400');
INSERT INTO `yershop_area` VALUES ('211422', '建昌县', '211400');
INSERT INTO `yershop_area` VALUES ('211481', '兴城市', '211400');
INSERT INTO `yershop_area` VALUES ('220101', '市辖区', '220100');
INSERT INTO `yershop_area` VALUES ('220102', '南关区', '220100');
INSERT INTO `yershop_area` VALUES ('220103', '宽城区', '220100');
INSERT INTO `yershop_area` VALUES ('220104', '朝阳区', '220100');
INSERT INTO `yershop_area` VALUES ('220105', '二道区', '220100');
INSERT INTO `yershop_area` VALUES ('220106', '绿园区', '220100');
INSERT INTO `yershop_area` VALUES ('220112', '双阳区', '220100');
INSERT INTO `yershop_area` VALUES ('220122', '农安县', '220100');
INSERT INTO `yershop_area` VALUES ('220181', '九台市', '220100');
INSERT INTO `yershop_area` VALUES ('220182', '榆树市', '220100');
INSERT INTO `yershop_area` VALUES ('220183', '德惠市', '220100');
INSERT INTO `yershop_area` VALUES ('220201', '市辖区', '220200');
INSERT INTO `yershop_area` VALUES ('220202', '昌邑区', '220200');
INSERT INTO `yershop_area` VALUES ('220203', '龙潭区', '220200');
INSERT INTO `yershop_area` VALUES ('220204', '船营区', '220200');
INSERT INTO `yershop_area` VALUES ('220211', '丰满区', '220200');
INSERT INTO `yershop_area` VALUES ('220221', '永吉县', '220200');
INSERT INTO `yershop_area` VALUES ('220281', '蛟河市', '220200');
INSERT INTO `yershop_area` VALUES ('220282', '桦甸市', '220200');
INSERT INTO `yershop_area` VALUES ('220283', '舒兰市', '220200');
INSERT INTO `yershop_area` VALUES ('220284', '磐石市', '220200');
INSERT INTO `yershop_area` VALUES ('220301', '市辖区', '220300');
INSERT INTO `yershop_area` VALUES ('220302', '铁西区', '220300');
INSERT INTO `yershop_area` VALUES ('220303', '铁东区', '220300');
INSERT INTO `yershop_area` VALUES ('220322', '梨树县', '220300');
INSERT INTO `yershop_area` VALUES ('220323', '伊通满族自治县', '220300');
INSERT INTO `yershop_area` VALUES ('220381', '公主岭市', '220300');
INSERT INTO `yershop_area` VALUES ('220382', '双辽市', '220300');
INSERT INTO `yershop_area` VALUES ('220401', '市辖区', '220400');
INSERT INTO `yershop_area` VALUES ('220402', '龙山区', '220400');
INSERT INTO `yershop_area` VALUES ('220403', '西安区', '220400');
INSERT INTO `yershop_area` VALUES ('220421', '东丰县', '220400');
INSERT INTO `yershop_area` VALUES ('220422', '东辽县', '220400');
INSERT INTO `yershop_area` VALUES ('220501', '市辖区', '220500');
INSERT INTO `yershop_area` VALUES ('220502', '东昌区', '220500');
INSERT INTO `yershop_area` VALUES ('220503', '二道江区', '220500');
INSERT INTO `yershop_area` VALUES ('220521', '通化县', '220500');
INSERT INTO `yershop_area` VALUES ('220523', '辉南县', '220500');
INSERT INTO `yershop_area` VALUES ('220524', '柳河县', '220500');
INSERT INTO `yershop_area` VALUES ('220581', '梅河口市', '220500');
INSERT INTO `yershop_area` VALUES ('220582', '集安市', '220500');
INSERT INTO `yershop_area` VALUES ('220601', '市辖区', '220600');
INSERT INTO `yershop_area` VALUES ('220602', '八道江区', '220600');
INSERT INTO `yershop_area` VALUES ('220621', '抚松县', '220600');
INSERT INTO `yershop_area` VALUES ('220622', '靖宇县', '220600');
INSERT INTO `yershop_area` VALUES ('220623', '长白朝鲜族自治县', '220600');
INSERT INTO `yershop_area` VALUES ('220625', '江源县', '220600');
INSERT INTO `yershop_area` VALUES ('220681', '临江市', '220600');
INSERT INTO `yershop_area` VALUES ('220701', '市辖区', '220700');
INSERT INTO `yershop_area` VALUES ('220702', '宁江区', '220700');
INSERT INTO `yershop_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `yershop_area` VALUES ('220722', '长岭县', '220700');
INSERT INTO `yershop_area` VALUES ('220723', '乾安县', '220700');
INSERT INTO `yershop_area` VALUES ('220724', '扶余县', '220700');
INSERT INTO `yershop_area` VALUES ('220801', '市辖区', '220800');
INSERT INTO `yershop_area` VALUES ('220802', '洮北区', '220800');
INSERT INTO `yershop_area` VALUES ('220821', '镇赉县', '220800');
INSERT INTO `yershop_area` VALUES ('220822', '通榆县', '220800');
INSERT INTO `yershop_area` VALUES ('220881', '洮南市', '220800');
INSERT INTO `yershop_area` VALUES ('220882', '大安市', '220800');
INSERT INTO `yershop_area` VALUES ('222401', '延吉市', '222400');
INSERT INTO `yershop_area` VALUES ('222402', '图们市', '222400');
INSERT INTO `yershop_area` VALUES ('222403', '敦化市', '222400');
INSERT INTO `yershop_area` VALUES ('222404', '珲春市', '222400');
INSERT INTO `yershop_area` VALUES ('222405', '龙井市', '222400');
INSERT INTO `yershop_area` VALUES ('222406', '和龙市', '222400');
INSERT INTO `yershop_area` VALUES ('222424', '汪清县', '222400');
INSERT INTO `yershop_area` VALUES ('222426', '安图县', '222400');
INSERT INTO `yershop_area` VALUES ('230101', '市辖区', '230100');
INSERT INTO `yershop_area` VALUES ('230102', '道里区', '230100');
INSERT INTO `yershop_area` VALUES ('230103', '南岗区', '230100');
INSERT INTO `yershop_area` VALUES ('230104', '道外区', '230100');
INSERT INTO `yershop_area` VALUES ('230106', '香坊区', '230100');
INSERT INTO `yershop_area` VALUES ('230107', '动力区', '230100');
INSERT INTO `yershop_area` VALUES ('230108', '平房区', '230100');
INSERT INTO `yershop_area` VALUES ('230109', '松北区', '230100');
INSERT INTO `yershop_area` VALUES ('230111', '呼兰区', '230100');
INSERT INTO `yershop_area` VALUES ('230123', '依兰县', '230100');
INSERT INTO `yershop_area` VALUES ('230124', '方正县', '230100');
INSERT INTO `yershop_area` VALUES ('230125', '宾　县', '230100');
INSERT INTO `yershop_area` VALUES ('230126', '巴彦县', '230100');
INSERT INTO `yershop_area` VALUES ('230127', '木兰县', '230100');
INSERT INTO `yershop_area` VALUES ('230128', '通河县', '230100');
INSERT INTO `yershop_area` VALUES ('230129', '延寿县', '230100');
INSERT INTO `yershop_area` VALUES ('230181', '阿城市', '230100');
INSERT INTO `yershop_area` VALUES ('230182', '双城市', '230100');
INSERT INTO `yershop_area` VALUES ('230183', '尚志市', '230100');
INSERT INTO `yershop_area` VALUES ('230184', '五常市', '230100');
INSERT INTO `yershop_area` VALUES ('230201', '市辖区', '230200');
INSERT INTO `yershop_area` VALUES ('230202', '龙沙区', '230200');
INSERT INTO `yershop_area` VALUES ('230203', '建华区', '230200');
INSERT INTO `yershop_area` VALUES ('230204', '铁锋区', '230200');
INSERT INTO `yershop_area` VALUES ('230205', '昂昂溪区', '230200');
INSERT INTO `yershop_area` VALUES ('230206', '富拉尔基区', '230200');
INSERT INTO `yershop_area` VALUES ('230207', '碾子山区', '230200');
INSERT INTO `yershop_area` VALUES ('230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `yershop_area` VALUES ('230221', '龙江县', '230200');
INSERT INTO `yershop_area` VALUES ('230223', '依安县', '230200');
INSERT INTO `yershop_area` VALUES ('230224', '泰来县', '230200');
INSERT INTO `yershop_area` VALUES ('230225', '甘南县', '230200');
INSERT INTO `yershop_area` VALUES ('230227', '富裕县', '230200');
INSERT INTO `yershop_area` VALUES ('230229', '克山县', '230200');
INSERT INTO `yershop_area` VALUES ('230230', '克东县', '230200');
INSERT INTO `yershop_area` VALUES ('230231', '拜泉县', '230200');
INSERT INTO `yershop_area` VALUES ('230281', '讷河市', '230200');
INSERT INTO `yershop_area` VALUES ('230301', '市辖区', '230300');
INSERT INTO `yershop_area` VALUES ('230302', '鸡冠区', '230300');
INSERT INTO `yershop_area` VALUES ('230303', '恒山区', '230300');
INSERT INTO `yershop_area` VALUES ('230304', '滴道区', '230300');
INSERT INTO `yershop_area` VALUES ('230305', '梨树区', '230300');
INSERT INTO `yershop_area` VALUES ('230306', '城子河区', '230300');
INSERT INTO `yershop_area` VALUES ('230307', '麻山区', '230300');
INSERT INTO `yershop_area` VALUES ('230321', '鸡东县', '230300');
INSERT INTO `yershop_area` VALUES ('230381', '虎林市', '230300');
INSERT INTO `yershop_area` VALUES ('230382', '密山市', '230300');
INSERT INTO `yershop_area` VALUES ('230401', '市辖区', '230400');
INSERT INTO `yershop_area` VALUES ('230402', '向阳区', '230400');
INSERT INTO `yershop_area` VALUES ('230403', '工农区', '230400');
INSERT INTO `yershop_area` VALUES ('230404', '南山区', '230400');
INSERT INTO `yershop_area` VALUES ('230405', '兴安区', '230400');
INSERT INTO `yershop_area` VALUES ('230406', '东山区', '230400');
INSERT INTO `yershop_area` VALUES ('230407', '兴山区', '230400');
INSERT INTO `yershop_area` VALUES ('230421', '萝北县', '230400');
INSERT INTO `yershop_area` VALUES ('230422', '绥滨县', '230400');
INSERT INTO `yershop_area` VALUES ('230501', '市辖区', '230500');
INSERT INTO `yershop_area` VALUES ('230502', '尖山区', '230500');
INSERT INTO `yershop_area` VALUES ('230503', '岭东区', '230500');
INSERT INTO `yershop_area` VALUES ('230505', '四方台区', '230500');
INSERT INTO `yershop_area` VALUES ('230506', '宝山区', '230500');
INSERT INTO `yershop_area` VALUES ('230521', '集贤县', '230500');
INSERT INTO `yershop_area` VALUES ('230522', '友谊县', '230500');
INSERT INTO `yershop_area` VALUES ('230523', '宝清县', '230500');
INSERT INTO `yershop_area` VALUES ('230524', '饶河县', '230500');
INSERT INTO `yershop_area` VALUES ('230601', '市辖区', '230600');
INSERT INTO `yershop_area` VALUES ('230602', '萨尔图区', '230600');
INSERT INTO `yershop_area` VALUES ('230603', '龙凤区', '230600');
INSERT INTO `yershop_area` VALUES ('230604', '让胡路区', '230600');
INSERT INTO `yershop_area` VALUES ('230605', '红岗区', '230600');
INSERT INTO `yershop_area` VALUES ('230606', '大同区', '230600');
INSERT INTO `yershop_area` VALUES ('230621', '肇州县', '230600');
INSERT INTO `yershop_area` VALUES ('230622', '肇源县', '230600');
INSERT INTO `yershop_area` VALUES ('230623', '林甸县', '230600');
INSERT INTO `yershop_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `yershop_area` VALUES ('230701', '市辖区', '230700');
INSERT INTO `yershop_area` VALUES ('230702', '伊春区', '230700');
INSERT INTO `yershop_area` VALUES ('230703', '南岔区', '230700');
INSERT INTO `yershop_area` VALUES ('230704', '友好区', '230700');
INSERT INTO `yershop_area` VALUES ('230705', '西林区', '230700');
INSERT INTO `yershop_area` VALUES ('230706', '翠峦区', '230700');
INSERT INTO `yershop_area` VALUES ('230707', '新青区', '230700');
INSERT INTO `yershop_area` VALUES ('230708', '美溪区', '230700');
INSERT INTO `yershop_area` VALUES ('230709', '金山屯区', '230700');
INSERT INTO `yershop_area` VALUES ('230710', '五营区', '230700');
INSERT INTO `yershop_area` VALUES ('230711', '乌马河区', '230700');
INSERT INTO `yershop_area` VALUES ('230712', '汤旺河区', '230700');
INSERT INTO `yershop_area` VALUES ('230713', '带岭区', '230700');
INSERT INTO `yershop_area` VALUES ('230714', '乌伊岭区', '230700');
INSERT INTO `yershop_area` VALUES ('230715', '红星区', '230700');
INSERT INTO `yershop_area` VALUES ('230716', '上甘岭区', '230700');
INSERT INTO `yershop_area` VALUES ('230722', '嘉荫县', '230700');
INSERT INTO `yershop_area` VALUES ('230781', '铁力市', '230700');
INSERT INTO `yershop_area` VALUES ('230801', '市辖区', '230800');
INSERT INTO `yershop_area` VALUES ('230802', '永红区', '230800');
INSERT INTO `yershop_area` VALUES ('230803', '向阳区', '230800');
INSERT INTO `yershop_area` VALUES ('230804', '前进区', '230800');
INSERT INTO `yershop_area` VALUES ('230805', '东风区', '230800');
INSERT INTO `yershop_area` VALUES ('230811', '郊　区', '230800');
INSERT INTO `yershop_area` VALUES ('230822', '桦南县', '230800');
INSERT INTO `yershop_area` VALUES ('230826', '桦川县', '230800');
INSERT INTO `yershop_area` VALUES ('230828', '汤原县', '230800');
INSERT INTO `yershop_area` VALUES ('230833', '抚远县', '230800');
INSERT INTO `yershop_area` VALUES ('230881', '同江市', '230800');
INSERT INTO `yershop_area` VALUES ('230882', '富锦市', '230800');
INSERT INTO `yershop_area` VALUES ('230901', '市辖区', '230900');
INSERT INTO `yershop_area` VALUES ('230902', '新兴区', '230900');
INSERT INTO `yershop_area` VALUES ('230903', '桃山区', '230900');
INSERT INTO `yershop_area` VALUES ('230904', '茄子河区', '230900');
INSERT INTO `yershop_area` VALUES ('230921', '勃利县', '230900');
INSERT INTO `yershop_area` VALUES ('231001', '市辖区', '231000');
INSERT INTO `yershop_area` VALUES ('231002', '东安区', '231000');
INSERT INTO `yershop_area` VALUES ('231003', '阳明区', '231000');
INSERT INTO `yershop_area` VALUES ('231004', '爱民区', '231000');
INSERT INTO `yershop_area` VALUES ('231005', '西安区', '231000');
INSERT INTO `yershop_area` VALUES ('231024', '东宁县', '231000');
INSERT INTO `yershop_area` VALUES ('231025', '林口县', '231000');
INSERT INTO `yershop_area` VALUES ('231081', '绥芬河市', '231000');
INSERT INTO `yershop_area` VALUES ('231083', '海林市', '231000');
INSERT INTO `yershop_area` VALUES ('231084', '宁安市', '231000');
INSERT INTO `yershop_area` VALUES ('231085', '穆棱市', '231000');
INSERT INTO `yershop_area` VALUES ('231101', '市辖区', '231100');
INSERT INTO `yershop_area` VALUES ('231102', '爱辉区', '231100');
INSERT INTO `yershop_area` VALUES ('231121', '嫩江县', '231100');
INSERT INTO `yershop_area` VALUES ('231123', '逊克县', '231100');
INSERT INTO `yershop_area` VALUES ('231124', '孙吴县', '231100');
INSERT INTO `yershop_area` VALUES ('231181', '北安市', '231100');
INSERT INTO `yershop_area` VALUES ('231182', '五大连池市', '231100');
INSERT INTO `yershop_area` VALUES ('231201', '市辖区', '231200');
INSERT INTO `yershop_area` VALUES ('231202', '北林区', '231200');
INSERT INTO `yershop_area` VALUES ('231221', '望奎县', '231200');
INSERT INTO `yershop_area` VALUES ('231222', '兰西县', '231200');
INSERT INTO `yershop_area` VALUES ('231223', '青冈县', '231200');
INSERT INTO `yershop_area` VALUES ('231224', '庆安县', '231200');
INSERT INTO `yershop_area` VALUES ('231225', '明水县', '231200');
INSERT INTO `yershop_area` VALUES ('231226', '绥棱县', '231200');
INSERT INTO `yershop_area` VALUES ('231281', '安达市', '231200');
INSERT INTO `yershop_area` VALUES ('231282', '肇东市', '231200');
INSERT INTO `yershop_area` VALUES ('231283', '海伦市', '231200');
INSERT INTO `yershop_area` VALUES ('232721', '呼玛县', '232700');
INSERT INTO `yershop_area` VALUES ('232722', '塔河县', '232700');
INSERT INTO `yershop_area` VALUES ('232723', '漠河县', '232700');
INSERT INTO `yershop_area` VALUES ('310101', '黄浦区', '310100');
INSERT INTO `yershop_area` VALUES ('310103', '卢湾区', '310100');
INSERT INTO `yershop_area` VALUES ('310104', '徐汇区', '310100');
INSERT INTO `yershop_area` VALUES ('310105', '长宁区', '310100');
INSERT INTO `yershop_area` VALUES ('310106', '静安区', '310100');
INSERT INTO `yershop_area` VALUES ('310107', '普陀区', '310100');
INSERT INTO `yershop_area` VALUES ('310108', '闸北区', '310100');
INSERT INTO `yershop_area` VALUES ('310109', '虹口区', '310100');
INSERT INTO `yershop_area` VALUES ('310110', '杨浦区', '310100');
INSERT INTO `yershop_area` VALUES ('310112', '闵行区', '310100');
INSERT INTO `yershop_area` VALUES ('310113', '宝山区', '310100');
INSERT INTO `yershop_area` VALUES ('310114', '嘉定区', '310100');
INSERT INTO `yershop_area` VALUES ('310115', '浦东新区', '310100');
INSERT INTO `yershop_area` VALUES ('310116', '金山区', '310100');
INSERT INTO `yershop_area` VALUES ('310117', '松江区', '310100');
INSERT INTO `yershop_area` VALUES ('310118', '青浦区', '310100');
INSERT INTO `yershop_area` VALUES ('310119', '南汇区', '310100');
INSERT INTO `yershop_area` VALUES ('310120', '奉贤区', '310100');
INSERT INTO `yershop_area` VALUES ('310230', '崇明县', '310200');
INSERT INTO `yershop_area` VALUES ('320101', '市辖区', '320100');
INSERT INTO `yershop_area` VALUES ('320102', '玄武区', '320100');
INSERT INTO `yershop_area` VALUES ('320103', '白下区', '320100');
INSERT INTO `yershop_area` VALUES ('320104', '秦淮区', '320100');
INSERT INTO `yershop_area` VALUES ('320105', '建邺区', '320100');
INSERT INTO `yershop_area` VALUES ('320106', '鼓楼区', '320100');
INSERT INTO `yershop_area` VALUES ('320107', '下关区', '320100');
INSERT INTO `yershop_area` VALUES ('320111', '浦口区', '320100');
INSERT INTO `yershop_area` VALUES ('320113', '栖霞区', '320100');
INSERT INTO `yershop_area` VALUES ('320114', '雨花台区', '320100');
INSERT INTO `yershop_area` VALUES ('320115', '江宁区', '320100');
INSERT INTO `yershop_area` VALUES ('320116', '六合区', '320100');
INSERT INTO `yershop_area` VALUES ('320124', '溧水县', '320100');
INSERT INTO `yershop_area` VALUES ('320125', '高淳县', '320100');
INSERT INTO `yershop_area` VALUES ('320201', '市辖区', '320200');
INSERT INTO `yershop_area` VALUES ('320202', '崇安区', '320200');
INSERT INTO `yershop_area` VALUES ('320203', '南长区', '320200');
INSERT INTO `yershop_area` VALUES ('320204', '北塘区', '320200');
INSERT INTO `yershop_area` VALUES ('320205', '锡山区', '320200');
INSERT INTO `yershop_area` VALUES ('320206', '惠山区', '320200');
INSERT INTO `yershop_area` VALUES ('320211', '滨湖区', '320200');
INSERT INTO `yershop_area` VALUES ('320281', '江阴市', '320200');
INSERT INTO `yershop_area` VALUES ('320282', '宜兴市', '320200');
INSERT INTO `yershop_area` VALUES ('320301', '市辖区', '320300');
INSERT INTO `yershop_area` VALUES ('320302', '鼓楼区', '320300');
INSERT INTO `yershop_area` VALUES ('320303', '云龙区', '320300');
INSERT INTO `yershop_area` VALUES ('320304', '九里区', '320300');
INSERT INTO `yershop_area` VALUES ('320305', '贾汪区', '320300');
INSERT INTO `yershop_area` VALUES ('320311', '泉山区', '320300');
INSERT INTO `yershop_area` VALUES ('320321', '丰　县', '320300');
INSERT INTO `yershop_area` VALUES ('320322', '沛　县', '320300');
INSERT INTO `yershop_area` VALUES ('320323', '铜山县', '320300');
INSERT INTO `yershop_area` VALUES ('320324', '睢宁县', '320300');
INSERT INTO `yershop_area` VALUES ('320381', '新沂市', '320300');
INSERT INTO `yershop_area` VALUES ('320382', '邳州市', '320300');
INSERT INTO `yershop_area` VALUES ('320401', '市辖区', '320400');
INSERT INTO `yershop_area` VALUES ('320402', '天宁区', '320400');
INSERT INTO `yershop_area` VALUES ('320404', '钟楼区', '320400');
INSERT INTO `yershop_area` VALUES ('320405', '戚墅堰区', '320400');
INSERT INTO `yershop_area` VALUES ('320411', '新北区', '320400');
INSERT INTO `yershop_area` VALUES ('320412', '武进区', '320400');
INSERT INTO `yershop_area` VALUES ('320481', '溧阳市', '320400');
INSERT INTO `yershop_area` VALUES ('320482', '金坛市', '320400');
INSERT INTO `yershop_area` VALUES ('320501', '市辖区', '320500');
INSERT INTO `yershop_area` VALUES ('320502', '沧浪区', '320500');
INSERT INTO `yershop_area` VALUES ('320503', '平江区', '320500');
INSERT INTO `yershop_area` VALUES ('320504', '金阊区', '320500');
INSERT INTO `yershop_area` VALUES ('320505', '虎丘区', '320500');
INSERT INTO `yershop_area` VALUES ('320506', '吴中区', '320500');
INSERT INTO `yershop_area` VALUES ('320507', '相城区', '320500');
INSERT INTO `yershop_area` VALUES ('320581', '常熟市', '320500');
INSERT INTO `yershop_area` VALUES ('320582', '张家港市', '320500');
INSERT INTO `yershop_area` VALUES ('320583', '昆山市', '320500');
INSERT INTO `yershop_area` VALUES ('320584', '吴江市', '320500');
INSERT INTO `yershop_area` VALUES ('320585', '太仓市', '320500');
INSERT INTO `yershop_area` VALUES ('320601', '市辖区', '320600');
INSERT INTO `yershop_area` VALUES ('320602', '崇川区', '320600');
INSERT INTO `yershop_area` VALUES ('320611', '港闸区', '320600');
INSERT INTO `yershop_area` VALUES ('320621', '海安县', '320600');
INSERT INTO `yershop_area` VALUES ('320623', '如东县', '320600');
INSERT INTO `yershop_area` VALUES ('320681', '启东市', '320600');
INSERT INTO `yershop_area` VALUES ('320682', '如皋市', '320600');
INSERT INTO `yershop_area` VALUES ('320683', '通州市', '320600');
INSERT INTO `yershop_area` VALUES ('320684', '海门市', '320600');
INSERT INTO `yershop_area` VALUES ('320701', '市辖区', '320700');
INSERT INTO `yershop_area` VALUES ('320703', '连云区', '320700');
INSERT INTO `yershop_area` VALUES ('320705', '新浦区', '320700');
INSERT INTO `yershop_area` VALUES ('320706', '海州区', '320700');
INSERT INTO `yershop_area` VALUES ('320721', '赣榆县', '320700');
INSERT INTO `yershop_area` VALUES ('320722', '东海县', '320700');
INSERT INTO `yershop_area` VALUES ('320723', '灌云县', '320700');
INSERT INTO `yershop_area` VALUES ('320724', '灌南县', '320700');
INSERT INTO `yershop_area` VALUES ('320801', '市辖区', '320800');
INSERT INTO `yershop_area` VALUES ('320802', '清河区', '320800');
INSERT INTO `yershop_area` VALUES ('320803', '楚州区', '320800');
INSERT INTO `yershop_area` VALUES ('320804', '淮阴区', '320800');
INSERT INTO `yershop_area` VALUES ('320811', '清浦区', '320800');
INSERT INTO `yershop_area` VALUES ('320826', '涟水县', '320800');
INSERT INTO `yershop_area` VALUES ('320829', '洪泽县', '320800');
INSERT INTO `yershop_area` VALUES ('320830', '盱眙县', '320800');
INSERT INTO `yershop_area` VALUES ('320831', '金湖县', '320800');
INSERT INTO `yershop_area` VALUES ('320901', '市辖区', '320900');
INSERT INTO `yershop_area` VALUES ('320902', '亭湖区', '320900');
INSERT INTO `yershop_area` VALUES ('320903', '盐都区', '320900');
INSERT INTO `yershop_area` VALUES ('320921', '响水县', '320900');
INSERT INTO `yershop_area` VALUES ('320922', '滨海县', '320900');
INSERT INTO `yershop_area` VALUES ('320923', '阜宁县', '320900');
INSERT INTO `yershop_area` VALUES ('320924', '射阳县', '320900');
INSERT INTO `yershop_area` VALUES ('320925', '建湖县', '320900');
INSERT INTO `yershop_area` VALUES ('320981', '东台市', '320900');
INSERT INTO `yershop_area` VALUES ('320982', '大丰市', '320900');
INSERT INTO `yershop_area` VALUES ('321001', '市辖区', '321000');
INSERT INTO `yershop_area` VALUES ('321002', '广陵区', '321000');
INSERT INTO `yershop_area` VALUES ('321003', '邗江区', '321000');
INSERT INTO `yershop_area` VALUES ('321011', '郊　区', '321000');
INSERT INTO `yershop_area` VALUES ('321023', '宝应县', '321000');
INSERT INTO `yershop_area` VALUES ('321081', '仪征市', '321000');
INSERT INTO `yershop_area` VALUES ('321084', '高邮市', '321000');
INSERT INTO `yershop_area` VALUES ('321088', '江都市', '321000');
INSERT INTO `yershop_area` VALUES ('321101', '市辖区', '321100');
INSERT INTO `yershop_area` VALUES ('321102', '京口区', '321100');
INSERT INTO `yershop_area` VALUES ('321111', '润州区', '321100');
INSERT INTO `yershop_area` VALUES ('321112', '丹徒区', '321100');
INSERT INTO `yershop_area` VALUES ('321181', '丹阳市', '321100');
INSERT INTO `yershop_area` VALUES ('321182', '扬中市', '321100');
INSERT INTO `yershop_area` VALUES ('321183', '句容市', '321100');
INSERT INTO `yershop_area` VALUES ('321201', '市辖区', '321200');
INSERT INTO `yershop_area` VALUES ('321202', '海陵区', '321200');
INSERT INTO `yershop_area` VALUES ('321203', '高港区', '321200');
INSERT INTO `yershop_area` VALUES ('321281', '兴化市', '321200');
INSERT INTO `yershop_area` VALUES ('321282', '靖江市', '321200');
INSERT INTO `yershop_area` VALUES ('321283', '泰兴市', '321200');
INSERT INTO `yershop_area` VALUES ('321284', '姜堰市', '321200');
INSERT INTO `yershop_area` VALUES ('321301', '市辖区', '321300');
INSERT INTO `yershop_area` VALUES ('321302', '宿城区', '321300');
INSERT INTO `yershop_area` VALUES ('321311', '宿豫区', '321300');
INSERT INTO `yershop_area` VALUES ('321322', '沭阳县', '321300');
INSERT INTO `yershop_area` VALUES ('321323', '泗阳县', '321300');
INSERT INTO `yershop_area` VALUES ('321324', '泗洪县', '321300');
INSERT INTO `yershop_area` VALUES ('330101', '市辖区', '330100');
INSERT INTO `yershop_area` VALUES ('330102', '上城区', '330100');
INSERT INTO `yershop_area` VALUES ('330103', '下城区', '330100');
INSERT INTO `yershop_area` VALUES ('330104', '江干区', '330100');
INSERT INTO `yershop_area` VALUES ('330105', '拱墅区', '330100');
INSERT INTO `yershop_area` VALUES ('330106', '西湖区', '330100');
INSERT INTO `yershop_area` VALUES ('330108', '滨江区', '330100');
INSERT INTO `yershop_area` VALUES ('330109', '萧山区', '330100');
INSERT INTO `yershop_area` VALUES ('330110', '余杭区', '330100');
INSERT INTO `yershop_area` VALUES ('330122', '桐庐县', '330100');
INSERT INTO `yershop_area` VALUES ('330127', '淳安县', '330100');
INSERT INTO `yershop_area` VALUES ('330182', '建德市', '330100');
INSERT INTO `yershop_area` VALUES ('330183', '富阳市', '330100');
INSERT INTO `yershop_area` VALUES ('330185', '临安市', '330100');
INSERT INTO `yershop_area` VALUES ('330201', '市辖区', '330200');
INSERT INTO `yershop_area` VALUES ('330203', '海曙区', '330200');
INSERT INTO `yershop_area` VALUES ('330204', '江东区', '330200');
INSERT INTO `yershop_area` VALUES ('330205', '江北区', '330200');
INSERT INTO `yershop_area` VALUES ('330206', '北仑区', '330200');
INSERT INTO `yershop_area` VALUES ('330211', '镇海区', '330200');
INSERT INTO `yershop_area` VALUES ('330212', '鄞州区', '330200');
INSERT INTO `yershop_area` VALUES ('330225', '象山县', '330200');
INSERT INTO `yershop_area` VALUES ('330226', '宁海县', '330200');
INSERT INTO `yershop_area` VALUES ('330281', '余姚市', '330200');
INSERT INTO `yershop_area` VALUES ('330282', '慈溪市', '330200');
INSERT INTO `yershop_area` VALUES ('330283', '奉化市', '330200');
INSERT INTO `yershop_area` VALUES ('330301', '市辖区', '330300');
INSERT INTO `yershop_area` VALUES ('330302', '鹿城区', '330300');
INSERT INTO `yershop_area` VALUES ('330303', '龙湾区', '330300');
INSERT INTO `yershop_area` VALUES ('330304', '瓯海区', '330300');
INSERT INTO `yershop_area` VALUES ('330322', '洞头县', '330300');
INSERT INTO `yershop_area` VALUES ('330324', '永嘉县', '330300');
INSERT INTO `yershop_area` VALUES ('330326', '平阳县', '330300');
INSERT INTO `yershop_area` VALUES ('330327', '苍南县', '330300');
INSERT INTO `yershop_area` VALUES ('330328', '文成县', '330300');
INSERT INTO `yershop_area` VALUES ('330329', '泰顺县', '330300');
INSERT INTO `yershop_area` VALUES ('330381', '瑞安市', '330300');
INSERT INTO `yershop_area` VALUES ('330382', '乐清市', '330300');
INSERT INTO `yershop_area` VALUES ('330401', '市辖区', '330400');
INSERT INTO `yershop_area` VALUES ('330402', '秀城区', '330400');
INSERT INTO `yershop_area` VALUES ('330411', '秀洲区', '330400');
INSERT INTO `yershop_area` VALUES ('330421', '嘉善县', '330400');
INSERT INTO `yershop_area` VALUES ('330424', '海盐县', '330400');
INSERT INTO `yershop_area` VALUES ('330481', '海宁市', '330400');
INSERT INTO `yershop_area` VALUES ('330482', '平湖市', '330400');
INSERT INTO `yershop_area` VALUES ('330483', '桐乡市', '330400');
INSERT INTO `yershop_area` VALUES ('330501', '市辖区', '330500');
INSERT INTO `yershop_area` VALUES ('330502', '吴兴区', '330500');
INSERT INTO `yershop_area` VALUES ('330503', '南浔区', '330500');
INSERT INTO `yershop_area` VALUES ('330521', '德清县', '330500');
INSERT INTO `yershop_area` VALUES ('330522', '长兴县', '330500');
INSERT INTO `yershop_area` VALUES ('330523', '安吉县', '330500');
INSERT INTO `yershop_area` VALUES ('330601', '市辖区', '330600');
INSERT INTO `yershop_area` VALUES ('330602', '越城区', '330600');
INSERT INTO `yershop_area` VALUES ('330621', '绍兴县', '330600');
INSERT INTO `yershop_area` VALUES ('330624', '新昌县', '330600');
INSERT INTO `yershop_area` VALUES ('330681', '诸暨市', '330600');
INSERT INTO `yershop_area` VALUES ('330682', '上虞市', '330600');
INSERT INTO `yershop_area` VALUES ('330683', '嵊州市', '330600');
INSERT INTO `yershop_area` VALUES ('330701', '市辖区', '330700');
INSERT INTO `yershop_area` VALUES ('330702', '婺城区', '330700');
INSERT INTO `yershop_area` VALUES ('330703', '金东区', '330700');
INSERT INTO `yershop_area` VALUES ('330723', '武义县', '330700');
INSERT INTO `yershop_area` VALUES ('330726', '浦江县', '330700');
INSERT INTO `yershop_area` VALUES ('330727', '磐安县', '330700');
INSERT INTO `yershop_area` VALUES ('330781', '兰溪市', '330700');
INSERT INTO `yershop_area` VALUES ('330782', '义乌市', '330700');
INSERT INTO `yershop_area` VALUES ('330783', '东阳市', '330700');
INSERT INTO `yershop_area` VALUES ('330784', '永康市', '330700');
INSERT INTO `yershop_area` VALUES ('330801', '市辖区', '330800');
INSERT INTO `yershop_area` VALUES ('330802', '柯城区', '330800');
INSERT INTO `yershop_area` VALUES ('330803', '衢江区', '330800');
INSERT INTO `yershop_area` VALUES ('330822', '常山县', '330800');
INSERT INTO `yershop_area` VALUES ('330824', '开化县', '330800');
INSERT INTO `yershop_area` VALUES ('330825', '龙游县', '330800');
INSERT INTO `yershop_area` VALUES ('330881', '江山市', '330800');
INSERT INTO `yershop_area` VALUES ('330901', '市辖区', '330900');
INSERT INTO `yershop_area` VALUES ('330902', '定海区', '330900');
INSERT INTO `yershop_area` VALUES ('330903', '普陀区', '330900');
INSERT INTO `yershop_area` VALUES ('330921', '岱山县', '330900');
INSERT INTO `yershop_area` VALUES ('330922', '嵊泗县', '330900');
INSERT INTO `yershop_area` VALUES ('331001', '市辖区', '331000');
INSERT INTO `yershop_area` VALUES ('331002', '椒江区', '331000');
INSERT INTO `yershop_area` VALUES ('331003', '黄岩区', '331000');
INSERT INTO `yershop_area` VALUES ('331004', '路桥区', '331000');
INSERT INTO `yershop_area` VALUES ('331021', '玉环县', '331000');
INSERT INTO `yershop_area` VALUES ('331022', '三门县', '331000');
INSERT INTO `yershop_area` VALUES ('331023', '天台县', '331000');
INSERT INTO `yershop_area` VALUES ('331024', '仙居县', '331000');
INSERT INTO `yershop_area` VALUES ('331081', '温岭市', '331000');
INSERT INTO `yershop_area` VALUES ('331082', '临海市', '331000');
INSERT INTO `yershop_area` VALUES ('331101', '市辖区', '331100');
INSERT INTO `yershop_area` VALUES ('331102', '莲都区', '331100');
INSERT INTO `yershop_area` VALUES ('331121', '青田县', '331100');
INSERT INTO `yershop_area` VALUES ('331122', '缙云县', '331100');
INSERT INTO `yershop_area` VALUES ('331123', '遂昌县', '331100');
INSERT INTO `yershop_area` VALUES ('331124', '松阳县', '331100');
INSERT INTO `yershop_area` VALUES ('331125', '云和县', '331100');
INSERT INTO `yershop_area` VALUES ('331126', '庆元县', '331100');
INSERT INTO `yershop_area` VALUES ('331127', '景宁畲族自治县', '331100');
INSERT INTO `yershop_area` VALUES ('331181', '龙泉市', '331100');
INSERT INTO `yershop_area` VALUES ('340101', '市辖区', '340100');
INSERT INTO `yershop_area` VALUES ('340102', '瑶海区', '340100');
INSERT INTO `yershop_area` VALUES ('340103', '庐阳区', '340100');
INSERT INTO `yershop_area` VALUES ('340104', '蜀山区', '340100');
INSERT INTO `yershop_area` VALUES ('340111', '包河区', '340100');
INSERT INTO `yershop_area` VALUES ('340121', '长丰县', '340100');
INSERT INTO `yershop_area` VALUES ('340122', '肥东县', '340100');
INSERT INTO `yershop_area` VALUES ('340123', '肥西县', '340100');
INSERT INTO `yershop_area` VALUES ('340201', '市辖区', '340200');
INSERT INTO `yershop_area` VALUES ('340202', '镜湖区', '340200');
INSERT INTO `yershop_area` VALUES ('340203', '马塘区', '340200');
INSERT INTO `yershop_area` VALUES ('340204', '新芜区', '340200');
INSERT INTO `yershop_area` VALUES ('340207', '鸠江区', '340200');
INSERT INTO `yershop_area` VALUES ('340221', '芜湖县', '340200');
INSERT INTO `yershop_area` VALUES ('340222', '繁昌县', '340200');
INSERT INTO `yershop_area` VALUES ('340223', '南陵县', '340200');
INSERT INTO `yershop_area` VALUES ('340301', '市辖区', '340300');
INSERT INTO `yershop_area` VALUES ('340302', '龙子湖区', '340300');
INSERT INTO `yershop_area` VALUES ('340303', '蚌山区', '340300');
INSERT INTO `yershop_area` VALUES ('340304', '禹会区', '340300');
INSERT INTO `yershop_area` VALUES ('340311', '淮上区', '340300');
INSERT INTO `yershop_area` VALUES ('340321', '怀远县', '340300');
INSERT INTO `yershop_area` VALUES ('340322', '五河县', '340300');
INSERT INTO `yershop_area` VALUES ('340323', '固镇县', '340300');
INSERT INTO `yershop_area` VALUES ('340401', '市辖区', '340400');
INSERT INTO `yershop_area` VALUES ('340402', '大通区', '340400');
INSERT INTO `yershop_area` VALUES ('340403', '田家庵区', '340400');
INSERT INTO `yershop_area` VALUES ('340404', '谢家集区', '340400');
INSERT INTO `yershop_area` VALUES ('340405', '八公山区', '340400');
INSERT INTO `yershop_area` VALUES ('340406', '潘集区', '340400');
INSERT INTO `yershop_area` VALUES ('340421', '凤台县', '340400');
INSERT INTO `yershop_area` VALUES ('340501', '市辖区', '340500');
INSERT INTO `yershop_area` VALUES ('340502', '金家庄区', '340500');
INSERT INTO `yershop_area` VALUES ('340503', '花山区', '340500');
INSERT INTO `yershop_area` VALUES ('340504', '雨山区', '340500');
INSERT INTO `yershop_area` VALUES ('340521', '当涂县', '340500');
INSERT INTO `yershop_area` VALUES ('340601', '市辖区', '340600');
INSERT INTO `yershop_area` VALUES ('340602', '杜集区', '340600');
INSERT INTO `yershop_area` VALUES ('340603', '相山区', '340600');
INSERT INTO `yershop_area` VALUES ('340604', '烈山区', '340600');
INSERT INTO `yershop_area` VALUES ('340621', '濉溪县', '340600');
INSERT INTO `yershop_area` VALUES ('340701', '市辖区', '340700');
INSERT INTO `yershop_area` VALUES ('340702', '铜官山区', '340700');
INSERT INTO `yershop_area` VALUES ('340703', '狮子山区', '340700');
INSERT INTO `yershop_area` VALUES ('340711', '郊　区', '340700');
INSERT INTO `yershop_area` VALUES ('340721', '铜陵县', '340700');
INSERT INTO `yershop_area` VALUES ('340801', '市辖区', '340800');
INSERT INTO `yershop_area` VALUES ('340802', '迎江区', '340800');
INSERT INTO `yershop_area` VALUES ('340803', '大观区', '340800');
INSERT INTO `yershop_area` VALUES ('340811', '郊　区', '340800');
INSERT INTO `yershop_area` VALUES ('340822', '怀宁县', '340800');
INSERT INTO `yershop_area` VALUES ('340823', '枞阳县', '340800');
INSERT INTO `yershop_area` VALUES ('340824', '潜山县', '340800');
INSERT INTO `yershop_area` VALUES ('340825', '太湖县', '340800');
INSERT INTO `yershop_area` VALUES ('340826', '宿松县', '340800');
INSERT INTO `yershop_area` VALUES ('340827', '望江县', '340800');
INSERT INTO `yershop_area` VALUES ('340828', '岳西县', '340800');
INSERT INTO `yershop_area` VALUES ('340881', '桐城市', '340800');
INSERT INTO `yershop_area` VALUES ('341001', '市辖区', '341000');
INSERT INTO `yershop_area` VALUES ('341002', '屯溪区', '341000');
INSERT INTO `yershop_area` VALUES ('341003', '黄山区', '341000');
INSERT INTO `yershop_area` VALUES ('341004', '徽州区', '341000');
INSERT INTO `yershop_area` VALUES ('341021', '歙　县', '341000');
INSERT INTO `yershop_area` VALUES ('341022', '休宁县', '341000');
INSERT INTO `yershop_area` VALUES ('341023', '黟　县', '341000');
INSERT INTO `yershop_area` VALUES ('341024', '祁门县', '341000');
INSERT INTO `yershop_area` VALUES ('341101', '市辖区', '341100');
INSERT INTO `yershop_area` VALUES ('341102', '琅琊区', '341100');
INSERT INTO `yershop_area` VALUES ('341103', '南谯区', '341100');
INSERT INTO `yershop_area` VALUES ('341122', '来安县', '341100');
INSERT INTO `yershop_area` VALUES ('341124', '全椒县', '341100');
INSERT INTO `yershop_area` VALUES ('341125', '定远县', '341100');
INSERT INTO `yershop_area` VALUES ('341126', '凤阳县', '341100');
INSERT INTO `yershop_area` VALUES ('341181', '天长市', '341100');
INSERT INTO `yershop_area` VALUES ('341182', '明光市', '341100');
INSERT INTO `yershop_area` VALUES ('341201', '市辖区', '341200');
INSERT INTO `yershop_area` VALUES ('341202', '颍州区', '341200');
INSERT INTO `yershop_area` VALUES ('341203', '颍东区', '341200');
INSERT INTO `yershop_area` VALUES ('341204', '颍泉区', '341200');
INSERT INTO `yershop_area` VALUES ('341221', '临泉县', '341200');
INSERT INTO `yershop_area` VALUES ('341222', '太和县', '341200');
INSERT INTO `yershop_area` VALUES ('341225', '阜南县', '341200');
INSERT INTO `yershop_area` VALUES ('341226', '颍上县', '341200');
INSERT INTO `yershop_area` VALUES ('341282', '界首市', '341200');
INSERT INTO `yershop_area` VALUES ('341301', '市辖区', '341300');
INSERT INTO `yershop_area` VALUES ('341302', '墉桥区', '341300');
INSERT INTO `yershop_area` VALUES ('341321', '砀山县', '341300');
INSERT INTO `yershop_area` VALUES ('341322', '萧　县', '341300');
INSERT INTO `yershop_area` VALUES ('341323', '灵璧县', '341300');
INSERT INTO `yershop_area` VALUES ('341324', '泗　县', '341300');
INSERT INTO `yershop_area` VALUES ('341401', '市辖区', '341400');
INSERT INTO `yershop_area` VALUES ('341402', '居巢区', '341400');
INSERT INTO `yershop_area` VALUES ('341421', '庐江县', '341400');
INSERT INTO `yershop_area` VALUES ('341422', '无为县', '341400');
INSERT INTO `yershop_area` VALUES ('341423', '含山县', '341400');
INSERT INTO `yershop_area` VALUES ('341424', '和　县', '341400');
INSERT INTO `yershop_area` VALUES ('341501', '市辖区', '341500');
INSERT INTO `yershop_area` VALUES ('341502', '金安区', '341500');
INSERT INTO `yershop_area` VALUES ('341503', '裕安区', '341500');
INSERT INTO `yershop_area` VALUES ('341521', '寿　县', '341500');
INSERT INTO `yershop_area` VALUES ('341522', '霍邱县', '341500');
INSERT INTO `yershop_area` VALUES ('341523', '舒城县', '341500');
INSERT INTO `yershop_area` VALUES ('341524', '金寨县', '341500');
INSERT INTO `yershop_area` VALUES ('341525', '霍山县', '341500');
INSERT INTO `yershop_area` VALUES ('341601', '市辖区', '341600');
INSERT INTO `yershop_area` VALUES ('341602', '谯城区', '341600');
INSERT INTO `yershop_area` VALUES ('341621', '涡阳县', '341600');
INSERT INTO `yershop_area` VALUES ('341622', '蒙城县', '341600');
INSERT INTO `yershop_area` VALUES ('341623', '利辛县', '341600');
INSERT INTO `yershop_area` VALUES ('341701', '市辖区', '341700');
INSERT INTO `yershop_area` VALUES ('341702', '贵池区', '341700');
INSERT INTO `yershop_area` VALUES ('341721', '东至县', '341700');
INSERT INTO `yershop_area` VALUES ('341722', '石台县', '341700');
INSERT INTO `yershop_area` VALUES ('341723', '青阳县', '341700');
INSERT INTO `yershop_area` VALUES ('341801', '市辖区', '341800');
INSERT INTO `yershop_area` VALUES ('341802', '宣州区', '341800');
INSERT INTO `yershop_area` VALUES ('341821', '郎溪县', '341800');
INSERT INTO `yershop_area` VALUES ('341822', '广德县', '341800');
INSERT INTO `yershop_area` VALUES ('341823', '泾　县', '341800');
INSERT INTO `yershop_area` VALUES ('341824', '绩溪县', '341800');
INSERT INTO `yershop_area` VALUES ('341825', '旌德县', '341800');
INSERT INTO `yershop_area` VALUES ('341881', '宁国市', '341800');
INSERT INTO `yershop_area` VALUES ('350101', '市辖区', '350100');
INSERT INTO `yershop_area` VALUES ('350102', '鼓楼区', '350100');
INSERT INTO `yershop_area` VALUES ('350103', '台江区', '350100');
INSERT INTO `yershop_area` VALUES ('350104', '仓山区', '350100');
INSERT INTO `yershop_area` VALUES ('350105', '马尾区', '350100');
INSERT INTO `yershop_area` VALUES ('350111', '晋安区', '350100');
INSERT INTO `yershop_area` VALUES ('350121', '闽侯县', '350100');
INSERT INTO `yershop_area` VALUES ('350122', '连江县', '350100');
INSERT INTO `yershop_area` VALUES ('350123', '罗源县', '350100');
INSERT INTO `yershop_area` VALUES ('350124', '闽清县', '350100');
INSERT INTO `yershop_area` VALUES ('350125', '永泰县', '350100');
INSERT INTO `yershop_area` VALUES ('350128', '平潭县', '350100');
INSERT INTO `yershop_area` VALUES ('350181', '福清市', '350100');
INSERT INTO `yershop_area` VALUES ('350182', '长乐市', '350100');
INSERT INTO `yershop_area` VALUES ('350201', '市辖区', '350200');
INSERT INTO `yershop_area` VALUES ('350203', '思明区', '350200');
INSERT INTO `yershop_area` VALUES ('350205', '海沧区', '350200');
INSERT INTO `yershop_area` VALUES ('350206', '湖里区', '350200');
INSERT INTO `yershop_area` VALUES ('350211', '集美区', '350200');
INSERT INTO `yershop_area` VALUES ('350212', '同安区', '350200');
INSERT INTO `yershop_area` VALUES ('350213', '翔安区', '350200');
INSERT INTO `yershop_area` VALUES ('350301', '市辖区', '350300');
INSERT INTO `yershop_area` VALUES ('350302', '城厢区', '350300');
INSERT INTO `yershop_area` VALUES ('350303', '涵江区', '350300');
INSERT INTO `yershop_area` VALUES ('350304', '荔城区', '350300');
INSERT INTO `yershop_area` VALUES ('350305', '秀屿区', '350300');
INSERT INTO `yershop_area` VALUES ('350322', '仙游县', '350300');
INSERT INTO `yershop_area` VALUES ('350401', '市辖区', '350400');
INSERT INTO `yershop_area` VALUES ('350402', '梅列区', '350400');
INSERT INTO `yershop_area` VALUES ('350403', '三元区', '350400');
INSERT INTO `yershop_area` VALUES ('350421', '明溪县', '350400');
INSERT INTO `yershop_area` VALUES ('350423', '清流县', '350400');
INSERT INTO `yershop_area` VALUES ('350424', '宁化县', '350400');
INSERT INTO `yershop_area` VALUES ('350425', '大田县', '350400');
INSERT INTO `yershop_area` VALUES ('350426', '尤溪县', '350400');
INSERT INTO `yershop_area` VALUES ('350427', '沙　县', '350400');
INSERT INTO `yershop_area` VALUES ('350428', '将乐县', '350400');
INSERT INTO `yershop_area` VALUES ('350429', '泰宁县', '350400');
INSERT INTO `yershop_area` VALUES ('350430', '建宁县', '350400');
INSERT INTO `yershop_area` VALUES ('350481', '永安市', '350400');
INSERT INTO `yershop_area` VALUES ('350501', '市辖区', '350500');
INSERT INTO `yershop_area` VALUES ('350502', '鲤城区', '350500');
INSERT INTO `yershop_area` VALUES ('350503', '丰泽区', '350500');
INSERT INTO `yershop_area` VALUES ('350504', '洛江区', '350500');
INSERT INTO `yershop_area` VALUES ('350505', '泉港区', '350500');
INSERT INTO `yershop_area` VALUES ('350521', '惠安县', '350500');
INSERT INTO `yershop_area` VALUES ('350524', '安溪县', '350500');
INSERT INTO `yershop_area` VALUES ('350525', '永春县', '350500');
INSERT INTO `yershop_area` VALUES ('350526', '德化县', '350500');
INSERT INTO `yershop_area` VALUES ('350527', '金门县', '350500');
INSERT INTO `yershop_area` VALUES ('350581', '石狮市', '350500');
INSERT INTO `yershop_area` VALUES ('350582', '晋江市', '350500');
INSERT INTO `yershop_area` VALUES ('350583', '南安市', '350500');
INSERT INTO `yershop_area` VALUES ('350601', '市辖区', '350600');
INSERT INTO `yershop_area` VALUES ('350602', '芗城区', '350600');
INSERT INTO `yershop_area` VALUES ('350603', '龙文区', '350600');
INSERT INTO `yershop_area` VALUES ('350622', '云霄县', '350600');
INSERT INTO `yershop_area` VALUES ('350623', '漳浦县', '350600');
INSERT INTO `yershop_area` VALUES ('350624', '诏安县', '350600');
INSERT INTO `yershop_area` VALUES ('350625', '长泰县', '350600');
INSERT INTO `yershop_area` VALUES ('350626', '东山县', '350600');
INSERT INTO `yershop_area` VALUES ('350627', '南靖县', '350600');
INSERT INTO `yershop_area` VALUES ('350628', '平和县', '350600');
INSERT INTO `yershop_area` VALUES ('350629', '华安县', '350600');
INSERT INTO `yershop_area` VALUES ('350681', '龙海市', '350600');
INSERT INTO `yershop_area` VALUES ('350701', '市辖区', '350700');
INSERT INTO `yershop_area` VALUES ('350702', '延平区', '350700');
INSERT INTO `yershop_area` VALUES ('350721', '顺昌县', '350700');
INSERT INTO `yershop_area` VALUES ('350722', '浦城县', '350700');
INSERT INTO `yershop_area` VALUES ('350723', '光泽县', '350700');
INSERT INTO `yershop_area` VALUES ('350724', '松溪县', '350700');
INSERT INTO `yershop_area` VALUES ('350725', '政和县', '350700');
INSERT INTO `yershop_area` VALUES ('350781', '邵武市', '350700');
INSERT INTO `yershop_area` VALUES ('350782', '武夷山市', '350700');
INSERT INTO `yershop_area` VALUES ('350783', '建瓯市', '350700');
INSERT INTO `yershop_area` VALUES ('350784', '建阳市', '350700');
INSERT INTO `yershop_area` VALUES ('350801', '市辖区', '350800');
INSERT INTO `yershop_area` VALUES ('350802', '新罗区', '350800');
INSERT INTO `yershop_area` VALUES ('350821', '长汀县', '350800');
INSERT INTO `yershop_area` VALUES ('350822', '永定县', '350800');
INSERT INTO `yershop_area` VALUES ('350823', '上杭县', '350800');
INSERT INTO `yershop_area` VALUES ('350824', '武平县', '350800');
INSERT INTO `yershop_area` VALUES ('350825', '连城县', '350800');
INSERT INTO `yershop_area` VALUES ('350881', '漳平市', '350800');
INSERT INTO `yershop_area` VALUES ('350901', '市辖区', '350900');
INSERT INTO `yershop_area` VALUES ('350902', '蕉城区', '350900');
INSERT INTO `yershop_area` VALUES ('350921', '霞浦县', '350900');
INSERT INTO `yershop_area` VALUES ('350922', '古田县', '350900');
INSERT INTO `yershop_area` VALUES ('350923', '屏南县', '350900');
INSERT INTO `yershop_area` VALUES ('350924', '寿宁县', '350900');
INSERT INTO `yershop_area` VALUES ('350925', '周宁县', '350900');
INSERT INTO `yershop_area` VALUES ('350926', '柘荣县', '350900');
INSERT INTO `yershop_area` VALUES ('350981', '福安市', '350900');
INSERT INTO `yershop_area` VALUES ('350982', '福鼎市', '350900');
INSERT INTO `yershop_area` VALUES ('360101', '市辖区', '360100');
INSERT INTO `yershop_area` VALUES ('360102', '东湖区', '360100');
INSERT INTO `yershop_area` VALUES ('360103', '西湖区', '360100');
INSERT INTO `yershop_area` VALUES ('360104', '青云谱区', '360100');
INSERT INTO `yershop_area` VALUES ('360105', '湾里区', '360100');
INSERT INTO `yershop_area` VALUES ('360111', '青山湖区', '360100');
INSERT INTO `yershop_area` VALUES ('360121', '南昌县', '360100');
INSERT INTO `yershop_area` VALUES ('360122', '新建县', '360100');
INSERT INTO `yershop_area` VALUES ('360123', '安义县', '360100');
INSERT INTO `yershop_area` VALUES ('360124', '进贤县', '360100');
INSERT INTO `yershop_area` VALUES ('360201', '市辖区', '360200');
INSERT INTO `yershop_area` VALUES ('360202', '昌江区', '360200');
INSERT INTO `yershop_area` VALUES ('360203', '珠山区', '360200');
INSERT INTO `yershop_area` VALUES ('360222', '浮梁县', '360200');
INSERT INTO `yershop_area` VALUES ('360281', '乐平市', '360200');
INSERT INTO `yershop_area` VALUES ('360301', '市辖区', '360300');
INSERT INTO `yershop_area` VALUES ('360302', '安源区', '360300');
INSERT INTO `yershop_area` VALUES ('360313', '湘东区', '360300');
INSERT INTO `yershop_area` VALUES ('360321', '莲花县', '360300');
INSERT INTO `yershop_area` VALUES ('360322', '上栗县', '360300');
INSERT INTO `yershop_area` VALUES ('360323', '芦溪县', '360300');
INSERT INTO `yershop_area` VALUES ('360401', '市辖区', '360400');
INSERT INTO `yershop_area` VALUES ('360402', '庐山区', '360400');
INSERT INTO `yershop_area` VALUES ('360403', '浔阳区', '360400');
INSERT INTO `yershop_area` VALUES ('360421', '九江县', '360400');
INSERT INTO `yershop_area` VALUES ('360423', '武宁县', '360400');
INSERT INTO `yershop_area` VALUES ('360424', '修水县', '360400');
INSERT INTO `yershop_area` VALUES ('360425', '永修县', '360400');
INSERT INTO `yershop_area` VALUES ('360426', '德安县', '360400');
INSERT INTO `yershop_area` VALUES ('360427', '星子县', '360400');
INSERT INTO `yershop_area` VALUES ('360428', '都昌县', '360400');
INSERT INTO `yershop_area` VALUES ('360429', '湖口县', '360400');
INSERT INTO `yershop_area` VALUES ('360430', '彭泽县', '360400');
INSERT INTO `yershop_area` VALUES ('360481', '瑞昌市', '360400');
INSERT INTO `yershop_area` VALUES ('360501', '市辖区', '360500');
INSERT INTO `yershop_area` VALUES ('360502', '渝水区', '360500');
INSERT INTO `yershop_area` VALUES ('360521', '分宜县', '360500');
INSERT INTO `yershop_area` VALUES ('360601', '市辖区', '360600');
INSERT INTO `yershop_area` VALUES ('360602', '月湖区', '360600');
INSERT INTO `yershop_area` VALUES ('360622', '余江县', '360600');
INSERT INTO `yershop_area` VALUES ('360681', '贵溪市', '360600');
INSERT INTO `yershop_area` VALUES ('360701', '市辖区', '360700');
INSERT INTO `yershop_area` VALUES ('360702', '章贡区', '360700');
INSERT INTO `yershop_area` VALUES ('360721', '赣　县', '360700');
INSERT INTO `yershop_area` VALUES ('360722', '信丰县', '360700');
INSERT INTO `yershop_area` VALUES ('360723', '大余县', '360700');
INSERT INTO `yershop_area` VALUES ('360724', '上犹县', '360700');
INSERT INTO `yershop_area` VALUES ('360725', '崇义县', '360700');
INSERT INTO `yershop_area` VALUES ('360726', '安远县', '360700');
INSERT INTO `yershop_area` VALUES ('360727', '龙南县', '360700');
INSERT INTO `yershop_area` VALUES ('360728', '定南县', '360700');
INSERT INTO `yershop_area` VALUES ('360729', '全南县', '360700');
INSERT INTO `yershop_area` VALUES ('360730', '宁都县', '360700');
INSERT INTO `yershop_area` VALUES ('360731', '于都县', '360700');
INSERT INTO `yershop_area` VALUES ('360732', '兴国县', '360700');
INSERT INTO `yershop_area` VALUES ('360733', '会昌县', '360700');
INSERT INTO `yershop_area` VALUES ('360734', '寻乌县', '360700');
INSERT INTO `yershop_area` VALUES ('360735', '石城县', '360700');
INSERT INTO `yershop_area` VALUES ('360781', '瑞金市', '360700');
INSERT INTO `yershop_area` VALUES ('360782', '南康市', '360700');
INSERT INTO `yershop_area` VALUES ('360801', '市辖区', '360800');
INSERT INTO `yershop_area` VALUES ('360802', '吉州区', '360800');
INSERT INTO `yershop_area` VALUES ('360803', '青原区', '360800');
INSERT INTO `yershop_area` VALUES ('360821', '吉安县', '360800');
INSERT INTO `yershop_area` VALUES ('360822', '吉水县', '360800');
INSERT INTO `yershop_area` VALUES ('360823', '峡江县', '360800');
INSERT INTO `yershop_area` VALUES ('360824', '新干县', '360800');
INSERT INTO `yershop_area` VALUES ('360825', '永丰县', '360800');
INSERT INTO `yershop_area` VALUES ('360826', '泰和县', '360800');
INSERT INTO `yershop_area` VALUES ('360827', '遂川县', '360800');
INSERT INTO `yershop_area` VALUES ('360828', '万安县', '360800');
INSERT INTO `yershop_area` VALUES ('360829', '安福县', '360800');
INSERT INTO `yershop_area` VALUES ('360830', '永新县', '360800');
INSERT INTO `yershop_area` VALUES ('360881', '井冈山市', '360800');
INSERT INTO `yershop_area` VALUES ('360901', '市辖区', '360900');
INSERT INTO `yershop_area` VALUES ('360902', '袁州区', '360900');
INSERT INTO `yershop_area` VALUES ('360921', '奉新县', '360900');
INSERT INTO `yershop_area` VALUES ('360922', '万载县', '360900');
INSERT INTO `yershop_area` VALUES ('360923', '上高县', '360900');
INSERT INTO `yershop_area` VALUES ('360924', '宜丰县', '360900');
INSERT INTO `yershop_area` VALUES ('360925', '靖安县', '360900');
INSERT INTO `yershop_area` VALUES ('360926', '铜鼓县', '360900');
INSERT INTO `yershop_area` VALUES ('360981', '丰城市', '360900');
INSERT INTO `yershop_area` VALUES ('360982', '樟树市', '360900');
INSERT INTO `yershop_area` VALUES ('360983', '高安市', '360900');
INSERT INTO `yershop_area` VALUES ('361001', '市辖区', '361000');
INSERT INTO `yershop_area` VALUES ('361002', '临川区', '361000');
INSERT INTO `yershop_area` VALUES ('361021', '南城县', '361000');
INSERT INTO `yershop_area` VALUES ('361022', '黎川县', '361000');
INSERT INTO `yershop_area` VALUES ('361023', '南丰县', '361000');
INSERT INTO `yershop_area` VALUES ('361024', '崇仁县', '361000');
INSERT INTO `yershop_area` VALUES ('361025', '乐安县', '361000');
INSERT INTO `yershop_area` VALUES ('361026', '宜黄县', '361000');
INSERT INTO `yershop_area` VALUES ('361027', '金溪县', '361000');
INSERT INTO `yershop_area` VALUES ('361028', '资溪县', '361000');
INSERT INTO `yershop_area` VALUES ('361029', '东乡县', '361000');
INSERT INTO `yershop_area` VALUES ('361030', '广昌县', '361000');
INSERT INTO `yershop_area` VALUES ('361101', '市辖区', '361100');
INSERT INTO `yershop_area` VALUES ('361102', '信州区', '361100');
INSERT INTO `yershop_area` VALUES ('361121', '上饶县', '361100');
INSERT INTO `yershop_area` VALUES ('361122', '广丰县', '361100');
INSERT INTO `yershop_area` VALUES ('361123', '玉山县', '361100');
INSERT INTO `yershop_area` VALUES ('361124', '铅山县', '361100');
INSERT INTO `yershop_area` VALUES ('361125', '横峰县', '361100');
INSERT INTO `yershop_area` VALUES ('361126', '弋阳县', '361100');
INSERT INTO `yershop_area` VALUES ('361127', '余干县', '361100');
INSERT INTO `yershop_area` VALUES ('361128', '鄱阳县', '361100');
INSERT INTO `yershop_area` VALUES ('361129', '万年县', '361100');
INSERT INTO `yershop_area` VALUES ('361130', '婺源县', '361100');
INSERT INTO `yershop_area` VALUES ('361181', '德兴市', '361100');
INSERT INTO `yershop_area` VALUES ('370101', '市辖区', '370100');
INSERT INTO `yershop_area` VALUES ('370102', '历下区', '370100');
INSERT INTO `yershop_area` VALUES ('370103', '市中区', '370100');
INSERT INTO `yershop_area` VALUES ('370104', '槐荫区', '370100');
INSERT INTO `yershop_area` VALUES ('370105', '天桥区', '370100');
INSERT INTO `yershop_area` VALUES ('370112', '历城区', '370100');
INSERT INTO `yershop_area` VALUES ('370113', '长清区', '370100');
INSERT INTO `yershop_area` VALUES ('370124', '平阴县', '370100');
INSERT INTO `yershop_area` VALUES ('370125', '济阳县', '370100');
INSERT INTO `yershop_area` VALUES ('370126', '商河县', '370100');
INSERT INTO `yershop_area` VALUES ('370181', '章丘市', '370100');
INSERT INTO `yershop_area` VALUES ('370201', '市辖区', '370200');
INSERT INTO `yershop_area` VALUES ('370202', '市南区', '370200');
INSERT INTO `yershop_area` VALUES ('370203', '市北区', '370200');
INSERT INTO `yershop_area` VALUES ('370205', '四方区', '370200');
INSERT INTO `yershop_area` VALUES ('370211', '黄岛区', '370200');
INSERT INTO `yershop_area` VALUES ('370212', '崂山区', '370200');
INSERT INTO `yershop_area` VALUES ('370213', '李沧区', '370200');
INSERT INTO `yershop_area` VALUES ('370214', '城阳区', '370200');
INSERT INTO `yershop_area` VALUES ('370281', '胶州市', '370200');
INSERT INTO `yershop_area` VALUES ('370282', '即墨市', '370200');
INSERT INTO `yershop_area` VALUES ('370283', '平度市', '370200');
INSERT INTO `yershop_area` VALUES ('370284', '胶南市', '370200');
INSERT INTO `yershop_area` VALUES ('370285', '莱西市', '370200');
INSERT INTO `yershop_area` VALUES ('370301', '市辖区', '370300');
INSERT INTO `yershop_area` VALUES ('370302', '淄川区', '370300');
INSERT INTO `yershop_area` VALUES ('370303', '张店区', '370300');
INSERT INTO `yershop_area` VALUES ('370304', '博山区', '370300');
INSERT INTO `yershop_area` VALUES ('370305', '临淄区', '370300');
INSERT INTO `yershop_area` VALUES ('370306', '周村区', '370300');
INSERT INTO `yershop_area` VALUES ('370321', '桓台县', '370300');
INSERT INTO `yershop_area` VALUES ('370322', '高青县', '370300');
INSERT INTO `yershop_area` VALUES ('370323', '沂源县', '370300');
INSERT INTO `yershop_area` VALUES ('370401', '市辖区', '370400');
INSERT INTO `yershop_area` VALUES ('370402', '市中区', '370400');
INSERT INTO `yershop_area` VALUES ('370403', '薛城区', '370400');
INSERT INTO `yershop_area` VALUES ('370404', '峄城区', '370400');
INSERT INTO `yershop_area` VALUES ('370405', '台儿庄区', '370400');
INSERT INTO `yershop_area` VALUES ('370406', '山亭区', '370400');
INSERT INTO `yershop_area` VALUES ('370481', '滕州市', '370400');
INSERT INTO `yershop_area` VALUES ('370501', '市辖区', '370500');
INSERT INTO `yershop_area` VALUES ('370502', '东营区', '370500');
INSERT INTO `yershop_area` VALUES ('370503', '河口区', '370500');
INSERT INTO `yershop_area` VALUES ('370521', '垦利县', '370500');
INSERT INTO `yershop_area` VALUES ('370522', '利津县', '370500');
INSERT INTO `yershop_area` VALUES ('370523', '广饶县', '370500');
INSERT INTO `yershop_area` VALUES ('370601', '市辖区', '370600');
INSERT INTO `yershop_area` VALUES ('370602', '芝罘区', '370600');
INSERT INTO `yershop_area` VALUES ('370611', '福山区', '370600');
INSERT INTO `yershop_area` VALUES ('370612', '牟平区', '370600');
INSERT INTO `yershop_area` VALUES ('370613', '莱山区', '370600');
INSERT INTO `yershop_area` VALUES ('370634', '长岛县', '370600');
INSERT INTO `yershop_area` VALUES ('370681', '龙口市', '370600');
INSERT INTO `yershop_area` VALUES ('370682', '莱阳市', '370600');
INSERT INTO `yershop_area` VALUES ('370683', '莱州市', '370600');
INSERT INTO `yershop_area` VALUES ('370684', '蓬莱市', '370600');
INSERT INTO `yershop_area` VALUES ('370685', '招远市', '370600');
INSERT INTO `yershop_area` VALUES ('370686', '栖霞市', '370600');
INSERT INTO `yershop_area` VALUES ('370687', '海阳市', '370600');
INSERT INTO `yershop_area` VALUES ('370701', '市辖区', '370700');
INSERT INTO `yershop_area` VALUES ('370702', '潍城区', '370700');
INSERT INTO `yershop_area` VALUES ('370703', '寒亭区', '370700');
INSERT INTO `yershop_area` VALUES ('370704', '坊子区', '370700');
INSERT INTO `yershop_area` VALUES ('370705', '奎文区', '370700');
INSERT INTO `yershop_area` VALUES ('370724', '临朐县', '370700');
INSERT INTO `yershop_area` VALUES ('370725', '昌乐县', '370700');
INSERT INTO `yershop_area` VALUES ('370781', '青州市', '370700');
INSERT INTO `yershop_area` VALUES ('370782', '诸城市', '370700');
INSERT INTO `yershop_area` VALUES ('370783', '寿光市', '370700');
INSERT INTO `yershop_area` VALUES ('370784', '安丘市', '370700');
INSERT INTO `yershop_area` VALUES ('370785', '高密市', '370700');
INSERT INTO `yershop_area` VALUES ('370786', '昌邑市', '370700');
INSERT INTO `yershop_area` VALUES ('370801', '市辖区', '370800');
INSERT INTO `yershop_area` VALUES ('370802', '市中区', '370800');
INSERT INTO `yershop_area` VALUES ('370811', '任城区', '370800');
INSERT INTO `yershop_area` VALUES ('370826', '微山县', '370800');
INSERT INTO `yershop_area` VALUES ('370827', '鱼台县', '370800');
INSERT INTO `yershop_area` VALUES ('370828', '金乡县', '370800');
INSERT INTO `yershop_area` VALUES ('370829', '嘉祥县', '370800');
INSERT INTO `yershop_area` VALUES ('370830', '汶上县', '370800');
INSERT INTO `yershop_area` VALUES ('370831', '泗水县', '370800');
INSERT INTO `yershop_area` VALUES ('370832', '梁山县', '370800');
INSERT INTO `yershop_area` VALUES ('370881', '曲阜市', '370800');
INSERT INTO `yershop_area` VALUES ('370882', '兖州市', '370800');
INSERT INTO `yershop_area` VALUES ('370883', '邹城市', '370800');
INSERT INTO `yershop_area` VALUES ('370901', '市辖区', '370900');
INSERT INTO `yershop_area` VALUES ('370902', '泰山区', '370900');
INSERT INTO `yershop_area` VALUES ('370903', '岱岳区', '370900');
INSERT INTO `yershop_area` VALUES ('370921', '宁阳县', '370900');
INSERT INTO `yershop_area` VALUES ('370923', '东平县', '370900');
INSERT INTO `yershop_area` VALUES ('370982', '新泰市', '370900');
INSERT INTO `yershop_area` VALUES ('370983', '肥城市', '370900');
INSERT INTO `yershop_area` VALUES ('371001', '市辖区', '371000');
INSERT INTO `yershop_area` VALUES ('371002', '环翠区', '371000');
INSERT INTO `yershop_area` VALUES ('371081', '文登市', '371000');
INSERT INTO `yershop_area` VALUES ('371082', '荣成市', '371000');
INSERT INTO `yershop_area` VALUES ('371083', '乳山市', '371000');
INSERT INTO `yershop_area` VALUES ('371101', '市辖区', '371100');
INSERT INTO `yershop_area` VALUES ('371102', '东港区', '371100');
INSERT INTO `yershop_area` VALUES ('371103', '岚山区', '371100');
INSERT INTO `yershop_area` VALUES ('371121', '五莲县', '371100');
INSERT INTO `yershop_area` VALUES ('371122', '莒　县', '371100');
INSERT INTO `yershop_area` VALUES ('371201', '市辖区', '371200');
INSERT INTO `yershop_area` VALUES ('371202', '莱城区', '371200');
INSERT INTO `yershop_area` VALUES ('371203', '钢城区', '371200');
INSERT INTO `yershop_area` VALUES ('371301', '市辖区', '371300');
INSERT INTO `yershop_area` VALUES ('371302', '兰山区', '371300');
INSERT INTO `yershop_area` VALUES ('371311', '罗庄区', '371300');
INSERT INTO `yershop_area` VALUES ('371312', '河东区', '371300');
INSERT INTO `yershop_area` VALUES ('371321', '沂南县', '371300');
INSERT INTO `yershop_area` VALUES ('371322', '郯城县', '371300');
INSERT INTO `yershop_area` VALUES ('371323', '沂水县', '371300');
INSERT INTO `yershop_area` VALUES ('371324', '苍山县', '371300');
INSERT INTO `yershop_area` VALUES ('371325', '费　县', '371300');
INSERT INTO `yershop_area` VALUES ('371326', '平邑县', '371300');
INSERT INTO `yershop_area` VALUES ('371327', '莒南县', '371300');
INSERT INTO `yershop_area` VALUES ('371328', '蒙阴县', '371300');
INSERT INTO `yershop_area` VALUES ('371329', '临沭县', '371300');
INSERT INTO `yershop_area` VALUES ('371401', '市辖区', '371400');
INSERT INTO `yershop_area` VALUES ('371402', '德城区', '371400');
INSERT INTO `yershop_area` VALUES ('371421', '陵　县', '371400');
INSERT INTO `yershop_area` VALUES ('371422', '宁津县', '371400');
INSERT INTO `yershop_area` VALUES ('371423', '庆云县', '371400');
INSERT INTO `yershop_area` VALUES ('371424', '临邑县', '371400');
INSERT INTO `yershop_area` VALUES ('371425', '齐河县', '371400');
INSERT INTO `yershop_area` VALUES ('371426', '平原县', '371400');
INSERT INTO `yershop_area` VALUES ('371427', '夏津县', '371400');
INSERT INTO `yershop_area` VALUES ('371428', '武城县', '371400');
INSERT INTO `yershop_area` VALUES ('371481', '乐陵市', '371400');
INSERT INTO `yershop_area` VALUES ('371482', '禹城市', '371400');
INSERT INTO `yershop_area` VALUES ('371501', '市辖区', '371500');
INSERT INTO `yershop_area` VALUES ('371502', '东昌府区', '371500');
INSERT INTO `yershop_area` VALUES ('371521', '阳谷县', '371500');
INSERT INTO `yershop_area` VALUES ('371522', '莘　县', '371500');
INSERT INTO `yershop_area` VALUES ('371523', '茌平县', '371500');
INSERT INTO `yershop_area` VALUES ('371524', '东阿县', '371500');
INSERT INTO `yershop_area` VALUES ('371525', '冠　县', '371500');
INSERT INTO `yershop_area` VALUES ('371526', '高唐县', '371500');
INSERT INTO `yershop_area` VALUES ('371581', '临清市', '371500');
INSERT INTO `yershop_area` VALUES ('371601', '市辖区', '371600');
INSERT INTO `yershop_area` VALUES ('371602', '滨城区', '371600');
INSERT INTO `yershop_area` VALUES ('371621', '惠民县', '371600');
INSERT INTO `yershop_area` VALUES ('371622', '阳信县', '371600');
INSERT INTO `yershop_area` VALUES ('371623', '无棣县', '371600');
INSERT INTO `yershop_area` VALUES ('371624', '沾化县', '371600');
INSERT INTO `yershop_area` VALUES ('371625', '博兴县', '371600');
INSERT INTO `yershop_area` VALUES ('371626', '邹平县', '371600');
INSERT INTO `yershop_area` VALUES ('371701', '市辖区', '371700');
INSERT INTO `yershop_area` VALUES ('371702', '牡丹区', '371700');
INSERT INTO `yershop_area` VALUES ('371721', '曹　县', '371700');
INSERT INTO `yershop_area` VALUES ('371722', '单　县', '371700');
INSERT INTO `yershop_area` VALUES ('371723', '成武县', '371700');
INSERT INTO `yershop_area` VALUES ('371724', '巨野县', '371700');
INSERT INTO `yershop_area` VALUES ('371725', '郓城县', '371700');
INSERT INTO `yershop_area` VALUES ('371726', '鄄城县', '371700');
INSERT INTO `yershop_area` VALUES ('371727', '定陶县', '371700');
INSERT INTO `yershop_area` VALUES ('371728', '东明县', '371700');
INSERT INTO `yershop_area` VALUES ('410101', '市辖区', '410100');
INSERT INTO `yershop_area` VALUES ('410102', '中原区', '410100');
INSERT INTO `yershop_area` VALUES ('410103', '二七区', '410100');
INSERT INTO `yershop_area` VALUES ('410104', '管城回族区', '410100');
INSERT INTO `yershop_area` VALUES ('410105', '金水区', '410100');
INSERT INTO `yershop_area` VALUES ('410106', '上街区', '410100');
INSERT INTO `yershop_area` VALUES ('410108', '邙山区', '410100');
INSERT INTO `yershop_area` VALUES ('410122', '中牟县', '410100');
INSERT INTO `yershop_area` VALUES ('410181', '巩义市', '410100');
INSERT INTO `yershop_area` VALUES ('410182', '荥阳市', '410100');
INSERT INTO `yershop_area` VALUES ('410183', '新密市', '410100');
INSERT INTO `yershop_area` VALUES ('410184', '新郑市', '410100');
INSERT INTO `yershop_area` VALUES ('410185', '登封市', '410100');
INSERT INTO `yershop_area` VALUES ('410201', '市辖区', '410200');
INSERT INTO `yershop_area` VALUES ('410202', '龙亭区', '410200');
INSERT INTO `yershop_area` VALUES ('410203', '顺河回族区', '410200');
INSERT INTO `yershop_area` VALUES ('410204', '鼓楼区', '410200');
INSERT INTO `yershop_area` VALUES ('410205', '南关区', '410200');
INSERT INTO `yershop_area` VALUES ('410211', '郊　区', '410200');
INSERT INTO `yershop_area` VALUES ('410221', '杞　县', '410200');
INSERT INTO `yershop_area` VALUES ('410222', '通许县', '410200');
INSERT INTO `yershop_area` VALUES ('410223', '尉氏县', '410200');
INSERT INTO `yershop_area` VALUES ('410224', '开封县', '410200');
INSERT INTO `yershop_area` VALUES ('410225', '兰考县', '410200');
INSERT INTO `yershop_area` VALUES ('410301', '市辖区', '410300');
INSERT INTO `yershop_area` VALUES ('410302', '老城区', '410300');
INSERT INTO `yershop_area` VALUES ('410303', '西工区', '410300');
INSERT INTO `yershop_area` VALUES ('410304', '廛河回族区', '410300');
INSERT INTO `yershop_area` VALUES ('410305', '涧西区', '410300');
INSERT INTO `yershop_area` VALUES ('410306', '吉利区', '410300');
INSERT INTO `yershop_area` VALUES ('410307', '洛龙区', '410300');
INSERT INTO `yershop_area` VALUES ('410322', '孟津县', '410300');
INSERT INTO `yershop_area` VALUES ('410323', '新安县', '410300');
INSERT INTO `yershop_area` VALUES ('410324', '栾川县', '410300');
INSERT INTO `yershop_area` VALUES ('410325', '嵩　县', '410300');
INSERT INTO `yershop_area` VALUES ('410326', '汝阳县', '410300');
INSERT INTO `yershop_area` VALUES ('410327', '宜阳县', '410300');
INSERT INTO `yershop_area` VALUES ('410328', '洛宁县', '410300');
INSERT INTO `yershop_area` VALUES ('410329', '伊川县', '410300');
INSERT INTO `yershop_area` VALUES ('410381', '偃师市', '410300');
INSERT INTO `yershop_area` VALUES ('410401', '市辖区', '410400');
INSERT INTO `yershop_area` VALUES ('410402', '新华区', '410400');
INSERT INTO `yershop_area` VALUES ('410403', '卫东区', '410400');
INSERT INTO `yershop_area` VALUES ('410404', '石龙区', '410400');
INSERT INTO `yershop_area` VALUES ('410411', '湛河区', '410400');
INSERT INTO `yershop_area` VALUES ('410421', '宝丰县', '410400');
INSERT INTO `yershop_area` VALUES ('410422', '叶　县', '410400');
INSERT INTO `yershop_area` VALUES ('410423', '鲁山县', '410400');
INSERT INTO `yershop_area` VALUES ('410425', '郏　县', '410400');
INSERT INTO `yershop_area` VALUES ('410481', '舞钢市', '410400');
INSERT INTO `yershop_area` VALUES ('410482', '汝州市', '410400');
INSERT INTO `yershop_area` VALUES ('410501', '市辖区', '410500');
INSERT INTO `yershop_area` VALUES ('410502', '文峰区', '410500');
INSERT INTO `yershop_area` VALUES ('410503', '北关区', '410500');
INSERT INTO `yershop_area` VALUES ('410505', '殷都区', '410500');
INSERT INTO `yershop_area` VALUES ('410506', '龙安区', '410500');
INSERT INTO `yershop_area` VALUES ('410522', '安阳县', '410500');
INSERT INTO `yershop_area` VALUES ('410523', '汤阴县', '410500');
INSERT INTO `yershop_area` VALUES ('410526', '滑　县', '410500');
INSERT INTO `yershop_area` VALUES ('410527', '内黄县', '410500');
INSERT INTO `yershop_area` VALUES ('410581', '林州市', '410500');
INSERT INTO `yershop_area` VALUES ('410601', '市辖区', '410600');
INSERT INTO `yershop_area` VALUES ('410602', '鹤山区', '410600');
INSERT INTO `yershop_area` VALUES ('410603', '山城区', '410600');
INSERT INTO `yershop_area` VALUES ('410611', '淇滨区', '410600');
INSERT INTO `yershop_area` VALUES ('410621', '浚　县', '410600');
INSERT INTO `yershop_area` VALUES ('410622', '淇　县', '410600');
INSERT INTO `yershop_area` VALUES ('410701', '市辖区', '410700');
INSERT INTO `yershop_area` VALUES ('410702', '红旗区', '410700');
INSERT INTO `yershop_area` VALUES ('410703', '卫滨区', '410700');
INSERT INTO `yershop_area` VALUES ('410704', '凤泉区', '410700');
INSERT INTO `yershop_area` VALUES ('410711', '牧野区', '410700');
INSERT INTO `yershop_area` VALUES ('410721', '新乡县', '410700');
INSERT INTO `yershop_area` VALUES ('410724', '获嘉县', '410700');
INSERT INTO `yershop_area` VALUES ('410725', '原阳县', '410700');
INSERT INTO `yershop_area` VALUES ('410726', '延津县', '410700');
INSERT INTO `yershop_area` VALUES ('410727', '封丘县', '410700');
INSERT INTO `yershop_area` VALUES ('410728', '长垣县', '410700');
INSERT INTO `yershop_area` VALUES ('410781', '卫辉市', '410700');
INSERT INTO `yershop_area` VALUES ('410782', '辉县市', '410700');
INSERT INTO `yershop_area` VALUES ('410801', '市辖区', '410800');
INSERT INTO `yershop_area` VALUES ('410802', '解放区', '410800');
INSERT INTO `yershop_area` VALUES ('410803', '中站区', '410800');
INSERT INTO `yershop_area` VALUES ('410804', '马村区', '410800');
INSERT INTO `yershop_area` VALUES ('410811', '山阳区', '410800');
INSERT INTO `yershop_area` VALUES ('410821', '修武县', '410800');
INSERT INTO `yershop_area` VALUES ('410822', '博爱县', '410800');
INSERT INTO `yershop_area` VALUES ('410823', '武陟县', '410800');
INSERT INTO `yershop_area` VALUES ('410825', '温　县', '410800');
INSERT INTO `yershop_area` VALUES ('410881', '济源市', '410800');
INSERT INTO `yershop_area` VALUES ('410882', '沁阳市', '410800');
INSERT INTO `yershop_area` VALUES ('410883', '孟州市', '410800');
INSERT INTO `yershop_area` VALUES ('410901', '市辖区', '410900');
INSERT INTO `yershop_area` VALUES ('410902', '华龙区', '410900');
INSERT INTO `yershop_area` VALUES ('410922', '清丰县', '410900');
INSERT INTO `yershop_area` VALUES ('410923', '南乐县', '410900');
INSERT INTO `yershop_area` VALUES ('410926', '范　县', '410900');
INSERT INTO `yershop_area` VALUES ('410927', '台前县', '410900');
INSERT INTO `yershop_area` VALUES ('410928', '濮阳县', '410900');
INSERT INTO `yershop_area` VALUES ('411001', '市辖区', '411000');
INSERT INTO `yershop_area` VALUES ('411002', '魏都区', '411000');
INSERT INTO `yershop_area` VALUES ('411023', '许昌县', '411000');
INSERT INTO `yershop_area` VALUES ('411024', '鄢陵县', '411000');
INSERT INTO `yershop_area` VALUES ('411025', '襄城县', '411000');
INSERT INTO `yershop_area` VALUES ('411081', '禹州市', '411000');
INSERT INTO `yershop_area` VALUES ('411082', '长葛市', '411000');
INSERT INTO `yershop_area` VALUES ('411101', '市辖区', '411100');
INSERT INTO `yershop_area` VALUES ('411102', '源汇区', '411100');
INSERT INTO `yershop_area` VALUES ('411103', '郾城区', '411100');
INSERT INTO `yershop_area` VALUES ('411104', '召陵区', '411100');
INSERT INTO `yershop_area` VALUES ('411121', '舞阳县', '411100');
INSERT INTO `yershop_area` VALUES ('411122', '临颍县', '411100');
INSERT INTO `yershop_area` VALUES ('411201', '市辖区', '411200');
INSERT INTO `yershop_area` VALUES ('411202', '湖滨区', '411200');
INSERT INTO `yershop_area` VALUES ('411221', '渑池县', '411200');
INSERT INTO `yershop_area` VALUES ('411222', '陕　县', '411200');
INSERT INTO `yershop_area` VALUES ('411224', '卢氏县', '411200');
INSERT INTO `yershop_area` VALUES ('411281', '义马市', '411200');
INSERT INTO `yershop_area` VALUES ('411282', '灵宝市', '411200');
INSERT INTO `yershop_area` VALUES ('411301', '市辖区', '411300');
INSERT INTO `yershop_area` VALUES ('411302', '宛城区', '411300');
INSERT INTO `yershop_area` VALUES ('411303', '卧龙区', '411300');
INSERT INTO `yershop_area` VALUES ('411321', '南召县', '411300');
INSERT INTO `yershop_area` VALUES ('411322', '方城县', '411300');
INSERT INTO `yershop_area` VALUES ('411323', '西峡县', '411300');
INSERT INTO `yershop_area` VALUES ('411324', '镇平县', '411300');
INSERT INTO `yershop_area` VALUES ('411325', '内乡县', '411300');
INSERT INTO `yershop_area` VALUES ('411326', '淅川县', '411300');
INSERT INTO `yershop_area` VALUES ('411327', '社旗县', '411300');
INSERT INTO `yershop_area` VALUES ('411328', '唐河县', '411300');
INSERT INTO `yershop_area` VALUES ('411329', '新野县', '411300');
INSERT INTO `yershop_area` VALUES ('411330', '桐柏县', '411300');
INSERT INTO `yershop_area` VALUES ('411381', '邓州市', '411300');
INSERT INTO `yershop_area` VALUES ('411401', '市辖区', '411400');
INSERT INTO `yershop_area` VALUES ('411402', '梁园区', '411400');
INSERT INTO `yershop_area` VALUES ('411403', '睢阳区', '411400');
INSERT INTO `yershop_area` VALUES ('411421', '民权县', '411400');
INSERT INTO `yershop_area` VALUES ('411422', '睢　县', '411400');
INSERT INTO `yershop_area` VALUES ('411423', '宁陵县', '411400');
INSERT INTO `yershop_area` VALUES ('411424', '柘城县', '411400');
INSERT INTO `yershop_area` VALUES ('411425', '虞城县', '411400');
INSERT INTO `yershop_area` VALUES ('411426', '夏邑县', '411400');
INSERT INTO `yershop_area` VALUES ('411481', '永城市', '411400');
INSERT INTO `yershop_area` VALUES ('411501', '市辖区', '411500');
INSERT INTO `yershop_area` VALUES ('411502', '师河区', '411500');
INSERT INTO `yershop_area` VALUES ('411503', '平桥区', '411500');
INSERT INTO `yershop_area` VALUES ('411521', '罗山县', '411500');
INSERT INTO `yershop_area` VALUES ('411522', '光山县', '411500');
INSERT INTO `yershop_area` VALUES ('411523', '新　县', '411500');
INSERT INTO `yershop_area` VALUES ('411524', '商城县', '411500');
INSERT INTO `yershop_area` VALUES ('411525', '固始县', '411500');
INSERT INTO `yershop_area` VALUES ('411526', '潢川县', '411500');
INSERT INTO `yershop_area` VALUES ('411527', '淮滨县', '411500');
INSERT INTO `yershop_area` VALUES ('411528', '息　县', '411500');
INSERT INTO `yershop_area` VALUES ('411601', '市辖区', '411600');
INSERT INTO `yershop_area` VALUES ('411602', '川汇区', '411600');
INSERT INTO `yershop_area` VALUES ('411621', '扶沟县', '411600');
INSERT INTO `yershop_area` VALUES ('411622', '西华县', '411600');
INSERT INTO `yershop_area` VALUES ('411623', '商水县', '411600');
INSERT INTO `yershop_area` VALUES ('411624', '沈丘县', '411600');
INSERT INTO `yershop_area` VALUES ('411625', '郸城县', '411600');
INSERT INTO `yershop_area` VALUES ('411626', '淮阳县', '411600');
INSERT INTO `yershop_area` VALUES ('411627', '太康县', '411600');
INSERT INTO `yershop_area` VALUES ('411628', '鹿邑县', '411600');
INSERT INTO `yershop_area` VALUES ('411681', '项城市', '411600');
INSERT INTO `yershop_area` VALUES ('411701', '市辖区', '411700');
INSERT INTO `yershop_area` VALUES ('411702', '驿城区', '411700');
INSERT INTO `yershop_area` VALUES ('411721', '西平县', '411700');
INSERT INTO `yershop_area` VALUES ('411722', '上蔡县', '411700');
INSERT INTO `yershop_area` VALUES ('411723', '平舆县', '411700');
INSERT INTO `yershop_area` VALUES ('411724', '正阳县', '411700');
INSERT INTO `yershop_area` VALUES ('411725', '确山县', '411700');
INSERT INTO `yershop_area` VALUES ('411726', '泌阳县', '411700');
INSERT INTO `yershop_area` VALUES ('411727', '汝南县', '411700');
INSERT INTO `yershop_area` VALUES ('411728', '遂平县', '411700');
INSERT INTO `yershop_area` VALUES ('411729', '新蔡县', '411700');
INSERT INTO `yershop_area` VALUES ('420101', '市辖区', '420100');
INSERT INTO `yershop_area` VALUES ('420102', '江岸区', '420100');
INSERT INTO `yershop_area` VALUES ('420103', '江汉区', '420100');
INSERT INTO `yershop_area` VALUES ('420104', '乔口区', '420100');
INSERT INTO `yershop_area` VALUES ('420105', '汉阳区', '420100');
INSERT INTO `yershop_area` VALUES ('420106', '武昌区', '420100');
INSERT INTO `yershop_area` VALUES ('420107', '青山区', '420100');
INSERT INTO `yershop_area` VALUES ('420111', '洪山区', '420100');
INSERT INTO `yershop_area` VALUES ('420112', '东西湖区', '420100');
INSERT INTO `yershop_area` VALUES ('420113', '汉南区', '420100');
INSERT INTO `yershop_area` VALUES ('420114', '蔡甸区', '420100');
INSERT INTO `yershop_area` VALUES ('420115', '江夏区', '420100');
INSERT INTO `yershop_area` VALUES ('420116', '黄陂区', '420100');
INSERT INTO `yershop_area` VALUES ('420117', '新洲区', '420100');
INSERT INTO `yershop_area` VALUES ('420201', '市辖区', '420200');
INSERT INTO `yershop_area` VALUES ('420202', '黄石港区', '420200');
INSERT INTO `yershop_area` VALUES ('420203', '西塞山区', '420200');
INSERT INTO `yershop_area` VALUES ('420204', '下陆区', '420200');
INSERT INTO `yershop_area` VALUES ('420205', '铁山区', '420200');
INSERT INTO `yershop_area` VALUES ('420222', '阳新县', '420200');
INSERT INTO `yershop_area` VALUES ('420281', '大冶市', '420200');
INSERT INTO `yershop_area` VALUES ('420301', '市辖区', '420300');
INSERT INTO `yershop_area` VALUES ('420302', '茅箭区', '420300');
INSERT INTO `yershop_area` VALUES ('420303', '张湾区', '420300');
INSERT INTO `yershop_area` VALUES ('420321', '郧　县', '420300');
INSERT INTO `yershop_area` VALUES ('420322', '郧西县', '420300');
INSERT INTO `yershop_area` VALUES ('420323', '竹山县', '420300');
INSERT INTO `yershop_area` VALUES ('420324', '竹溪县', '420300');
INSERT INTO `yershop_area` VALUES ('420325', '房　县', '420300');
INSERT INTO `yershop_area` VALUES ('420381', '丹江口市', '420300');
INSERT INTO `yershop_area` VALUES ('420501', '市辖区', '420500');
INSERT INTO `yershop_area` VALUES ('420502', '西陵区', '420500');
INSERT INTO `yershop_area` VALUES ('420503', '伍家岗区', '420500');
INSERT INTO `yershop_area` VALUES ('420504', '点军区', '420500');
INSERT INTO `yershop_area` VALUES ('420505', '猇亭区', '420500');
INSERT INTO `yershop_area` VALUES ('420506', '夷陵区', '420500');
INSERT INTO `yershop_area` VALUES ('420525', '远安县', '420500');
INSERT INTO `yershop_area` VALUES ('420526', '兴山县', '420500');
INSERT INTO `yershop_area` VALUES ('420527', '秭归县', '420500');
INSERT INTO `yershop_area` VALUES ('420528', '长阳土家族自治县', '420500');
INSERT INTO `yershop_area` VALUES ('420529', '五峰土家族自治县', '420500');
INSERT INTO `yershop_area` VALUES ('420581', '宜都市', '420500');
INSERT INTO `yershop_area` VALUES ('420582', '当阳市', '420500');
INSERT INTO `yershop_area` VALUES ('420583', '枝江市', '420500');
INSERT INTO `yershop_area` VALUES ('420601', '市辖区', '420600');
INSERT INTO `yershop_area` VALUES ('420602', '襄城区', '420600');
INSERT INTO `yershop_area` VALUES ('420606', '樊城区', '420600');
INSERT INTO `yershop_area` VALUES ('420607', '襄阳区', '420600');
INSERT INTO `yershop_area` VALUES ('420624', '南漳县', '420600');
INSERT INTO `yershop_area` VALUES ('420625', '谷城县', '420600');
INSERT INTO `yershop_area` VALUES ('420626', '保康县', '420600');
INSERT INTO `yershop_area` VALUES ('420682', '老河口市', '420600');
INSERT INTO `yershop_area` VALUES ('420683', '枣阳市', '420600');
INSERT INTO `yershop_area` VALUES ('420684', '宜城市', '420600');
INSERT INTO `yershop_area` VALUES ('420701', '市辖区', '420700');
INSERT INTO `yershop_area` VALUES ('420702', '梁子湖区', '420700');
INSERT INTO `yershop_area` VALUES ('420703', '华容区', '420700');
INSERT INTO `yershop_area` VALUES ('420704', '鄂城区', '420700');
INSERT INTO `yershop_area` VALUES ('420801', '市辖区', '420800');
INSERT INTO `yershop_area` VALUES ('420802', '东宝区', '420800');
INSERT INTO `yershop_area` VALUES ('420804', '掇刀区', '420800');
INSERT INTO `yershop_area` VALUES ('420821', '京山县', '420800');
INSERT INTO `yershop_area` VALUES ('420822', '沙洋县', '420800');
INSERT INTO `yershop_area` VALUES ('420881', '钟祥市', '420800');
INSERT INTO `yershop_area` VALUES ('420901', '市辖区', '420900');
INSERT INTO `yershop_area` VALUES ('420902', '孝南区', '420900');
INSERT INTO `yershop_area` VALUES ('420921', '孝昌县', '420900');
INSERT INTO `yershop_area` VALUES ('420922', '大悟县', '420900');
INSERT INTO `yershop_area` VALUES ('420923', '云梦县', '420900');
INSERT INTO `yershop_area` VALUES ('420981', '应城市', '420900');
INSERT INTO `yershop_area` VALUES ('420982', '安陆市', '420900');
INSERT INTO `yershop_area` VALUES ('420984', '汉川市', '420900');
INSERT INTO `yershop_area` VALUES ('421001', '市辖区', '421000');
INSERT INTO `yershop_area` VALUES ('421002', '沙市区', '421000');
INSERT INTO `yershop_area` VALUES ('421003', '荆州区', '421000');
INSERT INTO `yershop_area` VALUES ('421022', '公安县', '421000');
INSERT INTO `yershop_area` VALUES ('421023', '监利县', '421000');
INSERT INTO `yershop_area` VALUES ('421024', '江陵县', '421000');
INSERT INTO `yershop_area` VALUES ('421081', '石首市', '421000');
INSERT INTO `yershop_area` VALUES ('421083', '洪湖市', '421000');
INSERT INTO `yershop_area` VALUES ('421087', '松滋市', '421000');
INSERT INTO `yershop_area` VALUES ('421101', '市辖区', '421100');
INSERT INTO `yershop_area` VALUES ('421102', '黄州区', '421100');
INSERT INTO `yershop_area` VALUES ('421121', '团风县', '421100');
INSERT INTO `yershop_area` VALUES ('421122', '红安县', '421100');
INSERT INTO `yershop_area` VALUES ('421123', '罗田县', '421100');
INSERT INTO `yershop_area` VALUES ('421124', '英山县', '421100');
INSERT INTO `yershop_area` VALUES ('421125', '浠水县', '421100');
INSERT INTO `yershop_area` VALUES ('421126', '蕲春县', '421100');
INSERT INTO `yershop_area` VALUES ('421127', '黄梅县', '421100');
INSERT INTO `yershop_area` VALUES ('421181', '麻城市', '421100');
INSERT INTO `yershop_area` VALUES ('421182', '武穴市', '421100');
INSERT INTO `yershop_area` VALUES ('421201', '市辖区', '421200');
INSERT INTO `yershop_area` VALUES ('421202', '咸安区', '421200');
INSERT INTO `yershop_area` VALUES ('421221', '嘉鱼县', '421200');
INSERT INTO `yershop_area` VALUES ('421222', '通城县', '421200');
INSERT INTO `yershop_area` VALUES ('421223', '崇阳县', '421200');
INSERT INTO `yershop_area` VALUES ('421224', '通山县', '421200');
INSERT INTO `yershop_area` VALUES ('421281', '赤壁市', '421200');
INSERT INTO `yershop_area` VALUES ('421301', '市辖区', '421300');
INSERT INTO `yershop_area` VALUES ('421302', '曾都区', '421300');
INSERT INTO `yershop_area` VALUES ('421381', '广水市', '421300');
INSERT INTO `yershop_area` VALUES ('422801', '恩施市', '422800');
INSERT INTO `yershop_area` VALUES ('422802', '利川市', '422800');
INSERT INTO `yershop_area` VALUES ('422822', '建始县', '422800');
INSERT INTO `yershop_area` VALUES ('422823', '巴东县', '422800');
INSERT INTO `yershop_area` VALUES ('422825', '宣恩县', '422800');
INSERT INTO `yershop_area` VALUES ('422826', '咸丰县', '422800');
INSERT INTO `yershop_area` VALUES ('422827', '来凤县', '422800');
INSERT INTO `yershop_area` VALUES ('422828', '鹤峰县', '422800');
INSERT INTO `yershop_area` VALUES ('429004', '仙桃市', '429000');
INSERT INTO `yershop_area` VALUES ('429005', '潜江市', '429000');
INSERT INTO `yershop_area` VALUES ('429006', '天门市', '429000');
INSERT INTO `yershop_area` VALUES ('429021', '神农架林区', '429000');
INSERT INTO `yershop_area` VALUES ('430101', '市辖区', '430100');
INSERT INTO `yershop_area` VALUES ('430102', '芙蓉区', '430100');
INSERT INTO `yershop_area` VALUES ('430103', '天心区', '430100');
INSERT INTO `yershop_area` VALUES ('430104', '岳麓区', '430100');
INSERT INTO `yershop_area` VALUES ('430105', '开福区', '430100');
INSERT INTO `yershop_area` VALUES ('430111', '雨花区', '430100');
INSERT INTO `yershop_area` VALUES ('430121', '长沙县', '430100');
INSERT INTO `yershop_area` VALUES ('430122', '望城县', '430100');
INSERT INTO `yershop_area` VALUES ('430124', '宁乡县', '430100');
INSERT INTO `yershop_area` VALUES ('430181', '浏阳市', '430100');
INSERT INTO `yershop_area` VALUES ('430201', '市辖区', '430200');
INSERT INTO `yershop_area` VALUES ('430202', '荷塘区', '430200');
INSERT INTO `yershop_area` VALUES ('430203', '芦淞区', '430200');
INSERT INTO `yershop_area` VALUES ('430204', '石峰区', '430200');
INSERT INTO `yershop_area` VALUES ('430211', '天元区', '430200');
INSERT INTO `yershop_area` VALUES ('430221', '株洲县', '430200');
INSERT INTO `yershop_area` VALUES ('430223', '攸　县', '430200');
INSERT INTO `yershop_area` VALUES ('430224', '茶陵县', '430200');
INSERT INTO `yershop_area` VALUES ('430225', '炎陵县', '430200');
INSERT INTO `yershop_area` VALUES ('430281', '醴陵市', '430200');
INSERT INTO `yershop_area` VALUES ('430301', '市辖区', '430300');
INSERT INTO `yershop_area` VALUES ('430302', '雨湖区', '430300');
INSERT INTO `yershop_area` VALUES ('430304', '岳塘区', '430300');
INSERT INTO `yershop_area` VALUES ('430321', '湘潭县', '430300');
INSERT INTO `yershop_area` VALUES ('430381', '湘乡市', '430300');
INSERT INTO `yershop_area` VALUES ('430382', '韶山市', '430300');
INSERT INTO `yershop_area` VALUES ('430401', '市辖区', '430400');
INSERT INTO `yershop_area` VALUES ('430405', '珠晖区', '430400');
INSERT INTO `yershop_area` VALUES ('430406', '雁峰区', '430400');
INSERT INTO `yershop_area` VALUES ('430407', '石鼓区', '430400');
INSERT INTO `yershop_area` VALUES ('430408', '蒸湘区', '430400');
INSERT INTO `yershop_area` VALUES ('430412', '南岳区', '430400');
INSERT INTO `yershop_area` VALUES ('430421', '衡阳县', '430400');
INSERT INTO `yershop_area` VALUES ('430422', '衡南县', '430400');
INSERT INTO `yershop_area` VALUES ('430423', '衡山县', '430400');
INSERT INTO `yershop_area` VALUES ('430424', '衡东县', '430400');
INSERT INTO `yershop_area` VALUES ('430426', '祁东县', '430400');
INSERT INTO `yershop_area` VALUES ('430481', '耒阳市', '430400');
INSERT INTO `yershop_area` VALUES ('430482', '常宁市', '430400');
INSERT INTO `yershop_area` VALUES ('430501', '市辖区', '430500');
INSERT INTO `yershop_area` VALUES ('430502', '双清区', '430500');
INSERT INTO `yershop_area` VALUES ('430503', '大祥区', '430500');
INSERT INTO `yershop_area` VALUES ('430511', '北塔区', '430500');
INSERT INTO `yershop_area` VALUES ('430521', '邵东县', '430500');
INSERT INTO `yershop_area` VALUES ('430522', '新邵县', '430500');
INSERT INTO `yershop_area` VALUES ('430523', '邵阳县', '430500');
INSERT INTO `yershop_area` VALUES ('430524', '隆回县', '430500');
INSERT INTO `yershop_area` VALUES ('430525', '洞口县', '430500');
INSERT INTO `yershop_area` VALUES ('430527', '绥宁县', '430500');
INSERT INTO `yershop_area` VALUES ('430528', '新宁县', '430500');
INSERT INTO `yershop_area` VALUES ('430529', '城步苗族自治县', '430500');
INSERT INTO `yershop_area` VALUES ('430581', '武冈市', '430500');
INSERT INTO `yershop_area` VALUES ('430601', '市辖区', '430600');
INSERT INTO `yershop_area` VALUES ('430602', '岳阳楼区', '430600');
INSERT INTO `yershop_area` VALUES ('430603', '云溪区', '430600');
INSERT INTO `yershop_area` VALUES ('430611', '君山区', '430600');
INSERT INTO `yershop_area` VALUES ('430621', '岳阳县', '430600');
INSERT INTO `yershop_area` VALUES ('430623', '华容县', '430600');
INSERT INTO `yershop_area` VALUES ('430624', '湘阴县', '430600');
INSERT INTO `yershop_area` VALUES ('430626', '平江县', '430600');
INSERT INTO `yershop_area` VALUES ('430681', '汨罗市', '430600');
INSERT INTO `yershop_area` VALUES ('430682', '临湘市', '430600');
INSERT INTO `yershop_area` VALUES ('430701', '市辖区', '430700');
INSERT INTO `yershop_area` VALUES ('430702', '武陵区', '430700');
INSERT INTO `yershop_area` VALUES ('430703', '鼎城区', '430700');
INSERT INTO `yershop_area` VALUES ('430721', '安乡县', '430700');
INSERT INTO `yershop_area` VALUES ('430722', '汉寿县', '430700');
INSERT INTO `yershop_area` VALUES ('430723', '澧　县', '430700');
INSERT INTO `yershop_area` VALUES ('430724', '临澧县', '430700');
INSERT INTO `yershop_area` VALUES ('430725', '桃源县', '430700');
INSERT INTO `yershop_area` VALUES ('430726', '石门县', '430700');
INSERT INTO `yershop_area` VALUES ('430781', '津市市', '430700');
INSERT INTO `yershop_area` VALUES ('430801', '市辖区', '430800');
INSERT INTO `yershop_area` VALUES ('430802', '永定区', '430800');
INSERT INTO `yershop_area` VALUES ('430811', '武陵源区', '430800');
INSERT INTO `yershop_area` VALUES ('430821', '慈利县', '430800');
INSERT INTO `yershop_area` VALUES ('430822', '桑植县', '430800');
INSERT INTO `yershop_area` VALUES ('430901', '市辖区', '430900');
INSERT INTO `yershop_area` VALUES ('430902', '资阳区', '430900');
INSERT INTO `yershop_area` VALUES ('430903', '赫山区', '430900');
INSERT INTO `yershop_area` VALUES ('430921', '南　县', '430900');
INSERT INTO `yershop_area` VALUES ('430922', '桃江县', '430900');
INSERT INTO `yershop_area` VALUES ('430923', '安化县', '430900');
INSERT INTO `yershop_area` VALUES ('430981', '沅江市', '430900');
INSERT INTO `yershop_area` VALUES ('431001', '市辖区', '431000');
INSERT INTO `yershop_area` VALUES ('431002', '北湖区', '431000');
INSERT INTO `yershop_area` VALUES ('431003', '苏仙区', '431000');
INSERT INTO `yershop_area` VALUES ('431021', '桂阳县', '431000');
INSERT INTO `yershop_area` VALUES ('431022', '宜章县', '431000');
INSERT INTO `yershop_area` VALUES ('431023', '永兴县', '431000');
INSERT INTO `yershop_area` VALUES ('431024', '嘉禾县', '431000');
INSERT INTO `yershop_area` VALUES ('431025', '临武县', '431000');
INSERT INTO `yershop_area` VALUES ('431026', '汝城县', '431000');
INSERT INTO `yershop_area` VALUES ('431027', '桂东县', '431000');
INSERT INTO `yershop_area` VALUES ('431028', '安仁县', '431000');
INSERT INTO `yershop_area` VALUES ('431081', '资兴市', '431000');
INSERT INTO `yershop_area` VALUES ('431101', '市辖区', '431100');
INSERT INTO `yershop_area` VALUES ('431102', '芝山区', '431100');
INSERT INTO `yershop_area` VALUES ('431103', '冷水滩区', '431100');
INSERT INTO `yershop_area` VALUES ('431121', '祁阳县', '431100');
INSERT INTO `yershop_area` VALUES ('431122', '东安县', '431100');
INSERT INTO `yershop_area` VALUES ('431123', '双牌县', '431100');
INSERT INTO `yershop_area` VALUES ('431124', '道　县', '431100');
INSERT INTO `yershop_area` VALUES ('431125', '江永县', '431100');
INSERT INTO `yershop_area` VALUES ('431126', '宁远县', '431100');
INSERT INTO `yershop_area` VALUES ('431127', '蓝山县', '431100');
INSERT INTO `yershop_area` VALUES ('431128', '新田县', '431100');
INSERT INTO `yershop_area` VALUES ('431129', '江华瑶族自治县', '431100');
INSERT INTO `yershop_area` VALUES ('431201', '市辖区', '431200');
INSERT INTO `yershop_area` VALUES ('431202', '鹤城区', '431200');
INSERT INTO `yershop_area` VALUES ('431221', '中方县', '431200');
INSERT INTO `yershop_area` VALUES ('431222', '沅陵县', '431200');
INSERT INTO `yershop_area` VALUES ('431223', '辰溪县', '431200');
INSERT INTO `yershop_area` VALUES ('431224', '溆浦县', '431200');
INSERT INTO `yershop_area` VALUES ('431225', '会同县', '431200');
INSERT INTO `yershop_area` VALUES ('431226', '麻阳苗族自治县', '431200');
INSERT INTO `yershop_area` VALUES ('431227', '新晃侗族自治县', '431200');
INSERT INTO `yershop_area` VALUES ('431228', '芷江侗族自治县', '431200');
INSERT INTO `yershop_area` VALUES ('431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `yershop_area` VALUES ('431230', '通道侗族自治县', '431200');
INSERT INTO `yershop_area` VALUES ('431281', '洪江市', '431200');
INSERT INTO `yershop_area` VALUES ('431301', '市辖区', '431300');
INSERT INTO `yershop_area` VALUES ('431302', '娄星区', '431300');
INSERT INTO `yershop_area` VALUES ('431321', '双峰县', '431300');
INSERT INTO `yershop_area` VALUES ('431322', '新化县', '431300');
INSERT INTO `yershop_area` VALUES ('431381', '冷水江市', '431300');
INSERT INTO `yershop_area` VALUES ('431382', '涟源市', '431300');
INSERT INTO `yershop_area` VALUES ('433101', '吉首市', '433100');
INSERT INTO `yershop_area` VALUES ('433122', '泸溪县', '433100');
INSERT INTO `yershop_area` VALUES ('433123', '凤凰县', '433100');
INSERT INTO `yershop_area` VALUES ('433124', '花垣县', '433100');
INSERT INTO `yershop_area` VALUES ('433125', '保靖县', '433100');
INSERT INTO `yershop_area` VALUES ('433126', '古丈县', '433100');
INSERT INTO `yershop_area` VALUES ('433127', '永顺县', '433100');
INSERT INTO `yershop_area` VALUES ('433130', '龙山县', '433100');
INSERT INTO `yershop_area` VALUES ('440101', '市辖区', '440100');
INSERT INTO `yershop_area` VALUES ('440102', '东山区', '440100');
INSERT INTO `yershop_area` VALUES ('440103', '荔湾区', '440100');
INSERT INTO `yershop_area` VALUES ('440104', '越秀区', '440100');
INSERT INTO `yershop_area` VALUES ('440105', '海珠区', '440100');
INSERT INTO `yershop_area` VALUES ('440106', '天河区', '440100');
INSERT INTO `yershop_area` VALUES ('440107', '芳村区', '440100');
INSERT INTO `yershop_area` VALUES ('440111', '白云区', '440100');
INSERT INTO `yershop_area` VALUES ('440112', '黄埔区', '440100');
INSERT INTO `yershop_area` VALUES ('440113', '番禺区', '440100');
INSERT INTO `yershop_area` VALUES ('440114', '花都区', '440100');
INSERT INTO `yershop_area` VALUES ('440183', '增城市', '440100');
INSERT INTO `yershop_area` VALUES ('440184', '从化市', '440100');
INSERT INTO `yershop_area` VALUES ('440201', '市辖区', '440200');
INSERT INTO `yershop_area` VALUES ('440203', '武江区', '440200');
INSERT INTO `yershop_area` VALUES ('440204', '浈江区', '440200');
INSERT INTO `yershop_area` VALUES ('440205', '曲江区', '440200');
INSERT INTO `yershop_area` VALUES ('440222', '始兴县', '440200');
INSERT INTO `yershop_area` VALUES ('440224', '仁化县', '440200');
INSERT INTO `yershop_area` VALUES ('440229', '翁源县', '440200');
INSERT INTO `yershop_area` VALUES ('440232', '乳源瑶族自治县', '440200');
INSERT INTO `yershop_area` VALUES ('440233', '新丰县', '440200');
INSERT INTO `yershop_area` VALUES ('440281', '乐昌市', '440200');
INSERT INTO `yershop_area` VALUES ('440282', '南雄市', '440200');
INSERT INTO `yershop_area` VALUES ('440301', '市辖区', '440300');
INSERT INTO `yershop_area` VALUES ('440303', '罗湖区', '440300');
INSERT INTO `yershop_area` VALUES ('440304', '福田区', '440300');
INSERT INTO `yershop_area` VALUES ('440305', '南山区', '440300');
INSERT INTO `yershop_area` VALUES ('440306', '宝安区', '440300');
INSERT INTO `yershop_area` VALUES ('440307', '龙岗区', '440300');
INSERT INTO `yershop_area` VALUES ('440308', '盐田区', '440300');
INSERT INTO `yershop_area` VALUES ('440401', '市辖区', '440400');
INSERT INTO `yershop_area` VALUES ('440402', '香洲区', '440400');
INSERT INTO `yershop_area` VALUES ('440403', '斗门区', '440400');
INSERT INTO `yershop_area` VALUES ('440404', '金湾区', '440400');
INSERT INTO `yershop_area` VALUES ('440501', '市辖区', '440500');
INSERT INTO `yershop_area` VALUES ('440507', '龙湖区', '440500');
INSERT INTO `yershop_area` VALUES ('440511', '金平区', '440500');
INSERT INTO `yershop_area` VALUES ('440512', '濠江区', '440500');
INSERT INTO `yershop_area` VALUES ('440513', '潮阳区', '440500');
INSERT INTO `yershop_area` VALUES ('440514', '潮南区', '440500');
INSERT INTO `yershop_area` VALUES ('440515', '澄海区', '440500');
INSERT INTO `yershop_area` VALUES ('440523', '南澳县', '440500');
INSERT INTO `yershop_area` VALUES ('440601', '市辖区', '440600');
INSERT INTO `yershop_area` VALUES ('440604', '禅城区', '440600');
INSERT INTO `yershop_area` VALUES ('440605', '南海区', '440600');
INSERT INTO `yershop_area` VALUES ('440606', '顺德区', '440600');
INSERT INTO `yershop_area` VALUES ('440607', '三水区', '440600');
INSERT INTO `yershop_area` VALUES ('440608', '高明区', '440600');
INSERT INTO `yershop_area` VALUES ('440701', '市辖区', '440700');
INSERT INTO `yershop_area` VALUES ('440703', '蓬江区', '440700');
INSERT INTO `yershop_area` VALUES ('440704', '江海区', '440700');
INSERT INTO `yershop_area` VALUES ('440705', '新会区', '440700');
INSERT INTO `yershop_area` VALUES ('440781', '台山市', '440700');
INSERT INTO `yershop_area` VALUES ('440783', '开平市', '440700');
INSERT INTO `yershop_area` VALUES ('440784', '鹤山市', '440700');
INSERT INTO `yershop_area` VALUES ('440785', '恩平市', '440700');
INSERT INTO `yershop_area` VALUES ('440801', '市辖区', '440800');
INSERT INTO `yershop_area` VALUES ('440802', '赤坎区', '440800');
INSERT INTO `yershop_area` VALUES ('440803', '霞山区', '440800');
INSERT INTO `yershop_area` VALUES ('440804', '坡头区', '440800');
INSERT INTO `yershop_area` VALUES ('440811', '麻章区', '440800');
INSERT INTO `yershop_area` VALUES ('440823', '遂溪县', '440800');
INSERT INTO `yershop_area` VALUES ('440825', '徐闻县', '440800');
INSERT INTO `yershop_area` VALUES ('440881', '廉江市', '440800');
INSERT INTO `yershop_area` VALUES ('440882', '雷州市', '440800');
INSERT INTO `yershop_area` VALUES ('440883', '吴川市', '440800');
INSERT INTO `yershop_area` VALUES ('440901', '市辖区', '440900');
INSERT INTO `yershop_area` VALUES ('440902', '茂南区', '440900');
INSERT INTO `yershop_area` VALUES ('440903', '茂港区', '440900');
INSERT INTO `yershop_area` VALUES ('440923', '电白县', '440900');
INSERT INTO `yershop_area` VALUES ('440981', '高州市', '440900');
INSERT INTO `yershop_area` VALUES ('440982', '化州市', '440900');
INSERT INTO `yershop_area` VALUES ('440983', '信宜市', '440900');
INSERT INTO `yershop_area` VALUES ('441201', '市辖区', '441200');
INSERT INTO `yershop_area` VALUES ('441202', '端州区', '441200');
INSERT INTO `yershop_area` VALUES ('441203', '鼎湖区', '441200');
INSERT INTO `yershop_area` VALUES ('441223', '广宁县', '441200');
INSERT INTO `yershop_area` VALUES ('441224', '怀集县', '441200');
INSERT INTO `yershop_area` VALUES ('441225', '封开县', '441200');
INSERT INTO `yershop_area` VALUES ('441226', '德庆县', '441200');
INSERT INTO `yershop_area` VALUES ('441283', '高要市', '441200');
INSERT INTO `yershop_area` VALUES ('441284', '四会市', '441200');
INSERT INTO `yershop_area` VALUES ('441301', '市辖区', '441300');
INSERT INTO `yershop_area` VALUES ('441302', '惠城区', '441300');
INSERT INTO `yershop_area` VALUES ('441303', '惠阳区', '441300');
INSERT INTO `yershop_area` VALUES ('441322', '博罗县', '441300');
INSERT INTO `yershop_area` VALUES ('441323', '惠东县', '441300');
INSERT INTO `yershop_area` VALUES ('441324', '龙门县', '441300');
INSERT INTO `yershop_area` VALUES ('441401', '市辖区', '441400');
INSERT INTO `yershop_area` VALUES ('441402', '梅江区', '441400');
INSERT INTO `yershop_area` VALUES ('441421', '梅　县', '441400');
INSERT INTO `yershop_area` VALUES ('441422', '大埔县', '441400');
INSERT INTO `yershop_area` VALUES ('441423', '丰顺县', '441400');
INSERT INTO `yershop_area` VALUES ('441424', '五华县', '441400');
INSERT INTO `yershop_area` VALUES ('441426', '平远县', '441400');
INSERT INTO `yershop_area` VALUES ('441427', '蕉岭县', '441400');
INSERT INTO `yershop_area` VALUES ('441481', '兴宁市', '441400');
INSERT INTO `yershop_area` VALUES ('441501', '市辖区', '441500');
INSERT INTO `yershop_area` VALUES ('441502', '城　区', '441500');
INSERT INTO `yershop_area` VALUES ('441521', '海丰县', '441500');
INSERT INTO `yershop_area` VALUES ('441523', '陆河县', '441500');
INSERT INTO `yershop_area` VALUES ('441581', '陆丰市', '441500');
INSERT INTO `yershop_area` VALUES ('441601', '市辖区', '441600');
INSERT INTO `yershop_area` VALUES ('441602', '源城区', '441600');
INSERT INTO `yershop_area` VALUES ('441621', '紫金县', '441600');
INSERT INTO `yershop_area` VALUES ('441622', '龙川县', '441600');
INSERT INTO `yershop_area` VALUES ('441623', '连平县', '441600');
INSERT INTO `yershop_area` VALUES ('441624', '和平县', '441600');
INSERT INTO `yershop_area` VALUES ('441625', '东源县', '441600');
INSERT INTO `yershop_area` VALUES ('441701', '市辖区', '441700');
INSERT INTO `yershop_area` VALUES ('441702', '江城区', '441700');
INSERT INTO `yershop_area` VALUES ('441721', '阳西县', '441700');
INSERT INTO `yershop_area` VALUES ('441723', '阳东县', '441700');
INSERT INTO `yershop_area` VALUES ('441781', '阳春市', '441700');
INSERT INTO `yershop_area` VALUES ('441801', '市辖区', '441800');
INSERT INTO `yershop_area` VALUES ('441802', '清城区', '441800');
INSERT INTO `yershop_area` VALUES ('441821', '佛冈县', '441800');
INSERT INTO `yershop_area` VALUES ('441823', '阳山县', '441800');
INSERT INTO `yershop_area` VALUES ('441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `yershop_area` VALUES ('441826', '连南瑶族自治县', '441800');
INSERT INTO `yershop_area` VALUES ('441827', '清新县', '441800');
INSERT INTO `yershop_area` VALUES ('441881', '英德市', '441800');
INSERT INTO `yershop_area` VALUES ('441882', '连州市', '441800');
INSERT INTO `yershop_area` VALUES ('445101', '市辖区', '445100');
INSERT INTO `yershop_area` VALUES ('445102', '湘桥区', '445100');
INSERT INTO `yershop_area` VALUES ('445121', '潮安县', '445100');
INSERT INTO `yershop_area` VALUES ('445122', '饶平县', '445100');
INSERT INTO `yershop_area` VALUES ('445201', '市辖区', '445200');
INSERT INTO `yershop_area` VALUES ('445202', '榕城区', '445200');
INSERT INTO `yershop_area` VALUES ('445221', '揭东县', '445200');
INSERT INTO `yershop_area` VALUES ('445222', '揭西县', '445200');
INSERT INTO `yershop_area` VALUES ('445224', '惠来县', '445200');
INSERT INTO `yershop_area` VALUES ('445281', '普宁市', '445200');
INSERT INTO `yershop_area` VALUES ('445301', '市辖区', '445300');
INSERT INTO `yershop_area` VALUES ('445302', '云城区', '445300');
INSERT INTO `yershop_area` VALUES ('445321', '新兴县', '445300');
INSERT INTO `yershop_area` VALUES ('445322', '郁南县', '445300');
INSERT INTO `yershop_area` VALUES ('445323', '云安县', '445300');
INSERT INTO `yershop_area` VALUES ('445381', '罗定市', '445300');
INSERT INTO `yershop_area` VALUES ('450101', '市辖区', '450100');
INSERT INTO `yershop_area` VALUES ('450102', '兴宁区', '450100');
INSERT INTO `yershop_area` VALUES ('450103', '青秀区', '450100');
INSERT INTO `yershop_area` VALUES ('450105', '江南区', '450100');
INSERT INTO `yershop_area` VALUES ('450107', '西乡塘区', '450100');
INSERT INTO `yershop_area` VALUES ('450108', '良庆区', '450100');
INSERT INTO `yershop_area` VALUES ('450109', '邕宁区', '450100');
INSERT INTO `yershop_area` VALUES ('450122', '武鸣县', '450100');
INSERT INTO `yershop_area` VALUES ('450123', '隆安县', '450100');
INSERT INTO `yershop_area` VALUES ('450124', '马山县', '450100');
INSERT INTO `yershop_area` VALUES ('450125', '上林县', '450100');
INSERT INTO `yershop_area` VALUES ('450126', '宾阳县', '450100');
INSERT INTO `yershop_area` VALUES ('450127', '横　县', '450100');
INSERT INTO `yershop_area` VALUES ('450201', '市辖区', '450200');
INSERT INTO `yershop_area` VALUES ('450202', '城中区', '450200');
INSERT INTO `yershop_area` VALUES ('450203', '鱼峰区', '450200');
INSERT INTO `yershop_area` VALUES ('450204', '柳南区', '450200');
INSERT INTO `yershop_area` VALUES ('450205', '柳北区', '450200');
INSERT INTO `yershop_area` VALUES ('450221', '柳江县', '450200');
INSERT INTO `yershop_area` VALUES ('450222', '柳城县', '450200');
INSERT INTO `yershop_area` VALUES ('450223', '鹿寨县', '450200');
INSERT INTO `yershop_area` VALUES ('450224', '融安县', '450200');
INSERT INTO `yershop_area` VALUES ('450225', '融水苗族自治县', '450200');
INSERT INTO `yershop_area` VALUES ('450226', '三江侗族自治县', '450200');
INSERT INTO `yershop_area` VALUES ('450301', '市辖区', '450300');
INSERT INTO `yershop_area` VALUES ('450302', '秀峰区', '450300');
INSERT INTO `yershop_area` VALUES ('450303', '叠彩区', '450300');
INSERT INTO `yershop_area` VALUES ('450304', '象山区', '450300');
INSERT INTO `yershop_area` VALUES ('450305', '七星区', '450300');
INSERT INTO `yershop_area` VALUES ('450311', '雁山区', '450300');
INSERT INTO `yershop_area` VALUES ('450321', '阳朔县', '450300');
INSERT INTO `yershop_area` VALUES ('450322', '临桂县', '450300');
INSERT INTO `yershop_area` VALUES ('450323', '灵川县', '450300');
INSERT INTO `yershop_area` VALUES ('450324', '全州县', '450300');
INSERT INTO `yershop_area` VALUES ('450325', '兴安县', '450300');
INSERT INTO `yershop_area` VALUES ('450326', '永福县', '450300');
INSERT INTO `yershop_area` VALUES ('450327', '灌阳县', '450300');
INSERT INTO `yershop_area` VALUES ('450328', '龙胜各族自治县', '450300');
INSERT INTO `yershop_area` VALUES ('450329', '资源县', '450300');
INSERT INTO `yershop_area` VALUES ('450330', '平乐县', '450300');
INSERT INTO `yershop_area` VALUES ('450331', '荔蒲县', '450300');
INSERT INTO `yershop_area` VALUES ('450332', '恭城瑶族自治县', '450300');
INSERT INTO `yershop_area` VALUES ('450401', '市辖区', '450400');
INSERT INTO `yershop_area` VALUES ('450403', '万秀区', '450400');
INSERT INTO `yershop_area` VALUES ('450404', '蝶山区', '450400');
INSERT INTO `yershop_area` VALUES ('450405', '长洲区', '450400');
INSERT INTO `yershop_area` VALUES ('450421', '苍梧县', '450400');
INSERT INTO `yershop_area` VALUES ('450422', '藤　县', '450400');
INSERT INTO `yershop_area` VALUES ('450423', '蒙山县', '450400');
INSERT INTO `yershop_area` VALUES ('450481', '岑溪市', '450400');
INSERT INTO `yershop_area` VALUES ('450501', '市辖区', '450500');
INSERT INTO `yershop_area` VALUES ('450502', '海城区', '450500');
INSERT INTO `yershop_area` VALUES ('450503', '银海区', '450500');
INSERT INTO `yershop_area` VALUES ('450512', '铁山港区', '450500');
INSERT INTO `yershop_area` VALUES ('450521', '合浦县', '450500');
INSERT INTO `yershop_area` VALUES ('450601', '市辖区', '450600');
INSERT INTO `yershop_area` VALUES ('450602', '港口区', '450600');
INSERT INTO `yershop_area` VALUES ('450603', '防城区', '450600');
INSERT INTO `yershop_area` VALUES ('450621', '上思县', '450600');
INSERT INTO `yershop_area` VALUES ('450681', '东兴市', '450600');
INSERT INTO `yershop_area` VALUES ('450701', '市辖区', '450700');
INSERT INTO `yershop_area` VALUES ('450702', '钦南区', '450700');
INSERT INTO `yershop_area` VALUES ('450703', '钦北区', '450700');
INSERT INTO `yershop_area` VALUES ('450721', '灵山县', '450700');
INSERT INTO `yershop_area` VALUES ('450722', '浦北县', '450700');
INSERT INTO `yershop_area` VALUES ('450801', '市辖区', '450800');
INSERT INTO `yershop_area` VALUES ('450802', '港北区', '450800');
INSERT INTO `yershop_area` VALUES ('450803', '港南区', '450800');
INSERT INTO `yershop_area` VALUES ('450804', '覃塘区', '450800');
INSERT INTO `yershop_area` VALUES ('450821', '平南县', '450800');
INSERT INTO `yershop_area` VALUES ('450881', '桂平市', '450800');
INSERT INTO `yershop_area` VALUES ('450901', '市辖区', '450900');
INSERT INTO `yershop_area` VALUES ('450902', '玉州区', '450900');
INSERT INTO `yershop_area` VALUES ('450921', '容　县', '450900');
INSERT INTO `yershop_area` VALUES ('450922', '陆川县', '450900');
INSERT INTO `yershop_area` VALUES ('450923', '博白县', '450900');
INSERT INTO `yershop_area` VALUES ('450924', '兴业县', '450900');
INSERT INTO `yershop_area` VALUES ('450981', '北流市', '450900');
INSERT INTO `yershop_area` VALUES ('451001', '市辖区', '451000');
INSERT INTO `yershop_area` VALUES ('451002', '右江区', '451000');
INSERT INTO `yershop_area` VALUES ('451021', '田阳县', '451000');
INSERT INTO `yershop_area` VALUES ('451022', '田东县', '451000');
INSERT INTO `yershop_area` VALUES ('451023', '平果县', '451000');
INSERT INTO `yershop_area` VALUES ('451024', '德保县', '451000');
INSERT INTO `yershop_area` VALUES ('451025', '靖西县', '451000');
INSERT INTO `yershop_area` VALUES ('451026', '那坡县', '451000');
INSERT INTO `yershop_area` VALUES ('451027', '凌云县', '451000');
INSERT INTO `yershop_area` VALUES ('451028', '乐业县', '451000');
INSERT INTO `yershop_area` VALUES ('451029', '田林县', '451000');
INSERT INTO `yershop_area` VALUES ('451030', '西林县', '451000');
INSERT INTO `yershop_area` VALUES ('451031', '隆林各族自治县', '451000');
INSERT INTO `yershop_area` VALUES ('451101', '市辖区', '451100');
INSERT INTO `yershop_area` VALUES ('451102', '八步区', '451100');
INSERT INTO `yershop_area` VALUES ('451121', '昭平县', '451100');
INSERT INTO `yershop_area` VALUES ('451122', '钟山县', '451100');
INSERT INTO `yershop_area` VALUES ('451123', '富川瑶族自治县', '451100');
INSERT INTO `yershop_area` VALUES ('451201', '市辖区', '451200');
INSERT INTO `yershop_area` VALUES ('451202', '金城江区', '451200');
INSERT INTO `yershop_area` VALUES ('451221', '南丹县', '451200');
INSERT INTO `yershop_area` VALUES ('451222', '天峨县', '451200');
INSERT INTO `yershop_area` VALUES ('451223', '凤山县', '451200');
INSERT INTO `yershop_area` VALUES ('451224', '东兰县', '451200');
INSERT INTO `yershop_area` VALUES ('451225', '罗城仫佬族自治县', '451200');
INSERT INTO `yershop_area` VALUES ('451226', '环江毛南族自治县', '451200');
INSERT INTO `yershop_area` VALUES ('451227', '巴马瑶族自治县', '451200');
INSERT INTO `yershop_area` VALUES ('451228', '都安瑶族自治县', '451200');
INSERT INTO `yershop_area` VALUES ('451229', '大化瑶族自治县', '451200');
INSERT INTO `yershop_area` VALUES ('451281', '宜州市', '451200');
INSERT INTO `yershop_area` VALUES ('451301', '市辖区', '451300');
INSERT INTO `yershop_area` VALUES ('451302', '兴宾区', '451300');
INSERT INTO `yershop_area` VALUES ('451321', '忻城县', '451300');
INSERT INTO `yershop_area` VALUES ('451322', '象州县', '451300');
INSERT INTO `yershop_area` VALUES ('451323', '武宣县', '451300');
INSERT INTO `yershop_area` VALUES ('451324', '金秀瑶族自治县', '451300');
INSERT INTO `yershop_area` VALUES ('451381', '合山市', '451300');
INSERT INTO `yershop_area` VALUES ('451401', '市辖区', '451400');
INSERT INTO `yershop_area` VALUES ('451402', '江洲区', '451400');
INSERT INTO `yershop_area` VALUES ('451421', '扶绥县', '451400');
INSERT INTO `yershop_area` VALUES ('451422', '宁明县', '451400');
INSERT INTO `yershop_area` VALUES ('451423', '龙州县', '451400');
INSERT INTO `yershop_area` VALUES ('451424', '大新县', '451400');
INSERT INTO `yershop_area` VALUES ('451425', '天等县', '451400');
INSERT INTO `yershop_area` VALUES ('451481', '凭祥市', '451400');
INSERT INTO `yershop_area` VALUES ('460101', '市辖区', '460100');
INSERT INTO `yershop_area` VALUES ('460105', '秀英区', '460100');
INSERT INTO `yershop_area` VALUES ('460106', '龙华区', '460100');
INSERT INTO `yershop_area` VALUES ('460107', '琼山区', '460100');
INSERT INTO `yershop_area` VALUES ('460108', '美兰区', '460100');
INSERT INTO `yershop_area` VALUES ('460201', '市辖区', '460200');
INSERT INTO `yershop_area` VALUES ('469001', '五指山市', '469000');
INSERT INTO `yershop_area` VALUES ('469002', '琼海市', '469000');
INSERT INTO `yershop_area` VALUES ('469003', '儋州市', '469000');
INSERT INTO `yershop_area` VALUES ('469005', '文昌市', '469000');
INSERT INTO `yershop_area` VALUES ('469006', '万宁市', '469000');
INSERT INTO `yershop_area` VALUES ('469007', '东方市', '469000');
INSERT INTO `yershop_area` VALUES ('469025', '定安县', '469000');
INSERT INTO `yershop_area` VALUES ('469026', '屯昌县', '469000');
INSERT INTO `yershop_area` VALUES ('469027', '澄迈县', '469000');
INSERT INTO `yershop_area` VALUES ('469028', '临高县', '469000');
INSERT INTO `yershop_area` VALUES ('469030', '白沙黎族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469031', '昌江黎族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469033', '乐东黎族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469034', '陵水黎族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `yershop_area` VALUES ('469037', '西沙群岛', '469000');
INSERT INTO `yershop_area` VALUES ('469038', '南沙群岛', '469000');
INSERT INTO `yershop_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `yershop_area` VALUES ('500101', '万州区', '500100');
INSERT INTO `yershop_area` VALUES ('500102', '涪陵区', '500100');
INSERT INTO `yershop_area` VALUES ('500103', '渝中区', '500100');
INSERT INTO `yershop_area` VALUES ('500104', '大渡口区', '500100');
INSERT INTO `yershop_area` VALUES ('500105', '江北区', '500100');
INSERT INTO `yershop_area` VALUES ('500106', '沙坪坝区', '500100');
INSERT INTO `yershop_area` VALUES ('500107', '九龙坡区', '500100');
INSERT INTO `yershop_area` VALUES ('500108', '南岸区', '500100');
INSERT INTO `yershop_area` VALUES ('500109', '北碚区', '500100');
INSERT INTO `yershop_area` VALUES ('500110', '万盛区', '500100');
INSERT INTO `yershop_area` VALUES ('500111', '双桥区', '500100');
INSERT INTO `yershop_area` VALUES ('500112', '渝北区', '500100');
INSERT INTO `yershop_area` VALUES ('500113', '巴南区', '500100');
INSERT INTO `yershop_area` VALUES ('500114', '黔江区', '500100');
INSERT INTO `yershop_area` VALUES ('500115', '长寿区', '500100');
INSERT INTO `yershop_area` VALUES ('500222', '綦江县', '500200');
INSERT INTO `yershop_area` VALUES ('500223', '潼南县', '500200');
INSERT INTO `yershop_area` VALUES ('500224', '铜梁县', '500200');
INSERT INTO `yershop_area` VALUES ('500225', '大足县', '500200');
INSERT INTO `yershop_area` VALUES ('500226', '荣昌县', '500200');
INSERT INTO `yershop_area` VALUES ('500227', '璧山县', '500200');
INSERT INTO `yershop_area` VALUES ('500228', '梁平县', '500200');
INSERT INTO `yershop_area` VALUES ('500229', '城口县', '500200');
INSERT INTO `yershop_area` VALUES ('500230', '丰都县', '500200');
INSERT INTO `yershop_area` VALUES ('500231', '垫江县', '500200');
INSERT INTO `yershop_area` VALUES ('500232', '武隆县', '500200');
INSERT INTO `yershop_area` VALUES ('500233', '忠　县', '500200');
INSERT INTO `yershop_area` VALUES ('500234', '开　县', '500200');
INSERT INTO `yershop_area` VALUES ('500235', '云阳县', '500200');
INSERT INTO `yershop_area` VALUES ('500236', '奉节县', '500200');
INSERT INTO `yershop_area` VALUES ('500237', '巫山县', '500200');
INSERT INTO `yershop_area` VALUES ('500238', '巫溪县', '500200');
INSERT INTO `yershop_area` VALUES ('500240', '石柱土家族自治县', '500200');
INSERT INTO `yershop_area` VALUES ('500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `yershop_area` VALUES ('500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `yershop_area` VALUES ('500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `yershop_area` VALUES ('500381', '江津市', '500300');
INSERT INTO `yershop_area` VALUES ('500382', '合川市', '500300');
INSERT INTO `yershop_area` VALUES ('500383', '永川市', '500300');
INSERT INTO `yershop_area` VALUES ('500384', '南川市', '500300');
INSERT INTO `yershop_area` VALUES ('510101', '市辖区', '510100');
INSERT INTO `yershop_area` VALUES ('510104', '锦江区', '510100');
INSERT INTO `yershop_area` VALUES ('510105', '青羊区', '510100');
INSERT INTO `yershop_area` VALUES ('510106', '金牛区', '510100');
INSERT INTO `yershop_area` VALUES ('510107', '武侯区', '510100');
INSERT INTO `yershop_area` VALUES ('510108', '成华区', '510100');
INSERT INTO `yershop_area` VALUES ('510112', '龙泉驿区', '510100');
INSERT INTO `yershop_area` VALUES ('510113', '青白江区', '510100');
INSERT INTO `yershop_area` VALUES ('510114', '新都区', '510100');
INSERT INTO `yershop_area` VALUES ('510115', '温江区', '510100');
INSERT INTO `yershop_area` VALUES ('510121', '金堂县', '510100');
INSERT INTO `yershop_area` VALUES ('510122', '双流县', '510100');
INSERT INTO `yershop_area` VALUES ('510124', '郫　县', '510100');
INSERT INTO `yershop_area` VALUES ('510129', '大邑县', '510100');
INSERT INTO `yershop_area` VALUES ('510131', '蒲江县', '510100');
INSERT INTO `yershop_area` VALUES ('510132', '新津县', '510100');
INSERT INTO `yershop_area` VALUES ('510181', '都江堰市', '510100');
INSERT INTO `yershop_area` VALUES ('510182', '彭州市', '510100');
INSERT INTO `yershop_area` VALUES ('510183', '邛崃市', '510100');
INSERT INTO `yershop_area` VALUES ('510184', '崇州市', '510100');
INSERT INTO `yershop_area` VALUES ('510301', '市辖区', '510300');
INSERT INTO `yershop_area` VALUES ('510302', '自流井区', '510300');
INSERT INTO `yershop_area` VALUES ('510303', '贡井区', '510300');
INSERT INTO `yershop_area` VALUES ('510304', '大安区', '510300');
INSERT INTO `yershop_area` VALUES ('510311', '沿滩区', '510300');
INSERT INTO `yershop_area` VALUES ('510321', '荣　县', '510300');
INSERT INTO `yershop_area` VALUES ('510322', '富顺县', '510300');
INSERT INTO `yershop_area` VALUES ('510401', '市辖区', '510400');
INSERT INTO `yershop_area` VALUES ('510402', '东　区', '510400');
INSERT INTO `yershop_area` VALUES ('510403', '西　区', '510400');
INSERT INTO `yershop_area` VALUES ('510411', '仁和区', '510400');
INSERT INTO `yershop_area` VALUES ('510421', '米易县', '510400');
INSERT INTO `yershop_area` VALUES ('510422', '盐边县', '510400');
INSERT INTO `yershop_area` VALUES ('510501', '市辖区', '510500');
INSERT INTO `yershop_area` VALUES ('510502', '江阳区', '510500');
INSERT INTO `yershop_area` VALUES ('510503', '纳溪区', '510500');
INSERT INTO `yershop_area` VALUES ('510504', '龙马潭区', '510500');
INSERT INTO `yershop_area` VALUES ('510521', '泸　县', '510500');
INSERT INTO `yershop_area` VALUES ('510522', '合江县', '510500');
INSERT INTO `yershop_area` VALUES ('510524', '叙永县', '510500');
INSERT INTO `yershop_area` VALUES ('510525', '古蔺县', '510500');
INSERT INTO `yershop_area` VALUES ('510601', '市辖区', '510600');
INSERT INTO `yershop_area` VALUES ('510603', '旌阳区', '510600');
INSERT INTO `yershop_area` VALUES ('510623', '中江县', '510600');
INSERT INTO `yershop_area` VALUES ('510626', '罗江县', '510600');
INSERT INTO `yershop_area` VALUES ('510681', '广汉市', '510600');
INSERT INTO `yershop_area` VALUES ('510682', '什邡市', '510600');
INSERT INTO `yershop_area` VALUES ('510683', '绵竹市', '510600');
INSERT INTO `yershop_area` VALUES ('510701', '市辖区', '510700');
INSERT INTO `yershop_area` VALUES ('510703', '涪城区', '510700');
INSERT INTO `yershop_area` VALUES ('510704', '游仙区', '510700');
INSERT INTO `yershop_area` VALUES ('510722', '三台县', '510700');
INSERT INTO `yershop_area` VALUES ('510723', '盐亭县', '510700');
INSERT INTO `yershop_area` VALUES ('510724', '安　县', '510700');
INSERT INTO `yershop_area` VALUES ('510725', '梓潼县', '510700');
INSERT INTO `yershop_area` VALUES ('510726', '北川羌族自治县', '510700');
INSERT INTO `yershop_area` VALUES ('510727', '平武县', '510700');
INSERT INTO `yershop_area` VALUES ('510781', '江油市', '510700');
INSERT INTO `yershop_area` VALUES ('510801', '市辖区', '510800');
INSERT INTO `yershop_area` VALUES ('510802', '市中区', '510800');
INSERT INTO `yershop_area` VALUES ('510811', '元坝区', '510800');
INSERT INTO `yershop_area` VALUES ('510812', '朝天区', '510800');
INSERT INTO `yershop_area` VALUES ('510821', '旺苍县', '510800');
INSERT INTO `yershop_area` VALUES ('510822', '青川县', '510800');
INSERT INTO `yershop_area` VALUES ('510823', '剑阁县', '510800');
INSERT INTO `yershop_area` VALUES ('510824', '苍溪县', '510800');
INSERT INTO `yershop_area` VALUES ('510901', '市辖区', '510900');
INSERT INTO `yershop_area` VALUES ('510903', '船山区', '510900');
INSERT INTO `yershop_area` VALUES ('510904', '安居区', '510900');
INSERT INTO `yershop_area` VALUES ('510921', '蓬溪县', '510900');
INSERT INTO `yershop_area` VALUES ('510922', '射洪县', '510900');
INSERT INTO `yershop_area` VALUES ('510923', '大英县', '510900');
INSERT INTO `yershop_area` VALUES ('511001', '市辖区', '511000');
INSERT INTO `yershop_area` VALUES ('511002', '市中区', '511000');
INSERT INTO `yershop_area` VALUES ('511011', '东兴区', '511000');
INSERT INTO `yershop_area` VALUES ('511024', '威远县', '511000');
INSERT INTO `yershop_area` VALUES ('511025', '资中县', '511000');
INSERT INTO `yershop_area` VALUES ('511028', '隆昌县', '511000');
INSERT INTO `yershop_area` VALUES ('511101', '市辖区', '511100');
INSERT INTO `yershop_area` VALUES ('511102', '市中区', '511100');
INSERT INTO `yershop_area` VALUES ('511111', '沙湾区', '511100');
INSERT INTO `yershop_area` VALUES ('511112', '五通桥区', '511100');
INSERT INTO `yershop_area` VALUES ('511113', '金口河区', '511100');
INSERT INTO `yershop_area` VALUES ('511123', '犍为县', '511100');
INSERT INTO `yershop_area` VALUES ('511124', '井研县', '511100');
INSERT INTO `yershop_area` VALUES ('511126', '夹江县', '511100');
INSERT INTO `yershop_area` VALUES ('511129', '沐川县', '511100');
INSERT INTO `yershop_area` VALUES ('511132', '峨边彝族自治县', '511100');
INSERT INTO `yershop_area` VALUES ('511133', '马边彝族自治县', '511100');
INSERT INTO `yershop_area` VALUES ('511181', '峨眉山市', '511100');
INSERT INTO `yershop_area` VALUES ('511301', '市辖区', '511300');
INSERT INTO `yershop_area` VALUES ('511302', '顺庆区', '511300');
INSERT INTO `yershop_area` VALUES ('511303', '高坪区', '511300');
INSERT INTO `yershop_area` VALUES ('511304', '嘉陵区', '511300');
INSERT INTO `yershop_area` VALUES ('511321', '南部县', '511300');
INSERT INTO `yershop_area` VALUES ('511322', '营山县', '511300');
INSERT INTO `yershop_area` VALUES ('511323', '蓬安县', '511300');
INSERT INTO `yershop_area` VALUES ('511324', '仪陇县', '511300');
INSERT INTO `yershop_area` VALUES ('511325', '西充县', '511300');
INSERT INTO `yershop_area` VALUES ('511381', '阆中市', '511300');
INSERT INTO `yershop_area` VALUES ('511401', '市辖区', '511400');
INSERT INTO `yershop_area` VALUES ('511402', '东坡区', '511400');
INSERT INTO `yershop_area` VALUES ('511421', '仁寿县', '511400');
INSERT INTO `yershop_area` VALUES ('511422', '彭山县', '511400');
INSERT INTO `yershop_area` VALUES ('511423', '洪雅县', '511400');
INSERT INTO `yershop_area` VALUES ('511424', '丹棱县', '511400');
INSERT INTO `yershop_area` VALUES ('511425', '青神县', '511400');
INSERT INTO `yershop_area` VALUES ('511501', '市辖区', '511500');
INSERT INTO `yershop_area` VALUES ('511502', '翠屏区', '511500');
INSERT INTO `yershop_area` VALUES ('511521', '宜宾县', '511500');
INSERT INTO `yershop_area` VALUES ('511522', '南溪县', '511500');
INSERT INTO `yershop_area` VALUES ('511523', '江安县', '511500');
INSERT INTO `yershop_area` VALUES ('511524', '长宁县', '511500');
INSERT INTO `yershop_area` VALUES ('511525', '高　县', '511500');
INSERT INTO `yershop_area` VALUES ('511526', '珙　县', '511500');
INSERT INTO `yershop_area` VALUES ('511527', '筠连县', '511500');
INSERT INTO `yershop_area` VALUES ('511528', '兴文县', '511500');
INSERT INTO `yershop_area` VALUES ('511529', '屏山县', '511500');
INSERT INTO `yershop_area` VALUES ('511601', '市辖区', '511600');
INSERT INTO `yershop_area` VALUES ('511602', '广安区', '511600');
INSERT INTO `yershop_area` VALUES ('511621', '岳池县', '511600');
INSERT INTO `yershop_area` VALUES ('511622', '武胜县', '511600');
INSERT INTO `yershop_area` VALUES ('511623', '邻水县', '511600');
INSERT INTO `yershop_area` VALUES ('511681', '华莹市', '511600');
INSERT INTO `yershop_area` VALUES ('511701', '市辖区', '511700');
INSERT INTO `yershop_area` VALUES ('511702', '通川区', '511700');
INSERT INTO `yershop_area` VALUES ('511721', '达　县', '511700');
INSERT INTO `yershop_area` VALUES ('511722', '宣汉县', '511700');
INSERT INTO `yershop_area` VALUES ('511723', '开江县', '511700');
INSERT INTO `yershop_area` VALUES ('511724', '大竹县', '511700');
INSERT INTO `yershop_area` VALUES ('511725', '渠　县', '511700');
INSERT INTO `yershop_area` VALUES ('511781', '万源市', '511700');
INSERT INTO `yershop_area` VALUES ('511801', '市辖区', '511800');
INSERT INTO `yershop_area` VALUES ('511802', '雨城区', '511800');
INSERT INTO `yershop_area` VALUES ('511821', '名山县', '511800');
INSERT INTO `yershop_area` VALUES ('511822', '荥经县', '511800');
INSERT INTO `yershop_area` VALUES ('511823', '汉源县', '511800');
INSERT INTO `yershop_area` VALUES ('511824', '石棉县', '511800');
INSERT INTO `yershop_area` VALUES ('511825', '天全县', '511800');
INSERT INTO `yershop_area` VALUES ('511826', '芦山县', '511800');
INSERT INTO `yershop_area` VALUES ('511827', '宝兴县', '511800');
INSERT INTO `yershop_area` VALUES ('511901', '市辖区', '511900');
INSERT INTO `yershop_area` VALUES ('511902', '巴州区', '511900');
INSERT INTO `yershop_area` VALUES ('511921', '通江县', '511900');
INSERT INTO `yershop_area` VALUES ('511922', '南江县', '511900');
INSERT INTO `yershop_area` VALUES ('511923', '平昌县', '511900');
INSERT INTO `yershop_area` VALUES ('512001', '市辖区', '512000');
INSERT INTO `yershop_area` VALUES ('512002', '雁江区', '512000');
INSERT INTO `yershop_area` VALUES ('512021', '安岳县', '512000');
INSERT INTO `yershop_area` VALUES ('512022', '乐至县', '512000');
INSERT INTO `yershop_area` VALUES ('512081', '简阳市', '512000');
INSERT INTO `yershop_area` VALUES ('513221', '汶川县', '513200');
INSERT INTO `yershop_area` VALUES ('513222', '理　县', '513200');
INSERT INTO `yershop_area` VALUES ('513223', '茂　县', '513200');
INSERT INTO `yershop_area` VALUES ('513224', '松潘县', '513200');
INSERT INTO `yershop_area` VALUES ('513225', '九寨沟县', '513200');
INSERT INTO `yershop_area` VALUES ('513226', '金川县', '513200');
INSERT INTO `yershop_area` VALUES ('513227', '小金县', '513200');
INSERT INTO `yershop_area` VALUES ('513228', '黑水县', '513200');
INSERT INTO `yershop_area` VALUES ('513229', '马尔康县', '513200');
INSERT INTO `yershop_area` VALUES ('513230', '壤塘县', '513200');
INSERT INTO `yershop_area` VALUES ('513231', '阿坝县', '513200');
INSERT INTO `yershop_area` VALUES ('513232', '若尔盖县', '513200');
INSERT INTO `yershop_area` VALUES ('513233', '红原县', '513200');
INSERT INTO `yershop_area` VALUES ('513321', '康定县', '513300');
INSERT INTO `yershop_area` VALUES ('513322', '泸定县', '513300');
INSERT INTO `yershop_area` VALUES ('513323', '丹巴县', '513300');
INSERT INTO `yershop_area` VALUES ('513324', '九龙县', '513300');
INSERT INTO `yershop_area` VALUES ('513325', '雅江县', '513300');
INSERT INTO `yershop_area` VALUES ('513326', '道孚县', '513300');
INSERT INTO `yershop_area` VALUES ('513327', '炉霍县', '513300');
INSERT INTO `yershop_area` VALUES ('513328', '甘孜县', '513300');
INSERT INTO `yershop_area` VALUES ('513329', '新龙县', '513300');
INSERT INTO `yershop_area` VALUES ('513330', '德格县', '513300');
INSERT INTO `yershop_area` VALUES ('513331', '白玉县', '513300');
INSERT INTO `yershop_area` VALUES ('513332', '石渠县', '513300');
INSERT INTO `yershop_area` VALUES ('513333', '色达县', '513300');
INSERT INTO `yershop_area` VALUES ('513334', '理塘县', '513300');
INSERT INTO `yershop_area` VALUES ('513335', '巴塘县', '513300');
INSERT INTO `yershop_area` VALUES ('513336', '乡城县', '513300');
INSERT INTO `yershop_area` VALUES ('513337', '稻城县', '513300');
INSERT INTO `yershop_area` VALUES ('513338', '得荣县', '513300');
INSERT INTO `yershop_area` VALUES ('513401', '西昌市', '513400');
INSERT INTO `yershop_area` VALUES ('513422', '木里藏族自治县', '513400');
INSERT INTO `yershop_area` VALUES ('513423', '盐源县', '513400');
INSERT INTO `yershop_area` VALUES ('513424', '德昌县', '513400');
INSERT INTO `yershop_area` VALUES ('513425', '会理县', '513400');
INSERT INTO `yershop_area` VALUES ('513426', '会东县', '513400');
INSERT INTO `yershop_area` VALUES ('513427', '宁南县', '513400');
INSERT INTO `yershop_area` VALUES ('513428', '普格县', '513400');
INSERT INTO `yershop_area` VALUES ('513429', '布拖县', '513400');
INSERT INTO `yershop_area` VALUES ('513430', '金阳县', '513400');
INSERT INTO `yershop_area` VALUES ('513431', '昭觉县', '513400');
INSERT INTO `yershop_area` VALUES ('513432', '喜德县', '513400');
INSERT INTO `yershop_area` VALUES ('513433', '冕宁县', '513400');
INSERT INTO `yershop_area` VALUES ('513434', '越西县', '513400');
INSERT INTO `yershop_area` VALUES ('513435', '甘洛县', '513400');
INSERT INTO `yershop_area` VALUES ('513436', '美姑县', '513400');
INSERT INTO `yershop_area` VALUES ('513437', '雷波县', '513400');
INSERT INTO `yershop_area` VALUES ('520101', '市辖区', '520100');
INSERT INTO `yershop_area` VALUES ('520102', '南明区', '520100');
INSERT INTO `yershop_area` VALUES ('520103', '云岩区', '520100');
INSERT INTO `yershop_area` VALUES ('520111', '花溪区', '520100');
INSERT INTO `yershop_area` VALUES ('520112', '乌当区', '520100');
INSERT INTO `yershop_area` VALUES ('520113', '白云区', '520100');
INSERT INTO `yershop_area` VALUES ('520114', '小河区', '520100');
INSERT INTO `yershop_area` VALUES ('520121', '开阳县', '520100');
INSERT INTO `yershop_area` VALUES ('520122', '息烽县', '520100');
INSERT INTO `yershop_area` VALUES ('520123', '修文县', '520100');
INSERT INTO `yershop_area` VALUES ('520181', '清镇市', '520100');
INSERT INTO `yershop_area` VALUES ('520201', '钟山区', '520200');
INSERT INTO `yershop_area` VALUES ('520203', '六枝特区', '520200');
INSERT INTO `yershop_area` VALUES ('520221', '水城县', '520200');
INSERT INTO `yershop_area` VALUES ('520222', '盘　县', '520200');
INSERT INTO `yershop_area` VALUES ('520301', '市辖区', '520300');
INSERT INTO `yershop_area` VALUES ('520302', '红花岗区', '520300');
INSERT INTO `yershop_area` VALUES ('520303', '汇川区', '520300');
INSERT INTO `yershop_area` VALUES ('520321', '遵义县', '520300');
INSERT INTO `yershop_area` VALUES ('520322', '桐梓县', '520300');
INSERT INTO `yershop_area` VALUES ('520323', '绥阳县', '520300');
INSERT INTO `yershop_area` VALUES ('520324', '正安县', '520300');
INSERT INTO `yershop_area` VALUES ('520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `yershop_area` VALUES ('520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `yershop_area` VALUES ('520327', '凤冈县', '520300');
INSERT INTO `yershop_area` VALUES ('520328', '湄潭县', '520300');
INSERT INTO `yershop_area` VALUES ('520329', '余庆县', '520300');
INSERT INTO `yershop_area` VALUES ('520330', '习水县', '520300');
INSERT INTO `yershop_area` VALUES ('520381', '赤水市', '520300');
INSERT INTO `yershop_area` VALUES ('520382', '仁怀市', '520300');
INSERT INTO `yershop_area` VALUES ('520401', '市辖区', '520400');
INSERT INTO `yershop_area` VALUES ('520402', '西秀区', '520400');
INSERT INTO `yershop_area` VALUES ('520421', '平坝县', '520400');
INSERT INTO `yershop_area` VALUES ('520422', '普定县', '520400');
INSERT INTO `yershop_area` VALUES ('520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `yershop_area` VALUES ('520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `yershop_area` VALUES ('520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `yershop_area` VALUES ('522201', '铜仁市', '522200');
INSERT INTO `yershop_area` VALUES ('522222', '江口县', '522200');
INSERT INTO `yershop_area` VALUES ('522223', '玉屏侗族自治县', '522200');
INSERT INTO `yershop_area` VALUES ('522224', '石阡县', '522200');
INSERT INTO `yershop_area` VALUES ('522225', '思南县', '522200');
INSERT INTO `yershop_area` VALUES ('522226', '印江土家族苗族自治县', '522200');
INSERT INTO `yershop_area` VALUES ('522227', '德江县', '522200');
INSERT INTO `yershop_area` VALUES ('522228', '沿河土家族自治县', '522200');
INSERT INTO `yershop_area` VALUES ('522229', '松桃苗族自治县', '522200');
INSERT INTO `yershop_area` VALUES ('522230', '万山特区', '522200');
INSERT INTO `yershop_area` VALUES ('522301', '兴义市', '522300');
INSERT INTO `yershop_area` VALUES ('522322', '兴仁县', '522300');
INSERT INTO `yershop_area` VALUES ('522323', '普安县', '522300');
INSERT INTO `yershop_area` VALUES ('522324', '晴隆县', '522300');
INSERT INTO `yershop_area` VALUES ('522325', '贞丰县', '522300');
INSERT INTO `yershop_area` VALUES ('522326', '望谟县', '522300');
INSERT INTO `yershop_area` VALUES ('522327', '册亨县', '522300');
INSERT INTO `yershop_area` VALUES ('522328', '安龙县', '522300');
INSERT INTO `yershop_area` VALUES ('522401', '毕节市', '522400');
INSERT INTO `yershop_area` VALUES ('522422', '大方县', '522400');
INSERT INTO `yershop_area` VALUES ('522423', '黔西县', '522400');
INSERT INTO `yershop_area` VALUES ('522424', '金沙县', '522400');
INSERT INTO `yershop_area` VALUES ('522425', '织金县', '522400');
INSERT INTO `yershop_area` VALUES ('522426', '纳雍县', '522400');
INSERT INTO `yershop_area` VALUES ('522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `yershop_area` VALUES ('522428', '赫章县', '522400');
INSERT INTO `yershop_area` VALUES ('522601', '凯里市', '522600');
INSERT INTO `yershop_area` VALUES ('522622', '黄平县', '522600');
INSERT INTO `yershop_area` VALUES ('522623', '施秉县', '522600');
INSERT INTO `yershop_area` VALUES ('522624', '三穗县', '522600');
INSERT INTO `yershop_area` VALUES ('522625', '镇远县', '522600');
INSERT INTO `yershop_area` VALUES ('522626', '岑巩县', '522600');
INSERT INTO `yershop_area` VALUES ('522627', '天柱县', '522600');
INSERT INTO `yershop_area` VALUES ('522628', '锦屏县', '522600');
INSERT INTO `yershop_area` VALUES ('522629', '剑河县', '522600');
INSERT INTO `yershop_area` VALUES ('522630', '台江县', '522600');
INSERT INTO `yershop_area` VALUES ('522631', '黎平县', '522600');
INSERT INTO `yershop_area` VALUES ('522632', '榕江县', '522600');
INSERT INTO `yershop_area` VALUES ('522633', '从江县', '522600');
INSERT INTO `yershop_area` VALUES ('522634', '雷山县', '522600');
INSERT INTO `yershop_area` VALUES ('522635', '麻江县', '522600');
INSERT INTO `yershop_area` VALUES ('522636', '丹寨县', '522600');
INSERT INTO `yershop_area` VALUES ('522701', '都匀市', '522700');
INSERT INTO `yershop_area` VALUES ('522702', '福泉市', '522700');
INSERT INTO `yershop_area` VALUES ('522722', '荔波县', '522700');
INSERT INTO `yershop_area` VALUES ('522723', '贵定县', '522700');
INSERT INTO `yershop_area` VALUES ('522725', '瓮安县', '522700');
INSERT INTO `yershop_area` VALUES ('522726', '独山县', '522700');
INSERT INTO `yershop_area` VALUES ('522727', '平塘县', '522700');
INSERT INTO `yershop_area` VALUES ('522728', '罗甸县', '522700');
INSERT INTO `yershop_area` VALUES ('522729', '长顺县', '522700');
INSERT INTO `yershop_area` VALUES ('522730', '龙里县', '522700');
INSERT INTO `yershop_area` VALUES ('522731', '惠水县', '522700');
INSERT INTO `yershop_area` VALUES ('522732', '三都水族自治县', '522700');
INSERT INTO `yershop_area` VALUES ('530101', '市辖区', '530100');
INSERT INTO `yershop_area` VALUES ('530102', '五华区', '530100');
INSERT INTO `yershop_area` VALUES ('530103', '盘龙区', '530100');
INSERT INTO `yershop_area` VALUES ('530111', '官渡区', '530100');
INSERT INTO `yershop_area` VALUES ('530112', '西山区', '530100');
INSERT INTO `yershop_area` VALUES ('530113', '东川区', '530100');
INSERT INTO `yershop_area` VALUES ('530121', '呈贡县', '530100');
INSERT INTO `yershop_area` VALUES ('530122', '晋宁县', '530100');
INSERT INTO `yershop_area` VALUES ('530124', '富民县', '530100');
INSERT INTO `yershop_area` VALUES ('530125', '宜良县', '530100');
INSERT INTO `yershop_area` VALUES ('530126', '石林彝族自治县', '530100');
INSERT INTO `yershop_area` VALUES ('530127', '嵩明县', '530100');
INSERT INTO `yershop_area` VALUES ('530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `yershop_area` VALUES ('530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `yershop_area` VALUES ('530181', '安宁市', '530100');
INSERT INTO `yershop_area` VALUES ('530301', '市辖区', '530300');
INSERT INTO `yershop_area` VALUES ('530302', '麒麟区', '530300');
INSERT INTO `yershop_area` VALUES ('530321', '马龙县', '530300');
INSERT INTO `yershop_area` VALUES ('530322', '陆良县', '530300');
INSERT INTO `yershop_area` VALUES ('530323', '师宗县', '530300');
INSERT INTO `yershop_area` VALUES ('530324', '罗平县', '530300');
INSERT INTO `yershop_area` VALUES ('530325', '富源县', '530300');
INSERT INTO `yershop_area` VALUES ('530326', '会泽县', '530300');
INSERT INTO `yershop_area` VALUES ('530328', '沾益县', '530300');
INSERT INTO `yershop_area` VALUES ('530381', '宣威市', '530300');
INSERT INTO `yershop_area` VALUES ('530401', '市辖区', '530400');
INSERT INTO `yershop_area` VALUES ('530402', '红塔区', '530400');
INSERT INTO `yershop_area` VALUES ('530421', '江川县', '530400');
INSERT INTO `yershop_area` VALUES ('530422', '澄江县', '530400');
INSERT INTO `yershop_area` VALUES ('530423', '通海县', '530400');
INSERT INTO `yershop_area` VALUES ('530424', '华宁县', '530400');
INSERT INTO `yershop_area` VALUES ('530425', '易门县', '530400');
INSERT INTO `yershop_area` VALUES ('530426', '峨山彝族自治县', '530400');
INSERT INTO `yershop_area` VALUES ('530427', '新平彝族傣族自治县', '530400');
INSERT INTO `yershop_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `yershop_area` VALUES ('530501', '市辖区', '530500');
INSERT INTO `yershop_area` VALUES ('530502', '隆阳区', '530500');
INSERT INTO `yershop_area` VALUES ('530521', '施甸县', '530500');
INSERT INTO `yershop_area` VALUES ('530522', '腾冲县', '530500');
INSERT INTO `yershop_area` VALUES ('530523', '龙陵县', '530500');
INSERT INTO `yershop_area` VALUES ('530524', '昌宁县', '530500');
INSERT INTO `yershop_area` VALUES ('530601', '市辖区', '530600');
INSERT INTO `yershop_area` VALUES ('530602', '昭阳区', '530600');
INSERT INTO `yershop_area` VALUES ('530621', '鲁甸县', '530600');
INSERT INTO `yershop_area` VALUES ('530622', '巧家县', '530600');
INSERT INTO `yershop_area` VALUES ('530623', '盐津县', '530600');
INSERT INTO `yershop_area` VALUES ('530624', '大关县', '530600');
INSERT INTO `yershop_area` VALUES ('530625', '永善县', '530600');
INSERT INTO `yershop_area` VALUES ('530626', '绥江县', '530600');
INSERT INTO `yershop_area` VALUES ('530627', '镇雄县', '530600');
INSERT INTO `yershop_area` VALUES ('530628', '彝良县', '530600');
INSERT INTO `yershop_area` VALUES ('530629', '威信县', '530600');
INSERT INTO `yershop_area` VALUES ('530630', '水富县', '530600');
INSERT INTO `yershop_area` VALUES ('530701', '市辖区', '530700');
INSERT INTO `yershop_area` VALUES ('530702', '古城区', '530700');
INSERT INTO `yershop_area` VALUES ('530721', '玉龙纳西族自治县', '530700');
INSERT INTO `yershop_area` VALUES ('530722', '永胜县', '530700');
INSERT INTO `yershop_area` VALUES ('530723', '华坪县', '530700');
INSERT INTO `yershop_area` VALUES ('530724', '宁蒗彝族自治县', '530700');
INSERT INTO `yershop_area` VALUES ('530801', '市辖区', '530800');
INSERT INTO `yershop_area` VALUES ('530802', '翠云区', '530800');
INSERT INTO `yershop_area` VALUES ('530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530822', '墨江哈尼族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530823', '景东彝族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530829', '西盟佤族自治县', '530800');
INSERT INTO `yershop_area` VALUES ('530901', '市辖区', '530900');
INSERT INTO `yershop_area` VALUES ('530902', '临翔区', '530900');
INSERT INTO `yershop_area` VALUES ('530921', '凤庆县', '530900');
INSERT INTO `yershop_area` VALUES ('530922', '云　县', '530900');
INSERT INTO `yershop_area` VALUES ('530923', '永德县', '530900');
INSERT INTO `yershop_area` VALUES ('530924', '镇康县', '530900');
INSERT INTO `yershop_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `yershop_area` VALUES ('530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `yershop_area` VALUES ('530927', '沧源佤族自治县', '530900');
INSERT INTO `yershop_area` VALUES ('532301', '楚雄市', '532300');
INSERT INTO `yershop_area` VALUES ('532322', '双柏县', '532300');
INSERT INTO `yershop_area` VALUES ('532323', '牟定县', '532300');
INSERT INTO `yershop_area` VALUES ('532324', '南华县', '532300');
INSERT INTO `yershop_area` VALUES ('532325', '姚安县', '532300');
INSERT INTO `yershop_area` VALUES ('532326', '大姚县', '532300');
INSERT INTO `yershop_area` VALUES ('532327', '永仁县', '532300');
INSERT INTO `yershop_area` VALUES ('532328', '元谋县', '532300');
INSERT INTO `yershop_area` VALUES ('532329', '武定县', '532300');
INSERT INTO `yershop_area` VALUES ('532331', '禄丰县', '532300');
INSERT INTO `yershop_area` VALUES ('532501', '个旧市', '532500');
INSERT INTO `yershop_area` VALUES ('532502', '开远市', '532500');
INSERT INTO `yershop_area` VALUES ('532522', '蒙自县', '532500');
INSERT INTO `yershop_area` VALUES ('532523', '屏边苗族自治县', '532500');
INSERT INTO `yershop_area` VALUES ('532524', '建水县', '532500');
INSERT INTO `yershop_area` VALUES ('532525', '石屏县', '532500');
INSERT INTO `yershop_area` VALUES ('532526', '弥勒县', '532500');
INSERT INTO `yershop_area` VALUES ('532527', '泸西县', '532500');
INSERT INTO `yershop_area` VALUES ('532528', '元阳县', '532500');
INSERT INTO `yershop_area` VALUES ('532529', '红河县', '532500');
INSERT INTO `yershop_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `yershop_area` VALUES ('532531', '绿春县', '532500');
INSERT INTO `yershop_area` VALUES ('532532', '河口瑶族自治县', '532500');
INSERT INTO `yershop_area` VALUES ('532621', '文山县', '532600');
INSERT INTO `yershop_area` VALUES ('532622', '砚山县', '532600');
INSERT INTO `yershop_area` VALUES ('532623', '西畴县', '532600');
INSERT INTO `yershop_area` VALUES ('532624', '麻栗坡县', '532600');
INSERT INTO `yershop_area` VALUES ('532625', '马关县', '532600');
INSERT INTO `yershop_area` VALUES ('532626', '丘北县', '532600');
INSERT INTO `yershop_area` VALUES ('532627', '广南县', '532600');
INSERT INTO `yershop_area` VALUES ('532628', '富宁县', '532600');
INSERT INTO `yershop_area` VALUES ('532801', '景洪市', '532800');
INSERT INTO `yershop_area` VALUES ('532822', '勐海县', '532800');
INSERT INTO `yershop_area` VALUES ('532823', '勐腊县', '532800');
INSERT INTO `yershop_area` VALUES ('532901', '大理市', '532900');
INSERT INTO `yershop_area` VALUES ('532922', '漾濞彝族自治县', '532900');
INSERT INTO `yershop_area` VALUES ('532923', '祥云县', '532900');
INSERT INTO `yershop_area` VALUES ('532924', '宾川县', '532900');
INSERT INTO `yershop_area` VALUES ('532925', '弥渡县', '532900');
INSERT INTO `yershop_area` VALUES ('532926', '南涧彝族自治县', '532900');
INSERT INTO `yershop_area` VALUES ('532927', '巍山彝族回族自治县', '532900');
INSERT INTO `yershop_area` VALUES ('532928', '永平县', '532900');
INSERT INTO `yershop_area` VALUES ('532929', '云龙县', '532900');
INSERT INTO `yershop_area` VALUES ('532930', '洱源县', '532900');
INSERT INTO `yershop_area` VALUES ('532931', '剑川县', '532900');
INSERT INTO `yershop_area` VALUES ('532932', '鹤庆县', '532900');
INSERT INTO `yershop_area` VALUES ('533102', '瑞丽市', '533100');
INSERT INTO `yershop_area` VALUES ('533103', '潞西市', '533100');
INSERT INTO `yershop_area` VALUES ('533122', '梁河县', '533100');
INSERT INTO `yershop_area` VALUES ('533123', '盈江县', '533100');
INSERT INTO `yershop_area` VALUES ('533124', '陇川县', '533100');
INSERT INTO `yershop_area` VALUES ('533321', '泸水县', '533300');
INSERT INTO `yershop_area` VALUES ('533323', '福贡县', '533300');
INSERT INTO `yershop_area` VALUES ('533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `yershop_area` VALUES ('533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `yershop_area` VALUES ('533421', '香格里拉县', '533400');
INSERT INTO `yershop_area` VALUES ('533422', '德钦县', '533400');
INSERT INTO `yershop_area` VALUES ('533423', '维西傈僳族自治县', '533400');
INSERT INTO `yershop_area` VALUES ('540101', '市辖区', '540100');
INSERT INTO `yershop_area` VALUES ('540102', '城关区', '540100');
INSERT INTO `yershop_area` VALUES ('540121', '林周县', '540100');
INSERT INTO `yershop_area` VALUES ('540122', '当雄县', '540100');
INSERT INTO `yershop_area` VALUES ('540123', '尼木县', '540100');
INSERT INTO `yershop_area` VALUES ('540124', '曲水县', '540100');
INSERT INTO `yershop_area` VALUES ('540125', '堆龙德庆县', '540100');
INSERT INTO `yershop_area` VALUES ('540126', '达孜县', '540100');
INSERT INTO `yershop_area` VALUES ('540127', '墨竹工卡县', '540100');
INSERT INTO `yershop_area` VALUES ('542121', '昌都县', '542100');
INSERT INTO `yershop_area` VALUES ('542122', '江达县', '542100');
INSERT INTO `yershop_area` VALUES ('542123', '贡觉县', '542100');
INSERT INTO `yershop_area` VALUES ('542124', '类乌齐县', '542100');
INSERT INTO `yershop_area` VALUES ('542125', '丁青县', '542100');
INSERT INTO `yershop_area` VALUES ('542126', '察雅县', '542100');
INSERT INTO `yershop_area` VALUES ('542127', '八宿县', '542100');
INSERT INTO `yershop_area` VALUES ('542128', '左贡县', '542100');
INSERT INTO `yershop_area` VALUES ('542129', '芒康县', '542100');
INSERT INTO `yershop_area` VALUES ('542132', '洛隆县', '542100');
INSERT INTO `yershop_area` VALUES ('542133', '边坝县', '542100');
INSERT INTO `yershop_area` VALUES ('542221', '乃东县', '542200');
INSERT INTO `yershop_area` VALUES ('542222', '扎囊县', '542200');
INSERT INTO `yershop_area` VALUES ('542223', '贡嘎县', '542200');
INSERT INTO `yershop_area` VALUES ('542224', '桑日县', '542200');
INSERT INTO `yershop_area` VALUES ('542225', '琼结县', '542200');
INSERT INTO `yershop_area` VALUES ('542226', '曲松县', '542200');
INSERT INTO `yershop_area` VALUES ('542227', '措美县', '542200');
INSERT INTO `yershop_area` VALUES ('542228', '洛扎县', '542200');
INSERT INTO `yershop_area` VALUES ('542229', '加查县', '542200');
INSERT INTO `yershop_area` VALUES ('542231', '隆子县', '542200');
INSERT INTO `yershop_area` VALUES ('542232', '错那县', '542200');
INSERT INTO `yershop_area` VALUES ('542233', '浪卡子县', '542200');
INSERT INTO `yershop_area` VALUES ('542301', '日喀则市', '542300');
INSERT INTO `yershop_area` VALUES ('542322', '南木林县', '542300');
INSERT INTO `yershop_area` VALUES ('542323', '江孜县', '542300');
INSERT INTO `yershop_area` VALUES ('542324', '定日县', '542300');
INSERT INTO `yershop_area` VALUES ('542325', '萨迦县', '542300');
INSERT INTO `yershop_area` VALUES ('542326', '拉孜县', '542300');
INSERT INTO `yershop_area` VALUES ('542327', '昂仁县', '542300');
INSERT INTO `yershop_area` VALUES ('542328', '谢通门县', '542300');
INSERT INTO `yershop_area` VALUES ('542329', '白朗县', '542300');
INSERT INTO `yershop_area` VALUES ('542330', '仁布县', '542300');
INSERT INTO `yershop_area` VALUES ('542331', '康马县', '542300');
INSERT INTO `yershop_area` VALUES ('542332', '定结县', '542300');
INSERT INTO `yershop_area` VALUES ('542333', '仲巴县', '542300');
INSERT INTO `yershop_area` VALUES ('542334', '亚东县', '542300');
INSERT INTO `yershop_area` VALUES ('542335', '吉隆县', '542300');
INSERT INTO `yershop_area` VALUES ('542336', '聂拉木县', '542300');
INSERT INTO `yershop_area` VALUES ('542337', '萨嘎县', '542300');
INSERT INTO `yershop_area` VALUES ('542338', '岗巴县', '542300');
INSERT INTO `yershop_area` VALUES ('542421', '那曲县', '542400');
INSERT INTO `yershop_area` VALUES ('542422', '嘉黎县', '542400');
INSERT INTO `yershop_area` VALUES ('542423', '比如县', '542400');
INSERT INTO `yershop_area` VALUES ('542424', '聂荣县', '542400');
INSERT INTO `yershop_area` VALUES ('542425', '安多县', '542400');
INSERT INTO `yershop_area` VALUES ('542426', '申扎县', '542400');
INSERT INTO `yershop_area` VALUES ('542427', '索　县', '542400');
INSERT INTO `yershop_area` VALUES ('542428', '班戈县', '542400');
INSERT INTO `yershop_area` VALUES ('542429', '巴青县', '542400');
INSERT INTO `yershop_area` VALUES ('542430', '尼玛县', '542400');
INSERT INTO `yershop_area` VALUES ('542521', '普兰县', '542500');
INSERT INTO `yershop_area` VALUES ('542522', '札达县', '542500');
INSERT INTO `yershop_area` VALUES ('542523', '噶尔县', '542500');
INSERT INTO `yershop_area` VALUES ('542524', '日土县', '542500');
INSERT INTO `yershop_area` VALUES ('542525', '革吉县', '542500');
INSERT INTO `yershop_area` VALUES ('542526', '改则县', '542500');
INSERT INTO `yershop_area` VALUES ('542527', '措勤县', '542500');
INSERT INTO `yershop_area` VALUES ('542621', '林芝县', '542600');
INSERT INTO `yershop_area` VALUES ('542622', '工布江达县', '542600');
INSERT INTO `yershop_area` VALUES ('542623', '米林县', '542600');
INSERT INTO `yershop_area` VALUES ('542624', '墨脱县', '542600');
INSERT INTO `yershop_area` VALUES ('542625', '波密县', '542600');
INSERT INTO `yershop_area` VALUES ('542626', '察隅县', '542600');
INSERT INTO `yershop_area` VALUES ('542627', '朗　县', '542600');
INSERT INTO `yershop_area` VALUES ('610101', '市辖区', '610100');
INSERT INTO `yershop_area` VALUES ('610102', '新城区', '610100');
INSERT INTO `yershop_area` VALUES ('610103', '碑林区', '610100');
INSERT INTO `yershop_area` VALUES ('610104', '莲湖区', '610100');
INSERT INTO `yershop_area` VALUES ('610111', '灞桥区', '610100');
INSERT INTO `yershop_area` VALUES ('610112', '未央区', '610100');
INSERT INTO `yershop_area` VALUES ('610113', '雁塔区', '610100');
INSERT INTO `yershop_area` VALUES ('610114', '阎良区', '610100');
INSERT INTO `yershop_area` VALUES ('610115', '临潼区', '610100');
INSERT INTO `yershop_area` VALUES ('610116', '长安区', '610100');
INSERT INTO `yershop_area` VALUES ('610122', '蓝田县', '610100');
INSERT INTO `yershop_area` VALUES ('610124', '周至县', '610100');
INSERT INTO `yershop_area` VALUES ('610125', '户　县', '610100');
INSERT INTO `yershop_area` VALUES ('610126', '高陵县', '610100');
INSERT INTO `yershop_area` VALUES ('610201', '市辖区', '610200');
INSERT INTO `yershop_area` VALUES ('610202', '王益区', '610200');
INSERT INTO `yershop_area` VALUES ('610203', '印台区', '610200');
INSERT INTO `yershop_area` VALUES ('610204', '耀州区', '610200');
INSERT INTO `yershop_area` VALUES ('610222', '宜君县', '610200');
INSERT INTO `yershop_area` VALUES ('610301', '市辖区', '610300');
INSERT INTO `yershop_area` VALUES ('610302', '渭滨区', '610300');
INSERT INTO `yershop_area` VALUES ('610303', '金台区', '610300');
INSERT INTO `yershop_area` VALUES ('610304', '陈仓区', '610300');
INSERT INTO `yershop_area` VALUES ('610322', '凤翔县', '610300');
INSERT INTO `yershop_area` VALUES ('610323', '岐山县', '610300');
INSERT INTO `yershop_area` VALUES ('610324', '扶风县', '610300');
INSERT INTO `yershop_area` VALUES ('610326', '眉　县', '610300');
INSERT INTO `yershop_area` VALUES ('610327', '陇　县', '610300');
INSERT INTO `yershop_area` VALUES ('610328', '千阳县', '610300');
INSERT INTO `yershop_area` VALUES ('610329', '麟游县', '610300');
INSERT INTO `yershop_area` VALUES ('610330', '凤　县', '610300');
INSERT INTO `yershop_area` VALUES ('610331', '太白县', '610300');
INSERT INTO `yershop_area` VALUES ('610401', '市辖区', '610400');
INSERT INTO `yershop_area` VALUES ('610402', '秦都区', '610400');
INSERT INTO `yershop_area` VALUES ('610403', '杨凌区', '610400');
INSERT INTO `yershop_area` VALUES ('610404', '渭城区', '610400');
INSERT INTO `yershop_area` VALUES ('610422', '三原县', '610400');
INSERT INTO `yershop_area` VALUES ('610423', '泾阳县', '610400');
INSERT INTO `yershop_area` VALUES ('610424', '乾　县', '610400');
INSERT INTO `yershop_area` VALUES ('610425', '礼泉县', '610400');
INSERT INTO `yershop_area` VALUES ('610426', '永寿县', '610400');
INSERT INTO `yershop_area` VALUES ('610427', '彬　县', '610400');
INSERT INTO `yershop_area` VALUES ('610428', '长武县', '610400');
INSERT INTO `yershop_area` VALUES ('610429', '旬邑县', '610400');
INSERT INTO `yershop_area` VALUES ('610430', '淳化县', '610400');
INSERT INTO `yershop_area` VALUES ('610431', '武功县', '610400');
INSERT INTO `yershop_area` VALUES ('610481', '兴平市', '610400');
INSERT INTO `yershop_area` VALUES ('610501', '市辖区', '610500');
INSERT INTO `yershop_area` VALUES ('610502', '临渭区', '610500');
INSERT INTO `yershop_area` VALUES ('610521', '华　县', '610500');
INSERT INTO `yershop_area` VALUES ('610522', '潼关县', '610500');
INSERT INTO `yershop_area` VALUES ('610523', '大荔县', '610500');
INSERT INTO `yershop_area` VALUES ('610524', '合阳县', '610500');
INSERT INTO `yershop_area` VALUES ('610525', '澄城县', '610500');
INSERT INTO `yershop_area` VALUES ('610526', '蒲城县', '610500');
INSERT INTO `yershop_area` VALUES ('610527', '白水县', '610500');
INSERT INTO `yershop_area` VALUES ('610528', '富平县', '610500');
INSERT INTO `yershop_area` VALUES ('610581', '韩城市', '610500');
INSERT INTO `yershop_area` VALUES ('610582', '华阴市', '610500');
INSERT INTO `yershop_area` VALUES ('610601', '市辖区', '610600');
INSERT INTO `yershop_area` VALUES ('610602', '宝塔区', '610600');
INSERT INTO `yershop_area` VALUES ('610621', '延长县', '610600');
INSERT INTO `yershop_area` VALUES ('610622', '延川县', '610600');
INSERT INTO `yershop_area` VALUES ('610623', '子长县', '610600');
INSERT INTO `yershop_area` VALUES ('610624', '安塞县', '610600');
INSERT INTO `yershop_area` VALUES ('610625', '志丹县', '610600');
INSERT INTO `yershop_area` VALUES ('610626', '吴旗县', '610600');
INSERT INTO `yershop_area` VALUES ('610627', '甘泉县', '610600');
INSERT INTO `yershop_area` VALUES ('610628', '富　县', '610600');
INSERT INTO `yershop_area` VALUES ('610629', '洛川县', '610600');
INSERT INTO `yershop_area` VALUES ('610630', '宜川县', '610600');
INSERT INTO `yershop_area` VALUES ('610631', '黄龙县', '610600');
INSERT INTO `yershop_area` VALUES ('610632', '黄陵县', '610600');
INSERT INTO `yershop_area` VALUES ('610701', '市辖区', '610700');
INSERT INTO `yershop_area` VALUES ('610702', '汉台区', '610700');
INSERT INTO `yershop_area` VALUES ('610721', '南郑县', '610700');
INSERT INTO `yershop_area` VALUES ('610722', '城固县', '610700');
INSERT INTO `yershop_area` VALUES ('610723', '洋　县', '610700');
INSERT INTO `yershop_area` VALUES ('610724', '西乡县', '610700');
INSERT INTO `yershop_area` VALUES ('610725', '勉　县', '610700');
INSERT INTO `yershop_area` VALUES ('610726', '宁强县', '610700');
INSERT INTO `yershop_area` VALUES ('610727', '略阳县', '610700');
INSERT INTO `yershop_area` VALUES ('610728', '镇巴县', '610700');
INSERT INTO `yershop_area` VALUES ('610729', '留坝县', '610700');
INSERT INTO `yershop_area` VALUES ('610730', '佛坪县', '610700');
INSERT INTO `yershop_area` VALUES ('610801', '市辖区', '610800');
INSERT INTO `yershop_area` VALUES ('610802', '榆阳区', '610800');
INSERT INTO `yershop_area` VALUES ('610821', '神木县', '610800');
INSERT INTO `yershop_area` VALUES ('610822', '府谷县', '610800');
INSERT INTO `yershop_area` VALUES ('610823', '横山县', '610800');
INSERT INTO `yershop_area` VALUES ('610824', '靖边县', '610800');
INSERT INTO `yershop_area` VALUES ('610825', '定边县', '610800');
INSERT INTO `yershop_area` VALUES ('610826', '绥德县', '610800');
INSERT INTO `yershop_area` VALUES ('610827', '米脂县', '610800');
INSERT INTO `yershop_area` VALUES ('610828', '佳　县', '610800');
INSERT INTO `yershop_area` VALUES ('610829', '吴堡县', '610800');
INSERT INTO `yershop_area` VALUES ('610830', '清涧县', '610800');
INSERT INTO `yershop_area` VALUES ('610831', '子洲县', '610800');
INSERT INTO `yershop_area` VALUES ('610901', '市辖区', '610900');
INSERT INTO `yershop_area` VALUES ('610902', '汉滨区', '610900');
INSERT INTO `yershop_area` VALUES ('610921', '汉阴县', '610900');
INSERT INTO `yershop_area` VALUES ('610922', '石泉县', '610900');
INSERT INTO `yershop_area` VALUES ('610923', '宁陕县', '610900');
INSERT INTO `yershop_area` VALUES ('610924', '紫阳县', '610900');
INSERT INTO `yershop_area` VALUES ('610925', '岚皋县', '610900');
INSERT INTO `yershop_area` VALUES ('610926', '平利县', '610900');
INSERT INTO `yershop_area` VALUES ('610927', '镇坪县', '610900');
INSERT INTO `yershop_area` VALUES ('610928', '旬阳县', '610900');
INSERT INTO `yershop_area` VALUES ('610929', '白河县', '610900');
INSERT INTO `yershop_area` VALUES ('611001', '市辖区', '611000');
INSERT INTO `yershop_area` VALUES ('611002', '商州区', '611000');
INSERT INTO `yershop_area` VALUES ('611021', '洛南县', '611000');
INSERT INTO `yershop_area` VALUES ('611022', '丹凤县', '611000');
INSERT INTO `yershop_area` VALUES ('611023', '商南县', '611000');
INSERT INTO `yershop_area` VALUES ('611024', '山阳县', '611000');
INSERT INTO `yershop_area` VALUES ('611025', '镇安县', '611000');
INSERT INTO `yershop_area` VALUES ('611026', '柞水县', '611000');
INSERT INTO `yershop_area` VALUES ('620101', '市辖区', '620100');
INSERT INTO `yershop_area` VALUES ('620102', '城关区', '620100');
INSERT INTO `yershop_area` VALUES ('620103', '七里河区', '620100');
INSERT INTO `yershop_area` VALUES ('620104', '西固区', '620100');
INSERT INTO `yershop_area` VALUES ('620105', '安宁区', '620100');
INSERT INTO `yershop_area` VALUES ('620111', '红古区', '620100');
INSERT INTO `yershop_area` VALUES ('620121', '永登县', '620100');
INSERT INTO `yershop_area` VALUES ('620122', '皋兰县', '620100');
INSERT INTO `yershop_area` VALUES ('620123', '榆中县', '620100');
INSERT INTO `yershop_area` VALUES ('620201', '市辖区', '620200');
INSERT INTO `yershop_area` VALUES ('620301', '市辖区', '620300');
INSERT INTO `yershop_area` VALUES ('620302', '金川区', '620300');
INSERT INTO `yershop_area` VALUES ('620321', '永昌县', '620300');
INSERT INTO `yershop_area` VALUES ('620401', '市辖区', '620400');
INSERT INTO `yershop_area` VALUES ('620402', '白银区', '620400');
INSERT INTO `yershop_area` VALUES ('620403', '平川区', '620400');
INSERT INTO `yershop_area` VALUES ('620421', '靖远县', '620400');
INSERT INTO `yershop_area` VALUES ('620422', '会宁县', '620400');
INSERT INTO `yershop_area` VALUES ('620423', '景泰县', '620400');
INSERT INTO `yershop_area` VALUES ('620501', '市辖区', '620500');
INSERT INTO `yershop_area` VALUES ('620502', '秦城区', '620500');
INSERT INTO `yershop_area` VALUES ('620503', '北道区', '620500');
INSERT INTO `yershop_area` VALUES ('620521', '清水县', '620500');
INSERT INTO `yershop_area` VALUES ('620522', '秦安县', '620500');
INSERT INTO `yershop_area` VALUES ('620523', '甘谷县', '620500');
INSERT INTO `yershop_area` VALUES ('620524', '武山县', '620500');
INSERT INTO `yershop_area` VALUES ('620525', '张家川回族自治县', '620500');
INSERT INTO `yershop_area` VALUES ('620601', '市辖区', '620600');
INSERT INTO `yershop_area` VALUES ('620602', '凉州区', '620600');
INSERT INTO `yershop_area` VALUES ('620621', '民勤县', '620600');
INSERT INTO `yershop_area` VALUES ('620622', '古浪县', '620600');
INSERT INTO `yershop_area` VALUES ('620623', '天祝藏族自治县', '620600');
INSERT INTO `yershop_area` VALUES ('620701', '市辖区', '620700');
INSERT INTO `yershop_area` VALUES ('620702', '甘州区', '620700');
INSERT INTO `yershop_area` VALUES ('620721', '肃南裕固族自治县', '620700');
INSERT INTO `yershop_area` VALUES ('620722', '民乐县', '620700');
INSERT INTO `yershop_area` VALUES ('620723', '临泽县', '620700');
INSERT INTO `yershop_area` VALUES ('620724', '高台县', '620700');
INSERT INTO `yershop_area` VALUES ('620725', '山丹县', '620700');
INSERT INTO `yershop_area` VALUES ('620801', '市辖区', '620800');
INSERT INTO `yershop_area` VALUES ('620802', '崆峒区', '620800');
INSERT INTO `yershop_area` VALUES ('620821', '泾川县', '620800');
INSERT INTO `yershop_area` VALUES ('620822', '灵台县', '620800');
INSERT INTO `yershop_area` VALUES ('620823', '崇信县', '620800');
INSERT INTO `yershop_area` VALUES ('620824', '华亭县', '620800');
INSERT INTO `yershop_area` VALUES ('620825', '庄浪县', '620800');
INSERT INTO `yershop_area` VALUES ('620826', '静宁县', '620800');
INSERT INTO `yershop_area` VALUES ('620901', '市辖区', '620900');
INSERT INTO `yershop_area` VALUES ('620902', '肃州区', '620900');
INSERT INTO `yershop_area` VALUES ('620921', '金塔县', '620900');
INSERT INTO `yershop_area` VALUES ('620922', '安西县', '620900');
INSERT INTO `yershop_area` VALUES ('620923', '肃北蒙古族自治县', '620900');
INSERT INTO `yershop_area` VALUES ('620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `yershop_area` VALUES ('620981', '玉门市', '620900');
INSERT INTO `yershop_area` VALUES ('620982', '敦煌市', '620900');
INSERT INTO `yershop_area` VALUES ('621001', '市辖区', '621000');
INSERT INTO `yershop_area` VALUES ('621002', '西峰区', '621000');
INSERT INTO `yershop_area` VALUES ('621021', '庆城县', '621000');
INSERT INTO `yershop_area` VALUES ('621022', '环　县', '621000');
INSERT INTO `yershop_area` VALUES ('621023', '华池县', '621000');
INSERT INTO `yershop_area` VALUES ('621024', '合水县', '621000');
INSERT INTO `yershop_area` VALUES ('621025', '正宁县', '621000');
INSERT INTO `yershop_area` VALUES ('621026', '宁　县', '621000');
INSERT INTO `yershop_area` VALUES ('621027', '镇原县', '621000');
INSERT INTO `yershop_area` VALUES ('621101', '市辖区', '621100');
INSERT INTO `yershop_area` VALUES ('621102', '安定区', '621100');
INSERT INTO `yershop_area` VALUES ('621121', '通渭县', '621100');
INSERT INTO `yershop_area` VALUES ('621122', '陇西县', '621100');
INSERT INTO `yershop_area` VALUES ('621123', '渭源县', '621100');
INSERT INTO `yershop_area` VALUES ('621124', '临洮县', '621100');
INSERT INTO `yershop_area` VALUES ('621125', '漳　县', '621100');
INSERT INTO `yershop_area` VALUES ('621126', '岷　县', '621100');
INSERT INTO `yershop_area` VALUES ('621201', '市辖区', '621200');
INSERT INTO `yershop_area` VALUES ('621202', '武都区', '621200');
INSERT INTO `yershop_area` VALUES ('621221', '成　县', '621200');
INSERT INTO `yershop_area` VALUES ('621222', '文　县', '621200');
INSERT INTO `yershop_area` VALUES ('621223', '宕昌县', '621200');
INSERT INTO `yershop_area` VALUES ('621224', '康　县', '621200');
INSERT INTO `yershop_area` VALUES ('621225', '西和县', '621200');
INSERT INTO `yershop_area` VALUES ('621226', '礼　县', '621200');
INSERT INTO `yershop_area` VALUES ('621227', '徽　县', '621200');
INSERT INTO `yershop_area` VALUES ('621228', '两当县', '621200');
INSERT INTO `yershop_area` VALUES ('622901', '临夏市', '622900');
INSERT INTO `yershop_area` VALUES ('622921', '临夏县', '622900');
INSERT INTO `yershop_area` VALUES ('622922', '康乐县', '622900');
INSERT INTO `yershop_area` VALUES ('622923', '永靖县', '622900');
INSERT INTO `yershop_area` VALUES ('622924', '广河县', '622900');
INSERT INTO `yershop_area` VALUES ('622925', '和政县', '622900');
INSERT INTO `yershop_area` VALUES ('622926', '东乡族自治县', '622900');
INSERT INTO `yershop_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `yershop_area` VALUES ('623001', '合作市', '623000');
INSERT INTO `yershop_area` VALUES ('623021', '临潭县', '623000');
INSERT INTO `yershop_area` VALUES ('623022', '卓尼县', '623000');
INSERT INTO `yershop_area` VALUES ('623023', '舟曲县', '623000');
INSERT INTO `yershop_area` VALUES ('623024', '迭部县', '623000');
INSERT INTO `yershop_area` VALUES ('623025', '玛曲县', '623000');
INSERT INTO `yershop_area` VALUES ('623026', '碌曲县', '623000');
INSERT INTO `yershop_area` VALUES ('623027', '夏河县', '623000');
INSERT INTO `yershop_area` VALUES ('630101', '市辖区', '630100');
INSERT INTO `yershop_area` VALUES ('630102', '城东区', '630100');
INSERT INTO `yershop_area` VALUES ('630103', '城中区', '630100');
INSERT INTO `yershop_area` VALUES ('630104', '城西区', '630100');
INSERT INTO `yershop_area` VALUES ('630105', '城北区', '630100');
INSERT INTO `yershop_area` VALUES ('630121', '大通回族土族自治县', '630100');
INSERT INTO `yershop_area` VALUES ('630122', '湟中县', '630100');
INSERT INTO `yershop_area` VALUES ('630123', '湟源县', '630100');
INSERT INTO `yershop_area` VALUES ('632121', '平安县', '632100');
INSERT INTO `yershop_area` VALUES ('632122', '民和回族土族自治县', '632100');
INSERT INTO `yershop_area` VALUES ('632123', '乐都县', '632100');
INSERT INTO `yershop_area` VALUES ('632126', '互助土族自治县', '632100');
INSERT INTO `yershop_area` VALUES ('632127', '化隆回族自治县', '632100');
INSERT INTO `yershop_area` VALUES ('632128', '循化撒拉族自治县', '632100');
INSERT INTO `yershop_area` VALUES ('632221', '门源回族自治县', '632200');
INSERT INTO `yershop_area` VALUES ('632222', '祁连县', '632200');
INSERT INTO `yershop_area` VALUES ('632223', '海晏县', '632200');
INSERT INTO `yershop_area` VALUES ('632224', '刚察县', '632200');
INSERT INTO `yershop_area` VALUES ('632321', '同仁县', '632300');
INSERT INTO `yershop_area` VALUES ('632322', '尖扎县', '632300');
INSERT INTO `yershop_area` VALUES ('632323', '泽库县', '632300');
INSERT INTO `yershop_area` VALUES ('632324', '河南蒙古族自治县', '632300');
INSERT INTO `yershop_area` VALUES ('632521', '共和县', '632500');
INSERT INTO `yershop_area` VALUES ('632522', '同德县', '632500');
INSERT INTO `yershop_area` VALUES ('632523', '贵德县', '632500');
INSERT INTO `yershop_area` VALUES ('632524', '兴海县', '632500');
INSERT INTO `yershop_area` VALUES ('632525', '贵南县', '632500');
INSERT INTO `yershop_area` VALUES ('632621', '玛沁县', '632600');
INSERT INTO `yershop_area` VALUES ('632622', '班玛县', '632600');
INSERT INTO `yershop_area` VALUES ('632623', '甘德县', '632600');
INSERT INTO `yershop_area` VALUES ('632624', '达日县', '632600');
INSERT INTO `yershop_area` VALUES ('632625', '久治县', '632600');
INSERT INTO `yershop_area` VALUES ('632626', '玛多县', '632600');
INSERT INTO `yershop_area` VALUES ('632721', '玉树县', '632700');
INSERT INTO `yershop_area` VALUES ('632722', '杂多县', '632700');
INSERT INTO `yershop_area` VALUES ('632723', '称多县', '632700');
INSERT INTO `yershop_area` VALUES ('632724', '治多县', '632700');
INSERT INTO `yershop_area` VALUES ('632725', '囊谦县', '632700');
INSERT INTO `yershop_area` VALUES ('632726', '曲麻莱县', '632700');
INSERT INTO `yershop_area` VALUES ('632801', '格尔木市', '632800');
INSERT INTO `yershop_area` VALUES ('632802', '德令哈市', '632800');
INSERT INTO `yershop_area` VALUES ('632821', '乌兰县', '632800');
INSERT INTO `yershop_area` VALUES ('632822', '都兰县', '632800');
INSERT INTO `yershop_area` VALUES ('632823', '天峻县', '632800');
INSERT INTO `yershop_area` VALUES ('640101', '市辖区', '640100');
INSERT INTO `yershop_area` VALUES ('640104', '兴庆区', '640100');
INSERT INTO `yershop_area` VALUES ('640105', '西夏区', '640100');
INSERT INTO `yershop_area` VALUES ('640106', '金凤区', '640100');
INSERT INTO `yershop_area` VALUES ('640121', '永宁县', '640100');
INSERT INTO `yershop_area` VALUES ('640122', '贺兰县', '640100');
INSERT INTO `yershop_area` VALUES ('640181', '灵武市', '640100');
INSERT INTO `yershop_area` VALUES ('640201', '市辖区', '640200');
INSERT INTO `yershop_area` VALUES ('640202', '大武口区', '640200');
INSERT INTO `yershop_area` VALUES ('640205', '惠农区', '640200');
INSERT INTO `yershop_area` VALUES ('640221', '平罗县', '640200');
INSERT INTO `yershop_area` VALUES ('640301', '市辖区', '640300');
INSERT INTO `yershop_area` VALUES ('640302', '利通区', '640300');
INSERT INTO `yershop_area` VALUES ('640323', '盐池县', '640300');
INSERT INTO `yershop_area` VALUES ('640324', '同心县', '640300');
INSERT INTO `yershop_area` VALUES ('640381', '青铜峡市', '640300');
INSERT INTO `yershop_area` VALUES ('640401', '市辖区', '640400');
INSERT INTO `yershop_area` VALUES ('640402', '原州区', '640400');
INSERT INTO `yershop_area` VALUES ('640422', '西吉县', '640400');
INSERT INTO `yershop_area` VALUES ('640423', '隆德县', '640400');
INSERT INTO `yershop_area` VALUES ('640424', '泾源县', '640400');
INSERT INTO `yershop_area` VALUES ('640425', '彭阳县', '640400');
INSERT INTO `yershop_area` VALUES ('640501', '市辖区', '640500');
INSERT INTO `yershop_area` VALUES ('640502', '沙坡头区', '640500');
INSERT INTO `yershop_area` VALUES ('640521', '中宁县', '640500');
INSERT INTO `yershop_area` VALUES ('640522', '海原县', '640500');
INSERT INTO `yershop_area` VALUES ('650101', '市辖区', '650100');
INSERT INTO `yershop_area` VALUES ('650102', '天山区', '650100');
INSERT INTO `yershop_area` VALUES ('650103', '沙依巴克区', '650100');
INSERT INTO `yershop_area` VALUES ('650104', '新市区', '650100');
INSERT INTO `yershop_area` VALUES ('650105', '水磨沟区', '650100');
INSERT INTO `yershop_area` VALUES ('650106', '头屯河区', '650100');
INSERT INTO `yershop_area` VALUES ('650107', '达坂城区', '650100');
INSERT INTO `yershop_area` VALUES ('650108', '东山区', '650100');
INSERT INTO `yershop_area` VALUES ('650121', '乌鲁木齐县', '650100');
INSERT INTO `yershop_area` VALUES ('650201', '市辖区', '650200');
INSERT INTO `yershop_area` VALUES ('650202', '独山子区', '650200');
INSERT INTO `yershop_area` VALUES ('650203', '克拉玛依区', '650200');
INSERT INTO `yershop_area` VALUES ('650204', '白碱滩区', '650200');
INSERT INTO `yershop_area` VALUES ('650205', '乌尔禾区', '650200');
INSERT INTO `yershop_area` VALUES ('652101', '吐鲁番市', '652100');
INSERT INTO `yershop_area` VALUES ('652122', '鄯善县', '652100');
INSERT INTO `yershop_area` VALUES ('652123', '托克逊县', '652100');
INSERT INTO `yershop_area` VALUES ('652201', '哈密市', '652200');
INSERT INTO `yershop_area` VALUES ('652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `yershop_area` VALUES ('652223', '伊吾县', '652200');
INSERT INTO `yershop_area` VALUES ('652301', '昌吉市', '652300');
INSERT INTO `yershop_area` VALUES ('652302', '阜康市', '652300');
INSERT INTO `yershop_area` VALUES ('652303', '米泉市', '652300');
INSERT INTO `yershop_area` VALUES ('652323', '呼图壁县', '652300');
INSERT INTO `yershop_area` VALUES ('652324', '玛纳斯县', '652300');
INSERT INTO `yershop_area` VALUES ('652325', '奇台县', '652300');
INSERT INTO `yershop_area` VALUES ('652327', '吉木萨尔县', '652300');
INSERT INTO `yershop_area` VALUES ('652328', '木垒哈萨克自治县', '652300');
INSERT INTO `yershop_area` VALUES ('652701', '博乐市', '652700');
INSERT INTO `yershop_area` VALUES ('652722', '精河县', '652700');
INSERT INTO `yershop_area` VALUES ('652723', '温泉县', '652700');
INSERT INTO `yershop_area` VALUES ('652801', '库尔勒市', '652800');
INSERT INTO `yershop_area` VALUES ('652822', '轮台县', '652800');
INSERT INTO `yershop_area` VALUES ('652823', '尉犁县', '652800');
INSERT INTO `yershop_area` VALUES ('652824', '若羌县', '652800');
INSERT INTO `yershop_area` VALUES ('652825', '且末县', '652800');
INSERT INTO `yershop_area` VALUES ('652826', '焉耆回族自治县', '652800');
INSERT INTO `yershop_area` VALUES ('652827', '和静县', '652800');
INSERT INTO `yershop_area` VALUES ('652828', '和硕县', '652800');
INSERT INTO `yershop_area` VALUES ('652829', '博湖县', '652800');
INSERT INTO `yershop_area` VALUES ('652901', '阿克苏市', '652900');
INSERT INTO `yershop_area` VALUES ('652922', '温宿县', '652900');
INSERT INTO `yershop_area` VALUES ('652923', '库车县', '652900');
INSERT INTO `yershop_area` VALUES ('652924', '沙雅县', '652900');
INSERT INTO `yershop_area` VALUES ('652925', '新和县', '652900');
INSERT INTO `yershop_area` VALUES ('652926', '拜城县', '652900');
INSERT INTO `yershop_area` VALUES ('652927', '乌什县', '652900');
INSERT INTO `yershop_area` VALUES ('652928', '阿瓦提县', '652900');
INSERT INTO `yershop_area` VALUES ('652929', '柯坪县', '652900');
INSERT INTO `yershop_area` VALUES ('653001', '阿图什市', '653000');
INSERT INTO `yershop_area` VALUES ('653022', '阿克陶县', '653000');
INSERT INTO `yershop_area` VALUES ('653023', '阿合奇县', '653000');
INSERT INTO `yershop_area` VALUES ('653024', '乌恰县', '653000');
INSERT INTO `yershop_area` VALUES ('653101', '喀什市', '653100');
INSERT INTO `yershop_area` VALUES ('653121', '疏附县', '653100');
INSERT INTO `yershop_area` VALUES ('653122', '疏勒县', '653100');
INSERT INTO `yershop_area` VALUES ('653123', '英吉沙县', '653100');
INSERT INTO `yershop_area` VALUES ('653124', '泽普县', '653100');
INSERT INTO `yershop_area` VALUES ('653125', '莎车县', '653100');
INSERT INTO `yershop_area` VALUES ('653126', '叶城县', '653100');
INSERT INTO `yershop_area` VALUES ('653127', '麦盖提县', '653100');
INSERT INTO `yershop_area` VALUES ('653128', '岳普湖县', '653100');
INSERT INTO `yershop_area` VALUES ('653129', '伽师县', '653100');
INSERT INTO `yershop_area` VALUES ('653130', '巴楚县', '653100');
INSERT INTO `yershop_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `yershop_area` VALUES ('653201', '和田市', '653200');
INSERT INTO `yershop_area` VALUES ('653221', '和田县', '653200');
INSERT INTO `yershop_area` VALUES ('653222', '墨玉县', '653200');
INSERT INTO `yershop_area` VALUES ('653223', '皮山县', '653200');
INSERT INTO `yershop_area` VALUES ('653224', '洛浦县', '653200');
INSERT INTO `yershop_area` VALUES ('653225', '策勒县', '653200');
INSERT INTO `yershop_area` VALUES ('653226', '于田县', '653200');
INSERT INTO `yershop_area` VALUES ('653227', '民丰县', '653200');
INSERT INTO `yershop_area` VALUES ('654002', '伊宁市', '654000');
INSERT INTO `yershop_area` VALUES ('654003', '奎屯市', '654000');
INSERT INTO `yershop_area` VALUES ('654021', '伊宁县', '654000');
INSERT INTO `yershop_area` VALUES ('654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `yershop_area` VALUES ('654023', '霍城县', '654000');
INSERT INTO `yershop_area` VALUES ('654024', '巩留县', '654000');
INSERT INTO `yershop_area` VALUES ('654025', '新源县', '654000');
INSERT INTO `yershop_area` VALUES ('654026', '昭苏县', '654000');
INSERT INTO `yershop_area` VALUES ('654027', '特克斯县', '654000');
INSERT INTO `yershop_area` VALUES ('654028', '尼勒克县', '654000');
INSERT INTO `yershop_area` VALUES ('654201', '塔城市', '654200');
INSERT INTO `yershop_area` VALUES ('654202', '乌苏市', '654200');
INSERT INTO `yershop_area` VALUES ('654221', '额敏县', '654200');
INSERT INTO `yershop_area` VALUES ('654223', '沙湾县', '654200');
INSERT INTO `yershop_area` VALUES ('654224', '托里县', '654200');
INSERT INTO `yershop_area` VALUES ('654225', '裕民县', '654200');
INSERT INTO `yershop_area` VALUES ('654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `yershop_area` VALUES ('654301', '阿勒泰市', '654300');
INSERT INTO `yershop_area` VALUES ('654321', '布尔津县', '654300');
INSERT INTO `yershop_area` VALUES ('654322', '富蕴县', '654300');
INSERT INTO `yershop_area` VALUES ('654323', '福海县', '654300');
INSERT INTO `yershop_area` VALUES ('654324', '哈巴河县', '654300');
INSERT INTO `yershop_area` VALUES ('654325', '青河县', '654300');
INSERT INTO `yershop_area` VALUES ('654326', '吉木乃县', '654300');
INSERT INTO `yershop_area` VALUES ('659001', '石河子市', '659000');
INSERT INTO `yershop_area` VALUES ('659002', '阿拉尔市', '659000');
INSERT INTO `yershop_area` VALUES ('659003', '图木舒克市', '659000');
INSERT INTO `yershop_area` VALUES ('659004', '五家渠市', '659000');
INSERT INTO `yershop_area` VALUES ('110100', '市辖区', '110000');
INSERT INTO `yershop_area` VALUES ('110200', '县', '110000');
INSERT INTO `yershop_area` VALUES ('120100', '市辖区', '120000');
INSERT INTO `yershop_area` VALUES ('120200', '县', '120000');
INSERT INTO `yershop_area` VALUES ('130100', '石家庄市', '130000');
INSERT INTO `yershop_area` VALUES ('130200', '唐山市', '130000');
INSERT INTO `yershop_area` VALUES ('130300', '秦皇岛市', '130000');
INSERT INTO `yershop_area` VALUES ('130400', '邯郸市', '130000');
INSERT INTO `yershop_area` VALUES ('130500', '邢台市', '130000');
INSERT INTO `yershop_area` VALUES ('130600', '保定市', '130000');
INSERT INTO `yershop_area` VALUES ('130700', '张家口市', '130000');
INSERT INTO `yershop_area` VALUES ('130800', '承德市', '130000');
INSERT INTO `yershop_area` VALUES ('130900', '沧州市', '130000');
INSERT INTO `yershop_area` VALUES ('131000', '廊坊市', '130000');
INSERT INTO `yershop_area` VALUES ('131100', '衡水市', '130000');
INSERT INTO `yershop_area` VALUES ('140100', '太原市', '140000');
INSERT INTO `yershop_area` VALUES ('140200', '大同市', '140000');
INSERT INTO `yershop_area` VALUES ('140300', '阳泉市', '140000');
INSERT INTO `yershop_area` VALUES ('140400', '长治市', '140000');
INSERT INTO `yershop_area` VALUES ('140500', '晋城市', '140000');
INSERT INTO `yershop_area` VALUES ('140600', '朔州市', '140000');
INSERT INTO `yershop_area` VALUES ('140700', '晋中市', '140000');
INSERT INTO `yershop_area` VALUES ('140800', '运城市', '140000');
INSERT INTO `yershop_area` VALUES ('140900', '忻州市', '140000');
INSERT INTO `yershop_area` VALUES ('141000', '临汾市', '140000');
INSERT INTO `yershop_area` VALUES ('141100', '吕梁市', '140000');
INSERT INTO `yershop_area` VALUES ('150100', '呼和浩特市', '150000');
INSERT INTO `yershop_area` VALUES ('150200', '包头市', '150000');
INSERT INTO `yershop_area` VALUES ('150300', '乌海市', '150000');
INSERT INTO `yershop_area` VALUES ('150400', '赤峰市', '150000');
INSERT INTO `yershop_area` VALUES ('150500', '通辽市', '150000');
INSERT INTO `yershop_area` VALUES ('150600', '鄂尔多斯市', '150000');
INSERT INTO `yershop_area` VALUES ('150700', '呼伦贝尔市', '150000');
INSERT INTO `yershop_area` VALUES ('150800', '巴彦淖尔市', '150000');
INSERT INTO `yershop_area` VALUES ('150900', '乌兰察布市', '150000');
INSERT INTO `yershop_area` VALUES ('152200', '兴安盟', '150000');
INSERT INTO `yershop_area` VALUES ('152500', '锡林郭勒盟', '150000');
INSERT INTO `yershop_area` VALUES ('152900', '阿拉善盟', '150000');
INSERT INTO `yershop_area` VALUES ('210100', '沈阳市', '210000');
INSERT INTO `yershop_area` VALUES ('210200', '大连市', '210000');
INSERT INTO `yershop_area` VALUES ('210300', '鞍山市', '210000');
INSERT INTO `yershop_area` VALUES ('210400', '抚顺市', '210000');
INSERT INTO `yershop_area` VALUES ('210500', '本溪市', '210000');
INSERT INTO `yershop_area` VALUES ('210600', '丹东市', '210000');
INSERT INTO `yershop_area` VALUES ('210700', '锦州市', '210000');
INSERT INTO `yershop_area` VALUES ('210800', '营口市', '210000');
INSERT INTO `yershop_area` VALUES ('210900', '阜新市', '210000');
INSERT INTO `yershop_area` VALUES ('211000', '辽阳市', '210000');
INSERT INTO `yershop_area` VALUES ('211100', '盘锦市', '210000');
INSERT INTO `yershop_area` VALUES ('211200', '铁岭市', '210000');
INSERT INTO `yershop_area` VALUES ('211300', '朝阳市', '210000');
INSERT INTO `yershop_area` VALUES ('211400', '葫芦岛市', '210000');
INSERT INTO `yershop_area` VALUES ('220100', '长春市', '220000');
INSERT INTO `yershop_area` VALUES ('220200', '吉林市', '220000');
INSERT INTO `yershop_area` VALUES ('220300', '四平市', '220000');
INSERT INTO `yershop_area` VALUES ('220400', '辽源市', '220000');
INSERT INTO `yershop_area` VALUES ('220500', '通化市', '220000');
INSERT INTO `yershop_area` VALUES ('220600', '白山市', '220000');
INSERT INTO `yershop_area` VALUES ('220700', '松原市', '220000');
INSERT INTO `yershop_area` VALUES ('220800', '白城市', '220000');
INSERT INTO `yershop_area` VALUES ('222400', '延边朝鲜族自治州', '220000');
INSERT INTO `yershop_area` VALUES ('230100', '哈尔滨市', '230000');
INSERT INTO `yershop_area` VALUES ('230200', '齐齐哈尔市', '230000');
INSERT INTO `yershop_area` VALUES ('230300', '鸡西市', '230000');
INSERT INTO `yershop_area` VALUES ('230400', '鹤岗市', '230000');
INSERT INTO `yershop_area` VALUES ('230500', '双鸭山市', '230000');
INSERT INTO `yershop_area` VALUES ('230600', '大庆市', '230000');
INSERT INTO `yershop_area` VALUES ('230700', '伊春市', '230000');
INSERT INTO `yershop_area` VALUES ('230800', '佳木斯市', '230000');
INSERT INTO `yershop_area` VALUES ('230900', '七台河市', '230000');
INSERT INTO `yershop_area` VALUES ('231000', '牡丹江市', '230000');
INSERT INTO `yershop_area` VALUES ('231100', '黑河市', '230000');
INSERT INTO `yershop_area` VALUES ('231200', '绥化市', '230000');
INSERT INTO `yershop_area` VALUES ('232700', '大兴安岭地区', '230000');
INSERT INTO `yershop_area` VALUES ('310100', '市辖区', '310000');
INSERT INTO `yershop_area` VALUES ('310200', '县', '310000');
INSERT INTO `yershop_area` VALUES ('320100', '南京市', '320000');
INSERT INTO `yershop_area` VALUES ('320200', '无锡市', '320000');
INSERT INTO `yershop_area` VALUES ('320300', '徐州市', '320000');
INSERT INTO `yershop_area` VALUES ('320400', '常州市', '320000');
INSERT INTO `yershop_area` VALUES ('320500', '苏州市', '320000');
INSERT INTO `yershop_area` VALUES ('320600', '南通市', '320000');
INSERT INTO `yershop_area` VALUES ('320700', '连云港市', '320000');
INSERT INTO `yershop_area` VALUES ('320800', '淮安市', '320000');
INSERT INTO `yershop_area` VALUES ('320900', '盐城市', '320000');
INSERT INTO `yershop_area` VALUES ('321000', '扬州市', '320000');
INSERT INTO `yershop_area` VALUES ('321100', '镇江市', '320000');
INSERT INTO `yershop_area` VALUES ('321200', '泰州市', '320000');
INSERT INTO `yershop_area` VALUES ('321300', '宿迁市', '320000');
INSERT INTO `yershop_area` VALUES ('330100', '杭州市', '330000');
INSERT INTO `yershop_area` VALUES ('330200', '宁波市', '330000');
INSERT INTO `yershop_area` VALUES ('330300', '温州市', '330000');
INSERT INTO `yershop_area` VALUES ('330400', '嘉兴市', '330000');
INSERT INTO `yershop_area` VALUES ('330500', '湖州市', '330000');
INSERT INTO `yershop_area` VALUES ('330600', '绍兴市', '330000');
INSERT INTO `yershop_area` VALUES ('330700', '金华市', '330000');
INSERT INTO `yershop_area` VALUES ('330800', '衢州市', '330000');
INSERT INTO `yershop_area` VALUES ('330900', '舟山市', '330000');
INSERT INTO `yershop_area` VALUES ('331000', '台州市', '330000');
INSERT INTO `yershop_area` VALUES ('331100', '丽水市', '330000');
INSERT INTO `yershop_area` VALUES ('340100', '合肥市', '340000');
INSERT INTO `yershop_area` VALUES ('340200', '芜湖市', '340000');
INSERT INTO `yershop_area` VALUES ('340300', '蚌埠市', '340000');
INSERT INTO `yershop_area` VALUES ('340400', '淮南市', '340000');
INSERT INTO `yershop_area` VALUES ('340500', '马鞍山市', '340000');
INSERT INTO `yershop_area` VALUES ('340600', '淮北市', '340000');
INSERT INTO `yershop_area` VALUES ('340700', '铜陵市', '340000');
INSERT INTO `yershop_area` VALUES ('340800', '安庆市', '340000');
INSERT INTO `yershop_area` VALUES ('341000', '黄山市', '340000');
INSERT INTO `yershop_area` VALUES ('341100', '滁州市', '340000');
INSERT INTO `yershop_area` VALUES ('341200', '阜阳市', '340000');
INSERT INTO `yershop_area` VALUES ('341300', '宿州市', '340000');
INSERT INTO `yershop_area` VALUES ('341400', '巢湖市', '340000');
INSERT INTO `yershop_area` VALUES ('341500', '六安市', '340000');
INSERT INTO `yershop_area` VALUES ('341600', '亳州市', '340000');
INSERT INTO `yershop_area` VALUES ('341700', '池州市', '340000');
INSERT INTO `yershop_area` VALUES ('341800', '宣城市', '340000');
INSERT INTO `yershop_area` VALUES ('350100', '福州市', '350000');
INSERT INTO `yershop_area` VALUES ('350200', '厦门市', '350000');
INSERT INTO `yershop_area` VALUES ('350300', '莆田市', '350000');
INSERT INTO `yershop_area` VALUES ('350400', '三明市', '350000');
INSERT INTO `yershop_area` VALUES ('350500', '泉州市', '350000');
INSERT INTO `yershop_area` VALUES ('350600', '漳州市', '350000');
INSERT INTO `yershop_area` VALUES ('350700', '南平市', '350000');
INSERT INTO `yershop_area` VALUES ('350800', '龙岩市', '350000');
INSERT INTO `yershop_area` VALUES ('350900', '宁德市', '350000');
INSERT INTO `yershop_area` VALUES ('360100', '南昌市', '360000');
INSERT INTO `yershop_area` VALUES ('360200', '景德镇市', '360000');
INSERT INTO `yershop_area` VALUES ('360300', '萍乡市', '360000');
INSERT INTO `yershop_area` VALUES ('360400', '九江市', '360000');
INSERT INTO `yershop_area` VALUES ('360500', '新余市', '360000');
INSERT INTO `yershop_area` VALUES ('360600', '鹰潭市', '360000');
INSERT INTO `yershop_area` VALUES ('360700', '赣州市', '360000');
INSERT INTO `yershop_area` VALUES ('360800', '吉安市', '360000');
INSERT INTO `yershop_area` VALUES ('360900', '宜春市', '360000');
INSERT INTO `yershop_area` VALUES ('361000', '抚州市', '360000');
INSERT INTO `yershop_area` VALUES ('361100', '上饶市', '360000');
INSERT INTO `yershop_area` VALUES ('370100', '济南市', '370000');
INSERT INTO `yershop_area` VALUES ('370200', '青岛市', '370000');
INSERT INTO `yershop_area` VALUES ('370300', '淄博市', '370000');
INSERT INTO `yershop_area` VALUES ('370400', '枣庄市', '370000');
INSERT INTO `yershop_area` VALUES ('370500', '东营市', '370000');
INSERT INTO `yershop_area` VALUES ('370600', '烟台市', '370000');
INSERT INTO `yershop_area` VALUES ('370700', '潍坊市', '370000');
INSERT INTO `yershop_area` VALUES ('370800', '济宁市', '370000');
INSERT INTO `yershop_area` VALUES ('370900', '泰安市', '370000');
INSERT INTO `yershop_area` VALUES ('371000', '威海市', '370000');
INSERT INTO `yershop_area` VALUES ('371100', '日照市', '370000');
INSERT INTO `yershop_area` VALUES ('371200', '莱芜市', '370000');
INSERT INTO `yershop_area` VALUES ('371300', '临沂市', '370000');
INSERT INTO `yershop_area` VALUES ('371400', '德州市', '370000');
INSERT INTO `yershop_area` VALUES ('371500', '聊城市', '370000');
INSERT INTO `yershop_area` VALUES ('371600', '滨州市', '370000');
INSERT INTO `yershop_area` VALUES ('371700', '荷泽市', '370000');
INSERT INTO `yershop_area` VALUES ('410100', '郑州市', '410000');
INSERT INTO `yershop_area` VALUES ('410200', '开封市', '410000');
INSERT INTO `yershop_area` VALUES ('410300', '洛阳市', '410000');
INSERT INTO `yershop_area` VALUES ('410400', '平顶山市', '410000');
INSERT INTO `yershop_area` VALUES ('410500', '安阳市', '410000');
INSERT INTO `yershop_area` VALUES ('410600', '鹤壁市', '410000');
INSERT INTO `yershop_area` VALUES ('410700', '新乡市', '410000');
INSERT INTO `yershop_area` VALUES ('410800', '焦作市', '410000');
INSERT INTO `yershop_area` VALUES ('410900', '濮阳市', '410000');
INSERT INTO `yershop_area` VALUES ('411000', '许昌市', '410000');
INSERT INTO `yershop_area` VALUES ('411100', '漯河市', '410000');
INSERT INTO `yershop_area` VALUES ('411200', '三门峡市', '410000');
INSERT INTO `yershop_area` VALUES ('411300', '南阳市', '410000');
INSERT INTO `yershop_area` VALUES ('411400', '商丘市', '410000');
INSERT INTO `yershop_area` VALUES ('411500', '信阳市', '410000');
INSERT INTO `yershop_area` VALUES ('411600', '周口市', '410000');
INSERT INTO `yershop_area` VALUES ('411700', '驻马店市', '410000');
INSERT INTO `yershop_area` VALUES ('420100', '武汉市', '420000');
INSERT INTO `yershop_area` VALUES ('420200', '黄石市', '420000');
INSERT INTO `yershop_area` VALUES ('420300', '十堰市', '420000');
INSERT INTO `yershop_area` VALUES ('420500', '宜昌市', '420000');
INSERT INTO `yershop_area` VALUES ('420600', '襄樊市', '420000');
INSERT INTO `yershop_area` VALUES ('420700', '鄂州市', '420000');
INSERT INTO `yershop_area` VALUES ('420800', '荆门市', '420000');
INSERT INTO `yershop_area` VALUES ('420900', '孝感市', '420000');
INSERT INTO `yershop_area` VALUES ('421000', '荆州市', '420000');
INSERT INTO `yershop_area` VALUES ('421100', '黄冈市', '420000');
INSERT INTO `yershop_area` VALUES ('421200', '咸宁市', '420000');
INSERT INTO `yershop_area` VALUES ('421300', '随州市', '420000');
INSERT INTO `yershop_area` VALUES ('422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `yershop_area` VALUES ('429000', '省直辖行政单位', '420000');
INSERT INTO `yershop_area` VALUES ('430100', '长沙市', '430000');
INSERT INTO `yershop_area` VALUES ('430200', '株洲市', '430000');
INSERT INTO `yershop_area` VALUES ('430300', '湘潭市', '430000');
INSERT INTO `yershop_area` VALUES ('430400', '衡阳市', '430000');
INSERT INTO `yershop_area` VALUES ('430500', '邵阳市', '430000');
INSERT INTO `yershop_area` VALUES ('430600', '岳阳市', '430000');
INSERT INTO `yershop_area` VALUES ('430700', '常德市', '430000');
INSERT INTO `yershop_area` VALUES ('430800', '张家界市', '430000');
INSERT INTO `yershop_area` VALUES ('430900', '益阳市', '430000');
INSERT INTO `yershop_area` VALUES ('431000', '郴州市', '430000');
INSERT INTO `yershop_area` VALUES ('431100', '永州市', '430000');
INSERT INTO `yershop_area` VALUES ('431200', '怀化市', '430000');
INSERT INTO `yershop_area` VALUES ('431300', '娄底市', '430000');
INSERT INTO `yershop_area` VALUES ('433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `yershop_area` VALUES ('440100', '广州市', '440000');
INSERT INTO `yershop_area` VALUES ('440200', '韶关市', '440000');
INSERT INTO `yershop_area` VALUES ('440300', '深圳市', '440000');
INSERT INTO `yershop_area` VALUES ('440400', '珠海市', '440000');
INSERT INTO `yershop_area` VALUES ('440500', '汕头市', '440000');
INSERT INTO `yershop_area` VALUES ('440600', '佛山市', '440000');
INSERT INTO `yershop_area` VALUES ('440700', '江门市', '440000');
INSERT INTO `yershop_area` VALUES ('440800', '湛江市', '440000');
INSERT INTO `yershop_area` VALUES ('440900', '茂名市', '440000');
INSERT INTO `yershop_area` VALUES ('441200', '肇庆市', '440000');
INSERT INTO `yershop_area` VALUES ('441300', '惠州市', '440000');
INSERT INTO `yershop_area` VALUES ('441400', '梅州市', '440000');
INSERT INTO `yershop_area` VALUES ('441500', '汕尾市', '440000');
INSERT INTO `yershop_area` VALUES ('441600', '河源市', '440000');
INSERT INTO `yershop_area` VALUES ('441700', '阳江市', '440000');
INSERT INTO `yershop_area` VALUES ('441800', '清远市', '440000');
INSERT INTO `yershop_area` VALUES ('441900', '东莞市', '440000');
INSERT INTO `yershop_area` VALUES ('442000', '中山市', '440000');
INSERT INTO `yershop_area` VALUES ('445100', '潮州市', '440000');
INSERT INTO `yershop_area` VALUES ('445200', '揭阳市', '440000');
INSERT INTO `yershop_area` VALUES ('445300', '云浮市', '440000');
INSERT INTO `yershop_area` VALUES ('450100', '南宁市', '450000');
INSERT INTO `yershop_area` VALUES ('450200', '柳州市', '450000');
INSERT INTO `yershop_area` VALUES ('450300', '桂林市', '450000');
INSERT INTO `yershop_area` VALUES ('450400', '梧州市', '450000');
INSERT INTO `yershop_area` VALUES ('450500', '北海市', '450000');
INSERT INTO `yershop_area` VALUES ('450600', '防城港市', '450000');
INSERT INTO `yershop_area` VALUES ('450700', '钦州市', '450000');
INSERT INTO `yershop_area` VALUES ('450800', '贵港市', '450000');
INSERT INTO `yershop_area` VALUES ('450900', '玉林市', '450000');
INSERT INTO `yershop_area` VALUES ('451000', '百色市', '450000');
INSERT INTO `yershop_area` VALUES ('451100', '贺州市', '450000');
INSERT INTO `yershop_area` VALUES ('451200', '河池市', '450000');
INSERT INTO `yershop_area` VALUES ('451300', '来宾市', '450000');
INSERT INTO `yershop_area` VALUES ('451400', '崇左市', '450000');
INSERT INTO `yershop_area` VALUES ('460100', '海口市', '460000');
INSERT INTO `yershop_area` VALUES ('460200', '三亚市', '460000');
INSERT INTO `yershop_area` VALUES ('469000', '省直辖县级行政单位', '460000');
INSERT INTO `yershop_area` VALUES ('500100', '市辖区', '500000');
INSERT INTO `yershop_area` VALUES ('500200', '县', '500000');
INSERT INTO `yershop_area` VALUES ('500300', '市', '500000');
INSERT INTO `yershop_area` VALUES ('510100', '成都市', '510000');
INSERT INTO `yershop_area` VALUES ('510300', '自贡市', '510000');
INSERT INTO `yershop_area` VALUES ('510400', '攀枝花市', '510000');
INSERT INTO `yershop_area` VALUES ('510500', '泸州市', '510000');
INSERT INTO `yershop_area` VALUES ('510600', '德阳市', '510000');
INSERT INTO `yershop_area` VALUES ('510700', '绵阳市', '510000');
INSERT INTO `yershop_area` VALUES ('510800', '广元市', '510000');
INSERT INTO `yershop_area` VALUES ('510900', '遂宁市', '510000');
INSERT INTO `yershop_area` VALUES ('511000', '内江市', '510000');
INSERT INTO `yershop_area` VALUES ('511100', '乐山市', '510000');
INSERT INTO `yershop_area` VALUES ('511300', '南充市', '510000');
INSERT INTO `yershop_area` VALUES ('511400', '眉山市', '510000');
INSERT INTO `yershop_area` VALUES ('511500', '宜宾市', '510000');
INSERT INTO `yershop_area` VALUES ('511600', '广安市', '510000');
INSERT INTO `yershop_area` VALUES ('511700', '达州市', '510000');
INSERT INTO `yershop_area` VALUES ('511800', '雅安市', '510000');
INSERT INTO `yershop_area` VALUES ('511900', '巴中市', '510000');
INSERT INTO `yershop_area` VALUES ('512000', '资阳市', '510000');
INSERT INTO `yershop_area` VALUES ('513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `yershop_area` VALUES ('513300', '甘孜藏族自治州', '510000');
INSERT INTO `yershop_area` VALUES ('513400', '凉山彝族自治州', '510000');
INSERT INTO `yershop_area` VALUES ('520100', '贵阳市', '520000');
INSERT INTO `yershop_area` VALUES ('520200', '六盘水市', '520000');
INSERT INTO `yershop_area` VALUES ('520300', '遵义市', '520000');
INSERT INTO `yershop_area` VALUES ('520400', '安顺市', '520000');
INSERT INTO `yershop_area` VALUES ('522200', '铜仁地区', '520000');
INSERT INTO `yershop_area` VALUES ('522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `yershop_area` VALUES ('522400', '毕节地区', '520000');
INSERT INTO `yershop_area` VALUES ('522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `yershop_area` VALUES ('522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `yershop_area` VALUES ('530100', '昆明市', '530000');
INSERT INTO `yershop_area` VALUES ('530300', '曲靖市', '530000');
INSERT INTO `yershop_area` VALUES ('530400', '玉溪市', '530000');
INSERT INTO `yershop_area` VALUES ('530500', '保山市', '530000');
INSERT INTO `yershop_area` VALUES ('530600', '昭通市', '530000');
INSERT INTO `yershop_area` VALUES ('530700', '丽江市', '530000');
INSERT INTO `yershop_area` VALUES ('530800', '思茅市', '530000');
INSERT INTO `yershop_area` VALUES ('530900', '临沧市', '530000');
INSERT INTO `yershop_area` VALUES ('532300', '楚雄彝族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('532600', '文山壮族苗族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('532800', '西双版纳傣族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('532900', '大理白族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('533300', '怒江傈僳族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('533400', '迪庆藏族自治州', '530000');
INSERT INTO `yershop_area` VALUES ('540100', '拉萨市', '540000');
INSERT INTO `yershop_area` VALUES ('542100', '昌都地区', '540000');
INSERT INTO `yershop_area` VALUES ('542200', '山南地区', '540000');
INSERT INTO `yershop_area` VALUES ('542300', '日喀则地区', '540000');
INSERT INTO `yershop_area` VALUES ('542400', '那曲地区', '540000');
INSERT INTO `yershop_area` VALUES ('542500', '阿里地区', '540000');
INSERT INTO `yershop_area` VALUES ('542600', '林芝地区', '540000');
INSERT INTO `yershop_area` VALUES ('610100', '西安市', '610000');
INSERT INTO `yershop_area` VALUES ('610200', '铜川市', '610000');
INSERT INTO `yershop_area` VALUES ('610300', '宝鸡市', '610000');
INSERT INTO `yershop_area` VALUES ('610400', '咸阳市', '610000');
INSERT INTO `yershop_area` VALUES ('610500', '渭南市', '610000');
INSERT INTO `yershop_area` VALUES ('610600', '延安市', '610000');
INSERT INTO `yershop_area` VALUES ('610700', '汉中市', '610000');
INSERT INTO `yershop_area` VALUES ('610800', '榆林市', '610000');
INSERT INTO `yershop_area` VALUES ('610900', '安康市', '610000');
INSERT INTO `yershop_area` VALUES ('611000', '商洛市', '610000');
INSERT INTO `yershop_area` VALUES ('620100', '兰州市', '620000');
INSERT INTO `yershop_area` VALUES ('620200', '嘉峪关市', '620000');
INSERT INTO `yershop_area` VALUES ('620300', '金昌市', '620000');
INSERT INTO `yershop_area` VALUES ('620400', '白银市', '620000');
INSERT INTO `yershop_area` VALUES ('620500', '天水市', '620000');
INSERT INTO `yershop_area` VALUES ('620600', '武威市', '620000');
INSERT INTO `yershop_area` VALUES ('620700', '张掖市', '620000');
INSERT INTO `yershop_area` VALUES ('620800', '平凉市', '620000');
INSERT INTO `yershop_area` VALUES ('620900', '酒泉市', '620000');
INSERT INTO `yershop_area` VALUES ('621000', '庆阳市', '620000');
INSERT INTO `yershop_area` VALUES ('621100', '定西市', '620000');
INSERT INTO `yershop_area` VALUES ('621200', '陇南市', '620000');
INSERT INTO `yershop_area` VALUES ('622900', '临夏回族自治州', '620000');
INSERT INTO `yershop_area` VALUES ('623000', '甘南藏族自治州', '620000');
INSERT INTO `yershop_area` VALUES ('630100', '西宁市', '630000');
INSERT INTO `yershop_area` VALUES ('632100', '海东地区', '630000');
INSERT INTO `yershop_area` VALUES ('632200', '海北藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('632300', '黄南藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('632500', '海南藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('632600', '果洛藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('632700', '玉树藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `yershop_area` VALUES ('640100', '银川市', '640000');
INSERT INTO `yershop_area` VALUES ('640200', '石嘴山市', '640000');
INSERT INTO `yershop_area` VALUES ('640300', '吴忠市', '640000');
INSERT INTO `yershop_area` VALUES ('640400', '固原市', '640000');
INSERT INTO `yershop_area` VALUES ('640500', '中卫市', '640000');
INSERT INTO `yershop_area` VALUES ('650100', '乌鲁木齐市', '650000');
INSERT INTO `yershop_area` VALUES ('650200', '克拉玛依市', '650000');
INSERT INTO `yershop_area` VALUES ('652100', '吐鲁番地区', '650000');
INSERT INTO `yershop_area` VALUES ('652200', '哈密地区', '650000');
INSERT INTO `yershop_area` VALUES ('652300', '昌吉回族自治州', '650000');
INSERT INTO `yershop_area` VALUES ('652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `yershop_area` VALUES ('652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `yershop_area` VALUES ('652900', '阿克苏地区', '650000');
INSERT INTO `yershop_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `yershop_area` VALUES ('653100', '喀什地区', '650000');
INSERT INTO `yershop_area` VALUES ('653200', '和田地区', '650000');
INSERT INTO `yershop_area` VALUES ('654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `yershop_area` VALUES ('654200', '塔城地区', '650000');
INSERT INTO `yershop_area` VALUES ('654300', '阿勒泰地区', '650000');
INSERT INTO `yershop_area` VALUES ('659000', '省直辖行政单位', '650000');
INSERT INTO `yershop_area` VALUES ('110000', '北京市', '0');
INSERT INTO `yershop_area` VALUES ('120000', '天津市', '0');
INSERT INTO `yershop_area` VALUES ('130000', '河北省', '0');
INSERT INTO `yershop_area` VALUES ('140000', '山西省', '0');
INSERT INTO `yershop_area` VALUES ('150000', '内蒙古自治区', '0');
INSERT INTO `yershop_area` VALUES ('210000', '辽宁省', '0');
INSERT INTO `yershop_area` VALUES ('220000', '吉林省', '0');
INSERT INTO `yershop_area` VALUES ('230000', '黑龙江省', '0');
INSERT INTO `yershop_area` VALUES ('310000', '上海市', '0');
INSERT INTO `yershop_area` VALUES ('320000', '江苏省', '0');
INSERT INTO `yershop_area` VALUES ('330000', '浙江省', '0');
INSERT INTO `yershop_area` VALUES ('340000', '安徽省', '0');
INSERT INTO `yershop_area` VALUES ('350000', '福建省', '0');
INSERT INTO `yershop_area` VALUES ('360000', '江西省', '0');
INSERT INTO `yershop_area` VALUES ('370000', '山东省', '0');
INSERT INTO `yershop_area` VALUES ('410000', '河南省', '0');
INSERT INTO `yershop_area` VALUES ('420000', '湖北省', '0');
INSERT INTO `yershop_area` VALUES ('430000', '湖南省', '0');
INSERT INTO `yershop_area` VALUES ('440000', '广东省', '0');
INSERT INTO `yershop_area` VALUES ('450000', '广西壮族自治区', '0');
INSERT INTO `yershop_area` VALUES ('460000', '海南省', '0');
INSERT INTO `yershop_area` VALUES ('500000', '重庆市', '0');
INSERT INTO `yershop_area` VALUES ('510000', '四川省', '0');
INSERT INTO `yershop_area` VALUES ('520000', '贵州省', '0');
INSERT INTO `yershop_area` VALUES ('530000', '云南省', '0');
INSERT INTO `yershop_area` VALUES ('540000', '西藏自治区', '0');
INSERT INTO `yershop_area` VALUES ('610000', '陕西省', '0');
INSERT INTO `yershop_area` VALUES ('620000', '甘肃省', '0');
INSERT INTO `yershop_area` VALUES ('630000', '青海省', '0');
INSERT INTO `yershop_area` VALUES ('640000', '宁夏回族自治区', '0');
INSERT INTO `yershop_area` VALUES ('650000', '新疆维吾尔自治区', '0');
INSERT INTO `yershop_area` VALUES ('710000', '台湾省', '0');
INSERT INTO `yershop_area` VALUES ('810000', '香港特别行政区', '0');
INSERT INTO `yershop_area` VALUES ('820000', '澳门特别行政区', '0');

-- ----------------------------
-- Table structure for `yershop_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_attachment`;
CREATE TABLE `yershop_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源id',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录id',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录id',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of yershop_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_attribute`;
CREATE TABLE `yershop_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of yershop_attribute
-- ----------------------------
INSERT INTO `yershop_attribute` VALUES ('1', 'uid', '用户id', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('7', 'pid', '所属id', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('8', 'model_id', '内容模型id', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `yershop_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `yershop_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `yershop_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `yershop_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('35', 'marketprice', '市场价', 'varchar(255) NOT NULL ', 'string', '1.00', '', '1', '', '5', '0', '1', '1411430769', '1411375944', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('36', 'content', '内容详细描述', 'text NOT NULL', 'editor', '', '', '1', '', '5', '0', '1', '1416804356', '1411376156', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('37', 'parameters', '参数名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('39', 'area', '产地', 'varchar(255) NOT NULL', 'string', '中国大陆', '', '1', '', '5', '0', '1', '1411380147', '1411380147', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('50', 'ads_pic_id', '广告图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '5', '0', '1', '1422886159', '1422886070', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('42', 'groupprice', '组合价格', 'varchar(255) NOT NULL', 'string', '', '产品原价', '1', '', '5', '0', '1', '1411919829', '1411919829', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('43', 'mark', '附加标签', 'varchar(255) NOT NULL', 'string', '', '1-最新上架，2-限时抢购，3-热卖商品，4-限时折扣', '1', '', '5', '0', '1', '1412016261', '1412016196', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('44', 'unionid', '关联商品', 'varchar(255) NOT NULL', 'string', '', '关联商品id,如3、9、10，顿号号隔开', '1', '', '5', '0', '1', '1422019254', '1413845084', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('47', 'shorttitle', '商品简称', 'varchar(255) NOT NULL', 'string', '', '商品简称', '1', '', '5', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('46', 'stock', '库存', 'int(10) UNSIGNED NOT NULL', 'num', '10', '商品库存数量', '1', '', '5', '0', '1', '1414669588', '1414177236', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('49', 'pics', '图集', 'varchar(255) NOT NULL', 'pictures', '', '', '1', '', '1', '0', '1', '1421992389', '1415713073', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('51', 'price', '价格', 'decimal(50,2) NOT NULL', 'string', '0', '零售价格', '1', '', '1', '0', '1', '1424703104', '1424703104', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('117', 'market_price', '市场价', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '9', '0', '1', '1438755432', '1438755432', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('118', 'market_price', '市场价', 'varchar(255) NOT NULL', 'string', '', '市场价大于秒杀价', '1', '', '10', '0', '1', '1439087932', '1439086860', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('120', 'next_time', '下次开始时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '11', '0', '1', '1439230241', '1439230241', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('55', 'brand', '品牌', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '1', '0', '1', '1424703571', '1424703571', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('56', 'sale', '销量', 'int(10) UNSIGNED NOT NULL', 'num', '', '', '1', '', '1', '0', '1', '1424703603', '1424703603', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('58', 'percent', '购买率', 'varchar(255) NOT NULL', 'string', '', '商品购买率', '1', '', '5', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('59', 'system', '操作系统', 'varchar(255) NOT NULL', 'string', '', '手机操作系统', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('60', 'content', '内容', 'varchar(255) NOT NULL', 'editor', '', '内容', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('61', 'nettype', '网络制式', 'varchar(255) NOT NULL', 'string', '', '手机网络制式', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('62', 'screen', '屏幕尺寸', 'varchar(255) NOT NULL', 'string', '', '手机屏幕尺寸', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('63', 'ram', 'RAM容量', 'varchar(255) NOT NULL', 'string', '', 'RAM容量', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('64', 'rom', 'ROM容量', 'varchar(255) NOT NULL', 'string', '', 'ROM容量', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('65', 'cpu_type', 'cpu型号', 'varchar(255) NOT NULL', 'string', '', 'cpu型号', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('66', 'cpu_frequency', 'cpu频率', 'varchar(255) NOT NULL', 'string', '', 'cpu频率', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('67', 'battery_type', '电池类型', 'varchar(255) NOT NULL', 'string', '', '电池类型', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('68', 'battery_capacity', '电池容量', 'varchar(255) NOT NULL', 'string', '', '电池容量', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('69', 'stand_by_time', '待机时间', 'varchar(255) NOT NULL', 'string', '', '待机时间', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('70', 'holding_time', '通话时间', 'varchar(255) NOT NULL', 'string', '', '手机屏幕尺寸', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('71', 'phoneweight', '手机重量', 'varchar(255) NOT NULL', 'string', '', '手机重量', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('72', 'sdcard', 'sd卡扩展容量', 'varchar(255) NOT NULL', 'string', '', 'sd卡扩展容量', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('73', 'character', '功能特点', 'varchar(255) NOT NULL', 'string', '', '功能特点', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('74', 'battery_type', '电池类型', 'varchar(255) NOT NULL', 'string', '', '电池类型', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('75', 'camera_before', '前置摄像头像素', 'varchar(255) NOT NULL', 'string', '', '摄像头类型', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('76', 'camera_after', '后置摄像头像素', 'varchar(255) NOT NULL', 'string', '', '后置摄像头像素', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('77', 'sensor_type', '传感器类型', 'varchar(255) NOT NULL', 'string', '', '传感器类型', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('78', 'flashlight', '闪光灯', 'varchar(255) NOT NULL', 'string', '', '闪光灯', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('79', 'apeture', '光圈', 'varchar(255) NOT NULL', 'string', '', '光圈', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('80', 'color', '颜色', 'varchar(255) NOT NULL', 'string', '', '颜色', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('81', 'launch_time', '上市时间', 'int(10) unsigned NOT NULL ', 'datetime', '', '上市时间', '1', '', '6', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('82', 'author', '作者', 'varchar(255) NOT NULL', 'string', '', '作者', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('83', 'publish_time', '出版时间', 'int(10) unsigned NOT NULL ', 'datetime', '', '出版时间', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('84', 'isbn', 'ISBN', 'varchar(255) NOT NULL', 'string', '', 'ISBN', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('85', 'pages', '页数', 'varchar(255) NOT NULL', 'string', '', '页数', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('86', 'formats', '开本', 'varchar(255) NOT NULL', 'string', '', '开本', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('87', 'length', '字数', 'varchar(255) NOT NULL', 'string', '', '字数', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('88', 'paper', '纸张', 'varchar(255) NOT NULL', 'string', '', '纸张', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('89', 'package', '包装', 'varchar(255) NOT NULL', 'string', '', '字数', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('90', 'press_time', '印刷时间', 'int(10) unsigned NOT NULL ', 'datetime', '', '印刷时间', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('91', 'press_number', '印刷次数', 'varchar(255) NOT NULL', 'string', '', '印刷次数', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('92', 'edition_number', '版次', 'varchar(255) NOT NULL', 'string', '', '版次', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('93', 'content', '内容', 'text NOT NULL ', 'editor', '', '', '1', '', '7', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('94', 'color', '颜色', 'varchar(255) NOT NULL', 'string', '', '颜色', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('95', 'size', '型号', 'varchar(255) NOT NULL', 'string', '', '型号', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('96', 'content', '内容', 'varchar(255) NOT NULL', 'editor', '', '内容', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('97', 'c_type', '类型', 'varchar(255) NOT NULL', 'string', '', '服装类型', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('98', 'style', '款式', 'varchar(255) NOT NULL', 'string', '', '服装风格', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('99', 'material', '服装材质', 'varchar(255) NOT NULL', 'string', '', '服装材质', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('100', 'season', '季节性', 'varchar(255) NOT NULL', 'string', '', '季节性', '1', '', '8', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('101', 'publisher', '出版社', 'varchar(255) NOT NULL', 'string', '', '出版社', '1', '', '7', '0', '1', '1414329390', '1414329390', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('102', 'parameters_value', '参数值', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '5', '0', '1', '1443648402', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('103', 'parameters', '参数名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('104', 'parameters_value', '参数值', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('105', 'groupprice', '组合价格', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '6', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('106', 'parameters', '参数名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('107', 'parameters_value', '参数值', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('108', 'groupprice', '组合价格', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '7', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('109', 'parameters', '参数名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('110', 'parameters_value', '参数值', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('111', 'groupprice', '组合价格', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '8', '0', '1', '1411927788', '1411379961', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('115', 'content', '内容', 'varchar(100) NOT NULL', 'editor', '', '', '1', '', '11', '0', '1', '1439136450', '1438717172', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('113', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '9', '0', '1', '1438712121', '1438712121', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('114', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '10', '0', '1', '1438712942', '1438712942', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('119', 'start_time', '开始时间', 'int(10) NOT NULL', 'datetime', '', '', '1', '', '11', '0', '1', '1439136592', '1439136577', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `yershop_attribute` VALUES ('121', 'name', '行为唯一标识', 'char(30) NOT NULL ', 'string', '', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('122', 'title', '行为说明', 'char(80) NOT NULL ', 'string', '', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('123', 'remark', '行为描述', 'char(140) NOT NULL ', 'string', '', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('124', 'rule', '行为规则', 'text NULL ', 'string', '', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('125', 'log', '日志规则', 'text NULL ', 'string', '', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('126', 'type', '类型', 'tinyint(2) unsigned NOT NULL ', 'string', '1', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('127', 'status', '状态', 'tinyint(2) NOT NULL ', 'string', '0', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');
INSERT INTO `yershop_attribute` VALUES ('128', 'update_time', '修改时间', 'int(11) unsigned NOT NULL ', 'string', '0', '', '1', '', '14', '0', '1', '1439264360', '1439264360', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for `yershop_auth_extend`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_auth_extend`;
CREATE TABLE `yershop_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of yershop_auth_extend
-- ----------------------------
INSERT INTO `yershop_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `yershop_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `yershop_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `yershop_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `yershop_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `yershop_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `yershop_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `yershop_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for `yershop_auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_auth_group`;
CREATE TABLE `yershop_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_auth_group
-- ----------------------------
INSERT INTO `yershop_auth_group` VALUES ('1', 'admin', '1', '系统用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `yershop_auth_group` VALUES ('2', 'admin', '1', '商家', '商家', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for `yershop_auth_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_auth_group_access`;
CREATE TABLE `yershop_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_auth_rule`;
CREATE TABLE `yershop_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_auth_rule
-- ----------------------------
INSERT INTO `yershop_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '文章', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '商品分类', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `yershop_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('219', 'admin', '1', 'Admin/Order/index', '提交订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('220', 'admin', '1', 'Admin/Brand/index', '品牌管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('221', 'admin', '1', 'Admin/Slide/index', '幻灯片', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('222', 'admin', '1', 'Admin/Ad/index', '广告', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('223', 'admin', '1', 'Admin/Reserve/index', '预约列表', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('224', 'admin', '1', 'Admin/Cancel/index', '取消管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('225', 'admin', '1', 'Admin/Catearticle/index', '文章分类', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('226', 'admin', '1', 'Admin/Back/index', '正退货订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('227', 'admin', '1', 'Admin/Fcoupon/index', '优惠券', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('228', 'admin', '1', 'Admin/Change/index', '换货管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('229', 'admin', '1', 'Admin/Pay/index', '财务管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('230', 'admin', '2', 'Admin/Goods/index', '商品', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('231', 'admin', '1', 'Admin/Backrefuse/index', '拒绝退货订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('232', 'admin', '2', 'Admin/Order/index', '订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('233', 'admin', '1', 'Admin/UserLog/index', '日志管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('234', 'admin', '1', 'Admin/Backon/index', '退货中订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('235', 'admin', '1', 'Admin/Email/index', '邮件管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('236', 'admin', '1', 'Admin/Backagree/index', '同意退货订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('237', 'admin', '2', 'Admin/Statistics/index', '数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('238', 'admin', '1', 'Admin/Sms/index', '短信管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('239', 'admin', '1', 'Admin/Backover/index', '已退货订单', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('240', 'admin', '1', 'Admin/Envelope/index', '站内信管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('241', 'admin', '1', 'Admin/Express/index', ' 快递管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('242', 'admin', '2', 'Admin/Slide/index', '广告', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('243', 'admin', '1', 'Admin/Message/index', '留言管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('244', 'admin', '1', 'Admin/Reply/index', '回复管理', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('245', 'admin', '1', 'Admin/Statistics/index', '今日销量统计', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('246', 'admin', '1', 'Admin/Statistics/week', '本周销量统计', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('247', 'admin', '1', 'Admin/Statistics/month', '本月销量统计', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('248', 'admin', '1', 'Admin/Report/index', '每日数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('249', 'admin', '1', 'Admin/Report/week', '每周数据', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('250', 'admin', '1', 'Admin/Report/month', '每月统计', '1', '');
INSERT INTO `yershop_auth_rule` VALUES ('251', 'admin', '1', 'Admin/Lookup/index', '流量统计', '1', '');

-- ----------------------------
-- Table structure for `yershop_backlist`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_backlist`;
CREATE TABLE `yershop_backlist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `tool` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `toolid` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(225) NOT NULL DEFAULT '',
  `total` decimal(50,2) NOT NULL DEFAULT '0.00',
  `backinfo` varchar(225) NOT NULL DEFAULT '',
  `address` varchar(225) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `parameters` varchar(225) NOT NULL DEFAULT '',
  `assistant` int(10) unsigned NOT NULL DEFAULT '0',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '',
  `reason` varchar(225) NOT NULL DEFAULT '',
  `contact` varchar(225) NOT NULL DEFAULT '',
  `backname` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='退货表';

-- ----------------------------
-- Records of yershop_backlist
-- ----------------------------
INSERT INTO `yershop_backlist` VALUES ('1', '0', '0', '', '', '1', '1444235954', '', '0.00', '', '', '0', '', '0', '0', '', '', '', '');
INSERT INTO `yershop_backlist` VALUES ('249', '85', '1', '', '', '1', '1444235960', '', '0.00', '', '', '1444235960', '', '0', '249', '', 'background: 0% 0%;\r\nborder: 1px solid #E9EDF0;\r\ncolor: #5D5757;\r\nfont-size: 15px;\r\nfont-weight: bold;\r\nheight: 28px;\r\nline-height: 28px;\r\npadding: 5px;', '', '');
INSERT INTO `yershop_backlist` VALUES ('248', '85', '1', '', '', '1', '1444236969', '', '13.90', '', '', '1444236969', '', '0', '248', '', '/index', '', '');
INSERT INTO `yershop_backlist` VALUES ('247', '86', '1', '', '', '1', '1444237137', '', '99.00', '', '', '1444237137', '', '0', '247', '', '$id', '', '');

-- ----------------------------
-- Table structure for `yershop_brand`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_brand`;
CREATE TABLE `yershop_brand` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `price` varchar(50) NOT NULL DEFAULT '' COMMENT '金额',
  `code` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `meta_title` varchar(100) NOT NULL DEFAULT '',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图标',
  `ypid` int(10) unsigned NOT NULL DEFAULT '0',
  `goodid` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
-- Records of yershop_brand
-- ----------------------------
INSERT INTO `yershop_brand` VALUES ('1', 'Maxwell', '麦斯威尔', '', '', '', '', '0', '1', '1442509490', '1442572614', '1', '119', '52', '');
INSERT INTO `yershop_brand` VALUES ('4', 'ylrh\'', '元朗荣华', '', '', '', '', '0', '1', '1442576731', '1442576731', '1', '120', '57', '');
INSERT INTO `yershop_brand` VALUES ('5', 'jrkj', '肌肉科技', '', '', '', '', '0', '1', '1442576899', '1442576899', '1', '121', '57', '');
INSERT INTO `yershop_brand` VALUES ('6', 'ychdzx', '阳澄湖大闸蟹', '', '', '', '', '0', '1', '1442576947', '1442576947', '1', '122', '52', '');
INSERT INTO `yershop_brand` VALUES ('7', 'hennessy', 'hennessy', '', '', '', '', '0', '1', '1442577280', '1442577280', '1', '123', '52', '');
INSERT INTO `yershop_brand` VALUES ('8', 'dxc', '稻香村', '', '', '', '', '0', '1', '1442577327', '1442577327', '1', '124', '57', '');
INSERT INTO `yershop_brand` VALUES ('9', 'gzmt', '贵州茅台', '', '', '', '', '0', '1', '1442577383', '1442577383', '1', '125', '52', '');
INSERT INTO `yershop_brand` VALUES ('10', 'lafei', '拉菲', '', '', '', '', '0', '1', '1442577421', '1442577421', '1', '126', '52', '');
INSERT INTO `yershop_brand` VALUES ('11', 'bsl', '博士伦', '', '', '', '', '0', '1', '1442577594', '1442577594', '1', '127', '57', '');
INSERT INTO `yershop_brand` VALUES ('12', 'qhsj', '奇华世家', '', '', '', '', '0', '1', '1442588150', '1442588150', '1', '132', '52', '');
INSERT INTO `yershop_brand` VALUES ('13', 'lppz', '良品铺子', '', '', '', '', '0', '1', '1442588302', '1442588302', '1', '133', '52', '');
INSERT INTO `yershop_brand` VALUES ('14', 'dzph', '德州扒鹤', '', '', '', '', '0', '1', '1442588386', '1442588386', '1', '134', '57', '');
INSERT INTO `yershop_brand` VALUES ('15', 'AOC', '冠捷', '', '', '', '', '0', '1', '1442655509', '1442655509', '1', '135', '107', '');
INSERT INTO `yershop_brand` VALUES ('16', 'lenovo', '联想', '', '', '', '', '0', '1', '1442655587', '1442655587', '1', '136', '107', '');
INSERT INTO `yershop_brand` VALUES ('17', 'hp', '惠普打印', '', '', '', '', '0', '1', '1442655629', '1442655629', '1', '137', '107', '');
INSERT INTO `yershop_brand` VALUES ('18', 'leishen', '雷神', '', '', '', '', '0', '1', '1442655789', '1442655789', '1', '138', '107', '');
INSERT INTO `yershop_brand` VALUES ('19', 'acer', '宏碁', '', '', '', '', '0', '1', '1442655887', '1442655887', '1', '139', '107', '');
INSERT INTO `yershop_brand` VALUES ('20', 'samsung', '三星', '', '', '', '', '0', '1', '1442655930', '1442655930', '1', '140', '107', '');
INSERT INTO `yershop_brand` VALUES ('21', 'midea', '美的', '', '', '', '', '0', '1', '1442655970', '1442655970', '1', '141', '107', '');
INSERT INTO `yershop_brand` VALUES ('22', 'apple', '苹果', '', '', '', '', '0', '1', '1442656023', '1442656023', '1', '142', '107', '');
INSERT INTO `yershop_brand` VALUES ('23', 'flyco', '飞科', '', '', '', '', '0', '1', '1442656073', '1442656073', '1', '143', '107', '');
INSERT INTO `yershop_brand` VALUES ('24', 'blueair', '布鲁雅尔', '', '', '', '', '0', '1', '1442656143', '1442656143', '1', '144', '107', '');
INSERT INTO `yershop_brand` VALUES ('25', 'LG', 'LG', '', '', '', '', '0', '1', '1442656437', '1442656437', '1', '145', '107', '');
INSERT INTO `yershop_brand` VALUES ('26', 'chinaunicom', '联通', '', '', '', '', '0', '1', '1442656602', '1442656602', '1', '146', '107', '');

-- ----------------------------
-- Table structure for `yershop_cancel`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_cancel`;
CREATE TABLE `yershop_cancel` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '',
  `reason` varchar(225) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `assistant` int(10) unsigned NOT NULL DEFAULT '0',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0',
  `refuse_info` varchar(225) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `info` varchar(225) NOT NULL DEFAULT '',
  `parameters` varchar(225) NOT NULL DEFAULT '',
  `cash` decimal(50,2) NOT NULL DEFAULT '0.00',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
-- Records of yershop_cancel
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_category`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_category`;
CREATE TABLE `yershop_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `ismenu` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类是否调用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of yershop_category
-- ----------------------------
INSERT INTO `yershop_category` VALUES ('52', 'fruit', '食品饮料、酒类、生鲜', '0', '7', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1411925214', '1421425856', '1', '85', '1');
INSERT INTO `yershop_category` VALUES ('127', 'lizi', '梨', '57', '0', '10', '', '', '', '', '', '', '', '5', '5', '', '0', '1', '1', '0', '0', '', '', '1421503470', '1421503470', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('58', 'j_fruit', '进口水果', '52', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1411935041', '1421425884', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('56', 'notice', '公告', '0', '8', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '1', '', '\"\"', '1411929200', '1438934311', '1', '0', '3');
INSERT INTO `yershop_category` VALUES ('57', 'c_fruit', '国内水果', '52', '0', '10', '', '', '', '', '', '', '', '5', '2,5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1411934874', '1422719396', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('70', 'activity', '活动', '0', '0', '10', '', '', '', '', '', 'Help/detail', '', '2', '2', '2,1,3', '0', '1', '1', '0', '0', '', '\"\"', '1414338807', '1443652809', '1', '0', '3');
INSERT INTO `yershop_category` VALUES ('71', 'tushu', '图书、音像、数字商品', '0', '4', '10', '', '', '', '', '', '', '', '7', '7', '2', '0', '1', '1', '0', '0', '', '', '1414344085', '1420956824', '1', '86', '1');
INSERT INTO `yershop_category` VALUES ('72', 'xie', '珠宝、钟表', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674812', '1421415890', '1', '62', '1');
INSERT INTO `yershop_category` VALUES ('73', 'car', '整车、汽车用品', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674847', '1421388297', '1', '62', '1');
INSERT INTO `yershop_category` VALUES ('75', 'fushi', '男装、女装、鞋包', '0', '5', '10', '', '', '', '', '', '', '', '8', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1414674964', '1421391978', '1', '88', '1');
INSERT INTO `yershop_category` VALUES ('76', 'jiaju', '母婴、玩具乐器', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '\"\"', '1414675003', '1438934343', '1', '57', '1');
INSERT INTO `yershop_category` VALUES ('77', 'gmlc', '购买流程', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1415464640', '1415464640', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('126', 'apple', '苹果', '57', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1421502954', '1421502954', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('81', 'ebook', '电子书', '71', '0', '10', '', '', '', '', '', '', '', '7', '', '', '0', '1', '1', '0', '0', '', '', '1420956858', '1420956858', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('82', 'mianfei', '免费', '81', '0', '10', '', '', '', '', '', '', '', '7', '5', '2', '0', '1', '1', '0', '0', '', '', '1420956901', '1420956901', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('83', 'emusic', '数字音乐', '81', '0', '10', '', '', '', '', '', '', '', '7', '5', '2', '0', '1', '1', '0', '0', '', '', '1420959330', '1420960517', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('84', 'yinxiang', '  音像', '81', '0', '10', '', '', '', '', '', '', '', '7', '5', '2', '0', '1', '1', '0', '0', '', '', '1420960144', '1420960144', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('86', 'renwensheke', '人文社科', '71', '0', '10', '', '', '', '', '', '', '', '7', '5', '2', '0', '1', '1', '0', '0', '', '', '1420960622', '1420960622', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('87', 'history', '历史', '86', '0', '10', '', '', '', '', '', '', '', '7', '7', '2', '0', '1', '1', '0', '0', '', '', '1420960661', '1420960661', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('88', 'xinli', '心理学', '86', '0', '10', '', '', '', '', '', '', '', '7', '7', '2', '0', '1', '1', '0', '0', '', '', '1420960700', '1420960711', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('108', 'qingjie', '清洁', '106', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420963449', '1420963449', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('92', 'nvxie', '女鞋', '72', '0', '10', '', '', '', '', '', '', '', '8', '8', '2', '0', '1', '1', '0', '0', '', '', '1420961778', '1420961778', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('90', 'gex', '个护化妆', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2,1,3', '0', '1', '1', '0', '0', '', '', '1420961431', '1421388355', '1', '59', '1');
INSERT INTO `yershop_category` VALUES ('93', 'nvxue', '女靴', '92', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420961856', '1420961856', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('94', 'nanxie', '男鞋', '72', '0', '10', '', '', '', '', '', '', '', '8', '8', '2', '0', '1', '1', '0', '0', '', '', '1420961909', '1420961909', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('96', 'yundongxie', '运动鞋', '94', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962056', '1420962056', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('97', 'quanbuche', '全部整车', '73', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962156', '1420962156', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('98', 'xiaoxingche', '小型车', '97', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962208', '1420962208', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('99', 'nvbao', '女包', '72', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962320', '1420962320', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('100', 'danjianbao', '单肩包', '99', '0', '10', '', '', '', '', '', '', '', '5', '8', '2', '0', '1', '1', '0', '0', '', '', '1420962475', '1420962475', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('101', 'shoutibao', '手提包', '99', '0', '10', '', '', '', '', '', '', '', '5', '8', '2', '0', '1', '1', '0', '0', '', '', '1420962560', '1420962560', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('102', 'weixiubaoyang', '维修保养', '73', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962736', '1420962736', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('103', 'yunhuayou', '润滑油', '102', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420962815', '1420962815', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('109', 'dianchi', '电池', '105', '0', '10', '', '', '', '', '', '', '', '2,5', '6', '2', '0', '1', '1', '0', '0', '', '', '1420963534', '1421426883', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('104', 'shoujitx', '手机通信', '107', '0', '10', '', '', '', '', '', '', '', '5', '6', '2', '0', '1', '1', '0', '0', '', '', '1420963032', '1420963107', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('105', 'shoujipj', '手机配件', '107', '0', '10', '', '', '', '', '', '', '', '5', '6', '2', '0', '1', '1', '0', '0', '', '', '1420963151', '1420963151', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('106', 'mbhli', '面部护肤', '90', '0', '10', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '', '1420963200', '1420963200', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('107', 'sjsmtx', '手机、数码、通信', '0', '6', '10', '', '', '', '', '', '', '', '6', '6', '2', '0', '1', '1', '0', '0', '', '', '1420963286', '1421388202', '1', '87', '1');
INSERT INTO `yershop_category` VALUES ('110', 'mobilephone', '手机', '104', '0', '10', '', '', '', '', '', '', '', '6', '6', '2', '0', '1', '1', '0', '0', '', '\"\"', '1420963589', '1428684577', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('111', 'jiajujiaz', '家居、家具、家装', '0', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420963642', '1421388233', '1', '56', '1');
INSERT INTO `yershop_category` VALUES ('112', 'chuju', '厨具', '111', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420963698', '1420963698', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('113', 'prcju', '烹饪厨具', '112', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420963764', '1420963764', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('114', 'daojiancb', '刀剪菜板', '112', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420963850', '1420963850', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('115', 'nanzhuang', '男装', '75', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420964463', '1420964463', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('116', 'chenshan', '衬衫', '115', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420964510', '1420964510', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('117', 'nvzhuang', '女装', '75', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420964548', '1420964548', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('118', 'fushipj', '服饰配件', '75', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1420964671', '1420964671', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('119', 'zbss', '珠宝首饰', '75', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420964736', '1420964736', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('120', 'milk', '奶粉', '76', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420965368', '1420965391', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('121', 'yyfs', '营养辅食', '76', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420965451', '1420965451', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('122', 'dha', 'DHA', '121', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420965492', '1420965492', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('123', 'tyj', '太阳镜', '118', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420965553', '1420965553', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('124', 'clz', '车厘子', '58', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1420965600', '1420965600', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('128', 'ju', '橘', '57', '0', '10', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '', '1421503503', '1421503503', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('129', 'yurf', '羽绒服', '115', '0', '10', '', '', '', '', '', '', '', '8', '5', '2', '0', '1', '1', '0', '0', '', '', '1421591035', '1421591035', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('131', 'fpsm', '发票说明', '77', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423763497', '1423763497', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('132', 'yhqsm', '优惠券说明', '77', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423763557', '1423763557', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('133', 'psfs', '配送方式', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '', '0', '1', '1', '0', '0', '', '', '1423763793', '1423763793', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('134', 'peis', '配送方式', '133', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764073', '1423764073', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('135', 'psfy', '配送费用', '133', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764182', '1423764182', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('136', 'qsxz', '签收须知', '133', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764441', '1423764441', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('137', 'fwzc', '服务支持', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764507', '1423764507', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('138', 'fwbz', '服务保证', '137', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764556', '1423764556', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('139', 'shfw', '售后服务', '137', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764596', '1423764596', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('140', 'shwd', '售后网点', '137', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764648', '1423764648', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('141', 'ppfw', '品牌服务', '0', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764705', '1423764705', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('142', 'cjwt', '常见问题', '141', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764735', '1423764735', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('143', '相关下载', '相关下载', '141', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764766', '1423764766', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('144', 'lxwm', '联系我们', '141', '0', '10', '', '', '', '', '', '', '', '2', '2', '2', '0', '1', '1', '0', '0', '', '', '1423764794', '1423764807', '1', '0', '2');
INSERT INTO `yershop_category` VALUES ('145', 'tuangou', '团购', '0', '0', '10', '', '', '', 'Activity/tuan', '', '', '', '9', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1438711472', '1443642174', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('146', 'shangou', '闪购', '0', '0', '10', '', '', '', 'Activity/qgou', '', '', '', '10', '10', '2', '0', '1', '1', '0', '0', '', '\"\"', '1438834446', '1443642137', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('149', 'yuyue', '预约', '0', '0', '30', '', '', '', 'Activity/yuyue', '', '', '', '11', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1439135862', '1443642202', '1', '0', '0');
INSERT INTO `yershop_category` VALUES ('150', 'lysx', '粮油生鲜', '52', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442675312', '1442675312', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('151', 'ylnn', '饮料牛奶', '52', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442675533', '1442675533', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('152', 'xxsp', '休闲食品', '52', '0', '30', '', '', '', '', '', '', '', '5', '5', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442675864', '1442675864', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('153', 'djmj', '鼎极名酒', '52', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442742276', '1442946577', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('154', 'clyy', '潮流影音', '107', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442754697', '1442754697', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('155', 'divyj', 'DIV硬件', '107', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442754780', '1442754780', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('156', 'djyx', '电竞游戏', '107', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442754842', '1442754842', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('157', 'bgwl', '办公网络', '107', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442754922', '1442754922', '1', '0', '1');
INSERT INTO `yershop_category` VALUES ('158', 'ejem', '耳机耳麦', '154', '0', '30', '', '', '', '', '', '', '', '5', '', '2', '0', '1', '1', '0', '0', '', '\"\"', '1442771388', '1442771388', '1', '0', '1');

-- ----------------------------
-- Table structure for `yershop_channel`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_channel`;
CREATE TABLE `yershop_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_channel
-- ----------------------------
INSERT INTO `yershop_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `yershop_channel` VALUES ('2', '0', '团购', 'article/index?pid=145', '2', '1412872458', '1443114190', '1', '1');
INSERT INTO `yershop_channel` VALUES ('3', '0', '抢购', 'article/index?pid=146', '3', '1412872458', '1443114233', '1', '0');
INSERT INTO `yershop_channel` VALUES ('4', '0', '预约', 'article/index?pid=149', '4', '1439137405', '1443114259', '1', '0');

-- ----------------------------
-- Table structure for `yershop_comment`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_comment`;
CREATE TABLE `yershop_comment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(100) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `score` int(5) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `goodscore` int(5) unsigned NOT NULL DEFAULT '0',
  `servicescore` int(5) unsigned NOT NULL DEFAULT '0',
  `deliveryscore` int(5) unsigned NOT NULL DEFAULT '0',
  `content` varchar(225) DEFAULT NULL,
  `tag` varchar(225) DEFAULT NULL,
  `pics` varchar(225) NOT NULL DEFAULT '' COMMENT '图片',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-可见 -1-无效',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of yershop_comment
-- ----------------------------
-- ----------------------------
-- Table structure for `yershop_collect`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_collect`;
CREATE TABLE `yershop_collect` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `goodid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '店铺id',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `price` decimal(50,2) DEFAULT '0.00' COMMENT '价格',
  `type` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1-商品 -1-店铺',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '1-可见 -1-无效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收藏表';

-- ----------------------------
-- Table structure for `yershop_config`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_config`;
CREATE TABLE `yershop_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_config
-- ----------------------------
INSERT INTO `yershop_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'yershop商城系统', '0');
INSERT INTO `yershop_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '', '1');
INSERT INTO `yershop_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '', '8');
INSERT INTO `yershop_config` VALUES ('82', 'AUTO_SEND', '4', '是否自动发货', '6', '0:关闭自动发货\r\n1:开启自动发货\r\n', '是否开启自动发货', '1443118977', '1443119078', '1', '1', '0');
INSERT INTO `yershop_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `yershop_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `yershop_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `yershop_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `yershop_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `yershop_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `yershop_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1414272713', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统\r\n5:费用\r\n6:商城\r\n7:接口\r\n8:邮箱\r\n9:短信', '4');
INSERT INTO `yershop_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `yershop_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `yershop_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `yershop_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `yershop_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `yershop_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `yershop_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `yershop_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `yershop_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `yershop_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `yershop_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `yershop_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `yershop_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `yershop_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `yershop_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `yershop_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `yershop_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');
INSERT INTO `yershop_config` VALUES ('40', 'HOTSEARCH', '1', '热词', '1', '', '热门搜索词，必须逗号隔开', '1413221018', '1414964609', '1', '佳沃智利进口蓝莓,香蕉,苹果,香梨,红提', '0');
INSERT INTO `yershop_config` VALUES ('41', 'SHIPMONEY', '0', '运费', '5', '', '低于一定金额的运费', '1414001070', '1414001482', '1', '10', '0');
INSERT INTO `yershop_config` VALUES ('42', 'LOWWEST', '0', '最低消费金额', '5', '', '用户最低消费的金额，低于该金额，则增加运费', '1414001165', '1414001495', '1', '50', '0');
INSERT INTO `yershop_config` VALUES ('43', 'RATIO', '0', '积分现金兑换比', '5', '', '1000表示1000积分可兑换成1元', '1414153401', '1414153401', '1', '1000', '0');
INSERT INTO `yershop_config` VALUES ('44', 'DEADTIME', '0', '退货有效期', '5', '', '从订单签收完成多少天内可以退货', '1414164561', '1414164642', '1', '7', '0');
INSERT INTO `yershop_config` VALUES ('45', 'CHANGETIME', '1', '换货期', '5', '', '订单签收多少天内后可以换货', '1414164627', '1414164654', '1', '15', '0');
INSERT INTO `yershop_config` VALUES ('46', 'QQ', '1', 'QQ客服', '6', '', '网站客服的qq代码', '1414183635', '1414664781', '1', '1010422715', '0');
INSERT INTO `yershop_config` VALUES ('47', 'ALWW', '0', '阿里旺旺号', '6', '', '网站阿里旺旺客服', '1414183716', '1414664772', '1', '', '0');
INSERT INTO `yershop_config` VALUES ('48', 'IP_TONGJI', '4', '开启ip访问统计', '3', '0:关闭,1:开启', '开启后追踪用户的访问页面，访问明细，访问地域', '1414244159', '1414244270', '1', '1', '0');
INSERT INTO `yershop_config` VALUES ('49', 'LAG', '0', '统计时间间隔（小时）', '3', '', '重复访问的会员每隔多少时间统计，小于这一时间，不统计', '1414258358', '1414407504', '1', '6', '21');
INSERT INTO `yershop_config` VALUES ('50', 'DOMAIN', '1', '网站域名', '1', '', '网站域名', '1414504643', '1414504839', '1', 'http://localhost/b2c', '0');
INSERT INTO `yershop_config` VALUES ('51', '100KEY', '1', '0-快递100查询key', '7', '', '申请地址：http://www.kuaidi100.com/openapi/applyapi.shtml，用于查询运单号', '1414664721', '1415473565', '1', '', '0');
INSERT INTO `yershop_config` VALUES ('52', 'ADDRESS', '1', '发货地址', '6', '', '卖家的发货地址', '1414664871', '1414664871', '1', '广东广州', '0');
INSERT INTO `yershop_config` VALUES ('53', 'CONTACT', '1', '联系电话', '6', '', '卖家的联系方式', '1414664911', '1414664911', '1', '13645000000', '0');
INSERT INTO `yershop_config` VALUES ('54', 'SHOPNAME', '1', '卖家名称', '6', '', '卖家发货时填写的昵称', '1414665008', '1414665008', '1', '小米', '0');
INSERT INTO `yershop_config` VALUES ('55', 'SITENAME', '1', '网站名称', '1', '', '用于网站支付时显示，如土豆网', '1414761363', '1414761398', '1', 'yershop商城', '0');
INSERT INTO `yershop_config` VALUES ('56', 'ALIPAYPARTNER', '1', '1-支付宝商户号', '7', '', '这里是你在成功申请支付宝接口后获取到的PID', '1414769351', '1415137270', '1', '', '0');
INSERT INTO `yershop_config` VALUES ('57', 'ALIPAYKEY', '1', '支付宝密钥', '7', '', '这里是你在成功申请支付宝接口后获取到的Key', '1414769402', '1414769402', '1', '', '0');
INSERT INTO `yershop_config` VALUES ('67', 'TENPAYPARTNER', '1', '2-财付通合作者ID', '7', '', '合作者ID，财付通有该配置，开通财付通账户后给予', '1415472468', '1415473488', '1', '', '1');
INSERT INTO `yershop_config` VALUES ('66', 'TENPAYKEY', '1', '财付通加密key', '7', '', '加密key，开通财付通账户后给予', '1415472288', '1415473499', '1', '', '2');
INSERT INTO `yershop_config` VALUES ('68', 'PALPAYPARTNER', '1', '3-贝宝账号', '7', '', '合作者ID，贝宝有该配置，开通贝宝账户后给予不需密码', '1415472655', '1415473914', '1', '', '3');
INSERT INTO `yershop_config` VALUES ('69', 'YEEPAYPARTNER', '1', '4-易付宝合作者id', '7', '', '易付宝给予的合作者id', '1415472817', '1415473522', '1', '', '4');
INSERT INTO `yershop_config` VALUES ('64', 'ALIPAYEMAIL', '1', '支付宝收款账号', '7', '', '支付宝收款账号邮箱', '1415472043', '1415472347', '1', '', '0');
INSERT INTO `yershop_config` VALUES ('70', 'YEEPAYKEY', '1', '易付宝密钥', '7', '', '易付宝合作者的密钥', '1415473084', '1415473533', '1', '', '5');
INSERT INTO `yershop_config` VALUES ('71', 'KUAIQIANPARTNER', '1', '5-快钱合作者id', '7', '', '合作者ID，快钱有该配置，开通财付通账户后给予', '1415473241', '1415473540', '1', '', '5');
INSERT INTO `yershop_config` VALUES ('72', 'KUAIQIANKEY', '1', '快钱key', '7', '', '加密key，开通快钱账户后给予', '1415473293', '1415473553', '1', '', '5');
INSERT INTO `yershop_config` VALUES ('73', 'UNIONPARTNER', '1', '6-银联合作者账号', '7', '', '合作者ID，银联有该配置，开通银联账户后给予', '1415473364', '1415473424', '1', '223', '6');
INSERT INTO `yershop_config` VALUES ('74', 'UNIONKEY', '1', '银联key', '7', '', ' 加密key，开通银联账户后给予', '1415473475', '1415473475', '1', 'ddd', '6');
INSERT INTO `yershop_config` VALUES ('75', 'SCODE', '1', '授权码', '1', '', ' 商城的授权码', '1415473475', '1415473475', '1', '', '6');
INSERT INTO `yershop_config` VALUES ('76', 'MAIL_HOST', '1', 'smtp服务器的名称', '8', '', ' smtp服务器的名称，默认QQ', '1415473475', '1415473475', '1', '', '6');
INSERT INTO `yershop_config` VALUES ('77', 'MAIL_USERNAME', '1', '邮箱用户名', '8', '', ' 邮箱用户名', '1415473475', '1415473475', '1', '', '6');
INSERT INTO `yershop_config` VALUES ('78', 'MAIL_FROMNAME', '1', '发件人姓名', '8', '', ' 商城网站名称，如yershop商城，默认QQ', '1415473475', '1415473475', '1', '', '6');
INSERT INTO `yershop_config` VALUES ('79', 'MAIL_PASSWORD', '1', '邮箱密码', '8', '', ' 配置的邮箱密码', '1415473475', '1415473475', '1', '', '6');
INSERT INTO `yershop_config` VALUES ('80', 'SMSACCOUNT', '1', '1-互亿账号', '9', '', '申请地址：http://www.ihuyi.com/product.php', '1426339726', '1426340118', '1', '', '15');
INSERT INTO `yershop_config` VALUES ('81', 'SMSPASSWORD', '1', '互亿密码', '9', '', '互亿提供的密码', '1426339942', '1426340130', '1', '', '16');

-- ----------------------------
-- Table structure for `yershop_document`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document`;
CREATE TABLE `yershop_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `price` decimal(50,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(225) NOT NULL DEFAULT '' COMMENT '品牌',
  `sale` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `percent` varchar(100) NOT NULL DEFAULT '' COMMENT '购买率',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`) USING BTREE,
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of yershop_document
-- ----------------------------
INSERT INTO `yershop_document` VALUES ('5', '1', '', '金灯果（又名“姑娘果”）（盒装1000g）', '57', '', '0', '0', '5', '2', '4', '0', '15', '1', '0', '0', '2007', '0', '0', '0', '1411380420', '1428781408', '1', '16.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('8', '2', '', '【天天果园】智利青苹果12个', '57', '酸爽多汁，肉质细嫩，高品质新鲜保证', '0', '0', '5', '2', '2', '0', '7', '1', '0', '0', '935', '0', '0', '0', '1411927620', '1428781387', '1', '15.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('9', '2', '', '常鲜生 正宗菲律宾进口香蕉', '57', '', '0', '0', '5', '2', '4', '0', '9', '1', '0', '0', '443', '0', '0', '0', '1411928400', '1414533394', '1', '15.80', '21', '0', '');
INSERT INTO `yershop_document` VALUES ('14', '2', '', '褚橙开售', '57', '', '0', '0', '5', '2', '4', '0', '17', '1', '0', '0', '254', '0', '0', '0', '1414339080', '1414343243', '1', '15.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('15', '2', '', '河南河阴软籽石榴（中果） 4粒装（单果重250-300g）', '57', '', '0', '0', '5', '2', '0', '0', '20', '1', '0', '0', '209', '0', '0', '0', '1414342440', '1428781367', '1', '15.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('16', '2', '', '佳沃智利进口蓝莓一级果125g', '57', '', '0', '0', '5', '2', '0', '0', '21', '1', '0', '0', '300', '0', '0', '0', '1414342560', '1428781347', '1', '155.50', '', '0', '');
INSERT INTO `yershop_document` VALUES ('17', '2', '', '新疆红提950-1000g', '57', '', '0', '0', '5', '2', '0', '0', '24', '1', '0', '0', '550', '0', '0', '0', '1414342620', '1428781312', '1', '12.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('18', '2', '', '新疆库尔勒香梨 950g-1000g 香而清甜，虽小却好吃', '57', '', '0', '0', '5', '2', '0', '0', '23', '1', '0', '0', '424', '0', '0', '0', '1414342680', '1428781323', '1', '12.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('33', '2', '', '新疆阿克苏冰糖心苹果 3粒装', '128', '', '0', '0', '5', '2', '0', '0', '64', '1', '0', '0', '9', '0', '0', '0', '1421504275', '1421504275', '1', '16.60', '', '0', '');
INSERT INTO `yershop_document` VALUES ('32', '2', '', '延安宜川红富士 12粒装（70-75mm）', '128', '', '0', '0', '5', '2', '0', '0', '63', '1', '0', '0', '13', '0', '0', '0', '1421504074', '1421504074', '1', '12.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('34', '2', '', '新疆阿克苏冰糖心苹果 3粒装', '128', '', '0', '0', '5', '2', '0', '0', '64', '1', '0', '0', '13', '0', '0', '0', '1421504278', '1421504278', '1', '15.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('35', '2', '', '延安宜川红富士 12粒优品装（80mm）', '128', '', '0', '0', '5', '2', '0', '0', '65', '1', '0', '0', '13', '0', '0', '0', '1421504400', '1421504499', '1', '13.60', '', '0', '');
INSERT INTO `yershop_document` VALUES ('42', '1', '', '山东栖霞富士 2粒/470-500g', '126', '', '0', '0', '5', '2', '0', '0', '66', '1', '0', '0', '419', '0', '0', '0', '1421504820', '1428768653', '1', '8.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('43', '1', '', '浙江涌泉蜜桔 1.7-1.9kg', '128', '', '0', '0', '5', '2', '0', '0', '67', '1', '0', '0', '13', '0', '0', '0', '1421505175', '1421505175', '1', '9.30', '', '0', '');
INSERT INTO `yershop_document` VALUES ('44', '1', '', '广西金桔 500-550g', '128', '', '0', '0', '5', '2', '0', '0', '68', '1', '0', '0', '12', '0', '0', '0', '1421505360', '1421505438', '1', '22.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('46', '1', '', '亲亲自然（第1-4辑合集，共40册，国际化的华文幼儿科普品牌，为3-10岁孩子量身订做的自然教育专书，', '86', '', '0', '0', '7', '2', '0', '0', '89', '1', '0', '0', '55', '0', '0', '0', '1428674340', '1428674609', '1', '50.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('48', '1', '', 'HTC Desire 816T 移动4G手机 新渴望8 816t 安卓智能手机未拆封 正品行货 送：贴膜+手机套', '110', '', '0', '0', '6', '2', '0', '0', '91', '1', '0', '0', '54', '0', '0', '0', '1428674880', '1428687262', '1', '10010.00', 'htc', '0', '');
INSERT INTO `yershop_document` VALUES ('50', '1', '', 'lee限量款125周年101+男士牛仔夹克2015男士新款牛仔外套李牌男装正品 L12528C76G68', '115', '', '0', '0', '8', '2', '0', '0', '92', '1', '0', '0', '23', '0', '0', '0', '1428680400', '1428682597', '1', '349.00', 'LEE', '0', '');
INSERT INTO `yershop_document` VALUES ('51', '1', '', 'Lesmart 男士西装 条纹印花双扣休闲西服 修身西装', '115', '', '0', '0', '8', '2', '0', '0', '95', '1', '0', '0', '20', '0', '0', '0', '1428698940', '1428781171', '1', '1999.00', 'Lesmart', '0', '');
INSERT INTO `yershop_document` VALUES ('52', '1', '', '茵曼女装 夏装新款棉质撞色圆点欧根纱高腰连衣裙', '117', '', '0', '0', '8', '2', '0', '0', '96', '1', '0', '0', '41', '0', '0', '0', '1428699300', '1443500802', '1', '269.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('53', '1', '', '拉夏贝尔 夏款女装 个性垂荡领两件套纯色无袖衬衫 女 10005615', '117', '', '0', '0', '8', '2', '0', '0', '97', '1', '0', '0', '110', '0', '0', '0', '1428699660', '1428781209', '1', '100.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('54', '1', '', '苹果iPhone6 16G(金色) A1586公开版(MG492CH/A)', '110', '', '0', '0', '6', '2', '0', '0', '98', '1', '0', '0', '41', '0', '0', '0', '1428700320', '1428700496', '1', '5946.00', '苹果', '0', '');
INSERT INTO `yershop_document` VALUES ('55', '1', '', '【未拆封 送贴膜】华为 荣耀3C移动版 荣耀3C联通版 荣耀3C电信版', '110', '', '0', '0', '6', '2', '0', '0', '99', '1', '0', '0', '48', '0', '0', '0', '1428700740', '1443500779', '1', '575.00', '华为', '0', '');
INSERT INTO `yershop_document` VALUES ('56', '1', '', 'vivo X5Max移动4G手机 高通64位8核处理器 Hi-Fi音质', '110', '', '0', '0', '6', '2', '0', '0', '101', '1', '0', '0', '39', '0', '0', '0', '1428701270', '1428701270', '1', '2968.00', 'vivo ', '0', '');
INSERT INTO `yershop_document` VALUES ('57', '1', '', '【原封送高清贴膜 硅胶套】魅族（MEIZU）魅蓝note 4G手机 电信版', '110', '', '0', '0', '6', '2', '0', '0', '103', '1', '0', '0', '60', '0', '0', '0', '1428701640', '1443500754', '1', '999.00', 'MEIZU', '0', '');
INSERT INTO `yershop_document` VALUES ('58', '1', '', '〖原封包邮〗华为 荣耀 4X 移动 联通 电信 全网通 金', '110', '', '0', '0', '6', '2', '0', '0', '91', '1', '0', '0', '99', '0', '0', '0', '1428701940', '1443500727', '1', '955.00', '华为', '0', '');
INSERT INTO `yershop_document` VALUES ('59', '1', '', '三星(Samsung)N9008S Note3 移动4G手机 TD-LTE N9008s公开版', '110', '', '0', '0', '6', '2', '0', '0', '104', '1', '0', '0', '126', '0', '0', '0', '1428702420', '1428773844', '1', '2625.00', 'Samsung', '0', '');
INSERT INTO `yershop_document` VALUES ('60', '1', '', '爱国者618 双USB移动电源/充电宝10000毫安 白色', '105', '', '0', '0', '5', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1428774970', '1428774970', '3', '0.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('61', '1', '', '爱国者618 双USB移动电源/充电宝10000毫安 白色', '105', '', '0', '0', '5', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1428775004', '1428775004', '3', '0.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('63', '1', '', '爱国者618 双USB移动电源/充电宝10000毫安 白色', '105', '', '0', '0', '5', '2', '0', '0', '105', '1', '0', '0', '51', '0', '0', '0', '1428775200', '1428781563', '1', '59.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('64', '1', '', '    Masentek S30升级版 蓝牙耳机 黑色', '105', '', '0', '0', '5', '2', '0', '0', '107', '1', '0', '0', '41', '0', '0', '0', '1428775680', '1428781529', '1', '99.00', 'MasentekS30F', '0', '');
INSERT INTO `yershop_document` VALUES ('65', '1', '', '立体声双喇叭低音炮 骑士黑 空气壳 无', '105', '', '0', '0', '5', '2', '0', '0', '108', '1', '0', '0', '0', '0', '0', '0', '1428776904', '1428776904', '3', '268.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('66', '1', '', '立体声双喇叭低音炮 骑士黑 空气壳 无', '105', '', '0', '0', '5', '2', '0', '0', '108', '1', '0', '0', '48', '0', '0', '0', '1428776880', '1428781512', '1', '268.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('67', '1', '', '    联想（Lenovo）小新V2000 Bigger版 15.6英寸笔记本电脑全高清屏', '145', '', '0', '0', '5', '2', '0', '0', '109', '1', '0', '0', '78', '0', '0', '0', '1428779340', '1438754829', '-1', '5999.00', '    联想', '0', '');
INSERT INTO `yershop_document` VALUES ('68', '1', '', '魅族 MX4 16GB 灰色 移动4G手机', '110', '', '0', '0', '6', '2', '0', '0', '110', '1', '0', '0', '211', '0', '0', '0', '1428780240', '1428780606', '1', '17890.00', '魅族', '10', '0');
INSERT INTO `yershop_document` VALUES ('69', '1', '', ' 尚金装 真皮沙发组合沙发多人沙发', '111', '', '0', '0', '5', '2', '0', '0', '111', '1', '0', '0', '43', '0', '0', '0', '1428813300', '1428814110', '1', '1999.00', '组合沙发', '0', '');
INSERT INTO `yershop_document` VALUES ('74', '1', '', '联想（Lenovo）小新V2000 Bigger版 15.6英寸笔记本电脑全高清屏', '145', '', '0', '0', '9', '2', '0', '0', '109', '1', '1449705600', '0', '113', '0', '0', '0', '1438753680', '1443641417', '1', '8787.00', '联想', '0', '');
INSERT INTO `yershop_document` VALUES ('75', '1', '', '佐丹奴（Giordano）韩版潮流女士长款牛皮手包 WA014-01N 黑色', '146', '', '0', '0', '10', '2', '0', '0', '116', '1', '1450310400', '0', '180', '0', '0', '0', '1438834620', '1443153561', '1', '236.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('78', '1', '', '大神note3', '149', '【仅0.6mm厚度】【支持货到付款】【送钢化玻璃膜】【火热预售】【仅0.6mm厚度】【2G大内存】【1300w+500w】【全球首款千元指纹机】', '0', '0', '11', '2', '0', '0', '117', '1', '1448496000', '0', '135', '0', '0', '0', '1439137260', '1443114909', '1', '44444.00', '', '0', '');
INSERT INTO `yershop_document` VALUES ('79', '1', '', ' 拜亚动力（Beyerdynamic）DP100 HIFI入门级耳机', '158', '', '0', '0', '5', '2', '0', '0', '147', '1', '0', '0', '12', '0', '0', '0', '1442771640', '1443014160', '1', '88.00', '拜亚动力', '0', '');
INSERT INTO `yershop_document` VALUES ('80', '1', '', '良品铺子 沙拉薯条45g 休闲零食薯片香脆可口', '152', '', '0', '0', '5', '2', '0', '0', '149', '1', '0', '0', '0', '0', '0', '0', '1443640740', '1443640804', '1', '4.90', '良品铺子', '0', '');
INSERT INTO `yershop_document` VALUES ('81', '1', '', ' 斯凯奇（skechers）D\'lites秋季新品时尚运动跑步鞋', '146', '', '0', '0', '10', '2', '0', '0', '151', '1', '1455046440', '0', '0', '0', '0', '0', '1443641856', '1443641856', '1', '599.00', '斯凯奇', '0', '');
INSERT INTO `yershop_document` VALUES ('82', '1', '', '伊利 安慕希希腊风味酸牛奶常温酸牛奶礼', '151', '', '0', '0', '5', '2', '0', '0', '152', '1', '0', '0', '0', '0', '0', '0', '1443645493', '1443645493', '1', '56.00', '伊利', '0', '');
INSERT INTO `yershop_document` VALUES ('83', '1', '', '伊利 安慕希希腊风味酸牛奶常温酸牛奶礼', '150', '', '0', '0', '5', '2', '0', '0', '153', '1', '0', '0', '4', '0', '0', '0', '1443645838', '1443645838', '1', '39.90', '金龙鱼', '0', '');
INSERT INTO `yershop_document` VALUES ('84', '1', '', '伊利 安慕希希腊风味酸牛奶常温酸牛奶礼', '150', '', '0', '0', '5', '2', '0', '0', '153', '1', '0', '0', '0', '0', '0', '0', '1443645841', '1443645841', '3', '39.90', '金龙鱼', '0', '');
INSERT INTO `yershop_document` VALUES ('85', '1', '', '福佳（Hoegaarden） 白啤酒330ml 瓶装', '153', '', '0', '0', '5', '2', '0', '0', '154', '1', '0', '0', '13', '0', '0', '0', '1443646605', '1443646605', '1', '13.90', '福佳', '0', '');
INSERT INTO `yershop_document` VALUES ('86', '1', '', 'TP-LINK TL-WR886N 450M无线路由器', '155', '', '0', '0', '5', '2', '0', '0', '155', '1', '0', '0', '22', '0', '0', '0', '1443647444', '1443647444', '1', '99.00', 'TP-LINK ', '0', '');
INSERT INTO `yershop_document` VALUES ('87', '1', '', '元朗荣华', '70', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1443652755', '1443652755', '-1', '0.00', '', '0', '');

-- ----------------------------
-- Table structure for `yershop_document_article`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_article`;
CREATE TABLE `yershop_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of yershop_document_article
-- ----------------------------
INSERT INTO `yershop_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `yershop_document_article` VALUES ('70', '0', '45645654', '', '0');
INSERT INTO `yershop_document_article` VALUES ('72', '0', '<p>\r\n	Yershop是基于onethink内容管理框架、thinkphp3.2.3新版的综合性商城系统支持水果、服装、手机、图书等文档模型.具有建站便\r\n捷、扩展丰富、二次开发灵活,以及支持云服务的特点,适合thinkphp爱好者和企业使用。thinkphp是国产最流行的php框架，应用最为广泛。\r\nyershop是在onethink(带后台的thinkphp)的基础上开发的商城系统，使用mvc结构，控制器、模型、模板分离，具备了\r\nonethink各种优点，可以使用onethink各种模板标签、插件。yershop支持微信功能。yershop单用户版功能类似淘宝，支持确认收\r\n货，查看物流，查看订单。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	Yershop主要功能：短信发送、商品管理，文章管理，订单管理，退换货管理，支付管理，站内信管理、邮件管理、商品评价管理，咨询留\r\n言、邮件营销，在线付款，幻灯片模块，优惠券模块，团购模块，数据统计、会员系统，报表统计，图片上传，商品多图展示，ip访问统计，购物车，积分，售后\r\n功能， qq、微博登陆。\r\n</p>\r\n<p>\r\n	特色功能：内置邮件模块，快递模块，短信模块，在线支付模块,第三方登录模块\r\n</p>', '', '0');
INSERT INTO `yershop_document_article` VALUES ('76', '0', '5645', '', '0');
INSERT INTO `yershop_document_article` VALUES ('87', '0', 'dfhkkjj', '', '0');

-- ----------------------------
-- Table structure for `yershop_document_book`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_book`;
CREATE TABLE `yershop_document_book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `author` varchar(255) NOT NULL DEFAULT '1' COMMENT '作者',
  `content` text NOT NULL COMMENT '内容详细描述',
  `publisher` varchar(255) NOT NULL DEFAULT '' COMMENT '出版社',
  `publish_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '出版时间',
  `isbn` varchar(255) NOT NULL DEFAULT '' COMMENT 'isbn',
  `pages` varchar(255) NOT NULL DEFAULT '' COMMENT '页数',
  `formats` varchar(255) NOT NULL DEFAULT '' COMMENT '开本',
  `length` varchar(255) NOT NULL DEFAULT '' COMMENT '字数',
  `paper` varchar(255) NOT NULL DEFAULT '' COMMENT '纸张',
  `package` varchar(255) NOT NULL DEFAULT '' COMMENT '包装',
  `press_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '印刷时间',
  `press_number` varchar(255) NOT NULL DEFAULT '' COMMENT '印刷次数',
  `edition_number` varchar(255) NOT NULL DEFAULT '' COMMENT '版次',
  `parameters` varchar(255) NOT NULL DEFAULT '500' COMMENT '参数名称',
  `parameters_value` varchar(255) NOT NULL DEFAULT '1' COMMENT '参数值',
  `groupprice` varchar(255) NOT NULL DEFAULT '0' COMMENT '颜色',
  `pics` varchar(255) NOT NULL DEFAULT '0' COMMENT '图集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='图书模型表';

-- ----------------------------
-- Records of yershop_document_book
-- ----------------------------
INSERT INTO `yershop_document_book` VALUES ('46', '  台湾亲亲文化事业有限公司　', '<p>\r\n	　★华文幼儿科普第一品牌，台湾少儿科普最具魅力原创作品，一套集合生态学家、科学家、儿童文学家、教育学者、绘图画家和资深童书编辑的之力打造的大型科普巨制，深受数代人喜爱的自然宝典；版权输出到美国、英国、德国、瑞士、加拿大、韩国等十多个国家和地区。<br />\r\n<br />\r\n　　★既是自然图画书，也是主题教材；既有自然科学，也有人文与艺术；既用镜头说故事，也用美学造品位；既用创意带活动，更用爱心来教育；既是平面学习媒介，更是立体学习资源。被台湾众多的幼儿园作为教材使用。<br />\r\n<br />\r\n　　★曾获奖项与推荐：<br />\r\n　　※四次荣获台湾出版最高奖——金鼎奖；\r\n</p>\r\n<p>\r\n	五次获得金鼎奖推荐奖；<br />\r\n　　※台湾地区行政主管部门\"中小学优良课外读物推荐奖\"；<br />\r\n　　※两次获得\"小太阳\"最佳科学类出版奖、最佳编辑奖；<br />\r\n　　※先后36次获得\"好书大家读\"好书推荐奖；<br />\r\n　　※台北市政府优良杂志奖；<br />\r\n　　※中国时报开卷版最佳童书；<br />\r\n　　※中国时报《双周好书》活动推荐好书；<br />\r\n　　※信谊基金会幼儿推荐好书奖。\r\n</p>\r\n<br />', '  福建少年儿童出版社', '1398902400', '23463222', '', '', '', '', '', '0', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `yershop_document_clothe`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_clothe`;
CREATE TABLE `yershop_document_clothe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `color` varchar(255) NOT NULL DEFAULT '1' COMMENT '颜色',
  `content` text NOT NULL COMMENT '内容详细描述',
  `size` varchar(255) NOT NULL DEFAULT '' COMMENT '型号',
  `c_type` varchar(255) NOT NULL DEFAULT '' COMMENT '服装类型',
  `style` varchar(255) NOT NULL DEFAULT '' COMMENT '款式',
  `material` varchar(255) NOT NULL DEFAULT '' COMMENT '材质',
  `season` varchar(255) NOT NULL DEFAULT '' COMMENT '适应季节',
  `parameters` varchar(255) NOT NULL DEFAULT '500' COMMENT '参数名称',
  `parameters_value` varchar(255) NOT NULL DEFAULT '1' COMMENT '参数值',
  `groupprice` varchar(255) NOT NULL DEFAULT '0' COMMENT '颜色',
  `pics` varchar(255) NOT NULL DEFAULT '0' COMMENT '图集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='服装鞋包模型表';

-- ----------------------------
-- Records of yershop_document_clothe
-- ----------------------------
INSERT INTO `yershop_document_clothe` VALUES ('50', '白色、橙色、灰色', '<img src=\"http://img03.taobaocdn.com/imgextra/i3/2074479045/TB2DYbLXVXXXXc2XXXXXXXXXXXX-2074479045.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/2074479045/TB2OdfOXVXXXXa4XXXXXXXXXXXX-2074479045.jpg\" align=\"absmiddle\" />', 'x、xl、xxl', '夹克', '', '', '', '', '', '349、455、588', '0');
INSERT INTO `yershop_document_clothe` VALUES ('51', '白色、橙色、灰色、褐色、黑色、蓝色', '<table id=\"__01\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"2340\" width=\"780\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<a target=\"_blank\" href=\"http://shop.dangdang.com/store_clothes.php?sid=3937\"><img src=\"http://img56.ddimg.cn/39370005153357_y.jpg\" border=\"0\" height=\"293\" width=\"780\" /></a> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img src=\"http://img53.ddimg.cn/39370005153359_y.jpg\" border=\"0\" height=\"138\" width=\"780\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img src=\"http://img57.ddimg.cn/39370005153360_y.jpg\" border=\"0\" height=\"374\" width=\"780\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'm、l、xl', '西装', '', '', '', '', '', '', '0');
INSERT INTO `yershop_document_clothe` VALUES ('52', '白色、灰色', '<a target=\"_blank\" href=\"http://promo.dangdang.com/subject.php?pm_id=1369460\"><img id=\"n1\" src=\"http://img02.taobaocdn.com/imgextra/i2/130974249/TB2T_dPcpXXXXbLXXXXXXXXXXXX_%21%21130974249.jpg\" height=\"376\" border=\"0\" width=\"790\" /></a>', 'm、l、xl', '', '', '', '', '', '', '299、405、668', '0');
INSERT INTO `yershop_document_clothe` VALUES ('53', '白色、橙色、灰色、褐色、黑色、蓝色', '<table id=\"__01\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"1640\" width=\"990\">\r\n	<tbody>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n				<a href=\"http://shop.dangdang.com/16475\" target=\"_blank\"><img src=\"http://img51.ddimg.cn/164750004734528_y.jpg\" height=\"381\" width=\"990\" /></a> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n				<img src=\"http://img55.ddimg.cn/164750004734541_y.jpg\" height=\"62\" width=\"990\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<a href=\"http://v.dangdang.com/pn16475_2836_77.html\" target=\"_blank\"><img src=\"http://img50.ddimg.cn/164750004598644_y.jpg\" height=\"322\" width=\"251\" /></a> \r\n			</td>\r\n			<td>\r\n				<a href=\"http://v.dangdang.com/pn16475_2838_77.html\" target=\"_blank\"><img src=\"http://img58.ddimg.cn/164750004572218_y.jpg\" height=\"322\" width=\"245\" /></a> \r\n			</td>\r\n			<td>\r\n				<a href=\"http://v.dangdang.com/pn16475_2837_77.html\" target=\"_blank\"><img src=\"http://img52.ddimg.cn/164750004572219_y.jpg\" height=\"322\" width=\"246\" /></a> \r\n			</td>\r\n			<td>\r\n				<a href=\"http://v.dangdang.com/pn16475_2839_77.html\" target=\"_blank\"><img src=\"http://img57.ddimg.cn/164750004572220_y.jpg\" height=\"322\" width=\"248\" /></a> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n				<img src=\"http://img54.ddimg.cn/164750004614923_y.jpg\" height=\"80\" width=\"990\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\">\r\n				<img src=\"http://img58.ddimg.cn/164750004588316_y.jpg\" height=\"722\" width=\"990\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'x、xl、xxl', '', '', '', '', '', '', '', '0');

-- ----------------------------
-- Table structure for `yershop_document_download`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_download`;
CREATE TABLE `yershop_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of yershop_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_document_groupbuying`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_groupbuying`;
CREATE TABLE `yershop_document_groupbuying` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容',
  `market_price` varchar(255) NOT NULL COMMENT '市场价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yershop_document_groupbuying
-- ----------------------------
INSERT INTO `yershop_document_groupbuying` VALUES ('74', '<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t349/285/1951733059/183818/4d59d3b7/5448ca12N610faac0.jpg\" height=\"845\" width=\"750\" />', '56765');

-- ----------------------------
-- Table structure for `yershop_document_limitbuying`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_limitbuying`;
CREATE TABLE `yershop_document_limitbuying` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容',
  `market_price` varchar(255) NOT NULL COMMENT '市场价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yershop_document_limitbuying
-- ----------------------------
INSERT INTO `yershop_document_limitbuying` VALUES ('75', '<table class=\"ke-zeroborder\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"6\" width=\"750\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<p class=\"formwork_titleleft\">\r\n					佐丹奴 GIORDANO 女士长款牛皮手包\r\n				</p>\r\n				<p class=\"formwork_titleleft2\">\r\n					品牌：佐丹奴 GIORDANO<br />\r\n款式：钱包<br />\r\n颜色：黑色<br />\r\n材质：面料材质：牛剖层移膜皮革，里料材质：织物<br />\r\n规格：220*20*110mm左右(测量手法不同，请以实际收到货物为准)<br />\r\n重量：0.27kg左右<br />\r\n包装尺寸：222*22*112mm左右\r\n				</p>\r\n			</td>\r\n			<td>\r\n				<img src=\"http://img20.360buyimg.com/vc/jfs/t1456/200/72397750/34020/79e0b512/55547356N9c72dafa.jpg\" /> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div class=\"formwork_bt\" id=\"detail-tag-id-2\">\r\n	<div class=\"formwork_bt_rb\">\r\n		<span>产品展示</span> <span class=\"s2\">Products Exhibition</span> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1609/234/68619252/210313/5a2e19de/555473fcN93f1dec8.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1399/282/71631593/194292/daf81b0b/555473ffN863e3b3d.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1354/292/76112209/115911/1c1567a4/55547403Ncb0a628b.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1264/304/892931907/121375/b1a5f1e/55547406Nb4acacfe.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1552/326/70767504/102095/94b3249c/55547408N6b2ebe3b.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1054/62/888920056/71133/6ff2177d/5554740bN76790f1b.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t808/150/884517884/111703/be715820/55547410N950b883e.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1579/331/65928706/165464/b6093e82/55547414Nfc687ebd.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1069/159/882488171/214169/5050e6d1/55547417N89021277.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t868/173/747915899/188072/eb6eb3d4/5554741bN32b879f8.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<img src=\"http://img20.360buyimg.com/vc/jfs/t1003/85/873066753/154491/b972a6f3/5554741eN4b4b242b.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"formwork_bt\" id=\"detail-tag-id-14\">\r\n	<div class=\"formwork_bt_rb\">\r\n		<span>温馨提示</span> <span class=\"s2\">Kindly Remind</span> \r\n	</div>\r\n</div>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_text\">\r\n		<br />\r\n1、由于每台显示器色彩方案各不相同，我们无法保证买家电脑所显示的商品颜色与实际颜色完全一致；<br />\r\n2、由于每个人的测量手法不同，所量尺寸和实际的尺寸可能稍有误差，如发生实物与网页介绍稍有不符，请以收到实物为准。谢谢<br />\r\n	</div>\r\n</div>\r\n<div class=\"formwork_bt\" id=\"detail-tag-id-16\">\r\n	<div class=\"formwork_bt_rb\">\r\n		<span>保养方法</span> <span class=\"s2\">Maintenance</span> \r\n	</div>\r\n</div>\r\n<br />\r\n1、防止高温、雨淋、潮湿、重压、碰刮、放霉、酸、腐蚀性化学物品。<br />\r\n2、经常用干布抹金属配件，使其光亮，以防变色。<br />\r\n3、定期用皮革保护剂抹皮面，以保护皮件耐用。<br />\r\n4、防止本产品承受过大重量、容量。<br />', '456');
INSERT INTO `yershop_document_limitbuying` VALUES ('81', '<div class=\"p-parameter\">\r\n	<ul id=\"parameter2\" class=\"p-parameter-list\">\r\n		<li>\r\n			商品名称：斯凯奇（skechers）D\'lites秋季新品时尚运动跑步鞋女经典熊猫鞋99999938 黑色/白色 36\r\n		</li>\r\n		<li>\r\n			商品编号：1680101317\r\n		</li>\r\n		<li>\r\n			店铺： <a href=\"http://skechers.jd.com\" target=\"_blank\">skechers斯凯奇旗舰店</a>\r\n		</li>\r\n		<li>\r\n			上架时间：2015-08-27 15:07:42\r\n		</li>\r\n		<li>\r\n			商品毛重：500.00g\r\n		</li>\r\n		<li>\r\n			货号：99999938\r\n		</li>\r\n		<li>\r\n			人群：女士\r\n		</li>\r\n		<li>\r\n			上市时间：2015年秋季\r\n		</li>\r\n		<li>\r\n			选购热点：经典款\r\n		</li>\r\n		<li>\r\n			尺码：35，36，37，38，39\r\n		</li>\r\n		<li>\r\n			功能科技：避震，轻质\r\n		</li>\r\n		<li>\r\n			适合路面：跑道\r\n		</li>\r\n		<li>\r\n			场合：运动\r\n		</li>\r\n		<li>\r\n			闭合方式：系带\r\n		</li>\r\n	</ul>\r\n</div>\r\n<div id=\"J-detail-banner\">\r\n	<a id=\"p-cat-insert\" target=\"_blank\" href=\"http://c.nfa.jd.com/adclick?keyStr=z5AXFoIimt1jiDK32+w4mVFFlB61IxxBG0eEPjEEnp7sHIkFTbNkmTyYKWqGdc5pqm5DIpBUSHYlLtewfzAMwMxSyCaIe+qXw6KXzA+7y0FHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthakuJEi5ANPO/Il1ncbFic84l4VVDngSwdeGKwaEp76QOAZzMI/FNcIyqPvs7l7kzfgqwuiHO85wBSyA1FPeT/jgXBkyxapGKK0bayuRsyF1CjSHY0JSwCJdCXubq2wQCesktkSSOFA1pdGE/Iy7jQSEYQlCt5qtzWUNQR7nMClgnfA8pekfb4uNQnqgcfk9CP5w==&amp;cv=2.0&amp;url=http://sale.jd.com/act/iMYL0VJEuHNkzr.html\"><img alt=\"\" src=\"http://img30.360buyimg.com/da/jfs/t1900/120/333852295/135908/58547ea4/56022137N30479e74.jpg\" height=\"180\" width=\"990\" /></a>\r\n</div>\r\n<div id=\"J-detail-pop-tpl-top\">\r\n	<img src=\"http://img10.360buyimg.com/imgzone/jfs/t2167/363/339205119/96195/a63cef4e/5602b8d1N5db2bfdc.jpg\" alt=\"\" border=\"0\" />\r\n	<table id=\"__01\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"990\">\r\n		<tbody>\r\n			<tr>\r\n				<td colspan=\"5\">\r\n					<a href=\"http://item.jd.com/1640315379.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_01\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1600/222/1125283445/114763/d81567f4/55bb429fN78c89ef3.jpg\" alt=\"\" height=\"381\" width=\"990\" /></a>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1439899662.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_02\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1546/3/1124150294/16452/8d41f794/55bb42f1N8dbd3ebd.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1593967176.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_03\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1126/1/1396745289/15861/c6313797/55a4d3bbN44d8ed2c.jpg\" alt=\"\" height=\"199\" width=\"197\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1439811563.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_04\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1414/66/697798168/17054/b74cff5a/55a4d3bcN120dc4af.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1658605223.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_05\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1360/170/1067769120/11181/332fc44d/55bb429fN23fea3d5.jpg\" alt=\"\" height=\"199\" width=\"199\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1640530278.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_06\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1555/267/1129379970/12019/754b124d/55bb42a0N726724ac.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1364208918.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_07\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1531/289/1113977293/9920/38dc5bf1/55bb42a0N1848355b.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1589672820.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_08\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1390/171/693434492/12484/142224cc/55a4d3bdN3e2a6482.jpg\" alt=\"\" height=\"199\" width=\"197\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1439844259.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_09\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1663/60/494914705/13530/2373808a/55a4d3bdNdc998678.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1443755817.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_10\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1666/33/666458688/19610/1d2ba7de/55af8252N5819fedd.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n				<td>\r\n					<a href=\"http://item.jd.com/1643037123.html\" target=\"_blank\"><img id=\"x8fd0x52a8x978bx5173x8054_11\" src=\"http://img10.360buyimg.com/imgzone/jfs/t1456/262/845255254/16163/d3dc1a42/55af8253N5981fd9d.jpg\" alt=\"\" height=\"199\" width=\"198\" /></a>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"detail-correction\">\r\n	如果您发现商品信息不准确，<a href=\"http://club.360buy.com/jdvote/skucheck.aspx?skuid=1680101317&amp;cid1=1318&amp;cid2=12099&amp;cid3=9756\" target=\"_blank\">欢迎纠错</a> \r\n</div>', '899.00');

-- ----------------------------
-- Table structure for `yershop_document_phone`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_phone`;
CREATE TABLE `yershop_document_phone` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `system` varchar(255) NOT NULL DEFAULT '1' COMMENT '操作系统',
  `content` text NOT NULL COMMENT '内容详细描述',
  `nettype` varchar(255) NOT NULL DEFAULT '' COMMENT '网络制式',
  `screen` varchar(255) NOT NULL DEFAULT '' COMMENT '屏幕尺寸',
  `ram` varchar(255) NOT NULL DEFAULT '' COMMENT 'RAM容量',
  `rom` varchar(255) NOT NULL DEFAULT '' COMMENT 'ROM容量',
  `cpu_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'cpu型号',
  `cpu_frequency` varchar(255) NOT NULL DEFAULT '' COMMENT 'cpu频率',
  `battery_type` varchar(255) NOT NULL DEFAULT '' COMMENT '电池类型',
  `battery_capacity` varchar(255) NOT NULL DEFAULT '' COMMENT '电池容量',
  `stand_by_time` varchar(255) NOT NULL DEFAULT '' COMMENT '待机时间',
  `holding_time` varchar(255) NOT NULL DEFAULT '' COMMENT '通话时间',
  `phoneweight` varchar(255) NOT NULL DEFAULT '' COMMENT '手机重量',
  `sdcard` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展容量',
  `character` varchar(255) NOT NULL DEFAULT '0' COMMENT '功能特点',
  `camera_type` varchar(255) NOT NULL DEFAULT '' COMMENT '摄像头类型',
  `camera_before` varchar(255) NOT NULL DEFAULT '' COMMENT '前置摄像头像素',
  `camera_after` varchar(255) NOT NULL DEFAULT '' COMMENT '后置摄像头像素',
  `sensor_type` varchar(255) NOT NULL DEFAULT '' COMMENT '传感器类型',
  `flashlight` varchar(255) NOT NULL DEFAULT '0' COMMENT '闪光灯',
  `apeture` varchar(255) NOT NULL DEFAULT '0' COMMENT '光圈',
  `color` varchar(255) NOT NULL DEFAULT '0' COMMENT '颜色',
  `launch_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上市时间',
  `parameters` varchar(255) NOT NULL DEFAULT '500' COMMENT '参数名称',
  `parameters_value` varchar(255) NOT NULL DEFAULT '1' COMMENT '参数值',
  `groupprice` varchar(255) NOT NULL DEFAULT '0' COMMENT '颜色',
  `pics` varchar(255) NOT NULL DEFAULT '0' COMMENT '图集',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='手机模型表';

-- ----------------------------
-- Records of yershop_document_phone
-- ----------------------------
INSERT INTO `yershop_document_phone` VALUES ('48', '', '<p style=\"text-align:center;\">\r\n	<span style=\"font-size:8pt;\">官方标配：机头×1充电头×1USB数据线×1快速入门指南×1售后服务手册×1手机真伪鉴别提示卡×1标准配件清单 × 1</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color:#FF0000;font-size:8pt;\">温馨提示：本商品同一ID仅限一件。同一ID,同一收货地址多次下单，本店拒绝发货，谢谢理解！！<br />\r\n</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"http://g-ec4.images-amazon.com/images/G/28/aplus_rbs/C6587-20140307-816-01.jpg\" /> \r\n</p>', ' 移动2G/联通2G（GSM） 　移动4G（TD-LTE ）', '5.5寸', '1.5G', '8G', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '白色、橙色、灰色', '1391443200', '套餐', '套餐1、套餐2、套餐3', '999、1555、2588', '91');
INSERT INTO `yershop_document_phone` VALUES ('49', '', '1231<br />', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '0');
INSERT INTO `yershop_document_phone` VALUES ('54', 'ios', '<div class=\"right_title1\">\r\n	精美图片\r\n</div>\r\n<img src=\"http://img30.ddimg.cn/imgother/201410/14_0/20141014114113700.jpg\" />', '', '5.5寸', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '尺寸', '4.7寸、5.5寸', '4999、5555', '98');
INSERT INTO `yershop_document_phone` VALUES ('55', 'Android（安卓）', '<img src=\"http://img58.ddimg.cn/47700005016349_y.jpg\" height=\"580\" width=\"960\" /> \r\n<div class=\"right_title1\">\r\n	详情\r\n</div>\r\n<p>\r\n	<span style=\"font-size:18pt;\">官方标配配&nbsp;：主机，原装电池(2300毫安），充电头，数据线，保修</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18pt;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18pt;\">卡，说明书，包装盒</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18pt;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img src=\"http://d6.yihaodianimg.com/N00/M08/21/8C/CgQCtlKwKbmADZHQAAD3RbkMurg28700.jpg\" class=\"blogimg\" />', '移动2G/联通2G（GSM） 　移动3G（TD-SCDMA） ', '5.5寸', '1.5G', '4G', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '白色、橙色、灰色', '0', '套餐', '套餐1、套餐2、套餐3、套餐4、套餐5、套餐6', '535、555、588、999、1555、2588', '100');
INSERT INTO `yershop_document_phone` VALUES ('56', 'Android（安卓）', '<img src=\"http://img10.360buyimg.com/imgzone/jfs/t460/14/1270028622/223817/709c7af0/54c5fb12N3f339a07.jpg\" /><br />', '移动2G/联通2G（GSM） 　移动4G（TD-LTE ） 　移动3G（TD-SCDMA） 　', '5.0英寸及以上', '2G', '2G', '', '八核及以上CPU', '', '', '', '', '', '', '', '', '', '', '', '', '', '白色、香槟金', '0', '', '', '', '102');
INSERT INTO `yershop_document_phone` VALUES ('57', '', '<div style=\"text-align:left;\">\r\n	<span style=\"font-size:14pt;color:#ff0000;\">官方标配：魅蓝note手机主机×1USB数据线×1电源适配器×1SIM卡顶针×1保修证×1<br />\r\n套餐一：官方标配 <span>高品质国产耳机</span><br />\r\n套餐二：<span>官方标配 <span>8000毫安移动电源</span></span><br />\r\n套餐三：<span>官方标配 </span><span>8000毫安移动电源<span> </span><span>高品质国产耳机</span></span></span> \r\n</div>\r\n<div style=\"text-align:left;\">\r\n	<img src=\"http://img20.360buyimg.com/vc/jfs/t703/232/243175747/103516/a83eb7da/54991544N8477779f.jpg\" /> \r\n</div>\r\n<div>\r\n	<img src=\"http://img20.360buyimg.com/vc/jfs/t469/190/898061167/79910/f24f3b41/54991549N49df605b.jpg\" /> \r\n</div>', '', '', '', '', '', '', '不可拆卸', '3140毫安', '', '', '', '', '', '', '1300w', '1300w', '', '', '', '白色、橙色、灰色、褐色、黑色、蓝色', '0', '套餐', '套餐1、套餐2、套餐3、套餐4', '935、955、988、999、1555、2588', '0');
INSERT INTO `yershop_document_phone` VALUES ('58', 'Android（安卓）', '<p>\r\n	<img src=\"http://img52.ddimg.cn/158040004768938.jpg\" /> \r\n</p>\r\n<p>\r\n	<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> \r\n</p>\r\n<img src=\"http://img04.taobaocdn.com/imgextra/i4/1777180618/TB2nK2EbpXXXXXPXpXXXXXXXXXX_%21%211777180618.jpg\" align=\"absmiddle\" />', '', '5.5寸', '2G', '8G', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '白色、橙色、灰色', '0', '套餐', '套餐1、套餐2、套餐3、套餐4、套餐5、套餐6', '535、555、588、999、1555、2588', '0');
INSERT INTO `yershop_document_phone` VALUES ('59', '', '<p style=\"text-align:center;\">\r\n	<span style=\"font-size:12pt;\"><strong>官方标配：主机*1锂电池*1数据线*1耳机*1充电器*1SPen手写笔*1说明书*1保修卡*1</strong></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:12pt;color:#ff0000;\"><strong>温馨提示：本商品同一ID仅限一件。同一ID,同一收货地址多次下单，本店拒绝发货，谢谢理解！！<br />\r\n</strong></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-size:12pt;\"><strong><img src=\"http://img20.360buyimg.com/vc/g13/M00/16/0F/rBEhVFMHBKQIAAAAAAH-GWXi5QoAAI29AFDVMUAAf4x187.jpg\" class=\"err-product\" /><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<div class=\"formwork\">\r\n	<div class=\"formwork_titleleft\">\r\n		<span style=\"font-size:12pt;\"><strong>支持TD-LTE 4G网络</strong></span> \r\n	</div>\r\n	<div class=\"formwork_text\">\r\n		<span style=\"font-size:12pt;\"><strong>4G疾速服务起航美好生活N9008S支持4G网络，让您畅享移动过程中的疾速联网服务。无论是在线观看高清视频，还是传送大容量文件，都会让您体验到前所未有的疾速快感。</strong></span> \r\n	</div>\r\n</div>', '移动2G/联通2G（GSM） 　移动4G（TD-LTE ） 　移动3G（TD-SCDMA）', '5.0英寸及以上', '3G', '16G', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '白色、橙色、灰色', '0', '套餐', '套餐1、套餐2、套餐3、套餐4', '935、955、988、999', '0');
INSERT INTO `yershop_document_phone` VALUES ('68', '', '<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t430/76/3779470/125368/b2cdbe74/54058d77N2a3827fa.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t877/281/12223021/373552/ed32465/54dca505Ne8a58e5d.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t430/76/3779470/125368/b2cdbe74/54058d77N2a3827fa.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t877/281/12223021/373552/ed32465/54dca505Ne8a58e5d.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t430/76/3779470/125368/b2cdbe74/54058d77N2a3827fa.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t877/281/12223021/373552/ed32465/54dca505Ne8a58e5d.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t430/76/3779470/125368/b2cdbe74/54058d77N2a3827fa.jpg\" /> \r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t877/281/12223021/373552/ed32465/54dca505Ne8a58e5d.jpg\" /> \r\n</div>', '', '5.5寸', '', '16G', '', '八核及以上CPU', '', '', '', '', '', '', '', '', '', '', '', '', '', '白色、橙色、灰色', '0', '选择版本', '32GROM、16GROM、双4G版(16GROM）', '2268.00、29299、22296、29229', '0');

-- ----------------------------
-- Table structure for `yershop_document_product`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_product`;
CREATE TABLE `yershop_document_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `marketprice` varchar(255) NOT NULL DEFAULT '1' COMMENT '市场价',
  `content` text NOT NULL COMMENT '内容详细描述',
  `parameters` varchar(255) NOT NULL DEFAULT '500' COMMENT '参数名称',
  `parameters_value` varchar(255) NOT NULL COMMENT '参数值',
  `area` varchar(255) NOT NULL DEFAULT '中国大陆' COMMENT '产地',
  `groupprice` varchar(255) NOT NULL DEFAULT '' COMMENT '组合价格',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '附加标签',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '关联商品',
  `stock` int(10) unsigned NOT NULL DEFAULT '9999' COMMENT '库存',
  `shorttitle` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简称',
  `pics` varchar(255) NOT NULL DEFAULT '' COMMENT '图集',
  `ads_pic_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '广告图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
-- Records of yershop_document_product
-- ----------------------------
INSERT INTO `yershop_document_product` VALUES ('5', '20.98', '<p style=\"background:white;text-align:left;\" align=\"left\">\r\n	<br />\r\n</p>\r\n<span><span style=\"font-size:14.0pt;font-family:宋体;\"></span></span> \r\n<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n	<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n</p>\r\n<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/025.jpg\" style=\"width:700px;\" /> \r\n	<div class=\"tal\" style=\"text-align:left;\">\r\n		&nbsp;\r\n	</div>\r\n<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/01p.jpg\" style=\"width:700px;\" /> \r\n	<div class=\"tal\" style=\"text-align:left;\">\r\n		&nbsp;\r\n	</div>\r\n<img src=\"http://image3.benlailife.com/ProductNewDetailImage/0102021623C/93p.jpg\" style=\"width:700px;\" /> \r\n</div>\r\n<br />', '重量', '1000g、2000g、3000g', '中国大陆', '349、455、588', '2', '8、9、42、43、44', '1', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('14', '1.00', '<div class=\"box990\" id=\"layoutContent\" style=\"margin:0px auto;padding:0px;border:none;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"zt_gz\" id=\"container\" style=\"margin:0px;padding:0px;border:none;background-color:#FFFFFF;\">\r\n		<div class=\"gz_banner carousel\" id=\"fader_container\" style=\"margin:0px;padding:0px;border:none;\">\r\n			<ul class=\"main contents\" id=\"fader\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list content\" id=\"toLegend\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/gz/special/chucheng/lunbo03.jpg\" /></a> \r\n				</li>\r\n			</ul>\r\n			<ul class=\"fader_nav\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list\" id=\"prev\" style=\"vertical-align:bottom;\">\r\n				</li>\r\n				<li class=\"list\" id=\"next\" style=\"vertical-align:bottom;\">\r\n				</li>\r\n			</ul>\r\n			<ul class=\"main cc_nav\" id=\"nav\" style=\"vertical-align:bottom;\">\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_01_on.jpg\" /></a> \r\n				</li>\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_02.jpg\" /> \r\n				</li>\r\n				<li class=\"list\" style=\"vertical-align:bottom;\">\r\n					<a><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/nav/cc_nav_03.jpg\" /></a> \r\n				</li>\r\n			</ul>\r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;border:none;\">\r\n			<div class=\"sku\" style=\"margin:0px;padding:0px;border:none;\">\r\n				<ul class=\"main\" id=\"sale\" style=\"vertical-align:bottom;\">\r\n					<li class=\"zcode list relative\" style=\"vertical-align:bottom;\">\r\n						<a href=\"http://www.benlai.com/item-39458.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_02.jpg\" /></a><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_03.jpg\" /> \r\n						<div class=\"cc_buy button right\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"39458_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list relative\" style=\"vertical-align:bottom;\">\r\n						<a href=\"http://www.benlai.com/item-39459.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_04.jpg\" /></a><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_05.jpg\" /> \r\n						<div class=\"cc_buy button left\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"39459_addCart\" /> \r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n			<div class=\"cc_des\" style=\"margin:0px;padding:0px;border:none;\">\r\n				<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/shps.jpg\" width=\"990\" height=\"450\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_06.jpg\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_07.jpg\" /><img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_08.jpg\" /><img class=\"cc_section\" src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/cc_shop_10.jpg\" /> \r\n			</div>\r\n			<div class=\"sku cc_sp_shop\" style=\"margin:0px;padding:0px;border:none;background-color:#F49626;\">\r\n				<p class=\"title\">\r\n					<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/images/spt_12.jpg\" /> \r\n				</p>\r\n				<div class=\"cframe\" style=\"margin:0px 20px 20px;padding:0px;border:none;\">\r\n					<ul class=\"sp_nav\" style=\"vertical-align:bottom;\">\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/ytl_on.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/zxg.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sml.jpg\" /> \r\n						</li>\r\n						<li class=\"list\" style=\"vertical-align:bottom;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/nav/sn.jpg\" /> \r\n						</li>\r\n					</ul>\r\n					<ul class=\"contents\" style=\"vertical-align:bottom;background-color:#FFFFFF;\">\r\n						<li class=\"list content relative page\" style=\"vertical-align:bottom;\">\r\n							<a href=\"http://www.benlai.com/item-37672.html\" target=\"_blank\"><img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/p1.jpg\" /></a> \r\n							<div class=\"ft_buy\" style=\"margin:0px;padding:0px;border:none;\">\r\n								<ul class=\"select_box\" style=\"vertical-align:bottom;\">\r\n									<li class=\"list button\" style=\"vertical-align:bottom;\">\r\n										<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/2p_on.jpg\" /> \r\n									</li>\r\n									<li class=\"list button\" style=\"vertical-align:bottom;\">\r\n										<img src=\"http://image.benlailife.com/images/bj/special/2014chucheng/4p.jpg\" /> \r\n									</li>\r\n								</ul>\r\n								<ul class=\"shop_box\" style=\"vertical-align:bottom;\">\r\n									<li class=\"list\" style=\"vertical-align:bottom;\">\r\n										<p class=\"price p_rose\" style=\"font-family:\'Microsoft YaHei\';font-size:24px;color:#F83A5E;\">\r\n											￥11.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;\">￥20.00</span> \r\n										</p>\r\n										<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n											<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"37672_addCart\" /> \r\n										</div>\r\n									</li>\r\n									<li class=\"list\" style=\"vertical-align:bottom;\">\r\n										<p class=\"price p_rose\" style=\"font-family:\'Microsoft YaHei\';font-size:24px;color:#F83A5E;\">\r\n											￥18.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;\">￥40.00</span> \r\n										</p>\r\n										<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n											<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_shop.gif\" id=\"36937_addCart\" /> \r\n										</div>\r\n									</li>\r\n								</ul>\r\n							</div>\r\n						</li>\r\n					</ul>\r\n				</div>\r\n			</div>\r\n			<div class=\"sku\" style=\"margin:0px 0px 60px;padding:0px;border:none;\">\r\n				<ul class=\"main\" style=\"vertical-align:bottom;\">\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-39442.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							新疆姬娜果4粒装（单果重90-100g）\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥5.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥10.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"39442_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-27683.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							进口牛油果 4粒\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥35.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥78.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"27683_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-10432.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							台湾红宝石葡萄柚\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥28.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥38.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"10432_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15307.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							浙江涌泉蜜桔 1.7-1.9kg\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥38.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥55.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15307_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-38262.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							四川红阳红心猕猴桃（小果） 8粒装\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥28.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥36.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"38262_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6536.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							爽口源兰州百合150g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥18.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥19.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6536_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6682.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来精选c云南鲜毛豆 400g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥10.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥14.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6682_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-8533.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							陈集山药（鸡皮糙）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥15.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥16.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"8533_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-27.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							斋堂鲜蘑菇拼盘\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥17.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"27_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-3153.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来精选——绿芦笋300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥20.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥23.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"3153_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15656.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							OMEGA 新西兰青口贝 1000g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥78.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15656_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19587.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							原装进口厄瓜多尔白虾50/60 2000g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥168.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥268.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19587_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19889.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来专供 速冻阿拉斯加真鳕切身 （生制）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥39.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥62.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19889_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25845.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							【独家销售】南极磷虾 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥18.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥25.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25845_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4758.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							九洋无公害生态深海养殖 三去大黄鱼 450g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥36.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥49.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4758_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6246.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							林地散养柴鸡蛋24枚\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥35.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥42.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6246_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-9209.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							Kerchin科尔沁肉筋 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥29.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥35.90</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"9209_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-32393.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							华北小笋鸡250g-350g*2\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥15.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥43.60</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"32393_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25437.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							荷美尔出口备案冻前尖500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥19.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥26.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25437_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-7926.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							Kerchin科尔沁肥牛 400克\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥36.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥51.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"7926_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-38159.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							【特别推荐】云南艾爱全脂巴氏水牛乳500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥9.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥22.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"38159_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-37167.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							贝儿榴莲飘香蛋糕330g-家庭装\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"37167_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-7444.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							百吉福棒棒奶酪（原味）500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥48.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥59.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"7444_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-15775.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							红炉磨坊葡萄干核桃面包（粗粮） 300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥23.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥27.60</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"15775_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-793.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							万得妙含糖酸牛奶500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥11.60<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥15.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"793_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-719.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							伯爵特级初榨橄榄油500ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥69.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"719_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6690.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							本来生活有机红小豆（红豆）360g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥9.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥12.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"6690_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-24389.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							响中王响水村自产大米2500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥82.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"24389_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4048.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							竹里馆临安特产天目山野生石笋干250g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥25.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4048_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-33796.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							长白山黑木耳125g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥21.50<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥28.50</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"33796_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-4159.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							广东温氏好味鸡咸香盐焗鸡600g-800g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥33.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥52.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"4159_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-28102.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							百饺园家常猪肉三鲜水饺300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥13.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥17.20</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"28102_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-23882.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							荷美尔Hormel 超值鲜嫩火腿片135g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥14.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"23882_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21778.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							乐世小厨培根抓饼精装5片600g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥10.90<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥17.90</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21778_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-25866.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							天福号 蛋卷300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥19.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"25866_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-16606.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							德国迈森蜂蜜小栈纯蜂蜜—洋槐花蜂蜜500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥63.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥126.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"16606_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-19891.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							阿鲁司滇红茶15g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥8.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥23.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"19891_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-10542.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							法国（巴黎）含气柠檬味饮料330ml*4\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥32.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥48.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"10542_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6883.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							澳洲奔富酒园洛神山庄梅洛红葡萄酒750ml\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥49.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥98.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"6883_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-22336.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							KEO凯莉欧100%橙汁1L(塞浦路斯进口) 真正纯橙汁\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥11.40<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥22.80</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"22336_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-35043.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							7Best大象芒果干100g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"35043_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-24780.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							吃货榴莲干90g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							<img src=\"http://image1.benlailife.com/Content/images/no2.gif?v=8.2.47\" /><span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_back.gif\" id=\"24780_back\" class=\"defbutton\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-6739.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							昆仑山和田玉枣六星 500g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥64.30<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"6739_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21306.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							阿胶金丝枣180g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥12.80<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\"></span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21306_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<a href=\"http://www.benlai.com/item-21304.html\" target=\"_blank\"></a> \r\n						<p class=\"name\" style=\"font-family:\'Microsoft YaHei\';font-size:16px;\">\r\n							桃花姬阿胶糕300g\r\n						</p>\r\n						<p class=\"price normal-price-text p_orange\" style=\"font-family:\'Microsoft YaHei\';font-size:20px;color:#FF9472;font-weight:bold;\">\r\n							￥119.00<span class=\"Concrete-grey\" style=\"color:#A1A1A1;text-decoration:line-through;font-size:14px;font-weight:300;\">￥158.00</span> \r\n						</p>\r\n						<div class=\"button\" style=\"margin:5px auto;padding:0px;border:none;\">\r\n							<img src=\"http://image.benlailife.com/images/gz/special/2014chuchengyushou_syhd/bt_add.jpg\" id=\"21304_addCart\" /> \r\n						</div>\r\n					</li>\r\n					<li class=\"zcode list col5 htyanimate\" style=\"vertical-align:bottom;text-align:center;\">\r\n						<div>\r\n							<br />\r\n						</div>\r\n					</li>\r\n				</ul>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '500', '0', '中国大陆', '', '', '8、9、42、43、44', '1', '褚橙', '', '0');
INSERT INTO `yershop_document_product` VALUES ('8', '10.00', '<div id=\"J_DcTopRightWrap\" style=\"margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;\">\r\n	<div id=\"J_DcTopRight\" class=\"J_DcAsyn tb-shop\" style=\"margin:0px;padding:0px;\">\r\n		<div class=\"J_TModule\" id=\"shop8751140001\" style=\"margin:0px;padding:0px;\">\r\n			<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin:0px;padding:0px;\">\r\n				<div class=\"skin-box-bd clear-fix\" style=\"margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;\">\r\n					<span> \r\n					<p>\r\n						<img src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/TB2oT.ZapXXXXaxXXXXXXXXXXXX-738580955.jpg_.webp\" /> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class=\"skin-box-bt\"><b></b></s> \r\n			</div>\r\n		</div>\r\n		<div class=\"J_TModule\" id=\"shop8825085575\" style=\"margin:0px;padding:0px;\">\r\n			<div class=\"skin-box tb-module tshop-pbsm tshop-pbsm-shop-self-defined\" style=\"margin:0px;padding:0px;\">\r\n				<s class=\"skin-box-tp\"><b></b></s> \r\n				<div class=\"skin-box-bd clear-fix\" style=\"margin:0px;padding:0px;border:0px solid #FFFFFF;color:#828282;background:none;\">\r\n					<span> \r\n					<p>\r\n						<a href=\"http://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.UoC3cM&id=35904185523&scene=taobao_shop\" target=\"_blank\"><img src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/TB2AEVlaFXXXXbOXXXXXXXXXXXX-738580955.jpg_.webp\" /></a> \r\n					</p>\r\n</span> \r\n				</div>\r\n<s class=\"skin-box-bt\"><b></b></s> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div id=\"description\" class=\"J_DetailSection tshop-psm tshop-psm-bdetaildes\" style=\"margin:0px;padding:0px;color:#404040;font-family:tahoma, arial, 微软雅黑, sans-serif;background-color:#FFFFFF;\">\r\n	<div class=\"content ke-post\" style=\"margin:10px 0px 0px;padding:0px;font-size:14px;font-family:tahoma, arial, 宋体, sans-serif;\">\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span><span style=\"font-weight:700;\"><span style=\"font-size:18px;\">智利青苹果</span></span><br />\r\n</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<p>\r\n				<span><span style=\"font-weight:700;\"><img class=\"ke_anchor\" id=\"ids-tag-m-35171\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" />产品简介</span><br />\r\n智利苹果色泽艳丽，颜色从青绿到浅绿都有，也可能会略带粉红色。口感上则相当酸，是喜欢酸味朋友们的大爱，爽脆多汁，口味鲜美，吃法较多。&nbsp;</span> \r\n			</p>\r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span><span style=\"font-weight:700;\">温馨提示</span><br />\r\n</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span>此款产地为智利。</span> \r\n		</div>\r\n		<div style=\"margin:0px;padding:0px;\">\r\n			<span>冰箱冷藏保存时间会更久，保存时表皮不要沾水。苹果皮中含有丰富营养素，建议连皮一起吃。</span> \r\n			<p>\r\n				<img src=\"http://img02.taobaocdn.com/imgextra/i2/738580955/T2zOhCXfdOXXXXXXXX-738580955.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2Zz1aXXtdXXXXXXXX-738580955.jpg\" align=\"absmiddle\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/738580955/T2VPCuXc4cXXXXXXXX-738580955.jpg\" align=\"absmiddle\" /><img src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2ZwXBXl8NXXXXXXXX-738580955.jpg\" align=\"absmiddle\" /> \r\n			</p>\r\n			<p>\r\n				<img src=\"http://img04.taobaocdn.com/imgextra/i4/738580955/T2MmJyXi0OXXXXXXXX-738580955.jpg_.webp\" align=\"absmiddle\" /><img class=\"ke_anchor\" id=\"ids-tag-m-35173\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" /><img src=\"http://img01.taobaocdn.com/imgextra/i1/738580955/T2yn4DXj8OXXXXXXXX-738580955.jpg_.webp\" align=\"absmiddle\" /> \r\n			</p>\r\n		</div>\r\n		<p>\r\n			<img class=\"ke_anchor\" id=\"ids-tag-m-35176\" src=\"http://a.tbcdn.cn/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"height:1px;\" /><img src=\"http://img03.taobaocdn.com/imgextra/i3/738580955/T28tdGXd0OXXXXXXXX-738580955.jpg_.webp\" align=\"absmiddle\" /> \r\n		</p>\r\n	</div>\r\n</div>', '重量', '1000g、2000g、3000g', '中国大陆', '349、455、588', '', '', '1', '智利青苹果12个', '', '0');
INSERT INTO `yershop_document_product` VALUES ('9', '5.00', '<h2 align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;background-color:#FFFFFF;\">\r\n	配送范围：目前江浙沪（其他城市或者偏远乡镇村目前不配送，谢谢）\r\n</h2>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd1.alicdn.com/imgextra/i1/595478579/T2gtbxXINaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd2.alicdn.com/imgextra/i2/595478579/T2yOPCXKFaXXXXXXXX_!!595478579.jpg\" /><img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2S52CXMlaXXXXXXXX_!!595478579.jpg\" /><img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2XmrCXLNaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>\r\n<p align=\"center\" style=\"font-family:tahoma, arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://gd3.alicdn.com/imgextra/i3/595478579/T2poTvXMpaXXXXXXXX_!!595478579.jpg\" /> \r\n</p>', '500', '0', '中国大陆', '', '', '8、9、42、43、44', '1', '菲律宾进口香蕉', '', '0');
INSERT INTO `yershop_document_product` VALUES ('15', '1.00', '<div class=\"detl_property\" style=\"margin:20px 0px;\">\r\n	<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n		<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n	</p>\r\n	<div class=\"detl_com\">\r\n		<div class=\"detl_form\">\r\n			品名：河南河阴软籽石榴 4粒装（单果重250-300g）规格：250-300g\r\n		</div>\r\n		<div class=\"detl_pic\">\r\n			<img src=\"http://image4.benlailife.com/ProductImage/0102022270C.jpg\" style=\"width:340px;\" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n	<a name=\"sublist01\"></a> \r\n	<p style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#333333;\">\r\n		<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n	</p>\r\n	<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n		<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/22p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n		<div class=\"tal\" style=\"text-align:left;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n			<br />\r\n		</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/56p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n		<div class=\"tal\" style=\"text-align:left;color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n			<br />\r\n		</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102022270C/18p.jpg\" style=\"width:700px;\" /><span style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;line-height:normal;\"></span> \r\n	</div>\r\n	<div>\r\n		<br />\r\n	</div>\r\n</div>', '重量', '1000g、2000g、3000g', '中国大陆', '299、405、668', '8、9、42、43、44', '', '1', '河南河阴软籽石榴', '', '0');
INSERT INTO `yershop_document_product` VALUES ('16', '100.00', '<div class=\"detail_n\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"detail_tab\">\r\n		<h2 class=\"tith2\" id=\"navList\" style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">\r\n			<br />\r\n		</h2>\r\n		<div class=\"dtl_btn\" style=\"text-align:right;\">\r\n			<a class=\"buy_btn\" id=\"nav_buy_btn\"><span><span>￥</span>28.00</span></a> \r\n		</div>\r\n	</div>\r\n	<div class=\"detl_content\">\r\n		<div class=\"detl_property\" style=\"margin:20px 0px;\">\r\n			<p>\r\n				<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit01.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n			</p>\r\n			<div class=\"detl_com\">\r\n				<div class=\"detl_form\">\r\n					品名：佳沃智利进口蓝莓一级果125g规格：125g温馨提示：蓝莓果实为浆果型，耐贮性较强，最佳保存温度为1 ~ 3°C。要吃新鲜蓝莓不可置入0°C以下的冷藏库。 不建议水洗入冰箱，因为水份很容易使蓝莓腐烂。\r\n				</div>\r\n				<div class=\"detl_pic\">\r\n					<img src=\"http://image3.benlailife.com/ProductImage/0102022311C.jpg\" style=\"width:340px;\" /> \r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist01\"></a> \r\n			<p>\r\n				<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n			</p>\r\n			<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n				<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/001.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/002.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/003.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/004.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/005.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/006.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/008.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_feature\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist04\"></a> \r\n			<p>\r\n				<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit05.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n			</p>\r\n			<div class=\"detl_pic\" style=\"text-align:center;margin:10px 0px;\">\r\n				<img src=\"http://image6.benlailife.com/ProductNewDetailImage/0102020474C/009.jpg\" style=\"width:700px;\" /> \r\n				<div class=\"tal\" style=\"text-align:left;\">\r\n					&nbsp;\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class=\"detl_service\" style=\"margin:20px 0px 0px;\">\r\n			<a name=\"sublist05\"></a> \r\n			<p>\r\n				<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit06.gif?v=8.2.47\" height=\"42\" width=\"760\" /> \r\n			</p>\r\n			<div class=\"detl_tab\">\r\n				<a class=\"detl_tab01on\">&nbsp;</a><a class=\"detl_tab02\">&nbsp;</a><a class=\"detl_tab03\">&nbsp;</a><a class=\"detl_tab04\">&nbsp;</a><a class=\"detl_tab05 m0\">&nbsp;</a> \r\n			</div>\r\n			<div class=\"detl_com\" style=\"padding:19px;margin-left:20px;\">\r\n				<p>\r\n					<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0101.jpg?v=8.2.47\" height=\"200\" width=\"680\" /><img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0102.jpg?v=8.2.47\" height=\"228\" width=\"680\" /><img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_service0103.jpg?v=8.2.47\" height=\"450\" width=\"680\" /> \r\n				</p>\r\n				<div>\r\n					<br />\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '套餐', '1000g、2000g、3000g', '中国大陆', '349、455、588', '', '8、9、42、43、44', '1', '佳沃智利进口蓝莓', '', '0');
INSERT INTO `yershop_document_product` VALUES ('17', '100.00', '<div class=\"gdtit\" style=\"font-size:16px;color:#333333;font-weight:bold;font-family:Arial;margin-left:15px;\">\r\n	<h1 id=\"Product_ProductDetailsName\" style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;font-size:16px;\">\r\n		新疆红提950-1000g\r\n	</h1>\r\n</div>\r\n<p class=\"goods_gdmis2 pdl15\" style=\"font-family:宋体, \'Arial Narrow\', HELVETICA;color:#F08B0C;\">\r\n	新疆特受欢迎的葡萄品种。\r\n</p>', '重量', '1000g、2000g、3000g、4000g', '中国大陆', '2268.00、29299、22296、29229', '', '', '1', '新疆红提950-1000g', '', '0');
INSERT INTO `yershop_document_product` VALUES ('18', '19.00', '<div class=\"dtl_commodity\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<span style=\"font-size:30px;color:#669934;line-height:55px;\">皮薄、肉脆、汁多、酥香的新疆香梨</span> \r\n	<p style=\"color:#666666;background-color:#F8F8F8;\">\r\n		产自新疆天山南麓“梨乡”库尔勒，香气浓郁，皮薄肉细，酥脆爽口。这样的梨吃起来，不仅是味觉上的享受，也是帮助身体滋润的一剂良药。\r\n	</p>\r\n</div>\r\n<div class=\"dtl718\" style=\"color:#333333;font-family:宋体, \'Arial Narrow\', HELVETICA;\">\r\n	<div class=\"dtl_title\" style=\"font-size:18px;color:#669934;\">\r\n		商品介绍\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image1.benlailife.com/ProductDetailImage/0102020673C/001.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n	<div class=\"dtl_infor_top\" style=\"margin:0px;\">\r\n		<p style=\"color:#666666;\">\r\n			<strong><span style=\"font-size:14px;\">来自新疆梨乡的“奶西姆提”</span></strong><br />\r\n新疆巴音郭楞蒙古自治州北部的天山南麓，有一个肥沃的绿州名字叫库尔勒。这里出产的香梨远近闻名，素有“梨乡”之美称。库尔勒香梨在维吾尔语中叫做“奶西姆提”，因为营养价值丰富，印度人称它是“中国的王子”。\r\n		</p>\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image2.benlailife.com/ProductDetailImage/0102020673C/002.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n	<div class=\"dtl_infor_top\" style=\"margin:0px;\">\r\n		<p style=\"color:#666666;\">\r\n			<strong><span style=\"font-size:14px;\">香而清甜，虽小却极好吃</span></strong><br />\r\n库尔勒香梨个头不算大，但香气浓郁，皮薄肉细，酥脆爽口，汁多渣少。假如你以前不识此梨，尝下去的第一口，它一定能给你“竟这样好吃”的惊喜感。\r\n		</p>\r\n	</div>\r\n	<div class=\"dtl_infortu\">\r\n		<img alt=\"\" src=\"http://image.benlailife.com/ProductDetailImage/0102020673C/003.jpg\" style=\"width:700px;\" /> \r\n	</div>\r\n</div>', '重量', '1000g、2000g、3000g', '中国大陆', '299、405、668', '', '8、9、42、43、44', '1', '新疆库尔勒香梨 ', '', '0');
INSERT INTO `yershop_document_product` VALUES ('32', '1.00', '<div class=\"detl_com\">\r\n	<div class=\"detl_form\">\r\n		品名：延安宜川红富士 12粒装（75mm）温馨提示：由于产地下大雪，影响了苹果的到货速度并增加了破损率，若缺货，请您耐心等待，我们一定会尽快解决缺货问题，由此带来的不便，请您谅解。\r\n	</div>\r\n	<div class=\"detl_pic\">\r\n		<img src=\"http://image1.benlailife.com/ProductImages/000/000/015/633/medium/2b972bf7-1741-4498-b30e-f945ec14f0db.jpg\" /> \r\n	</div>\r\n</div>\r\n<div class=\"detl_feature\">\r\n	<a name=\"sublist01\"></a> \r\n	<p>\r\n		<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.68\" height=\"42\" width=\"760\" /> \r\n	</p>\r\n	<div class=\"detl_pic\">\r\n		<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/001.jpg\" /> \r\n		<div class=\"tal\">\r\n			&nbsp;\r\n		</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/002.jpg\" /> \r\n		<div class=\"tal\">\r\n			&nbsp;\r\n		</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/003.jpg\" /> \r\n		<div class=\"tal\">\r\n			&nbsp;\r\n		</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/004.jpg\" /> \r\n		<div class=\"tal\">\r\n			&nbsp;\r\n		</div>\r\n	</div>\r\n</div>\r\n<a name=\"sublist02\"></a> \r\n<p>\r\n	<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit03.gif?v=8.2.68\" height=\"42\" width=\"760\" /> \r\n</p>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/005.jpg\" /> \r\n<div class=\"tal\">\r\n	&nbsp;\r\n</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/006.jpg\" /> \r\n<div class=\"tal\">\r\n	&nbsp;\r\n</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020964C/007.jpg\" /><br />', '500', '0', '中国大陆', '', '', '', '10', '延安宜川红富士 12粒装（70-75mm）', '', '0');
INSERT INTO `yershop_document_product` VALUES ('33', '1.00', '<div class=\"detl_com\">\r\n	<div class=\"detl_form\">\r\n		品名：阿克苏红富士苹果 3粒装规格：3粒\r\n	</div>\r\n	<div class=\"detl_pic\">\r\n		<img src=\"http://image1.benlailife.com/ProductImages/000/000/040/455/medium/c7f74bee-ac98-4b53-aa74-9c275fbce133.jpg\" /> \r\n	</div>\r\n</div>\r\n<a name=\"sublist01\"></a> \r\n<p>\r\n	<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.68\" height=\"42\" width=\"760\" /> \r\n</p>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102021258C/001.jpg\" /> \r\n<div class=\"tal\">\r\n	<p class=\"detl_com01\">\r\n		<span>只有阿克苏地区才能产出的冰糖心</span>\r\n	</p>\r\n	<p class=\"detl_com02\">\r\n		<span>阿克苏“冰糖心”，产于新疆南部天山南麓塔里木盆地北缘的阿\r\n克苏红旗坡农场，这里具有干旱少雨，昼夜温差大，全年无霜期长，光照时间长的气候特点，而水源则依托于天山山脉托木尔峰冰川，远离污染的地域条件，使这里\r\n成为绿色无公害农产品的理想家园，成就了享誉疆内外的阿克苏“冰糖心”苹果。</span>\r\n	</p>\r\n</div>\r\n<br />', '500', '0', '中国大陆', '', '', '', '10', '新疆阿克苏冰糖心苹果 3粒装', '', '0');
INSERT INTO `yershop_document_product` VALUES ('34', '1.00', '<div class=\"detl_com\">\r\n	<div class=\"detl_form\">\r\n		品名：阿克苏红富士苹果 3粒装规格：3粒\r\n	</div>\r\n	<div class=\"detl_pic\">\r\n		<img src=\"http://image1.benlailife.com/ProductImages/000/000/040/455/medium/c7f74bee-ac98-4b53-aa74-9c275fbce133.jpg\" /> \r\n	</div>\r\n</div>\r\n<a name=\"sublist01\"></a> \r\n<p>\r\n	<img src=\"http://image1.benlailife.com/Content/images/detailsp/detailsp_tit02.gif?v=8.2.68\" height=\"42\" width=\"760\" /> \r\n</p>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102021258C/001.jpg\" /> \r\n<div class=\"tal\">\r\n	<p class=\"detl_com01\">\r\n		<span>只有阿克苏地区才能产出的冰糖心</span>\r\n	</p>\r\n	<p class=\"detl_com02\">\r\n		<span>阿克苏“冰糖心”，产于新疆南部天山南麓塔里木盆地北缘的阿\r\n克苏红旗坡农场，这里具有干旱少雨，昼夜温差大，全年无霜期长，光照时间长的气候特点，而水源则依托于天山山脉托木尔峰冰川，远离污染的地域条件，使这里\r\n成为绿色无公害农产品的理想家园，成就了享誉疆内外的阿克苏“冰糖心”苹果。</span>\r\n	</p>\r\n</div>\r\n<br />', '500', '0', '中国大陆', '', '', '', '10', '新疆阿克苏冰糖心苹果 3粒装', '', '0');
INSERT INTO `yershop_document_product` VALUES ('35', '1.00', '<div class=\"detl_com\">\r\n	<div class=\"detl_form\">\r\n		品名：延安宜川红富士 12粒优品装（80mm）温馨提示：由于气温升高，个别苹果可能会发面，脆爽不足，但香甜有余。\r\n	</div>\r\n	<div class=\"detl_pic\">\r\n		<img src=\"http://image1.benlailife.com/ProductImages/000/000/015/665/medium/ae5e03e1-49a5-44b9-8d37-823dac082c77.jpg\" /> \r\n	</div>\r\n</div>', '500', '0', '中国大陆', '', '', '8、9、42、43、44', '10', '延安宜川红富士 12粒优品装（80mm）', '', '0');
INSERT INTO `yershop_document_product` VALUES ('42', '1.00', '<div class=\"dtl_tjc fl\">\r\n	<div class=\"dtl_tjt fl\">\r\n		<div class=\"dtl_bb\">\r\n			<div class=\"dtl_tjh1\">\r\n				栖霞富士，产自中国苹果之乡\r\n			</div>\r\n		</div>\r\n		<div class=\"fl dtl_pt10 dtl_pb10\">\r\n			<div class=\"fl dtl439\">\r\n				　　栖霞富士以个大形正，色泽鲜艳，光洁度好，酸甜适中，香脆可口而著称。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;栖霞苹果产自\"苹果之乡\"山东栖霞，栖霞地处胶东半岛，主要地形为丘陵山地，四季分明，气候宜人，秋季昼夜温差大，自然环境非常适合苹果生长；栖霞苹果的种植历史长达百余年，果实个大形正，内纯外美，营养均衡，极耐贮藏。<br />\r\n<br />\r\n<strong>储存方式：</strong>苹果的储存要保持干燥、低温，买回的苹果洗净擦干后，装进保鲜袋，放入冰箱冷藏室即可。\r\n			</div>\r\n			<div class=\"fr dtl_img\">\r\n				<img alt=\"\" src=\"http://image3.benlailife.com/ProductDetailImage/0102020049C/001.jpg\" height=\"230\" width=\"230\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div>\r\n		<img alt=\"\" src=\"http://image3.benlailife.com/ProductDetailImage/bg/bg_tj_b.gif\" height=\"7\" width=\"760\" /> \r\n	</div>\r\n	<div class=\"dtl_zjc fl\">\r\n		<div class=\"dtl_zjt fl\">\r\n			<div class=\"fl dtl_pb10\">\r\n				<div class=\"dtl_lh22\">\r\n					<span>“</span>栖霞富士苹果因其漂亮的外表和美妙的口感而获得很多人的\r\n喜爱。不过，它的营养价值也是不可小觑的：含量丰富的果胶，能刺激胃肠蠕动，食用后，有助于排便；从美容的角度来说，栖霞富士中丰富的镁、铁、硒等矿物元\r\n素，可以使皮肤细腻、红润、有光泽，胜过无数价格昂贵的化妆品了。 <span>”</span><br />\r\n<br />\r\n<span>杨俊琴<br />\r\n国家二级公共营养师、北京营养师俱乐部会员<br />\r\n新浪微博：@杨俊琴营养师</span> \r\n				</div>\r\n			</div>\r\n			<div>\r\n				<img alt=\"\" src=\"http://image3.benlailife.com/ProductDetailImage/Dongxi/zhuanjia/yangjunqin.gif\" height=\"90\" width=\"90\" /> \r\n			</div>\r\n		</div>\r\n		<div>\r\n			<img alt=\"\" src=\"http://image5.benlailife.com/ProductDetailImage/bg/bg_zj_b.gif\" height=\"7\" width=\"760\" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"dtl_bb\">\r\n	<div class=\"dtl_zi\">\r\n		一天一苹果，医生远离我\r\n	</div>\r\n</div>\r\n<div class=\"dtl_lh22 dtl_pb10\">\r\n	　　苹果味甘，性凉；具有生津止渴、润肺除烦、健脾益胃、养心益气、润肠、止泻酒等功效。<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp;苹果的营养价值和医疗价值都很高，西方有谚语\"一天一苹果，医生远离我\"，因此苹果被很多人称为\"大夫第一药\"；多吃苹果可以有效降低胆固醇；改善呼吸系统和肺功能，保护肺部免受污染和烟尘的影响；同时对于促进消化，防止便秘，提神醒脑也有帮助作用。\r\n</div>\r\n<br />', '重量', '1000g、2000g、3000g', '中国大陆', '299、405、668', '', '8、9、42、43、44', '10', '山东栖霞富士 2粒/470-500g', '', '0');
INSERT INTO `yershop_document_product` VALUES ('43', '1.00', '<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020944C/021.jpg\" /> \r\n<div class=\"tal\">\r\n	&nbsp;\r\n</div>\r\n<img src=\"http://image1.benlailife.com/ProductNewDetailImage/0102020944C/022.jpg\" /><br />', '500', '0', '中国大陆', '45646', '', '8、9、42、43、44', '10', '浙江涌泉蜜桔 1.7-1.9kg', '', '0');
INSERT INTO `yershop_document_product` VALUES ('44', '1.00', '<div class=\"dtl_tjt fl\">\r\n	<div class=\"dtl_bb\">\r\n		<div class=\"dtl_tjh1\">\r\n			金玉其内外，皮薄肉嫩，汁多香甜\r\n		</div>\r\n	</div>\r\n	<div class=\"fl dtl_pt10 dtl_pb10\">\r\n		<div class=\"fl dtl439\">\r\n			　　金橘是柑橘类水果之一，皮色金黄、皮薄肉嫩、汁多香甜。它皮肉难分，洗净后可连皮带肉一起吃下。金橘含有特殊的挥发油、金橘甙等特殊物质，具有令人愉悦的香气，是颇具特色的水果，有生津利咽醒酒的作用。<br />\r\n<br />\r\n<strong>别&nbsp;&nbsp;</strong>&nbsp;&nbsp;<strong>名：</strong>金柑、夏橘、给客橙、金蛋、罗浮<br />\r\n<strong>成</strong>&nbsp;<strong>熟</strong>&nbsp;<strong>期：</strong>9-11月<br />\r\n<strong>食用方法：</strong>金桔洗净后可以带皮一起吃下。<br />\r\n<strong>挑选方法：</strong>品质好的金橘呈色泽闪亮的橘色或深黄色。<br />\r\n<strong>储存方式：</strong>最好的存放地方自然是肚子里，实在吃不完，放在阴凉干燥通风处即可。\r\n		</div>\r\n		<div class=\"fr dtl_img\">\r\n			<img alt=\"\" src=\"http://image1.benlailife.com/ProductDetailImage/0102020036C/001.jpg\" height=\"230\" width=\"230\" /> \r\n		</div>\r\n	</div>\r\n</div>\r\n<div>\r\n	<img alt=\"\" src=\"http://image1.benlailife.com/ProductDetailImage/bg/bg_tj_b.gif\" height=\"7\" width=\"760\" /> \r\n</div>\r\n<div class=\"fl dtl_pb10\">\r\n	<div class=\"dtl_lh22\">\r\n		<span>“</span><strong>小小金桔，营养多多</strong><br />\r\n金桔色美、个大、皮薄、肉厚、气香、酸甜可口，皮肉不易分离，可连皮带肉鲜食也可以当茶泡水喝。它含有人体所需的糖、酸、维生素C \r\n等多种营养物质，其中含有柠檬萜，橙皮甙，金桔甙等成分，不仅有助于消化，还对维护心血管功能，防止血管硬化、高血压等疾病有一定的作用。 <span>”</span><br />\r\n<br />\r\n<span>刘晓庆<br />\r\n国家高级食品检测员、公共营养师<br />\r\n新浪微博：@晓庆食尚之窗</span> \r\n	</div>\r\n</div>\r\n<br />', '500', '0', '中国大陆', '', '', '8、9、42、43、44', '10', '广西金桔 500-550g', '', '0');
INSERT INTO `yershop_document_product` VALUES ('60', '1.00', '', '1', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('61', '1.00', '', '1', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('63', '1.00', '<div class=\"formwork\">\r\n	<div class=\"formwork_img\">\r\n		<div class=\"formwork\">\r\n			<div class=\"formwork_img\">\r\n				<img src=\"http://img20.360buyimg.com/vc/jfs/t661/223/1260298180/156491/676efd81/54c597bcN90eaab2d.jpg\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\">\r\n			<div class=\"formwork_text\">\r\n				《快乐大本营》当红主持-李维嘉亲力代言爱国者移动电源传递欢乐正能量。 精细晒纹，舒适握感，简约白色，素雅诠释。\r\n			</div>\r\n		</div>\r\n		<div class=\"formwork\">\r\n			<div class=\"formwork_img\">\r\n				<img src=\"http://img20.360buyimg.com/vc/jfs/t757/2/12715622/52731/3053a25d/547d6741Na6b250f3.jpg\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<br />', '颜色', '黑色、白色、灰色、红色', '中国大陆', '', '', '', '10', '', '106', '0');
INSERT INTO `yershop_document_product` VALUES ('64', '1.00', '<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" width=\"750\">\r\n	<tbody>\r\n		<tr>\r\n			<td height=\"308\">\r\n				<a href=\"http://sale.jd.com/act/Se0Qj1I5sx.html\" target=\"_blank\"><img alt=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t835/218/436209464/101913/90b377f0/5523a921N49a86b97.jpg\" height=\"300\" width=\"750\" /></a> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div align=\"center\">\r\n	<a href=\"http://sale.jd.com/act/DgpZiTuqdWU3.html\" target=\"_blank\"><img alt=\"\" src=\"http://img30.360buyimg.com/jgsq-productsoa/jfs/t1024/17/289442024/60596/8b447dda/551cf673Nfab6e101.jpg\" /></a> \r\n</div>', '规格', '黑色、白色', '中国大陆', '99、111', '', '', '9', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('65', '1.00', '<div class=\"ui-switchable-panel ui-switchable-panel-selected\">\r\n	<div class=\"mc\" id=\"product-detail-1\">\r\n		<div class=\"detail-content clearfix\">\r\n			<div class=\"detail-content-wrap\">\r\n				<div class=\"detail-content-item\">\r\n					<div id=\"J-detail-pop-tpl-top\">\r\n						<p>\r\n							<img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t751/77/1013597273/248907/338afaa8/5511239cNc5ac78e8.jpg\" border=\"0\" />\r\n						</p>\r\n						<p>\r\n							<img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t757/267/934989647/210055/c2d8871e/550946b7Ne614bd11.jpg\" />\r\n						</p>\r\n					</div>\r\n					<div id=\"J-detail-content\">\r\n						<img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t478/16/972345406/467919/5f920a9a/54c0b143Nb565bbcf.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t682/338/1232756534/290787/34fc27c7/54c0b145Nd657ede8.jpg\" /> <img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t667/211/1233801542/246875/8c9cba1a/54c0b146N3a0f1242.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t535/275/1219770206/207964/591a100e/54c0b147N4b8aa15f.jpg\" /> <img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t595/330/1222871012/194147/f95ec84/54c0b148N13bcc8dc.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t580/267/1230967396/262350/cfe1c8be/54c0b148N75613d15.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t655/63/1242307338/205284/589be0b2/54c0b149Nabbee94d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t763/27/572674096/130207/f1599b9c/54c0b149N9e8547ef.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t697/8/566006959/146997/df0ab452/54c0b14aN345a6eca.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t469/323/1260790326/286804/2ee7d1e6/54c0b14bN9edddbe7.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t469/324/1231339113/325122/f5bdeebb/54c0b14cNd3e27f13.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t673/349/1240110030/254101/a561b49/54c0b14dN4e721103.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t475/121/1255343474/119478/169316db/54c0b14dN191dec09.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t730/24/579964548/197526/bf92e431/54c0b14eN5787baa1.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t541/28/1283149987/292873/7bb43ae3/54c0b14fNca292ad8.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t550/99/1409383535/324070/6c552691/54c0b14fN743e14fb.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t766/29/577443219/182750/b8fc96b4/54c0b150N091ce3a3.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t700/177/572228437/178013/a1f39406/54c0b151N2ade0b10.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t454/234/1254972438/289244/8cd47aba/54c0b151Nfc33214f.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t661/350/1244707552/320185/8fd27ced/54c0b152N001e7f5d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t763/46/578515785/309068/1b42ff10/54c0b161N1d74a9cf.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t565/242/1238531075/362491/b0e7139/54c0b161N2ceaca72.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t574/60/1206685788/273586/569adf0b/54c0b163N9864b5eb.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t625/125/1230098446/286758/462cb5b5/54c0b163N1746bb5d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t460/359/1225996454/622/8bf7354e/54c0b164N853a5fcb.jpg\" /><br />\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"ui-switchable-panel mc hide\" id=\"product-detail-2\">\r\n	<div class=\"detail-correction\">\r\n		如果您发现商品信息不准确，<a href=\"http://club.360buy.com/jdvote/skucheck.aspx?skuid=1452568268&amp;cid1=9987&amp;cid2=830&amp;cid3=11301\" target=\"_blank\">欢迎纠错</a> \r\n	</div>\r\n	<table class=\"Ptable ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" width=\"100%\">\r\n		<tbody>\r\n			<tr>\r\n				<th class=\"tdTitle\" colspan=\"2\">\r\n					主体\r\n				</th>\r\n			</tr>\r\n			<tr>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"tdTitle\">\r\n					适用机型\r\n				</td>\r\n				<td>\r\n					苹果iPhone 6\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"ui-switchable-panel hide\">\r\n	<div class=\"mc yb-tab-img\" id=\"J-yb-tab-img\">\r\n		<img src=\"http://img13.360buyimg.com/da/jfs/t829/263/100807689/199942/5d4cf278/54fe5ebeNf4fbebc7.jpg\" width=\"990\" /><a href=\"http://c.nfa.jd.com/adclick?keyStr=z5AXFoIimt1jiDK32+w4mW0bjVYOHZSLtG+kxxFj84wd1CxH/fv6f/B9W56+bpjMXaO4vyEsoB7IH+QXnjgsfD4r5P0AG9d7eXFBuivDLQVa4eG9P+LQ+i7XDdn0nvJz1oEwRbUsC6tQMin70asoRy+FLA/RxgylPM+ZTgFbTAfkboyaUtqXgD1knbsfQQWmBvY0tDzeYVvO6GD7pv64H8vAa6QAm01CnX10pC6qyde7NopedPC3du7DL5C86LCm7rgAJfsDkN3cr39q/mKyOw8DnD4R7zcofvTr4ytU1fEqjV5eNKY+ZtEexFIgZ9O50KLb4qjigzwt6HHBU+SMjg==&amp;cv=2.0&amp;url=http://sale.jd.com/act/1pChm0RcanBPYXIS.html\" target=\"_blank\">更多京东服务相关活动 &gt; </a>\r\n	</div>\r\n</div>\r\n<div class=\"ui-box\" id=\"promises\">\r\n	<strong>服务承诺：</strong><br />\r\n京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br />\r\n注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！ <br />\r\n</div>\r\n<br />', '颜色', '黑色、白色、', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('66', '1.00', '<div class=\"ui-switchable-panel ui-switchable-panel-selected\">\r\n	<div class=\"mc\" id=\"product-detail-1\">\r\n		<div class=\"detail-content clearfix\">\r\n			<div class=\"detail-content-wrap\">\r\n				<div class=\"detail-content-item\">\r\n					<div id=\"J-detail-pop-tpl-top\">\r\n						<p>\r\n							<img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t751/77/1013597273/248907/338afaa8/5511239cNc5ac78e8.jpg\" border=\"0\" /> \r\n						</p>\r\n						<p>\r\n							<img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t757/267/934989647/210055/c2d8871e/550946b7Ne614bd11.jpg\" /> \r\n						</p>\r\n					</div>\r\n					<div id=\"J-detail-content\">\r\n						<img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t478/16/972345406/467919/5f920a9a/54c0b143Nb565bbcf.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t682/338/1232756534/290787/34fc27c7/54c0b145Nd657ede8.jpg\" /> <img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t667/211/1233801542/246875/8c9cba1a/54c0b146N3a0f1242.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t535/275/1219770206/207964/591a100e/54c0b147N4b8aa15f.jpg\" /> <img alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t595/330/1222871012/194147/f95ec84/54c0b148N13bcc8dc.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t580/267/1230967396/262350/cfe1c8be/54c0b148N75613d15.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t655/63/1242307338/205284/589be0b2/54c0b149Nabbee94d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t763/27/572674096/130207/f1599b9c/54c0b149N9e8547ef.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t697/8/566006959/146997/df0ab452/54c0b14aN345a6eca.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t469/323/1260790326/286804/2ee7d1e6/54c0b14bN9edddbe7.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t469/324/1231339113/325122/f5bdeebb/54c0b14cNd3e27f13.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t673/349/1240110030/254101/a561b49/54c0b14dN4e721103.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t475/121/1255343474/119478/169316db/54c0b14dN191dec09.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t730/24/579964548/197526/bf92e431/54c0b14eN5787baa1.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t541/28/1283149987/292873/7bb43ae3/54c0b14fNca292ad8.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t550/99/1409383535/324070/6c552691/54c0b14fN743e14fb.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t766/29/577443219/182750/b8fc96b4/54c0b150N091ce3a3.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t700/177/572228437/178013/a1f39406/54c0b151N2ade0b10.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t454/234/1254972438/289244/8cd47aba/54c0b151Nfc33214f.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t661/350/1244707552/320185/8fd27ced/54c0b152N001e7f5d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t763/46/578515785/309068/1b42ff10/54c0b161N1d74a9cf.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t565/242/1238531075/362491/b0e7139/54c0b161N2ceaca72.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t574/60/1206685788/273586/569adf0b/54c0b163N9864b5eb.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t625/125/1230098446/286758/462cb5b5/54c0b163N1746bb5d.jpg\" /> <img class=\"loading-style2\" alt=\"\" src=\"http://img10.360buyimg.com/imgzone/jfs/t460/359/1225996454/622/8bf7354e/54c0b164N853a5fcb.jpg\" /><br />\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"ui-switchable-panel mc hide\" id=\"product-detail-2\">\r\n	<div class=\"detail-correction\">\r\n		如果您发现商品信息不准确，<a href=\"http://club.360buy.com/jdvote/skucheck.aspx?skuid=1452568268&cid1=9987&cid2=830&cid3=11301\" target=\"_blank\">欢迎纠错</a> \r\n	</div>\r\n	<table class=\"Ptable ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" width=\"100%\">\r\n		<tbody>\r\n			<tr>\r\n				<th class=\"tdTitle\" colspan=\"2\">\r\n					主体\r\n				</th>\r\n			</tr>\r\n			<tr>\r\n			</tr>\r\n			<tr>\r\n				<td class=\"tdTitle\">\r\n					适用机型\r\n				</td>\r\n				<td>\r\n					苹果iPhone 6\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"ui-switchable-panel hide\">\r\n	<div class=\"mc yb-tab-img\" id=\"J-yb-tab-img\">\r\n		<img src=\"http://img13.360buyimg.com/da/jfs/t829/263/100807689/199942/5d4cf278/54fe5ebeNf4fbebc7.jpg\" width=\"990\" /><a href=\"http://c.nfa.jd.com/adclick?keyStr=z5AXFoIimt1jiDK32+w4mW0bjVYOHZSLtG+kxxFj84wd1CxH/fv6f/B9W56+bpjMXaO4vyEsoB7IH+QXnjgsfD4r5P0AG9d7eXFBuivDLQVa4eG9P+LQ+i7XDdn0nvJz1oEwRbUsC6tQMin70asoRy+FLA/RxgylPM+ZTgFbTAfkboyaUtqXgD1knbsfQQWmBvY0tDzeYVvO6GD7pv64H8vAa6QAm01CnX10pC6qyde7NopedPC3du7DL5C86LCm7rgAJfsDkN3cr39q/mKyOw8DnD4R7zcofvTr4ytU1fEqjV5eNKY+ZtEexFIgZ9O50KLb4qjigzwt6HHBU+SMjg==&cv=2.0&url=http://sale.jd.com/act/1pChm0RcanBPYXIS.html\" target=\"_blank\">更多京东服务相关活动 &gt; </a> \r\n	</div>\r\n</div>\r\n<div class=\"ui-box\" id=\"promises\">\r\n	<strong>服务承诺：</strong><br />\r\n京东平台卖家销售并发货的商品，由平台卖家提供发票和相应的售后服务。请您放心购买！<br />\r\n注：因厂家会在没有任何提前通知的情况下更改产品包装、产地或者一些附件，本司不能确保客户收到的货物与商城图片、产地、附件说明完全一致。只能确保为原厂正货！并且保证与当时市场上同样主流新品一致。若本商城没有及时更新，请大家谅解！ <br />\r\n</div>\r\n<br />', '规格', '黑色、白色、灰色、红色', '中国大陆', '268.00、299、296、299', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('67', '1.00', '<img alt=\"\" src=\"http://img20.360buyimg.com/vc/jfs/t349/285/1951733059/183818/4d59d3b7/5448ca12N610faac0.jpg\" height=\"845\" width=\"750\" /><br />', '选择版本', '套餐1、套餐2、套餐3、套餐4', '中国大陆', '5999.00、6299、6296、6399', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('69', '1.00', '<img src=\"http://img10.360buyimg.com/imgzone/jfs/t700/62/1097460735/70748/e559139c/551b85d7N4944ab71.gif\" alt=\"\" />', '选择尺码', ' 3人位+单人位+左贵妃、 3人位+单人位+左贵妃', '中国大陆', '299、405', '', '', '10', '', '112,113', '0');
INSERT INTO `yershop_document_product` VALUES ('79', '1.00', '&nbsp;拜亚动力（Beyerdynamic）DP100 HIFI入门级耳机', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('80', '1.00', '<div id=\"J-detail-banner\">\r\n	<a id=\"p-cat-insert\" target=\"_blank\" href=\"http://c.nfa.jd.com/adclick?keyStr=z5AXFoIimt1jiDK32+w4mVFFlB61IxxBG0eEPjEEnp7sHIkFTbNkmTyYKWqGdc5pqm5DIpBUSHYlLtewfzAMwMxSyCaIe+qXw6KXzA+7y0FHWmoByPeXmwN+vPPmAue8nPRVaxDTMvb4FGTgPthakuJEi5ANPO/Il1ncbFic84l4VVDngSwdeGKwaEp76QOAZzMI/FNcIyqPvs7l7kzfgqwuiHO85wBSyA1FPeT/jgXBkyxapGKK0bayuRsyF1CjSHY0JSwCJdCXubq2wQCesktkSSOFA1pdGE/Iy7jQSEYQlCt5qtzWUNQR7nMClgnfA8pekfb4uNQnqgcfk9CP5w==&cv=2.0&url=http://sale.jd.com/act/iMYL0VJEuHNkzr.html\"><img alt=\"\" src=\"http://img30.360buyimg.com/da/jfs/t1900/120/333852295/135908/58547ea4/56022137N30479e74.jpg\" height=\"180\" width=\"990\" /></a> \r\n</div>\r\n<div id=\"J-detail-pop-tpl-top\">\r\n	<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"990\">\r\n		<tbody>\r\n			<tr>\r\n				<td colspan=\"3\" rowspan=\"2\" height=\"293\" width=\"569\">\r\n					<a href=\"http://517lppz.jd.com/\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2077/349/379548862/294851/ef63d0ec/5603e319Ne4d5d177.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td colspan=\"2\" height=\"151\" width=\"211\">\r\n					<a href=\"http://active.coupon.jd.com/ilink/couponActiveFront/front_index.action?key=ee347d11141e4ceab5bc97e18547ad11&roleId=1620599&to=517lppz.jd.com\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2239/97/384378311/38553/f6acb9f9/5603e31aN94f40eeb.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td rowspan=\"2\" height=\"293\" width=\"210\">\r\n					<a href=\"http://517lppz.jd.com/#hot\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2215/108/363299242/37975/d82d2702/5603e31aNd5e46e2b.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td colspan=\"2\" height=\"142\" width=\"211\">\r\n					<a href=\"http://active.coupon.jd.com/ilink/couponActiveFront/front_index.action?key=b8d58d47f34b4b21a01efb32527a2c29&roleId=1620600&to=517lppz.jd.com\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2095/69/357606389/38546/e73e6a95/5603e31aN497ed429.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<table class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"990\">\r\n		<tbody>\r\n			<tr>\r\n				<td height=\"248\" width=\"248\">\r\n					<a href=\"http://item.jd.com/1032565097.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2077/347/377418309/70229/f1141ce8/5603e31bN72dc89fc.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td height=\"248\" width=\"247\">\r\n					<a href=\"http://item.jd.com/1398878840.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1948/53/376108099/95036/fc1c489e/5603e31bN75fa80cf.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td colspan=\"2\" height=\"248\" width=\"248\">\r\n					<a href=\"http://item.jd.com/1111130721.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2023/341/377337144/79660/dce06e4a/5603e31cN443a4d3e.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td colspan=\"2\" height=\"248\" width=\"247\">\r\n					<a href=\"http://item.jd.com/1053916496.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1834/178/1699888518/55688/8eb3612a/5604bba2N8a19d1ce.jpg\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td height=\"259\" width=\"248\">\r\n					<a href=\"http://item.jd.com/1146099848.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t2449/340/367541173/74415/d8f8069f/5603e31dN4cdc438e.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td height=\"259\" width=\"247\">\r\n					<a href=\"http://item.jd.com/1113944941.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1879/55/384099910/74180/db3f55a5/5603e31dNb4410221.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td colspan=\"2\" height=\"259\" width=\"248\">\r\n					<a href=\"http://item.jd.com/1075327660.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1870/52/358337007/81643/a06553fc/5603e31eNa9e5fd34.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n				<td colspan=\"2\" height=\"259\" width=\"247\">\r\n					<a href=\"http://item.jd.com/1043506051.html\" target=\"_blank\"><img src=\"http://img10.360buyimg.com/imgzone/jfs/t1810/107/1685543558/84628/4c11ffc0/5603e31fN7ddef8ff.png\" alt=\"\" border=\"0\" /></a> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div class=\"detail-correction\">\r\n	如果您发现商品信息不准确，<a href=\"http://club.360buy.com/jdvote/skucheck.aspx?skuid=1113030151&cid1=1320&cid2=1583&cid3=1590\" target=\"_blank\">欢迎纠错</a> \r\n</div>\r\n<div class=\"BK\">\r\n	<div style=\"background:#ffb538;\">\r\n		<table class=\"ke-zeroborder\" bgcolor=\"#ffb538\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n			<tbody>\r\n				<tr>\r\n					<td colspan=\"4\" height=\"73\">\r\n						<img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1768/178/1269337687/22864/7b6d2f49/55e457aaNadf660fc.png\" alt=\"\" border=\"0\" width=\"100%\" /> \r\n					</td>\r\n				</tr>\r\n				<tr>\r\n					<td align=\"left\" valign=\"top\" width=\"25%\">\r\n						<a target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1780/170/1289164102/2882/982bbe5a/55e457aaN6712e7fb.png\" alt=\"\" border=\"0\" width=\"96%\" /></a> \r\n					</td>\r\n					<td align=\"center\" valign=\"top\" width=\"25%\">\r\n						<a target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1780/170/1289164102/2882/982bbe5a/55e457aaN6712e7fb.png\" alt=\"\" border=\"0\" width=\"96%\" /></a> \r\n					</td>\r\n					<td align=\"center\" valign=\"top\" width=\"25%\">\r\n						<a target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1780/170/1289164102/2882/982bbe5a/55e457aaN6712e7fb.png\" alt=\"\" border=\"0\" width=\"96%\" /></a> \r\n					</td>\r\n					<td align=\"right\" valign=\"top\" width=\"25%\">\r\n						<a target=\"_blank\"><img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1780/170/1289164102/2882/982bbe5a/55e457aaN6712e7fb.png\" alt=\"\" border=\"0\" width=\"96%\" /></a> \r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</div>\r\n</div>\r\n<div class=\"HB\">\r\n	<div>\r\n		<img class=\"\" src=\"http://img30.360buyimg.com/popWaterMark/jfs/t1726/157/1317675410/136200/19f955fa/55e457aaN968adab9.jpg\" alt=\"\" border=\"0\" width=\"100%\" /> \r\n	</div>\r\n</div>\r\n<div class=\"CS\">\r\n	<table style=\"width:100.0%;height:46.0px;text-align:left;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>产品参数</strong><span style=\"color:#e84572;font-size:12.0px;\">Product parameters</span> \r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n	<table style=\"width:100.0%;height:330.0px;text-align:left;background-color:#f7f9d1;\" class=\"ke-zeroborder\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n		<tbody>\r\n			<tr>\r\n				<td align=\"left\" valign=\"top\">\r\n					<div>\r\n						<strong>品名：沙拉薯条</strong> \r\n						<ul style=\"font-size:12.0px;\">\r\n							<li>\r\n								产品类型：膨化食品（油炸类） 产地：湖北省武汉市 \r\n配料：面粉、植物油、白砂糖、食用盐、味精、 香幸料粉、食品添加剂 产品标准号：GB/T 22699 食品生产许可证号：QS4201 1201 \r\n0101 保质期：300天 生产日期：见包装上标示 净含量：45g 贮藏条件：置于阴凉干燥处、避免日光直射 食用方法：开袋即食\r\n							</li>\r\n						</ul>\r\n					</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<br />', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('82', '1.00', '<a target=\"_blank\" href=\"http://item.jd.com/1302677.html\"><em>伊利  安慕希希腊风味酸牛奶常温酸牛奶礼</em></a>', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('83', '1.00', '<a target=\"_blank\" href=\"http://item.jd.com/1302677.html\"><em>伊利  安慕希希腊风味酸牛奶常温酸牛奶礼</em></a>', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('84', '1.00', '<a target=\"_blank\" href=\"http://item.jd.com/1302677.html\"><em>伊利  安慕希希腊风味酸牛奶常温酸牛奶礼</em></a>', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('85', '1.00', '<a href=\"http://item.jd.com/1081103.html?cpdad=1DLSUE\" target=\"_blank\">福佳（Hoegaarden） 白啤酒330ml 瓶装</a>', '', '1', '中国大陆', '', '', '', '10', '', '', '0');
INSERT INTO `yershop_document_product` VALUES ('86', '1.00', '<a target=\"_blank\" href=\"http://item.jd.com/1238332.html\"><em>TP-LINK TL-WR886N 450M无线路由器</em></a>', '', '1', '中国大陆', '', '', '', '10', '', '', '0');

-- ----------------------------
-- Table structure for `yershop_document_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_document_reserve`;
CREATE TABLE `yershop_document_reserve` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` text NOT NULL COMMENT '内容详细描述',
  `start_time` int(10) NOT NULL COMMENT '开始时间',
  `next_time` int(10) NOT NULL COMMENT '下次开始时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yershop_document_reserve
-- ----------------------------
INSERT INTO `yershop_document_reserve` VALUES ('78', '<img src=\"/b2c/Uploads/Editor/2015-08-10/55c77d9e0f378.png\" alt=\"\" />', '1442017980', '1448928000');

-- ----------------------------
-- Table structure for `yershop_email`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_email`;
CREATE TABLE `yershop_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `domain` varchar(225) NOT NULL DEFAULT '' COMMENT '链接',
  `account` varchar(225) NOT NULL DEFAULT '' COMMENT '邮箱',
  `username` varchar(225) NOT NULL DEFAULT '' COMMENT '用户名',
  `sendname` varchar(225) NOT NULL DEFAULT '' COMMENT '发件人',
  `content` varchar(225) NOT NULL DEFAULT '' COMMENT '回复内容',
  `msg` varchar(225) NOT NULL DEFAULT '' COMMENT '备注',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1已发送 -1禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `group` varchar(225) NOT NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发送邮件记录表';

-- ----------------------------
-- Records of yershop_email
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_envelope`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_envelope`;
CREATE TABLE `yershop_envelope` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL DEFAULT '' COMMENT '用户名',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `sendname` varchar(225) NOT NULL DEFAULT '' COMMENT '发件人',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '发送内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-未读2-已读',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读数量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `group` varchar(225) NOT NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内信表';

-- ----------------------------
-- Records of yershop_envelope
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_exchange`;
CREATE TABLE `yershop_exchange` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `tool` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `toolid` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(225) NOT NULL DEFAULT '',
  `total` decimal(50,2) NOT NULL DEFAULT '0.00',
  `backinfo` varchar(225) NOT NULL DEFAULT '',
  `shopid` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `assistant` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '',
  `reason` varchar(225) NOT NULL DEFAULT '',
  `changetool` varchar(225) NOT NULL DEFAULT '',
  `changetoolid` varchar(225) NOT NULL DEFAULT '',
  `address` varchar(225) NOT NULL DEFAULT '',
  `contact` varchar(225) NOT NULL DEFAULT '',
  `parameters` varchar(225) NOT NULL DEFAULT '',
  `backname` varchar(225) NOT NULL DEFAULT '',
  `acceptname` varchar(255) NOT NULL DEFAULT '',
  `acceptphone` varchar(225) NOT NULL DEFAULT '',
  `acceptaddress` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表';

-- ----------------------------
-- Records of yershop_exchange
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_express`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_express`;
CREATE TABLE `yershop_express` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '快递名称',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '英文字母',
  `code` varchar(225) NOT NULL DEFAULT '' COMMENT '快递单号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,2为已使用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_express
-- ----------------------------
INSERT INTO `yershop_express` VALUES ('7', '5464', '54645', '456456', '2', '1444234735', '1444234735');
INSERT INTO `yershop_express` VALUES ('8', 'u88755', '445353', '43535345435', '2', '1444234888', '1444234888');
INSERT INTO `yershop_express` VALUES ('9', '4yt4t4', '而额外人', '435354354', '2', '1444235317', '1444235317');

-- ----------------------------
-- Table structure for `yershop_fcoupon`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_fcoupon`;
CREATE TABLE `yershop_fcoupon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '名称',
  `price` varchar(225) NOT NULL DEFAULT '' COMMENT '金额',
  `lowpayment` varchar(50) NOT NULL DEFAULT '' COMMENT '消费满多少可使用',
  `code` varchar(255) NOT NULL COMMENT '代码',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='优惠券表';

-- ----------------------------
-- Records of yershop_fcoupon
-- ----------------------------
INSERT INTO `yershop_fcoupon` VALUES ('1', '645645', '肯德基', '30', '100', '78ou16bl', '', '0', '1', '1', '0', '1414012468', '1415716837', '1', '5');
INSERT INTO `yershop_fcoupon` VALUES ('2', '645465', '麦当劳', '6644', '150', '453ljnq7', '', '0', '1', '1', '0', '1414012758', '1414174944', '1', '11');
INSERT INTO `yershop_fcoupon` VALUES ('3', '64645', '麦考林', '656', '120', '4nm34itt', '', '0', '1', '1', '0', '1414012817', '1414175369', '1', '14');
INSERT INTO `yershop_fcoupon` VALUES ('5', '65656', '必胜客', '50', '110', '2xs1rdw0', '', '0', '0', '1', '0', '1414174826', '1414174826', '1', '13');

-- ----------------------------
-- Table structure for `yershop_file`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_file`;
CREATE TABLE `yershop_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of yershop_file
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_history`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_history`;
CREATE TABLE `yershop_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `login_ip` varchar(225) DEFAULT '0' COMMENT '注册IP',
  `login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `login_country` varchar(225) DEFAULT '0' COMMENT '登录国家',
  `login_province` varchar(225) DEFAULT '0' COMMENT '登陆省份',
  `login_city` varchar(225) DEFAULT '0' COMMENT '登录城市',
  `login_isp` varchar(225) DEFAULT '0' COMMENT '运营商',
  `login_way` varchar(225) DEFAULT '0' COMMENT '登录方式',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='登录历史表';

-- ----------------------------
-- Records of yershop_history
-- ----------------------------
INSERT INTO `yershop_history` VALUES ('3', '1', '0', '1443092661', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('4', '1', '0', '1443192837', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('5', '1', '0', '1443197462', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('6', '1', '0', '1443198202', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('7', '1', '0', '1443198291', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('8', '1', '0', '1443198363', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('9', '1', '0', '1443199319', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('10', '1', '0', '1443199352', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('11', '1', '0', '1443275260', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('12', '1', '0', '1443275260', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('13', '1', '0', '1443275363', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('14', '1', '0', '1443275420', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('15', '1', '0', '1443275438', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('16', '1', '0', '1443277567', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('17', '1', '0', '1443408733', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('18', '1', '0', '1443426323', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('19', '1', '0', '1443503176', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('20', '1', '0', '1443587302', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('21', '1', '0', '1443588547', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('22', '1', '0', '1443638075', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('23', '1', '0', '1444239990', '0', '0', '0', '0', '电脑登录', '0');
INSERT INTO `yershop_history` VALUES ('24', '1', '0', '1444274873', '0', '0', '0', '0', '电脑登录', '0');

-- ----------------------------
-- Table structure for `yershop_hooks`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_hooks`;
CREATE TABLE `yershop_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_hooks
-- ----------------------------
INSERT INTO `yershop_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '', '1');
INSERT INTO `yershop_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `yershop_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment', '1');
INSERT INTO `yershop_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment', '1');
INSERT INTO `yershop_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `yershop_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `yershop_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor', '1');
INSERT INTO `yershop_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin', '1');
INSERT INTO `yershop_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam', '1');
INSERT INTO `yershop_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor', '1');
INSERT INTO `yershop_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '', '1');
INSERT INTO `yershop_hooks` VALUES ('28', 'Template', '模版管理插件钩子', '1', '1420796865', 'Template', '1');
INSERT INTO `yershop_hooks` VALUES ('23', 'SyncLogin', '第三方账号同步登陆', '1', '1412762818', 'SyncLogin', '1');

-- ----------------------------
-- Table structure for `yershop_member`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_member`;
CREATE TABLE `yershop_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `account` decimal(50,2) NOT NULL DEFAULT '0.00' COMMENT '账号余额',
  `paykey` varchar(225) NOT NULL DEFAULT '' COMMENT '支付密码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` varchar(16) NOT NULL DEFAULT '' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of yershop_member
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_menu`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_menu`;
CREATE TABLE `yershop_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_menu
-- ----------------------------
INSERT INTO `yershop_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('2', '文章', '0', '5', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `yershop_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `yershop_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('16', '用户', '0', '8', 'User/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('43', '扩展', '0', '11', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `yershop_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `yershop_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('68', '系统', '0', '2', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('80', '商品分类', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `yershop_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `yershop_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('93', '其他', '0', '13', 'other', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('177', ' 快递管理', '146', '9', 'Express/index', '0', '', '数据管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('134', '优惠券', '158', '4', 'Fcoupon/index', '0', '', '优惠券管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('131', '订单', '0', '6', 'Order/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('132', '提交订单', '131', '1', 'Order/index', '0', '', '订单管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('178', '日志管理', '131', '6', 'UserLog/index', '0', '', '财务管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('137', '正退货订单', '173', '4', 'Back/index', '0', '', '退货管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('138', '同意退货订单', '173', '7', 'Backagree/index', '0', '', '退货管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('139', '已退货订单', '173', '8', 'Backover/index', '0', '', '退货管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('140', '换货管理', '131', '4', 'Exchange/index', '0', '', '订单管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('143', '今日销量统计', '146', '13', 'Statistics/index', '0', '', '数据统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('144', '本周销量统计', '146', '14', 'Statistics/week', '0', '', '数据统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('145', '本月销量统计', '146', '15', 'Statistics/month', '0', '', '数据统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('146', '数据', '0', '7', 'Statistics/index', '0', '', '数据统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('147', '每日数据', '146', '16', 'Report/index', '0', '', '报表统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('148', '每周数据', '146', '17', 'Report/week', '0', '', '报表统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('149', '每月统计', '146', '18', 'Report/month', '0', '', '报表统计', '0', '1');
INSERT INTO `yershop_menu` VALUES ('150', '流量统计', '146', '20', 'Lookup/index', '0', '', '数据管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('179', '支付管理', '131', '8', 'Pay/index', '0', '', '财务管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('153', '取消管理', '131', '2', 'Cancel/index', '0', '', '订单管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('157', '品牌管理', '158', '0', 'Brand/index', '0', '', '广告管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('158', '广告', '0', '9', 'Slide/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('160', '幻灯片', '158', '0', 'Slide/index', '0', '', '广告管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('159', '广告', '158', '0', 'Ad/index', '0', '', '广告管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('162', '拒绝退货订单', '173', '5', 'Backrefuse/index', '0', '', '退货管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('163', '退货中订单', '173', '6', 'Backon/index', '0', '', '退货管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('166', '商品', '0', '4', 'Goods/index', '0', '', '', '0', '1');
INSERT INTO `yershop_menu` VALUES ('168', '邮件管理', '16', '6', 'Email/index', '0', '', '信息管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('169', '短信管理', '16', '7', 'Sms/index', '0', '', '信息管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('170', '站内信管理', '16', '8', 'Envelope/index', '0', '', '信息管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('171', '留言管理', '16', '9', 'Message/index', '0', '', '信息管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('172', '回复管理', '16', '10', 'Reply/index', '0', '', '信息管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('176', '退货管理', '131', '3', 'Back/index', '0', '', '订单管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('174', '文章分类', '68', '2', 'Catearticle/index', '0', '', '系统设置', '0', '1');
INSERT INTO `yershop_menu` VALUES ('175', '预约列表', '68', '0', 'Reserve/index', '0', '', '预约管理', '0', '1');
INSERT INTO `yershop_menu` VALUES ('180', '地区管理', '146', '0', 'Area/index', '0', '', '数据管理', '0', '1');

-- ----------------------------
-- Table structure for `yershop_message`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_message`;
CREATE TABLE `yershop_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(225) NOT NULL DEFAULT '' COMMENT '留言内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '默认0-未提交订单1-未读2-已读',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `group` varchar(225) NOT NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of yershop_message
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_model`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_model`;
CREATE TABLE `yershop_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of yershop_model
-- ----------------------------
INSERT INTO `yershop_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"56\",\"55\",\"49\",\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\",\"51\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891233', '1438957493', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"56\",\"55\",\"51\",\"49\",\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891243', '1438955531', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', '', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('5', 'product', '商品', '1', '', '1', '{\"1\":[\"3\",\"36\",\"51\",\"12\",\"55\",\"46\",\"39\"],\"2\":[\"37\",\"102\",\"42\",\"10\",\"56\",\"47\",\"50\",\"5\",\"49\",\"14\",\"44\",\"58\",\"9\",\"20\",\"11\",\"2\",\"13\",\"17\",\"35\",\"16\",\"19\",\"43\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891252', '1439279017', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('6', 'phone', '手机', '1', '', '1', '{\"1\":[\"3\",\"60\",\"12\",\"55\",\"51\",\"62\",\"80\",\"68\",\"66\",\"64\",\"63\",\"61\",\"59\"],\"2\":[\"103\",\"104\",\"105\",\"5\",\"56\",\"10\",\"65\",\"81\",\"70\",\"71\",\"67\",\"72\",\"69\",\"73\",\"74\",\"75\",\"76\",\"78\",\"77\",\"79\",\"49\",\"14\",\"9\",\"20\",\"11\",\"2\",\"13\",\"17\",\"16\",\"19\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891252', '1439279030', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('7', 'book', '图书', '1', '', '1', '{\"1\":[\"3\",\"93\",\"12\",\"51\",\"82\",\"101\",\"83\",\"92\",\"84\",\"5\"],\"2\":[\"106\",\"107\",\"108\",\"91\",\"90\",\"89\",\"88\",\"87\",\"86\",\"85\",\"10\",\"49\",\"14\",\"9\",\"20\",\"55\",\"56\",\"11\",\"2\",\"13\",\"17\",\"16\",\"19\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891252', '1439279042', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('8', 'clothe', '服装鞋包', '1', '', '1', '{\"1\":[\"3\",\"96\",\"12\",\"55\",\"51\",\"56\",\"94\",\"95\",\"99\",\"97\"],\"2\":[\"109\",\"110\",\"111\",\"49\",\"98\",\"10\",\"100\",\"14\",\"5\",\"9\",\"20\",\"11\",\"2\",\"13\",\"17\",\"16\",\"19\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '0', '', '', '1383891252', '1439279054', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('9', 'groupbuying', '团购', '1', '', '1', '{\"1\":[\"3\",\"12\",\"113\",\"51\",\"117\",\"14\",\"55\",\"56\",\"16\"],\"2\":[\"9\",\"2\",\"5\",\"17\",\"10\",\"20\",\"11\",\"13\",\"49\",\"19\"]}', '1:基础,2:扩展', null, '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '10', '', '', '1438711051', '1439279066', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('10', 'limitbuying', '限时抢购', '1', '', '1', '{\"1\":[\"3\",\"12\",\"114\",\"51\",\"118\",\"14\",\"55\",\"56\",\"10\"],\"2\":[\"49\",\"2\",\"20\",\"5\",\"19\",\"9\",\"11\",\"13\",\"17\",\"16\"]}', '1:基础,2:扩展', null, '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '10', '', '', '1438712763', '1439279084', '1', 'MyISAM');
INSERT INTO `yershop_model` VALUES ('11', 'reserve', '预约', '1', '', '1', '{\"1\":[\"3\",\"115\",\"12\",\"51\",\"119\",\"14\",\"120\",\"5\",\"55\",\"56\"],\"2\":[\"49\",\"2\",\"13\",\"9\",\"20\",\"11\",\"10\",\"17\",\"19\",\"16\"]}', '1:基础,2:扩展', null, '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除,[SEE]|预览', '10', '', '', '1438750712', '1439279094', '1', 'MyISAM');

-- ----------------------------
-- Table structure for `yershop_order`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_order`;
CREATE TABLE `yershop_order` (
  `id` int(225) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `orderid` varchar(225) NOT NULL DEFAULT '',
  `tag` varchar(225) NOT NULL DEFAULT '',
  `total_money` decimal(50,2) NOT NULL DEFAULT '0.00',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-系统生成完成1-用户已提交订单2-3系统处理进入物流配送',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `ship_price` decimal(50,2) NOT NULL DEFAULT '0.00',
  `ispay` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1在线支付未完成2在线支付完成3-货到付款',
  `total` decimal(50,2) NOT NULL DEFAULT '0.00',
  `express` varchar(225) NOT NULL DEFAULT '' COMMENT '是否默认地址',
  `addressid` int(10) unsigned NOT NULL DEFAULT '0',
  `shipway` varchar(225) NOT NULL DEFAULT '' COMMENT '送货方式',
  `invoice` varchar(225) NOT NULL DEFAULT '' COMMENT '发票',
  `message` varchar(225) NOT NULL DEFAULT '' COMMENT '留言',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `coupon` varchar(225) NOT NULL DEFAULT '',
  `coupon_money` decimal(50,2) NOT NULL DEFAULT '0.00',
  `send_name` varchar(225) NOT NULL DEFAULT '',
  `send_contact` varchar(225) NOT NULL DEFAULT '',
  `send_address` varchar(225) NOT NULL DEFAULT '',
  `express_code` varchar(225) DEFAULT NULL,
  `score_money` decimal(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='订单表';


-- ----------------------------
-- Table structure for `yershop_pay`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_pay`;
CREATE TABLE `yershop_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `out_trade_no` varchar(100) NOT NULL DEFAULT '',
  `money` decimal(50,2) NOT NULL DEFAULT '0.00' COMMENT '优惠后的总金额',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '付款类型1-货到付款2-在线支付',
  `uid` int(10) NOT NULL DEFAULT '0',
  `total` decimal(50,2) NOT NULL DEFAULT '0.00',
  `yunfee` decimal(50,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `ratio` decimal(50,2) NOT NULL DEFAULT '0.00' COMMENT '积分抵消金额',
  `ratioscore` int(10) NOT NULL DEFAULT '0' COMMENT '消耗积分',
  `coupon` decimal(50,2) NOT NULL DEFAULT '0.00',
  `couponcode` varchar(255) NOT NULL DEFAULT '',
  `callback` varchar(255) NOT NULL DEFAULT '0',
  `addressid` varchar(255) NOT NULL DEFAULT '0' COMMENT '地址',
  `url` varchar(255) NOT NULL DEFAULT '0',
  `param` text,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='在线支付表';

-- ----------------------------
-- Records of yershop_pay
-- ----------------------------
INSERT INTO `yershop_pay` VALUES ('6', 'E9282656184831153324', '299.00', '2', '2', '1', '299.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1443426567', '0');
INSERT INTO `yershop_pay` VALUES ('7', 'EA013809482125649408', '3651.00', '2', '2', '1', '3651.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1443638135', '0');
INSERT INTO `yershop_pay` VALUES ('8', 'EA060487535780144936', '23.90', '2', '2', '1', '13.90', '10.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444105012', '0');
INSERT INTO `yershop_pay` VALUES ('9', 'EA071884205340591131', '99.00', '2', '2', '1', '99.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444218847', '0');
INSERT INTO `yershop_pay` VALUES ('10', '20151014442195721', '99.00', '2', '2', '1', '99.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444219578', '0');
INSERT INTO `yershop_pay` VALUES ('11', '20151014442209831', '99.00', '2', '2', '1', '99.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444220986', '0');
INSERT INTO `yershop_pay` VALUES ('12', '2015102217721', '99.00', '2', '2', '1', '99.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444221775', '0');
INSERT INTO `yershop_pay` VALUES ('13', '2015102340061', '99.00', '2', '2', '1', '99.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444234008', '0');
INSERT INTO `yershop_pay` VALUES ('14', '2015102341141', '23.90', '2', '2', '1', '13.90', '10.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444234116', '0');
INSERT INTO `yershop_pay` VALUES ('15', '2015102352591', '23.90', '2', '2', '1', '13.90', '10.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444235262', '0');
INSERT INTO `yershop_pay` VALUES ('16', '2015102778081', '4999.00', '2', '2', '1', '4999.00', '0.00', '0.00', '0', '0.00', '', '0', '8', '0', null, '1444277831', '0');

-- ----------------------------
-- Table structure for `yershop_picture`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_picture`;
CREATE TABLE `yershop_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_picture
-- ----------------------------
INSERT INTO `yershop_picture` VALUES ('1', '/Uploads/Picture/2014-09-02/5405e0f3b1705.png', '', '36d077267c76901835c07eb98f43647f', '0f7ce26261cb7a81dcfb14e057982ec60fa3a6e0', '1', '1409671411');
INSERT INTO `yershop_picture` VALUES ('2', '/Uploads/Picture/2014-09-18/5419eb4fec0c7.jpg', '', '5435a1dae36fafc2e544f2f78854fb29', 'd93a6e9869e7bf2fc17a533d3060ade8c88c40a9', '1', '1410984783');
INSERT INTO `yershop_picture` VALUES ('3', '/Uploads/Picture/2014-09-22/541f3d86103d3.jpg', '', '8e77701a8b49232f17d7f13d91d40693', '4dd3a9e9938d8890db37452b3abe6ff91ead531a', '1', '1411333508');
INSERT INTO `yershop_picture` VALUES ('4', '/Uploads/Picture/2014-09-22/541ff48c48dcf.jpg', '', 'e23489fd7e4dcc3dffaecbdef316bc97', '212c69983a3aaae6e379c68521523f847f5065fc', '1', '1411380364');
INSERT INTO `yershop_picture` VALUES ('5', '/Uploads/Picture/2014-09-27/5426973d68594.jpg', '', 'b1cc728f0903646228442f12afec0559', '2dbeabe21876fe2e489eeaf8e71f9de9c6465886', '1', '1411815228');
INSERT INTO `yershop_picture` VALUES ('6', '/Uploads/Picture/2014-09-28/54282d125f21a.jpg', '', 'da9f27eee154037434fbad74dc73430a', 'd3299248c9946cb94e7f5eeaaa7818fe750ad9de', '1', '1411919121');
INSERT INTO `yershop_picture` VALUES ('7', '/Uploads/Picture/2014-09-28/54282f255e437.jpg', '', '2e1205543c59f21e6317c2adf56a64ae', '1ad27e3a47c074ab9b7ed3b2d0aff5f8f848a17f', '1', '1411919653');
INSERT INTO `yershop_picture` VALUES ('8', '/Uploads/Picture/2014-09-29/54284e0bb791c.jpg', '', '314edb167e8e67abe5fadb9ecb56a5bb', 'b7a1cf4f226334a39db5fa7351e3c696d3d562b3', '1', '1411927563');
INSERT INTO `yershop_picture` VALUES ('9', '/Uploads/Picture/2014-09-29/5428505721fe3.jpg', '', '3a9cfc025a0b8ae90939d080b6b0b3da', 'f0e1654339c40d42da7037cae6b26cef1336570b', '1', '1411928151');
INSERT INTO `yershop_picture` VALUES ('10', '/Uploads/Picture/2014-09-29/542851809c5fe.jpg', '', 'b7e3396d129e2501f393c5fbb59080d5', '1961d4b5d20e1ac3d50000570535ca41b5fa8c44', '1', '1411928448');
INSERT INTO `yershop_picture` VALUES ('11', '/Uploads/Picture/2014-10-22/5447bf1b8a10a.jpg', '', '4182ad0929a3a535f11273c31a7fd16b', 'b36f727aada45dd67f8206b978c46afc4b1254e6', '1', '1413988123');
INSERT INTO `yershop_picture` VALUES ('12', '/Uploads/Picture/2014-10-23/54481f89ef4dc.gif', '', '40e797c3661da89e463bf739b819a4fd', 'bba0f04434413fb63c3e6d82fe74d0ece7b647bf', '1', '1414012809');
INSERT INTO `yershop_picture` VALUES ('13', '/Uploads/Picture/2014-10-25/544a986712125.jpg', '', '5332d06200bc87cbeddefea48859eb87', 'e2207e6f2b7f0d7c6f9392ab70eb99b6a14f473b', '1', '1414174821');
INSERT INTO `yershop_picture` VALUES ('14', '/Uploads/Picture/2014-10-25/544a994e1e338.jpg', '', 'ad1a25faa262cf395b42b4aa4aead8cf', 'e08dc9cbab906cbeea1e036deaf3b791d6db4f9e', '1', '1414175054');
INSERT INTO `yershop_picture` VALUES ('15', '/Uploads/Picture/2014-10-26/544cff452d8fa.jpg', '', 'c1b04f3754108967f1edd5c94657095e', 'd1726508f25b1ef354d48586797a82da18503726', '1', '1414332229');
INSERT INTO `yershop_picture` VALUES ('16', '/Uploads/Picture/2014-10-26/544cffc5540ee.jpg', '', 'aac9bafdb67dc58312b65e001ea84540', '068acddf258436463eee6915e919a13f5e3877fe', '1', '1414332357');
INSERT INTO `yershop_picture` VALUES ('17', '/Uploads/Picture/2014-10-26/544d19999e40b.png', '', '20887db6ea7f9b810bd6d3ec5e91695b', 'f37a6e21817dd2a4163b3a5bdd05380c8a88efe1', '1', '1414338969');
INSERT INTO `yershop_picture` VALUES ('18', '/Uploads/Picture/2014-10-26/544d19be81949.jpg', '', 'da5fdeaed09a782168e78b6907b45a44', 'd8bb619b09799c52eb8b08ca292fd53ef405aea3', '1', '1414339006');
INSERT INTO `yershop_picture` VALUES ('19', '/Uploads/Picture/2014-10-27/544d1abbbd6b0.jpg', '', 'db8ea2928ce128693663d2252698bd05', '4dd01d2d86525d61ec12e44779959eb4cc074d9d', '1', '1414339259');
INSERT INTO `yershop_picture` VALUES ('20', '/Uploads/Picture/2014-10-27/544d2707616a5.png', '', '31f9e56579f958ff1a9eac6e040c4c20', '608746815de21abbfbee5f646bcb9b747a996c1f', '1', '1414342406');
INSERT INTO `yershop_picture` VALUES ('21', '/Uploads/Picture/2014-10-27/544d2792b3e05.png', '', '8a6d4676b58e25f538dc037337b28a6c', 'ef346ce444e1f5a117e388aa5fc018df4d623673', '1', '1414342546');
INSERT INTO `yershop_picture` VALUES ('22', '/Uploads/Picture/2014-10-27/544d27e160e6b.png', '', '0b2fdd0c3a198bc9b4034567e0bb112c', '05b9f8b88fff5b614b3d55fd8e617722d1bc7d93', '1', '1414342625');
INSERT INTO `yershop_picture` VALUES ('23', '/Uploads/Picture/2014-10-27/544d283099170.png', '', 'b7a5ed3253065b3e2540e779487d5767', 'a06b5bfe54272aedd2d645c560a1d836cd853bcc', '1', '1414342704');
INSERT INTO `yershop_picture` VALUES ('24', '/Uploads/Picture/2014-10-27/544d2b43ddf15.png', '', 'ff85333e81966a8cb8f012e59eeb749f', 'b430506b7467ff4842d396d5602a2ac511aea4b6', '1', '1414343491');
INSERT INTO `yershop_picture` VALUES ('25', '/Uploads/Picture/2014-10-29/5450091034207.png', '', 'f7aec314e1916bf12a46caf55ea947ac', '0b5fe01203ea843d9ce57ec076deba6686b972fc', '1', '1414531343');
INSERT INTO `yershop_picture` VALUES ('27', '/Uploads/Picture/2014-11-11/546215b4b6e52.jpg', '', '6d5df175cf29abedfc8f0e53dce5e67f', '062053c9b9b7f50d318256e3097703c673677c3b', '1', '1415714228');
INSERT INTO `yershop_picture` VALUES ('28', '/Uploads/Picture/2014-11-14/546589a1c7307.jpg', '', 'ed01c74e75defefd23adadae4196d072', 'e1cc9e73a601a38f24df7764f7bd3c0b5564b4c3', '1', '1415940508');
INSERT INTO `yershop_picture` VALUES ('29', '/Uploads/Picture/2014-11-14/546589bc2eedd.jpg', '', '5fa189f582f2b4765d088b027ca91fff', '71a9c92226ea62c783db412152e749339f708efc', '1', '1415940534');
INSERT INTO `yershop_picture` VALUES ('30', '/Uploads/Picture/2014-11-19/546c698c56d1b.jpg', '', '6b089282ea53101d7f783027daa77eff', 'ed0bda3434ac7951cfa576cf7ae98f3c877a64fd', '1', '1416391052');
INSERT INTO `yershop_picture` VALUES ('31', '/Uploads/Picture/2014-11-19/546c6af47eaac.gif', '', '79c79ce53b7ebc92059438f36aeec565', 'acd669ce9b6d309cad08b71972e8c093ee40238b', '1', '1416391412');
INSERT INTO `yershop_picture` VALUES ('32', '/Uploads/Picture/2014-12-11/548954c9e88fd.png', '', 'eae5fa6c1d7e5fc04d03f7d2210c1caf', '8eec63249735814e90f04448c7eb8236b377afb2', '1', '1418286281');
INSERT INTO `yershop_picture` VALUES ('33', '/Uploads/Picture/2015-01-13/54b4be107a909.jpg', '', '4f1dc467c583d89e6e5a6342d0d2c575', '4079777aeae1d874c5c6af299752f0ecd2cd3e2e', '1', '1421131279');
INSERT INTO `yershop_picture` VALUES ('34', '/Uploads/Picture/2015-01-13/54b4c2a55097d.jpg', '', '13467d9159d9a4f3e7e1428150c8e038', '5a366a06a358029355fc264453bc424c177062f9', '1', '1421132453');
INSERT INTO `yershop_picture` VALUES ('35', '/Uploads/Picture/2015-01-13/54b4c82d6ce82.jpg', '', '5e507c7b9f98789e3da9f1c30591dead', '2d5ee85fa5999bf188b2f9bc6835b9dc9b2582f8', '1', '1421133869');
INSERT INTO `yershop_picture` VALUES ('36', '/Uploads/Picture/2015-01-13/54b4d99370fa7.jpg', '', '4aed3d40f223ee7282b6a25362706552', '6b6fa14ac7b822bde4ddb8918a6cb3f6d39bb947', '1', '1421138323');
INSERT INTO `yershop_picture` VALUES ('37', '/Uploads/Picture/2015-01-13/54b4e5fd4a1d4.jpg', '', '79b8e026da3e9305cf053f4c67847383', 'b1902c912f84a3fa50736e8e772ee2fdfbd9e778', '1', '1421141500');
INSERT INTO `yershop_picture` VALUES ('38', '/Uploads/Picture/2015-01-13/54b4f38766a1c.jpg', '', '8344b79471a49874961f7bacfc0ebff0', '763ea118453c7142d3ca7728d164de06299f9c7a', '1', '1421144966');
INSERT INTO `yershop_picture` VALUES ('39', '/Uploads/Picture/2015-01-13/54b4ff7458068.jpg', '', 'c7b49ecc3beb01cc257d529636731adc', '4d108c216f2d12f08d4141acd776756c90af5d5b', '1', '1421148020');
INSERT INTO `yershop_picture` VALUES ('40', '/Uploads/Picture/2015-01-13/54b50f1cece1c.jpg', '', 'f9038e593b7d211e942676668bf7ee0a', '22e3b7b1759fba15108c689edfae276e5db048b0', '1', '1421152028');
INSERT INTO `yershop_picture` VALUES ('41', '/Uploads/Picture/2015-01-13/54b51e59e212b.jpg', '', '61d2c2e7b20e6e11d37c757466d78336', 'c8f5b405d82103f13c2af44113fffd9b06cc70f5', '1', '1421155929');
INSERT INTO `yershop_picture` VALUES ('42', '/Uploads/Picture/2015-01-13/54b51e820573d.jpg', '', '93be5c427935a0deef1f39db5e38e280', '95f9aa79c54165400c19bf20bfdbf0935f9d1a8a', '1', '1421155969');
INSERT INTO `yershop_picture` VALUES ('43', '/Uploads/Picture/2015-01-13/54b51ed0c4fb0.jpg', '', '9ebc6c765eb96d8c5d265247ba800195', 'fe0d1977e5f0aa17038349026dc7c8426c30b996', '1', '1421156048');
INSERT INTO `yershop_picture` VALUES ('44', '/Uploads/Picture/2015-01-13/54b51fdb585e3.jpg', '', 'db8585cf7faf56c12cc8ba42724bb0c7', '85747087ad68234679ed4f54474a029442a060ee', '1', '1421156315');
INSERT INTO `yershop_picture` VALUES ('45', '/Uploads/Picture/2015-01-13/54b521162bc8e.jpg', '', 'd8991eb8728e24d10afbb7d53bd271b8', 'c936375d3aeb018bb41a22b5e249f24d954a5e9a', '1', '1421156630');
INSERT INTO `yershop_picture` VALUES ('46', '/Uploads/Picture/2015-01-13/54b5212a8e4b0.jpg', '', '8d81382d4cb87728c079b31896a12530', 'd86824d872d76d2caadd7d5f3bbc2e54ebf50567', '1', '1421156650');
INSERT INTO `yershop_picture` VALUES ('47', '/Uploads/Picture/2015-01-13/54b5215927817.jpg', '', 'c37deb2b29cdc4bc9f88446fe4d4671b', '6910092082bc43e0c49087153fe8501bab58056b', '1', '1421156697');
INSERT INTO `yershop_picture` VALUES ('48', '/Uploads/Picture/2015-01-13/54b525eb02811.jpg', '', '98f358bc82f961315b55e5e6751b00f0', '34f4dfb7d1db78a316a90ce4ca7c9f2c22700c65', '1', '1421157866');
INSERT INTO `yershop_picture` VALUES ('49', '/Uploads/Picture/2015-01-13/54b5268ab8cdb.jpg', '', '40ff32e20a184d64696b68ba4ab766eb', '63ac4ec5c6bcf04f9d173e1a15fccb25adf91711', '1', '1421158026');
INSERT INTO `yershop_picture` VALUES ('50', '/Uploads/Picture/2015-01-13/54b526dd8bfa8.jpg', '', '2d99963c567de0d314fc0933c9026945', '81c4a321554aa5e624e04ea5023f8da696f1948c', '1', '1421158108');
INSERT INTO `yershop_picture` VALUES ('51', '/Uploads/Picture/2015-01-13/54b53234efd57.jpg', '', '72e49d3daad7e64460bfd70b4965f2ed', '9ddde71e90f6a24d7172cd08c01bf3d7459f283d', '1', '1421161012');
INSERT INTO `yershop_picture` VALUES ('52', '/Uploads/Picture/2015-01-13/54b532434e821.jpg', '', 'ddf360f93cce844277f9ea9b6d3f199e', '48203957d6eeb1ae703863225a198de7f7917c49', '1', '1421161027');
INSERT INTO `yershop_picture` VALUES ('53', '/Uploads/Picture/2015-01-14/54b6011980614.png', '', '9547507bf8e1337740e23198fc1a002b', '6bb198392531782907600820afbf901da705f51c', '1', '1421213977');
INSERT INTO `yershop_picture` VALUES ('54', '/Uploads/Picture/2015-01-16/54b8a92a3928d.jpg', '', '2b9555848288b11c6abddc2ef30d7c02', 'a9be35e83640630e1415538160d0f023cecd40d9', '1', '1421388073');
INSERT INTO `yershop_picture` VALUES ('56', '/Uploads/Picture/2015-01-16/54b8a9c6c9231.jpg', '', 'ced3bb1c980e258fbe7802af44c72e6d', '5dc332586535cf6cdd4c7365071eb8162c1deed8', '1', '1421388230');
INSERT INTO `yershop_picture` VALUES ('57', '/Uploads/Picture/2015-01-16/54b8a9ea0eb89.jpg', '', '4bc9ae5483e80cae3b442accca669801', 'af59fdbb47f0a14f50d3271ae4a93c3c0e6cf6dc', '1', '1421388265');
INSERT INTO `yershop_picture` VALUES ('58', '/Uploads/Picture/2015-01-16/54b8aa06e86dd.jpg', '', 'd07c82a1f31a1827a85df3c2647c502f', '4f9ae10835fd41e71b543ca7ccd257dedfd225ba', '1', '1421388294');
INSERT INTO `yershop_picture` VALUES ('59', '/Uploads/Picture/2015-01-16/54b8aa41968db.jpg', '', 'ed39cc1c818866725ce2af8c86330bb0', 'd78b45b8f6e3ec8498e2e47729fe1d584081cfba', '1', '1421388353');
INSERT INTO `yershop_picture` VALUES ('60', '/Uploads/Picture/2015-01-16/54b8b814bbc1d.jpg', '', 'd0c48300df72a1aebc8c7107c110c2b5', '2bcee7e5a0ca199fd51dcd7cd314937ca500fc68', '1', '1421391892');
INSERT INTO `yershop_picture` VALUES ('62', '/Uploads/Picture/2015-01-16/54b8faf9057ec.jpg', '', '78cc6b8e3a5b5b3ca88592c46201a5e6', '2d01650ce9e6ceef5ca15275c28a2facf0bca071', '1', '1421409016');
INSERT INTO `yershop_picture` VALUES ('63', '/Uploads/Picture/2015-01-17/54ba6dd86b7f6.png', '', '32d62534d0bdca11e52f497d4521de4f', '20952d59f0872d287c326c593b7c7106c5a8313a', '1', '1421503959');
INSERT INTO `yershop_picture` VALUES ('64', '/Uploads/Picture/2015-01-17/54ba6f0fd2e6e.jpg', '', '37a3108bfd3a190aa5ffb86fcc2669a4', 'c7df8683963c486e84e1fb13487092d1274dfe81', '1', '1421504271');
INSERT INTO `yershop_picture` VALUES ('65', '/Uploads/Picture/2015-01-17/54ba6fef11267.jpg', '', 'bb34caff6f4980ddb5ce14099405c8a8', '4118731b563cc928d66198d3b2b052a1b16a3c2b', '1', '1421504494');
INSERT INTO `yershop_picture` VALUES ('66', '/Uploads/Picture/2015-01-17/54ba71227fe48.png', '', 'cf29142c91442b346081e8ba552e7c8f', 'b5e21188f144541321904995805ac62353637c78', '1', '1421504802');
INSERT INTO `yershop_picture` VALUES ('67', '/Uploads/Picture/2015-01-17/54ba72711673e.png', '', 'd695af9dcb860211b01c4074b33e553f', '25dad847b4a7ba4606e1974642727eb03f287485', '1', '1421505136');
INSERT INTO `yershop_picture` VALUES ('68', '/Uploads/Picture/2015-01-17/54ba734b52ed7.jpg', '', '10f51f401227db216b2edc6aff2c7526', 'cbcfc84ce9abc823f8cf136b90d895eb91403197', '1', '1421505355');
INSERT INTO `yershop_picture` VALUES ('69', '/Uploads/Picture/2015-02-02/54cf72354728f.png', '', 'c7e4d1a1e20e8b8aaf06a3b9c36c6ee4', '2a98aaa5f2addb4dc5b3a0f91c081b3dfb749434', '1', '1422881332');
INSERT INTO `yershop_picture` VALUES ('70', '/Uploads/Picture/2015-02-02/54cf72bedda19.png', '', '8b0fbcbf45b1d1d644497d1cd297a966', '5ab4f924e942405d80bb3b78495f14142ed5160d', '1', '1422881470');
INSERT INTO `yershop_picture` VALUES ('71', '/Uploads/Picture/2015-02-02/54cf732806f5c.jpg', '', '9fcdf136e8c8ecb5474feb55be350b19', '045973b1a1adb13024a527d2ce20f66452afd5e1', '1', '1422881575');
INSERT INTO `yershop_picture` VALUES ('72', '/Uploads/Picture/2015-02-02/54cf732eb78b2.jpg', '', 'a776e4dde58b4c05a0dc58328936f59c', '78236fb8d76a9bdb5d52aa1d62f08c2f6f8eb883', '1', '1422881582');
INSERT INTO `yershop_picture` VALUES ('73', '/Uploads/Picture/2015-02-02/54cf75ac91fbf.jpg', '', '981d7e1b22ffefddf4d1f869f46722d6', '1f28d80d3cd1c14e148b4f50cebef35e28c95c44', '1', '1422882220');
INSERT INTO `yershop_picture` VALUES ('74', '/Uploads/Picture/2015-02-02/54cf77fe05588.jpg', '', '9baf244e0b0463f1fad243bc31517f35', 'ba3e0a5bdf0aa0b1691b3307aa5a13cfb5863a61', '1', '1422882813');
INSERT INTO `yershop_picture` VALUES ('75', '/Uploads/Picture/2015-02-02/54cf78aed5675.jpg', '', '6b60fcfb3127c84f13781d8dd7a05cca', '8f2e3660a7264405096c798ed259865d3435c817', '1', '1422882990');
INSERT INTO `yershop_picture` VALUES ('76', '/Uploads/Picture/2015-02-02/54cf78f6e4958.jpg', '', '28670c955115c19deac649e3834525b1', 'd1afd3ee798183fce3184777da988b64498a1503', '1', '1422883062');
INSERT INTO `yershop_picture` VALUES ('77', '/Uploads/Picture/2015-02-02/54cf79b6a29d4.jpg', '', 'c89e3d67600e5d293e603bef2830637a', '9a02e8e4e70b528e44bcf9b80fcfb068da4c51ea', '1', '1422883253');
INSERT INTO `yershop_picture` VALUES ('78', '/Uploads/Picture/2015-02-02/54cf7a9688bc7.jpg', '', '09134a7d63c4a5d6c12569d6cbd8e50d', 'bb20d71938795bb2a60707646f4344214e0bc974', '1', '1422883478');
INSERT INTO `yershop_picture` VALUES ('79', '/Uploads/Picture/2015-02-02/54cf7a9a798b2.jpg', '', '3ca8af1b66fb6b6af8ad5271a509ee95', '6e847640f9a5354ed836278b267cc7f177ff541a', '1', '1422883482');
INSERT INTO `yershop_picture` VALUES ('85', '/Uploads/Picture/2015-03-22/550e50360c452.jpg', '', '8911ed312eb1f294249279a45f243c56', 'd7fa425aa4a47bdce6c78068c33d826d41bc3dfb', '1', '1427001397');
INSERT INTO `yershop_picture` VALUES ('86', '/Uploads/Picture/2015-03-22/550e5099e214b.jpg', '', 'f46f9cafebf0455b71445d9b3816129f', '20781f4980f008edb3b4d99b111df99a35db9b57', '1', '1427001497');
INSERT INTO `yershop_picture` VALUES ('87', '/Uploads/Picture/2015-04-09/55269aabe2c22.jpg', '', 'b9ac440cffe584d4b42afd3e5b46164e', '80efeb3ec9f9b370317308c39668bceb2156f3c1', '1', '1428593323');
INSERT INTO `yershop_picture` VALUES ('88', '/Uploads/Picture/2015-04-09/55269c49e8122.jpg', '', '49c0e046afebe35b80b5d3af7f6d2db6', '0470b35332d559f2b5262f3287d029e6a814d83c', '1', '1428593737');
INSERT INTO `yershop_picture` VALUES ('89', '/Uploads/Picture/2015-04-10/5527d68115da9.jpg', '', '3793a9f51dc253dcb9f7c4e8db02cd2e', 'dfb02188c1d0d8d4b98ca51e15ec7166cef3b670', '1', '1428674175');
INSERT INTO `yershop_picture` VALUES ('90', '/Uploads/Picture/2015-04-10/5527db52187cf.jpg', '', '90d78f3df758242fe166f3da9225cd66', '56520b70805d39f89ddd78de5dd34e608b3e59e5', '1', '1428675409');
INSERT INTO `yershop_picture` VALUES ('91', '/Uploads/Picture/2015-04-10/5527dc490d4ac.jpg', '', '822ed85af6678e2734a165d754063ac7', '2e33680d745c7e183adb56abe001d1e25b6fd00d', '1', '1428675656');
INSERT INTO `yershop_picture` VALUES ('92', '/Uploads/Picture/2015-04-10/5527ee792ea89.jpg', '', '246e2d15d771743f5166a3623a36dabb', '6832aad682678e2369eae6a6b9d35a2255553644', '1', '1428680312');
INSERT INTO `yershop_picture` VALUES ('93', '/Uploads/Picture/2015-04-10/5527f30991c46.jpg', '', '7445c8217e61c4ab9a6c3892fab823b8', '66acb2251ec28687fd87f88dea16aeb8abcb077d', '1', '1428681481');
INSERT INTO `yershop_picture` VALUES ('94', '/Uploads/Picture/2015-04-11/55280a206b637.jpg', '', 'b7d79e066665100302643177a75d8c01', 'c2ffd9ec9a544453468e86f64defa80439e9c0bf', '1', '1428687392');
INSERT INTO `yershop_picture` VALUES ('95', '/Uploads/Picture/2015-04-11/552836be64be2.png', '', 'b1c2965b23fc2bcb316f41384438c47d', 'c48e297f88c41d828d23387f7f8c5f8d239f24d0', '1', '1428698813');
INSERT INTO `yershop_picture` VALUES ('96', '/Uploads/Picture/2015-04-11/552838b5a0cdc.png', '', '054662115c58fc4b0256e8f08b124a97', '64877c58b93f82123bb37652c56c28d3af9bd36c', '1', '1428699317');
INSERT INTO `yershop_picture` VALUES ('97', '/Uploads/Picture/2015-04-11/55283a2291874.jpg', '', '06ac839c2ace588adad083ce167a1a28', 'b4c04ee19d17f3d59196f96674aa0492a900d4f0', '1', '1428699682');
INSERT INTO `yershop_picture` VALUES ('98', '/Uploads/Picture/2015-04-11/55283cde0ce3a.png', '', 'e580684c9273fe9e40aebd26a24012ea', 'a44c1c483105bf51aa1d8567db3a668fbe3e76d4', '1', '1428700381');
INSERT INTO `yershop_picture` VALUES ('99', '/Uploads/Picture/2015-04-11/55283e42b0bca.jpg', '', '9df82f543248e67f8ae8d56f6776ffae', '628295fea8946c2a607260c8bb1795756031e711', '1', '1428700738');
INSERT INTO `yershop_picture` VALUES ('100', '/Uploads/Picture/2015-04-11/55283f37d7a9d.png', '', '6ce1b6a3cf2a19699398bf85addfe778', '51adc087979d9575b68df3733459a63d15ee5cbc', '1', '1428700983');
INSERT INTO `yershop_picture` VALUES ('101', '/Uploads/Picture/2015-04-11/55283fbe4255c.png', '', 'fe96c1ded9564d83fd08c1aaec9a39e8', 'bf3500bc330f8924fc8021cef0b9af57b5b3188d', '1', '1428701118');
INSERT INTO `yershop_picture` VALUES ('102', '/Uploads/Picture/2015-04-11/55283feb3ea33.png', '', '515c2a1f4ac9081e658535182c0757af', 'c91c8fe91196a8579d744c3aca16f4757b1c12b2', '1', '1428701163');
INSERT INTO `yershop_picture` VALUES ('103', '/Uploads/Picture/2015-04-11/55284132b0ca4.png', '', 'c98e6acef9bdc46a17a34963ae33e46b', '24db363f4e6ead88a17f81b512e20c2d7e305192', '1', '1428701490');
INSERT INTO `yershop_picture` VALUES ('104', '/Uploads/Picture/2015-04-11/552844aec508a.png', '', '7050c0f2772127fbd703b8e8f9a55567', 'fc2637c6f5bd9d9c9f61ade1409206be5ae0e9ea', '1', '1428702382');
INSERT INTO `yershop_picture` VALUES ('105', '/Uploads/Picture/2015-04-12/5529609351746.jpg', '', '9252251518c003c0449de8255a29008a', '27e9a440efbf3b3a3d66e449f8c7f6d5c4946a32', '1', '1428775058');
INSERT INTO `yershop_picture` VALUES ('106', '/Uploads/Picture/2015-04-12/55296117aaa5a.jpg', '', 'b32954da1b63eed29df9cb297e901f3c', '122292da64ba3800f9c9578e398ccc1b3825a85f', '1', '1428775191');
INSERT INTO `yershop_picture` VALUES ('107', '/Uploads/Picture/2015-04-12/552963b88f304.png', '', '532b5d8f55d217ae091c2aaea8952434', 'dcb961e4fd0a94d97b7ed7e3bcaa389eb683f288', '1', '1428775864');
INSERT INTO `yershop_picture` VALUES ('108', '/Uploads/Picture/2015-04-12/5529676d374b2.jpg', '', '476164225841ee11090cad1087737c6d', 'ababb25797337de27b2f55a1c8b8d308750b21ba', '1', '1428776813');
INSERT INTO `yershop_picture` VALUES ('109', '/Uploads/Picture/2015-04-12/552970f38f8ce.jpg', '', '10e4b0aa28a3e83a9da810e5c4fd7be8', '2b6f31bf2acc08d8b563a5c276eef41414b6d8e4', '1', '1428779251');
INSERT INTO `yershop_picture` VALUES ('110', '/Uploads/Picture/2015-04-12/55297549e52e5.jpg', '', '5dc0f04a2ecaebc9f94f3ec2e92e9ef7', '254fc303c8f33956246c8e96eeb905f525ea43ef', '1', '1428780361');
INSERT INTO `yershop_picture` VALUES ('111', '/Uploads/Picture/2015-04-12/5529f7b65062e.png', '', 'c1e607e3bf0b32bb419c001df23d30c6', 'b16eb57d68a25de2f79c4e487e0a867d2df87150', '1', '1428813750');
INSERT INTO `yershop_picture` VALUES ('112', '/Uploads/Picture/2015-04-12/5529f8e521a55.png', '', '4fd98d871331a1b30c8780e2cd783a59', 'ca9d562081c9166fcea14f5de1ece6cab2170150', '1', '1428814053');
INSERT INTO `yershop_picture` VALUES ('113', '/Uploads/Picture/2015-04-12/5529f913c1868.png', '', '4f50fbbee1c22e34e6d022e122ad67ad', '230d40ab050289a79c75c56f2832e7ef74551117', '1', '1428814099');
INSERT INTO `yershop_picture` VALUES ('114', '/Uploads/Picture/2015-04-13/552b6aca5f9ca.jpg', '', '40d3e4144df99d864a2ea853ae59f0a1', '0276d4148e923134344851c99c7e5934cce6be70', '1', '1428908746');
INSERT INTO `yershop_picture` VALUES ('115', '/Uploads/Picture/2015-07-08/559bf8c35401e.png', '', 'dad27efbcb483175b847ca425248bc2c', '3a0546626220d157f1f7de24b848f2dc4c34fdf1', '1', '1436285122');
INSERT INTO `yershop_picture` VALUES ('116', '/Uploads/Picture/2015-08-06/55c2dfbec3961.jpg', '', 'f233525fd790d5cf6d98af93e27d1002', '4e78944e9e32b852410e73bf83d7e2295a073e8d', '1', '1438834622');
INSERT INTO `yershop_picture` VALUES ('117', '/Uploads/Picture/2015-08-10/55c77dccadf30.png', '', '8075415e035cca2c493bd3d4d3cf636b', '6e6984b1442cf13aa258d80587204e8a8f2a2d61', '1', '1439137228');
INSERT INTO `yershop_picture` VALUES ('118', '/Uploads/Picture/2015-09-18/55faf2ac353a5.png', '', '02273f1c88dd109270b8658aaa50adb7', '03072f5a6ad8edebed49f2a2aaab0946fee911dc', '1', '1442509483');
INSERT INTO `yershop_picture` VALUES ('119', '/Uploads/Picture/2015-09-18/55faf2b05d1f7.jpg', '', 'f19560a9dce4d5856f8bd94ec4f94f7c', 'df47fefa04680b0f94333f73538369ac1a02a705', '1', '1442509488');
INSERT INTO `yershop_picture` VALUES ('120', '/Uploads/Picture/2015-09-18/55fbea25cce43.png', '', 'db6d75524ce0adbe0aa392e89db2c967', 'd5c00b55590a673c72f32bfef5f248eea2541b48', '1', '1442572836');
INSERT INTO `yershop_picture` VALUES ('121', '/Uploads/Picture/2015-09-18/55fbed7b89833.jpg', '', '85e8b28767fb07b93c2f0325c885890d', '680153590e2abd8b0751758b0b10fe488d8a132a', '1', '1442573691');
INSERT INTO `yershop_picture` VALUES ('122', '/Uploads/Picture/2015-09-18/55fbfa12f0583.jpg', '', '165a1f4c326e02c467e56017eb31341e', 'a41ebd344dc020cd14d49b45d48b05c0b5a014ae', '1', '1442576914');
INSERT INTO `yershop_picture` VALUES ('123', '/Uploads/Picture/2015-09-18/55fbfb43e5845.jpg', '', '75e3a97a6bf974893c19b188d5952eca', '192bffee7bcb4ff8682a4ebf0bc97cf6f1cfcdc4', '1', '1442577219');
INSERT INTO `yershop_picture` VALUES ('124', '/Uploads/Picture/2015-09-18/55fbfba4b5a30.jpg', '', '29e0e481e4642156586f85de4a56f241', '077944d495a9e2a9106ae86a4bed7b36a3200183', '1', '1442577316');
INSERT INTO `yershop_picture` VALUES ('125', '/Uploads/Picture/2015-09-18/55fbfbd2a1254.png', '', 'ce4df64ea0cf6ea03b1814ba39c9ac14', 'd4ac154920c0c2ec9bc37735066a38baf9b35042', '1', '1442577362');
INSERT INTO `yershop_picture` VALUES ('126', '/Uploads/Picture/2015-09-18/55fbfbfea4cec.jpg', '', '5750a2e4be1eabb48c387c1701285c19', 'bc2fad2962e2ed53ef9c7fd1d54ea2f183e3744b', '1', '1442577406');
INSERT INTO `yershop_picture` VALUES ('127', '/Uploads/Picture/2015-09-18/55fbfca553025.jpg', '', 'e5897ab5d0968219417382de088c9b51', 'fe762a96ec7b66522a573397aef54dfac790efb4', '1', '1442577572');
INSERT INTO `yershop_picture` VALUES ('128', '/Uploads/Picture/2015-09-18/55fbfefe3b46c.jpg', '', '9d63a525c72228392bc9995a2dccb804', '1128a13c77f928305aa74250c73849e0fdb66baa', '1', '1442578173');
INSERT INTO `yershop_picture` VALUES ('129', '/Uploads/Picture/2015-09-18/55fc06d81d259.png', '', 'c74ead772a7ef411298074a2cfda3b00', 'f81103f81942d48c7a08da5a7b902ae73c0d032f', '1', '1442580183');
INSERT INTO `yershop_picture` VALUES ('130', '/Uploads/Picture/2015-09-18/55fc0db08a573.png', '', '74e827839f9878de5ee040f501d44e24', '64da8dfcdeb5c91f21ef8c8d4e28e16c0988ec99', '1', '1442581936');
INSERT INTO `yershop_picture` VALUES ('131', '/Uploads/Picture/2015-09-18/55fc14f557c2b.jpg', '', 'febb770b7148c2554c89dc8f2aad47ef', '58e1fff98127903f37d0034ad4bfb89e1b24220b', '1', '1442583797');
INSERT INTO `yershop_picture` VALUES ('132', '/Uploads/Picture/2015-09-18/55fc25884bc20.jpg', '', '7ffeea044ed576b6c399aea469013995', '2491a13692bffc0ba29dcac65d0a51cb81870ec3', '1', '1442588039');
INSERT INTO `yershop_picture` VALUES ('133', '/Uploads/Picture/2015-09-18/55fc268046052.jpg', '', '2c2884ec3ad9671595f2c8ba7ec83e61', '208e93d8b664ad2c6cb0ed6613b85cb17d15735c', '1', '1442588287');
INSERT INTO `yershop_picture` VALUES ('134', '/Uploads/Picture/2015-09-18/55fc26c302c6c.jpg', '', 'cd8289f0b5e2cce081e64cf728a3dad9', '77359403d19d2d7758a38816ffc25e92de6f5071', '1', '1442588354');
INSERT INTO `yershop_picture` VALUES ('135', '/Uploads/Picture/2015-09-19/55fd2ce92c34a.png', '', 'beee2b89375a6b029a82fa8ca5ba6a07', '96f52b0bdb148e5bc82c9a195a36a7592784ae7c', '1', '1442655464');
INSERT INTO `yershop_picture` VALUES ('136', '/Uploads/Picture/2015-09-19/55fd2d31abbfb.png', '', '54529b60a5b44ae3551a316c51c5c732', 'a9b4dd9e304d61b8b0af4eed2204899b360d3958', '1', '1442655537');
INSERT INTO `yershop_picture` VALUES ('137', '/Uploads/Picture/2015-09-19/55fd2d7a24d4d.jpg', '', '8258766e1b790fb7c1fe5a2a9caa65d0', 'd6ded094cff01419050eeb23c39ce85812bf2ce8', '1', '1442655609');
INSERT INTO `yershop_picture` VALUES ('138', '/Uploads/Picture/2015-09-19/55fd2da7b3e38.jpg', '', 'fc9680b79fdb0a6b4cef1973f2b3e975', '9ea0bdb5c85eb2bbf31a2ea68f40b11b1e1e9363', '1', '1442655655');
INSERT INTO `yershop_picture` VALUES ('139', '/Uploads/Picture/2015-09-19/55fd2e824761b.png', '', '460076b755fda8aeab55b154d878eb2b', 'e06d5861fa44e30f3f74f912bf43b45039a4c9a1', '1', '1442655873');
INSERT INTO `yershop_picture` VALUES ('140', '/Uploads/Picture/2015-09-19/55fd2ea40f9eb.jpg', '', 'd82b42da9052d7d0c9941607966bd68b', '89e4ce2c36bcd3fb0ba08675d6193ef49a7018cc', '1', '1442655907');
INSERT INTO `yershop_picture` VALUES ('141', '/Uploads/Picture/2015-09-19/55fd2ed346ca2.jpg', '', '325a5b1e756187740de7876ee8217624', 'edb5db598f9e88235113d1238d882572b01b99fc', '1', '1442655954');
INSERT INTO `yershop_picture` VALUES ('142', '/Uploads/Picture/2015-09-19/55fd2f09a9c17.png', '', 'a0be05f9d4637a9369f21ec2a350a3d8', '05428eced8ae43f41d59a3ed1d616473a1c35e39', '1', '1442656009');
INSERT INTO `yershop_picture` VALUES ('143', '/Uploads/Picture/2015-09-19/55fd2f35c4d1b.png', '', 'cb5e8cc8a5e7835b1ce44cfe070c10d7', '3ba85af092c0a04b70fe5625f7bae675158c3fc2', '1', '1442656047');
INSERT INTO `yershop_picture` VALUES ('144', '/Uploads/Picture/2015-09-19/55fd2f63de016.jpg', '', '46b06af357db9e001e210da953943cad', '69310227d7099372e31924f6d0405489e52eb492', '1', '1442656099');
INSERT INTO `yershop_picture` VALUES ('145', '/Uploads/Picture/2015-09-19/55fd30a01fb76.png', '', 'e18a8be03a63aaf98309caeebcbb3ff6', '7143023f23da57142f4b2129201d65d06a0320ed', '1', '1442656415');
INSERT INTO `yershop_picture` VALUES ('146', '/Uploads/Picture/2015-09-19/55fd3107afdb4.png', '', '5f0924eb289d82e72956f98d5782cf34', 'b64e99156213aba7cec70a52796cac7c535aaf46', '1', '1442656519');
INSERT INTO `yershop_picture` VALUES ('147', '/Uploads/Picture/2015-09-21/55fef291d180a.jpg', '', '6bfa43f557fd45417a7332a1c76b9d0c', '4f5fc0d9bb35b82c7ed3524eb94cb00b9f0efb80', '1', '1442771601');
INSERT INTO `yershop_picture` VALUES ('148', '/Uploads/Picture/2015-09-21/55ff9daf421da.jpg', '', '8aa0ca20041c70a3a7ed52439ad17e87', '2104acbddfb7896074262f06629cd531eb051f44', '1', '1442815398');
INSERT INTO `yershop_picture` VALUES ('149', '/Uploads/Picture/2015-10-01/560c353d68810.jpg', '', 'd368c2e6e97c5ef8d3c5a28f9ff86272', '2ea38906b4184f9f3040ae2ca4e46ec057aac4a1', '1', '1443640636');
INSERT INTO `yershop_picture` VALUES ('150', '/Uploads/Picture/2015-10-01/560c36d681ed7.png', '', '89f9dc5aba8d7c17e33b54f8820113c8', '6d16bcd39d6af6cbca714833dd003ade7753f196', '1', '1443641046');
INSERT INTO `yershop_picture` VALUES ('151', '/Uploads/Picture/2015-10-01/560c398857058.jpg', '', 'cf14018177659b6cebc315af384e557d', '0bc0eccb7a8c0e41ec199adf74f42ca29b9426f2', '1', '1443641735');
INSERT INTO `yershop_picture` VALUES ('152', '/Uploads/Picture/2015-10-01/560c482057eb2.jpg', '', '0b79878d6e22f05624dc67c924a1403f', '4001e0b6b42b7e643dce002ec5825a22322e1518', '1', '1443645472');
INSERT INTO `yershop_picture` VALUES ('153', '/Uploads/Picture/2015-10-01/560c497ba8fab.jpg', '', '3cb499f3f19b59a4f764f854ffda13fd', 'a9c334d0aa35040fbb6eb5c87055557cd22f3899', '1', '1443645819');
INSERT INTO `yershop_picture` VALUES ('154', '/Uploads/Picture/2015-10-01/560c4c6a574dd.jpg', '', 'dbaa89d809c1f11a6be878a901cc6ef3', 'ee8a749b0cfe74f315710d08293499c104ccebc6', '1', '1443646570');
INSERT INTO `yershop_picture` VALUES ('155', '/Uploads/Picture/2015-10-01/560c4fbe38b7e.jpg', '', '3f6be98ec909bd442df7f3bdec87837d', '2febfa649830eaa2347dc78f3dcb3fc9f1ab0b31', '1', '1443647422');

-- ----------------------------
-- Table structure for `yershop_records`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_records`;
CREATE TABLE `yershop_records` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `ip` varchar(225) NOT NULL DEFAULT '',
  `url` varchar(225) NOT NULL DEFAULT '',
  `country` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(225) NOT NULL DEFAULT '',
  `province` varchar(225) NOT NULL DEFAULT '',
  `city` varchar(225) NOT NULL DEFAULT '',
  `isp` varchar(225) NOT NULL DEFAULT '',
  `referer` text  COMMENT '访问来源',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `page` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=336 DEFAULT CHARSET=utf8 COMMENT='ip访问记录表';


-- ----------------------------
-- Table structure for `yershop_reply`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_reply`;
CREATE TABLE `yershop_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `messageid` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(225) NOT NULL DEFAULT '' COMMENT '回复内容',
  `status` tinyint(2) NOT NULL COMMENT '默认0-未提交订单1-未读2-已读',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `group` varchar(225) NOT NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回复表';

-- ----------------------------
-- Records of yershop_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_reserve`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_reserve`;
CREATE TABLE `yershop_reserve` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cellphone` varchar(22) NOT NULL DEFAULT '' COMMENT '手机',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `goodid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of yershop_reserve
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_service`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_service`;
CREATE TABLE `yershop_service` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` varchar(225) NOT NULL DEFAULT '' COMMENT '订单号',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(225) NOT NULL DEFAULT '',
  `reason` varchar(225) NOT NULL DEFAULT '',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `assistant` int(10) unsigned NOT NULL DEFAULT '0',
  `backinfo` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='售后服务表';

-- ----------------------------
-- Records of yershop_service
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_shopcart`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_shopcart`;
CREATE TABLE `yershop_shopcart` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` varchar(225) NOT NULL DEFAULT '' COMMENT '排序',
  `parameters` varchar(225) NOT NULL DEFAULT '' COMMENT '参数',
  `price` decimal(50,2) NOT NULL DEFAULT '0.00',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='登录用户购物车表';

-- ----------------------------
-- Records of yershop_shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_shoplist`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_shoplist`;
CREATE TABLE `yershop_shoplist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `goodid` int(10) unsigned NOT NULL DEFAULT '0',
  `num` int(10) unsigned NOT NULL DEFAULT '0',
  `orderid` varchar(225) DEFAULT NULL COMMENT '订单号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '未提交订单1-表示已提交订单或已支付2-已完成3-退货4-换货',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(50,2) NOT NULL DEFAULT '0.00',
  `parameters` varchar(225) NOT NULL DEFAULT '' COMMENT '参数',
  `sort` varchar(225) NOT NULL DEFAULT '' COMMENT '序号',
  `iscomment` varchar(225) NOT NULL DEFAULT '',
  `total` decimal(50,2) NOT NULL DEFAULT '0.00',
  `tag` varchar(225) NOT NULL DEFAULT '' COMMENT '支付标识号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=252 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `yershop_sign`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_sign`;
CREATE TABLE `yershop_sign` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-正常',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='签到表';

-- ----------------------------
-- Records of yershop_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_slide`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_slide`;
CREATE TABLE `yershop_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(225) NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `url` varchar(225) NOT NULL DEFAULT '' COMMENT '链接',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `place` tinyint(30) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='幻灯片图片储存表';

-- ----------------------------
-- Records of yershop_slide
-- ----------------------------
INSERT INTO `yershop_slide` VALUES ('12', '0', '双11,5折封顶', 'Article/detail?id=68', '', '0', '1', '1', '1421158112', '1443649683', '1', '50', '0');
INSERT INTO `yershop_slide` VALUES ('11', '0', '电脑数码办公快“京”光', 'Article/detail?id=69',  '', '0', '1', '1', '1421158031', '1443649704', '1', '49', '0');
INSERT INTO `yershop_slide` VALUES ('9', '0', '电胡哦哦', 'Article/detail?id=64', '', '0', '1', '1', '1421132459', '1443649756', '1', '34', '0');
INSERT INTO `yershop_slide` VALUES ('10', '0', '电脑333', 'Article/detail?id=74',  '', '0', '1', '1', '1421157871', '1443649725', '1', '48', '0');
INSERT INTO `yershop_slide` VALUES ('8', '0', '电脑数码', 'Article/detail?id=63',  '', '0', '1', '1', '0', '1443649770', '1', '33', '0');

-- ----------------------------
-- Table structure for `yershop_sms`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_sms`;
CREATE TABLE `yershop_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号码',
  `content` varchar(225) NOT NULL DEFAULT '' COMMENT '短信内容',
  `extcode` varchar(50) NOT NULL DEFAULT '' COMMENT '扩展子号',
  `signtag` varchar(225) NOT NULL DEFAULT '' COMMENT '签名',
  `uid` varchar(225) NOT NULL DEFAULT '' COMMENT '用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `tempid` varchar(255) NOT NULL DEFAULT '' COMMENT '模板编号',
  `group` tinyint(2) NOT NULL DEFAULT '0' COMMENT '分组1-验证2-通知',
  `other` tinyint(2) NOT NULL DEFAULT '0' COMMENT '备用',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态1-有效2-过期3-验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='短信记录表';

-- ----------------------------
-- Records of yershop_sms
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_sync_login`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_sync_login`;
CREATE TABLE `yershop_sync_login` (
  `uid` int(11) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方登陆表';

-- ----------------------------
-- Records of yershop_sync_login
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_turnover`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_turnover`;
CREATE TABLE `yershop_turnover` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `sales` decimal(50,2) NOT NULL DEFAULT '0.00',
  `back` decimal(50,2) NOT NULL DEFAULT '0.00',
  `change` decimal(50,2) NOT NULL DEFAULT '0.00',
  `profits` decimal(50,2) NOT NULL DEFAULT '0.00',
  `cancel` decimal(50,2) NOT NULL DEFAULT '0.00',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `info` varchar(225) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='利润计算总表';


-- ----------------------------
-- Table structure for `yershop_ucenter_admin`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_ucenter_admin`;
CREATE TABLE `yershop_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of yershop_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_ucenter_app`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_ucenter_app`;
CREATE TABLE `yershop_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of yershop_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_ucenter_member`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_ucenter_member`;
CREATE TABLE `yershop_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  `face` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of yershop_ucenter_member
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_ucenter_setting`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_ucenter_setting`;
CREATE TABLE `yershop_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of yershop_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_userdata`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_userdata`;
CREATE TABLE `yershop_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yershop_userdata
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_user_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_user_coupon`;
CREATE TABLE `yershop_user_coupon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` varchar(225) NOT NULL DEFAULT '',
  `couponid` varchar(225) NOT NULL DEFAULT '',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-未使用 2-已使用',
  `cover_id` int(225) unsigned NOT NULL DEFAULT '0' COMMENT '图片',
  `info` varchar(225) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户个人优惠券表';

-- ----------------------------
-- Records of yershop_user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_user_envelope`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_user_envelope`;
CREATE TABLE `yershop_user_envelope` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sendname` varchar(225) NOT NULL DEFAULT '' COMMENT '发件人',
  `title` varchar(225) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '发送内容',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1-未读2-已读',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `view` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `group` varchar(225) NOT NULL DEFAULT '' COMMENT '分组',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='个人站内信表';

-- ----------------------------
-- Records of yershop_user_envelope
-- ----------------------------

-- ----------------------------
-- Table structure for `yershop_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_user_log`;
CREATE TABLE `yershop_user_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `title` text NOT NULL COMMENT '名称',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,2为已使用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `yershop_verification`
-- ----------------------------
DROP TABLE IF EXISTS `yershop_verification`;
CREATE TABLE `yershop_verification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `paycode` varchar(50) NOT NULL DEFAULT '' COMMENT '支付密码',
  `uid` varchar(225) NOT NULL DEFAULT '' COMMENT '用户id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `tempid` varchar(255) NOT NULL DEFAULT '' COMMENT '模板编号',
  `tag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '验证分组1-邮箱2-手机3-其他',
  `msg` varchar(50) NOT NULL DEFAULT '' COMMENT '手机验证码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态1-有效2-过期3-验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='安全验证表';
