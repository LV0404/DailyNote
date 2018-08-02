/*
Navicat MySQL Data Transfer

Source Server         : 222.73.134.245
Source Server Version : 50173
Source Host           : 222.73.134.245:3306
Source Database       : app

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2018-08-02 10:47:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_account
-- ----------------------------
DROP TABLE IF EXISTS `t_account`;
CREATE TABLE `t_account` (
  `id` varchar(32) NOT NULL COMMENT '主键ID',
  `account_id` varchar(32) DEFAULT NULL COMMENT '账户唯一ID',
  `address` varchar(2000) NOT NULL COMMENT '地址',
  `bus_id` varchar(40) DEFAULT NULL COMMENT '登录账户',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `is_enable` varchar(1) DEFAULT '1' COMMENT '是否启用',
  `is_delete` varchar(1) DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(400) DEFAULT NULL COMMENT '备注',
  `pay_password` varchar(400) DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='账户';

-- ----------------------------
-- Table structure for t_account_balance
-- ----------------------------
DROP TABLE IF EXISTS `t_account_balance`;
CREATE TABLE `t_account_balance` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `address` varchar(50) DEFAULT NULL COMMENT '账户id',
  `eth_amount` decimal(16,2) DEFAULT NULL COMMENT 'eth余额',
  `eth_amount_freeze` decimal(16,2) DEFAULT NULL COMMENT 'eth冻结金额',
  `hgs_amount` decimal(16,2) DEFAULT NULL COMMENT 'hgs余额',
  `hgs_amount_freeze` decimal(16,2) DEFAULT NULL COMMENT 'hgs冻结资金',
  `hnb_amount` decimal(16,2) DEFAULT NULL COMMENT 'hnb余额',
  `hnb_amount_freeze` decimal(16,2) DEFAULT NULL COMMENT 'hnb冻结资金',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='余额表';

-- ----------------------------
-- Table structure for t_account_msg
-- ----------------------------
DROP TABLE IF EXISTS `t_account_msg`;
CREATE TABLE `t_account_msg` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `account` varchar(40) DEFAULT NULL COMMENT '关联账户',
  `order_no` varchar(40) DEFAULT NULL COMMENT '订单号',
  `is_read` char(1) DEFAULT NULL COMMENT '已读标记',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity
-- ----------------------------
DROP TABLE IF EXISTS `t_activity`;
CREATE TABLE `t_activity` (
  `id` varchar(32) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `start_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `is_enable` char(1) DEFAULT NULL COMMENT '是否禁用',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建者',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新者'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_activity_account
-- ----------------------------
DROP TABLE IF EXISTS `t_activity_account`;
CREATE TABLE `t_activity_account` (
  `id` varchar(32) DEFAULT NULL,
  `account` varchar(40) DEFAULT NULL COMMENT '账户',
  `activity_id` varchar(32) DEFAULT NULL COMMENT '活动Id',
  `is_read` char(1) DEFAULT NULL COMMENT '已读标识，0未读  1已读',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_balance
-- ----------------------------
DROP TABLE IF EXISTS `t_balance`;
CREATE TABLE `t_balance` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(100) DEFAULT NULL COMMENT '账户地址',
  `currency` varchar(10) DEFAULT NULL COMMENT '币种',
  `amount` decimal(26,10) DEFAULT NULL COMMENT '金额',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_balance_freeze
-- ----------------------------
DROP TABLE IF EXISTS `t_balance_freeze`;
CREATE TABLE `t_balance_freeze` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `address` varchar(400) NOT NULL COMMENT '账号地址',
  `curreny` varchar(3) NOT NULL COMMENT '币种',
  `amount` decimal(30,14) DEFAULT NULL COMMENT '金额',
  `status` char(1) DEFAULT '0' COMMENT '是否解冻 0冻结 1解冻',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_contract_address
-- ----------------------------
DROP TABLE IF EXISTS `t_contract_address`;
CREATE TABLE `t_contract_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '币种名',
  `contract_address` varchar(500) NOT NULL COMMENT '合约地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_curreny_rate
-- ----------------------------
DROP TABLE IF EXISTS `t_curreny_rate`;
CREATE TABLE `t_curreny_rate` (
  `id` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `currency` varchar(10) NOT NULL COMMENT 'HGS对美元汇率',
  `to_usd` decimal(16,6) NOT NULL COMMENT 'ETH对美元汇率',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` char(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_eth_zd
-- ----------------------------
DROP TABLE IF EXISTS `t_eth_zd`;
CREATE TABLE `t_eth_zd` (
  `ID` varchar(32) NOT NULL,
  `BM` varchar(32) DEFAULT NULL,
  `MC` varchar(100) DEFAULT NULL,
  `JC` varchar(32) DEFAULT NULL,
  `PYJP` varchar(32) DEFAULT NULL,
  `SJBM` varchar(50) DEFAULT NULL,
  `PX` varchar(32) DEFAULT NULL,
  `MS` varchar(200) DEFAULT NULL,
  `LXJP` varchar(32) DEFAULT NULL,
  `YXX` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(25) NOT NULL DEFAULT '',
  `orderName` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_rate_eth
-- ----------------------------
DROP TABLE IF EXISTS `t_rate_eth`;
CREATE TABLE `t_rate_eth` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `currency` varchar(16) DEFAULT NULL,
  `rate_eth` decimal(16,6) DEFAULT NULL COMMENT 'eth对齐汇率',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_delete` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_record
-- ----------------------------
DROP TABLE IF EXISTS `t_record`;
CREATE TABLE `t_record` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `from_address` varchar(2000) NOT NULL COMMENT '发起者地址',
  `to_address` varchar(2000) NOT NULL COMMENT '接收者地址',
  `txid` varchar(300) DEFAULT NULL COMMENT '交易哈希id',
  `amount` decimal(24,16) NOT NULL COMMENT '交易金额',
  `trade_block_no` varchar(10) DEFAULT NULL COMMENT '交易区块序号',
  `block_hash` varchar(100) DEFAULT NULL COMMENT '交易HASHID',
  `trade_fee` decimal(24,10) DEFAULT NULL COMMENT '交易手续费',
  `status` char(2) NOT NULL COMMENT '交易状态',
  `input_data` varchar(300) DEFAULT NULL COMMENT '前置数据',
  `to_currency` char(3) DEFAULT NULL COMMENT '汇兑时转入币种',
  `currency` char(3) DEFAULT NULL COMMENT '币种',
  `nonce_str` varchar(10) DEFAULT NULL COMMENT '随机数',
  `gas_limit` decimal(24,10) DEFAULT NULL COMMENT 'GAS上限',
  `gas_used` decimal(24,10) DEFAULT NULL COMMENT 'GAS消耗量',
  `gas_price` decimal(24,10) DEFAULT NULL COMMENT 'GAS单价',
  `sys_id` varchar(32) NOT NULL COMMENT '所属系统ID',
  `is_callback` char(1) DEFAULT NULL COMMENT '是否回调',
  `is_delete` char(1) DEFAULT NULL COMMENT '是否删除',
  `pay_type` varchar(2) DEFAULT NULL COMMENT '交易类型',
  `order_no` varchar(20) DEFAULT NULL COMMENT '本系统流水号',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ak_uq_tx_hashid` (`txid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='区块交易记录';

-- ----------------------------
-- Table structure for t_s_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_resource`;
CREATE TABLE `t_s_resource` (
  `id` varchar(36) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `href` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `order_no` int(11) DEFAULT NULL,
  `resource_type` int(11) DEFAULT NULL,
  `parentid` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_t_s_resource_t_s_resource1` (`parentid`),
  CONSTRAINT `fk_t_s_resource_t_s_resource1` FOREIGN KEY (`parentid`) REFERENCES `t_s_resource` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_s_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role`;
CREATE TABLE `t_s_role` (
  `id` varchar(36) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_s_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_s_role_resource`;
CREATE TABLE `t_s_role_resource` (
  `role_id` varchar(36) NOT NULL,
  `resource_id` varchar(36) NOT NULL,
  KEY `FK17BAC656127E527` (`role_id`),
  KEY `FK17BAC653B9CBFA7` (`resource_id`),
  CONSTRAINT `FK17BAC653B9CBFA7` FOREIGN KEY (`resource_id`) REFERENCES `t_s_resource` (`id`),
  CONSTRAINT `FK17BAC656127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_s_user
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user`;
CREATE TABLE `t_s_user` (
  `id` varchar(36) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `position_desc` varchar(100) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userName` varchar(50) NOT NULL,
  `sys_id` char(1) DEFAULT NULL COMMENT '0:钱包后台用户，1：资金管理后台用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_s_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_s_user_role`;
CREATE TABLE `t_s_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  KEY `FKD0596186127E527` (`role_id`),
  KEY `FKD059618652A907` (`user_id`),
  CONSTRAINT `FKD0596186127E527` FOREIGN KEY (`role_id`) REFERENCES `t_s_role` (`id`),
  CONSTRAINT `FKD059618652A907` FOREIGN KEY (`user_id`) REFERENCES `t_s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_log`;
CREATE TABLE `t_sys_log` (
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT '主键id',
  `client_ip` varchar(255) DEFAULT NULL COMMENT '请求IP地址',
  `request_url` varchar(1000) DEFAULT NULL COMMENT '请求URL地址',
  `method` varchar(20) DEFAULT NULL COMMENT '请求方法类型',
  `params` blob COMMENT '请求参数',
  `exceptions` blob COMMENT '异常',
  `begin_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `log_module` varchar(200) DEFAULT NULL COMMENT '日志模块',
  `log_introduce` varchar(200) DEFAULT NULL COMMENT '日志描述',
  `time_data` varchar(200) DEFAULT NULL COMMENT '请求耗时',
  `commite` varchar(20) DEFAULT NULL COMMENT '描述',
  `result` blob,
  `sys_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for generate_orderNo
-- ----------------------------
DROP PROCEDURE IF EXISTS `generate_orderNo`;
DELIMITER ;;
CREATE DEFINER=`wallet`@`%` PROCEDURE `generate_orderNo`(in orderNamePre char(2), in num int, in orderName varchar(8), out newOrderNo varchar(25))
BEGIN    
  DECLARE currentDate varCHAR (15) ;-- 当前日期,有可能包含时分秒     
  DECLARE maxNo INT DEFAULT 0 ; -- 离现在最近的满足条件的订单编号的流水号最后5位，如：SH2013011000002的maxNo=2     
--  DECLARE l_orderNo varCHAR (25) ;-- 新生成的订单编号     
--  DECLARE oldDate DATE ;-- 离现在最近的满足条件的订单编号的日期     
  DECLARE oldOrderNo VARCHAR (25) DEFAULT '' ;-- 离现在最近的满足条件的订单编号     
      
  if num = 8 then -- 根据年月日生成订单编号     
    SELECT DATE_FORMAT(NOW(), '%Y%m%d') INTO currentDate ;-- 订单编号形式:前缀+年月日+流水号，如：SH2013011000002     
  elseif num = 14 then -- 根据年月日时分秒生成订单编号     
    SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i%s') INTO currentDate ; -- 订单编号形式：前缀+年月日时分秒+流水号，如：SH2013011010050700001,个人不推荐使用这种方法生成流水号     
  else -- 根据年月日时分生成订单编号     
    SELECT DATE_FORMAT(NOW(), '%Y%m%d%H%i') INTO currentDate ;-- 订单形式：前缀+年月日时分+流水号,如：SH20130110100900005     
  end if ;    
      
  SELECT IFNULL(orderNo, '') INTO oldOrderNo     
  FROM t_orders     
  WHERE SUBSTRING(orderNo, 3, num) = currentDate     
    AND SUBSTRING(orderNo, 1, 2) = orderNamePre     
    and length(orderNo) = 7 + num    
  ORDER BY id DESC LIMIT 1 ; -- 有多条时只显示离现在最近的一条     
      
  IF oldOrderNo != '' THEN     
    SET maxNo = CONVERT(SUBSTRING(oldOrderNo, -5), DECIMAL) ;-- SUBSTRING(oldOrderNo, -5)：订单编号如果不为‘‘截取订单的最后5位     
  END IF ;    
  SELECT     
    CONCAT(orderNamePre, currentDate,  LPAD((maxNo + 1), 5, '0')) INTO newOrderNo ; -- LPAD((maxNo + 1), 5, '0')：如果不足5位，将用0填充左边     
      
  INSERT INTO t_orders (orderNo, orderName) VALUES (newOrderNo, orderName) ; -- 向订单表中插入数据     
--    set newOrderNo = l_orderNo;     
  SELECT     
    newOrderNo ;    
END
;;
DELIMITER ;
