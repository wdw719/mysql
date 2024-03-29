/*
Navicat MySQL Data Transfer

Source Server         : 140.143.2.21
Source Server Version : 50728
Source Host           : 140.143.2.21:3306
Source Database       : my_shop

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2019-11-08 08:38:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(5) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(30) NOT NULL COMMENT '管理员名',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  `create_time` char(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='管理员表 \r\nusername 不能重复 录入数据需要唯一验证\r\npassword 6-20位字母数字混合 md5加密';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('14', 'jsy', '83445ab2fb6f7c8961e64d40ad577e9a', '1572956767');
INSERT INTO `admin` VALUES ('16', 'lzb', '83445ab2fb6f7c8961e64d40ad577e9a', '1573000251');
INSERT INTO `admin` VALUES ('19', 'asd', 'asdasdaseweweasdasdasdasdasdasda', '1573000251');
INSERT INTO `admin` VALUES ('20', 'zzy', '83445ab2fb6f7c8961e64d40ad577e9a', '1573039164');

-- ----------------------------
-- Table structure for admin_role
-- ----------------------------
DROP TABLE IF EXISTS `admin_role`;
CREATE TABLE `admin_role` (
  `aid` int(11) unsigned DEFAULT NULL COMMENT '管理员关联id',
  `rid` int(11) unsigned DEFAULT NULL COMMENT '角色关联id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_role
-- ----------------------------
INSERT INTO `admin_role` VALUES ('19', '25');
INSERT INTO `admin_role` VALUES ('20', '3');
INSERT INTO `admin_role` VALUES ('16', '3');

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(30) DEFAULT NULL,
  `brand_img` varchar(255) DEFAULT NULL,
  `brand_status` tinyint(1) DEFAULT NULL,
  `brand_order` int(5) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('3', '帮宝适', '../../brandpic/1573126724', '1', '2');
INSERT INTO `brand` VALUES ('7', '舒肤佳', '../../brandpic/1573127019', '1', '4');
INSERT INTO `brand` VALUES ('8', '护舒宝', '../../brandpic/1573127108', '1', '5');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify` (
  `classify_id` int(11) NOT NULL AUTO_INCREMENT,
  `classify_pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `classify_name` varchar(30) DEFAULT NULL COMMENT '分类名',
  `classify_status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`classify_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES ('1', '0', '电器', '1');
INSERT INTO `classify` VALUES ('2', '1', '家电', '1');
INSERT INTO `classify` VALUES ('3', '2', '电视', '1');
INSERT INTO `classify` VALUES ('4', '2', '冰箱', '1');
INSERT INTO `classify` VALUES ('5', '1', '数码', '1');
INSERT INTO `classify` VALUES ('6', '5', '数码相机', '1');
INSERT INTO `classify` VALUES ('7', '5', '手机', '1');
INSERT INTO `classify` VALUES ('8', '0', '衣服', '1');
INSERT INTO `classify` VALUES ('9', '8', '上衣', '1');
INSERT INTO `classify` VALUES ('10', '8', '下衣', '1');
INSERT INTO `classify` VALUES ('11', '10', '长裤', '1');
INSERT INTO `classify` VALUES ('12', '10', '八分裤', '1');
INSERT INTO `classify` VALUES ('13', '9', '卫衣', '1');
INSERT INTO `classify` VALUES ('14', '9', '秋衣', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(100) DEFAULT NULL COMMENT '商品名',
  `good_content` text COMMENT '简介',
  `good_price` float(7,2) DEFAULT NULL COMMENT '价格',
  `good_h_price` float(7,2) DEFAULT NULL COMMENT '划线价格',
  `good_status` tinyint(1) DEFAULT '1' COMMENT '上下架',
  `good_img` varchar(100) DEFAULT NULL COMMENT '主图',
  `good_num` int(7) DEFAULT '0' COMMENT '库存',
  `is_gift` tinyint(1) DEFAULT '0' COMMENT '是否礼品',
  `good_class` int(11) DEFAULT NULL COMMENT '所属分类',
  `good_brand` int(11) DEFAULT NULL COMMENT '品牌id',
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `power_name` varchar(30) DEFAULT NULL COMMENT '权限名称',
  `power_url` varchar(255) DEFAULT NULL COMMENT '链接',
  `order` tinyint(2) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级id',
  `is_list` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='权限表\r\n';

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '管理员管理', null, '1', '0', '1');
INSERT INTO `power` VALUES ('2', '管理员添加', '../xy/jsyaddstaff', '1', '1', '1');
INSERT INTO `power` VALUES ('3', '管理员列表', '../xy/jsystaff', '2', '1', '1');
INSERT INTO `power` VALUES ('4', '管理员删除修改', null, '3', '1', '0');
INSERT INTO `power` VALUES ('5', '角色管理', null, '2', '0', '1');
INSERT INTO `power` VALUES ('6', '角色添加', '../tomato/add_role', '1', '5', '1');
INSERT INTO `power` VALUES ('7', '角色列表', '../tomato/role_list', '2', '5', '1');
INSERT INTO `power` VALUES ('8', '菜单管理', null, '3', '0', '1');
INSERT INTO `power` VALUES ('9', '菜单添加', '../liu/addPower', '1', '8', '1');
INSERT INTO `power` VALUES ('10', '菜单列表', '../liu/listPower', '2', '8', '1');
INSERT INTO `power` VALUES ('11', '删除菜单', null, '3', '8', '0');
INSERT INTO `power` VALUES ('12', '编辑菜单', null, '4', '8', '0');
INSERT INTO `power` VALUES ('13', '查看子菜单', null, '5', '8', '0');
INSERT INTO `power` VALUES ('14', '活动管理', null, '4', '0', '1');
INSERT INTO `power` VALUES ('15', '满减活动', null, '1', '14', '1');
INSERT INTO `power` VALUES ('16', '赠送优惠券', null, '2', '14', '1');
INSERT INTO `power` VALUES ('17', '满几送级', null, '3', '14', '1');
INSERT INTO `power` VALUES ('18', '客服管理', null, '5', '0', '1');
INSERT INTO `power` VALUES ('19', '评论审核', null, '1', '18', '1');
INSERT INTO `power` VALUES ('20', '评论回复', null, '2', '18', '1');
INSERT INTO `power` VALUES ('21', '意见反馈列表', null, '3', '18', '1');
INSERT INTO `power` VALUES ('22', '意见回复', null, '4', '18', '1');
INSERT INTO `power` VALUES ('23', '属性管理', null, '6', '0', '1');
INSERT INTO `power` VALUES ('24', '属性添加', null, '1', '23', '1');
INSERT INTO `power` VALUES ('25', '属性列表', null, '2', '23', '1');
INSERT INTO `power` VALUES ('26', '属性设置', null, '3', '23', '0');
INSERT INTO `power` VALUES ('27', '商品管理', null, '7', '0', '1');
INSERT INTO `power` VALUES ('28', '商品添加', '../xy/jsyaddgoodpage', '1', '27', '1');
INSERT INTO `power` VALUES ('29', '商品列表', '../xy/jsygoodlist', '2', '27', '1');
INSERT INTO `power` VALUES ('30', '商品编辑删除', null, '3', '27', '0');
INSERT INTO `power` VALUES ('31', '订单管理', null, '8', '31', '1');
INSERT INTO `power` VALUES ('32', '订单添加', null, '1', '31', '1');
INSERT INTO `power` VALUES ('33', '订单列表', null, '2', '31', '1');
INSERT INTO `power` VALUES ('34', '订单状态管理', null, '3', '31', '1');
INSERT INTO `power` VALUES ('35', '品牌管理', null, '10', '0', '1');
INSERT INTO `power` VALUES ('36', '品牌添加', '../tomato/add_brand', '1', '35', '1');
INSERT INTO `power` VALUES ('37', '品牌列表', '../tomato/brand_list', '2', '35', '1');
INSERT INTO `power` VALUES ('38', '商品分类管理', null, '9', '0', '1');
INSERT INTO `power` VALUES ('39', '分类添加', '../liu/addClass', '1', '38', '1');
INSERT INTO `power` VALUES ('40', '分类列表', '../liu/listClass', '2', '38', '1');
INSERT INTO `power` VALUES ('46', '吐槽灌水', null, '9', '0', '0');
INSERT INTO `power` VALUES ('47', '吐槽', null, '1', '46', '0');
INSERT INTO `power` VALUES ('48', '灌水', null, '2', '46', '0');
INSERT INTO `power` VALUES ('49', '大量灌水', null, '3', '46', '1');
INSERT INTO `power` VALUES ('50', '恶意吐槽', null, '4', '46', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='角色表\r\nrole 代表角色名称\r\n';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '超级管理员');
INSERT INTO `role` VALUES ('25', '无敌管理员');

-- ----------------------------
-- Table structure for role_power
-- ----------------------------
DROP TABLE IF EXISTS `role_power`;
CREATE TABLE `role_power` (
  `rid` int(11) unsigned DEFAULT NULL COMMENT '角色关联id',
  `p_id` int(11) unsigned DEFAULT NULL COMMENT '权限关联id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_power
-- ----------------------------
INSERT INTO `role_power` VALUES ('1', '1');
INSERT INTO `role_power` VALUES ('1', '2');
INSERT INTO `role_power` VALUES ('1', '3');
INSERT INTO `role_power` VALUES ('1', '4');
INSERT INTO `role_power` VALUES ('3', '22');
INSERT INTO `role_power` VALUES ('3', '21');
INSERT INTO `role_power` VALUES ('3', '20');
INSERT INTO `role_power` VALUES ('3', '19');
INSERT INTO `role_power` VALUES ('3', '18');
INSERT INTO `role_power` VALUES ('3', '17');
INSERT INTO `role_power` VALUES ('3', '16');
INSERT INTO `role_power` VALUES ('3', '15');
INSERT INTO `role_power` VALUES ('3', '14');
INSERT INTO `role_power` VALUES ('3', '13');
INSERT INTO `role_power` VALUES ('3', '12');
INSERT INTO `role_power` VALUES ('3', '11');
INSERT INTO `role_power` VALUES ('3', '10');
INSERT INTO `role_power` VALUES ('3', '9');
INSERT INTO `role_power` VALUES ('3', '8');
INSERT INTO `role_power` VALUES ('3', '7');
INSERT INTO `role_power` VALUES ('3', '6');
INSERT INTO `role_power` VALUES ('3', '5');
INSERT INTO `role_power` VALUES ('3', '4');
INSERT INTO `role_power` VALUES ('3', '3');
INSERT INTO `role_power` VALUES ('3', '2');
INSERT INTO `role_power` VALUES ('3', '1');
INSERT INTO `role_power` VALUES ('3', '23');
INSERT INTO `role_power` VALUES ('3', '24');
INSERT INTO `role_power` VALUES ('3', '25');
INSERT INTO `role_power` VALUES ('3', '26');
INSERT INTO `role_power` VALUES ('3', '27');
INSERT INTO `role_power` VALUES ('3', '28');
INSERT INTO `role_power` VALUES ('3', '29');
INSERT INTO `role_power` VALUES ('3', '30');
INSERT INTO `role_power` VALUES ('3', '31');
INSERT INTO `role_power` VALUES ('3', '32');
INSERT INTO `role_power` VALUES ('3', '33');
INSERT INTO `role_power` VALUES ('3', '34');
INSERT INTO `role_power` VALUES ('3', '35');
INSERT INTO `role_power` VALUES ('3', '36');
INSERT INTO `role_power` VALUES ('3', '37');
INSERT INTO `role_power` VALUES ('3', '38');
INSERT INTO `role_power` VALUES ('3', '39');
INSERT INTO `role_power` VALUES ('3', '40');
INSERT INTO `role_power` VALUES ('5', '38');
INSERT INTO `role_power` VALUES ('5', '39');
INSERT INTO `role_power` VALUES ('5', '40');
INSERT INTO `role_power` VALUES ('6', '5');
INSERT INTO `role_power` VALUES ('6', '6');
INSERT INTO `role_power` VALUES ('6', '7');
INSERT INTO `role_power` VALUES ('6', '42');
INSERT INTO `role_power` VALUES ('7', '1');
INSERT INTO `role_power` VALUES ('7', '2');
INSERT INTO `role_power` VALUES ('7', '3');
INSERT INTO `role_power` VALUES ('7', '4');
INSERT INTO `role_power` VALUES ('7', '5');
INSERT INTO `role_power` VALUES ('7', '6');
INSERT INTO `role_power` VALUES ('7', '7');
INSERT INTO `role_power` VALUES ('7', '42');
INSERT INTO `role_power` VALUES ('18', '20');
INSERT INTO `role_power` VALUES ('19', '7');
INSERT INTO `role_power` VALUES ('21', '11');
INSERT INTO `role_power` VALUES ('22', '1');
INSERT INTO `role_power` VALUES ('22', '5');
INSERT INTO `role_power` VALUES ('22', '8');
INSERT INTO `role_power` VALUES ('25', '1');
INSERT INTO `role_power` VALUES ('25', '2');
INSERT INTO `role_power` VALUES ('25', '3');
INSERT INTO `role_power` VALUES ('25', '4');
INSERT INTO `role_power` VALUES ('25', '5');
INSERT INTO `role_power` VALUES ('25', '6');
INSERT INTO `role_power` VALUES ('25', '7');
INSERT INTO `role_power` VALUES ('25', '8');
INSERT INTO `role_power` VALUES ('25', '9');
INSERT INTO `role_power` VALUES ('25', '10');
INSERT INTO `role_power` VALUES ('25', '11');
INSERT INTO `role_power` VALUES ('25', '12');
INSERT INTO `role_power` VALUES ('25', '13');
