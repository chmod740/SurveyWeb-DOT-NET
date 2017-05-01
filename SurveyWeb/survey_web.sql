/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : survey_web

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-01 21:55:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for array
-- ----------------------------
DROP TABLE IF EXISTS `array`;
CREATE TABLE `array` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of array
-- ----------------------------
INSERT INTO `array` VALUES ('37', 'nc5qvgwrxjs6a5boxvc1lqq1', '6', '1');
INSERT INTO `array` VALUES ('38', '41ky9fi9255h95cyghk82ebk', '6', '1');
INSERT INTO `array` VALUES ('39', 'yxw054vc53hyv1a83y3yrhwr', '6', '1');
INSERT INTO `array` VALUES ('40', 'plo7ugwvhwa9808x34iue9x1', '6', '1');
INSERT INTO `array` VALUES ('41', 'cuv8nmgj1sk3ul3e7930wfsi', '6', '1');
INSERT INTO `array` VALUES ('42', 'iicxn106yjubek39srrseqw5', '6', '1');
INSERT INTO `array` VALUES ('43', '5sa1k9kmt80b44ycas1f9cw0', '6', '1');
INSERT INTO `array` VALUES ('44', '6f5u1oxfymvn3ir9jm2nbk45', '6', '1');
INSERT INTO `array` VALUES ('45', '2gt9hbihpgfufnplqssf2va7', '6', '1');
INSERT INTO `array` VALUES ('46', 'd05w45py8l6r78x35uyvw3cx', '6', '1');
INSERT INTO `array` VALUES ('47', 'bbdqv5gstcyk0vo6ggllhmig', '6', '1');
INSERT INTO `array` VALUES ('48', '148q0em2p3k2tpphimlrr5v0', '6', '1');
INSERT INTO `array` VALUES ('49', 'quhct7qqq0sp4dtuxyy36jh9', '6', '1');
INSERT INTO `array` VALUES ('50', '1gywjum2odxkogv19bs038vp', '6', '1');
INSERT INTO `array` VALUES ('51', 'vsknoqxst86n7gy9f1xv4b1b', '6', '1');
INSERT INTO `array` VALUES ('52', '9tfhu1d8tc6u327tsivyvbe5', '6', '1');
INSERT INTO `array` VALUES ('53', 'uldv4dga8dl06qsqrqhluxp1', '6', '1');
INSERT INTO `array` VALUES ('54', 'jw2q82c68infyxretoogft64', '6', '1');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES ('10', '1', '127.0.0.1', '2017-04-05 16:20:53');
INSERT INTO `login_log` VALUES ('11', '1', '127.0.0.1', '2017-04-05 16:21:08');
INSERT INTO `login_log` VALUES ('12', '1', '127.0.0.1', '2017-04-05 16:26:12');
INSERT INTO `login_log` VALUES ('13', '1', '127.0.0.1', '2017-04-05 16:26:25');
INSERT INTO `login_log` VALUES ('14', '1', '127.0.0.1', '2017-04-05 16:28:56');
INSERT INTO `login_log` VALUES ('15', '1', '127.0.0.1', '2017-04-05 16:31:57');
INSERT INTO `login_log` VALUES ('16', '1', '127.0.0.1', '2017-04-05 19:44:37');
INSERT INTO `login_log` VALUES ('17', '1', '127.0.0.1', '2017-04-05 20:11:22');
INSERT INTO `login_log` VALUES ('18', '1', '127.0.0.1', '2017-04-05 20:18:40');
INSERT INTO `login_log` VALUES ('19', '1', '127.0.0.1', '2017-04-05 20:52:55');
INSERT INTO `login_log` VALUES ('20', '1', '127.0.0.1', '2017-04-06 12:30:59');
INSERT INTO `login_log` VALUES ('21', '1', '127.0.0.1', '2017-04-09 13:58:02');
INSERT INTO `login_log` VALUES ('22', '1', '127.0.0.1', '2017-04-22 20:11:18');
INSERT INTO `login_log` VALUES ('23', '1', '127.0.0.1', '2017-04-22 20:40:20');
INSERT INTO `login_log` VALUES ('24', '1', '127.0.0.1', '2017-04-29 15:31:28');
INSERT INTO `login_log` VALUES ('25', '1', '127.0.0.1', '2017-04-30 21:50:58');
INSERT INTO `login_log` VALUES ('26', '1', '127.0.0.1', '2017-05-01 08:48:40');
INSERT INTO `login_log` VALUES ('27', '1', '127.0.0.1', '2017-05-01 16:39:42');
INSERT INTO `login_log` VALUES ('28', '1', '127.0.0.1', '2017-05-01 18:29:35');
INSERT INTO `login_log` VALUES ('29', '1', '127.0.0.1', '2017-05-01 18:53:29');
INSERT INTO `login_log` VALUES ('30', '1', '127.0.0.1', '2017-05-01 19:14:47');
INSERT INTO `login_log` VALUES ('31', '1', '127.0.0.1', '2017-05-01 19:41:05');

-- ----------------------------
-- Table structure for opt
-- ----------------------------
DROP TABLE IF EXISTS `opt`;
CREATE TABLE `opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `click` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of opt
-- ----------------------------
INSERT INTO `opt` VALUES ('1', '1', '答案1', '0');
INSERT INTO `opt` VALUES ('2', '1', '答案2', '0');
INSERT INTO `opt` VALUES ('3', '1', '答案3', '0');
INSERT INTO `opt` VALUES ('4', '1', '答案4', '0');
INSERT INTO `opt` VALUES ('5', '2', '答案5', '0');
INSERT INTO `opt` VALUES ('6', '2', '答案6', '0');
INSERT INTO `opt` VALUES ('7', '2', '答案7', '0');
INSERT INTO `opt` VALUES ('8', '2', '答案8', '0');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '6', '题目1', '1', '1');
INSERT INTO `question` VALUES ('2', '6', '题目2', '1', '2');

-- ----------------------------
-- Table structure for survey
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of survey
-- ----------------------------
INSERT INTO `survey` VALUES ('6', '问卷1', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `privilege` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123', '0000000001');
