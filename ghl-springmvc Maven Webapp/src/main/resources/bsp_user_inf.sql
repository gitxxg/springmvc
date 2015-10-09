/*
Navicat MySQL Data Transfer

Source Server         : 172.20.29.43
Source Server Version : 50620
Source Host           : 172.20.29.43:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-09-30 16:20:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bsp_user_inf`
-- ----------------------------
DROP TABLE IF EXISTS `bsp_user_inf`;
CREATE TABLE `bsp_user_inf` (
  `INT_USER_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID，唯一',
  `INT_GROUP_ID` int(11) NOT NULL DEFAULT '1' COMMENT '组ID，范围1-99',
  `VC_USER_TYPE` varchar(1) NOT NULL DEFAULT '0' COMMENT '0：普通用户\r\n            1：个人开发者用户\r\n            2：企业开发者用户\r\n            3：内部用户',
  `VC_USERNAME` varchar(20) NOT NULL COMMENT '用户登录时填写的名字，一般不包含中文',
  `VC_PASSWORD` varchar(32) NOT NULL COMMENT '用户登录填写密码，加密后的数据，采用MD5进行32位加密',
  `VC_REALNAME` varchar(50) DEFAULT NULL COMMENT '一般填写用户真实姓名，默认为登录名。一些企业的名字可能较长',
  `VC_SEX_FLAG` varchar(1) DEFAULT NULL COMMENT '0、男\r\n            1，女',
  `VC_EMAIL_ADDR` varchar(100) DEFAULT NULL COMMENT '联系邮箱，长度100兼容一些特殊的长度较长的邮箱',
  `VC_TELEPHONE_NO` varchar(20) DEFAULT NULL COMMENT '用户手机号码',
  `DT_CREATE_TIME` datetime DEFAULT NULL COMMENT '用户注册的日期，精确到秒',
  `DT_UPDATE_TIME` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '用户资料更新的日期，精确到秒',
  `VC_USER_STATUS` varchar(1) DEFAULT '0' COMMENT '0：有效，用户正常登录\r\n            1：失效，用户登录无效',
  PRIMARY KEY (`INT_USER_ID`),
  UNIQUE KEY `AK_UKEY` (`VC_USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='记录用户的注册信息，建议ID范围1000-最大。会继承用户组的访问权限等';

-- ----------------------------
-- Records of bsp_user_inf
-- ----------------------------
INSERT INTO `bsp_user_inf` VALUES ('1', '1', '0', 'q', '65bb86549756830caa529e032f829eb2', 'q', '0', 'test@ericsson.com', '15013027315', '2015-07-31 11:09:56', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('2', '1', '0', 'w', '202cb962ac59075b964b07152d234b70', 'w', '0', 'test@ericsson.com', '15013027315', '2015-07-31 11:09:58', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('3', '0', '0', 'boss', '6fb7b7ae30076ce2fa273f272f9ec571', 'yd', '1', 'test@ericsson.com', '15013027315', '2015-07-31 11:10:01', '2015-09-28 16:55:02', '0');
INSERT INTO `bsp_user_inf` VALUES ('4', '0', '0', 'boss1', '23116c0bec46f9a55d8fc001288425e7', 'yd1222', '1', 'test@ericsson.com', '15013027315', '2015-07-31 11:10:03', '2015-09-28 16:55:03', '0');
INSERT INTO `bsp_user_inf` VALUES ('5', '0', '0', 'boss2', '123', 'yd2', '0', '432432423@11.com', '13000000000', '2015-07-31 11:10:06', '2015-09-30 15:52:56', '0');
INSERT INTO `bsp_user_inf` VALUES ('7', '0', '1', 'qqq', '931bd0e1cc9baae10e9ff6ca7002e834', 'qqq', '0', 'test@ericsson.com', '15013027315', '2015-07-31 11:10:10', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('8', '0', '1', 'ww', 'a87c9f7493e17b6aaa1b0ff155ce5765', 'www', '0', '1234432@qq.com', '15013027315', '2015-07-31 11:10:13', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('9', '1', '0', 'wqewqewq', 'be21d508dd00616351c2d1df55807b38', 'wewqewq', '0', 'test@ericsson.com', '15013027315', '1970-01-01 08:00:00', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('10', '0', '0', 'ewqewq', '0b999c2bfc260270471a200774107504', 'wewq', '0', 'test@ericsson.com', '15013027315', '2015-03-10 09:38:53', '2015-09-30 15:52:43', '0');
INSERT INTO `bsp_user_inf` VALUES ('11', '1', '0', 'wewqewqe', '6e188aab8e0b86f2858a7c7023966d05', 'wewq', '1', 'test@ericsson.com', '15013027315', '2015-03-10 00:00:00', '2015-09-30 15:41:48', '1');
INSERT INTO `bsp_user_inf` VALUES ('12', '2', '0', 'wqewqe', '69fdc3eb9d69b17a2544966c39f2638c', 'wewqew', '0', 'test@ericsson.com', '15013027315', '2015-03-10 00:00:00', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('13', '0', '3', 'fafe', '57591003edd3d1253f5271a20194df7b', 'asfas', '0', 'test@ericsson.com', '15013027315', '2015-03-10 11:10:16', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('14', '0', '3', 'fafaf', '085d218da92f87e71d1fc5069d839456', 'faefesa', '0', 'test@ericsson.com', '15013027315', '2015-03-10 11:20:04', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('15', '0', '3', 'fewaf', 'd866095c12410969eab26a0c30e2a23a', 'feaf', '0', 'test@ericsson.com', '15013027315', '2015-03-10 05:29:48', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('19', '1', '0', 'xb', '123', 'xb', '1', 'test@ericsson.com', '15013027315', '2015-07-31 11:10:16', '2015-09-28 16:55:04', '1');
INSERT INTO `bsp_user_inf` VALUES ('43', '0', '3', 'xb1', '7f106c2c1cb60275edebfeef64ff273e', 'xb1', '1', 'test@ericsson.com', '15013027315', '2015-03-19 00:00:00', '2015-09-28 16:55:04', '1');
INSERT INTO `bsp_user_inf` VALUES ('44', '2', '3', 'sx', '06e41f083083ab66449f424c10b83ae7', 'sx', '1', 'test@ericsson.com', '15013027315', '2015-03-25 00:00:00', '2015-09-28 16:55:05', '1');
INSERT INTO `bsp_user_inf` VALUES ('49', '0', '0', 'test', '05a671c66aefea124cc08b76ea6d30bb', 'test', '0', 'test@ericsson.com', '15013027315', '2015-05-22 11:22:31', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('50', '0', '3', 'boss33', '7862560d95c2c53b52c3d2e4df5c1099', 'ydddd', '1', 'test@ericsson.com', '15013027315', '2015-06-16 00:00:00', '2015-08-26 17:04:19', '1');
INSERT INTO `bsp_user_inf` VALUES ('51', '0', '0', 'boss5555', '151944a5fa4650ae506f194ed3ec3152', 'yd', '0', 'test@ericsson.com', '15013027315', '2015-06-16 15:08:35', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('53', '0', '3', 'boss123', '4b5859817b223dc0865d612f538c8862', 'yd', '0', 'test@ericsson.com', '15013027315', '2015-07-31 14:20:00', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('54', '0', '3', 'boss4444', '1924c97370b2ce99ff45067926a2e3ce', 'yd', '1', 'test@ericsson.com', '15013027315', '2015-08-26 17:05:23', '2015-08-26 17:04:35', '1');
INSERT INTO `bsp_user_inf` VALUES ('59', '0', '3', 'dsfdsf', 'd9fe26653c1158e74168f0eff08af123', 'ss', '1', 'test@ericsson.com', '15013027315', '2015-08-07 00:00:00', '2015-09-28 16:55:07', '1');
INSERT INTO `bsp_user_inf` VALUES ('60', '0', '3', 'password', 'da9426d6e7c3527dfffd402dfc4ebe19', 'passwordfefaewf', '1', 'test@ericsson.com', '15013027315', '2015-08-26 17:05:21', '2015-08-26 17:04:31', '1');
INSERT INTO `bsp_user_inf` VALUES ('62', '0', '0', 'xxg', '123456', 'xxg', '0', 'test@ericsson.com', '15013027315', '2015-08-26 17:05:19', '2015-09-28 16:54:54', '0');
INSERT INTO `bsp_user_inf` VALUES ('77', '0', '3', '广州test', 'cea031bc233234fbd706f09d8e3f1a91', '广州test', '0', 'test@ericsson.com', '15013027315', '2015-08-19 11:46:20', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('79', '0', '0', 'test89898989', '10255e973b6209b383525da96b2ce555', 'test345', '0', '11111test@ericsson.com', '15013027315', '2015-08-19 15:40:00', '2015-09-29 16:49:40', '1');
INSERT INTO `bsp_user_inf` VALUES ('80', '0', '2', '广州爱立信', '6fe0d495736b15bf80e4b12838448283', '广州爱立信', '0', 'test@ericsson.com', '15013027315', '2015-08-19 16:17:28', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('81', '0', '1', '111233', '1a55c37e311e7d20c91901d64f7de98b', '333', '0', 'test@ericsson.com', '15013027315', '2015-08-20 10:52:30', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('84', '0', '3', '额鹅鹅鹅', 'e86891eac39d2af9c00416242a49449a', 'test', '0', 'test@ericsson.com', '15013027315', '2015-08-26 09:21:23', '2015-09-28 16:54:54', '1');
INSERT INTO `bsp_user_inf` VALUES ('104', '1', '0', 'qqqqqqq', 'qqqq', 'qqqq', '1', 'test@ericsson.com', 'qqqqqqq', '2015-09-29 16:52:37', '2015-09-29 16:51:48', '0');
INSERT INTO `bsp_user_inf` VALUES ('107', '1', '0', 'aaaa', '123', 'aaa', '1', 'fewfw@163.com', '15013027315', '2015-09-29 17:02:54', '2015-09-30 10:18:38', '0');
