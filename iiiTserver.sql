/*
 Navicat MySQL Data Transfer

 Source Server         : 阿里云
 Source Server Version : 50173
 Source Host           : 115.28.8.74
 Source Database       : ihb

 Target Server Version : 50173
 File Encoding         : utf-8

 Date: 09/03/2016 21:19:39 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `answerid` int(11) NOT NULL COMMENT '回答编号',
  `content` varchar(120) NOT NULL COMMENT '内容',
  `createtime` varchar(32) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`questionid`,`answerid`),
  CONSTRAINT `FK_qa` FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回答';

-- ----------------------------
--  Table structure for `answerimg`
-- ----------------------------
DROP TABLE IF EXISTS `answerimg`;
CREATE TABLE `answerimg` (
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `answerid` int(11) NOT NULL COMMENT '回答编号',
  `aimgid` int(11) NOT NULL COMMENT '回答图片编号',
  `imglink` varchar(120) DEFAULT NULL COMMENT '图片跳转',
  `imgsrc` varchar(120) NOT NULL COMMENT '图片链接',
  PRIMARY KEY (`questionid`,`answerid`,`aimgid`),
  CONSTRAINT `FK_answerimg` FOREIGN KEY (`questionid`, `answerid`) REFERENCES `answer` (`questionid`, `answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `collectcourse`
-- ----------------------------
DROP TABLE IF EXISTS `collectcourse`;
CREATE TABLE `collectcourse` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`courseid`),
  KEY `FK_collectcourse2` (`courseid`),
  CONSTRAINT `FK_collectcourse2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_collectcourse` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏课程';

-- ----------------------------
--  Table structure for `collectquestion`
-- ----------------------------
DROP TABLE IF EXISTS `collectquestion`;
CREATE TABLE `collectquestion` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`questionid`),
  KEY `FK_collectquestion2` (`questionid`),
  CONSTRAINT `FK_collectquestion2` FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`),
  CONSTRAINT `FK_collectquestion` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏问题';

-- ----------------------------
--  Table structure for `collectskill`
-- ----------------------------
DROP TABLE IF EXISTS `collectskill`;
CREATE TABLE `collectskill` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `skillid` int(11) NOT NULL COMMENT '技巧编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`skillid`),
  KEY `FK_collectskill2` (`skillid`),
  CONSTRAINT `FK_collectskill2` FOREIGN KEY (`skillid`) REFERENCES `skill` (`skillid`),
  CONSTRAINT `FK_collectskill` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏技巧';

-- ----------------------------
--  Table structure for `commimg`
-- ----------------------------
DROP TABLE IF EXISTS `commimg`;
CREATE TABLE `commimg` (
  `cimgid` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `imgsrc` varchar(120) DEFAULT NULL COMMENT '图片链接',
  PRIMARY KEY (`cimgid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='交流图片';

-- ----------------------------
--  Records of `commimg`
-- ----------------------------
BEGIN;
INSERT INTO `commimg` VALUES ('1', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468897409616-tag-new.png'), ('2', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468897432187-client.jpg'), ('3', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468897496234-client.jpg'), ('4', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468898206449-client.jpg'), ('5', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468898242723-client.jpg'), ('6', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468898419928-client.jpg'), ('7', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468899427223-client.jpg'), ('8', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468899433695-client.jpg'), ('9', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468899976567-client.jpg'), ('10', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468906588017-client.jpg'), ('11', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468906612603-client.jpg'), ('12', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468916628149-client.jpg'), ('13', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468916641961-client.jpg'), ('14', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468916663297-client.jpg'), ('15', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020103387-client.jpg'), ('16', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020296852-client.jpg'), ('17', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020326862-client.jpg'), ('18', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469069754042-client.jpg'), ('19', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1472466700263-client.jpg'), ('20', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471499511-client.jpg'), ('21', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471520429-client.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `communion`
-- ----------------------------
DROP TABLE IF EXISTS `communion`;
CREATE TABLE `communion` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `com_communionid` int(11) DEFAULT NULL,
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `content` varchar(120) NOT NULL,
  `communionid` int(11) NOT NULL AUTO_INCREMENT,
  `images` varchar(320) NOT NULL,
  `communiontypeid` int(32) NOT NULL,
  `title` varchar(32) NOT NULL COMMENT '标题',
  PRIMARY KEY (`communionid`),
  KEY `FK_Relationship_10` (`com_communionid`),
  KEY `FK_Relationship_11` (`userid`),
  KEY `FK_Relationship_12` (`communiontypeid`),
  CONSTRAINT `FK_Relationship_10` FOREIGN KEY (`com_communionid`) REFERENCES `communion` (`communionid`),
  CONSTRAINT `FK_Relationship_11` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_12` FOREIGN KEY (`communiontypeid`) REFERENCES `communiontypes` (`communiontypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='交流';

-- ----------------------------
--  Records of `communion`
-- ----------------------------
BEGIN;
INSERT INTO `communion` VALUES ('1', null, '2016-07-09 12:00:00', 'dsadsadsadasdas', '1', '', '1', ''), ('1', null, '2016-07-19 11:20:21', 'Ddddd', '2', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468898419928-client.jpg', '1', 'Sdasdasd'), ('1', null, '2016-07-19 11:37:16', 'Ggggggg', '3', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468899427223-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468899433695-client.jpg', '1', 'Gggggg'), ('1', null, '2016-07-19 11:46:17', 'Dasdasdasdasd', '4', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468899427223-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468899433695-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468899976567-client.jpg', '1', 'Gggg'), ('1', '4', '2016-07-19 13:36:29', 'Dsadsadsadas', '5', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468906588017-client.jpg', '1', ''), ('1', '4', '2016-07-19 13:36:53', 'Fasdsadasdasdsa', '6', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468906612603-client.jpg', '1', ''), ('1', '4', '2016-07-19 13:42:56', 'Dsadsada', '7', '', '1', ''), ('1', '4', '2016-07-19 13:43:01', 'Fgggggg', '8', '', '1', ''), ('1', '4', '2016-07-19 13:43:06', 'Ggghhhhhh', '9', '', '1', ''), ('1', '4', '2016-07-19 13:48:58', 'Kkkk', '10', '', '1', ''), ('1', '4', '2016-07-19 13:49:04', 'Cvvvvv', '11', '', '1', ''), ('1', null, '2016-07-19 16:23:50', 'Hhhhhh', '12', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468916628149-client.jpg', '2', 'Hhhh'), ('1', '12', '2016-07-19 16:24:02', 'Jjjjjjjj', '13', '', '2', ''), ('1', '12', '2016-07-19 16:24:27', 'Dasdasdsa', '14', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468916663297-client.jpg', '2', ''), ('1', null, '2016-07-20 21:08:25', 'Sadasdsadsa', '16', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020103387-client.jpg', '2', 'Ddd'), ('2', '16', '2016-07-20 21:11:38', 'hhenhao ', '17', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020296852-client.jpg', '2', ''), ('2', '12', '2016-07-20 21:12:08', 'Fdfafafafasfas', '18', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020326862-client.jpg', '2', ''), ('2', '16', '2016-07-20 21:24:35', 'Uuuu', '19', '', '2', ''), ('2', '16', '2016-07-20 21:26:12', 'Hhhhhhkmmm', '20', '', '2', ''), ('2', '3', '2016-07-20 21:28:54', 'Olllhhhhhhhh', '21', '', '1', ''), ('2', '12', '2016-07-21 10:55:56', 'Ffffffffffff', '22', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469069754042-client.jpg', '2', ''), ('2', '16', '2016-08-29 19:51:41', 'Dsadasd', '23', 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471499511-client.jpg', '2', '');
COMMIT;

-- ----------------------------
--  Table structure for `communioncollect`
-- ----------------------------
DROP TABLE IF EXISTS `communioncollect`;
CREATE TABLE `communioncollect` (
  `communionid` int(11) NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`communionid`,`userid`),
  KEY `FK_communioncollect2` (`userid`),
  CONSTRAINT `FK_communioncollect2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_communioncollect` FOREIGN KEY (`communionid`) REFERENCES `communion` (`communionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交流收藏';

-- ----------------------------
--  Records of `communioncollect`
-- ----------------------------
BEGIN;
INSERT INTO `communioncollect` VALUES ('4', '1', '2016-07-21 10:33:40'), ('12', '2', '2016-07-21 10:33:40'), ('16', '2', '2016-08-29 19:51:48');
COMMIT;

-- ----------------------------
--  Table structure for `communionpraise`
-- ----------------------------
DROP TABLE IF EXISTS `communionpraise`;
CREATE TABLE `communionpraise` (
  `communionid` int(11) NOT NULL,
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`communionid`,`userid`),
  KEY `FK_communionpraise2` (`userid`),
  CONSTRAINT `FK_communionpraise2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_communionpraise` FOREIGN KEY (`communionid`) REFERENCES `communion` (`communionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交流赞';

-- ----------------------------
--  Records of `communionpraise`
-- ----------------------------
BEGIN;
INSERT INTO `communionpraise` VALUES ('5', '1', '2016-07-20 12:53:47'), ('6', '1', '2016-07-20 12:53:47'), ('7', '1', '2016-07-19 14:45:55'), ('7', '2', null), ('8', '2', '2016-07-19 14:46:03'), ('13', '2', '2016-07-20 15:08:15'), ('14', '2', '2016-07-20 15:08:19'), ('17', '2', '2016-07-20 21:27:58'), ('20', '2', '2016-07-20 21:27:39'), ('21', '2', '2016-07-20 21:29:02');
COMMIT;

-- ----------------------------
--  Table structure for `communiontypes`
-- ----------------------------
DROP TABLE IF EXISTS `communiontypes`;
CREATE TABLE `communiontypes` (
  `communiontypeid` int(11) NOT NULL,
  `communiontype` varchar(32) NOT NULL,
  PRIMARY KEY (`communiontypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交流类型';

-- ----------------------------
--  Records of `communiontypes`
-- ----------------------------
BEGIN;
INSERT INTO `communiontypes` VALUES ('1', '前端'), ('2', '后端');
COMMIT;

-- ----------------------------
--  Table structure for `component`
-- ----------------------------
DROP TABLE IF EXISTS `component`;
CREATE TABLE `component` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `componnentid` int(11) NOT NULL,
  `componentinner` varchar(32) NOT NULL,
  KEY `FK_Relationship_8` (`courseid`),
  KEY `FK_Relationship_9` (`userid`),
  CONSTRAINT `FK_Relationship_9` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_Relationship_8` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
--  Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `cateid` int(11) NOT NULL,
  `coursetitle` varchar(32) NOT NULL COMMENT '课程标题',
  `videourl` varchar(120) NOT NULL COMMENT '视频地址',
  `coursetype` int(11) NOT NULL COMMENT '视频类型',
  `courseshowimg` varchar(120) NOT NULL COMMENT '视频展示图',
  `coursestate` int(11) NOT NULL COMMENT '1,new,2 hot,3 common  视频状态',
  `needpay` int(11) NOT NULL COMMENT '1 是 2 不是 是否收费',
  `coursedetail` varchar(120) NOT NULL COMMENT '视频详情',
  PRIMARY KEY (`courseid`),
  KEY `FK_cateandcourse` (`cateid`),
  CONSTRAINT `FK_cateandcourse` FOREIGN KEY (`cateid`) REFERENCES `coursecate` (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
--  Records of `course`
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES ('2', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/6/4/11/video1433389218406468.mp4', '1', 'http://img02.yohoboys.com/contentimg/2015/06/04/11/020b5772810e1d66ad27f872c0a521d28a.jpg', '1', '0', '好好'), ('3', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '2', '1', '好好'), ('4', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '3', '1', '好好'), ('5', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '4', '1', '好好'), ('6', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '5', '1', '好好'), ('7', '2', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '6', '1', '好好'), ('8', '1', '使用powerdesign设计数据库', 'http://video.yohoboys.com/2015/3/23/10/video1427079440061198.mp4', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '7', '0', '好好'), ('9', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z8.glb.cloudd', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '8', '0', '好好'), ('10', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z9.glb.cloudd', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '9', '0', '好好'), ('11', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z10.glb.cloud', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '10', '0', '好好'), ('12', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z11.glb.cloud', '1', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '11', '0', '好好'), ('13', '0', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z12.glb.cloud', '12', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '12', '0', '好好'), ('14', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z13.glb.cloud', '13', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '13', '0', '好好'), ('15', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z14.glb.cloud', '14', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '14', '0', '好好'), ('16', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z15.glb.cloud', '15', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '15', '0', '好好'), ('17', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z16.glb.cloud', '16', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '16', '0', '好好'), ('18', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z17.glb.cloud', '17', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '17', '0', '好好'), ('19', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z18.glb.cloud', '18', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '18', '0', '好好'), ('20', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z19.glb.cloud', '19', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '19', '0', '好好'), ('21', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z20.glb.cloud', '20', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '20', '0', '好好'), ('22', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z21.glb.cloud', '21', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '21', '0', '好好'), ('23', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z22.glb.cloud', '22', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '22', '0', '好好'), ('24', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z23.glb.cloud', '23', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '23', '0', '好好'), ('25', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z24.glb.cloud', '24', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '24', '0', '好好'), ('26', '1', '使用powerdesign设计数据库', 'http://7xuwbb.com1.z25.glb.cloud', '25', 'http://img01.yohoboys.com/contentimg/2015/03/23/11/01b5968105c53075d2b35f0040aa466772.jpg', '25', '0', '好好');
COMMIT;

-- ----------------------------
--  Table structure for `coursecate`
-- ----------------------------
DROP TABLE IF EXISTS `coursecate`;
CREATE TABLE `coursecate` (
  `cateid` int(11) NOT NULL,
  `catname` varchar(32) NOT NULL,
  PRIMARY KEY (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程分类';

-- ----------------------------
--  Records of `coursecate`
-- ----------------------------
BEGIN;
INSERT INTO `coursecate` VALUES ('0', '专题'), ('1', '前端'), ('2', '后端');
COMMIT;

-- ----------------------------
--  Table structure for `coursetag`
-- ----------------------------
DROP TABLE IF EXISTS `coursetag`;
CREATE TABLE `coursetag` (
  `tagsid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`tagsid`,`courseid`),
  KEY `FK_coursetag2` (`courseid`),
  CONSTRAINT `FK_coursetag2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_coursetag` FOREIGN KEY (`tagsid`) REFERENCES `tags` (`tagsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程标签';

-- ----------------------------
--  Table structure for `coursewatch`
-- ----------------------------
DROP TABLE IF EXISTS `coursewatch`;
CREATE TABLE `coursewatch` (
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`courseid`,`userid`),
  KEY `FK_coursewatch2` (`userid`),
  CONSTRAINT `FK_coursewatch2` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_coursewatch` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户课程查看';

-- ----------------------------
--  Table structure for `discoverbanner`
-- ----------------------------
DROP TABLE IF EXISTS `discoverbanner`;
CREATE TABLE `discoverbanner` (
  `bannerid` int(11) NOT NULL COMMENT 'banner编号',
  PRIMARY KEY (`bannerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发现banner';

-- ----------------------------
--  Table structure for `discoverothers`
-- ----------------------------
DROP TABLE IF EXISTS `discoverothers`;
CREATE TABLE `discoverothers` (
  `discoverothersid` int(11) NOT NULL COMMENT '发现其他编号',
  PRIMARY KEY (`discoverothersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发现其他';

-- ----------------------------
--  Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `messageid` int(11) NOT NULL COMMENT '消息编号',
  PRIMARY KEY (`userid`,`messageid`),
  CONSTRAINT `FK_user_message` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消息';

-- ----------------------------
--  Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsid` int(11) NOT NULL,
  PRIMARY KEY (`newsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻';

-- ----------------------------
--  Table structure for `pubskill`
-- ----------------------------
DROP TABLE IF EXISTS `pubskill`;
CREATE TABLE `pubskill` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `skillid` int(11) NOT NULL COMMENT '技巧编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`skillid`),
  KEY `FK_pubskill2` (`skillid`),
  CONSTRAINT `FK_pubskill2` FOREIGN KEY (`skillid`) REFERENCES `skill` (`skillid`),
  CONSTRAINT `FK_pubskill` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发布的技巧';

-- ----------------------------
--  Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `content` varchar(120) NOT NULL COMMENT '内容',
  `createtime` varchar(32) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题';

-- ----------------------------
--  Table structure for `questionimages`
-- ----------------------------
DROP TABLE IF EXISTS `questionimages`;
CREATE TABLE `questionimages` (
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `qimgid` int(11) NOT NULL COMMENT '图片编号',
  `imgsrc` varchar(120) NOT NULL COMMENT '图片链接',
  `imglink` varchar(120) DEFAULT NULL COMMENT '图片跳转',
  PRIMARY KEY (`questionid`,`qimgid`),
  CONSTRAINT `FK_questionimg` FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题图片集';

-- ----------------------------
--  Table structure for `skill`
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill` (
  `skillid` int(11) NOT NULL AUTO_INCREMENT COMMENT '技巧编号',
  `title` varchar(32) NOT NULL COMMENT '标题',
  `content` varchar(120) NOT NULL COMMENT '内容',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `skilltypeid` int(11) NOT NULL COMMENT '类型',
  `skillimages` varchar(320) DEFAULT '' COMMENT '技巧图片',
  PRIMARY KEY (`skillid`),
  KEY `FK_skillandskilltype` (`skilltypeid`),
  CONSTRAINT `FK_skillandskilltype` FOREIGN KEY (`skilltypeid`) REFERENCES `skilltype` (`skilltypeid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='技巧';

-- ----------------------------
--  Records of `skill`
-- ----------------------------
BEGIN;
INSERT INTO `skill` VALUES ('14', 'Dsadas', 'Dsadasdsadsa', '2016-07-18 16:42:23', '1', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831341137-client.jpg'), ('15', 'Jjkkkkkkkk', 'Dasdasdasdasdsa', '2016-07-18 16:46:31', '2', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831575938-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468831584404-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468831589849-client.jpg'), ('16', 'Sadsadsadsa', 'Dsadsadsadsada', '2016-07-18 18:19:46', '2', 'http://7xuwbb.com1.z0.glb.clouddn.com/1468837161374-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468837168385-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468837174913-client.jpg,http://7xuwbb.com1.z0.glb.clouddn.com/1468837180659-client.jpg'), ('17', 'Asddas', 'Dasdasdas', '2016-07-20 21:07:33', '2', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020051556-client.jpg'), ('18', 'Ffff', 'Ffffff', '2016-07-21 10:56:33', '2', 'http://7xuwbb.com1.z0.glb.clouddn.com/1469069791228-client.jpg'), ('19', 'Fffff', 'Sadasdasda', '2016-08-29 19:51:10', '1', 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471438404-client.jpg'), ('20', 'Fffff', 'Sadasdasda', '2016-08-29 19:51:10', '1', 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471438404-client.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `skillimg`
-- ----------------------------
DROP TABLE IF EXISTS `skillimg`;
CREATE TABLE `skillimg` (
  `skillimgid` int(11) NOT NULL AUTO_INCREMENT,
  `imglink` varchar(120) DEFAULT NULL COMMENT '图片跳转',
  `imgsrc` varchar(120) DEFAULT NULL COMMENT '图片链接',
  PRIMARY KEY (`skillimgid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='技巧图片';

-- ----------------------------
--  Records of `skillimg`
-- ----------------------------
BEGIN;
INSERT INTO `skillimg` VALUES ('59', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831341137-client.jpg'), ('60', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831575938-client.jpg'), ('61', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831584404-client.jpg'), ('62', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468831589849-client.jpg'), ('63', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468837161374-client.jpg'), ('64', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468837168385-client.jpg'), ('65', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468837174913-client.jpg'), ('66', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1468837180659-client.jpg'), ('67', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469020051556-client.jpg'), ('68', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1469069791228-client.jpg'), ('69', null, 'http://7xuwbb.com1.z0.glb.clouddn.com/1472471438404-client.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `skilltype`
-- ----------------------------
DROP TABLE IF EXISTS `skilltype`;
CREATE TABLE `skilltype` (
  `skilltypeid` int(11) NOT NULL,
  `skilltype` varchar(32) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`skilltypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技巧类型';

-- ----------------------------
--  Records of `skilltype`
-- ----------------------------
BEGIN;
INSERT INTO `skilltype` VALUES ('1', '前端'), ('2', '后端');
COMMIT;

-- ----------------------------
--  Table structure for `tags`
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `tagsid` int(11) NOT NULL,
  `tagname` varchar(32) NOT NULL,
  PRIMARY KEY (`tagsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类标签';

-- ----------------------------
--  Table structure for `ucprise`
-- ----------------------------
DROP TABLE IF EXISTS `ucprise`;
CREATE TABLE `ucprise` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `courseid` int(11) NOT NULL COMMENT '课程编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`courseid`),
  KEY `FK_ucprise2` (`courseid`),
  CONSTRAINT `FK_ucprise2` FOREIGN KEY (`courseid`) REFERENCES `course` (`courseid`),
  CONSTRAINT `FK_ucprise` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户课程赞';

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `useraccount` varchar(32) NOT NULL COMMENT '用户账号',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `userpwd` varchar(32) NOT NULL COMMENT '用户密码',
  `useravator` varchar(120) DEFAULT NULL COMMENT '用户密码',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '15366195793', 'aa', '123', 'http://img0.imgtn.bdimg.com/it/u=3436011882,2118501550&fm=21&gp=0.jpg'), ('2', '15366195791', 'bb', 'e10adc3949ba59abbe56e057f20f883e', 'http://img0.imgtn.bdimg.com/it/u=3436011882,2118501550&fm=21&gp=0.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `useranswer`
-- ----------------------------
DROP TABLE IF EXISTS `useranswer`;
CREATE TABLE `useranswer` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `answerid` int(11) NOT NULL COMMENT '回答编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`questionid`,`userid`,`answerid`),
  KEY `FK_useranswer` (`userid`),
  KEY `FK_useranswer2` (`questionid`,`answerid`),
  CONSTRAINT `FK_useranswer2` FOREIGN KEY (`questionid`, `answerid`) REFERENCES `answer` (`questionid`, `answerid`),
  CONSTRAINT `FK_useranswer` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的回答';

-- ----------------------------
--  Table structure for `userprise`
-- ----------------------------
DROP TABLE IF EXISTS `userprise`;
CREATE TABLE `userprise` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `skillid` int(11) NOT NULL COMMENT '技巧编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`skillid`),
  KEY `FK_userprise2` (`skillid`),
  CONSTRAINT `FK_userprise2` FOREIGN KEY (`skillid`) REFERENCES `skill` (`skillid`),
  CONSTRAINT `FK_userprise` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='技巧赞';

-- ----------------------------
--  Table structure for `userquestion`
-- ----------------------------
DROP TABLE IF EXISTS `userquestion`;
CREATE TABLE `userquestion` (
  `userid` int(11) NOT NULL COMMENT '用户编号',
  `use_userid` int(11) NOT NULL COMMENT '用户编号',
  `questionid` int(11) NOT NULL COMMENT '问题编号',
  `createtime` varchar(32) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userid`,`use_userid`,`questionid`),
  KEY `FK_userquestion2` (`use_userid`),
  KEY `FK_userquestion3` (`questionid`),
  CONSTRAINT `FK_userquestion3` FOREIGN KEY (`questionid`) REFERENCES `question` (`questionid`),
  CONSTRAINT `FK_userquestion` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `FK_userquestion2` FOREIGN KEY (`use_userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我的提问';

SET FOREIGN_KEY_CHECKS = 1;
