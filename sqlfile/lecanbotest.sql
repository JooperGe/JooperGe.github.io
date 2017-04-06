/*
Navicat MySQL Data Transfer

Source Server         : 192.168.8.213
Source Server Version : 50626
Source Host           : 192.168.8.213:3306
Source Database       : lecanbotest

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-04-06 19:00:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_code`;
CREATE TABLE `tbl_activity_code` (
  `code` char(16) NOT NULL COMMENT '激活码',
  `card_id` int(11) NOT NULL COMMENT '激活码所在 卡号',
  `type` tinyint(1) DEFAULT NULL COMMENT '激活码类型\n',
  `status` tinyint(1) DEFAULT '0' COMMENT '激活码状态\n0-未使用\n1-已经使用',
  `valid_time` int(11) DEFAULT '0' COMMENT '激活码标识时间段',
  `expird_date` datetime DEFAULT '9999-12-31 23:59:59' COMMENT '激活码过期时间',
  PRIMARY KEY (`code`,`card_id`),
  UNIQUE KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活码表';

-- ----------------------------
-- Table structure for tbl_album_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_album_info`;
CREATE TABLE `tbl_album_info` (
  `album_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) NOT NULL COMMENT '相册名称',
  `is_private` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否私有（0 私有 1公开）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_child_advert
-- ----------------------------
DROP TABLE IF EXISTS `tbl_child_advert`;
CREATE TABLE `tbl_child_advert` (
  `advert_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image1` varchar(37) DEFAULT NULL,
  `link1` varchar(100) DEFAULT NULL,
  `image2` varchar(37) DEFAULT NULL,
  `link2` varchar(100) DEFAULT NULL,
  `image3` varchar(37) DEFAULT NULL,
  `link3` varchar(100) DEFAULT NULL,
  `image4` varchar(37) DEFAULT NULL,
  `link4` varchar(100) DEFAULT NULL,
  `image5` varchar(37) DEFAULT NULL,
  `link5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_employee_task
-- ----------------------------
DROP TABLE IF EXISTS `tbl_employee_task`;
CREATE TABLE `tbl_employee_task` (
  `task_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `op_id` bigint(11) NOT NULL COMMENT '员工id',
  `service_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '服务时间',
  `address` varchar(60) DEFAULT NULL,
  `lng` double(19,16) DEFAULT NULL COMMENT '经度',
  `lat` double(19,16) DEFAULT NULL COMMENT '纬度',
  `memb_info` varchar(500) DEFAULT NULL COMMENT '客户信息（手机号和姓名之间逗号隔开，客户之间分号隔开）',
  `appt_time` timestamp NULL DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL COMMENT '备注',
  `ttype_id` bigint(11) NOT NULL COMMENT '0 家访  1 发礼品 2 其他活动',
  `image_id` varchar(37) DEFAULT NULL COMMENT '图片',
  `image_type` tinyint(1) DEFAULT NULL COMMENT '0 竖屏 1 横屏',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `task_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 预约 1 未提交 2 完成',
  PRIMARY KEY (`task_id`),
  KEY `fk_task_operator` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_expr_answer
-- ----------------------------
DROP TABLE IF EXISTS `tbl_expr_answer`;
CREATE TABLE `tbl_expr_answer` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(11) NOT NULL,
  `doctor_name` varchar(32) NOT NULL,
  `title` varchar(100) NOT NULL,
  `track_length` int(8) NOT NULL COMMENT '音频长度',
  `radio_url` varchar(200) NOT NULL,
  `record_time` date DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  `creator` bigint(11) NOT NULL COMMENT '创建人',
  `operator` bigint(11) NOT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='医生音频回复';

-- ----------------------------
-- Table structure for tbl_expr_answer_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_expr_answer_tag`;
CREATE TABLE `tbl_expr_answer_tag` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `ansr_id` bigint(11) NOT NULL,
  `tag_id` bigint(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `idx_uk_note_tag` (`ansr_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8 COMMENT='医生回答标签关联表';

-- ----------------------------
-- Table structure for tbl_expr_doctor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_expr_doctor`;
CREATE TABLE `tbl_expr_doctor` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `doctor_name` varchar(16) NOT NULL,
  `doctor_head` varchar(200) NOT NULL,
  `doctor_postion` varchar(32) NOT NULL,
  `hospital_id` bigint(11) DEFAULT NULL,
  `hospital` varchar(100) NOT NULL,
  `department` varchar(32) NOT NULL,
  `introduce` varchar(200) DEFAULT NULL COMMENT '音频介绍mp3',
  `track_length` int(8) DEFAULT NULL COMMENT '音频长度',
  `weight` int(5) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator` bigint(11) NOT NULL DEFAULT '0',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  `description` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='医生信息';

-- ----------------------------
-- Table structure for tbl_fb_dict_frequency
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fb_dict_frequency`;
CREATE TABLE `tbl_fb_dict_frequency` (
  `freq_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `freq_name` varchar(20) DEFAULT NULL COMMENT '频率名称',
  PRIMARY KEY (`freq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_fb_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fb_dict_type`;
CREATE TABLE `tbl_fb_dict_type` (
  `type_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_name` varchar(20) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_fb_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fb_feedback`;
CREATE TABLE `tbl_fb_feedback` (
  `fb_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type_id` bigint(11) NOT NULL COMMENT '类型id',
  `freq_id` bigint(11) NOT NULL COMMENT '频率id',
  `comp_id` bigint(11) NOT NULL COMMENT '机构id',
  `comp_name` varchar(30) DEFAULT NULL COMMENT '机构名称',
  `memb_id` bigint(11) DEFAULT NULL COMMENT '会员id',
  `op_id` bigint(11) DEFAULT NULL COMMENT '员工id tbl_sys_operator 表 type=1',
  `fb_memb_id` bigint(11) NOT NULL COMMENT '反馈人id',
  `memb_type` smallint(1) DEFAULT NULL COMMENT '来源类型，0 客户，1 客服',
  `app_id` bigint(11) DEFAULT NULL,
  `app_name` varchar(50) DEFAULT NULL COMMENT '应用名称',
  `version_name` varchar(16) DEFAULT NULL COMMENT '版本名称',
  `question_info` varchar(400) DEFAULT NULL COMMENT '问题详情',
  `question_imgs` varchar(160) DEFAULT NULL COMMENT '问题图片',
  `platform` smallint(1) DEFAULT '0' COMMENT '0 android  1 ios',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '反馈时间',
  `record_status` smallint(1) DEFAULT '0',
  PRIMARY KEY (`fb_id`),
  KEY `idx_feedback_frequency` (`freq_id`) USING BTREE,
  KEY `idx_feedback_type` (`type_id`) USING BTREE,
  KEY `idx_fd_comp` (`comp_id`) USING BTREE,
  KEY `idx_fd_memb_fd` (`memb_id`) USING BTREE,
  KEY `fk_fd_op_fd` (`fb_memb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_fb_handleinfo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_fb_handleinfo`;
CREATE TABLE `tbl_fb_handleinfo` (
  `hd_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fb_id` bigint(11) NOT NULL COMMENT '应用id',
  `hd_status` smallint(1) DEFAULT NULL COMMENT '处理状态： 0 处理中 1 已处理',
  `handle_info` varchar(1000) DEFAULT NULL COMMENT '处理详细',
  `memb_id` bigint(11) DEFAULT NULL COMMENT '处理人',
  `memb_name` varchar(80) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hd_id`),
  KEY `fk_hand_fd` (`fb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_file_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_file_data`;
CREATE TABLE `tbl_file_data` (
  `file_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `length` bigint(20) DEFAULT NULL,
  `md5` varchar(40) NOT NULL,
  `offset` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `is_last` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 还有 1 完成',
  `is_deal` smallint(1) DEFAULT NULL COMMENT '0 未处理 1 处理完成 -1 处理失败（isLast=1有该状态）',
  `is_finish` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 未完成 -1 失败 1成功',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  `finish_time` timestamp NULL DEFAULT NULL COMMENT '成功时间',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8086 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_health_report
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_report`;
CREATE TABLE `tbl_health_report` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL COMMENT '客户编号',
  `report_type` smallint(1) NOT NULL COMMENT '1：周报；2：月报',
  `report_date` date NOT NULL COMMENT '报告日期',
  `path` varchar(100) DEFAULT NULL COMMENT '相对路径',
  `content` text,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  KEY `idx_health_report_date` (`memb_id`,`report_date`)
) ENGINE=InnoDB AUTO_INCREMENT=4120 DEFAULT CHARSET=utf8 COMMENT='健康报告';

-- ----------------------------
-- Table structure for tbl_health_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_score`;
CREATE TABLE `tbl_health_score` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `statistic_date` date NOT NULL COMMENT 'yyyy-mm-dd',
  `score` double(4,2) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=2128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_health_score_action
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_score_action`;
CREATE TABLE `tbl_health_score_action` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `statistics_date` date NOT NULL COMMENT '统计日期',
  `busi_type` varchar(2) NOT NULL,
  `busi_name` varchar(32) DEFAULT NULL COMMENT '得分项名称',
  `score` double(4,2) NOT NULL DEFAULT '0.00',
  `oper_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  KEY `idx_health_score_act_membId` (`memb_id`),
  KEY `idx_health_score_act_statistics_date` (`statistics_date`)
) ENGINE=InnoDB AUTO_INCREMENT=513 DEFAULT CHARSET=utf8 COMMENT='健康分项目';

-- ----------------------------
-- Table structure for tbl_health_score_dtl
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_score_dtl`;
CREATE TABLE `tbl_health_score_dtl` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(11) NOT NULL,
  `catalog_id` varchar(2) NOT NULL,
  `score` double(4,2) NOT NULL,
  `statistics_date` date NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 正常 1 不可用',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=3657 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_health_sports
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_sports`;
CREATE TABLE `tbl_health_sports` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(32) NOT NULL,
  `sport_type` smallint(1) NOT NULL COMMENT '1：室内；2：室外',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_health_subject
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_subject`;
CREATE TABLE `tbl_health_subject` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(32) NOT NULL COMMENT '课程名称',
  `subject_type` smallint(1) NOT NULL COMMENT '课程类别',
  `description` varchar(200) DEFAULT NULL COMMENT '介绍',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` bigint(11) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='健康课程';

-- ----------------------------
-- Table structure for tbl_health_subject_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_health_subject_record`;
CREATE TABLE `tbl_health_subject_record` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL COMMENT '用户编号',
  `subject_id` bigint(11) NOT NULL COMMENT '课程编号',
  `complete_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  KEY `idx_health_subject_memb_id` (`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户使用健康课程记录';

-- ----------------------------
-- Table structure for tbl_lnk_album_photo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_album_photo`;
CREATE TABLE `tbl_lnk_album_photo` (
  `ap_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `album_id` bigint(11) unsigned NOT NULL,
  `group_name` varchar(16) DEFAULT NULL,
  `photo_size` bigint(11) DEFAULT NULL COMMENT '图片大小',
  `photo_path` varchar(128) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2314 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_child_album
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_child_album`;
CREATE TABLE `tbl_lnk_child_album` (
  `album_id` bigint(11) unsigned NOT NULL,
  `child_id` bigint(11) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  KEY `fk_child_album` (`album_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_comp_picgroup
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_comp_picgroup`;
CREATE TABLE `tbl_lnk_comp_picgroup` (
  `lnk_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comp_name` varchar(32) NOT NULL COMMENT '公司名称',
  `group_name` varchar(32) NOT NULL COMMENT '图片存储服务器',
  PRIMARY KEY (`lnk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_member_device
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_member_device`;
CREATE TABLE `tbl_lnk_member_device` (
  `memb_id` bigint(11) NOT NULL COMMENT '用户id',
  `device_id` bigint(11) unsigned NOT NULL COMMENT '设备id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`memb_id`,`device_id`),
  KEY `fk_lnk_member` (`memb_id`) USING BTREE,
  KEY `fk_lnk_device` (`device_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_member_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_member_message`;
CREATE TABLE `tbl_lnk_member_message` (
  `isread` smallint(1) DEFAULT NULL COMMENT '0未读 1已读',
  `msg_id` bigint(11) unsigned NOT NULL,
  `memb_id` bigint(11) NOT NULL,
  UNIQUE KEY `uk_lnk_member_message` (`msg_id`,`memb_id`) USING BTREE,
  KEY `fk_lnk_mm_member` (`memb_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_role_permission`;
CREATE TABLE `tbl_lnk_role_permission` (
  `sid` varchar(6) NOT NULL COMMENT '权限sid',
  `role_id` bigint(11) NOT NULL COMMENT '用户角色id',
  KEY `fk_lnk_role_id` (`role_id`) USING BTREE,
  KEY `fk_lnk_sid` (`sid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_usr_album
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_usr_album`;
CREATE TABLE `tbl_lnk_usr_album` (
  `album_id` bigint(11) unsigned NOT NULL,
  `memb_id` bigint(11) unsigned NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  KEY `fk_usr_album` (`album_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_usr_app
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_usr_app`;
CREATE TABLE `tbl_lnk_usr_app` (
  `app_id` bigint(11) unsigned NOT NULL,
  `memb_id` bigint(11) NOT NULL,
  `type` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '0 默认 1 首页配置',
  `sort` float(4,0) DEFAULT NULL COMMENT '排序（2.5.1）',
  `cur_version` varchar(64) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 正常 -1 卸载',
  KEY `fk_lnk_app_app` (`app_id`) USING BTREE,
  KEY `fk_lnk_app_member` (`memb_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_usr_child
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_usr_child`;
CREATE TABLE `tbl_lnk_usr_child` (
  `memb_id` bigint(11) unsigned NOT NULL,
  `child_id` bigint(11) unsigned DEFAULT NULL,
  `memb_phone` varchar(16) DEFAULT NULL,
  `child_phone` varchar(16) DEFAULT NULL,
  `nickname` varchar(16) DEFAULT NULL COMMENT '子女端对lejane会员的称呼',
  `contact_name` varchar(16) DEFAULT NULL COMMENT 'lejane对子女端联系人的称呼',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  UNIQUE KEY `uk_membId_childPhone_contactName` (`memb_id`,`child_phone`,`contact_name`) USING BTREE,
  KEY `fk_lnk_child` (`child_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_lnk_usr_radio
-- ----------------------------
DROP TABLE IF EXISTS `tbl_lnk_usr_radio`;
CREATE TABLE `tbl_lnk_usr_radio` (
  `radio_id` bigint(11) NOT NULL COMMENT '音频文件ID',
  `memb_id` bigint(11) NOT NULL COMMENT '会员 id',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '播放状态（0 开始；1 暂停；2 切换；3 关闭）',
  `listen_time` float DEFAULT NULL COMMENT '收听时长',
  `record_time` timestamp NULL DEFAULT NULL COMMENT '是否完整听完 默认0 不完整 1 完整',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tbl_location_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_location_info`;
CREATE TABLE `tbl_location_info` (
  `loc_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `country` varchar(30) DEFAULT NULL COMMENT '国家',
  `country_code` varchar(30) DEFAULT NULL COMMENT '国家编号',
  `privince` varchar(30) DEFAULT NULL COMMENT '省',
  `city` varchar(30) DEFAULT NULL COMMENT '市',
  `district` varchar(30) DEFAULT NULL COMMENT '区县',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `latitude` double(24,10) DEFAULT NULL COMMENT '纬度',
  `longitude` double(24,10) DEFAULT NULL COMMENT '经度',
  `lnk_id` bigint(11) NOT NULL COMMENT '关联主键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ext1` varchar(500) DEFAULT NULL COMMENT '扩展字段1',
  `ext2` varchar(500) DEFAULT NULL COMMENT '扩展字段2',
  PRIMARY KEY (`loc_id`),
  UNIQUE KEY `idx_location_lnk_id` (`lnk_id`) USING BTREE,
  KEY `idx_location_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5645695 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_msg_down
-- ----------------------------
DROP TABLE IF EXISTS `tbl_msg_down`;
CREATE TABLE `tbl_msg_down` (
  `down_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '上行id',
  `proj_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `content` varchar(150) NOT NULL COMMENT '短信内容',
  `tip` varchar(10) DEFAULT NULL COMMENT '签名',
  `back_code` varchar(10) DEFAULT NULL COMMENT '退订代码',
  `project_type` varchar(20) NOT NULL COMMENT '项目类型',
  `channel` varchar(50) NOT NULL COMMENT '通道',
  `resp_id` varchar(20) DEFAULT NULL,
  `submit_status` smallint(1) NOT NULL COMMENT '提交状态',
  `send_status` smallint(1) NOT NULL COMMENT '发送状态',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  `resend_time` timestamp NULL DEFAULT NULL COMMENT '重发时间',
  `success_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`down_id`),
  KEY `fk_down_project` (`proj_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15086 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_msg_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_msg_info`;
CREATE TABLE `tbl_msg_info` (
  `info_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `content` varchar(150) NOT NULL,
  `tip` varchar(10) DEFAULT NULL,
  `back_code` varchar(10) NOT NULL,
  `resp_id` varchar(30) DEFAULT NULL COMMENT '短信发送返回的respId',
  `temp_id` bigint(11) DEFAULT NULL,
  `temp_name` varchar(30) DEFAULT NULL,
  `resend_time` timestamp NULL DEFAULT NULL,
  `submit_status` smallint(1) DEFAULT NULL COMMENT '提交状态',
  `submit_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `send_status` smallint(1) NOT NULL DEFAULT '0',
  `push_status` smallint(1) DEFAULT '0',
  `user_id` varchar(37) DEFAULT NULL COMMENT '发送营销短信记录发送者id',
  `success_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1524 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_private_doctor_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_private_doctor_detail`;
CREATE TABLE `tbl_private_doctor_detail` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL COMMENT '客户编号',
  `busi_type` varchar(2) DEFAULT NULL COMMENT '业务类型  01-新单，02-更新信息，03-续服，04-减人',
  `name` varchar(32) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) DEFAULT NULL,
  `imei` varchar(16) DEFAULT NULL,
  `card_type` varchar(2) DEFAULT NULL COMMENT '证件类型 01-身份证，02-护照，03-军官证，05-其他',
  `idcard` varchar(50) DEFAULT NULL,
  `birthday` date DEFAULT NULL COMMENT '生日',
  `province` varchar(16) DEFAULT NULL,
  `city` varchar(16) DEFAULT NULL COMMENT '市',
  `emergency_contact` varchar(32) DEFAULT NULL COMMENT '紧急联系人',
  `emergency_phone` varchar(20) DEFAULT NULL COMMENT '紧急人联系方式',
  `policy_no` varchar(64) DEFAULT NULL,
  `effective_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '生效日期',
  `expired_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '过期日期',
  `busi_status` smallint(1) NOT NULL COMMENT '业务状态  0 开通失败、1开通成功、2过期、3审核中',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(11) NOT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator` bigint(11) NOT NULL COMMENT '操作人',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0：正常；1：删除',
  PRIMARY KEY (`pkid`),
  KEY `idx_private_detail_membid` (`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='私人医生档案详情';

-- ----------------------------
-- Table structure for tbl_radio_file
-- ----------------------------
DROP TABLE IF EXISTS `tbl_radio_file`;
CREATE TABLE `tbl_radio_file` (
  `rf_id` varchar(37) NOT NULL DEFAULT '' COMMENT '文件id',
  `org_name` varchar(50) NOT NULL COMMENT '文件原名',
  `from_ip` varchar(50) NOT NULL COMMENT '来源ip',
  `name` varchar(50) DEFAULT NULL COMMENT '文件在服务器的名字',
  `suffix` varchar(50) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `end_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '完成时间',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '文件状态 0默认 1上传成功 -1上传失败',
  PRIMARY KEY (`rf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tbl_radio_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_radio_info`;
CREATE TABLE `tbl_radio_info` (
  `radio_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(80) NOT NULL COMMENT '音频名称',
  `rc_id` bigint(11) DEFAULT NULL COMMENT '分类ID 0 健康快车 1养生讲堂',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `sort` double(11,0) DEFAULT NULL,
  `rf_id` varchar(37) DEFAULT NULL,
  `record_time` varchar(7) DEFAULT '录制时间' COMMENT '2016-07',
  `source` varchar(150) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_new` smallint(1) DEFAULT '0' COMMENT '是否最新 默认0  1最新',
  `peroid` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`radio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tbl_stat_active
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_active`;
CREATE TABLE `tbl_stat_active` (
  `sa_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活跃度id',
  `memb_id` bigint(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '活跃度内容',
  `times` int(8) NOT NULL COMMENT '活跃度次数',
  `stat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '统计时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136736 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_stat_task
-- ----------------------------
DROP TABLE IF EXISTS `tbl_stat_task`;
CREATE TABLE `tbl_stat_task` (
  `stat_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `op_id` bigint(11) NOT NULL COMMENT '员工id',
  `op_name` varchar(10) DEFAULT NULL,
  `home_count` int(5) unsigned DEFAULT NULL COMMENT '全部家访人数',
  `gift_count` int(5) unsigned DEFAULT NULL COMMENT '全部赠送礼品人数',
  `other_count` int(5) unsigned DEFAULT NULL COMMENT '其他活动全部人数',
  `memb_home_count` int(5) unsigned DEFAULT NULL COMMENT '家访会员人数',
  `memb_gift_count` int(5) unsigned DEFAULT NULL COMMENT '发放礼品会员人数',
  `memb_other_count` int(5) unsigned DEFAULT NULL COMMENT '其他活动会员人数',
  `service_month` varchar(10) NOT NULL COMMENT '用于记录服务时间的月份（2016-06）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`stat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=903 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_advert
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_advert`;
CREATE TABLE `tbl_sys_advert` (
  `adv_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `comp_id` bigint(11) NOT NULL,
  `welcome` varchar(50) DEFAULT NULL,
  `image1` varchar(50) DEFAULT NULL,
  `link1` varchar(50) DEFAULT NULL,
  `image2` varchar(50) DEFAULT NULL,
  `link2` varchar(50) DEFAULT NULL,
  `image3` varchar(50) DEFAULT NULL,
  `link3` varchar(50) DEFAULT NULL,
  `image4` varchar(50) DEFAULT NULL,
  `link4` varchar(50) DEFAULT NULL,
  `image5` varchar(50) DEFAULT NULL,
  `link5` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_app
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_app`;
CREATE TABLE `tbl_sys_app` (
  `app_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `head` varchar(50) NOT NULL COMMENT 'app图标',
  `wel_img_ids` varchar(100) DEFAULT NULL COMMENT '欢迎图片ids',
  `service_title` varchar(50) DEFAULT NULL COMMENT '协议标题',
  `service_content` blob NOT NULL COMMENT '服务协议',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` smallint(1) NOT NULL COMMENT '记录状态',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_city
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_city`;
CREATE TABLE `tbl_sys_city` (
  `province_name` varchar(10) NOT NULL,
  `province_adcode` varchar(10) NOT NULL,
  `city_name` varchar(10) DEFAULT NULL,
  `city_adcode` varchar(10) DEFAULT NULL,
  `county_name` varchar(10) DEFAULT NULL,
  `county_adcode` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`county_adcode`),
  KEY `county_adcode` (`county_adcode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_company`;
CREATE TABLE `tbl_sys_company` (
  `comp_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(32) NOT NULL COMMENT '机构名称',
  `phone` varchar(11) NOT NULL,
  `guest_phone` varchar(11) DEFAULT NULL,
  `adcode` varchar(6) NOT NULL COMMENT '所在地区id',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `level` smallint(1) NOT NULL COMMENT '机构级别',
  `comp1_pid` bigint(11) NOT NULL DEFAULT '0' COMMENT '一级分公司',
  `comp2_pid` bigint(11) NOT NULL DEFAULT '0' COMMENT '二级分公司',
  `remark` varchar(200) DEFAULT NULL COMMENT '简介',
  `description` varchar(200) DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  `comp_oid` bigint(11) DEFAULT NULL,
  `record_delete` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`comp_id`),
  UNIQUE KEY `uk_comp_name` (`name`,`record_delete`,`record_status`,`level`) USING BTREE,
  KEY `fk_comp1_pid` (`comp1_pid`) USING BTREE,
  KEY `fk_comp2_pid` (`comp2_pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3365 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_crawl_url
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_crawl_url`;
CREATE TABLE `tbl_sys_crawl_url` (
  `cra_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `type` varchar(10) NOT NULL,
  `attribute` varchar(10) NOT NULL DEFAULT '60',
  `status` tinyint(1) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1305 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_feedback`;
CREATE TABLE `tbl_sys_feedback` (
  `fb_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `pt_id` bigint(11) unsigned DEFAULT NULL COMMENT '问题类型id',
  `comp_id` bigint(11) NOT NULL,
  `description` varchar(500) NOT NULL COMMENT '问题描述',
  `suggestion` varchar(500) DEFAULT NULL COMMENT '处理意见',
  `op_id` bigint(11) DEFAULT NULL COMMENT '反馈人id',
  `op_name` varchar(50) DEFAULT NULL COMMENT '反馈人姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 1 不可用',
  PRIMARY KEY (`fb_id`),
  KEY `fk_sys_feedback_type` (`pt_id`) USING BTREE,
  KEY `fk_sys_feedback_op` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_info_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_info_type`;
CREATE TABLE `tbl_sys_info_type` (
  `it_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启 默认0 关闭，1开启',
  `sort` float(7,1) DEFAULT NULL COMMENT '排序',
  `op_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '添加人id',
  `op_name` varchar(50) DEFAULT NULL COMMENT '添加人账号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`it_id`),
  KEY `fk_infation_operator` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_information
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_information`;
CREATE TABLE `tbl_sys_information` (
  `info_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(200) CHARACTER SET utf8mb4 NOT NULL COMMENT '资讯标题',
  `source` varchar(20) DEFAULT NULL COMMENT '资讯标题',
  `info_type` varchar(20) NOT NULL COMMENT '资讯类型',
  `it_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `info_time` varchar(20) DEFAULT NULL COMMENT '资讯时间',
  `info_url` varchar(100) DEFAULT NULL COMMENT '资讯地址',
  `image` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `description` varchar(200) DEFAULT NULL,
  `content` varchar(20000) NOT NULL COMMENT '资讯详情',
  `check_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态 1 通过  0 未审核 -1审核失败 ',
  `check_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `op_id` bigint(11) DEFAULT NULL,
  `op_name` varchar(20) DEFAULT NULL COMMENT '审核人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tag_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '标签匹配状态：0未匹配 1匹配成功 ',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 -1 不可用 ',
  PRIMARY KEY (`info_id`),
  KEY `fk_info_op` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35576 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_information_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_information_tag`;
CREATE TABLE `tbl_sys_information_tag` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `info_id` bigint(11) NOT NULL,
  `tag_id` bigint(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `idx_uk_info_tag` (`info_id`,`tag_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19041 DEFAULT CHARSET=utf8 COMMENT='资讯与标签关联表';

-- ----------------------------
-- Table structure for tbl_sys_information0111
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_information0111`;
CREATE TABLE `tbl_sys_information0111` (
  `info_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(200) CHARACTER SET utf8mb4 NOT NULL COMMENT '资讯标题',
  `source` varchar(20) NOT NULL COMMENT '资讯标题',
  `info_type` varchar(20) NOT NULL COMMENT '资讯类型',
  `it_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '类型id',
  `info_time` varchar(20) DEFAULT NULL COMMENT '资讯时间',
  `info_url` varchar(100) DEFAULT NULL COMMENT '资讯地址',
  `image` varchar(200) DEFAULT NULL COMMENT '缩略图',
  `description` varchar(200) DEFAULT NULL,
  `content` varchar(20000) NOT NULL COMMENT '资讯详情',
  `check_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态 1 通过  0 未审核 -1审核失败 ',
  `check_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `op_id` bigint(11) DEFAULT NULL,
  `op_name` varchar(20) DEFAULT NULL COMMENT '审核人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tag_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '标签匹配状态：0未匹配 1匹配成功 ',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 -1 不可用 ',
  PRIMARY KEY (`info_id`),
  KEY `fk_info_op` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3735 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_operator
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_operator`;
CREATE TABLE `tbl_sys_operator` (
  `op_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `account` varchar(50) NOT NULL COMMENT '账号',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `head` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `idcard` varchar(50) DEFAULT NULL COMMENT '身份证号',
  `comp_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '公司id',
  `type` smallint(1) NOT NULL COMMENT '类型',
  `role_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0',
  `op_oid` bigint(11) DEFAULT NULL,
  `record_delete` bigint(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`op_id`),
  UNIQUE KEY `uk_operator_account` (`account`,`record_delete`,`record_status`) USING BTREE,
  UNIQUE KEY `uk_operator_phone` (`phone`,`record_delete`,`record_status`) USING BTREE,
  KEY `fk_operator_role` (`role_id`) USING BTREE,
  KEY `fk_operator_company` (`comp_id`) USING BTREE,
  KEY `idx_operator_account` (`account`),
  KEY `idx_operator_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6825 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_permission`;
CREATE TABLE `tbl_sys_permission` (
  `sid` varchar(6) NOT NULL COMMENT '权限id',
  `psid` varchar(6) DEFAULT NULL COMMENT '权限父id',
  `name` varchar(50) NOT NULL COMMENT '权限名称',
  `logo` varchar(50) DEFAULT NULL COMMENT 'logo',
  `html` varchar(30) DEFAULT '' COMMENT '对应页面',
  `per_sort` varchar(6) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  PRIMARY KEY (`sid`),
  KEY `fk_permission_psid` (`psid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_problem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_problem`;
CREATE TABLE `tbl_sys_problem` (
  `pro_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题id',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pt_id` bigint(11) unsigned DEFAULT NULL COMMENT '问题类型',
  `comp_id` bigint(11) NOT NULL COMMENT '所属一级机构id',
  `content` varchar(200) NOT NULL COMMENT '回复',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐状态 默认0 不推荐，1推荐',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 1 不可用',
  `record_delete` int(5) unsigned zerofill NOT NULL DEFAULT '00000',
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_problem_type
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_problem_type`;
CREATE TABLE `tbl_sys_problem_type` (
  `pt_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题类型id',
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启 默认0 关闭，1开启',
  `sort` float(8,1) DEFAULT NULL COMMENT '排序',
  `op_id` bigint(11) DEFAULT NULL COMMENT '添加人id',
  `op_name` varchar(50) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pt_id`),
  KEY `fk_problem_type_operator` (`op_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_properties
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_properties`;
CREATE TABLE `tbl_sys_properties` (
  `pro_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `pro_value` varchar(1024) NOT NULL,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `uk_name` (`pro_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tbl_sys_question
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_question`;
CREATE TABLE `tbl_sys_question` (
  `quest_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(100) NOT NULL COMMENT '问题内容',
  KEY `quest_id` (`quest_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_question_audit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_question_audit`;
CREATE TABLE `tbl_sys_question_audit` (
  `qa_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `op_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `quest_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '问题id',
  `answer` varchar(50) DEFAULT NULL COMMENT '问题答案',
  PRIMARY KEY (`qa_id`),
  KEY `fk_audit_op_id` (`op_id`) USING BTREE,
  KEY `fk_audit_quest_id` (`quest_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_role`;
CREATE TABLE `tbl_sys_role` (
  `role_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `role_pid` bigint(11) DEFAULT NULL,
  `comp_id` bigint(11) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0',
  `record_delete` bigint(11) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_name` (`name`,`record_status`,`record_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_sys_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sys_tags`;
CREATE TABLE `tbl_sys_tags` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(16) NOT NULL,
  `tag_weight` int(5) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  `creator` bigint(11) NOT NULL COMMENT '创建人',
  `operator` bigint(11) NOT NULL COMMENT '操作人',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `idx_uk_tag_name` (`tag_name`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='标签库';

-- ----------------------------
-- Table structure for tbl_user_activity_code
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_activity_code`;
CREATE TABLE `tbl_user_activity_code` (
  `memb_id` bigint(22) NOT NULL COMMENT '用户id',
  `phone` char(16) NOT NULL COMMENT '用户电话号码',
  `activity_code` char(16) NOT NULL COMMENT '使用的激活码',
  `activity_type` tinyint(1) DEFAULT '1' COMMENT '使用类型\n1-激活\n',
  `imei` char(16) DEFAULT NULL COMMENT '使用激活码的手机imei',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用激活码时间',
  PRIMARY KEY (`phone`,`activity_code`,`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户使用激活码信息';

-- ----------------------------
-- Table structure for tbl_user_emergency_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_emergency_info`;
CREATE TABLE `tbl_user_emergency_info` (
  `memb_id` bigint(22) NOT NULL COMMENT '注册用户id',
  `user_name` varchar(45) DEFAULT NULL COMMENT '用户名称',
  `id_card` char(18) DEFAULT NULL COMMENT '身份证号码',
  `address` varchar(255) DEFAULT NULL COMMENT '常用地址',
  `emergency_contact` varchar(45) DEFAULT NULL COMMENT '紧急联系人名称',
  `emergency_phone` varchar(15) DEFAULT NULL COMMENT '紧急联系人电话',
  `sos_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'sos 是否开通 状态\n0-未激活    \n1-已经激活  \n2-审核中，未激活  \n3-审核中，已激活   \n6-未激活，审核通过     \n7-已激活，审核通过',
  `sos_start_date` datetime DEFAULT NULL COMMENT 'sos 服务开始时间',
  `sos_expired_date` datetime DEFAULT NULL COMMENT 'sos 服务结束时间',
  `pd_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '私人医生 是否开通 状态\n0-未激活    \n1-已经激活  \n2-审核中，未激活  \n3-审核中，已激活   \n6-未激活，审核通过     \n7-已激活，审核通过',
  `pd_start_date` datetime DEFAULT NULL COMMENT '私人医生服务  开始时间',
  `pd_expired_date` datetime DEFAULT NULL COMMENT '私人医生服务  结束时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户sos 和 私人医生信息表';

-- ----------------------------
-- Table structure for tbl_user_oper_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_oper_statistics`;
CREATE TABLE `tbl_user_oper_statistics` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `imei` varchar(16) NOT NULL,
  `source` varchar(16) DEFAULT NULL,
  `func_code` varchar(3) NOT NULL,
  `click_count` bigint(11) NOT NULL DEFAULT '0',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_app
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_app`;
CREATE TABLE `tbl_usr_app` (
  `app_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `app_name` varchar(60) NOT NULL COMMENT '应用名称',
  `package_name` varchar(60) DEFAULT NULL COMMENT '应用包名',
  `class_name` varchar(128) DEFAULT NULL COMMENT '启动类',
  `cat_id` bigint(11) unsigned NOT NULL COMMENT '分类id',
  `sort` float(8,1) NOT NULL COMMENT '排序',
  `source` varchar(30) DEFAULT NULL COMMENT '应用来源',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`app_id`),
  KEY `fk_app_categoty` (`cat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9025 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_app_catalog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_app_catalog`;
CREATE TABLE `tbl_usr_app_catalog` (
  `cat_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '分类名称',
  `sort` float(8,1) NOT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_app_count
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_app_count`;
CREATE TABLE `tbl_usr_app_count` (
  `app_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'id',
  `app_name` varchar(60) NOT NULL COMMENT '应用名称',
  `package_name` varchar(60) DEFAULT NULL COMMENT '应用包名',
  `sort` float(8,1) NOT NULL COMMENT '排序',
  `memb_id` bigint(11) unsigned NOT NULL COMMENT '分类id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_archives
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_archives`;
CREATE TABLE `tbl_usr_archives` (
  `arc_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `memb_id` bigint(11) NOT NULL COMMENT '会员id',
  `health_status` tinyint(1) DEFAULT NULL COMMENT '健康情况',
  `description` varchar(200) DEFAULT NULL COMMENT '疾病描述',
  `high_pressure` int(3) DEFAULT NULL COMMENT '高压',
  `low_pressure` int(3) DEFAULT NULL COMMENT '低压',
  `boold_fat` varchar(20) DEFAULT NULL COMMENT '血脂',
  `boold_sugar` varchar(20) DEFAULT NULL COMMENT '血糖',
  `digestion` varchar(20) DEFAULT NULL COMMENT '消化',
  `urine` varchar(20) DEFAULT NULL COMMENT '大小便',
  `sleep` varchar(20) DEFAULT NULL COMMENT '睡眠',
  `tongue` varchar(20) DEFAULT NULL COMMENT '舌苔',
  `limbs_temp` varchar(20) DEFAULT NULL COMMENT '手脚凉热',
  `check_time` date DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`arc_id`),
  UNIQUE KEY `uk_archives_member` (`memb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_call
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_call`;
CREATE TABLE `tbl_usr_call` (
  `call_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '外呼id',
  `memb_id` bigint(11) NOT NULL COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`call_id`),
  KEY `fk_call_member` (`memb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1843 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_card
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_card`;
CREATE TABLE `tbl_usr_card` (
  `card_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '会员卡ID',
  `memb_id` bigint(11) NOT NULL DEFAULT '0' COMMENT '客户编号',
  `imei` varchar(16) NOT NULL,
  `phone` varchar(16) NOT NULL COMMENT '手机号',
  `phone2` varchar(16) DEFAULT NULL,
  `expired_time` timestamp NULL DEFAULT NULL,
  `card_status` tinyint(1) DEFAULT NULL COMMENT '会员卡状态 0未激活、1 激活',
  `back_status` tinyint(1) DEFAULT NULL COMMENT '急救平台返回状态 0 开通失败、1开通成功、2过期、3审核中',
  `pay_type` tinyint(1) DEFAULT NULL COMMENT '付费类型 0 c端 1 b端',
  `comp_id` bigint(11) NOT NULL COMMENT '一级机构',
  `idcard` varchar(20) NOT NULL COMMENT '身份证',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常 -1 删除',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_catalog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_catalog`;
CREATE TABLE `tbl_usr_catalog` (
  `cat_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '分类名称',
  `sort` float(8,1) NOT NULL COMMENT '排序',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_chat
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_chat`;
CREATE TABLE `tbl_usr_chat` (
  `chat_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `chat_from` varchar(50) NOT NULL COMMENT '聊天发起者',
  `chat_to` varchar(50) NOT NULL COMMENT '聊天接收者',
  `chat_time` timestamp NULL DEFAULT NULL COMMENT '聊天时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  PRIMARY KEY (`chat_id`),
  KEY `index_chat_to` (`chat_to`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67963 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_chat_content
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_chat_content`;
CREATE TABLE `tbl_usr_chat_content` (
  `cc_id` bigint(37) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `chat_id` bigint(100) DEFAULT NULL COMMENT '聊天id',
  `msg` blob COMMENT '聊天内容',
  `type` varchar(10) NOT NULL COMMENT '聊天类型',
  `length` varchar(8) DEFAULT NULL COMMENT '聊天长度',
  `url` varchar(100) DEFAULT NULL COMMENT '聊天链接',
  `filename` varchar(50) DEFAULT NULL COMMENT '聊天文件',
  `secret` varchar(50) DEFAULT NULL COMMENT '聊天秘钥',
  `lat` double(14,10) DEFAULT NULL COMMENT '定位纬度',
  `lng` double(14,10) DEFAULT NULL COMMENT '定位经度',
  `addr` varchar(50) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57784 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_check_problem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_check_problem`;
CREATE TABLE `tbl_usr_check_problem` (
  `cq_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `memb_id` bigint(11) NOT NULL COMMENT '用户id',
  `pro_id` bigint(11) unsigned NOT NULL COMMENT '问题id',
  `type` smallint(1) DEFAULT NULL COMMENT '0 常见问题 1 反馈问题',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`cq_id`),
  KEY `fk_check_problem_member` (`memb_id`) USING BTREE,
  KEY `fk_check_problem_problem` (`pro_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_child
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_child`;
CREATE TABLE `tbl_usr_child` (
  `child_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '后辈id',
  `head` varchar(200) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL COMMENT '账号',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(16) NOT NULL COMMENT '电话',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `height` double(5,2) DEFAULT NULL,
  `weight` double(5,2) DEFAULT NULL COMMENT '体重',
  `address` varchar(50) DEFAULT NULL COMMENT '家庭住址',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 正常 -1 删除',
  `record_delete` bigint(11) unsigned zerofill DEFAULT '00000000000' COMMENT '记录删除',
  `push_token` varchar(100) DEFAULT NULL COMMENT '推送标识',
  PRIMARY KEY (`child_id`),
  UNIQUE KEY `uk_child_phone` (`phone`,`record_delete`,`record_status`) USING BTREE,
  UNIQUE KEY `uk_child_account` (`account`,`record_status`,`record_delete`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_clock
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_clock`;
CREATE TABLE `tbl_usr_clock` (
  `clock_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` bigint(11) DEFAULT NULL,
  `memb_id` bigint(11) DEFAULT NULL COMMENT '员工id',
  `type` smallint(1) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL COMMENT '闹钟名称',
  `date` varchar(50) NOT NULL,
  `vaild` smallint(1) DEFAULT NULL COMMENT '0 生效 1失效',
  `record_status` smallint(1) NOT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clock_id`),
  KEY `fk_clock_member` (`memb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_contact
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_contact`;
CREATE TABLE `tbl_usr_contact` (
  `con_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `memb_id` bigint(11) NOT NULL COMMENT '会员id',
  `name` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL,
  `phone` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 默认 1 快捷联系人 2 紧急联系人',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15239313 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_data`;
CREATE TABLE `tbl_usr_data` (
  `data_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) DEFAULT NULL,
  `source` varchar(5) DEFAULT NULL,
  `data_type` varchar(20) NOT NULL,
  `data_value` varchar(2000) NOT NULL,
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `check_tick` varchar(20) NOT NULL,
  `device` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `fk_usr_data_member` (`memb_id`) USING BTREE,
  KEY `index_check_time` (`check_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=652267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_device
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_device`;
CREATE TABLE `tbl_usr_device` (
  `dev_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `imei` varchar(16) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `serial_no` varchar(32) DEFAULT NULL COMMENT '安卓系统序列号',
  `mac_address` varchar(12) DEFAULT NULL COMMENT 'mac地址',
  `device_info` varchar(32) DEFAULT NULL COMMENT '设备信息',
  `phone_model` varchar(64) DEFAULT NULL COMMENT '手机型号',
  `version_no` varchar(32) DEFAULT NULL COMMENT '乐简版本',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0 正常  1不可用',
  PRIMARY KEY (`dev_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7798 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_error_data
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_error_data`;
CREATE TABLE `tbl_usr_error_data` (
  `ed_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` bigint(11) NOT NULL,
  `memb_id` bigint(11) NOT NULL,
  `data_desc` varchar(100) NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `check_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26768 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_family
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_family`;
CREATE TABLE `tbl_usr_family` (
  `fam_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0 女 1男',
  `birthday` date NOT NULL COMMENT '出生日期',
  `releation` varchar(10) NOT NULL COMMENT '关系',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  PRIMARY KEY (`fam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_habbit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_habbit`;
CREATE TABLE `tbl_usr_habbit` (
  `hab_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `memb_id` bigint(11) NOT NULL COMMENT '用户id',
  `is_smoke` tinyint(1) DEFAULT NULL COMMENT '是否抽烟 0 不抽 1 抽烟',
  `is_drink` tinyint(1) DEFAULT NULL COMMENT '是否喝酒 0 不喝 1 喝酒',
  `sleep_habbit` tinyint(1) DEFAULT NULL COMMENT '睡眠习惯',
  `is_midnight` tinyint(1) DEFAULT NULL COMMENT '是否熬夜 0 否 1是',
  `is_nap` tinyint(1) DEFAULT NULL COMMENT '是否午睡 0 否 1 是',
  `is_eat_well` tinyint(1) DEFAULT NULL COMMENT '饮食是否规律 0 否 1 是',
  `eat_description` varchar(200) DEFAULT NULL COMMENT '饮食描述',
  `is_move` tinyint(1) DEFAULT NULL COMMENT '是否运动 0否 1 是',
  `move_description` varchar(200) DEFAULT NULL COMMENT '运动描述',
  `characteristic` varchar(200) DEFAULT NULL COMMENT '性格',
  `check_time` date DEFAULT NULL COMMENT '检测时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `record_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  PRIMARY KEY (`hab_id`),
  UNIQUE KEY `uk_habbit_memb` (`memb_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_health_record
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_health_record`;
CREATE TABLE `tbl_usr_health_record` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `steps` int(6) DEFAULT '0',
  `sleep_hours` double(4,2) DEFAULT '0.00',
  `statistics_date` date NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  KEY `idx_health_record_memb_id` (`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_imei
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_imei`;
CREATE TABLE `tbl_usr_imei` (
  `imei_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `imei` varchar(16) NOT NULL DEFAULT '' COMMENT 'IMEI',
  `company` varchar(32) DEFAULT NULL COMMENT '所在公司',
  PRIMARY KEY (`imei_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6525 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_interest_app
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_interest_app`;
CREATE TABLE `tbl_usr_interest_app` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) DEFAULT NULL,
  `app_name` varchar(32) DEFAULT NULL,
  `package_name` varchar(100) NOT NULL COMMENT '应用包名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0 正常 1 不可用',
  `usr_app_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pkid`),
  KEY `idx_memb_intest_app_memb_id` (`memb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_interest_sports
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_interest_sports`;
CREATE TABLE `tbl_usr_interest_sports` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `sport_id` bigint(11) NOT NULL,
  `sport_name` varchar(32) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  PRIMARY KEY (`pkid`),
  KEY `idx_memb_intest_sports_memb_id` (`memb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=530 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_interest_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_interest_tag`;
CREATE TABLE `tbl_usr_interest_tag` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `tag_id` bigint(11) NOT NULL,
  `tag_name` varchar(16) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  PRIMARY KEY (`pkid`),
  KEY `idx_memb_intest_tag_memb_id` (`memb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1093 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_lifestyle
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_lifestyle`;
CREATE TABLE `tbl_usr_lifestyle` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `sleep_hour` smallint(2) NOT NULL,
  `wake_hour` smallint(2) NOT NULL,
  `is_nap` tinyint(1) DEFAULT NULL COMMENT '0 否 1 是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '0：正常；1：删除',
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `idx_memb_lifestyle_memb_id` (`memb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_member`;
CREATE TABLE `tbl_usr_member` (
  `memb_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `arc_id` bigint(11) DEFAULT NULL,
  `hab_id` bigint(11) DEFAULT NULL,
  `head` varchar(100) DEFAULT NULL COMMENT '头像',
  `account` varchar(50) NOT NULL COMMENT '账号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `phone` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL COMMENT '密码',
  `comp_id` bigint(11) DEFAULT NULL COMMENT '三级机构',
  `op_id` bigint(11) DEFAULT NULL COMMENT '所属员工id',
  `service_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `sex` smallint(1) DEFAULT NULL COMMENT '性别',
  `age` smallint(3) DEFAULT NULL COMMENT '年龄',
  `birthday` date DEFAULT NULL,
  `height` double(5,2) DEFAULT NULL COMMENT '身高',
  `weight` double(5,2) DEFAULT NULL COMMENT '体重',
  `address` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态',
  `record_delete` bigint(11) unsigned zerofill NOT NULL DEFAULT '00000000000' COMMENT '删除标记',
  `push_token` varchar(100) DEFAULT NULL COMMENT '推送标识',
  `health_score` double(8,2) NOT NULL DEFAULT '0.00' COMMENT '健康分',
  `init_status` smallint(1) DEFAULT '-1' COMMENT '配置状态 0：已配置;-1：未配置',
  PRIMARY KEY (`memb_id`),
  UNIQUE KEY `uk_member_account` (`account`,`record_delete`,`record_status`) USING BTREE,
  UNIQUE KEY `uk_member_phone` (`phone`,`record_delete`,`record_status`) USING BTREE,
  KEY `fk_member_comp_id` (`comp_id`) USING BTREE,
  KEY `fk_member_op_id` (`op_id`) USING BTREE,
  KEY `index_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24080 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_message`;
CREATE TABLE `tbl_usr_message` (
  `msg_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `op_id` bigint(11) NOT NULL,
  `del_id` bigint(11) DEFAULT NULL,
  `content` varchar(100) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `record_status` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `fk_message_operator` (`op_id`) USING BTREE,
  KEY `fk_message_operator_del` (`del_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_note
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_note`;
CREATE TABLE `tbl_usr_note` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(11) NOT NULL,
  `memb_id` bigint(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `doctor_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `memb_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `memb_phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0：回复；1：未回复',
  `ansr_id` bigint(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operator` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8mb4 COMMENT='用户留言';

-- ----------------------------
-- Table structure for tbl_usr_note_tag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_note_tag`;
CREATE TABLE `tbl_usr_note_tag` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `note_id` bigint(11) DEFAULT NULL,
  `tag_id` bigint(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`),
  UNIQUE KEY `idx_uk_note_tag` (`note_id`,`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户留言标签关联表';

-- ----------------------------
-- Table structure for tbl_usr_private_doctor
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_private_doctor`;
CREATE TABLE `tbl_usr_private_doctor` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL COMMENT '客户编号',
  `status` smallint(1) NOT NULL COMMENT '状态  0未激活、1 激活 2 过期',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `creator` bigint(11) NOT NULL COMMENT '创建人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `operator` bigint(11) NOT NULL COMMENT '操作人',
  `record_status` smallint(1) NOT NULL DEFAULT '0' COMMENT '记录状态 0：正常；1：删除',
  PRIMARY KEY (`pkid`),
  KEY `idx_private_doctor_membid` (`memb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='私人医生业务';

-- ----------------------------
-- Table structure for tbl_usr_read
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_read`;
CREATE TABLE `tbl_usr_read` (
  `read_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户阅读id',
  `memb_id` bigint(11) NOT NULL COMMENT '用户id',
  `info_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`read_id`),
  KEY `fk_read_member` (`memb_id`) USING BTREE,
  KEY `fk_read_info` (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9240 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbl_usr_score
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_score`;
CREATE TABLE `tbl_usr_score` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `lecoin` int(8) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户记录表，乐币';

-- ----------------------------
-- Table structure for tbl_usr_score_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usr_score_history`;
CREATE TABLE `tbl_usr_score_history` (
  `pkid` bigint(11) NOT NULL AUTO_INCREMENT,
  `memb_id` bigint(11) NOT NULL,
  `lecoin` int(3) NOT NULL,
  `note` varchar(100) DEFAULT NULL,
  `source` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pkid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='乐币流水表';

-- ----------------------------
-- Table structure for tbl_youbao_feedback_info
-- ----------------------------
DROP TABLE IF EXISTS `tbl_youbao_feedback_info`;
CREATE TABLE `tbl_youbao_feedback_info` (
  `srv_num` char(16) NOT NULL COMMENT '优宝 case number',
  `memb_id` bigint(20) NOT NULL COMMENT '用户id',
  `mobile` char(16) DEFAULT NULL COMMENT '用户手机号码',
  `status` tinyint(4) DEFAULT '0' COMMENT '最新状态\n优宝的进度消息编号\n0:  初始\n3：处理中\n4：驶向现场\n5：送达医院\n6：服务成功\n7：取消救援\n8：取消订单\n9：完成',
  `info` text COMMENT '优宝反馈信息',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最近更新时间',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`srv_num`),
  KEY `member` (`memb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='youbao 服务信息表';

-- ----------------------------
-- Procedure structure for weekReportData
-- ----------------------------
DROP PROCEDURE IF EXISTS `weekReportData`;
DELIMITER ;;
CREATE DEFINER=`sifude`@`%` PROCEDURE `weekReportData`()
begin
declare i int;
declare j int;
set i = 0;
set j = 0;
SET @currentDate1 = DATE('2017-02-01');
SET @membId = 327;
SET @days = 28;

DELETE FROM tbl_usr_lifestyle where memb_id =@membId;
INSERT INTO tbl_usr_lifestyle ( memb_id, sleep_hour, wake_hour, is_nap, create_time, record_status) VALUES (@membId, '8', '12', '0', '2017-02-01 14:26:52', '0');

repeat 
    select @currentDate1 from dual;
    if j>=8 then 
    SET j=0;
    end if;  

    -- 删除tbl_usr_health_data
    DELETE FROM zeroonetest.`tbl_usr_health_data`  where uid =@membId and data_time = CONVERT(date_format(@currentDate1,'%Y%m%d'),SIGNED);
    -- 删除tbl_health_score_dtl
    DELETE FROM tbl_health_score_dtl where statistics_date = DATE(@currentDate1) and parent_id=(select pkid from tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId) ;
    -- 删除tbl_health_score
    DELETE FROM tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId;
    -- 删除tbl_usr_data
    DELETE FROM tbl_usr_data where data_type in ('sleep','step') and  check_time = DATE(@currentDate1) and memb_id=@membId;
   
    -- 插入tbl_usr_health_data
    INSERT INTO zeroonetest.`tbl_usr_health_data` VALUES ('100', @membId, CONVERT(date_format(@currentDate1,'%Y%m%d'),SIGNED), '{\"olaCount\":"372",\"appCount\":[{\"key\":\"com.tencent.mobileqq\",\"value\":\"2\"},{\"key\":\"com.tencent.qqmusic\",\"value\":\"2\"},{\"key\":\"com.tencent.android.qqdownloader\",\"value\":\"2\"},{\"key\":\"com.tencent.mm\",\"value\":\"2\"}],\"articles\":[3729,2953,3734],\"doctorReply\":[\"16\",\"3\",\"17\"],\"forceTipsCount\":[{\"key\":\"1\",\"value\":\"1\"},{\"key\":\"2\",\"value\":\"2\"},{\"key\":\"3\",\"value\":\"3\"}],\"sleepTime\":\"2017-02-02 20:59:00\",\"vedioCount\":[{\"key\":\"2月第2期\",\"value\":\"1\"}],\"weakTipsCount\":[{\"key\":\"1\",\"value\":\"1\"},{\"key\":\"2\",\"value\":\"2\"},{\"key\":\"3\",\"value\":\"3\"}],\"healthPlan\":[\"12\"]}', '0', '2017-02-02 21:38:14', '2017-02-13 16:53:15');
    -- 插入tbl_usr_data step
    /*INSERT INTO tbl_usr_data (memb_id, data_type, data_value, check_time, check_tick) VALUES(@membId,'step',500 + 500*i,@currentDate1, @currentDate1);*/
		INSERT INTO tbl_usr_data (memb_id, data_type, data_value, check_time, check_tick) VALUES(@membId,'step',500+50*i,@currentDate1, @currentDate1);
    -- 插入tbl_usr_data sleep
    /*INSERT INTO tbl_usr_data (memb_id, data_type, data_value, check_time, check_tick) VALUES(@membId,'sleep',5 + 0.5*i,@currentDate1, @currentDate1);*/
		INSERT INTO tbl_usr_data (memb_id, data_type, data_value, check_time, check_tick) VALUES(@membId,'sleep',8 + 0.1*i,@currentDate1, @currentDate1);
    -- 插入tbl_health_score
    INSERT into tbl_health_score (memb_id,statistic_date,score) VALUES (@membId,@currentDate1,40);
    -- 插入tbl_health_score_dtl
    INSERT INTO tbl_health_score_dtl (parent_id,catalog_id,score,statistics_date) VALUES ( (select pkid from tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId limit 1) ,1,10,@currentDate1);
    INSERT INTO tbl_health_score_dtl (parent_id,catalog_id,score,statistics_date) VALUES ( (select pkid from tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId limit 1) ,2,10,@currentDate1);
    INSERT INTO tbl_health_score_dtl (parent_id,catalog_id,score,statistics_date) VALUES ( (select pkid from tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId limit 1) ,3,10,@currentDate1);   
    INSERT INTO tbl_health_score_dtl (parent_id,catalog_id,score,statistics_date) VALUES ( (select pkid from tbl_health_score where statistic_date = DATE(@currentDate1) and memb_id=@membId limit 1) ,4,10,@currentDate1);
    
    set i = i + 1;
    set j = j + 1;
    
    SET @currentDate1 = DATE_ADD(@currentDate1,INTERVAL 1 DAY);
until i >= @days

end repeat;

end
;;
DELIMITER ;
