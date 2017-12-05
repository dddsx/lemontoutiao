/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : ningmengtoutiao

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-12-05 10:42:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for art_category
-- ----------------------------
DROP TABLE IF EXISTS `art_category`;
CREATE TABLE `art_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `category` varchar(30) NOT NULL COMMENT '类别名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of art_category
-- ----------------------------
INSERT INTO `art_category` VALUES ('1', 'news_recommend');
INSERT INTO `art_category` VALUES ('2', 'news_hot');
INSERT INTO `art_category` VALUES ('3', 'news_tech');
INSERT INTO `art_category` VALUES ('4', 'news_funny');
INSERT INTO `art_category` VALUES ('5', 'news_entertainment');
INSERT INTO `art_category` VALUES ('6', 'news_game');
INSERT INTO `art_category` VALUES ('7', 'news_sports');
INSERT INTO `art_category` VALUES ('8', 'news_cartoon');
INSERT INTO `art_category` VALUES ('9', 'news_movie');
INSERT INTO `art_category` VALUES ('10', 'news_automobile');
INSERT INTO `art_category` VALUES ('11', 'news_military');
INSERT INTO `art_category` VALUES ('12', 'news_story');
INSERT INTO `art_category` VALUES ('13', 'news_finance');
INSERT INTO `art_category` VALUES ('14', 'essay_joke');

-- ----------------------------
-- Table structure for user_pic
-- ----------------------------
DROP TABLE IF EXISTS `user_pic`;
CREATE TABLE `user_pic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `filename` varchar(50) NOT NULL COMMENT '头像文件名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_pic` (`filename`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_pic
-- ----------------------------
INSERT INTO `user_pic` VALUES ('1', '1.jpg');
INSERT INTO `user_pic` VALUES ('10', '10.jpg');
INSERT INTO `user_pic` VALUES ('11', '11.jpg');
INSERT INTO `user_pic` VALUES ('12', '12.jpg');
INSERT INTO `user_pic` VALUES ('13', '13.jpg');
INSERT INTO `user_pic` VALUES ('14', '14.jpg');
INSERT INTO `user_pic` VALUES ('15', '15.jpg');
INSERT INTO `user_pic` VALUES ('16', '16.jpg');
INSERT INTO `user_pic` VALUES ('17', '17.jpg');
INSERT INTO `user_pic` VALUES ('18', '18.jpg');
INSERT INTO `user_pic` VALUES ('19', '19.jpg');
INSERT INTO `user_pic` VALUES ('2', '2.jpg');
INSERT INTO `user_pic` VALUES ('20', '20.jpg');
INSERT INTO `user_pic` VALUES ('21', '21.jpg');
INSERT INTO `user_pic` VALUES ('22', '22.jpg');
INSERT INTO `user_pic` VALUES ('23', '23.jpg');
INSERT INTO `user_pic` VALUES ('24', '24.jpg');
INSERT INTO `user_pic` VALUES ('25', '25.jpg');
INSERT INTO `user_pic` VALUES ('26', '26.jpg');
INSERT INTO `user_pic` VALUES ('27', '27.jpg');
INSERT INTO `user_pic` VALUES ('28', '28.jpg');
INSERT INTO `user_pic` VALUES ('29', '29.jpg');
INSERT INTO `user_pic` VALUES ('3', '3.jpg');
INSERT INTO `user_pic` VALUES ('30', '30.jpg');
INSERT INTO `user_pic` VALUES ('31', '31.jpg');
INSERT INTO `user_pic` VALUES ('32', '32.jpg');
INSERT INTO `user_pic` VALUES ('33', '33.jpg');
INSERT INTO `user_pic` VALUES ('34', '34.jpg');
INSERT INTO `user_pic` VALUES ('35', '35.jpg');
INSERT INTO `user_pic` VALUES ('36', '36.jpg');
INSERT INTO `user_pic` VALUES ('37', '37.jpg');
INSERT INTO `user_pic` VALUES ('38', '38.jpg');
INSERT INTO `user_pic` VALUES ('39', '39.jpg');
INSERT INTO `user_pic` VALUES ('4', '4.jpg');
INSERT INTO `user_pic` VALUES ('40', '40.jpg');
INSERT INTO `user_pic` VALUES ('41', '41.jpg');
INSERT INTO `user_pic` VALUES ('42', '42.jpg');
INSERT INTO `user_pic` VALUES ('43', '43.jpg');
INSERT INTO `user_pic` VALUES ('44', '44.jpg');
INSERT INTO `user_pic` VALUES ('45', '45.jpg');
INSERT INTO `user_pic` VALUES ('46', '46.jpg');
INSERT INTO `user_pic` VALUES ('47', '47.jpg');
INSERT INTO `user_pic` VALUES ('48', '48.jpg');
INSERT INTO `user_pic` VALUES ('49', '49.jpg');
INSERT INTO `user_pic` VALUES ('5', '5.jpg');
INSERT INTO `user_pic` VALUES ('50', '50.jpg');
INSERT INTO `user_pic` VALUES ('51', '51.jpg');
INSERT INTO `user_pic` VALUES ('52', '52.jpg');
INSERT INTO `user_pic` VALUES ('53', '53.jpg');
INSERT INTO `user_pic` VALUES ('54', '54.jpg');
INSERT INTO `user_pic` VALUES ('55', '55.jpg');
INSERT INTO `user_pic` VALUES ('56', '56.jpg');
INSERT INTO `user_pic` VALUES ('57', '57.jpg');
INSERT INTO `user_pic` VALUES ('58', '58.jpg');
INSERT INTO `user_pic` VALUES ('59', '59.jpg');
INSERT INTO `user_pic` VALUES ('6', '6.jpg');
INSERT INTO `user_pic` VALUES ('60', '60.jpg');
INSERT INTO `user_pic` VALUES ('61', '61.jpg');
INSERT INTO `user_pic` VALUES ('62', '62.jpg');
INSERT INTO `user_pic` VALUES ('63', '63.jpg');
INSERT INTO `user_pic` VALUES ('64', '64.jpg');
INSERT INTO `user_pic` VALUES ('65', '65.jpg');
INSERT INTO `user_pic` VALUES ('66', '66.jpg');
INSERT INTO `user_pic` VALUES ('67', '67.jpg');
INSERT INTO `user_pic` VALUES ('68', '68.jpg');
INSERT INTO `user_pic` VALUES ('203', '6890d334-61e7-4611-8c95-c0fffa7b1a85.jpg');
INSERT INTO `user_pic` VALUES ('69', '69.jpg');
INSERT INTO `user_pic` VALUES ('7', '7.jpg');
INSERT INTO `user_pic` VALUES ('70', '70.jpg');
INSERT INTO `user_pic` VALUES ('71', '71.jpg');
INSERT INTO `user_pic` VALUES ('72', '72.jpg');
INSERT INTO `user_pic` VALUES ('73', '73.jpg');
INSERT INTO `user_pic` VALUES ('74', '74.jpg');
INSERT INTO `user_pic` VALUES ('75', '75.jpg');
INSERT INTO `user_pic` VALUES ('76', '76.jpg');
INSERT INTO `user_pic` VALUES ('77', '77.jpg');
INSERT INTO `user_pic` VALUES ('78', '78.jpg');
INSERT INTO `user_pic` VALUES ('79', '79.jpg');
INSERT INTO `user_pic` VALUES ('8', '8.jpg');
INSERT INTO `user_pic` VALUES ('80', '80.jpg');
INSERT INTO `user_pic` VALUES ('81', '81.jpg');
INSERT INTO `user_pic` VALUES ('82', '82.jpg');
INSERT INTO `user_pic` VALUES ('83', '83.jpg');
INSERT INTO `user_pic` VALUES ('84', '84.jpg');
INSERT INTO `user_pic` VALUES ('85', '85.jpg');
INSERT INTO `user_pic` VALUES ('86', '86.jpg');
INSERT INTO `user_pic` VALUES ('87', '87.jpg');
INSERT INTO `user_pic` VALUES ('88', '88.jpg');
INSERT INTO `user_pic` VALUES ('89', '89.jpg');
INSERT INTO `user_pic` VALUES ('9', '9.jpg');
INSERT INTO `user_pic` VALUES ('201', 'gutianle.jpg');
INSERT INTO `user_pic` VALUES ('202', 'zhoudage.jpg');

-- ----------------------------
-- Table structure for editor
-- ----------------------------
DROP TABLE IF EXISTS `editor`;
CREATE TABLE `editor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `real_name` varchar(10) NOT NULL,
  `idcard` varchar(19) NOT NULL COMMENT '身份证',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `workspace` varchar(20) NOT NULL DEFAULT '无',
  `pub_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发表文章数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20171133 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of editor
-- ----------------------------
INSERT INTO `editor` VALUES ('20171122', 'god', '452123199701111111', '15071468061', 'space', '0', '2017-11-22 14:30:36', '2017-11-22 14:30:40');
INSERT INTO `editor` VALUES ('20171125', '头条君', '452123199700000000', '15078456455', '无', '0', '2017-11-27 13:54:53', '2017-11-27 13:54:53');
INSERT INTO `editor` VALUES ('20171126', '头条君', '455757575757575757', '15071468061', '无', '0', '2017-11-27 14:02:14', '2017-11-27 14:02:14');
INSERT INTO `editor` VALUES ('20171127', '张诗棋', '421126199704141418', '18871349626', '无', '0', '2017-11-27 14:36:41', '2017-11-27 14:36:41');
INSERT INTO `editor` VALUES ('20171128', '吕相君', '452156455454556545', '15071468061', '无', '0', '2017-11-27 20:06:38', '2017-11-27 20:06:38');
INSERT INTO `editor` VALUES ('20171129', '古天乐', '454546454545453221', '15445645455', '无', '0', '2017-11-28 11:13:08', '2017-11-28 11:13:08');
INSERT INTO `editor` VALUES ('20171130', '周某', '4563465445464564645', '15232323232', '不打工', '0', '2017-11-28 11:28:24', '2017-11-28 11:28:24');
INSERT INTO `editor` VALUES ('20171131', '黄凯', '452112312315456464', '15021212121', '无', '0', '2017-11-28 16:09:59', '2017-11-28 16:09:59');
INSERT INTO `editor` VALUES ('20171132', '贺星', '451232121212154646', '15223213123', '无', '0', '2017-11-28 16:30:05', '2017-11-28 16:30:05');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(16) NOT NULL COMMENT '密码',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `picture` int(11) NOT NULL COMMENT '头像',
  `job` varchar(15) DEFAULT NULL,
  `introduce` varchar(50) DEFAULT NULL COMMENT '个人简介',
  `gender` char(1) NOT NULL DEFAULT 'N' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `location` varchar(30) DEFAULT NULL COMMENT '地区',
  `money` int(11) unsigned NOT NULL DEFAULT '0',
  `editor_id` int(11) DEFAULT NULL,
  `is_editor` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为小编',
  `is_authori` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否认证',
  `comment_num` int(11) unsigned NOT NULL DEFAULT '0',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`) USING BTREE,
  UNIQUE KEY `uk_nickname` (`nickname`) USING BTREE,
  UNIQUE KEY `editor_id` (`editor_id`) USING BTREE,
  KEY `idx_picture` (`picture`) USING BTREE,
  CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`picture`) REFERENCES `user_pic` (`id`),
  CONSTRAINT `tb_user_ibfk_2` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20170012 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('20170000', 'godgod', 'godgod', 'godgod', 'godgod@god.com', '1', 'god', 'god', 'N', '2099-12-31', 'space', '999999999', '20171122', '1', '1', '0', '2099-12-31 14:29:02', '2099-12-31 14:29:20');
INSERT INTO `tb_user` VALUES ('20170003', 'toutiao1', 'toutiao1', '头条搬运工001', 'toutiao1@toutiao.com', '4', '小编', '我们不生产新闻，只是头条的搬运工', 'M', '2017-11-27', '湖北-武汉', '0', '20171125', '1', '0', '0', '2017-11-27 13:52:37', '2017-11-27 13:58:37');
INSERT INTO `tb_user` VALUES ('20170004', 'toutiao2', 'toutiao2', '头条搬运工002', '617729682@qq.com', '14', '搬运工', '我们不生产新闻，只是新闻的搬运工。。。', 'F', '2017-11-27', '湖北-武汉', '0', '20171126', '1', '0', '0', '2017-11-27 13:57:57', '2017-11-27 14:04:13');
INSERT INTO `tb_user` VALUES ('20170005', '童洛夏123', '19961171997410', '童洛夏', '2375817575@qq.com', '15', '', '', 'M', null, '', '0', '20171127', '1', '0', '0', '2017-11-27 14:33:07', '2017-11-27 14:36:41');
INSERT INTO `tb_user` VALUES ('20170006', 'xiaobu', '5953805', '小布', 'dddsx6324@163.com', '203', 'Java小弟', '人生小伙三大过，赢过输过辉煌过', 'M', '1997-01-18', '广西-南宁', '0', '20171128', '1', '0', '0', '2017-11-27 20:06:05', '2017-12-04 21:57:34');
INSERT INTO `tb_user` VALUES ('20170007', 'gutianle', 'gutianle', '古天乐', 'gutianle@163.com', '201', '', '贪玩蓝月，等你来战！', 'M', null, '', '0', '20171129', '1', '0', '0', '2017-11-28 10:56:31', '2017-11-28 11:15:02');
INSERT INTO `tb_user` VALUES ('20170008', 'zhoudage', 'zhoudage', '窃格瓦拉', '617729682@qq.com', '202', '不打工的人', '打工是不可能打工的', 'M', null, '', '0', '20171130', '1', '0', '0', '2017-11-28 11:22:12', '2017-11-28 11:29:10');
INSERT INTO `tb_user` VALUES ('20170009', 'huangkai', 'huangkai', '一起哥哥', '617729682@qq.com', '10', '', 'hreherher', 'M', '2017-11-15', '', '0', '20171131', '1', '0', '0', '2017-11-28 16:05:54', '2017-11-28 16:09:59');
INSERT INTO `tb_user` VALUES ('20170010', 'hexing', 'hexing', '嚯星', '617729682@qq.com', '8', '学生', '认真复习，准备考研!!!', 'M', '1996-11-20', '四川', '0', '20171132', '1', '0', '0', '2017-11-28 16:17:59', '2017-11-30 15:40:46');
INSERT INTO `tb_user` VALUES ('20170011', 'fsdffewfew', '111111', 'fsdffewfew', '617729682@qq.com', '31', null, null, 'N', null, null, '0', null, '0', '0', '0', '2017-12-03 18:51:24', '2017-12-03 18:51:24');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `headline` varchar(30) NOT NULL COMMENT '标题',
  `user_id` int(11) NOT NULL COMMENT '作者',
  `picture` varchar(225) NOT NULL COMMENT '文章预览图',
  `category_id` int(11) NOT NULL COMMENT '文章类别',
  `comment_num` int(11) NOT NULL DEFAULT '0' COMMENT '被评论数',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热点新闻',
  `is_recom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `click_num` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `praise_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `picture` (`picture`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `art_category` (`id`),
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53196232 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('53196226', '大家好，我是古天乐（广告）', '20170007', '/ningmengtoutiao/op-plugin/umeditor1.2.3-utf8-jsp/jsp/upload/20171128/70121511838309073.jpg', '2', '2', '0', '0', '44', '2', '2017-11-28 11:14:25', '2017-11-28 11:14:25');
INSERT INTO `article` VALUES ('53196228', '打工是不可能打工的', '20170008', '', '14', '0', '0', '0', '0', '9999999', '2017-11-28 11:30:49', '2017-11-28 11:30:49');
INSERT INTO `article` VALUES ('53196231', '大家记住，千万别去打工了！', '20170008', '', '14', '0', '0', '0', '0', '1', '2017-11-28 11:39:23', '2017-11-28 11:39:23');

-- ----------------------------
-- Table structure for art_comment
-- ----------------------------
DROP TABLE IF EXISTS `art_comment`;
CREATE TABLE `art_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '评论的用户id',
  `art_id` int(11) NOT NULL COMMENT '被评论文章id',
  `content` varchar(200) NOT NULL COMMENT '评论内容',
  `praise_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `praise_users` text COMMENT '保存点过赞的用户列表',
  `gmt_create` datetime NOT NULL COMMENT '创建日期',
  `gmt_modified` datetime NOT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `idx_art_id` (`art_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `art_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of art_comment
-- ----------------------------
INSERT INTO `art_comment` VALUES ('1', '20170006', '53196226', '真的太好玩了！', '0', null, '2017-11-30 20:48:29', '2017-11-30 20:48:29');
INSERT INTO `art_comment` VALUES ('2', '20170010', '53196226', '好玩个锤子！', '0', null, '2017-11-30 20:49:14', '2017-11-30 20:49:14');

-- ----------------------------
-- Table structure for art_content
-- ----------------------------
DROP TABLE IF EXISTS `art_content`;
CREATE TABLE `art_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `content` longtext NOT NULL COMMENT '文章内容',
  `praise_users` text,
  PRIMARY KEY (`id`),
  KEY `idx_id` (`id`) USING BTREE,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53196232 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of art_content
-- ----------------------------
INSERT INTO `art_content` VALUES ('53196226', '<p>&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 18px;\">&nbsp; 大扎好，我系故天乐，给大家推荐一管超好玩的游戏。贪玩蓝月，全新版本，只需体验3分钟，泥就会杆我一样，爱上介管游戏。</span></p><p><img src=\"http://localhost:8080/ningmengtoutiao/newsupload/20171128/70121511838309073.jpg\"/><div></div></p><div></div><p></p><div></div><p></p><div></div><p><span id=\"_baidu_bookmark_start_38\" style=\"line-height: 0px; display: none;\">‍</span></p><p><img src=\"http://localhost:8080/ningmengtoutiao/newsupload/20171128/6641511838376194.jpg\"/><div></div></p><div></div><p></p><div></div><p></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style=\"font-size: 18px;\"><a href=\"http://www.code.361759.com/htmlcode/15452.html\" target=\"_blank\">贪玩蓝月，等你来战！</a>&nbsp;&lt;-点击进入，RMB双倍回收装备</span><span style=\"font-size: 18px;\"><br/></span></p><p></p><p></p><p></p><p></p><p></p><p></p>', '20170006,20170010');
INSERT INTO `art_content` VALUES ('53196228', '<span style=\"font-size:18px\">没有钱了 肯定要做啊 不做没有钱用 <span style=\"text-decoration:underline;\"><strong>打工是不可能打工的 这辈子不可能打工的</strong></span> 做生意又不会做 就是偷这种东西 才能维持的了生活这样子 进看守所感觉像回家一样 我一年回去 大年三十晚上都不回去 就平时家里出点事 就回去看看这样子 在看守所里的感觉比家里感觉好多了 在家里一个人好无聊</span><p></p>', '20170008');
INSERT INTO `art_content` VALUES ('53196231', '<p><span style=\"font-size:18px\">大家记住，千万别去打工了！</span></p><p><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://player.youku.com/player.php/sid/XMzA2MDEzOTcxNg/v.swf\" width=\"550\" height=\"450\" style=\"float: none\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></p>', '20170008');

