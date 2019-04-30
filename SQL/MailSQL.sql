/*
Navicat MySQL Data Transfer

Source Server         : c2c
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : c2c

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2019-04-29 10:38:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininformation
-- ----------------------------
DROP TABLE IF EXISTS `admininformation`;
CREATE TABLE `admininformation` (
  `id` int(11) NOT NULL COMMENT '管理员id',
  `ano` char(12) NOT NULL COMMENT '管理员名称',
  `password` char(24) NOT NULL COMMENT '密码',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
-- Records of admininformation
-- ----------------------------
INSERT INTO `admininformation` VALUES ('1', '3', 'admin', '2019-04-16 20:29:08');
INSERT INTO `admininformation` VALUES ('2', '2', 'root', '2019-04-16 20:30:20');

-- ----------------------------
-- Table structure for adminoperation
-- ----------------------------
DROP TABLE IF EXISTS `adminoperation`;
CREATE TABLE `adminoperation` (
  `id` int(11) NOT NULL COMMENT '操作id',
  `aid` int(11) NOT NULL COMMENT '操作详情id',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `operation` varchar(255) NOT NULL COMMENT '具体操作',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作权限信息表';

-- ----------------------------
-- Records of adminoperation
-- ----------------------------
INSERT INTO `adminoperation` VALUES ('1', '3', '2019-04-16 20:27:24', '系统管理员');
INSERT INTO `adminoperation` VALUES ('2', '2', '2019-04-16 20:28:16', '商品管理员');
INSERT INTO `adminoperation` VALUES ('3', '1', '2019-04-16 20:31:21', '订单管理员');

-- ----------------------------
-- Table structure for allkinds
-- ----------------------------
DROP TABLE IF EXISTS `allkinds`;
CREATE TABLE `allkinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(50) NOT NULL COMMENT '菜单项名称',
  `modified` datetime DEFAULT NULL COMMENT '菜单创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='一级菜单信息表';

-- ----------------------------
-- Records of allkinds
-- ----------------------------
INSERT INTO `allkinds` VALUES ('1', '数码科技', '2017-05-14 13:28:20');
INSERT INTO `allkinds` VALUES ('2', '影音家电', '2017-05-14 13:28:23');
INSERT INTO `allkinds` VALUES ('3', '鞋服配饰', '2017-05-14 13:28:26');
INSERT INTO `allkinds` VALUES ('4', '运动代步', '2017-05-14 13:28:28');
INSERT INTO `allkinds` VALUES ('5', '书籍文具', '2017-05-14 13:28:31');
INSERT INTO `allkinds` VALUES ('6', '其他', '2017-05-14 13:28:41');

-- ----------------------------
-- Table structure for boughtshop
-- ----------------------------
DROP TABLE IF EXISTS `boughtshop`;
CREATE TABLE `boughtshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime DEFAULT NULL,
  `state` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of boughtshop
-- ----------------------------

-- ----------------------------
-- Table structure for classification
-- ----------------------------
DROP TABLE IF EXISTS `classification`;
CREATE TABLE `classification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(50) NOT NULL COMMENT '菜单项名称',
  `modified` datetime DEFAULT NULL COMMENT '菜单创建的时间',
  `aid` int(11) NOT NULL COMMENT '一级菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='二级菜单信息表';

-- ----------------------------
-- Records of classification
-- ----------------------------
INSERT INTO `classification` VALUES ('1', '手机', null, '1');
INSERT INTO `classification` VALUES ('2', '相机', null, '1');
INSERT INTO `classification` VALUES ('3', '电脑', null, '1');
INSERT INTO `classification` VALUES ('4', '家电', null, '2');
INSERT INTO `classification` VALUES ('5', '影音', null, '2');
INSERT INTO `classification` VALUES ('6', '女装', null, '3');
INSERT INTO `classification` VALUES ('7', '男装', null, '3');
INSERT INTO `classification` VALUES ('8', '女鞋', null, '3');
INSERT INTO `classification` VALUES ('9', '男鞋', null, '3');
INSERT INTO `classification` VALUES ('10', '箱包', null, '3');
INSERT INTO `classification` VALUES ('11', '手表', null, '3');
INSERT INTO `classification` VALUES ('12', '器材', null, '4');
INSERT INTO `classification` VALUES ('13', '代步', null, '4');
INSERT INTO `classification` VALUES ('14', '修养', null, '5');
INSERT INTO `classification` VALUES ('15', '专业', null, '5');
INSERT INTO `classification` VALUES ('16', '文具', null, '5');
INSERT INTO `classification` VALUES ('17', '其他', null, '6');

-- ----------------------------
-- Table structure for goodscar
-- ----------------------------
DROP TABLE IF EXISTS `goodscar`;
CREATE TABLE `goodscar` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `modified` datetime DEFAULT NULL COMMENT '购物车添加时间',
  `sid` int(11) NOT NULL COMMENT '商品id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效 1 有效 0无效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='购物车信息表';

-- ----------------------------
-- Records of goodscar
-- ----------------------------
INSERT INTO `goodscar` VALUES ('1', '2019-01-17 20:23:16', '100', '17', '1', '1');
INSERT INTO `goodscar` VALUES ('2', '2019-04-08 19:55:50', '96', '1', '1', '1');
INSERT INTO `goodscar` VALUES ('3', '2019-04-13 14:01:45', '100', '1', '1', '1');

-- ----------------------------
-- Table structure for goodsoforderform
-- ----------------------------
DROP TABLE IF EXISTS `goodsoforderform`;
CREATE TABLE `goodsoforderform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ofid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsoforderform
-- ----------------------------

-- ----------------------------
-- Table structure for orderform
-- ----------------------------
DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `context` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `modified` datetime DEFAULT NULL COMMENT '订单创建时间',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '交易金额(小数点后两位)',
  `payment_time` datetime DEFAULT NULL COMMENT '交易时间',
  `paystate` int(2) DEFAULT '-1' COMMENT '订单状态:-1-在途订单 0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `display` int(11) DEFAULT '1' COMMENT '订单状态 1-有效 0-失效 2-未发货 3-已发货',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderform
-- ----------------------------
INSERT INTO `orderform` VALUES ('100000000', '1', 'test', 'test', '2019-04-19 10:55:26', '5250.00', '2019-04-19 10:55:31', '0', null, '2019-04-19 17:17:25', '1');
INSERT INTO `orderform` VALUES ('100000001', '1', 't', 't', '2019-04-19 17:17:00', '5200.00', '2019-04-19 17:17:11', '-1', null, null, '1');
INSERT INTO `orderform` VALUES ('100000002', '1', 'T', 'T', '2019-04-19 17:25:08', '1.00', '2019-04-19 17:25:16', '-1', null, null, '1');

-- ----------------------------
-- Table structure for orderline
-- ----------------------------
DROP TABLE IF EXISTS `orderline`;
CREATE TABLE `orderline` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `odno` bigint(20) NOT NULL COMMENT '订单号',
  `sid` int(11) NOT NULL COMMENT '商品id',
  `sname` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `total_price` int(11) NOT NULL COMMENT '商品总价',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='订单项详情表';

-- ----------------------------
-- Records of orderline
-- ----------------------------
INSERT INTO `orderline` VALUES ('1', '100000001', '99', 'Y7000P笔记本电脑', '\\9SnPp2yk2N1547190083723.jpg', '1', '5200', '1');
INSERT INTO `orderline` VALUES ('2', '100000000', '97', '算法导论', '/image/thumbnails/SxDMHyJ8T11547189143478.jpg', '1', '50', '1');
INSERT INTO `orderline` VALUES ('3', '100000002', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for payinfo
-- ----------------------------
DROP TABLE IF EXISTS `payinfo`;
CREATE TABLE `payinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `odno` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `payno` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝流水号',
  `paystate` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝支付状态',
  `modified` datetime DEFAULT NULL,
  `updatatime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payinfo
-- ----------------------------

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcar
-- ----------------------------

-- ----------------------------
-- Table structure for shopcontext
-- ----------------------------
DROP TABLE IF EXISTS `shopcontext`;
CREATE TABLE `shopcontext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `modified` datetime DEFAULT NULL COMMENT '留言时间',
  `sid` int(11) NOT NULL COMMENT '商品id',
  `context` varchar(255) NOT NULL COMMENT '留言信息',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否可见',
  `uid` int(11) NOT NULL DEFAULT '1' COMMENT '留言用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品留言信息表';

-- ----------------------------
-- Records of shopcontext
-- ----------------------------
INSERT INTO `shopcontext` VALUES ('1', '2019-04-08 19:55:42', '96', '可以的', '1', '1');
INSERT INTO `shopcontext` VALUES ('2', '2019-04-13 13:59:42', '100', '12344', '1', '1');

-- ----------------------------
-- Table structure for shopinformation
-- ----------------------------
DROP TABLE IF EXISTS `shopinformation`;
CREATE TABLE `shopinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(50) NOT NULL COMMENT '商品名',
  `level` int(11) NOT NULL COMMENT '商品成色(几成新)',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `sort` int(11) NOT NULL COMMENT '商品分类(三级)',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `quantity` int(11) NOT NULL COMMENT '商品数量',
  `transaction` int(11) NOT NULL DEFAULT '1' COMMENT '是否交易(交易后商品自动下架)',
  `sales` int(11) DEFAULT '0' COMMENT '商品促销',
  `uid` int(11) NOT NULL COMMENT '发布用户id',
  `image` varchar(255) DEFAULT NULL COMMENT '上传图片路径',
  `thumbnails` varchar(255) DEFAULT NULL COMMENT '缩略图路径',
  PRIMARY KEY (`id`),
  KEY `index_uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='商品详细信息表';

-- ----------------------------
-- Records of shopinformation
-- ----------------------------
INSERT INTO `shopinformation` VALUES ('4', '2017-05-14 15:33:27', '729乒乓球拍', '5', '', '77.56', '67', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('5', '2017-05-14 15:34:33', '苹果6S', '5', '', '5000.00', '1', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('6', '2017-05-14 15:35:19', '三星5A', '5', '', '4000.12', '2', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('7', '2017-05-14 15:36:09', '小米6', '7', '', '3000.56', '3', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('8', '2017-05-14 15:36:38', '华为8', '7', '', '3000.57', '4', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('9', '2017-05-14 15:37:08', '中兴8', '7', '', '3000.57', '5', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('10', '2017-05-14 15:37:31', '联系9', '7', '', '4654.00', '6', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('11', '2017-05-14 15:37:51', '魅族7S', '7', '', '4434.00', '7', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('12', '2017-05-14 15:38:19', '索爱8', '7', '', '4434.33', '8', '1', '3', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('13', '2017-05-14 15:38:42', '苹果耳机', '7', '', '100.00', '9', '1', '1', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('14', '2019-01-07 11:03:03', '普通相机10', '7', ' ', '5100.00', '10', '1', '1', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('15', '2017-05-14 15:39:30', '贾尼单反', '5', '', '5100.00', '11', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('16', '2017-05-14 15:39:49', '其他东东', '5', '', '5100.00', '12', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('17', '2017-05-14 15:40:10', '笔记本宏碁13', '8', '', '5100.00', '13', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('18', '2017-05-14 15:40:37', '苹果平板5', '8', '', '5100.00', '14', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('19', '2017-05-14 15:41:02', 'HP台式电脑', '8', '', '4100.00', '15', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('20', '2017-05-14 15:41:26', '戴尔显示器', '8', '', '1100.00', '16', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('21', '2017-05-14 15:49:33', '雷蛇鼠标', '8', '', '1100.00', '17', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('22', '2017-05-14 15:49:47', '雷神键盘', '8', '', '1100.00', '18', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('23', '2017-05-14 15:50:33', 'U盘金士顿64G', '8', '', '200.00', '19', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('24', '2017-05-14 15:51:02', '爱国者移动硬盘1T', '8', '', '500.90', '20', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('25', '2017-05-14 15:51:22', '爱？', '8', '', '500.90', '21', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('26', '2017-05-14 15:52:02', '小天鹅洗衣机', '8', '', '700.00', '22', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('27', '2017-05-14 15:52:17', '饮水机', '8', '', '700.00', '23', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('28', '2017-05-14 15:52:34', '吹风机', '8', '', '40.00', '24', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('29', '2017-05-14 15:52:44', '剃须刀', '8', '', '40.00', '25', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('30', '2017-05-14 15:53:01', '小型风扇', '8', '', '40.00', '26', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('31', '2017-05-14 15:53:11', '煮蛋器', '8', '', '40.00', '27', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('32', '2017-05-14 15:53:34', '电磁炉 美的', '8', '', '100.00', '28', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('33', '2017-05-14 15:53:50', '电饭煲格力', '8', '', '100.00', '29', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('34', '2017-05-14 15:54:02', '超级耳机', '8', '', '100.00', '30', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('35', '2017-05-14 15:54:27', '很好的音响', '8', '', '120.58', '31', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('36', '2017-05-14 15:55:01', '功放？', '8', '', '120.58', '32', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('37', '2017-05-14 15:55:15', '低音炮', '8', '', '120.58', '33', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('38', '2017-05-14 15:55:25', '麦克风', '8', '', '120.58', '34', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('39', '2017-05-14 15:56:12', '超好看的上衣', '8', '', '120.58', '35', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('40', '2017-05-14 15:56:28', '炫酷短裤', '8', '', '120.58', '36', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('41', '2017-05-14 15:56:46', '百褶裙', '8', '', '55.00', '37', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('42', '2017-05-14 15:57:06', '短上衣', '8', '', '55.00', '38', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('43', '2017-05-14 15:57:20', '长裤', '8', '', '55.00', '39', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('44', '2017-05-14 15:57:49', '运动鞋耐克', '8', '', '1200.00', '40', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('45', '2017-05-14 15:58:06', '皮鞋安踏', '8', '', '200.00', '41', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('46', '2017-05-14 15:58:43', '帆布鞋', '8', '', '200.00', '45', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('47', '2017-05-14 15:59:26', '球鞋', '8', '', '200.00', '46', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('48', '2017-05-14 15:59:35', '板鞋', '8', '', '200.00', '47', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('49', '2017-05-14 15:59:50', '男生运动鞋', '8', '', '200.00', '49', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('50', '2017-05-14 16:00:07', '男生皮鞋', '8', '', '500.00', '50', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('51', '2017-05-14 16:00:20', '男生帆布鞋', '8', '', '10.00', '51', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('52', '2017-05-14 16:00:36', '男生球鞋', '8', '', '1000.00', '52', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('53', '2017-05-14 16:00:58', '背包VL', '8', '', '1000.00', '55', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('54', '2017-05-14 16:01:13', '超级旅行包', '8', '', '200.00', '56', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('55', '2017-05-14 16:01:40', '呆板机械表', '8', '', '400.00', '58', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('56', '2017-05-14 16:01:58', '好看的石英表', '8', '', '400.00', '59', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('57', '2017-05-14 16:02:10', '一般电子版', '8', '', '100.00', '60', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('58', '2017-05-14 16:03:08', '足球', '8', '', '100.00', '62', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('59', '2017-05-14 16:03:19', '羽毛球拍', '8', '', '100.00', '63', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('60', '2017-05-14 16:03:29', '网球拍', '8', '', '100.00', '64', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('61', '2017-05-14 16:03:37', '篮球', '8', '', '100.00', '65', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('62', '2017-05-14 16:03:46', '滑轮', '8', '', '100.00', '66', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('63', '2017-05-14 16:04:01', '乒乓球拍', '8', '', '100.00', '67', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('64', '2017-05-14 16:04:15', '滑板', '8', '', '100.00', '68', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('65', '2017-05-14 16:04:28', '自行车', '8', '', '300.00', '70', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('66', '2017-05-14 16:04:45', '电动车', '8', '', '800.85', '71', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('67', '2017-05-14 16:05:02', '傲慢与偏见', '8', '', '20.00', '73', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('68', '2017-05-14 16:05:22', '海贼王漫画', '8', '', '20.00', '74', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('69', '2017-05-14 16:05:49', '爱尔兰的野马', '8', '', '20.00', '75', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('70', '2017-05-14 16:06:10', '生命的起源', '8', '', '25.00', '77', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('71', '2017-05-14 16:06:35', '神奇的化学变化', '8', '', '25.00', '78', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('72', '2017-05-14 16:06:59', '黑洞与白洞', '8', '', '51.00', '79', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('73', '2017-05-14 16:07:17', '诗经全集', '8', '', '51.00', '80', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('74', '2017-05-14 16:07:40', '小语种-莫拉语', '8', '', '51.00', '81', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('75', '2017-05-14 16:08:20', '真：五元十次方程详细解法', '8', '', '51.00', '82', '1', '4', '1', '0', '4', '\\image/eW5NE6CM121494763475193.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('76', '2019-01-15 19:35:40', '国家的安定', '7', '。', '51.00', '83', '1', '4', '1', '0', '4', '\\image\\4QViDVAG1z1547552140839.jpg', '\\image\\thumbnails\\8jGFdN2Lfp1547552140839.jpg');
INSERT INTO `shopinformation` VALUES ('77', '2019-01-11 17:40:19', '曼陀罗消亡史', '7', '很好看的书', '51.00', '84', '1', '4', '1', '0', '4', '\\image\\9vqr3WetSz1547199619441.jpg', '\\image\\thumbnails\\XqcU2oURPM1547199619441.jpg');
INSERT INTO `shopinformation` VALUES ('78', '2019-01-11 17:37:46', '神奇的广东', '7', '1', '51.00', '85', '1', '4', '1', '0', '4', '\\image\\aYjSvDNaui1547199473584.jpg', '\\image\\thumbnails\\jyjP2suhBI1547199477262.jpg');
INSERT INTO `shopinformation` VALUES ('79', '2017-05-14 16:10:11', 'Spring实战', '8', '', '51.00', '86', '1', '4', '1', '0', '4', '\\image/1.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('80', '2017-05-14 16:10:29', 'ACD画图', '8', '', '51.00', '87', '1', '4', '1', '0', '4', '\\image/aug1NiTT40tXd3Zy1ZWL20161215.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('81', '2017-05-14 16:10:51', '怎么建房子容易倒塌', '8', '', '51.00', '88', '1', '4', '1', '0', '4', '\\image/bvmE7d8698C3VdjSMjHm20161225.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('82', '2017-05-14 16:11:07', '算法的艺术', '8', '', '51.00', '89', '1', '4', '1', '0', '4', '\\image/rzNz7r8XkK8Q97Ki42FB20161214.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('83', '2017-05-14 16:11:38', '狼毫笔', '8', '', '51.00', '91', '1', '4', '1', '0', '4', '\\image/langhaobi.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('84', '2017-05-14 16:12:06', '景德镇陶瓷', '8', '', '522225.50', '92', '1', '4', '1', '0', '4', '\\image/jingdezheng.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('87', '2017-05-14 20:04:41', '华为P10', '8', '', '525.50', '1', '1', '4', '1', '0', '4', '\\image/huawei.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('88', '2019-01-16 11:31:16', '苹果6SPLUS', '7', '.', '1000.00', '1', '1', '1', '1', '0', '4', '\\image\\j4vw20Q7tk1547609479342.jpg', '\\image\\thumbnails\\MNdKHfukTq1547609479342.jpg');
INSERT INTO `shopinformation` VALUES ('89', '2019-01-15 21:04:12', '小米5', '7', '.', '525.50', '3', '1', '1', '1', '0', '4', '\\image/xiaomi5.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('90', '2019-01-15 20:48:42', '苹果6S', '7', '.', '525.50', '1', '1', '4', '1', '0', '4', '\\image/apple6s.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('91', '2017-05-20 15:53:11', '月球下的人', '7', '', '34.00', '73', '1', '1', '1', '0', '7', '\\image/yourname.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('92', '2017-05-20 19:06:57', '傲慢与偏见', '9', '', '24.00', '73', '1', '1', '1', '0', '7', '\\image\\PorRmD0JDZ1495278394532.jpg', '/image/thumbnails/IrFMeAQeua1496368854318.jpg');
INSERT INTO `shopinformation` VALUES ('93', '2019-01-10 14:06:18', '篮球', '8', '球感很好', '80.00', '65', '1', '1', '1', '0', '14', '\\image\\hIPYwIwwzo1547100378428.jpg', '/image/thumbnails/5WX658wfaN1547100378429.jpg');
INSERT INTO `shopinformation` VALUES ('94', '2019-01-11 14:58:59', '笔记本电脑', '7', '基本上没有怎么用过，全新有意者可以面谈Y7000P', '5600.00', '1', '0', '1', '1', '0', '14', '\\image\\f0em2zPnXE1547100611603.jpg', '/image/thumbnails/A1X62m9HIu1547100611603.jpg');
INSERT INTO `shopinformation` VALUES ('95', '2019-01-10 14:39:57', 'iPodAir', '7', '1', '2500.00', '1', '1', '1', '1', '0', '1', '\\image\\FAOPm0ZZBW1547102365029.jpg', '/image/thumbnails/DxCJ5wCWXv1547102365029.jpg');
INSERT INTO `shopinformation` VALUES ('96', '2019-01-11 14:34:29', 'iPhone6s', '7', '1', '2900.00', '1', '1', '1', '1', '0', '1', '\\image\\KYKrGz35tF1547188009430.jpg', '/image/thumbnails/J6ygDYPYI81547188060959.jpg');
INSERT INTO `shopinformation` VALUES ('97', '2019-01-11 14:48:46', '算法导论', '9', '1', '50.00', '86', '1', '1', '1', '0', '1', '\\image\\gjDvad6Eli1547189113786.jpg', '/image/thumbnails/SxDMHyJ8T11547189143478.jpg');
INSERT INTO `shopinformation` VALUES ('98', '2019-01-11 15:00:56', 'Y7000P', '9', '11', '5200.00', '13', '0', '1', '1', '0', '14', '\\image\\wz9yg4rh7Y1547189966707.jpg', '/image/thumbnails/7lqlk5QqqA1547189966707.jpg');
INSERT INTO `shopinformation` VALUES ('99', '2019-01-11 15:03:51', 'Y7000P笔记本电脑', '9', '1', '5200.00', '13', '0', '1', '1', '0', '14', '\\image\\rgA92ZfDtF1547190083723.jpg', '/image/thumbnails\\9SnPp2yk2N1547190083723.jpg');
INSERT INTO `shopinformation` VALUES ('100', '2019-01-11 15:04:50', 'Y7000P笔记本电脑', '7', '1', '5200.00', '13', '1', '1', '1', '0', '14', '\\image\\h20eAzktkV1547190250583.jpg', '/image\\thumbnails\\I1cOdM9TMq1547190250583.jpg');
INSERT INTO `shopinformation` VALUES ('101', '2019-04-13 14:01:10', 'iPodAir', '7', '有需要的可以联系我+qq222222', '1000.00', '1', '1', '1', '1', '0', '1', '\\image\\YaKnfv5fis1555135269802.jpg', '\\image\\thumbnails\\l1VvyCNvdD1555135269802.jpg');

-- ----------------------------
-- Table structure for shoppicture
-- ----------------------------
DROP TABLE IF EXISTS `shoppicture`;
CREATE TABLE `shoppicture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `sid` int(11) NOT NULL COMMENT '商品id',
  `picture` varchar(200) NOT NULL COMMENT '商品图片存放路径',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='商品图片信息表';

-- ----------------------------
-- Records of shoppicture
-- ----------------------------
INSERT INTO `shoppicture` VALUES ('1', null, '1', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('2', null, '2', '/image/01.jpg', '1');
INSERT INTO `shoppicture` VALUES ('3', null, '3', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('4', null, '4', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('5', null, '5', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('6', null, '6', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('7', null, '7', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('8', null, '8', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('9', null, '9', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('10', null, '10', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('11', null, '11', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('12', null, '12', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('13', null, '13', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('14', null, '14', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('15', null, '15', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('16', null, '16', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('17', null, '17', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('18', null, '18', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('19', null, '19', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('20', null, '20', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('21', null, '21', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('22', null, '22', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('23', null, '23', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('24', null, '24', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('25', null, '25', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('26', null, '26', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('27', null, '27', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('28', null, '28', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('29', null, '29', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('30', null, '30', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('31', null, '31', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('32', null, '32', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('33', null, '33', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('34', null, '34', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('35', null, '35', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('36', null, '36', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('37', null, '37', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('38', null, '38', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('39', null, '39', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('40', null, '40', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('41', null, '41', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('42', null, '42', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('43', null, '43', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('44', null, '44', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('45', null, '45', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('46', null, '46', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('47', null, '47', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('48', null, '48', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('49', null, '49', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('50', null, '50', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('51', null, '51', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('52', null, '52', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('53', null, '53', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('54', null, '54', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('55', null, '55', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('56', null, '56', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('57', null, '57', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('58', null, '58', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('59', null, '59', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('60', null, '60', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('61', null, '61', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('62', null, '62', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('63', null, '63', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('64', null, '64', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('65', null, '65', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('66', null, '66', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('67', null, '67', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('68', null, '68', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('69', null, '69', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('70', null, '70', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('71', null, '71', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('72', null, '72', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('73', null, '73', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('74', null, '74', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('75', null, '75', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('76', null, '76', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('77', null, '77', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('78', null, '78', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('79', null, '79', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('80', null, '80', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('81', null, '81', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('82', null, '82', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('83', null, '83', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('84', null, '84', '/image/1.jpg', '1');
INSERT INTO `shoppicture` VALUES ('85', '2017-05-14 20:04:48', '87', '\\image/eW5NE6CM121494763475193.jpg', '1');
INSERT INTO `shoppicture` VALUES ('86', '2017-05-14 20:07:50', '88', '\\image/02.jpg', '1');
INSERT INTO `shoppicture` VALUES ('87', '2017-05-14 20:14:14', '89', '\\image\\htEZLneu1d1494764039225.jpg', '1');
INSERT INTO `shoppicture` VALUES ('88', '2017-05-14 20:15:30', '90', '\\image\\OAkysrUmZs1494764129394.jpg', '1');

-- ----------------------------
-- Table structure for specifickinds
-- ----------------------------
DROP TABLE IF EXISTS `specifickinds`;
CREATE TABLE `specifickinds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '菜单项名称',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `cid` int(11) NOT NULL COMMENT '上级菜单id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='三级菜单信息表';

-- ----------------------------
-- Records of specifickinds
-- ----------------------------
INSERT INTO `specifickinds` VALUES ('1', '苹果', null, '1');
INSERT INTO `specifickinds` VALUES ('2', '三星', null, '1');
INSERT INTO `specifickinds` VALUES ('3', '小米', null, '1');
INSERT INTO `specifickinds` VALUES ('4', '华为', null, '1');
INSERT INTO `specifickinds` VALUES ('5', '中兴', null, '1');
INSERT INTO `specifickinds` VALUES ('6', '联想', null, '1');
INSERT INTO `specifickinds` VALUES ('7', '魅族', null, '1');
INSERT INTO `specifickinds` VALUES ('8', '其他', null, '1');
INSERT INTO `specifickinds` VALUES ('9', '耳机', null, '1');
INSERT INTO `specifickinds` VALUES ('10', '普通相机', null, '2');
INSERT INTO `specifickinds` VALUES ('11', '单反', null, '2');
INSERT INTO `specifickinds` VALUES ('12', '其他', null, '2');
INSERT INTO `specifickinds` VALUES ('13', '笔记本', null, '3');
INSERT INTO `specifickinds` VALUES ('14', '平板电脑', null, '3');
INSERT INTO `specifickinds` VALUES ('15', '台式机', null, '3');
INSERT INTO `specifickinds` VALUES ('16', '显示器', null, '3');
INSERT INTO `specifickinds` VALUES ('17', '鼠标', null, '3');
INSERT INTO `specifickinds` VALUES ('18', '硬盘', null, '3');
INSERT INTO `specifickinds` VALUES ('19', 'U盘', null, '3');
INSERT INTO `specifickinds` VALUES ('20', '移动硬盘', null, '3');
INSERT INTO `specifickinds` VALUES ('21', '其他', null, '3');
INSERT INTO `specifickinds` VALUES ('22', '洗衣机', null, '4');
INSERT INTO `specifickinds` VALUES ('23', '饮水机', null, '4');
INSERT INTO `specifickinds` VALUES ('24', '吹风机', null, '4');
INSERT INTO `specifickinds` VALUES ('25', '剃须刀', null, '4');
INSERT INTO `specifickinds` VALUES ('26', '风扇', null, '4');
INSERT INTO `specifickinds` VALUES ('27', '煮蛋器', null, '4');
INSERT INTO `specifickinds` VALUES ('28', '电磁炉', null, '4');
INSERT INTO `specifickinds` VALUES ('29', '电饭煲', null, '4');
INSERT INTO `specifickinds` VALUES ('30', '其他', null, '4');
INSERT INTO `specifickinds` VALUES ('31', '耳机', null, '5');
INSERT INTO `specifickinds` VALUES ('32', '音响', null, '5');
INSERT INTO `specifickinds` VALUES ('33', '功放', null, '5');
INSERT INTO `specifickinds` VALUES ('34', '低音炮', null, '5');
INSERT INTO `specifickinds` VALUES ('35', '麦克风', null, '5');
INSERT INTO `specifickinds` VALUES ('36', '上衣', null, '6');
INSERT INTO `specifickinds` VALUES ('37', '裤子', null, '6');
INSERT INTO `specifickinds` VALUES ('38', '裙子', null, '6');
INSERT INTO `specifickinds` VALUES ('39', '其他', null, '6');
INSERT INTO `specifickinds` VALUES ('40', '上衣', null, '7');
INSERT INTO `specifickinds` VALUES ('41', '裤子', null, '7');
INSERT INTO `specifickinds` VALUES ('42', '其他', null, '7');
INSERT INTO `specifickinds` VALUES ('43', '运动鞋', null, '8');
INSERT INTO `specifickinds` VALUES ('44', '皮鞋', null, '8');
INSERT INTO `specifickinds` VALUES ('45', '帆布鞋', null, '8');
INSERT INTO `specifickinds` VALUES ('46', '球鞋', null, '8');
INSERT INTO `specifickinds` VALUES ('47', '板鞋', null, '8');
INSERT INTO `specifickinds` VALUES ('48', '其他', null, '8');
INSERT INTO `specifickinds` VALUES ('49', '运动鞋', null, '9');
INSERT INTO `specifickinds` VALUES ('50', '皮鞋', '2017-05-10 21:53:20', '9');
INSERT INTO `specifickinds` VALUES ('51', '帆布鞋', '2017-05-10 21:53:23', '9');
INSERT INTO `specifickinds` VALUES ('52', '球鞋', '2017-05-10 21:53:26', '9');
INSERT INTO `specifickinds` VALUES ('53', '板鞋', '2017-05-10 21:53:28', '9');
INSERT INTO `specifickinds` VALUES ('54', '其他', '2017-05-10 21:53:30', '9');
INSERT INTO `specifickinds` VALUES ('55', '背包', null, '10');
INSERT INTO `specifickinds` VALUES ('56', '旅行箱', null, '10');
INSERT INTO `specifickinds` VALUES ('57', '其他', null, '10');
INSERT INTO `specifickinds` VALUES ('58', '机械表', null, '11');
INSERT INTO `specifickinds` VALUES ('59', '石英表', null, '11');
INSERT INTO `specifickinds` VALUES ('60', '电子表', null, '11');
INSERT INTO `specifickinds` VALUES ('61', '其他', null, '11');
INSERT INTO `specifickinds` VALUES ('62', '足球', null, '12');
INSERT INTO `specifickinds` VALUES ('63', '羽毛球拍', null, '12');
INSERT INTO `specifickinds` VALUES ('64', '网球拍', null, '12');
INSERT INTO `specifickinds` VALUES ('65', '篮球', null, '12');
INSERT INTO `specifickinds` VALUES ('66', '滑轮', null, '12');
INSERT INTO `specifickinds` VALUES ('67', '乒乓球拍', null, '12');
INSERT INTO `specifickinds` VALUES ('68', '滑板', null, '12');
INSERT INTO `specifickinds` VALUES ('69', '其他', null, '12');
INSERT INTO `specifickinds` VALUES ('70', '自行车', null, '13');
INSERT INTO `specifickinds` VALUES ('71', '电动车', null, '13');
INSERT INTO `specifickinds` VALUES ('72', '其他', null, '13');
INSERT INTO `specifickinds` VALUES ('73', '文学', null, '14');
INSERT INTO `specifickinds` VALUES ('74', '漫画', null, '14');
INSERT INTO `specifickinds` VALUES ('75', '小说', null, '14');
INSERT INTO `specifickinds` VALUES ('76', '其他', null, '14');
INSERT INTO `specifickinds` VALUES ('77', '生物', null, '15');
INSERT INTO `specifickinds` VALUES ('78', '化学', null, '15');
INSERT INTO `specifickinds` VALUES ('79', '物理', null, '15');
INSERT INTO `specifickinds` VALUES ('80', '语文', null, '15');
INSERT INTO `specifickinds` VALUES ('81', '外语', null, '15');
INSERT INTO `specifickinds` VALUES ('82', '数学', null, '15');
INSERT INTO `specifickinds` VALUES ('83', '政治', null, '15');
INSERT INTO `specifickinds` VALUES ('84', '历史', null, '15');
INSERT INTO `specifickinds` VALUES ('85', '地理', null, '15');
INSERT INTO `specifickinds` VALUES ('86', '计算机 ', null, '15');
INSERT INTO `specifickinds` VALUES ('87', '机械', null, '15');
INSERT INTO `specifickinds` VALUES ('88', '土木', null, '15');
INSERT INTO `specifickinds` VALUES ('89', '艺术', null, '15');
INSERT INTO `specifickinds` VALUES ('90', '其他', null, '15');
INSERT INTO `specifickinds` VALUES ('91', '笔', null, '16');
INSERT INTO `specifickinds` VALUES ('92', '其他', null, '16');
INSERT INTO `specifickinds` VALUES ('93', '其他', null, '5');
INSERT INTO `specifickinds` VALUES ('94', '其他', null, '17');

-- ----------------------------
-- Table structure for useraddress
-- ----------------------------
DROP TABLE IF EXISTS `useraddress`;
CREATE TABLE `useraddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `reciver` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '收货人',
  `phone` char(11) NOT NULL COMMENT '收货人手机号',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '收货地址',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `display` int(1) DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='用户收货地址信息表';

-- ----------------------------
-- Records of useraddress
-- ----------------------------
INSERT INTO `useraddress` VALUES ('1', '测试', '13888888888', '14#321', '1', '0');

-- ----------------------------
-- Table structure for usercollection
-- ----------------------------
DROP TABLE IF EXISTS `usercollection`;
CREATE TABLE `usercollection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usercollection
-- ----------------------------

-- ----------------------------
-- Table structure for userinformation
-- ----------------------------
DROP TABLE IF EXISTS `userinformation`;
CREATE TABLE `userinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `clazz` varchar(50) DEFAULT NULL COMMENT '班级(暂时用学号)',
  `sno` char(12) DEFAULT NULL COMMENT '学号',
  `dormitory` varchar(50) DEFAULT NULL COMMENT '宿舍(收货默认地址)',
  `gender` char(2) DEFAULT NULL COMMENT '性别',
  `createtime` datetime DEFAULT NULL COMMENT '用户注册时间',
  `avatar` varchar(200) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_id` (`id`) USING BTREE,
  KEY `selectByPhone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户个人信息表';

-- ----------------------------
-- Records of userinformation
-- ----------------------------
INSERT INTO `userinformation` VALUES ('1', '2017-05-14 13:56:04', '123', '123', 'ttt', 'test', '2', '1234', '男', '2017-05-14 13:56:04', null, null);
INSERT INTO `userinformation` VALUES ('2', '2017-05-14 14:00:13', '111', '1234', null, null, null, null, null, '2017-05-14 14:00:14', null, null);
INSERT INTO `userinformation` VALUES ('3', '2017-05-14 14:55:28', '111', '122', null, null, null, null, null, '2017-05-14 14:55:28', null, null);
INSERT INTO `userinformation` VALUES ('4', '2017-05-14 15:00:11', '124', '124', '1', null, '1', '1', '男', '2017-05-14 15:00:11', null, null);
INSERT INTO `userinformation` VALUES ('5', '2017-05-14 15:00:45', '12', '125', null, null, null, null, null, '2017-05-14 15:00:45', null, null);
INSERT INTO `userinformation` VALUES ('6', '2017-05-14 15:01:13', '13', '126', null, null, null, null, null, '2017-05-14 15:01:13', null, null);
INSERT INTO `userinformation` VALUES ('7', '2017-05-19 14:43:01', 'wsk1103', '127', '1', '信11142', '3', '9407', '男', '2017-05-20 15:14:14', '', null);
INSERT INTO `userinformation` VALUES ('8', '2017-05-20 22:31:08', '321', '128', null, null, null, null, null, '2017-05-20 22:31:03', null, null);
INSERT INTO `userinformation` VALUES ('9', '2018-09-09 15:34:18', 'test', '129', null, null, null, null, null, '2018-09-09 15:34:17', null, null);
INSERT INTO `userinformation` VALUES ('10', '2019-01-04 11:14:03', 'admin', '13784514521', 'admin', '1', 'admin', '1', '男', '2019-01-04 11:14:03', null, null);
INSERT INTO `userinformation` VALUES ('11', '2019-01-04 12:38:13', 'admin', '13754263258', '1', null, '1', '1', null, '2019-01-04 12:38:13', null, null);
INSERT INTO `userinformation` VALUES ('12', '2019-01-04 12:47:24', 'A', '13754263254', null, null, null, null, null, '2019-01-04 12:47:24', null, null);
INSERT INTO `userinformation` VALUES ('13', '2019-01-04 18:14:57', '123', '17835411628', null, null, null, null, null, '2019-01-04 18:14:53', null, null);
INSERT INTO `userinformation` VALUES ('14', '2019-01-08 16:53:32', '1', '1', '1', null, '1', '111', '男', '2019-01-08 16:53:32', null, null);
INSERT INTO `userinformation` VALUES ('15', '2019-01-17 18:35:51', 'test', '18888888888', 'test', null, 'test', '16#441', '男', '2019-01-17 18:35:51', null, null);
INSERT INTO `userinformation` VALUES ('16', '2019-01-17 18:39:29', '1', '18999999999', 'test', null, '0', '16#441', '男', '2019-01-17 18:39:29', null, null);
INSERT INTO `userinformation` VALUES ('17', '2019-01-17 19:18:53', '0', '13888888888', 'test', null, '1', '16#441', '男', '2019-01-17 19:18:53', null, null);
INSERT INTO `userinformation` VALUES ('18', '2019-01-17 20:39:51', 'oo', '13754919812', null, null, null, null, null, '2019-01-17 20:39:51', null, null);
INSERT INTO `userinformation` VALUES ('19', '2019-04-13 14:07:20', 'test1111', '13754121232', '张三', null, '1522664', '14#441', '男', '2019-04-13 14:07:20', null, null);

-- ----------------------------
-- Table structure for userpassword
-- ----------------------------
DROP TABLE IF EXISTS `userpassword`;
CREATE TABLE `userpassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id(唯一)',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `password` varchar(24) NOT NULL COMMENT '用户密码(md5加密)',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户密码信息表';

-- ----------------------------
-- Records of userpassword
-- ----------------------------
INSERT INTO `userpassword` VALUES ('1', '2019-01-08 12:30:07', 'ICy5YqxZB1uWSwcVLSNLcA==', '1');
INSERT INTO `userpassword` VALUES ('2', '2017-05-20 22:00:49', 'xMpCOKC5I4INzFCab3WEmw==', '2');
INSERT INTO `userpassword` VALUES ('3', '2017-05-14 14:55:29', 'xEvruXPhT+U5Z24OkVWxIQ==', '3');
INSERT INTO `userpassword` VALUES ('4', '2019-01-15 18:44:42', 'yP/ppYexJvFS7T2JoUa0RQ==', '4');
INSERT INTO `userpassword` VALUES ('5', '2017-05-14 15:00:45', 'xEvruXPhT+U5Z24OkVWxIQ==', '5');
INSERT INTO `userpassword` VALUES ('6', '2017-05-14 15:01:13', 'QXS66gM33hU5x/b2PrUHRA==', '6');
INSERT INTO `userpassword` VALUES ('7', '2017-05-26 13:33:49', 'QXS66gM33hU5x/b2PrUHRA==', '7');
INSERT INTO `userpassword` VALUES ('8', '2017-05-20 22:31:17', 'xMpCOKC5I4INzFCab3WEmw==', '8');
INSERT INTO `userpassword` VALUES ('9', '2018-09-09 15:34:23', 'wgrU12/pd1mqJ6DJm/9nEA==', '9');
INSERT INTO `userpassword` VALUES ('10', '2019-01-04 11:28:57', 'ICy5YqxZB1uWSwcVLSNLcA==', '10');
INSERT INTO `userpassword` VALUES ('11', '2019-01-04 12:38:13', 'Qpf0SxOVUjUkWySXOZ16kw==', '11');
INSERT INTO `userpassword` VALUES ('12', '2019-01-04 12:47:24', 'QXS66gM33hU5x/b2PrUHRA==', '12');
INSERT INTO `userpassword` VALUES ('13', '2019-01-04 18:14:58', 'ICy5YqxZB1uWSwcVLSNLcA==', '13');
INSERT INTO `userpassword` VALUES ('14', '2019-01-08 16:53:32', 'xMpCOKC5I4INzFCab3WEmw==', '14');
INSERT INTO `userpassword` VALUES ('15', '2019-01-17 18:35:51', 'ICy5YqxZB1uWSwcVLSNLcA==', '15');
INSERT INTO `userpassword` VALUES ('16', '2019-01-17 18:39:29', 'ICy5YqxZB1uWSwcVLSNLcA==', '16');
INSERT INTO `userpassword` VALUES ('17', '2019-01-17 19:18:54', 'ICy5YqxZB1uWSwcVLSNLcA==', '17');
INSERT INTO `userpassword` VALUES ('18', '2019-01-17 20:39:51', 'ICy5YqxZB1uWSwcVLSNLcA==', '18');
INSERT INTO `userpassword` VALUES ('19', '2019-04-13 14:07:20', 'ICy5YqxZB1uWSwcVLSNLcA==', '19');

-- ----------------------------
-- Table structure for userrelease
-- ----------------------------
DROP TABLE IF EXISTS `userrelease`;
CREATE TABLE `userrelease` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` datetime DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userrelease
-- ----------------------------
INSERT INTO `userrelease` VALUES ('1', '2019-04-25 16:08:41', '1', '7', '91');
INSERT INTO `userrelease` VALUES ('2', '2019-04-25 16:08:41', '1', '7', '92');
INSERT INTO `userrelease` VALUES ('3', '2019-04-25 16:08:41', '1', '61', '95');
INSERT INTO `userrelease` VALUES ('4', '2019-04-25 16:08:41', '1', '50', '96');
INSERT INTO `userrelease` VALUES ('5', '2019-04-25 16:08:41', '1', '18', '97');
INSERT INTO `userrelease` VALUES ('6', '2019-04-25 16:08:41', '1', '29', '98');
INSERT INTO `userrelease` VALUES ('7', '2019-04-25 16:08:41', '1', '38', '99');
INSERT INTO `userrelease` VALUES ('8', '2019-04-25 16:08:41', '1', '44', '100');
INSERT INTO `userrelease` VALUES ('9', '2019-04-25 16:08:41', '1', '14', '101');
INSERT INTO `userrelease` VALUES ('10', '2019-04-25 16:08:41', '1', '52', '102');
INSERT INTO `userrelease` VALUES ('11', '2019-04-25 16:08:41', '1', '37', '103');
INSERT INTO `userrelease` VALUES ('12', '2019-04-25 16:08:41', '1', '43', '104');
INSERT INTO `userrelease` VALUES ('13', '2019-04-25 16:08:41', '1', '52', '105');
INSERT INTO `userrelease` VALUES ('14', '2019-04-25 16:08:41', '1', '61', '106');
INSERT INTO `userrelease` VALUES ('15', '2019-04-25 16:08:41', '1', '31', '107');
INSERT INTO `userrelease` VALUES ('16', '2019-04-25 16:08:41', '1', '51', '108');
INSERT INTO `userrelease` VALUES ('17', '2019-04-25 16:08:41', '1', '63', '109');
INSERT INTO `userrelease` VALUES ('18', '2019-04-25 16:08:41', '1', '29', '110');
INSERT INTO `userrelease` VALUES ('19', '2019-04-25 16:08:41', '1', '37', '111');
INSERT INTO `userrelease` VALUES ('20', '2019-04-25 16:08:41', '1', '16', '112');
INSERT INTO `userrelease` VALUES ('21', '2019-04-25 16:08:41', '1', '38', '113');
INSERT INTO `userrelease` VALUES ('22', '2019-04-25 16:08:41', '1', '65', '114');
INSERT INTO `userrelease` VALUES ('23', '2019-04-25 16:08:41', '1', '15', '115');
INSERT INTO `userrelease` VALUES ('24', '2019-04-25 16:08:41', '1', '61', '116');
INSERT INTO `userrelease` VALUES ('25', '2019-04-25 16:08:41', '1', '54', '117');
INSERT INTO `userrelease` VALUES ('26', '2019-04-25 16:08:41', '1', '73', '118');
INSERT INTO `userrelease` VALUES ('27', '2019-04-25 16:08:41', '1', '74', '119');
INSERT INTO `userrelease` VALUES ('28', '2019-04-25 16:08:41', '1', '46', '120');
INSERT INTO `userrelease` VALUES ('29', '2019-04-25 16:08:41', '1', '98', '121');
INSERT INTO `userrelease` VALUES ('30', '2019-04-25 16:08:41', '1', '50', '122');
INSERT INTO `userrelease` VALUES ('31', '2019-04-25 16:08:41', '1', '92', '123');
INSERT INTO `userrelease` VALUES ('32', '2019-04-25 16:08:41', '1', '60', '124');
INSERT INTO `userrelease` VALUES ('33', '2019-04-25 16:08:41', '1', '21', '125');
INSERT INTO `userrelease` VALUES ('34', '2019-04-25 16:08:41', '1', '79', '126');
INSERT INTO `userrelease` VALUES ('35', '2019-04-25 16:08:41', '1', '71', '127');
INSERT INTO `userrelease` VALUES ('36', '2019-04-25 16:08:41', '1', '90', '128');
INSERT INTO `userrelease` VALUES ('37', '2019-04-25 16:08:41', '1', '64', '129');
INSERT INTO `userrelease` VALUES ('38', '2019-04-25 16:08:41', '1', '89', '130');
INSERT INTO `userrelease` VALUES ('39', '2019-04-25 16:08:41', '1', '55', '131');
INSERT INTO `userrelease` VALUES ('40', '2019-04-25 16:08:41', '1', '29', '132');
INSERT INTO `userrelease` VALUES ('41', '2019-04-25 16:08:41', '1', '34', '133');
INSERT INTO `userrelease` VALUES ('42', '2019-04-25 16:08:41', '1', '92', '134');
INSERT INTO `userrelease` VALUES ('43', '2019-04-25 16:08:41', '1', '32', '135');
INSERT INTO `userrelease` VALUES ('44', '2019-04-25 16:08:41', '1', '89', '136');
INSERT INTO `userrelease` VALUES ('45', '2019-04-25 16:08:41', '1', '65', '137');
INSERT INTO `userrelease` VALUES ('46', '2019-04-25 16:08:41', '1', '91', '138');
INSERT INTO `userrelease` VALUES ('47', '2019-04-25 16:08:41', '1', '40', '139');
INSERT INTO `userrelease` VALUES ('48', '2019-04-25 16:08:41', '1', '55', '140');
INSERT INTO `userrelease` VALUES ('49', '2019-04-25 16:08:41', '1', '6', '141');
INSERT INTO `userrelease` VALUES ('50', '2019-04-25 16:08:41', '1', '88', '142');
INSERT INTO `userrelease` VALUES ('51', '2019-04-25 16:08:41', '1', '45', '143');
INSERT INTO `userrelease` VALUES ('52', '2019-04-25 16:08:41', '1', '11', '144');
INSERT INTO `userrelease` VALUES ('53', '2019-04-25 16:08:41', '1', '32', '145');
INSERT INTO `userrelease` VALUES ('54', '2019-04-25 16:08:41', '1', '61', '146');
INSERT INTO `userrelease` VALUES ('55', '2019-04-25 16:08:41', '1', '44', '147');
INSERT INTO `userrelease` VALUES ('56', '2019-04-25 16:08:41', '1', '86', '148');
INSERT INTO `userrelease` VALUES ('57', '2019-04-25 16:08:41', '1', '30', '149');
INSERT INTO `userrelease` VALUES ('58', '2019-04-25 16:08:41', '1', '84', '150');
INSERT INTO `userrelease` VALUES ('59', '2019-04-25 16:08:41', '1', '90', '151');
INSERT INTO `userrelease` VALUES ('60', '2019-04-25 16:08:41', '1', '73', '152');
INSERT INTO `userrelease` VALUES ('61', '2019-04-25 16:08:41', '1', '16', '153');
INSERT INTO `userrelease` VALUES ('62', '2019-04-25 16:08:41', '1', '61', '154');
INSERT INTO `userrelease` VALUES ('63', '2019-04-25 16:08:41', '1', '21', '155');
INSERT INTO `userrelease` VALUES ('64', '2019-04-25 16:08:41', '1', '92', '156');
INSERT INTO `userrelease` VALUES ('65', '2019-04-25 16:08:41', '1', '44', '157');
INSERT INTO `userrelease` VALUES ('66', '2019-04-25 16:08:41', '1', '11', '158');
INSERT INTO `userrelease` VALUES ('67', '2019-04-25 16:08:41', '1', '76', '159');
INSERT INTO `userrelease` VALUES ('68', '2019-04-25 16:08:41', '1', '31', '160');
INSERT INTO `userrelease` VALUES ('69', '2019-04-25 16:08:41', '1', '18', '161');
INSERT INTO `userrelease` VALUES ('70', '2019-04-25 16:08:41', '1', '9', '162');
INSERT INTO `userrelease` VALUES ('71', '2019-04-25 16:08:41', '1', '42', '163');
INSERT INTO `userrelease` VALUES ('72', '2019-04-25 16:08:41', '1', '92', '164');
INSERT INTO `userrelease` VALUES ('73', '2019-04-25 16:08:41', '1', '5', '165');
INSERT INTO `userrelease` VALUES ('74', '2019-04-25 16:08:41', '1', '57', '166');
INSERT INTO `userrelease` VALUES ('75', '2019-04-25 16:08:41', '1', '81', '167');
INSERT INTO `userrelease` VALUES ('76', '2019-04-25 16:08:41', '1', '39', '168');
INSERT INTO `userrelease` VALUES ('77', '2019-04-25 16:08:41', '1', '57', '169');
INSERT INTO `userrelease` VALUES ('78', '2019-04-25 16:08:41', '1', '16', '170');
INSERT INTO `userrelease` VALUES ('79', '2019-04-25 16:08:41', '1', '95', '171');
INSERT INTO `userrelease` VALUES ('80', '2019-04-25 16:08:41', '1', '95', '172');
INSERT INTO `userrelease` VALUES ('81', '2019-04-25 16:08:41', '1', '68', '173');
INSERT INTO `userrelease` VALUES ('82', '2019-04-25 16:08:41', '1', '56', '174');
INSERT INTO `userrelease` VALUES ('83', '2019-04-25 16:08:41', '1', '82', '175');
INSERT INTO `userrelease` VALUES ('84', '2019-04-25 16:08:41', '1', '44', '176');
INSERT INTO `userrelease` VALUES ('85', '2019-04-25 16:08:41', '1', '81', '177');
INSERT INTO `userrelease` VALUES ('86', '2019-04-25 16:08:41', '1', '32', '178');
INSERT INTO `userrelease` VALUES ('87', '2019-04-25 16:08:41', '1', '90', '179');
INSERT INTO `userrelease` VALUES ('88', '2019-04-25 16:08:41', '1', '22', '180');
INSERT INTO `userrelease` VALUES ('89', '2019-04-25 16:08:41', '1', '84', '181');
INSERT INTO `userrelease` VALUES ('90', '2019-04-25 16:08:41', '1', '71', '182');
INSERT INTO `userrelease` VALUES ('91', '2019-04-25 16:08:41', '1', '36', '183');
INSERT INTO `userrelease` VALUES ('92', '2019-04-25 16:08:41', '1', '80', '184');
INSERT INTO `userrelease` VALUES ('93', '2019-04-25 16:08:41', '1', '86', '185');
INSERT INTO `userrelease` VALUES ('94', '2019-04-25 16:08:41', '1', '35', '186');
INSERT INTO `userrelease` VALUES ('95', '2019-04-25 16:08:41', '1', '13', '187');
INSERT INTO `userrelease` VALUES ('96', '2019-04-25 16:08:41', '1', '4', '188');
INSERT INTO `userrelease` VALUES ('97', '2019-04-25 16:08:41', '1', '68', '189');
INSERT INTO `userrelease` VALUES ('98', '2019-04-25 16:08:41', '1', '30', '190');
INSERT INTO `userrelease` VALUES ('99', '2019-04-25 16:08:41', '1', '80', '191');
INSERT INTO `userrelease` VALUES ('100', '2019-04-25 16:08:41', '1', '16', '192');
INSERT INTO `userrelease` VALUES ('101', '2019-04-25 16:08:41', '1', '52', '193');
INSERT INTO `userrelease` VALUES ('102', '2019-04-25 16:08:41', '1', '53', '194');
INSERT INTO `userrelease` VALUES ('103', '2019-04-25 16:08:41', '1', '61', '195');
INSERT INTO `userrelease` VALUES ('104', '2019-04-25 16:08:41', '1', '85', '196');
INSERT INTO `userrelease` VALUES ('105', '2019-04-25 16:08:41', '1', '89', '197');
INSERT INTO `userrelease` VALUES ('106', '2019-04-25 16:08:41', '1', '21', '198');
INSERT INTO `userrelease` VALUES ('107', '2019-04-25 16:08:41', '1', '57', '199');
INSERT INTO `userrelease` VALUES ('108', '2019-04-25 16:08:41', '1', '4', '200');
INSERT INTO `userrelease` VALUES ('109', '2019-04-25 16:08:41', '1', '37', '201');
INSERT INTO `userrelease` VALUES ('110', '2019-04-25 16:08:41', '1', '36', '202');
INSERT INTO `userrelease` VALUES ('111', '2019-04-25 16:08:41', '1', '47', '203');
INSERT INTO `userrelease` VALUES ('112', '2019-04-25 16:08:41', '1', '89', '204');
INSERT INTO `userrelease` VALUES ('113', '2019-04-25 16:08:41', '1', '96', '205');
INSERT INTO `userrelease` VALUES ('114', '2019-04-25 16:08:41', '1', '17', '206');
INSERT INTO `userrelease` VALUES ('115', '2019-04-25 16:08:41', '1', '57', '207');
INSERT INTO `userrelease` VALUES ('116', '2019-04-25 16:08:41', '1', '4', '208');
INSERT INTO `userrelease` VALUES ('117', '2019-04-25 16:08:41', '1', '100', '209');
INSERT INTO `userrelease` VALUES ('118', '2019-04-25 16:08:41', '1', '97', '210');
INSERT INTO `userrelease` VALUES ('119', '2019-04-25 16:08:41', '1', '56', '211');
INSERT INTO `userrelease` VALUES ('120', '2019-04-25 16:08:41', '1', '55', '212');
INSERT INTO `userrelease` VALUES ('121', '2019-04-25 16:08:41', '1', '51', '213');
INSERT INTO `userrelease` VALUES ('122', '2019-04-25 16:08:41', '1', '29', '214');
INSERT INTO `userrelease` VALUES ('123', '2019-04-25 16:08:41', '1', '61', '215');
INSERT INTO `userrelease` VALUES ('124', '2019-04-25 16:08:41', '1', '78', '216');
INSERT INTO `userrelease` VALUES ('125', '2019-04-25 16:08:41', '1', '26', '217');
INSERT INTO `userrelease` VALUES ('126', '2019-04-25 16:08:41', '1', '77', '218');
INSERT INTO `userrelease` VALUES ('127', '2019-04-25 16:08:41', '1', '89', '219');
INSERT INTO `userrelease` VALUES ('128', '2019-04-25 16:08:41', '1', '91', '220');
INSERT INTO `userrelease` VALUES ('129', '2019-04-25 16:08:41', '1', '80', '221');
INSERT INTO `userrelease` VALUES ('130', '2019-04-25 16:08:41', '1', '31', '222');
INSERT INTO `userrelease` VALUES ('131', '2019-04-25 16:08:41', '1', '8', '223');
INSERT INTO `userrelease` VALUES ('132', '2019-04-25 16:08:41', '1', '41', '224');
INSERT INTO `userrelease` VALUES ('133', '2019-04-25 16:08:41', '1', '51', '225');
INSERT INTO `userrelease` VALUES ('134', '2019-04-25 16:08:41', '1', '74', '226');
INSERT INTO `userrelease` VALUES ('135', '2019-04-25 16:08:41', '1', '39', '227');
INSERT INTO `userrelease` VALUES ('136', '2019-04-25 16:08:41', '1', '80', '228');
INSERT INTO `userrelease` VALUES ('137', '2019-04-25 16:08:41', '1', '59', '229');
INSERT INTO `userrelease` VALUES ('138', '2019-04-25 16:08:41', '1', '90', '230');
INSERT INTO `userrelease` VALUES ('139', '2019-04-25 16:08:41', '1', '47', '231');
INSERT INTO `userrelease` VALUES ('140', '2019-04-25 16:08:41', '1', '64', '232');
INSERT INTO `userrelease` VALUES ('141', '2019-04-25 16:08:41', '1', '24', '233');
INSERT INTO `userrelease` VALUES ('142', '2019-04-25 16:08:41', '1', '19', '234');
INSERT INTO `userrelease` VALUES ('143', '2019-04-25 16:08:41', '1', '42', '235');
INSERT INTO `userrelease` VALUES ('144', '2019-04-25 16:08:41', '1', '87', '236');
INSERT INTO `userrelease` VALUES ('145', '2019-04-25 16:08:41', '1', '51', '237');
INSERT INTO `userrelease` VALUES ('146', '2019-04-25 16:08:41', '1', '74', '238');
INSERT INTO `userrelease` VALUES ('147', '2019-04-25 16:08:41', '1', '53', '239');
INSERT INTO `userrelease` VALUES ('148', '2019-04-25 16:08:41', '1', '90', '240');
INSERT INTO `userrelease` VALUES ('149', '2019-04-25 16:08:41', '1', '93', '241');
INSERT INTO `userrelease` VALUES ('150', '2019-04-25 16:08:41', '1', '68', '242');
INSERT INTO `userrelease` VALUES ('151', '2019-04-25 16:08:41', '1', '68', '243');
INSERT INTO `userrelease` VALUES ('152', '2019-04-25 16:08:41', '1', '32', '244');
INSERT INTO `userrelease` VALUES ('153', '2019-04-25 16:08:41', '1', '60', '245');
INSERT INTO `userrelease` VALUES ('154', '2019-04-25 16:08:41', '1', '91', '246');
INSERT INTO `userrelease` VALUES ('155', '2019-04-25 16:08:41', '1', '11', '247');
INSERT INTO `userrelease` VALUES ('156', '2019-04-25 16:08:41', '1', '61', '248');
INSERT INTO `userrelease` VALUES ('157', '2019-04-25 16:08:41', '1', '35', '249');
INSERT INTO `userrelease` VALUES ('158', '2019-04-25 16:08:41', '1', '41', '250');
INSERT INTO `userrelease` VALUES ('159', '2019-04-25 16:08:41', '1', '17', '251');
INSERT INTO `userrelease` VALUES ('160', '2019-04-25 16:08:41', '1', '8', '252');
INSERT INTO `userrelease` VALUES ('161', '2019-04-25 16:08:41', '1', '97', '253');
INSERT INTO `userrelease` VALUES ('162', '2019-04-25 16:08:41', '1', '39', '254');
INSERT INTO `userrelease` VALUES ('163', '2019-04-25 16:08:41', '1', '47', '255');
INSERT INTO `userrelease` VALUES ('164', '2019-04-25 16:08:41', '1', '79', '256');
INSERT INTO `userrelease` VALUES ('165', '2019-04-25 16:08:41', '1', '93', '257');
INSERT INTO `userrelease` VALUES ('166', '2019-04-25 16:08:41', '1', '15', '258');
INSERT INTO `userrelease` VALUES ('167', '2019-04-25 16:08:41', '1', '3', '259');
INSERT INTO `userrelease` VALUES ('168', '2019-04-25 16:08:41', '1', '94', '260');
INSERT INTO `userrelease` VALUES ('169', '2019-04-25 16:08:41', '1', '62', '261');
INSERT INTO `userrelease` VALUES ('170', '2019-04-25 16:08:41', '1', '96', '262');
INSERT INTO `userrelease` VALUES ('171', '2019-04-25 16:08:41', '1', '16', '263');
INSERT INTO `userrelease` VALUES ('172', '2019-04-25 16:08:41', '1', '20', '264');
INSERT INTO `userrelease` VALUES ('173', '2019-04-25 16:08:41', '1', '78', '265');
INSERT INTO `userrelease` VALUES ('174', '2019-04-25 16:08:41', '1', '22', '266');
INSERT INTO `userrelease` VALUES ('175', '2019-04-25 16:08:41', '1', '59', '267');
INSERT INTO `userrelease` VALUES ('176', '2019-04-25 16:08:41', '1', '87', '268');
INSERT INTO `userrelease` VALUES ('177', '2019-04-25 16:08:41', '1', '49', '269');
INSERT INTO `userrelease` VALUES ('178', '2019-04-25 16:08:41', '1', '12', '270');
INSERT INTO `userrelease` VALUES ('179', '2019-04-25 16:08:41', '1', '18', '271');
INSERT INTO `userrelease` VALUES ('180', '2019-04-25 16:08:41', '1', '55', '272');
INSERT INTO `userrelease` VALUES ('181', '2019-04-25 16:08:41', '1', '24', '273');
INSERT INTO `userrelease` VALUES ('182', '2019-04-25 16:08:41', '1', '42', '274');
INSERT INTO `userrelease` VALUES ('183', '2019-04-25 16:08:41', '1', '76', '275');
INSERT INTO `userrelease` VALUES ('184', '2019-04-25 16:08:41', '1', '48', '276');
INSERT INTO `userrelease` VALUES ('185', '2019-04-25 16:08:41', '1', '23', '277');
INSERT INTO `userrelease` VALUES ('186', '2019-04-25 16:08:41', '1', '42', '278');
INSERT INTO `userrelease` VALUES ('187', '2019-04-25 16:08:41', '1', '1', '279');
INSERT INTO `userrelease` VALUES ('188', '2019-04-25 16:08:41', '1', '29', '280');
INSERT INTO `userrelease` VALUES ('189', '2019-04-25 16:08:41', '1', '60', '281');
INSERT INTO `userrelease` VALUES ('190', '2019-04-25 16:08:41', '1', '2', '282');
INSERT INTO `userrelease` VALUES ('191', '2019-04-25 16:08:41', '1', '53', '283');
INSERT INTO `userrelease` VALUES ('192', '2019-04-25 16:08:41', '1', '85', '284');
INSERT INTO `userrelease` VALUES ('193', '2019-04-25 16:08:41', '1', '83', '285');
INSERT INTO `userrelease` VALUES ('194', '2019-04-25 16:08:41', '1', '10', '286');
INSERT INTO `userrelease` VALUES ('195', '2019-04-25 16:08:41', '1', '86', '287');
INSERT INTO `userrelease` VALUES ('196', '2019-04-25 16:08:41', '1', '98', '288');
INSERT INTO `userrelease` VALUES ('197', '2019-04-25 16:08:41', '1', '36', '289');
INSERT INTO `userrelease` VALUES ('198', '2019-04-25 16:08:41', '1', '32', '290');
INSERT INTO `userrelease` VALUES ('199', '2019-04-25 16:08:41', '1', '54', '291');
INSERT INTO `userrelease` VALUES ('200', '2019-04-25 16:08:41', '1', '9', '292');
INSERT INTO `userrelease` VALUES ('201', '2019-04-25 16:08:41', '1', '64', '293');
INSERT INTO `userrelease` VALUES ('202', '2019-04-25 16:08:41', '1', '49', '294');
INSERT INTO `userrelease` VALUES ('203', '2019-04-25 16:08:41', '1', '6', '295');
INSERT INTO `userrelease` VALUES ('204', '2019-04-25 16:08:41', '1', '76', '296');
INSERT INTO `userrelease` VALUES ('205', '2019-04-25 16:08:41', '1', '7', '297');
INSERT INTO `userrelease` VALUES ('206', '2019-04-25 16:08:41', '1', '8', '298');
INSERT INTO `userrelease` VALUES ('207', '2019-04-25 16:08:41', '1', '1', '299');
INSERT INTO `userrelease` VALUES ('208', '2019-04-25 16:08:41', '1', '32', '300');
INSERT INTO `userrelease` VALUES ('209', '2019-04-25 16:08:41', '1', '45', '301');
INSERT INTO `userrelease` VALUES ('210', '2019-04-25 16:08:41', '1', '79', '302');
INSERT INTO `userrelease` VALUES ('211', '2019-04-25 16:08:41', '1', '33', '303');
INSERT INTO `userrelease` VALUES ('212', '2019-04-25 16:08:41', '1', '18', '304');
INSERT INTO `userrelease` VALUES ('213', '2019-04-25 16:08:41', '1', '21', '305');
INSERT INTO `userrelease` VALUES ('214', '2019-04-25 16:08:41', '1', '14', '306');
INSERT INTO `userrelease` VALUES ('215', '2019-04-25 16:08:41', '1', '37', '307');
INSERT INTO `userrelease` VALUES ('216', '2019-04-25 16:08:41', '1', '37', '308');
INSERT INTO `userrelease` VALUES ('217', '2019-04-25 16:08:41', '1', '95', '309');
INSERT INTO `userrelease` VALUES ('218', '2019-04-25 16:08:41', '1', '40', '310');
INSERT INTO `userrelease` VALUES ('219', '2019-04-25 16:08:41', '1', '8', '311');
INSERT INTO `userrelease` VALUES ('220', '2019-04-25 16:08:41', '1', '39', '312');
INSERT INTO `userrelease` VALUES ('221', '2019-04-25 16:08:41', '1', '16', '313');
INSERT INTO `userrelease` VALUES ('222', '2019-04-25 16:08:41', '1', '28', '314');
INSERT INTO `userrelease` VALUES ('223', '2019-04-25 16:08:41', '1', '53', '315');
INSERT INTO `userrelease` VALUES ('224', '2019-04-25 16:08:41', '1', '17', '316');
INSERT INTO `userrelease` VALUES ('225', '2019-04-25 16:08:41', '1', '89', '317');
INSERT INTO `userrelease` VALUES ('226', '2019-04-25 16:08:41', '1', '92', '318');
INSERT INTO `userrelease` VALUES ('227', '2019-04-25 16:08:41', '1', '92', '319');
INSERT INTO `userrelease` VALUES ('228', '2019-04-25 16:08:41', '1', '81', '320');
INSERT INTO `userrelease` VALUES ('229', '2019-04-25 16:08:41', '1', '26', '321');
INSERT INTO `userrelease` VALUES ('230', '2019-04-25 16:08:41', '1', '57', '322');
INSERT INTO `userrelease` VALUES ('231', '2019-04-25 16:08:41', '1', '85', '323');
INSERT INTO `userrelease` VALUES ('232', '2019-04-25 16:08:41', '1', '6', '324');
INSERT INTO `userrelease` VALUES ('233', '2019-04-25 16:08:41', '1', '34', '325');
INSERT INTO `userrelease` VALUES ('234', '2019-04-25 16:08:41', '1', '63', '326');
INSERT INTO `userrelease` VALUES ('235', '2019-04-25 16:08:41', '1', '76', '327');
INSERT INTO `userrelease` VALUES ('236', '2019-04-25 16:08:41', '1', '31', '328');
INSERT INTO `userrelease` VALUES ('237', '2019-04-25 16:08:41', '1', '43', '329');
INSERT INTO `userrelease` VALUES ('238', '2019-04-25 16:08:41', '1', '30', '330');
INSERT INTO `userrelease` VALUES ('239', '2019-04-25 16:08:41', '1', '65', '331');
INSERT INTO `userrelease` VALUES ('240', '2019-04-25 16:08:41', '1', '13', '332');
INSERT INTO `userrelease` VALUES ('241', '2019-04-25 16:08:41', '1', '92', '333');
INSERT INTO `userrelease` VALUES ('242', '2019-04-25 16:08:41', '1', '19', '334');
INSERT INTO `userrelease` VALUES ('243', '2019-04-25 16:08:41', '1', '66', '335');
INSERT INTO `userrelease` VALUES ('244', '2019-04-25 16:08:41', '1', '8', '336');
INSERT INTO `userrelease` VALUES ('245', '2019-04-25 16:08:41', '1', '68', '337');
INSERT INTO `userrelease` VALUES ('246', '2019-04-25 16:08:41', '1', '64', '338');
INSERT INTO `userrelease` VALUES ('247', '2019-04-25 16:08:41', '1', '76', '339');
INSERT INTO `userrelease` VALUES ('248', '2019-04-25 16:08:41', '1', '98', '340');
INSERT INTO `userrelease` VALUES ('249', '2019-04-25 16:08:41', '1', '10', '341');
INSERT INTO `userrelease` VALUES ('250', '2019-04-25 16:08:41', '1', '89', '342');
INSERT INTO `userrelease` VALUES ('251', '2019-04-25 16:08:41', '1', '3', '343');
INSERT INTO `userrelease` VALUES ('252', '2019-04-25 16:08:41', '1', '62', '344');
INSERT INTO `userrelease` VALUES ('253', '2019-04-25 16:08:41', '1', '40', '345');
INSERT INTO `userrelease` VALUES ('254', '2019-04-25 16:08:41', '1', '43', '346');
INSERT INTO `userrelease` VALUES ('255', '2019-04-25 16:08:41', '1', '61', '347');
INSERT INTO `userrelease` VALUES ('256', '2019-04-25 16:08:41', '1', '51', '348');
INSERT INTO `userrelease` VALUES ('257', '2019-04-25 16:08:41', '1', '12', '349');
INSERT INTO `userrelease` VALUES ('258', '2019-04-25 16:08:41', '1', '20', '350');
INSERT INTO `userrelease` VALUES ('259', '2019-04-25 16:08:41', '1', '46', '351');
INSERT INTO `userrelease` VALUES ('260', '2019-04-25 16:08:41', '1', '29', '352');
INSERT INTO `userrelease` VALUES ('261', '2019-04-25 16:08:41', '1', '93', '353');
INSERT INTO `userrelease` VALUES ('262', '2019-04-25 16:08:41', '1', '83', '354');
INSERT INTO `userrelease` VALUES ('263', '2019-04-25 16:08:41', '1', '86', '355');
INSERT INTO `userrelease` VALUES ('264', '2019-04-25 16:08:41', '1', '90', '356');
INSERT INTO `userrelease` VALUES ('265', '2019-04-25 16:08:41', '1', '51', '357');
INSERT INTO `userrelease` VALUES ('266', '2019-04-25 16:08:41', '1', '27', '358');
INSERT INTO `userrelease` VALUES ('267', '2019-04-25 16:08:41', '1', '60', '359');
INSERT INTO `userrelease` VALUES ('268', '2019-04-25 16:08:41', '1', '42', '360');
INSERT INTO `userrelease` VALUES ('269', '2019-04-25 16:08:41', '1', '62', '361');
INSERT INTO `userrelease` VALUES ('270', '2019-04-25 16:08:41', '1', '2', '362');
INSERT INTO `userrelease` VALUES ('271', '2019-04-25 16:08:41', '1', '44', '363');
INSERT INTO `userrelease` VALUES ('272', '2019-04-25 16:08:41', '1', '20', '364');
INSERT INTO `userrelease` VALUES ('273', '2019-04-25 16:08:41', '1', '26', '365');
INSERT INTO `userrelease` VALUES ('274', '2019-04-25 16:08:41', '1', '83', '366');
INSERT INTO `userrelease` VALUES ('275', '2019-04-25 16:08:41', '1', '91', '367');
INSERT INTO `userrelease` VALUES ('276', '2019-04-25 16:08:41', '1', '1', '368');
INSERT INTO `userrelease` VALUES ('277', '2019-04-25 16:08:41', '1', '38', '369');
INSERT INTO `userrelease` VALUES ('278', '2019-04-25 16:08:41', '1', '100', '370');
INSERT INTO `userrelease` VALUES ('279', '2019-04-25 16:08:41', '1', '15', '371');
INSERT INTO `userrelease` VALUES ('280', '2019-04-25 16:08:41', '1', '67', '372');
INSERT INTO `userrelease` VALUES ('281', '2019-04-25 16:08:41', '1', '25', '373');
INSERT INTO `userrelease` VALUES ('282', '2019-04-25 16:08:41', '1', '31', '374');
INSERT INTO `userrelease` VALUES ('283', '2019-04-25 16:08:41', '1', '54', '375');
INSERT INTO `userrelease` VALUES ('284', '2019-04-25 16:08:41', '1', '47', '376');
INSERT INTO `userrelease` VALUES ('285', '2019-04-25 16:08:41', '1', '49', '377');
INSERT INTO `userrelease` VALUES ('286', '2019-04-25 16:08:41', '1', '24', '378');
INSERT INTO `userrelease` VALUES ('287', '2019-04-25 16:08:41', '1', '13', '379');
INSERT INTO `userrelease` VALUES ('288', '2019-04-25 16:08:41', '1', '65', '380');
INSERT INTO `userrelease` VALUES ('289', '2019-04-25 16:08:41', '1', '15', '381');
INSERT INTO `userrelease` VALUES ('290', '2019-04-25 16:08:41', '1', '84', '382');
INSERT INTO `userrelease` VALUES ('291', '2019-04-25 16:08:41', '1', '3', '383');
INSERT INTO `userrelease` VALUES ('292', '2019-04-25 16:08:41', '1', '33', '384');
INSERT INTO `userrelease` VALUES ('293', '2019-04-25 16:08:41', '1', '100', '385');
INSERT INTO `userrelease` VALUES ('294', '2019-04-25 16:08:41', '1', '85', '386');
INSERT INTO `userrelease` VALUES ('295', '2019-04-25 16:08:41', '1', '2', '387');
INSERT INTO `userrelease` VALUES ('296', '2019-04-25 16:08:41', '1', '39', '388');
INSERT INTO `userrelease` VALUES ('297', '2019-04-25 16:08:41', '1', '60', '389');
INSERT INTO `userrelease` VALUES ('298', '2019-04-25 16:08:41', '1', '81', '390');
INSERT INTO `userrelease` VALUES ('299', '2019-04-25 16:08:41', '1', '50', '391');
INSERT INTO `userrelease` VALUES ('300', '2019-04-25 16:08:41', '1', '80', '392');
INSERT INTO `userrelease` VALUES ('301', '2019-04-25 16:08:41', '1', '77', '393');
INSERT INTO `userrelease` VALUES ('302', '2019-04-25 16:08:41', '1', '18', '394');
INSERT INTO `userrelease` VALUES ('303', '2019-04-25 16:08:41', '1', '28', '395');
INSERT INTO `userrelease` VALUES ('304', '2019-04-25 16:08:41', '1', '40', '396');
INSERT INTO `userrelease` VALUES ('305', '2019-04-25 16:08:41', '1', '66', '397');
INSERT INTO `userrelease` VALUES ('306', '2019-04-25 16:08:41', '1', '20', '398');
INSERT INTO `userrelease` VALUES ('307', '2019-04-25 16:08:41', '1', '79', '399');
INSERT INTO `userrelease` VALUES ('308', '2019-04-25 16:08:41', '1', '76', '400');
INSERT INTO `userrelease` VALUES ('309', '2019-04-25 16:08:41', '1', '37', '401');
INSERT INTO `userrelease` VALUES ('310', '2019-04-25 16:08:41', '1', '47', '402');
INSERT INTO `userrelease` VALUES ('311', '2019-04-25 16:08:41', '1', '3', '403');
INSERT INTO `userrelease` VALUES ('312', '2019-04-25 16:08:41', '1', '20', '404');
INSERT INTO `userrelease` VALUES ('313', '2019-04-25 16:08:41', '1', '99', '405');
INSERT INTO `userrelease` VALUES ('314', '2019-04-25 16:08:41', '1', '8', '406');
INSERT INTO `userrelease` VALUES ('315', '2019-04-25 16:08:41', '1', '10', '407');
INSERT INTO `userrelease` VALUES ('316', '2019-04-25 16:08:41', '1', '82', '408');
INSERT INTO `userrelease` VALUES ('317', '2019-04-25 16:08:41', '1', '32', '409');
INSERT INTO `userrelease` VALUES ('318', '2019-04-25 16:08:41', '1', '82', '410');
INSERT INTO `userrelease` VALUES ('319', '2019-04-25 16:08:41', '1', '16', '411');
INSERT INTO `userrelease` VALUES ('320', '2019-04-25 16:08:41', '1', '18', '412');
INSERT INTO `userrelease` VALUES ('321', '2019-04-25 16:08:41', '1', '3', '413');
INSERT INTO `userrelease` VALUES ('322', '2019-04-25 16:08:41', '1', '98', '414');
INSERT INTO `userrelease` VALUES ('323', '2019-04-25 16:08:41', '1', '19', '415');
INSERT INTO `userrelease` VALUES ('324', '2019-04-25 16:08:41', '1', '14', '416');
INSERT INTO `userrelease` VALUES ('325', '2019-04-25 16:08:41', '1', '4', '417');
INSERT INTO `userrelease` VALUES ('326', '2019-04-25 16:08:41', '1', '71', '418');
INSERT INTO `userrelease` VALUES ('327', '2019-04-25 16:08:41', '1', '61', '419');
INSERT INTO `userrelease` VALUES ('328', '2019-04-25 16:08:41', '1', '38', '420');
INSERT INTO `userrelease` VALUES ('329', '2019-04-25 16:08:41', '1', '1', '421');
INSERT INTO `userrelease` VALUES ('330', '2019-04-25 16:08:41', '1', '53', '422');
INSERT INTO `userrelease` VALUES ('331', '2019-04-25 16:08:41', '1', '82', '423');
INSERT INTO `userrelease` VALUES ('332', '2019-04-25 16:08:41', '1', '86', '424');
INSERT INTO `userrelease` VALUES ('333', '2019-04-25 16:08:41', '1', '14', '425');
INSERT INTO `userrelease` VALUES ('334', '2019-04-25 16:08:41', '1', '90', '426');
INSERT INTO `userrelease` VALUES ('335', '2019-04-25 16:08:41', '1', '10', '427');
INSERT INTO `userrelease` VALUES ('336', '2019-04-25 16:08:41', '1', '97', '428');
INSERT INTO `userrelease` VALUES ('337', '2019-04-25 16:08:41', '1', '69', '429');
INSERT INTO `userrelease` VALUES ('338', '2019-04-25 16:08:41', '1', '18', '430');
INSERT INTO `userrelease` VALUES ('339', '2019-04-25 16:08:41', '1', '63', '431');
INSERT INTO `userrelease` VALUES ('340', '2019-04-25 16:08:41', '1', '25', '432');
INSERT INTO `userrelease` VALUES ('341', '2019-04-25 16:08:41', '1', '99', '433');
INSERT INTO `userrelease` VALUES ('342', '2019-04-25 16:08:41', '1', '60', '434');
INSERT INTO `userrelease` VALUES ('343', '2019-04-25 16:08:41', '1', '56', '435');
INSERT INTO `userrelease` VALUES ('344', '2019-04-25 16:08:41', '1', '49', '436');
INSERT INTO `userrelease` VALUES ('345', '2019-04-25 16:08:41', '1', '90', '437');
INSERT INTO `userrelease` VALUES ('346', '2019-04-25 16:08:41', '1', '13', '438');
INSERT INTO `userrelease` VALUES ('347', '2019-04-25 16:08:41', '1', '42', '439');
INSERT INTO `userrelease` VALUES ('348', '2019-04-25 16:08:41', '1', '58', '440');
INSERT INTO `userrelease` VALUES ('349', '2019-04-25 16:08:41', '1', '35', '441');
INSERT INTO `userrelease` VALUES ('350', '2019-04-25 16:08:41', '1', '34', '442');
INSERT INTO `userrelease` VALUES ('351', '2019-04-25 16:08:41', '1', '52', '443');
INSERT INTO `userrelease` VALUES ('352', '2019-04-25 16:08:41', '1', '90', '444');
INSERT INTO `userrelease` VALUES ('353', '2019-04-25 16:08:41', '1', '84', '445');
INSERT INTO `userrelease` VALUES ('354', '2019-04-25 16:08:41', '1', '27', '446');
INSERT INTO `userrelease` VALUES ('355', '2019-04-25 16:08:41', '1', '3', '447');
INSERT INTO `userrelease` VALUES ('356', '2019-04-25 16:08:41', '1', '79', '448');
INSERT INTO `userrelease` VALUES ('357', '2019-04-25 16:08:41', '1', '71', '449');
INSERT INTO `userrelease` VALUES ('358', '2019-04-25 16:08:41', '1', '26', '450');
INSERT INTO `userrelease` VALUES ('359', '2019-04-25 16:08:41', '1', '71', '451');
INSERT INTO `userrelease` VALUES ('360', '2019-04-25 16:08:41', '1', '88', '452');
INSERT INTO `userrelease` VALUES ('361', '2019-04-25 16:08:41', '1', '13', '453');
INSERT INTO `userrelease` VALUES ('362', '2019-04-25 16:08:41', '1', '26', '454');
INSERT INTO `userrelease` VALUES ('363', '2019-04-25 16:08:41', '1', '85', '455');
INSERT INTO `userrelease` VALUES ('364', '2019-04-25 16:08:41', '1', '47', '456');
INSERT INTO `userrelease` VALUES ('365', '2019-04-25 16:08:41', '1', '27', '457');
INSERT INTO `userrelease` VALUES ('366', '2019-04-25 16:08:41', '1', '4', '458');
INSERT INTO `userrelease` VALUES ('367', '2019-04-25 16:08:41', '1', '22', '459');
INSERT INTO `userrelease` VALUES ('368', '2019-04-25 16:08:41', '1', '62', '460');
INSERT INTO `userrelease` VALUES ('369', '2019-04-25 16:08:41', '1', '87', '461');
INSERT INTO `userrelease` VALUES ('370', '2019-04-25 16:08:41', '1', '5', '462');
INSERT INTO `userrelease` VALUES ('371', '2019-04-25 16:08:41', '1', '1', '463');
INSERT INTO `userrelease` VALUES ('372', '2019-04-25 16:08:41', '1', '73', '464');
INSERT INTO `userrelease` VALUES ('373', '2019-04-25 16:08:41', '1', '11', '465');
INSERT INTO `userrelease` VALUES ('374', '2019-04-25 16:08:41', '1', '63', '466');
INSERT INTO `userrelease` VALUES ('375', '2019-04-25 16:08:41', '1', '81', '467');
INSERT INTO `userrelease` VALUES ('376', '2019-04-25 16:08:41', '1', '38', '468');
INSERT INTO `userrelease` VALUES ('377', '2019-04-25 16:08:41', '1', '18', '469');
INSERT INTO `userrelease` VALUES ('378', '2019-04-25 16:08:41', '1', '66', '470');
INSERT INTO `userrelease` VALUES ('379', '2019-04-25 16:08:41', '1', '39', '471');
INSERT INTO `userrelease` VALUES ('380', '2019-04-25 16:08:41', '1', '87', '472');
INSERT INTO `userrelease` VALUES ('381', '2019-04-25 16:08:41', '1', '4', '473');
INSERT INTO `userrelease` VALUES ('382', '2019-04-25 16:08:41', '1', '62', '474');
INSERT INTO `userrelease` VALUES ('383', '2019-04-25 16:08:41', '1', '11', '475');
INSERT INTO `userrelease` VALUES ('384', '2019-04-25 16:08:41', '1', '20', '476');
INSERT INTO `userrelease` VALUES ('385', '2019-04-25 16:08:41', '1', '30', '477');
INSERT INTO `userrelease` VALUES ('386', '2019-04-25 16:08:41', '1', '98', '478');
INSERT INTO `userrelease` VALUES ('387', '2019-04-25 16:08:41', '1', '70', '479');
INSERT INTO `userrelease` VALUES ('388', '2019-04-25 16:08:41', '1', '9', '480');
INSERT INTO `userrelease` VALUES ('389', '2019-04-25 16:08:41', '1', '82', '481');
INSERT INTO `userrelease` VALUES ('390', '2019-04-25 16:08:41', '1', '61', '482');
INSERT INTO `userrelease` VALUES ('391', '2019-04-25 16:08:41', '1', '87', '483');
INSERT INTO `userrelease` VALUES ('392', '2019-04-25 16:08:41', '1', '43', '484');
INSERT INTO `userrelease` VALUES ('393', '2019-04-25 16:08:41', '1', '57', '485');
INSERT INTO `userrelease` VALUES ('394', '2019-04-25 16:08:41', '1', '58', '486');
INSERT INTO `userrelease` VALUES ('395', '2019-04-25 16:08:41', '1', '55', '487');
INSERT INTO `userrelease` VALUES ('396', '2019-04-25 16:08:41', '1', '84', '488');
INSERT INTO `userrelease` VALUES ('397', '2019-04-25 16:08:41', '1', '67', '489');
INSERT INTO `userrelease` VALUES ('398', '2019-04-25 16:08:41', '1', '22', '490');
INSERT INTO `userrelease` VALUES ('399', '2019-04-25 16:08:41', '1', '64', '491');
INSERT INTO `userrelease` VALUES ('400', '2019-04-25 16:08:41', '1', '85', '492');
INSERT INTO `userrelease` VALUES ('401', '2019-04-25 16:08:41', '1', '11', '493');
INSERT INTO `userrelease` VALUES ('402', '2019-04-25 16:08:41', '1', '57', '494');
INSERT INTO `userrelease` VALUES ('403', '2019-04-25 16:08:41', '1', '60', '495');
INSERT INTO `userrelease` VALUES ('404', '2019-04-25 16:08:41', '1', '100', '496');
INSERT INTO `userrelease` VALUES ('405', '2019-04-25 16:08:41', '1', '65', '497');
INSERT INTO `userrelease` VALUES ('406', '2019-04-25 16:08:41', '1', '48', '498');
INSERT INTO `userrelease` VALUES ('407', '2019-04-25 16:08:41', '1', '88', '499');
INSERT INTO `userrelease` VALUES ('408', '2019-04-25 16:08:41', '1', '67', '500');
INSERT INTO `userrelease` VALUES ('409', '2019-04-25 16:08:41', '1', '57', '501');
INSERT INTO `userrelease` VALUES ('410', '2019-04-25 16:08:41', '1', '67', '502');
INSERT INTO `userrelease` VALUES ('411', '2019-04-25 16:08:41', '1', '100', '503');
INSERT INTO `userrelease` VALUES ('412', '2019-04-25 16:08:41', '1', '18', '504');
INSERT INTO `userrelease` VALUES ('413', '2019-04-25 16:08:41', '1', '94', '505');
INSERT INTO `userrelease` VALUES ('414', '2019-04-25 16:08:41', '1', '16', '506');
INSERT INTO `userrelease` VALUES ('415', '2019-04-25 16:08:41', '1', '79', '507');
INSERT INTO `userrelease` VALUES ('416', '2019-04-25 16:08:41', '1', '18', '508');
INSERT INTO `userrelease` VALUES ('417', '2019-04-25 16:08:41', '1', '52', '509');
INSERT INTO `userrelease` VALUES ('418', '2019-04-25 16:08:41', '1', '69', '510');
INSERT INTO `userrelease` VALUES ('419', '2019-04-25 16:08:41', '1', '56', '511');
INSERT INTO `userrelease` VALUES ('420', '2019-04-25 16:08:41', '1', '51', '512');
INSERT INTO `userrelease` VALUES ('421', '2019-04-25 16:08:41', '1', '54', '513');
INSERT INTO `userrelease` VALUES ('422', '2019-04-25 16:08:41', '1', '20', '514');
INSERT INTO `userrelease` VALUES ('423', '2019-04-25 16:08:41', '1', '79', '515');
INSERT INTO `userrelease` VALUES ('424', '2019-04-25 16:08:41', '1', '89', '516');
INSERT INTO `userrelease` VALUES ('425', '2019-04-25 16:08:41', '1', '25', '517');
INSERT INTO `userrelease` VALUES ('426', '2019-04-25 16:08:41', '1', '67', '518');
INSERT INTO `userrelease` VALUES ('427', '2019-04-25 16:08:41', '1', '70', '519');
INSERT INTO `userrelease` VALUES ('428', '2019-04-25 16:08:41', '1', '56', '520');
INSERT INTO `userrelease` VALUES ('429', '2019-04-25 16:08:41', '1', '22', '521');
INSERT INTO `userrelease` VALUES ('430', '2019-04-25 16:08:41', '1', '75', '522');
INSERT INTO `userrelease` VALUES ('431', '2019-04-25 16:08:41', '1', '88', '523');
INSERT INTO `userrelease` VALUES ('432', '2019-04-25 16:08:41', '1', '93', '524');
INSERT INTO `userrelease` VALUES ('433', '2019-04-25 16:08:41', '1', '54', '525');
INSERT INTO `userrelease` VALUES ('434', '2019-04-25 16:08:41', '1', '29', '526');
INSERT INTO `userrelease` VALUES ('435', '2019-04-25 16:08:41', '1', '81', '527');
INSERT INTO `userrelease` VALUES ('436', '2019-04-25 16:08:41', '1', '25', '528');
INSERT INTO `userrelease` VALUES ('437', '2019-04-25 16:08:41', '1', '85', '529');
INSERT INTO `userrelease` VALUES ('438', '2019-04-25 16:08:41', '1', '48', '530');
INSERT INTO `userrelease` VALUES ('439', '2019-04-25 16:08:41', '1', '64', '531');
INSERT INTO `userrelease` VALUES ('440', '2019-04-25 16:08:41', '1', '36', '532');
INSERT INTO `userrelease` VALUES ('441', '2019-04-25 16:08:41', '1', '89', '533');
INSERT INTO `userrelease` VALUES ('442', '2019-04-25 16:08:41', '1', '83', '534');
INSERT INTO `userrelease` VALUES ('443', '2019-04-25 16:08:41', '1', '85', '535');
INSERT INTO `userrelease` VALUES ('444', '2019-04-25 16:08:41', '1', '7', '536');
INSERT INTO `userrelease` VALUES ('445', '2019-04-25 16:08:41', '1', '49', '537');
INSERT INTO `userrelease` VALUES ('446', '2019-04-25 16:08:41', '1', '44', '538');
INSERT INTO `userrelease` VALUES ('447', '2019-04-25 16:08:41', '1', '62', '539');
INSERT INTO `userrelease` VALUES ('448', '2019-04-25 16:08:41', '1', '11', '540');
INSERT INTO `userrelease` VALUES ('449', '2019-04-25 16:08:41', '1', '98', '541');
INSERT INTO `userrelease` VALUES ('450', '2019-04-25 16:08:41', '1', '82', '542');
INSERT INTO `userrelease` VALUES ('451', '2019-04-25 16:08:41', '1', '46', '543');
INSERT INTO `userrelease` VALUES ('452', '2019-04-25 16:08:41', '1', '6', '544');
INSERT INTO `userrelease` VALUES ('453', '2019-04-25 16:08:41', '1', '74', '545');
INSERT INTO `userrelease` VALUES ('454', '2019-04-25 16:08:41', '1', '59', '546');
INSERT INTO `userrelease` VALUES ('455', '2019-04-25 16:08:41', '1', '90', '547');
INSERT INTO `userrelease` VALUES ('456', '2019-04-25 16:08:41', '1', '36', '548');
INSERT INTO `userrelease` VALUES ('457', '2019-04-25 16:08:41', '1', '68', '549');
INSERT INTO `userrelease` VALUES ('458', '2019-04-25 16:08:41', '1', '53', '550');
INSERT INTO `userrelease` VALUES ('459', '2019-04-25 16:08:41', '1', '49', '551');
INSERT INTO `userrelease` VALUES ('460', '2019-04-25 16:08:41', '1', '76', '552');
INSERT INTO `userrelease` VALUES ('461', '2019-04-25 16:08:41', '1', '100', '553');
INSERT INTO `userrelease` VALUES ('462', '2019-04-25 16:08:41', '1', '71', '554');
INSERT INTO `userrelease` VALUES ('463', '2019-04-25 16:08:41', '1', '77', '555');
INSERT INTO `userrelease` VALUES ('464', '2019-04-25 16:08:41', '1', '26', '556');
INSERT INTO `userrelease` VALUES ('465', '2019-04-25 16:08:41', '1', '32', '557');
INSERT INTO `userrelease` VALUES ('466', '2019-04-25 16:08:41', '1', '30', '558');
INSERT INTO `userrelease` VALUES ('467', '2019-04-25 16:08:41', '1', '39', '559');
INSERT INTO `userrelease` VALUES ('468', '2019-04-25 16:08:41', '1', '48', '560');
INSERT INTO `userrelease` VALUES ('469', '2019-04-25 16:08:41', '1', '72', '561');
INSERT INTO `userrelease` VALUES ('470', '2019-04-25 16:08:41', '1', '78', '562');
INSERT INTO `userrelease` VALUES ('471', '2019-04-25 16:08:41', '1', '92', '563');
INSERT INTO `userrelease` VALUES ('472', '2019-04-25 16:08:41', '1', '49', '564');
INSERT INTO `userrelease` VALUES ('473', '2019-04-25 16:08:41', '1', '38', '565');
INSERT INTO `userrelease` VALUES ('474', '2019-04-25 16:08:41', '1', '99', '566');
INSERT INTO `userrelease` VALUES ('475', '2019-04-25 16:08:41', '1', '55', '567');
INSERT INTO `userrelease` VALUES ('476', '2019-04-25 16:08:41', '1', '33', '568');
INSERT INTO `userrelease` VALUES ('477', '2019-04-25 16:08:41', '1', '58', '569');
INSERT INTO `userrelease` VALUES ('478', '2019-04-25 16:08:41', '1', '12', '570');
INSERT INTO `userrelease` VALUES ('479', '2019-04-25 16:08:41', '1', '41', '571');
INSERT INTO `userrelease` VALUES ('480', '2019-04-25 16:08:41', '1', '39', '572');
INSERT INTO `userrelease` VALUES ('481', '2019-04-25 16:08:41', '1', '22', '573');
INSERT INTO `userrelease` VALUES ('482', '2019-04-25 16:08:41', '1', '26', '574');
INSERT INTO `userrelease` VALUES ('483', '2019-04-25 16:08:41', '1', '20', '575');
INSERT INTO `userrelease` VALUES ('484', '2019-04-25 16:08:41', '1', '5', '576');
INSERT INTO `userrelease` VALUES ('485', '2019-04-25 16:08:41', '1', '50', '577');
INSERT INTO `userrelease` VALUES ('486', '2019-04-25 16:08:41', '1', '51', '578');
INSERT INTO `userrelease` VALUES ('487', '2019-04-25 16:08:41', '1', '83', '579');
INSERT INTO `userrelease` VALUES ('488', '2019-04-25 16:08:41', '1', '58', '580');
INSERT INTO `userrelease` VALUES ('489', '2019-04-25 16:08:41', '1', '47', '581');
INSERT INTO `userrelease` VALUES ('490', '2019-04-25 16:08:41', '1', '98', '582');
INSERT INTO `userrelease` VALUES ('491', '2019-04-25 16:08:41', '1', '41', '583');
INSERT INTO `userrelease` VALUES ('492', '2019-04-25 16:08:41', '1', '99', '584');
INSERT INTO `userrelease` VALUES ('493', '2019-04-25 16:08:41', '1', '70', '585');
INSERT INTO `userrelease` VALUES ('494', '2019-04-25 16:08:41', '1', '47', '586');
INSERT INTO `userrelease` VALUES ('495', '2019-04-25 16:08:41', '1', '85', '587');
INSERT INTO `userrelease` VALUES ('496', '2019-04-25 16:08:41', '1', '88', '588');
INSERT INTO `userrelease` VALUES ('497', '2019-04-25 16:08:41', '1', '4', '589');
INSERT INTO `userrelease` VALUES ('498', '2019-04-25 16:08:41', '1', '64', '590');
INSERT INTO `userrelease` VALUES ('499', '2019-04-25 16:08:41', '1', '15', '591');
INSERT INTO `userrelease` VALUES ('500', '2019-04-25 16:08:41', '1', '59', '592');
INSERT INTO `userrelease` VALUES ('501', '2019-04-25 16:08:41', '1', '88', '593');
INSERT INTO `userrelease` VALUES ('502', '2019-04-25 16:08:41', '1', '43', '594');
INSERT INTO `userrelease` VALUES ('503', '2019-04-25 16:08:41', '1', '50', '595');
INSERT INTO `userrelease` VALUES ('504', '2019-04-25 16:08:41', '1', '70', '596');
INSERT INTO `userrelease` VALUES ('505', '2019-04-25 16:08:41', '1', '70', '597');
INSERT INTO `userrelease` VALUES ('506', '2019-04-25 16:08:41', '1', '19', '598');
INSERT INTO `userrelease` VALUES ('507', '2019-04-25 16:08:41', '1', '70', '599');
INSERT INTO `userrelease` VALUES ('508', '2019-04-25 16:08:41', '1', '89', '600');
INSERT INTO `userrelease` VALUES ('509', '2019-04-25 16:08:41', '1', '59', '601');
INSERT INTO `userrelease` VALUES ('510', '2019-04-25 16:08:41', '1', '26', '602');
INSERT INTO `userrelease` VALUES ('511', '2019-04-25 16:08:41', '1', '76', '603');
INSERT INTO `userrelease` VALUES ('512', '2019-04-25 16:08:41', '1', '26', '604');
INSERT INTO `userrelease` VALUES ('513', '2019-04-25 16:08:41', '1', '90', '605');
INSERT INTO `userrelease` VALUES ('514', '2019-04-25 16:08:41', '1', '93', '606');
INSERT INTO `userrelease` VALUES ('515', '2019-04-25 16:08:41', '1', '36', '607');
INSERT INTO `userrelease` VALUES ('516', '2019-04-25 16:08:41', '1', '33', '608');
INSERT INTO `userrelease` VALUES ('517', '2019-04-25 16:08:41', '1', '6', '609');
INSERT INTO `userrelease` VALUES ('518', '2019-04-25 16:08:41', '1', '75', '610');
INSERT INTO `userrelease` VALUES ('519', '2019-04-25 16:08:41', '1', '88', '611');
INSERT INTO `userrelease` VALUES ('520', '2019-04-25 16:08:41', '1', '86', '612');
INSERT INTO `userrelease` VALUES ('521', '2019-04-25 16:08:41', '1', '66', '613');
INSERT INTO `userrelease` VALUES ('522', '2019-04-25 16:08:41', '1', '72', '614');
INSERT INTO `userrelease` VALUES ('523', '2019-04-25 16:08:41', '1', '64', '615');
INSERT INTO `userrelease` VALUES ('524', '2019-04-25 16:08:41', '1', '2', '616');
INSERT INTO `userrelease` VALUES ('525', '2019-04-25 16:08:41', '1', '6', '617');
INSERT INTO `userrelease` VALUES ('526', '2019-04-25 16:08:41', '1', '58', '618');
INSERT INTO `userrelease` VALUES ('527', '2019-04-25 16:08:41', '1', '82', '619');
INSERT INTO `userrelease` VALUES ('528', '2019-04-25 16:08:41', '1', '75', '620');
INSERT INTO `userrelease` VALUES ('529', '2019-04-25 16:08:41', '1', '79', '621');
INSERT INTO `userrelease` VALUES ('530', '2019-04-25 16:08:41', '1', '31', '622');
INSERT INTO `userrelease` VALUES ('531', '2019-04-25 16:08:41', '1', '76', '623');
INSERT INTO `userrelease` VALUES ('532', '2019-04-25 16:08:41', '1', '75', '624');
INSERT INTO `userrelease` VALUES ('533', '2019-04-25 16:08:41', '1', '87', '625');
INSERT INTO `userrelease` VALUES ('534', '2019-04-25 16:08:41', '1', '21', '626');
INSERT INTO `userrelease` VALUES ('535', '2019-04-25 16:08:41', '1', '64', '627');
INSERT INTO `userrelease` VALUES ('536', '2019-04-25 16:08:41', '1', '91', '628');
INSERT INTO `userrelease` VALUES ('537', '2019-04-25 16:08:41', '1', '71', '629');
INSERT INTO `userrelease` VALUES ('538', '2019-04-25 16:08:41', '1', '75', '630');
INSERT INTO `userrelease` VALUES ('539', '2019-04-25 16:08:41', '1', '88', '631');
INSERT INTO `userrelease` VALUES ('540', '2019-04-25 16:08:41', '1', '30', '632');
INSERT INTO `userrelease` VALUES ('541', '2019-04-25 16:08:41', '1', '90', '633');
INSERT INTO `userrelease` VALUES ('542', '2019-04-25 16:08:41', '1', '65', '634');
INSERT INTO `userrelease` VALUES ('543', '2019-04-25 16:08:41', '1', '51', '635');
INSERT INTO `userrelease` VALUES ('544', '2019-04-25 16:08:41', '1', '88', '636');
INSERT INTO `userrelease` VALUES ('545', '2019-04-25 16:08:41', '1', '91', '637');
INSERT INTO `userrelease` VALUES ('546', '2019-04-25 16:08:41', '1', '75', '638');
INSERT INTO `userrelease` VALUES ('547', '2019-04-25 16:08:41', '1', '17', '639');
INSERT INTO `userrelease` VALUES ('548', '2019-04-25 16:08:41', '1', '62', '640');
INSERT INTO `userrelease` VALUES ('549', '2019-04-25 16:08:41', '1', '22', '641');
INSERT INTO `userrelease` VALUES ('550', '2019-04-25 16:08:41', '1', '95', '642');
INSERT INTO `userrelease` VALUES ('551', '2019-04-25 16:08:41', '1', '79', '643');
INSERT INTO `userrelease` VALUES ('552', '2019-04-25 16:08:41', '1', '71', '644');
INSERT INTO `userrelease` VALUES ('553', '2019-04-25 16:08:41', '1', '88', '645');
INSERT INTO `userrelease` VALUES ('554', '2019-04-25 16:08:41', '1', '77', '646');
INSERT INTO `userrelease` VALUES ('555', '2019-04-25 16:08:41', '1', '69', '647');
INSERT INTO `userrelease` VALUES ('556', '2019-04-25 16:08:41', '1', '65', '648');
INSERT INTO `userrelease` VALUES ('557', '2019-04-25 16:08:41', '1', '50', '649');
INSERT INTO `userrelease` VALUES ('558', '2019-04-25 16:08:41', '1', '96', '650');
INSERT INTO `userrelease` VALUES ('559', '2019-04-25 16:08:41', '1', '78', '651');
INSERT INTO `userrelease` VALUES ('560', '2019-04-25 16:08:41', '1', '19', '652');
INSERT INTO `userrelease` VALUES ('561', '2019-04-25 16:08:41', '1', '33', '653');
INSERT INTO `userrelease` VALUES ('562', '2019-04-25 16:08:41', '1', '34', '654');
INSERT INTO `userrelease` VALUES ('563', '2019-04-25 16:08:41', '1', '10', '655');
INSERT INTO `userrelease` VALUES ('564', '2019-04-25 16:08:41', '1', '87', '656');
INSERT INTO `userrelease` VALUES ('565', '2019-04-25 16:08:41', '1', '8', '657');
INSERT INTO `userrelease` VALUES ('566', '2019-04-25 16:08:41', '1', '50', '658');
INSERT INTO `userrelease` VALUES ('567', '2019-04-25 16:08:41', '1', '27', '659');
INSERT INTO `userrelease` VALUES ('568', '2019-04-25 16:08:41', '1', '32', '660');
INSERT INTO `userrelease` VALUES ('569', '2019-04-25 16:08:41', '1', '77', '661');
INSERT INTO `userrelease` VALUES ('570', '2019-04-25 16:08:41', '1', '27', '662');
INSERT INTO `userrelease` VALUES ('571', '2019-04-25 16:08:41', '1', '15', '663');
INSERT INTO `userrelease` VALUES ('572', '2019-04-25 16:08:41', '1', '25', '664');
INSERT INTO `userrelease` VALUES ('573', '2019-04-25 16:08:41', '1', '74', '665');
INSERT INTO `userrelease` VALUES ('574', '2019-04-25 16:08:41', '1', '29', '666');
INSERT INTO `userrelease` VALUES ('575', '2019-04-25 16:08:41', '1', '94', '667');
INSERT INTO `userrelease` VALUES ('576', '2019-04-25 16:08:41', '1', '81', '668');
INSERT INTO `userrelease` VALUES ('577', '2019-04-25 16:08:41', '1', '24', '669');
INSERT INTO `userrelease` VALUES ('578', '2019-04-25 16:08:41', '1', '67', '670');
INSERT INTO `userrelease` VALUES ('579', '2019-04-25 16:08:41', '1', '8', '671');
INSERT INTO `userrelease` VALUES ('580', '2019-04-25 16:08:41', '1', '47', '672');
INSERT INTO `userrelease` VALUES ('581', '2019-04-25 16:08:41', '1', '95', '673');
INSERT INTO `userrelease` VALUES ('582', '2019-04-25 16:08:41', '1', '60', '674');
INSERT INTO `userrelease` VALUES ('583', '2019-04-25 16:08:41', '1', '49', '675');
INSERT INTO `userrelease` VALUES ('584', '2019-04-25 16:08:41', '1', '87', '676');
INSERT INTO `userrelease` VALUES ('585', '2019-04-25 16:08:41', '1', '86', '677');
INSERT INTO `userrelease` VALUES ('586', '2019-04-25 16:08:41', '1', '70', '678');
INSERT INTO `userrelease` VALUES ('587', '2019-04-25 16:08:41', '1', '97', '679');
INSERT INTO `userrelease` VALUES ('588', '2019-04-25 16:08:41', '1', '27', '680');
INSERT INTO `userrelease` VALUES ('589', '2019-04-25 16:08:41', '1', '61', '681');
INSERT INTO `userrelease` VALUES ('590', '2019-04-25 16:08:41', '1', '26', '682');
INSERT INTO `userrelease` VALUES ('591', '2019-04-25 16:08:41', '1', '71', '683');
INSERT INTO `userrelease` VALUES ('592', '2019-04-25 16:08:41', '1', '72', '684');
INSERT INTO `userrelease` VALUES ('593', '2019-04-25 16:08:41', '1', '85', '685');
INSERT INTO `userrelease` VALUES ('594', '2019-04-25 16:08:41', '1', '2', '686');
INSERT INTO `userrelease` VALUES ('595', '2019-04-25 16:08:41', '1', '14', '687');
INSERT INTO `userrelease` VALUES ('596', '2019-04-25 16:08:41', '1', '96', '688');
INSERT INTO `userrelease` VALUES ('597', '2019-04-25 16:08:41', '1', '3', '689');
INSERT INTO `userrelease` VALUES ('598', '2019-04-25 16:08:41', '1', '13', '690');
INSERT INTO `userrelease` VALUES ('599', '2019-04-25 16:08:41', '1', '20', '691');
INSERT INTO `userrelease` VALUES ('600', '2019-04-25 16:08:41', '1', '33', '692');
INSERT INTO `userrelease` VALUES ('601', '2019-04-25 16:08:41', '1', '14', '693');
INSERT INTO `userrelease` VALUES ('602', '2019-04-25 16:08:41', '1', '30', '694');
INSERT INTO `userrelease` VALUES ('603', '2019-04-25 16:08:41', '1', '7', '695');
INSERT INTO `userrelease` VALUES ('604', '2019-04-25 16:08:41', '1', '13', '696');
INSERT INTO `userrelease` VALUES ('605', '2019-04-25 16:08:41', '1', '11', '697');
INSERT INTO `userrelease` VALUES ('606', '2019-04-25 16:08:41', '1', '3', '698');
INSERT INTO `userrelease` VALUES ('607', '2019-04-25 16:08:41', '1', '49', '699');
INSERT INTO `userrelease` VALUES ('608', '2019-04-25 16:08:41', '1', '33', '700');
INSERT INTO `userrelease` VALUES ('609', '2019-04-25 16:08:41', '1', '82', '701');
INSERT INTO `userrelease` VALUES ('610', '2019-04-25 16:08:41', '1', '58', '702');
INSERT INTO `userrelease` VALUES ('611', '2019-04-25 16:08:41', '1', '63', '703');
INSERT INTO `userrelease` VALUES ('612', '2019-04-25 16:08:41', '1', '60', '704');
INSERT INTO `userrelease` VALUES ('613', '2019-04-25 16:08:41', '1', '52', '705');
INSERT INTO `userrelease` VALUES ('614', '2019-04-25 16:08:41', '1', '89', '706');
INSERT INTO `userrelease` VALUES ('615', '2019-04-25 16:08:41', '1', '82', '707');
INSERT INTO `userrelease` VALUES ('616', '2019-04-25 16:08:41', '1', '36', '708');
INSERT INTO `userrelease` VALUES ('617', '2019-04-25 16:08:41', '1', '36', '709');
INSERT INTO `userrelease` VALUES ('618', '2019-04-25 16:08:41', '1', '94', '710');
INSERT INTO `userrelease` VALUES ('619', '2019-04-25 16:08:41', '1', '92', '711');
INSERT INTO `userrelease` VALUES ('620', '2019-04-25 16:08:41', '1', '84', '712');
INSERT INTO `userrelease` VALUES ('621', '2019-04-25 16:08:41', '1', '87', '713');
INSERT INTO `userrelease` VALUES ('622', '2019-04-25 16:08:41', '1', '99', '714');
INSERT INTO `userrelease` VALUES ('623', '2019-04-25 16:08:41', '1', '14', '715');
INSERT INTO `userrelease` VALUES ('624', '2019-04-25 16:08:41', '1', '38', '716');
INSERT INTO `userrelease` VALUES ('625', '2019-04-25 16:08:41', '1', '72', '717');
INSERT INTO `userrelease` VALUES ('626', '2019-04-25 16:08:41', '1', '23', '718');
INSERT INTO `userrelease` VALUES ('627', '2019-04-25 16:08:41', '1', '55', '719');
INSERT INTO `userrelease` VALUES ('628', '2019-04-25 16:08:41', '1', '85', '720');
INSERT INTO `userrelease` VALUES ('629', '2019-04-25 16:08:41', '1', '72', '721');
INSERT INTO `userrelease` VALUES ('630', '2019-04-25 16:08:41', '1', '51', '722');
INSERT INTO `userrelease` VALUES ('631', '2019-04-25 16:08:41', '1', '69', '723');
INSERT INTO `userrelease` VALUES ('632', '2019-04-25 16:08:41', '1', '90', '724');
INSERT INTO `userrelease` VALUES ('633', '2019-04-25 16:08:41', '1', '55', '725');
INSERT INTO `userrelease` VALUES ('634', '2019-04-25 16:08:41', '1', '1', '726');
INSERT INTO `userrelease` VALUES ('635', '2019-04-25 16:08:41', '1', '15', '727');
INSERT INTO `userrelease` VALUES ('636', '2019-04-25 16:08:41', '1', '7', '728');
INSERT INTO `userrelease` VALUES ('637', '2019-04-25 16:08:41', '1', '41', '729');
INSERT INTO `userrelease` VALUES ('638', '2019-04-25 16:08:41', '1', '78', '730');
INSERT INTO `userrelease` VALUES ('639', '2019-04-25 16:08:41', '1', '51', '731');
INSERT INTO `userrelease` VALUES ('640', '2019-04-25 16:08:41', '1', '12', '732');
INSERT INTO `userrelease` VALUES ('641', '2019-04-25 16:08:41', '1', '29', '733');
INSERT INTO `userrelease` VALUES ('642', '2019-04-25 16:08:41', '1', '84', '734');
INSERT INTO `userrelease` VALUES ('643', '2019-04-25 16:08:41', '1', '41', '735');
INSERT INTO `userrelease` VALUES ('644', '2019-04-25 16:08:41', '1', '86', '736');
INSERT INTO `userrelease` VALUES ('645', '2019-04-25 16:08:41', '1', '80', '737');
INSERT INTO `userrelease` VALUES ('646', '2019-04-25 16:08:41', '1', '90', '738');
INSERT INTO `userrelease` VALUES ('647', '2019-04-25 16:08:41', '1', '50', '739');
INSERT INTO `userrelease` VALUES ('648', '2019-04-25 16:08:41', '1', '80', '740');
INSERT INTO `userrelease` VALUES ('649', '2019-04-25 16:08:41', '1', '25', '741');
INSERT INTO `userrelease` VALUES ('650', '2019-04-25 16:08:41', '1', '36', '742');
INSERT INTO `userrelease` VALUES ('651', '2019-04-25 16:08:41', '1', '12', '743');
INSERT INTO `userrelease` VALUES ('652', '2019-04-25 16:08:41', '1', '45', '744');
INSERT INTO `userrelease` VALUES ('653', '2019-04-25 16:08:41', '1', '80', '745');
INSERT INTO `userrelease` VALUES ('654', '2019-04-25 16:08:41', '1', '43', '746');
INSERT INTO `userrelease` VALUES ('655', '2019-04-25 16:08:41', '1', '19', '747');
INSERT INTO `userrelease` VALUES ('656', '2019-04-25 16:08:41', '1', '65', '748');
INSERT INTO `userrelease` VALUES ('657', '2019-04-25 16:08:41', '1', '21', '749');
INSERT INTO `userrelease` VALUES ('658', '2019-04-25 16:08:41', '1', '69', '750');
INSERT INTO `userrelease` VALUES ('659', '2019-04-25 16:08:41', '1', '66', '751');
INSERT INTO `userrelease` VALUES ('660', '2019-04-25 16:08:41', '1', '71', '752');
INSERT INTO `userrelease` VALUES ('661', '2019-04-25 16:08:41', '1', '56', '753');
INSERT INTO `userrelease` VALUES ('662', '2019-04-25 16:08:41', '1', '35', '754');
INSERT INTO `userrelease` VALUES ('663', '2019-04-25 16:08:41', '1', '35', '755');
INSERT INTO `userrelease` VALUES ('664', '2019-04-25 16:08:41', '1', '44', '756');
INSERT INTO `userrelease` VALUES ('665', '2019-04-25 16:08:41', '1', '11', '757');
INSERT INTO `userrelease` VALUES ('666', '2019-04-25 16:08:41', '1', '84', '758');
INSERT INTO `userrelease` VALUES ('667', '2019-04-25 16:08:41', '1', '43', '759');
INSERT INTO `userrelease` VALUES ('668', '2019-04-25 16:08:41', '1', '2', '760');
INSERT INTO `userrelease` VALUES ('669', '2019-04-25 16:08:41', '1', '80', '761');
INSERT INTO `userrelease` VALUES ('670', '2019-04-25 16:08:41', '1', '42', '762');
INSERT INTO `userrelease` VALUES ('671', '2019-04-25 16:08:41', '1', '90', '763');
INSERT INTO `userrelease` VALUES ('672', '2019-04-25 16:08:41', '1', '30', '764');
INSERT INTO `userrelease` VALUES ('673', '2019-04-25 16:08:41', '1', '4', '765');
INSERT INTO `userrelease` VALUES ('674', '2019-04-25 16:08:41', '1', '57', '766');
INSERT INTO `userrelease` VALUES ('675', '2019-04-25 16:08:41', '1', '27', '767');
INSERT INTO `userrelease` VALUES ('676', '2019-04-25 16:08:41', '1', '81', '768');
INSERT INTO `userrelease` VALUES ('677', '2019-04-25 16:08:41', '1', '81', '769');
INSERT INTO `userrelease` VALUES ('678', '2019-04-25 16:08:41', '1', '7', '770');
INSERT INTO `userrelease` VALUES ('679', '2019-04-25 16:08:41', '1', '73', '771');
INSERT INTO `userrelease` VALUES ('680', '2019-04-25 16:08:41', '1', '50', '772');
INSERT INTO `userrelease` VALUES ('681', '2019-04-25 16:08:41', '1', '66', '773');
INSERT INTO `userrelease` VALUES ('682', '2019-04-25 16:08:41', '1', '35', '774');
INSERT INTO `userrelease` VALUES ('683', '2019-04-25 16:08:41', '1', '27', '775');
INSERT INTO `userrelease` VALUES ('684', '2019-04-25 16:08:41', '1', '86', '776');
INSERT INTO `userrelease` VALUES ('685', '2019-04-25 16:08:41', '1', '28', '777');
INSERT INTO `userrelease` VALUES ('686', '2019-04-25 16:08:41', '1', '30', '778');
INSERT INTO `userrelease` VALUES ('687', '2019-04-25 16:08:41', '1', '90', '779');
INSERT INTO `userrelease` VALUES ('688', '2019-04-25 16:08:41', '1', '65', '780');
INSERT INTO `userrelease` VALUES ('689', '2019-04-25 16:08:41', '1', '38', '781');
INSERT INTO `userrelease` VALUES ('690', '2019-04-25 16:08:41', '1', '60', '782');
INSERT INTO `userrelease` VALUES ('691', '2019-04-25 16:08:41', '1', '66', '783');
INSERT INTO `userrelease` VALUES ('692', '2019-04-25 16:08:41', '1', '89', '784');
INSERT INTO `userrelease` VALUES ('693', '2019-04-25 16:08:41', '1', '53', '785');
INSERT INTO `userrelease` VALUES ('694', '2019-04-25 16:08:41', '1', '25', '786');
INSERT INTO `userrelease` VALUES ('695', '2019-04-25 16:08:41', '1', '82', '787');
INSERT INTO `userrelease` VALUES ('696', '2019-04-25 16:08:41', '1', '37', '788');
INSERT INTO `userrelease` VALUES ('697', '2019-04-25 16:08:41', '1', '28', '789');
INSERT INTO `userrelease` VALUES ('698', '2019-04-25 16:08:41', '1', '67', '790');
INSERT INTO `userrelease` VALUES ('699', '2019-04-25 16:08:41', '1', '48', '791');
INSERT INTO `userrelease` VALUES ('700', '2019-04-25 16:08:41', '1', '75', '792');
INSERT INTO `userrelease` VALUES ('701', '2019-04-25 16:08:41', '1', '25', '793');
INSERT INTO `userrelease` VALUES ('702', '2019-04-25 16:08:41', '1', '20', '794');
INSERT INTO `userrelease` VALUES ('703', '2019-04-25 16:08:41', '1', '84', '795');
INSERT INTO `userrelease` VALUES ('704', '2019-04-25 16:08:41', '1', '87', '796');
INSERT INTO `userrelease` VALUES ('705', '2019-04-25 16:08:41', '1', '32', '797');
INSERT INTO `userrelease` VALUES ('706', '2019-04-25 16:08:41', '1', '8', '798');
INSERT INTO `userrelease` VALUES ('707', '2019-04-25 16:08:41', '1', '24', '799');
INSERT INTO `userrelease` VALUES ('708', '2019-04-25 16:08:41', '1', '64', '800');
INSERT INTO `userrelease` VALUES ('709', '2019-04-25 16:08:41', '1', '62', '801');
INSERT INTO `userrelease` VALUES ('710', '2019-04-25 16:08:41', '1', '45', '802');
INSERT INTO `userrelease` VALUES ('711', '2019-04-25 16:08:41', '1', '99', '803');
INSERT INTO `userrelease` VALUES ('712', '2019-04-25 16:08:41', '1', '30', '804');
INSERT INTO `userrelease` VALUES ('713', '2019-04-25 16:08:41', '1', '78', '805');
INSERT INTO `userrelease` VALUES ('714', '2019-04-25 16:08:41', '1', '72', '806');
INSERT INTO `userrelease` VALUES ('715', '2019-04-25 16:08:41', '1', '65', '807');
INSERT INTO `userrelease` VALUES ('716', '2019-04-25 16:08:41', '1', '46', '808');
INSERT INTO `userrelease` VALUES ('717', '2019-04-25 16:08:41', '1', '28', '809');
INSERT INTO `userrelease` VALUES ('718', '2019-04-25 16:08:41', '1', '61', '810');
INSERT INTO `userrelease` VALUES ('719', '2019-04-25 16:08:41', '1', '63', '811');
INSERT INTO `userrelease` VALUES ('720', '2019-04-25 16:08:41', '1', '50', '812');
INSERT INTO `userrelease` VALUES ('721', '2019-04-25 16:08:41', '1', '76', '813');
INSERT INTO `userrelease` VALUES ('722', '2019-04-25 16:08:41', '1', '55', '814');
INSERT INTO `userrelease` VALUES ('723', '2019-04-25 16:08:41', '1', '79', '815');
INSERT INTO `userrelease` VALUES ('724', '2019-04-25 16:08:41', '1', '65', '816');
INSERT INTO `userrelease` VALUES ('725', '2019-04-25 16:08:41', '1', '65', '817');
INSERT INTO `userrelease` VALUES ('726', '2019-04-25 16:08:41', '1', '33', '818');
INSERT INTO `userrelease` VALUES ('727', '2019-04-25 16:08:41', '1', '69', '819');
INSERT INTO `userrelease` VALUES ('728', '2019-04-25 16:08:41', '1', '86', '820');
INSERT INTO `userrelease` VALUES ('729', '2019-04-25 16:08:41', '1', '63', '821');
INSERT INTO `userrelease` VALUES ('730', '2019-04-25 16:08:41', '1', '69', '822');
INSERT INTO `userrelease` VALUES ('731', '2019-04-25 16:08:41', '1', '93', '823');
INSERT INTO `userrelease` VALUES ('732', '2019-04-25 16:08:41', '1', '13', '824');
INSERT INTO `userrelease` VALUES ('733', '2019-04-25 16:08:41', '1', '58', '825');
INSERT INTO `userrelease` VALUES ('734', '2019-04-25 16:08:41', '1', '94', '826');
INSERT INTO `userrelease` VALUES ('735', '2019-04-25 16:08:41', '1', '91', '827');
INSERT INTO `userrelease` VALUES ('736', '2019-04-25 16:08:41', '1', '92', '828');
INSERT INTO `userrelease` VALUES ('737', '2019-04-25 16:08:41', '1', '61', '829');
INSERT INTO `userrelease` VALUES ('738', '2019-04-25 16:08:41', '1', '18', '830');
INSERT INTO `userrelease` VALUES ('739', '2019-04-25 16:08:41', '1', '13', '831');
INSERT INTO `userrelease` VALUES ('740', '2019-04-25 16:08:41', '1', '24', '832');
INSERT INTO `userrelease` VALUES ('741', '2019-04-25 16:08:41', '1', '4', '833');
INSERT INTO `userrelease` VALUES ('742', '2019-04-25 16:08:41', '1', '91', '834');
INSERT INTO `userrelease` VALUES ('743', '2019-04-25 16:08:41', '1', '48', '835');
INSERT INTO `userrelease` VALUES ('744', '2019-04-25 16:08:41', '1', '32', '836');
INSERT INTO `userrelease` VALUES ('745', '2019-04-25 16:08:41', '1', '55', '837');
INSERT INTO `userrelease` VALUES ('746', '2019-04-25 16:08:41', '1', '15', '838');
INSERT INTO `userrelease` VALUES ('747', '2019-04-25 16:08:41', '1', '28', '839');
INSERT INTO `userrelease` VALUES ('748', '2019-04-25 16:08:41', '1', '66', '840');
INSERT INTO `userrelease` VALUES ('749', '2019-04-25 16:08:41', '1', '83', '841');
INSERT INTO `userrelease` VALUES ('750', '2019-04-25 16:08:41', '1', '82', '842');
INSERT INTO `userrelease` VALUES ('751', '2019-04-25 16:08:41', '1', '50', '843');
INSERT INTO `userrelease` VALUES ('752', '2019-04-25 16:08:41', '1', '21', '844');
INSERT INTO `userrelease` VALUES ('753', '2019-04-25 16:08:41', '1', '38', '845');
INSERT INTO `userrelease` VALUES ('754', '2019-04-25 16:08:41', '1', '39', '846');
INSERT INTO `userrelease` VALUES ('755', '2019-04-25 16:08:41', '1', '18', '847');
INSERT INTO `userrelease` VALUES ('756', '2019-04-25 16:08:41', '1', '55', '848');
INSERT INTO `userrelease` VALUES ('757', '2019-04-25 16:08:41', '1', '19', '849');
INSERT INTO `userrelease` VALUES ('758', '2019-04-25 16:08:41', '1', '8', '850');
INSERT INTO `userrelease` VALUES ('759', '2019-04-25 16:08:41', '1', '34', '851');
INSERT INTO `userrelease` VALUES ('760', '2019-04-25 16:08:41', '1', '87', '852');
INSERT INTO `userrelease` VALUES ('761', '2019-04-25 16:08:41', '1', '92', '853');
INSERT INTO `userrelease` VALUES ('762', '2019-04-25 16:08:41', '1', '55', '854');
INSERT INTO `userrelease` VALUES ('763', '2019-04-25 16:08:41', '1', '6', '855');
INSERT INTO `userrelease` VALUES ('764', '2019-04-25 16:08:41', '1', '53', '856');
INSERT INTO `userrelease` VALUES ('765', '2019-04-25 16:08:41', '1', '49', '857');
INSERT INTO `userrelease` VALUES ('766', '2019-04-25 16:08:41', '1', '30', '858');
INSERT INTO `userrelease` VALUES ('767', '2019-04-25 16:08:41', '1', '69', '859');
INSERT INTO `userrelease` VALUES ('768', '2019-04-25 16:08:41', '1', '83', '860');
INSERT INTO `userrelease` VALUES ('769', '2019-04-25 16:08:41', '1', '50', '861');
INSERT INTO `userrelease` VALUES ('770', '2019-04-25 16:08:41', '1', '7', '862');
INSERT INTO `userrelease` VALUES ('771', '2019-04-25 16:08:41', '1', '81', '863');
INSERT INTO `userrelease` VALUES ('772', '2019-04-25 16:08:41', '1', '40', '864');
INSERT INTO `userrelease` VALUES ('773', '2019-04-25 16:08:41', '1', '49', '865');
INSERT INTO `userrelease` VALUES ('774', '2019-04-25 16:08:41', '1', '97', '866');
INSERT INTO `userrelease` VALUES ('775', '2019-04-25 16:08:41', '1', '24', '867');
INSERT INTO `userrelease` VALUES ('776', '2019-04-25 16:08:41', '1', '47', '868');
INSERT INTO `userrelease` VALUES ('777', '2019-04-25 16:08:41', '1', '26', '869');
INSERT INTO `userrelease` VALUES ('778', '2019-04-25 16:08:41', '1', '31', '870');
INSERT INTO `userrelease` VALUES ('779', '2019-04-25 16:08:41', '1', '67', '871');
INSERT INTO `userrelease` VALUES ('780', '2019-04-25 16:08:41', '1', '93', '872');
INSERT INTO `userrelease` VALUES ('781', '2019-04-25 16:08:41', '1', '84', '873');
INSERT INTO `userrelease` VALUES ('782', '2019-04-25 16:08:41', '1', '84', '874');
INSERT INTO `userrelease` VALUES ('783', '2019-04-25 16:08:41', '1', '51', '875');
INSERT INTO `userrelease` VALUES ('784', '2019-04-25 16:08:41', '1', '24', '876');
INSERT INTO `userrelease` VALUES ('785', '2019-04-25 16:08:41', '1', '98', '877');
INSERT INTO `userrelease` VALUES ('786', '2019-04-25 16:08:41', '1', '28', '878');
INSERT INTO `userrelease` VALUES ('787', '2019-04-25 16:08:41', '1', '66', '879');
INSERT INTO `userrelease` VALUES ('788', '2019-04-25 16:08:41', '1', '100', '880');
INSERT INTO `userrelease` VALUES ('789', '2019-04-25 16:08:41', '1', '63', '881');
INSERT INTO `userrelease` VALUES ('790', '2019-04-25 16:08:41', '1', '36', '882');
INSERT INTO `userrelease` VALUES ('791', '2019-04-25 16:08:41', '1', '84', '883');
INSERT INTO `userrelease` VALUES ('792', '2019-04-25 16:08:41', '1', '69', '884');
INSERT INTO `userrelease` VALUES ('793', '2019-04-25 16:08:41', '1', '6', '885');
INSERT INTO `userrelease` VALUES ('794', '2019-04-25 16:08:41', '1', '29', '886');
INSERT INTO `userrelease` VALUES ('795', '2019-04-25 16:08:41', '1', '84', '887');
INSERT INTO `userrelease` VALUES ('796', '2019-04-25 16:08:41', '1', '23', '888');
INSERT INTO `userrelease` VALUES ('797', '2019-04-25 16:08:41', '1', '53', '889');
INSERT INTO `userrelease` VALUES ('798', '2019-04-25 16:08:41', '1', '52', '890');
INSERT INTO `userrelease` VALUES ('799', '2019-04-25 16:08:41', '1', '91', '891');
INSERT INTO `userrelease` VALUES ('800', '2019-04-25 16:08:41', '1', '17', '892');
INSERT INTO `userrelease` VALUES ('801', '2019-04-25 16:08:41', '1', '37', '893');
INSERT INTO `userrelease` VALUES ('802', '2019-04-25 16:08:41', '1', '3', '894');
INSERT INTO `userrelease` VALUES ('803', '2019-04-25 16:08:41', '1', '64', '895');
INSERT INTO `userrelease` VALUES ('804', '2019-04-25 16:08:41', '1', '93', '896');
INSERT INTO `userrelease` VALUES ('805', '2019-04-25 16:08:41', '1', '31', '897');
INSERT INTO `userrelease` VALUES ('806', '2019-04-25 16:08:41', '1', '11', '898');
INSERT INTO `userrelease` VALUES ('807', '2019-04-25 16:08:41', '1', '90', '899');
INSERT INTO `userrelease` VALUES ('808', '2019-04-25 16:08:41', '1', '21', '900');
INSERT INTO `userrelease` VALUES ('809', '2019-04-25 16:08:41', '1', '94', '901');
INSERT INTO `userrelease` VALUES ('810', '2019-04-25 16:08:41', '1', '74', '902');
INSERT INTO `userrelease` VALUES ('811', '2019-04-25 16:08:41', '1', '71', '903');
INSERT INTO `userrelease` VALUES ('812', '2019-04-25 16:08:41', '1', '68', '904');
INSERT INTO `userrelease` VALUES ('813', '2019-04-25 16:08:41', '1', '73', '905');
INSERT INTO `userrelease` VALUES ('814', '2019-04-25 16:08:41', '1', '96', '906');
INSERT INTO `userrelease` VALUES ('815', '2019-04-25 16:08:41', '1', '66', '907');
INSERT INTO `userrelease` VALUES ('816', '2019-04-25 16:08:41', '1', '100', '908');
INSERT INTO `userrelease` VALUES ('817', '2019-04-25 16:08:41', '1', '97', '909');
INSERT INTO `userrelease` VALUES ('818', '2019-04-25 16:08:41', '1', '74', '910');
INSERT INTO `userrelease` VALUES ('819', '2019-04-25 16:08:41', '1', '24', '911');
INSERT INTO `userrelease` VALUES ('820', '2019-04-25 16:08:41', '1', '23', '912');
INSERT INTO `userrelease` VALUES ('821', '2019-04-25 16:08:41', '1', '73', '913');
INSERT INTO `userrelease` VALUES ('822', '2019-04-25 16:08:41', '1', '80', '914');
INSERT INTO `userrelease` VALUES ('823', '2019-04-25 16:08:41', '1', '90', '915');
INSERT INTO `userrelease` VALUES ('824', '2019-04-25 16:08:41', '1', '18', '916');
INSERT INTO `userrelease` VALUES ('825', '2019-04-25 16:08:41', '1', '30', '917');
INSERT INTO `userrelease` VALUES ('826', '2019-04-25 16:08:41', '1', '55', '918');
INSERT INTO `userrelease` VALUES ('827', '2019-04-25 16:08:41', '1', '47', '919');
INSERT INTO `userrelease` VALUES ('828', '2019-04-25 16:08:41', '1', '74', '920');
INSERT INTO `userrelease` VALUES ('829', '2019-04-25 16:08:41', '1', '34', '921');
INSERT INTO `userrelease` VALUES ('830', '2019-04-25 16:08:41', '1', '6', '922');
INSERT INTO `userrelease` VALUES ('831', '2019-04-25 16:08:41', '1', '54', '923');
INSERT INTO `userrelease` VALUES ('832', '2019-04-25 16:08:41', '1', '66', '924');
INSERT INTO `userrelease` VALUES ('833', '2019-04-25 16:08:41', '1', '7', '925');
INSERT INTO `userrelease` VALUES ('834', '2019-04-25 16:08:41', '1', '22', '926');
INSERT INTO `userrelease` VALUES ('835', '2019-04-25 16:08:41', '1', '31', '927');
INSERT INTO `userrelease` VALUES ('836', '2019-04-25 16:08:41', '1', '22', '928');
INSERT INTO `userrelease` VALUES ('837', '2019-04-25 16:08:41', '1', '80', '929');
INSERT INTO `userrelease` VALUES ('838', '2019-04-25 16:08:41', '1', '26', '930');
INSERT INTO `userrelease` VALUES ('839', '2019-04-25 16:08:41', '1', '20', '931');
INSERT INTO `userrelease` VALUES ('840', '2019-04-25 16:08:41', '1', '9', '932');
INSERT INTO `userrelease` VALUES ('841', '2019-04-25 16:08:41', '1', '49', '933');
INSERT INTO `userrelease` VALUES ('842', '2019-04-25 16:08:41', '1', '70', '934');
INSERT INTO `userrelease` VALUES ('843', '2019-04-25 16:08:41', '1', '30', '935');
INSERT INTO `userrelease` VALUES ('844', '2019-04-25 16:08:41', '1', '2', '936');
INSERT INTO `userrelease` VALUES ('845', '2019-04-25 16:08:41', '1', '86', '937');
INSERT INTO `userrelease` VALUES ('846', '2019-04-25 16:08:41', '1', '4', '938');
INSERT INTO `userrelease` VALUES ('847', '2019-04-25 16:08:41', '1', '38', '939');
INSERT INTO `userrelease` VALUES ('848', '2019-04-25 16:08:41', '1', '41', '940');
INSERT INTO `userrelease` VALUES ('849', '2019-04-25 16:08:41', '1', '87', '941');
INSERT INTO `userrelease` VALUES ('850', '2019-04-25 16:08:41', '1', '1', '942');
INSERT INTO `userrelease` VALUES ('851', '2019-04-25 16:08:41', '1', '3', '943');
INSERT INTO `userrelease` VALUES ('852', '2019-04-25 16:08:41', '1', '49', '944');
INSERT INTO `userrelease` VALUES ('853', '2019-04-25 16:08:41', '1', '9', '945');
INSERT INTO `userrelease` VALUES ('854', '2019-04-25 16:08:41', '1', '1', '946');
INSERT INTO `userrelease` VALUES ('855', '2019-04-25 16:08:41', '1', '46', '947');
INSERT INTO `userrelease` VALUES ('856', '2019-04-25 16:08:41', '1', '84', '948');
INSERT INTO `userrelease` VALUES ('857', '2019-04-25 16:08:41', '1', '59', '949');
INSERT INTO `userrelease` VALUES ('858', '2019-04-25 16:08:41', '1', '65', '950');
INSERT INTO `userrelease` VALUES ('859', '2019-04-25 16:08:41', '1', '50', '951');
INSERT INTO `userrelease` VALUES ('860', '2019-04-25 16:08:41', '1', '30', '952');
INSERT INTO `userrelease` VALUES ('861', '2019-04-25 16:08:41', '1', '8', '953');
INSERT INTO `userrelease` VALUES ('862', '2019-04-25 16:08:41', '1', '62', '954');
INSERT INTO `userrelease` VALUES ('863', '2019-04-25 16:08:41', '1', '28', '955');
INSERT INTO `userrelease` VALUES ('864', '2019-04-25 16:08:41', '1', '79', '956');
INSERT INTO `userrelease` VALUES ('865', '2019-04-25 16:08:41', '1', '39', '957');
INSERT INTO `userrelease` VALUES ('866', '2019-04-25 16:08:41', '1', '87', '958');
INSERT INTO `userrelease` VALUES ('867', '2019-04-25 16:08:41', '1', '58', '959');
INSERT INTO `userrelease` VALUES ('868', '2019-04-25 16:08:41', '1', '68', '960');
INSERT INTO `userrelease` VALUES ('869', '2019-04-25 16:08:41', '1', '42', '961');
INSERT INTO `userrelease` VALUES ('870', '2019-04-25 16:08:41', '1', '25', '962');
INSERT INTO `userrelease` VALUES ('871', '2019-04-25 16:08:41', '1', '48', '963');
INSERT INTO `userrelease` VALUES ('872', '2019-04-25 16:08:41', '1', '27', '964');
INSERT INTO `userrelease` VALUES ('873', '2019-04-25 16:08:41', '1', '88', '965');
INSERT INTO `userrelease` VALUES ('874', '2019-04-25 16:08:41', '1', '88', '966');
INSERT INTO `userrelease` VALUES ('875', '2019-04-25 16:08:41', '1', '40', '967');
INSERT INTO `userrelease` VALUES ('876', '2019-04-25 16:08:41', '1', '84', '968');
INSERT INTO `userrelease` VALUES ('877', '2019-04-25 16:08:41', '1', '61', '969');
INSERT INTO `userrelease` VALUES ('878', '2019-04-25 16:08:41', '1', '91', '970');
INSERT INTO `userrelease` VALUES ('879', '2019-04-25 16:08:41', '1', '29', '971');
INSERT INTO `userrelease` VALUES ('880', '2019-04-25 16:08:41', '1', '28', '972');
INSERT INTO `userrelease` VALUES ('881', '2019-04-25 16:08:41', '1', '75', '973');
INSERT INTO `userrelease` VALUES ('882', '2019-04-25 16:08:41', '1', '60', '974');
INSERT INTO `userrelease` VALUES ('883', '2019-04-25 16:08:41', '1', '43', '975');
INSERT INTO `userrelease` VALUES ('884', '2019-04-25 16:08:41', '1', '14', '976');
INSERT INTO `userrelease` VALUES ('885', '2019-04-25 16:08:41', '1', '75', '977');
INSERT INTO `userrelease` VALUES ('886', '2019-04-25 16:08:41', '1', '93', '978');
INSERT INTO `userrelease` VALUES ('887', '2019-04-25 16:08:41', '1', '54', '979');
INSERT INTO `userrelease` VALUES ('888', '2019-04-25 16:08:41', '1', '33', '980');
INSERT INTO `userrelease` VALUES ('889', '2019-04-25 16:08:41', '1', '55', '981');
INSERT INTO `userrelease` VALUES ('890', '2019-04-25 16:08:41', '1', '26', '982');
INSERT INTO `userrelease` VALUES ('891', '2019-04-25 16:08:41', '1', '37', '983');
INSERT INTO `userrelease` VALUES ('892', '2019-04-25 16:08:41', '1', '84', '984');
INSERT INTO `userrelease` VALUES ('893', '2019-04-25 16:08:41', '1', '3', '985');
INSERT INTO `userrelease` VALUES ('894', '2019-04-25 16:08:41', '1', '99', '986');
INSERT INTO `userrelease` VALUES ('895', '2019-04-25 16:08:41', '1', '69', '987');
INSERT INTO `userrelease` VALUES ('896', '2019-04-25 16:08:41', '1', '46', '988');
INSERT INTO `userrelease` VALUES ('897', '2019-04-25 16:08:41', '1', '54', '989');
INSERT INTO `userrelease` VALUES ('898', '2019-04-25 16:08:41', '1', '59', '990');
INSERT INTO `userrelease` VALUES ('899', '2019-04-25 16:08:41', '1', '43', '991');
INSERT INTO `userrelease` VALUES ('900', '2019-04-25 16:08:41', '1', '82', '992');
INSERT INTO `userrelease` VALUES ('901', '2019-04-25 16:08:41', '1', '96', '993');
INSERT INTO `userrelease` VALUES ('902', '2019-04-25 16:08:41', '1', '89', '994');
INSERT INTO `userrelease` VALUES ('903', '2019-04-25 16:08:41', '1', '63', '995');
INSERT INTO `userrelease` VALUES ('904', '2019-04-25 16:08:41', '1', '55', '996');
INSERT INTO `userrelease` VALUES ('905', '2019-04-25 16:08:41', '1', '91', '997');
INSERT INTO `userrelease` VALUES ('906', '2019-04-25 16:08:41', '1', '64', '998');
INSERT INTO `userrelease` VALUES ('907', '2019-04-25 16:08:41', '1', '96', '999');
INSERT INTO `userrelease` VALUES ('908', '2019-04-25 16:08:41', '1', '45', '1000');
INSERT INTO `userrelease` VALUES ('909', '2019-04-25 16:08:41', '1', '15', '1001');
INSERT INTO `userrelease` VALUES ('910', '2019-04-25 16:08:41', '1', '45', '1002');
INSERT INTO `userrelease` VALUES ('911', '2019-04-25 16:08:41', '1', '25', '1003');
INSERT INTO `userrelease` VALUES ('912', '2019-04-25 16:08:41', '1', '95', '1004');
INSERT INTO `userrelease` VALUES ('913', '2019-04-25 16:08:41', '1', '69', '1005');
INSERT INTO `userrelease` VALUES ('914', '2019-04-25 16:08:41', '1', '100', '1006');
INSERT INTO `userrelease` VALUES ('915', '2019-04-25 16:08:41', '1', '21', '1007');
INSERT INTO `userrelease` VALUES ('916', '2019-04-25 16:08:41', '1', '61', '1008');
INSERT INTO `userrelease` VALUES ('917', '2019-04-25 16:08:41', '1', '56', '1009');
INSERT INTO `userrelease` VALUES ('918', '2019-04-25 16:08:41', '1', '43', '1010');
INSERT INTO `userrelease` VALUES ('919', '2019-04-25 16:08:41', '1', '7', '1011');
INSERT INTO `userrelease` VALUES ('920', '2019-04-25 16:08:41', '1', '39', '1012');
INSERT INTO `userrelease` VALUES ('921', '2019-04-25 16:08:41', '1', '87', '1013');
INSERT INTO `userrelease` VALUES ('922', '2019-04-25 16:08:41', '1', '59', '1014');
INSERT INTO `userrelease` VALUES ('923', '2019-04-25 16:08:41', '1', '64', '1015');
INSERT INTO `userrelease` VALUES ('924', '2019-04-25 16:08:41', '1', '32', '1016');
INSERT INTO `userrelease` VALUES ('925', '2019-04-25 16:08:41', '1', '36', '1017');
INSERT INTO `userrelease` VALUES ('926', '2019-04-25 16:08:41', '1', '34', '1018');
INSERT INTO `userrelease` VALUES ('927', '2019-04-25 16:08:41', '1', '67', '1019');
INSERT INTO `userrelease` VALUES ('928', '2019-04-25 16:08:41', '1', '36', '1020');
INSERT INTO `userrelease` VALUES ('929', '2019-04-25 16:08:41', '1', '47', '1021');
INSERT INTO `userrelease` VALUES ('930', '2019-04-25 16:08:41', '1', '86', '1022');
INSERT INTO `userrelease` VALUES ('931', '2019-04-25 16:08:41', '1', '36', '1023');
INSERT INTO `userrelease` VALUES ('932', '2019-04-25 16:08:41', '1', '5', '1024');
INSERT INTO `userrelease` VALUES ('933', '2019-04-25 16:08:41', '1', '98', '1025');
INSERT INTO `userrelease` VALUES ('934', '2019-04-25 16:08:41', '1', '52', '1026');
INSERT INTO `userrelease` VALUES ('935', '2019-04-25 16:08:41', '1', '85', '1027');
INSERT INTO `userrelease` VALUES ('936', '2019-04-25 16:08:41', '1', '53', '1028');
INSERT INTO `userrelease` VALUES ('937', '2019-04-25 16:08:41', '1', '1', '1029');
INSERT INTO `userrelease` VALUES ('938', '2019-04-25 16:08:41', '1', '89', '1030');
INSERT INTO `userrelease` VALUES ('939', '2019-04-25 16:08:41', '1', '26', '1031');
INSERT INTO `userrelease` VALUES ('940', '2019-04-25 16:08:41', '1', '50', '1032');
INSERT INTO `userrelease` VALUES ('941', '2019-04-25 16:08:41', '1', '9', '1033');
INSERT INTO `userrelease` VALUES ('942', '2019-04-25 16:08:41', '1', '71', '1034');
INSERT INTO `userrelease` VALUES ('943', '2019-04-25 16:08:41', '1', '47', '1035');
INSERT INTO `userrelease` VALUES ('944', '2019-04-25 16:08:41', '1', '3', '1036');
INSERT INTO `userrelease` VALUES ('945', '2019-04-25 16:08:41', '1', '79', '1037');
INSERT INTO `userrelease` VALUES ('946', '2019-04-25 16:08:41', '1', '37', '1038');
INSERT INTO `userrelease` VALUES ('947', '2019-04-25 16:08:41', '1', '76', '1039');
INSERT INTO `userrelease` VALUES ('948', '2019-04-25 16:08:41', '1', '11', '1040');
INSERT INTO `userrelease` VALUES ('949', '2019-04-25 16:08:41', '1', '47', '1041');
INSERT INTO `userrelease` VALUES ('950', '2019-04-25 16:08:41', '1', '95', '1042');
INSERT INTO `userrelease` VALUES ('951', '2019-04-25 16:08:41', '1', '29', '1043');
INSERT INTO `userrelease` VALUES ('952', '2019-04-25 16:08:41', '1', '24', '1044');
INSERT INTO `userrelease` VALUES ('953', '2019-04-25 16:08:41', '1', '26', '1045');
INSERT INTO `userrelease` VALUES ('954', '2019-04-25 16:08:41', '1', '16', '1046');
INSERT INTO `userrelease` VALUES ('955', '2019-04-25 16:08:41', '1', '36', '1047');
INSERT INTO `userrelease` VALUES ('956', '2019-04-25 16:08:41', '1', '89', '1048');
INSERT INTO `userrelease` VALUES ('957', '2019-04-25 16:08:41', '1', '10', '1049');
INSERT INTO `userrelease` VALUES ('958', '2019-04-25 16:08:41', '1', '26', '1050');
INSERT INTO `userrelease` VALUES ('959', '2019-04-25 16:08:41', '1', '41', '1051');
INSERT INTO `userrelease` VALUES ('960', '2019-04-25 16:08:41', '1', '82', '1052');
INSERT INTO `userrelease` VALUES ('961', '2019-04-25 16:08:41', '1', '56', '1053');
INSERT INTO `userrelease` VALUES ('962', '2019-04-25 16:08:41', '1', '84', '1054');
INSERT INTO `userrelease` VALUES ('963', '2019-04-25 16:08:41', '1', '81', '1055');
INSERT INTO `userrelease` VALUES ('964', '2019-04-25 16:08:41', '1', '24', '1056');
INSERT INTO `userrelease` VALUES ('965', '2019-04-25 16:08:41', '1', '81', '1057');
INSERT INTO `userrelease` VALUES ('966', '2019-04-25 16:08:41', '1', '88', '1058');
INSERT INTO `userrelease` VALUES ('967', '2019-04-25 16:08:41', '1', '39', '1059');
INSERT INTO `userrelease` VALUES ('968', '2019-04-25 16:08:41', '1', '21', '1060');
INSERT INTO `userrelease` VALUES ('969', '2019-04-25 16:08:41', '1', '87', '1061');
INSERT INTO `userrelease` VALUES ('970', '2019-04-25 16:08:41', '1', '29', '1062');
INSERT INTO `userrelease` VALUES ('971', '2019-04-25 16:08:41', '1', '15', '1063');
INSERT INTO `userrelease` VALUES ('972', '2019-04-25 16:08:41', '1', '22', '1064');
INSERT INTO `userrelease` VALUES ('973', '2019-04-25 16:08:41', '1', '22', '1065');
INSERT INTO `userrelease` VALUES ('974', '2019-04-25 16:08:41', '1', '80', '1066');
INSERT INTO `userrelease` VALUES ('975', '2019-04-25 16:08:41', '1', '24', '1067');
INSERT INTO `userrelease` VALUES ('976', '2019-04-25 16:08:41', '1', '61', '1068');
INSERT INTO `userrelease` VALUES ('977', '2019-04-25 16:08:41', '1', '15', '1069');
INSERT INTO `userrelease` VALUES ('978', '2019-04-25 16:08:41', '1', '42', '1070');
INSERT INTO `userrelease` VALUES ('979', '2019-04-25 16:08:41', '1', '89', '1071');
INSERT INTO `userrelease` VALUES ('980', '2019-04-25 16:08:41', '1', '71', '1072');
INSERT INTO `userrelease` VALUES ('981', '2019-04-25 16:08:41', '1', '76', '1073');
INSERT INTO `userrelease` VALUES ('982', '2019-04-25 16:08:41', '1', '14', '1074');
INSERT INTO `userrelease` VALUES ('983', '2019-04-25 16:08:41', '1', '4', '1075');
INSERT INTO `userrelease` VALUES ('984', '2019-04-25 16:08:41', '1', '22', '1076');
INSERT INTO `userrelease` VALUES ('985', '2019-04-25 16:08:41', '1', '70', '1077');
INSERT INTO `userrelease` VALUES ('986', '2019-04-25 16:08:41', '1', '53', '1078');
INSERT INTO `userrelease` VALUES ('987', '2019-04-25 16:08:41', '1', '45', '1079');
INSERT INTO `userrelease` VALUES ('988', '2019-04-25 16:08:41', '1', '20', '1080');
INSERT INTO `userrelease` VALUES ('989', '2019-04-25 16:08:41', '1', '20', '1081');
INSERT INTO `userrelease` VALUES ('990', '2019-04-25 16:08:41', '1', '95', '1082');
INSERT INTO `userrelease` VALUES ('991', '2019-04-25 16:08:41', '1', '51', '1083');
INSERT INTO `userrelease` VALUES ('992', '2019-04-25 16:08:41', '1', '42', '1084');
INSERT INTO `userrelease` VALUES ('993', '2019-04-25 16:08:41', '1', '30', '1085');
INSERT INTO `userrelease` VALUES ('994', '2019-04-25 16:08:41', '1', '85', '1086');
INSERT INTO `userrelease` VALUES ('995', '2019-04-25 16:08:41', '1', '37', '1087');
INSERT INTO `userrelease` VALUES ('996', '2019-04-25 16:08:41', '1', '80', '1088');
INSERT INTO `userrelease` VALUES ('997', '2019-04-25 16:08:41', '1', '59', '1089');
INSERT INTO `userrelease` VALUES ('998', '2019-04-25 16:08:41', '1', '17', '1090');
INSERT INTO `userrelease` VALUES ('999', '2019-04-25 16:08:41', '1', '75', '1091');
INSERT INTO `userrelease` VALUES ('1000', '2019-04-25 16:08:41', '1', '75', '1092');
INSERT INTO `userrelease` VALUES ('1001', '2019-04-25 16:08:41', '1', '68', '1093');
INSERT INTO `userrelease` VALUES ('1002', '2019-04-25 16:08:41', '1', '7', '1094');
INSERT INTO `userrelease` VALUES ('1003', '2019-04-25 16:08:41', '1', '7', '1095');
INSERT INTO `userrelease` VALUES ('1004', '2019-04-25 16:08:41', '1', '7', '1096');
INSERT INTO `userrelease` VALUES ('1005', '2019-04-25 16:08:41', '1', '7', '1097');
INSERT INTO `userrelease` VALUES ('1006', '2019-04-25 16:08:41', '1', '7', '1098');
INSERT INTO `userrelease` VALUES ('1007', '2019-04-25 16:08:41', '1', '7', '1099');
INSERT INTO `userrelease` VALUES ('1008', '2019-04-25 16:08:41', '1', '7', '1100');
INSERT INTO `userrelease` VALUES ('1009', '2019-04-25 16:08:41', '1', '1', '1101');
INSERT INTO `userrelease` VALUES ('1010', '2019-04-25 16:08:41', '1', '14', '93');
INSERT INTO `userrelease` VALUES ('1011', '2019-04-25 16:08:41', '1', '14', '94');
INSERT INTO `userrelease` VALUES ('1012', '2019-04-25 16:08:41', '1', '1', '95');
INSERT INTO `userrelease` VALUES ('1013', '2019-04-25 16:08:41', '1', '1', '96');
INSERT INTO `userrelease` VALUES ('1014', '2019-04-25 16:08:41', '1', '1', '97');
INSERT INTO `userrelease` VALUES ('1015', '2019-04-25 16:08:41', '1', '14', '98');
INSERT INTO `userrelease` VALUES ('1016', '2019-04-25 16:08:41', '1', '14', '99');
INSERT INTO `userrelease` VALUES ('1017', '2019-04-25 16:08:41', '1', '14', '100');
INSERT INTO `userrelease` VALUES ('1018', '2019-04-25 16:08:41', '1', '1', '101');
INSERT INTO `userrelease` VALUES ('1019', '2019-04-25 16:08:41', '1', '1', '102');
INSERT INTO `userrelease` VALUES ('1020', '2019-04-13 14:01:10', '1', '1', '101');

-- ----------------------------
-- Table structure for userstate
-- ----------------------------
DROP TABLE IF EXISTS `userstate`;
CREATE TABLE `userstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `credit` int(11) NOT NULL DEFAULT '80',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `modified` datetime DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userstate
-- ----------------------------

-- ----------------------------
-- Table structure for userwant
-- ----------------------------
DROP TABLE IF EXISTS `userwant`;
CREATE TABLE `userwant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '求购id',
  `modified` datetime DEFAULT NULL COMMENT '创建时间',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `name` varchar(50) NOT NULL COMMENT '求购名称',
  `sort` int(100) NOT NULL COMMENT '求购分类',
  `quantity` int(11) NOT NULL COMMENT '数量',
  `price` decimal(10,2) NOT NULL COMMENT '求购价格',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='求购商品信息表';

-- ----------------------------
-- Records of userwant
-- ----------------------------
INSERT INTO `userwant` VALUES ('1', '2017-05-21 21:03:38', '1', '龙年限定', '1', '1', '1.00', '好东西哟，一般来说，好的东西都是需要很多很多人来抢着买的，一万年太久，只争朝夕', '7');
INSERT INTO `userwant` VALUES ('13', '2019-01-08 09:48:40', '1', '笔记本电脑', '13', '1', '3000.00', '成色较新，可以吃鸡就行', '7');
INSERT INTO `userwant` VALUES ('14', '2019-01-08 18:26:36', '1', '键盘', '21', '1', '50.00', '1', '14');
INSERT INTO `userwant` VALUES ('15', '2019-01-17 16:47:22', '1', 'TEST', '1', '1', '1.00', '1', '1');
INSERT INTO `userwant` VALUES ('16', '2019-04-13 14:00:15', '1', '篮球', '65', '1', '50.00', '1111', '1');

-- ----------------------------
-- Table structure for wantcontext
-- ----------------------------
DROP TABLE IF EXISTS `wantcontext`;
CREATE TABLE `wantcontext` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '留言id',
  `modified` datetime DEFAULT NULL COMMENT '留言时间',
  `uwid` int(11) NOT NULL COMMENT '用户id',
  `context` varchar(255) NOT NULL COMMENT '留言内容',
  `display` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户求购留言信息表';

-- ----------------------------
-- Records of wantcontext
-- ----------------------------
