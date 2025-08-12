/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 5.5.8 : Database - ingress
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ingress` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ingress`;

/*Table structure for table `access_group` */

DROP TABLE IF EXISTS `access_group`;

CREATE TABLE `access_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessname` varchar(45) DEFAULT NULL,
  `accessdesc` varchar(200) DEFAULT NULL,
  `usergroup` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `limit_flag` int(1) DEFAULT '0',
  `limit_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `access_group_door` */

DROP TABLE IF EXISTS `access_group_door`;

CREATE TABLE `access_group_door` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessid` int(11) DEFAULT NULL,
  `doorid` int(11) DEFAULT NULL,
  `timesetid` int(11) DEFAULT NULL,
  `holidayflag` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verifytype` int(11) DEFAULT '0',
  `timezoneid` int(11) DEFAULT '0',
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accessid` (`accessid`),
  KEY `doorid` (`doorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `access_group_user` */

DROP TABLE IF EXISTS `access_group_user`;

CREATE TABLE `access_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessid` int(11) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `accessid` (`accessid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `active_directory` */

DROP TABLE IF EXISTS `active_directory`;

CREATE TABLE `active_directory` (
  `idactive_directory` int(11) NOT NULL AUTO_INCREMENT,
  `ad_display` varchar(200) DEFAULT NULL,
  `ad_value` varchar(200) DEFAULT NULL,
  `open_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`idactive_directory`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

/*Table structure for table `att_detailsexport` */

DROP TABLE IF EXISTS `att_detailsexport`;

CREATE TABLE `att_detailsexport` (
  `idatt_detailsexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `selectedFields` longtext,
  `delimited` int(1) DEFAULT '0',
  `hundredth` int(1) DEFAULT '0',
  `appenddata` int(1) DEFAULT '0',
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `jobcosting` int(1) DEFAULT '0',
  `align` int(11) DEFAULT '3',
  `terminalid` int(11) DEFAULT '0',
  `separated` int(11) DEFAULT '0',
  `splitTerminalID` int(1) DEFAULT NULL,
  `isMDB` int(1) DEFAULT NULL,
  `ODBCusername` varchar(100) DEFAULT NULL,
  `ODBCpassword` varchar(100) DEFAULT NULL,
  `hourformat` int(1) DEFAULT '0',
  `terminalidlength` int(11) DEFAULT '3',
  `columnheader` int(1) DEFAULT '0',
  `dateformat` int(1) DEFAULT '0',
  `hourlength` int(1) DEFAULT '0',
  `datagroupby` int(11) DEFAULT '0',
  `odbctable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idatt_detailsexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollexport` */

DROP TABLE IF EXISTS `att_payrollexport`;

CREATE TABLE `att_payrollexport` (
  `idatt_payrollexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `userid` longtext,
  `path` longtext,
  `date` varchar(50) DEFAULT NULL,
  `company` varchar(200) DEFAULT NULL,
  `WOT` varchar(100) DEFAULT NULL,
  `workhour` decimal(5,2) DEFAULT '0.00',
  `shiftallowance` int(5) DEFAULT '0',
  `mealallowance` int(5) DEFAULT '0',
  `grid` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2013-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type_employment_id` int(1) DEFAULT NULL,
  `type_user_id` int(1) DEFAULT NULL,
  `leavetype` longtext,
  `shorthour` int(1) DEFAULT NULL,
  `latein_earlyout` int(1) DEFAULT NULL,
  `export_payroll_to` int(1) DEFAULT NULL,
  `isTXT` int(1) DEFAULT NULL,
  PRIMARY KEY (`idatt_payrollexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollkakiexport` */

DROP TABLE IF EXISTS `att_payrollkakiexport`;

CREATE TABLE `att_payrollkakiexport` (
  `idatt_payrollkakiexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `enable_options` longtext,
  `allowance_general` varchar(10) DEFAULT NULL,
  `allowance_meal` varchar(10) DEFAULT NULL,
  `allowance_transport` varchar(10) DEFAULT NULL,
  `allowance_phone` varchar(10) DEFAULT NULL,
  `claims` varchar(10) DEFAULT NULL,
  `commission` varchar(10) DEFAULT NULL,
  `bonus` varchar(10) DEFAULT NULL,
  `allowance_petro` varchar(10) DEFAULT NULL,
  `allowance_parking` varchar(10) DEFAULT NULL,
  `allowance_incentive` varchar(10) DEFAULT NULL,
  `allowance_laudry` varchar(10) DEFAULT NULL,
  `allowance_cash_handling` varchar(10) DEFAULT NULL,
  `wages_arrears` varchar(10) DEFAULT NULL,
  `allowance_others` varchar(10) DEFAULT NULL,
  `userid` longtext,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idatt_payrollkakiexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollmillionexport` */

DROP TABLE IF EXISTS `att_payrollmillionexport`;

CREATE TABLE `att_payrollmillionexport` (
  `idatt_payrollmillionexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_user_id` int(11) DEFAULT NULL,
  `type_employment_id` int(11) DEFAULT NULL,
  `selected_ot` longtext,
  `export_template` longtext,
  `country` varchar(1) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` longtext,
  PRIMARY KEY (`idatt_payrollmillionexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollmyobexport` */

DROP TABLE IF EXISTS `att_payrollmyobexport`;

CREATE TABLE `att_payrollmyobexport` (
  `idatt_payrollmyobexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_user_id` int(1) DEFAULT '0',
  `type_employment_id` int(1) DEFAULT '0',
  `wdw` varchar(45) DEFAULT NULL,
  `wdo` varchar(45) DEFAULT NULL,
  `wddo` varchar(45) DEFAULT NULL,
  `hdw` varchar(45) DEFAULT NULL,
  `hdo` varchar(45) DEFAULT NULL,
  `hddo` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `rdo` varchar(45) DEFAULT NULL,
  `rddo` varchar(45) DEFAULT NULL,
  `odw` varchar(45) DEFAULT NULL,
  `odo` varchar(45) DEFAULT NULL,
  `oddo` varchar(45) DEFAULT NULL,
  `adw` varchar(45) DEFAULT NULL,
  `ado` varchar(45) DEFAULT NULL,
  `addo` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leavetype` longtext,
  `userid` longtext,
  PRIMARY KEY (`idatt_payrollmyobexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollpastelexport` */

DROP TABLE IF EXISTS `att_payrollpastelexport`;

CREATE TABLE `att_payrollpastelexport` (
  `idatt_payrollpastelexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_id` int(11) DEFAULT '0' COMMENT 'UserID: 0, EmployeeID: 1',
  `costcode_wdw` varchar(30) DEFAULT NULL,
  `costcode_wdo` varchar(30) DEFAULT NULL,
  `costcode_wddo` varchar(30) DEFAULT NULL,
  `costcode_rdw` varchar(30) DEFAULT NULL,
  `costcode_rdo` varchar(30) DEFAULT NULL,
  `costcode_rddo` varchar(30) DEFAULT NULL,
  `costcode_hdw` varchar(30) DEFAULT NULL,
  `costcode_hdo` varchar(30) DEFAULT NULL,
  `costcode_hddo` varchar(30) DEFAULT NULL,
  `costcode_odw` varchar(30) DEFAULT NULL,
  `costcode_odo` varchar(30) DEFAULT NULL,
  `costcode_oddo` varchar(30) DEFAULT NULL,
  `hour_format` int(11) DEFAULT '1' COMMENT 'HH:MM: 0, HH:HH: 1',
  `userid_selected` longtext,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idatt_payrollpastelexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollreckonexport` */

DROP TABLE IF EXISTS `att_payrollreckonexport`;

CREATE TABLE `att_payrollreckonexport` (
  `idatt_payrollreckonexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_user_id` int(11) DEFAULT NULL,
  `type_employment_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idatt_payrollreckonexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollsqlexport` */

DROP TABLE IF EXISTS `att_payrollsqlexport`;

CREATE TABLE `att_payrollsqlexport` (
  `idatt_payrollsqlexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `export_overtime` int(1) DEFAULT '0',
  `export_leave` int(1) DEFAULT '0',
  `createdate` datetime DEFAULT '2016-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `path_ot` longtext,
  `path_leave` longtext,
  `export_short` int(1) DEFAULT NULL,
  `wdo` varchar(45) DEFAULT NULL,
  `wddo` varchar(45) DEFAULT NULL,
  `hdo` varchar(45) DEFAULT NULL,
  `hddo` varchar(45) DEFAULT NULL,
  `rdo` varchar(45) DEFAULT NULL,
  `rddo` varchar(45) DEFAULT NULL,
  `odo` varchar(45) DEFAULT NULL,
  `oddo` varchar(45) DEFAULT NULL,
  `ab_code` varchar(45) DEFAULT NULL,
  `wdw` varchar(45) DEFAULT NULL,
  `hdw` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `odw` varchar(45) DEFAULT NULL,
  `export_ot_workunit` int(1) DEFAULT NULL,
  `type_user_id` int(11) DEFAULT NULL,
  `type_employment_id` int(11) DEFAULT NULL,
  `userid` longtext,
  PRIMARY KEY (`idatt_payrollsqlexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollunipayexport` */

DROP TABLE IF EXISTS `att_payrollunipayexport`;

CREATE TABLE `att_payrollunipayexport` (
  `idatt_payrollunipayexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_user_id` int(1) DEFAULT '0',
  `type_employment_id` int(1) DEFAULT '0',
  `wdw` varchar(45) DEFAULT NULL,
  `wdo` varchar(45) DEFAULT NULL,
  `wddo` varchar(45) DEFAULT NULL,
  `hdw` varchar(45) DEFAULT NULL,
  `hdo` varchar(45) DEFAULT NULL,
  `hddo` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `rdo` varchar(45) DEFAULT NULL,
  `rddo` varchar(45) DEFAULT NULL,
  `odw` varchar(45) DEFAULT NULL,
  `odo` varchar(45) DEFAULT NULL,
  `oddo` varchar(45) DEFAULT NULL,
  `adw` varchar(45) DEFAULT NULL,
  `ado` varchar(45) DEFAULT NULL,
  `addo` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `leavetype` longtext,
  `userid` longtext,
  PRIMARY KEY (`idatt_payrollunipayexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollusaexport` */

DROP TABLE IF EXISTS `att_payrollusaexport`;

CREATE TABLE `att_payrollusaexport` (
  `idatt_payrollusaexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `export_type` int(11) DEFAULT '0',
  `sort_order` int(11) DEFAULT '0',
  `pay_period` int(11) DEFAULT '0',
  `separate_file` int(1) DEFAULT '0',
  `warn_miss_punch` int(1) DEFAULT '0',
  `warn_data_download` int(1) DEFAULT '0',
  `include_suspended` int(1) DEFAULT '0',
  `include_no_hours` int(1) DEFAULT '0',
  `wdw` varchar(45) DEFAULT NULL,
  `wdot` varchar(45) DEFAULT NULL,
  `wddiffot` varchar(45) DEFAULT NULL,
  `hdw` varchar(45) DEFAULT NULL,
  `hdot` varchar(45) DEFAULT NULL,
  `hddiffot` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `rdot` varchar(45) DEFAULT NULL,
  `rddiffot` varchar(45) DEFAULT NULL,
  `odw` varchar(45) DEFAULT NULL,
  `odot` varchar(45) DEFAULT NULL,
  `oddiffot` varchar(45) DEFAULT NULL,
  `export_empty` int(1) DEFAULT '0',
  `add_amount` int(1) DEFAULT '0',
  `absent` varchar(45) DEFAULT NULL,
  `leave_1` varchar(45) DEFAULT NULL,
  `leave_2` varchar(45) DEFAULT NULL,
  `leave_3` varchar(45) DEFAULT NULL,
  `leave_4` varchar(45) DEFAULT NULL,
  `leave_5` varchar(45) DEFAULT NULL,
  `leave_6` varchar(45) DEFAULT NULL,
  `leave_7` varchar(45) DEFAULT NULL,
  `leave_8` varchar(45) DEFAULT NULL,
  `leave_9` varchar(45) DEFAULT NULL,
  `leave_10` varchar(45) DEFAULT NULL,
  `leave_11` varchar(45) DEFAULT NULL,
  `leave_12` varchar(45) DEFAULT NULL,
  `leave_13` varchar(45) DEFAULT NULL,
  `leave_14` varchar(45) DEFAULT NULL,
  `leave_15` varchar(45) DEFAULT NULL,
  `leave_16` varchar(45) DEFAULT NULL,
  `leave_17` varchar(45) DEFAULT NULL,
  `leave_18` varchar(45) DEFAULT NULL,
  `leave_19` varchar(45) DEFAULT NULL,
  `leave_20` varchar(45) DEFAULT NULL,
  `additional_calc` int(1) DEFAULT '0',
  `additional_consecutive` decimal(4,2) DEFAULT NULL,
  `additional_type` int(11) DEFAULT '0',
  `additional_hours` decimal(4,2) DEFAULT NULL,
  `additional_per` int(11) DEFAULT '0',
  `salary_include` int(1) DEFAULT '0',
  `salary_column` int(11) DEFAULT '0',
  `salary_code` varchar(45) DEFAULT NULL,
  `holiday_pay_non` int(1) DEFAULT '0',
  `holiday_hours` decimal(4,2) DEFAULT NULL,
  `holiday_code` varchar(45) DEFAULT NULL,
  `export_department` int(1) DEFAULT '0',
  `export_detail` int(1) DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `leave_21` varchar(45) DEFAULT NULL,
  `leave_22` varchar(45) DEFAULT NULL,
  `leave_23` varchar(45) DEFAULT NULL,
  `leave_24` varchar(45) DEFAULT NULL,
  `leave_25` varchar(45) DEFAULT NULL,
  `leave_26` varchar(45) DEFAULT NULL,
  `leave_27` varchar(45) DEFAULT NULL,
  `leave_28` varchar(45) DEFAULT NULL,
  `leave_29` varchar(45) DEFAULT NULL,
  `leave_30` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idatt_payrollusaexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollvipexport` */

DROP TABLE IF EXISTS `att_payrollvipexport`;

CREATE TABLE `att_payrollvipexport` (
  `idatt_payrollvipexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `company_code` varchar(30) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0' COMMENT 'UserID: 0, EmployeeID: 1',
  `allow_ot` int(11) DEFAULT '1' COMMENT 'Yes: 1, No: 0',
  `allow_restday` int(11) DEFAULT '0' COMMENT 'Yes: 1, No: 0',
  `allow_offday` int(11) DEFAULT '1' COMMENT 'Yes: 1, No: 0',
  `allow_holiday` int(11) DEFAULT '1' COMMENT 'Yes: 1, No: 0',
  `userid_selected` longtext,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idatt_payrollvipexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_payrollwc7export` */

DROP TABLE IF EXISTS `att_payrollwc7export`;

CREATE TABLE `att_payrollwc7export` (
  `idatt_payrollwc7export` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `type_user_id` int(1) DEFAULT '0',
  `type_employment_id` int(1) DEFAULT NULL,
  `update_info` int(1) DEFAULT '0',
  `hours_per_day` decimal(5,2) DEFAULT '0.00',
  `deduction_code` varchar(45) DEFAULT NULL,
  `leave_code` varchar(45) DEFAULT NULL,
  `work_hour` int(1) DEFAULT '0',
  `overtime_hour` int(1) DEFAULT '0',
  `short_minutes` int(1) DEFAULT '0',
  `absent` int(1) DEFAULT '0',
  `wdw` varchar(45) DEFAULT NULL,
  `wdo` varchar(45) DEFAULT NULL,
  `hdw` varchar(45) DEFAULT NULL,
  `hdo` varchar(45) DEFAULT NULL,
  `rdw` varchar(45) DEFAULT NULL,
  `rdo` varchar(45) DEFAULT NULL,
  `odw` varchar(45) DEFAULT NULL,
  `odo` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `userid` longtext,
  PRIMARY KEY (`idatt_payrollwc7export`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `att_summaryexport` */

DROP TABLE IF EXISTS `att_summaryexport`;

CREATE TABLE `att_summaryexport` (
  `idatt_summaryexport` int(11) NOT NULL AUTO_INCREMENT,
  `idtemplate` int(11) DEFAULT NULL,
  `path` longtext,
  `selectedFields` longtext,
  `delimited` int(1) DEFAULT '0',
  `hundredth` int(1) DEFAULT '0',
  `appenddata` int(1) DEFAULT '0',
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `align` int(11) DEFAULT '3',
  `terminalid` int(11) DEFAULT '0',
  `separated` int(11) DEFAULT '0',
  `leavehour` int(11) DEFAULT '0',
  `isMDB` int(1) DEFAULT NULL,
  `ODBCusername` varchar(100) DEFAULT NULL,
  `ODBCpassword` varchar(100) DEFAULT NULL,
  `hourformat` int(1) DEFAULT '0',
  `occurrence` longtext,
  `columnheader` int(1) DEFAULT '0',
  `odbctable` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idatt_summaryexport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `idattendance_sheet` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `daytype` varchar(45) DEFAULT NULL,
  `leavetype` int(11) NOT NULL DEFAULT '0',
  `sche1` int(11) NOT NULL DEFAULT '0',
  `shiftNo` int(1) NOT NULL DEFAULT '1',
  `att_in` varchar(5) DEFAULT NULL,
  `att_break` varchar(5) DEFAULT NULL,
  `att_resume` varchar(5) DEFAULT NULL,
  `att_out` varchar(5) DEFAULT NULL,
  `att_ot` varchar(5) DEFAULT NULL,
  `att_done` varchar(5) DEFAULT NULL,
  `workhour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `othour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `shorthour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `in_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `break_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `resume_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `out_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `ot_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `done_s` decimal(4,2) NOT NULL DEFAULT '0.00',
  `daytype_c` int(1) NOT NULL DEFAULT '0',
  `leavetype_c` int(1) NOT NULL DEFAULT '0',
  `remark_c` int(1) NOT NULL DEFAULT '0',
  `sche1_c` int(1) NOT NULL DEFAULT '0',
  `in_c` int(1) NOT NULL DEFAULT '0',
  `break_c` int(1) NOT NULL DEFAULT '0',
  `resume_c` int(1) NOT NULL DEFAULT '0',
  `out_c` int(1) NOT NULL DEFAULT '0',
  `ot_c` int(1) NOT NULL DEFAULT '0',
  `done_c` int(1) NOT NULL DEFAULT '0',
  `workhour_c` int(1) NOT NULL DEFAULT '0',
  `othour_c` int(1) NOT NULL DEFAULT '0',
  `shorthour_c` int(1) NOT NULL DEFAULT '0',
  `in_x` int(1) NOT NULL DEFAULT '0',
  `break_x` int(1) NOT NULL DEFAULT '0',
  `resume_x` int(1) NOT NULL DEFAULT '0',
  `out_x` int(1) NOT NULL DEFAULT '0',
  `ot_x` int(1) NOT NULL DEFAULT '0',
  `done_x` int(1) NOT NULL DEFAULT '0',
  `remark` int(11) NOT NULL DEFAULT '0',
  `hasmisspunch` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `diffothour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `diffothour_c` int(1) NOT NULL DEFAULT '0',
  `in_o` varchar(5) DEFAULT NULL,
  `break_o` varchar(5) DEFAULT NULL,
  `resume_o` varchar(5) DEFAULT NULL,
  `out_o` varchar(5) DEFAULT NULL,
  `ot_o` varchar(5) DEFAULT NULL,
  `done_o` varchar(5) DEFAULT NULL,
  `SumWork` decimal(7,3) NOT NULL DEFAULT '0.000',
  `SumOT` decimal(7,3) NOT NULL DEFAULT '0.000',
  `SumDiffOT` decimal(7,3) NOT NULL DEFAULT '0.000',
  `SumShort` decimal(7,3) NOT NULL DEFAULT '0.000',
  `TotHr` decimal(7,3) NOT NULL DEFAULT '0.000',
  `TotWork` decimal(7,3) NOT NULL DEFAULT '0.000',
  `TotOT` decimal(7,3) NOT NULL DEFAULT '0.000',
  `TotDiff` decimal(7,3) NOT NULL DEFAULT '0.000',
  `TotDiffOT` decimal(7,3) NOT NULL DEFAULT '0.000',
  `BankHour` decimal(7,3) NOT NULL DEFAULT '0.000',
  `LeaveHour` decimal(7,3) NOT NULL DEFAULT '0.000',
  `SumWork_c` int(1) NOT NULL DEFAULT '0',
  `SumOT_c` int(1) NOT NULL DEFAULT '0',
  `SumDiffOT_c` int(1) NOT NULL DEFAULT '0',
  `SumShort_c` int(1) NOT NULL DEFAULT '0',
  `TotHr_c` int(1) NOT NULL DEFAULT '0',
  `TotWork_c` int(1) NOT NULL DEFAULT '0',
  `TotOT_c` int(1) NOT NULL DEFAULT '0',
  `TotDiff_c` int(1) NOT NULL DEFAULT '0',
  `TotDiffOT_c` int(1) NOT NULL DEFAULT '0',
  `BankHour_c` int(1) NOT NULL DEFAULT '0',
  `LeaveHour_c` int(1) NOT NULL DEFAULT '0',
  `desc` varchar(200) DEFAULT NULL,
  `desc_c` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idattendance_sheet`),
  UNIQUE KEY `pk` (`userid`,`date`,`shiftNo`),
  KEY `att_date` (`date`),
  KEY `att_userid` (`userid`),
  KEY `att_sche1` (`sche1`),
  KEY `att_shiftno` (`shiftNo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `attendance_job_costing` */

DROP TABLE IF EXISTS `attendance_job_costing`;

CREATE TABLE `attendance_job_costing` (
  `idattendance_job_costing` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `att_in` varchar(5) DEFAULT NULL,
  `att_out` varchar(5) DEFAULT NULL,
  `workhour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `othour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `diffothour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `in_c` int(1) NOT NULL DEFAULT '0',
  `out_c` int(1) NOT NULL DEFAULT '0',
  `workhour_c` int(1) NOT NULL DEFAULT '0',
  `othour_c` int(1) NOT NULL DEFAULT '0',
  `diffothour_c` int(1) NOT NULL DEFAULT '0',
  `in_x` int(1) NOT NULL DEFAULT '0',
  `out_x` int(1) NOT NULL DEFAULT '0',
  `code` int(11) NOT NULL DEFAULT '0',
  `job` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shiftno` tinyint(1) DEFAULT '1',
  `in_code` int(10) NOT NULL DEFAULT '0',
  `out_code` int(10) NOT NULL DEFAULT '0',
  `in_io` int(11) DEFAULT NULL,
  `out_io` int(11) DEFAULT NULL,
  `code_c` int(1) NOT NULL DEFAULT '0',
  `in_o` varchar(5) DEFAULT NULL,
  `out_o` varchar(5) DEFAULT NULL,
  `sequence` int(11) NOT NULL DEFAULT '0',
  `in_id` int(11) NOT NULL DEFAULT '0',
  `out_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idattendance_job_costing`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `attendance_planner` */

DROP TABLE IF EXISTS `attendance_planner`;

CREATE TABLE `attendance_planner` (
  `idattendance_planner` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `sche1` int(11) NOT NULL DEFAULT '0',
  `att_in` varchar(5) DEFAULT NULL,
  `att_break` varchar(5) DEFAULT NULL,
  `att_resume` varchar(5) DEFAULT NULL,
  `att_out` varchar(5) DEFAULT NULL,
  `att_ot` varchar(5) DEFAULT NULL,
  `att_done` varchar(5) DEFAULT NULL,
  `createdate` datetime DEFAULT '2013-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `shiftNo` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idattendance_planner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `attn_photo` */

DROP TABLE IF EXISTS `attn_photo`;

CREATE TABLE `attn_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `serialno` varchar(45) DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `successflag` int(1) DEFAULT '0',
  `photo` longtext,
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pk` (`userid`,`serialno`,`checktime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `auditdata` */

DROP TABLE IF EXISTS `auditdata`;

CREATE TABLE `auditdata` (
  `idAttendance` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(45) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `verifycode` int(11) DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `checktype` int(11) DEFAULT NULL,
  `workcode` int(11) DEFAULT NULL,
  `eventType` varchar(50) DEFAULT NULL,
  `Flag` int(5) DEFAULT '0',
  `ControllerDoorNo` int(5) DEFAULT '0',
  `AttendDate` date DEFAULT NULL,
  `AttendSlot` int(2) DEFAULT '0',
  `CtrlSum` varchar(10) DEFAULT NULL,
  `IsAttend` tinyint(1) DEFAULT '1',
  `isvalid` int(1) DEFAULT NULL,
  PRIMARY KEY (`idAttendance`),
  UNIQUE KEY `AttendancePK` (`serialno`,`userid`,`checktime`),
  KEY `serialno` (`serialno`),
  KEY `userid` (`userid`),
  KEY `audit_userid` (`userid`),
  KEY `audit_IsAttend` (`IsAttend`),
  KEY `audit_Flag` (`Flag`),
  KEY `audit_checktime` (`checktime`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `auditdata_broken` */

DROP TABLE IF EXISTS `auditdata_broken`;

CREATE TABLE `auditdata_broken` (
  `idattendance` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(45) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `verifycode` int(11) DEFAULT NULL,
  `checktime` varchar(50) DEFAULT NULL,
  `checktype` int(11) DEFAULT NULL,
  `workcode` int(11) DEFAULT NULL,
  `eventType` varchar(50) DEFAULT NULL,
  `Flag` int(5) DEFAULT '1',
  `CreatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`idattendance`),
  KEY `serialno` (`serialno`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `auditdata_odbc` */

DROP TABLE IF EXISTS `auditdata_odbc`;

CREATE TABLE `auditdata_odbc` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `Key` varchar(100) DEFAULT NULL,
  `Value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Table structure for table `cardlog` */

DROP TABLE IF EXISTS `cardlog`;

CREATE TABLE `cardlog` (
  `idcardlog` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `issuedate` datetime DEFAULT NULL,
  `cardnumber` varchar(20) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`idcardlog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `client_email_send` */

DROP TABLE IF EXISTS `client_email_send`;

CREATE TABLE `client_email_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `emailAddress` longtext,
  `subject` longtext,
  `Content` longtext,
  `createdTime` datetime DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  `attachment` longtext,
  `cc_to` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `client_push_send` */

DROP TABLE IF EXISTS `client_push_send`;

CREATE TABLE `client_push_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `systemUserID` int(11) DEFAULT NULL,
  `MobileOS` varchar(10) DEFAULT NULL,
  `MobileToken` longtext,
  `DoorName` varchar(50) DEFAULT NULL,
  `EventName` varchar(100) DEFAULT NULL,
  `EventTime` varchar(50) DEFAULT NULL,
  `createdTime` datetime DEFAULT NULL,
  `status` int(5) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `clientcommand` */

DROP TABLE IF EXISTS `clientcommand`;

CREATE TABLE `clientcommand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) DEFAULT NULL,
  `iddevice` int(11) DEFAULT NULL,
  `Command` varchar(100) DEFAULT NULL,
  `cmdContent` longtext,
  `requesttime` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `completetime` datetime DEFAULT NULL,
  `iderrorlog` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `Command` (`Command`),
  KEY `iddevice` (`iddevice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Table structure for table `clientcommand_details` */

DROP TABLE IF EXISTS `clientcommand_details`;

CREATE TABLE `clientcommand_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcommand` int(11) DEFAULT NULL,
  `cmdContent` longtext,
  `createdTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcommand` (`idcommand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `clockingtype` */

DROP TABLE IF EXISTS `clockingtype`;

CREATE TABLE `clockingtype` (
  `id` int(11) NOT NULL,
  `clockingname` varchar(45) DEFAULT NULL,
  `user_defined` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `controller_eventlog` */

DROP TABLE IF EXISTS `controller_eventlog`;

CREATE TABLE `controller_eventlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bit0` varchar(50) DEFAULT NULL,
  `bit1` varchar(50) DEFAULT NULL,
  `bit2` varchar(50) DEFAULT NULL,
  `bit3` varchar(50) DEFAULT NULL,
  `bit4` varchar(50) DEFAULT NULL,
  `bit5` varchar(50) DEFAULT NULL,
  `bit6` varchar(50) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  `isreal` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`bit0`,`bit1`,`bit3`,`bit4`,`bit5`,`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `controller_eventlog_description` */

DROP TABLE IF EXISTS `controller_eventlog_description`;

CREATE TABLE `controller_eventlog_description` (
  `eventType` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`eventType`),
  KEY `eventType` (`eventType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `controller_eventlog_remote` */

DROP TABLE IF EXISTS `controller_eventlog_remote`;

CREATE TABLE `controller_eventlog_remote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoor` int(11) DEFAULT '0',
  `OperationID` int(11) DEFAULT '0',
  `userid` int(11) DEFAULT '0',
  `eventTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `controller_verifymode` */

DROP TABLE IF EXISTS `controller_verifymode`;

CREATE TABLE `controller_verifymode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `verifycode` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `daytype` */

DROP TABLE IF EXISTS `daytype`;

CREATE TABLE `daytype` (
  `iddaytype` int(11) NOT NULL,
  `daytype` varchar(45) DEFAULT NULL,
  `sdaytype` tinytext,
  `color` varchar(45) DEFAULT NULL,
  `user_defined` varchar(45) DEFAULT NULL,
  `wages_work` int(3) DEFAULT '100',
  `wages_ot` int(3) DEFAULT '100',
  `wages_diffot` int(3) DEFAULT '100',
  `total_work_ot` int(1) DEFAULT '0',
  PRIMARY KEY (`iddaytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `db_cleaning` */

DROP TABLE IF EXISTS `db_cleaning`;

CREATE TABLE `db_cleaning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(50) DEFAULT NULL,
  `table_related` longtext,
  `retain_months` int(2) DEFAULT '0',
  `execution_time` varchar(10) DEFAULT NULL,
  `last_execution` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT '2018-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `db_option` */

DROP TABLE IF EXISTS `db_option`;

CREATE TABLE `db_option` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TableName` varchar(50) DEFAULT NULL,
  `Database` smallint(4) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `db_upgrade` */

DROP TABLE IF EXISTS `db_upgrade`;

CREATE TABLE `db_upgrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upgrade_patch` varchar(15) DEFAULT NULL,
  `upgrade_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

/*Table structure for table `device` */

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `iddevice` int(11) NOT NULL AUTO_INCREMENT,
  `DeviceName` varchar(50) DEFAULT NULL,
  `serialno` varchar(50) DEFAULT NULL,
  `DeviceGroup` int(11) DEFAULT '0',
  `CommunicationMode` int(5) DEFAULT '0',
  `ipaddress` varchar(200) DEFAULT NULL,
  `URL` varchar(200) DEFAULT NULL,
  `Port` int(11) DEFAULT '4370',
  `serialport` varchar(50) DEFAULT 'COM1',
  `Baudrate` varchar(50) DEFAULT '115200',
  `RS232` int(5) DEFAULT '0',
  `RS485` int(5) DEFAULT '0',
  `machinesn` varchar(50) DEFAULT '1',
  `CommKey` varchar(6) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `firmware` varchar(50) DEFAULT NULL,
  `gateway` varchar(50) DEFAULT '192.168.1.1',
  `subnet` varchar(50) DEFAULT '255.255.255.0',
  `algver` varchar(10) DEFAULT '10',
  `FP10Flag` int(5) DEFAULT '0',
  `FaceFlag` int(5) DEFAULT '0',
  `FaceAlgvr` varchar(10) DEFAULT '6',
  `Face7Flag` int(5) DEFAULT '0',
  `manufacturer` varchar(50) DEFAULT 'FingerTec',
  `ManufacturerDate` varchar(50) DEFAULT NULL,
  `WiegandOutputFormat` varchar(50) DEFAULT '0',
  `WiegandOutputPulseWidth` varchar(50) DEFAULT '100',
  `WiegandOutputPulseInterval` varchar(50) DEFAULT '1000',
  `WiegandOutput` varchar(50) DEFAULT '0',
  `WiegandInputFormatType` varchar(2) DEFAULT '0',
  `WiegandInputFormat` varchar(50) DEFAULT '0',
  `WiegandInputPulseWidth` varchar(50) DEFAULT '100',
  `WiegandInputPulseInterval` varchar(50) DEFAULT '1000',
  `WiegandInputBits` varchar(50) DEFAULT '26',
  `WiegandInput` varchar(50) DEFAULT '0',
  `platform` varchar(50) DEFAULT NULL,
  `macaddress` varchar(50) DEFAULT NULL,
  `admincount` int(11) DEFAULT '0',
  `usercount` int(11) DEFAULT '0',
  `fpcount` int(11) DEFAULT '0',
  `passwordcount` int(11) DEFAULT '0',
  `transactioncount` int(11) DEFAULT '0',
  `maxfpsize` int(11) DEFAULT '0',
  `maxusersize` int(11) DEFAULT '0',
  `maxtransactionsize` int(11) DEFAULT '0',
  `ColorScreenFlag` int(5) DEFAULT '0',
  `ControllerFlag` int(5) DEFAULT '0',
  `DoorNo` int(5) DEFAULT '0',
  `NewCommkey` varchar(6) DEFAULT NULL,
  `NewIPAddress` varchar(200) DEFAULT NULL,
  `SyncServerTime` int(5) DEFAULT '1',
  `FP11Match` int(5) DEFAULT '35',
  `FP1NMatch` int(5) DEFAULT '45',
  `Face11Match` int(5) DEFAULT '70',
  `Face1NMatch` int(5) DEFAULT '80',
  `Only11Verify` int(5) DEFAULT '0',
  `CardOnly` int(5) DEFAULT '0',
  `IdleAction` int(5) DEFAULT '0',
  `IdleTime` int(10) DEFAULT '0',
  `PowerOnTime` varchar(50) DEFAULT NULL,
  `PowerOffTime` varchar(50) DEFAULT NULL,
  `SaveFalseLog` int(5) DEFAULT '1',
  `SaveAttFlag` int(5) DEFAULT '1',
  `AntipassbackState` int(5) DEFAULT '0',
  `MasterState` int(5) DEFAULT '-1',
  `AlarmCount_FailVerify` int(5) DEFAULT '3',
  `H2i_AdminCard` varchar(20) DEFAULT NULL,
  `DownAttFlag` int(5) DEFAULT '1',
  `VerifyType` int(11) DEFAULT '0',
  `PortForwarding` int(1) DEFAULT '0',
  `workcode` int(1) DEFAULT '0',
  `extformat` int(1) DEFAULT '0',
  `Encrypted` int(1) DEFAULT '0',
  `totalface` int(11) DEFAULT '0',
  `facecount` int(11) DEFAULT '0',
  `EnableRealTime` int(1) DEFAULT '0',
  `LastDownload` varchar(20) DEFAULT NULL,
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddevice`),
  KEY `serialno` (`serialno`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `device_atin` */

DROP TABLE IF EXISTS `device_atin`;

CREATE TABLE `device_atin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device1` longtext,
  `device2` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_delete` */

DROP TABLE IF EXISTS `device_delete`;

CREATE TABLE `device_delete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddevice` int(11) NOT NULL,
  `serialno` varchar(50) NOT NULL,
  `deviceName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_error_cardlog` */

DROP TABLE IF EXISTS `device_error_cardlog`;

CREATE TABLE `device_error_cardlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(50) DEFAULT NULL,
  `cardnumber` varchar(50) DEFAULT NULL,
  `eventTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_group` */

DROP TABLE IF EXISTS `device_group`;

CREATE TABLE `device_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gDeviceGroupName` varchar(200) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `depth` varchar(45) DEFAULT NULL,
  `path` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `device_multimedia_advertisement` */

DROP TABLE IF EXISTS `device_multimedia_advertisement`;

CREATE TABLE `device_multimedia_advertisement` (
  `fileId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) DEFAULT NULL,
  `fileType` varchar(45) DEFAULT NULL,
  `content` longtext,
  `imageType` int(10) unsigned NOT NULL DEFAULT '0',
  `listId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `device_multimedia_theme` */

DROP TABLE IF EXISTS `device_multimedia_theme`;

CREATE TABLE `device_multimedia_theme` (
  `fileId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fileName` varchar(100) DEFAULT NULL,
  `fileType` varchar(45) DEFAULT NULL,
  `content` longtext,
  `imageType` int(10) unsigned NOT NULL DEFAULT '0',
  `listId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Table structure for table `device_oplog` */

DROP TABLE IF EXISTS `device_oplog`;

CREATE TABLE `device_oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(50) DEFAULT NULL,
  `admin` varchar(50) DEFAULT NULL,
  `op` varchar(50) DEFAULT NULL,
  `op_time` datetime DEFAULT NULL,
  `param1` varchar(50) DEFAULT NULL,
  `param2` varchar(50) DEFAULT NULL,
  `param3` varchar(50) DEFAULT NULL,
  `param4` varchar(50) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `serialno` (`serialno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `device_oplog_description` */

DROP TABLE IF EXISTS `device_oplog_description`;

CREATE TABLE `device_oplog_description` (
  `OPCode` varchar(45) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OPCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Table structure for table `device_transaction_log` */

DROP TABLE IF EXISTS `device_transaction_log`;

CREATE TABLE `device_transaction_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(45) DEFAULT NULL,
  `userid` varchar(45) DEFAULT NULL,
  `verifycode` int(11) DEFAULT NULL,
  `checktime` datetime DEFAULT NULL,
  `checktype` int(11) DEFAULT NULL,
  `workcode` int(11) DEFAULT NULL,
  `eventType` varchar(50) DEFAULT NULL,
  `cardNum` varchar(50) DEFAULT NULL,
  `isreal` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK` (`serialno`,`userid`,`checktime`),
  KEY `serialno` (`serialno`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `devicestatus` */

DROP TABLE IF EXISTS `devicestatus`;

CREATE TABLE `devicestatus` (
  `idDevice` int(11) NOT NULL,
  `EnabledFlag` int(2) DEFAULT '0',
  `statusFlag` int(2) DEFAULT '0',
  `ConnectingFlag` int(2) DEFAULT '0',
  `ReConnectFlag` int(2) DEFAULT '0',
  `DownFlag` int(2) DEFAULT '0',
  `connectionStatus` int(2) DEFAULT '0',
  `LastConnection` datetime DEFAULT NULL,
  `LastUpdatedTime` datetime DEFAULT NULL,
  `ActivationKey` varchar(50) DEFAULT NULL,
  `ac_info` longtext,
  PRIMARY KEY (`idDevice`),
  KEY `idDevice` (`idDevice`),
  KEY `connectionStatus` (`connectionStatus`),
  KEY `statusFlag` (`statusFlag`),
  KEY `EnabledFlag` (`EnabledFlag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `devicestatus_description` */

DROP TABLE IF EXISTS `devicestatus_description`;

CREATE TABLE `devicestatus_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EnabledFlag` int(11) DEFAULT NULL,
  `statusFlag` int(11) DEFAULT NULL,
  `device_description` varchar(100) DEFAULT NULL,
  `door_description` varchar(100) DEFAULT NULL,
  `Priority` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `door` */

DROP TABLE IF EXISTS `door`;

CREATE TABLE `door` (
  `iddoor` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `doorgroup` int(11) DEFAULT '0',
  `idVisualMap` int(11) DEFAULT '0',
  `ControllerState` int(11) DEFAULT '0',
  `DoorType` int(5) DEFAULT '0',
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`iddoor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_accesscontrol` */

DROP TABLE IF EXISTS `door_accesscontrol`;

CREATE TABLE `door_accesscontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoor` int(11) DEFAULT NULL,
  `DoorActiveTimezone` int(11) DEFAULT '1',
  `DoorActiveHolidayTimezone` int(11) DEFAULT '0',
  `DoorPassageTimezone` int(11) DEFAULT '0',
  `DoorPassageHolidayTimezone` int(11) DEFAULT '0',
  `LockOpenDuration` int(11) DEFAULT '5',
  `PunchInterval` int(11) DEFAULT '2',
  `VerifyMode` int(11) DEFAULT '0',
  `DuressPassword` varchar(11) DEFAULT NULL,
  `EmergencyPassword` varchar(11) DEFAULT NULL,
  `DoorSensorType` int(11) DEFAULT '0',
  `DoorStatusDelay` int(11) DEFAULT '20',
  `CloseAndReverseState` int(5) DEFAULT '0',
  `AlarmDelay` int(5) DEFAULT '30',
  `AlarmCount_FailVerify` int(5) DEFAULT '3',
  `Stand_DuressPwd` int(5) DEFAULT '0',
  `Stand_Duress11` int(5) DEFAULT '0',
  `Stand_Duress1N` int(5) DEFAULT '0',
  `Stand_DuressAlarmDelay` int(5) DEFAULT '10',
  `FullAccessDevice` int(11) DEFAULT '0',
  `EntryDevice` int(11) DEFAULT '0',
  `EmergencyExit` int(5) DEFAULT '0',
  `DisableAlarm` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idDoor` (`idDoor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_camera` */

DROP TABLE IF EXISTS `door_camera`;

CREATE TABLE `door_camera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camera_name` longtext,
  `description` longtext,
  `DoorID` int(11) DEFAULT NULL,
  `camera_type` int(2) DEFAULT NULL,
  `camid` longtext,
  `video_url` longtext,
  `snapshot_url` longtext,
  `username` longtext,
  `password` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_device` */

DROP TABLE IF EXISTS `door_device`;

CREATE TABLE `door_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoor` int(11) DEFAULT NULL,
  `idDevice` int(11) DEFAULT NULL,
  `deviceFunc` varchar(50) DEFAULT NULL,
  `ControllerDoorNo` int(5) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idDoor` (`idDoor`),
  KEY `idDevice` (`idDevice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_deviceslave` */

DROP TABLE IF EXISTS `door_deviceslave`;

CREATE TABLE `door_deviceslave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoor` int(11) DEFAULT NULL,
  `SlaveName` varchar(50) DEFAULT NULL,
  `deviceFunc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDoor` (`idDoor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_eventlog` */

DROP TABLE IF EXISTS `door_eventlog`;

CREATE TABLE `door_eventlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serialno` varchar(50) DEFAULT NULL,
  `eventType` varchar(50) DEFAULT NULL,
  `eventtime` datetime DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EventLogPK` (`serialno`,`eventType`,`eventtime`),
  KEY `eventType` (`eventType`),
  KEY `serialno` (`serialno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_eventlog_description` */

DROP TABLE IF EXISTS `door_eventlog_description`;

CREATE TABLE `door_eventlog_description` (
  `eventtype` int(11) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`eventtype`),
  KEY `eventtype` (`eventtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_eventlog_remote` */

DROP TABLE IF EXISTS `door_eventlog_remote`;

CREATE TABLE `door_eventlog_remote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idDoor` int(11) DEFAULT NULL,
  `eventType` int(11) DEFAULT NULL,
  `eventTime` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idDoor` (`idDoor`),
  KEY `eventType` (`eventType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_group` */

DROP TABLE IF EXISTS `door_group`;

CREATE TABLE `door_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(50) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `door_properties` */

DROP TABLE IF EXISTS `door_properties`;

CREATE TABLE `door_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iddoor` int(11) DEFAULT NULL,
  `location_x` int(11) DEFAULT '0',
  `location_y` int(11) DEFAULT '0',
  `height` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `iddoor` (`iddoor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `errorlog` */

DROP TABLE IF EXISTS `errorlog`;

CREATE TABLE `errorlog` (
  `iderrorLog` int(11) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(50) DEFAULT NULL,
  `functionname` varchar(100) DEFAULT NULL,
  `description` longtext,
  `exception` longtext,
  `errorDate` datetime DEFAULT NULL,
  `app_version` varchar(50) DEFAULT '',
  PRIMARY KEY (`iderrorLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `errorlog_description_controller` */

DROP TABLE IF EXISTS `errorlog_description_controller`;

CREATE TABLE `errorlog_description_controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `errorCode` (`errorCode`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Table structure for table `errorlog_description_stand` */

DROP TABLE IF EXISTS `errorlog_description_stand`;

CREATE TABLE `errorlog_description_stand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errorCode` int(11) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  KEY `errorCode` (`errorCode`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `errorlog_sql` */

DROP TABLE IF EXISTS `errorlog_sql`;

CREATE TABLE `errorlog_sql` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idErrorLog` int(11) DEFAULT NULL,
  `query` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `event_activity` */

DROP TABLE IF EXISTS `event_activity`;

CREATE TABLE `event_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(200) DEFAULT NULL,
  `eventflag` int(1) DEFAULT '0',
  `recipientemail` longtext,
  `additionalmessage` longtext,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `event_lastview` */

DROP TABLE IF EXISTS `event_lastview`;

CREATE TABLE `event_lastview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(100) DEFAULT NULL,
  `lastID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `event_services` */

DROP TABLE IF EXISTS `event_services`;

CREATE TABLE `event_services` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(200) DEFAULT NULL,
  `eventdesc` longtext,
  `errorflag` int(1) DEFAULT '0',
  `errorserial` longtext,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `export_scheduler` */

DROP TABLE IF EXISTS `export_scheduler`;

CREATE TABLE `export_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_type` int(1) DEFAULT NULL,
  `every` int(11) DEFAULT NULL,
  `runtime` varchar(11) DEFAULT NULL,
  `data` int(1) DEFAULT NULL,
  `start_run` varchar(11) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `opt_user` longtext,
  `template_type` int(11) DEFAULT NULL,
  `company` varchar(250) DEFAULT NULL,
  `batch` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `email_subject` varchar(200) DEFAULT NULL,
  `email_body` longtext,
  `user_role` int(11) NOT NULL DEFAULT '1',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `export_path` varchar(200) DEFAULT NULL,
  `auditDataLastID` int(11) DEFAULT '0',
  `append` int(1) DEFAULT '0',
  `opt_department` longtext,
  `opt_fileMode` int(1) DEFAULT '0',
  `opt_falseLog` int(1) DEFAULT '0',
  `opt_device` longtext,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `export_scheduler_command` */

DROP TABLE IF EXISTS `export_scheduler_command`;

CREATE TABLE `export_scheduler_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_scheduler_id` int(11) DEFAULT NULL,
  `flag` int(1) DEFAULT '1',
  `created_time` datetime DEFAULT NULL,
  `process_time` datetime DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `export_scheduler_email` */

DROP TABLE IF EXISTS `export_scheduler_email`;

CREATE TABLE `export_scheduler_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_id` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `export_scheduler_history` */

DROP TABLE IF EXISTS `export_scheduler_history`;

CREATE TABLE `export_scheduler_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(11) DEFAULT NULL,
  `scheduler_command_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `export_settings` */

DROP TABLE IF EXISTS `export_settings`;

CREATE TABLE `export_settings` (
  `idexport_settings` int(11) NOT NULL AUTO_INCREMENT,
  `exportname` varchar(45) DEFAULT NULL,
  `selectedfields` longtext,
  `output` varchar(200) DEFAULT NULL,
  `append` int(11) DEFAULT '0',
  `createdate` datetime DEFAULT '2013-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idexport_settings`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Table structure for table `fieldofstudy_option` */

DROP TABLE IF EXISTS `fieldofstudy_option`;

CREATE TABLE `fieldofstudy_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

/*Table structure for table `holiday` */

DROP TABLE IF EXISTS `holiday`;

CREATE TABLE `holiday` (
  `idholiday` int(11) NOT NULL AUTO_INCREMENT,
  `holidayname` varchar(45) DEFAULT NULL,
  `holidaydesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idholiday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `holiday_date` */

DROP TABLE IF EXISTS `holiday_date`;

CREATE TABLE `holiday_date` (
  `idholiday_date` int(11) NOT NULL AUTO_INCREMENT,
  `holidayname` varchar(45) DEFAULT NULL,
  `holidayid` int(11) DEFAULT NULL,
  `startmonth` smallint(6) DEFAULT NULL,
  `startday` smallint(6) DEFAULT NULL,
  `endmonth` smallint(6) DEFAULT NULL,
  `endday` smallint(6) DEFAULT NULL,
  `idholiday` int(11) DEFAULT NULL,
  `TZIndex` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `year` int(4) DEFAULT '0',
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idholiday_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `industry_option` */

DROP TABLE IF EXISTS `industry_option`;

CREATE TABLE `industry_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Table structure for table `language` */

DROP TABLE IF EXISTS `language`;

CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `languagecode` varchar(50) NOT NULL,
  `fieldcode` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`languagecode`,`fieldcode`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `language_option` */

DROP TABLE IF EXISTS `language_option`;

CREATE TABLE `language_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

/*Table structure for table `language_type` */

DROP TABLE IF EXISTS `language_type`;

CREATE TABLE `language_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LanguageCode` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `imgname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `leavetype` */

DROP TABLE IF EXISTS `leavetype`;

CREATE TABLE `leavetype` (
  `idleavetype` int(11) NOT NULL AUTO_INCREMENT,
  `leavetypename` varchar(45) DEFAULT NULL,
  `leavetypedesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idleavetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_adms_request` */

DROP TABLE IF EXISTS `log_adms_request`;

CREATE TABLE `log_adms_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url_request` longtext,
  `request_body_count` int(11) NOT NULL DEFAULT '0',
  `request_time` datetime DEFAULT NULL,
  `error_code` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_client` */

DROP TABLE IF EXISTS `log_client`;

CREATE TABLE `log_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModuleName` varchar(50) DEFAULT NULL,
  `OperationTime` datetime DEFAULT NULL,
  `keyinfo` longtext,
  `description` longtext,
  `remark` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TableName` (`ModuleName`),
  KEY `remark` (`remark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_client_details` */

DROP TABLE IF EXISTS `log_client_details`;

CREATE TABLE `log_client_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroup` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `ModuleName` varchar(100) DEFAULT NULL,
  `Target` varchar(50) DEFAULT NULL,
  `TargetID` varchar(100) DEFAULT NULL,
  `Child_Target` varchar(100) DEFAULT NULL,
  `Child_TargetID` varchar(100) DEFAULT NULL,
  `Field` varchar(100) DEFAULT NULL,
  `FromData` longtext,
  `ToData` longtext,
  `Remark` longtext,
  `CreatedTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8;

/*Table structure for table `log_device_connect` */

DROP TABLE IF EXISTS `log_device_connect`;

CREATE TABLE `log_device_connect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IdDevice` int(11) DEFAULT NULL,
  `SerialNo` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `exception` longtext,
  `createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_device_server` */

DROP TABLE IF EXISTS `log_device_server`;

CREATE TABLE `log_device_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `idDevice` int(11) DEFAULT NULL,
  `OperationTime` datetime DEFAULT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `description` longtext,
  `AcknowledgeFlag` int(2) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idDevice` (`idDevice`),
  KEY `Type` (`remark`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_server` */

DROP TABLE IF EXISTS `log_server`;

CREATE TABLE `log_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LoginID` int(11) DEFAULT NULL,
  `ProcessDescription` longtext,
  `ProcessTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LoginID` (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_update` */

DROP TABLE IF EXISTS `log_update`;

CREATE TABLE `log_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `description` longtext,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `log_usergroup_sync` */

DROP TABLE IF EXISTS `log_usergroup_sync`;

CREATE TABLE `log_usergroup_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserGroup` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Remark` longtext,
  `CreatedTime` datetime DEFAULT NULL,
  `SyncAllFlag` int(2) DEFAULT '0',
  `AcknowledgeFlag` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

/*Table structure for table `planner` */

DROP TABLE IF EXISTS `planner`;

CREATE TABLE `planner` (
  `idplanner` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `groupno` int(11) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  `daytype` tinytext,
  `leavetype` int(11) DEFAULT NULL,
  `holiday` int(11) DEFAULT NULL,
  `sche1` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sche2` int(11) DEFAULT NULL,
  `sche3` int(11) DEFAULT NULL,
  `leavehour` decimal(4,2) NOT NULL DEFAULT '0.00',
  `wages_work` int(3) DEFAULT '-1',
  `wages_ot` int(3) DEFAULT '-1',
  `wages_diffot` int(3) DEFAULT '-1',
  `desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idplanner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `qualification_option` */

DROP TABLE IF EXISTS `qualification_option`;

CREATE TABLE `qualification_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qualification_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Table structure for table `remark` */

DROP TABLE IF EXISTS `remark`;

CREATE TABLE `remark` (
  `idremark` int(11) NOT NULL AUTO_INCREMENT,
  `remark` varchar(200) DEFAULT NULL,
  `workcode` int(11) DEFAULT '0',
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idremark`),
  KEY `workcode` (`workcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `remark_rate` */

DROP TABLE IF EXISTS `remark_rate`;

CREATE TABLE `remark_rate` (
  `idremark_rate` int(11) NOT NULL AUTO_INCREMENT,
  `workcode` int(11) DEFAULT '0',
  `userid` varchar(30) DEFAULT NULL,
  `rate` decimal(9,2) DEFAULT '0.00',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idremark_rate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_scheduler` */

DROP TABLE IF EXISTS `report_scheduler`;

CREATE TABLE `report_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` int(11) DEFAULT NULL,
  `every` int(11) DEFAULT NULL,
  `runtime` varchar(11) DEFAULT NULL,
  `data` int(1) DEFAULT NULL,
  `start_run` varchar(11) DEFAULT NULL,
  `enabled` int(1) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `opt_user` longtext,
  `opt_device` longtext,
  `opt_door` longtext,
  `opt_event_stand` longtext,
  `opt_event_controller` longtext,
  `opt_schedule` longtext,
  `opt_leavetype` longtext,
  `opt_roster` longtext,
  `opt_zone_type` varchar(100) DEFAULT NULL,
  `opt_module` int(5) DEFAULT NULL,
  `opt_direction` varchar(5) DEFAULT NULL,
  `opt_orderby` varchar(50) DEFAULT NULL,
  `opt_groupby` int(1) DEFAULT NULL,
  `opt_ori_clocking` int(1) DEFAULT NULL,
  `opt_remark` int(1) DEFAULT NULL,
  `opt_clocking_count` int(1) DEFAULT NULL,
  `opt_in_out_clocking` int(1) DEFAULT NULL,
  `opt_rate_hour` int(1) DEFAULT NULL,
  `opt_work_done_in_days` int(1) DEFAULT NULL,
  `opt_sche_count` int(1) DEFAULT NULL,
  `opt_duty_user` int(1) DEFAULT NULL,
  `opt_show_device_zone` int(1) DEFAULT NULL,
  `opt_access_type` int(1) DEFAULT NULL,
  `opt_work_ot_total` int(1) DEFAULT NULL,
  `opt_tardiness` varchar(50) DEFAULT NULL,
  `email_subject` varchar(200) DEFAULT NULL,
  `email_body` longtext,
  `export_format` int(1) DEFAULT NULL,
  `user_role` int(11) DEFAULT '1',
  `user_id` int(11) DEFAULT NULL,
  `report_language` varchar(10) DEFAULT NULL,
  `opt_name` varchar(100) DEFAULT NULL,
  `opt_company` varchar(100) DEFAULT NULL,
  `opt_id_driving_license` varchar(50) DEFAULT NULL,
  `opt_email` varchar(100) DEFAULT NULL,
  `opt_mobile` varchar(50) DEFAULT NULL,
  `opt_report_output` int(5) DEFAULT NULL,
  `opt_leave_hour` int(1) DEFAULT NULL,
  `opt_att_summary` varchar(50) DEFAULT NULL,
  `opt_zero_hour` int(1) DEFAULT NULL,
  `opt_job_cost` int(1) DEFAULT NULL,
  `opt_incompletepair` int(1) DEFAULT NULL,
  `opt_detailedshort` int(1) DEFAULT NULL,
  `opt_department` longtext,
  `opt_export_options` varchar(200) DEFAULT NULL,
  `opt_user_email` int(1) DEFAULT NULL,
  `opt_designation` varchar(200) DEFAULT NULL,
  `opt_group_by_door` int(1) DEFAULT NULL,
  `opt_show_all_users` int(1) DEFAULT NULL,
  `opt_health_screening` varchar(50) DEFAULT NULL,
  `opt_disable_page_break` int(1) DEFAULT NULL,
  `opt_detailed_summary` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_scheduler_command` */

DROP TABLE IF EXISTS `report_scheduler_command`;

CREATE TABLE `report_scheduler_command` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(11) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `flag` int(1) DEFAULT '1',
  `process_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_scheduler_email` */

DROP TABLE IF EXISTS `report_scheduler_email`;

CREATE TABLE `report_scheduler_email` (
  `id_scheduler` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  UNIQUE KEY `id_scheduler` (`id_scheduler`,`email`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_scheduler_history` */

DROP TABLE IF EXISTS `report_scheduler_history`;

CREATE TABLE `report_scheduler_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scheduler_id` int(11) DEFAULT NULL,
  `scheduler_command_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_settings` */

DROP TABLE IF EXISTS `report_settings`;

CREATE TABLE `report_settings` (
  `reportid` int(10) NOT NULL AUTO_INCREMENT,
  `reportType` varchar(10) NOT NULL DEFAULT '',
  `selectedField` longtext,
  `user_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `report_type` */

DROP TABLE IF EXISTS `report_type`;

CREATE TABLE `report_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `roster` */

DROP TABLE IF EXISTS `roster`;

CREATE TABLE `roster` (
  `idroster` int(11) NOT NULL AUTO_INCREMENT,
  `rostername` varchar(45) DEFAULT NULL,
  `rosterdesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `rostertype` int(11) DEFAULT '0',
  `daily_totals` int(11) DEFAULT '0',
  `auto_calc_ot` int(11) DEFAULT '0',
  `7th_day_ot` int(11) DEFAULT '0',
  `shift_day` int(11) DEFAULT '1',
  `ot_only_after` decimal(5,2) DEFAULT '0.00',
  `ot_only_after_if` int(11) DEFAULT '0',
  `open_schedule` varchar(50) DEFAULT NULL,
  `auto_schedule_daytype` varchar(200) DEFAULT NULL,
  `auto_schedule_sche_1` varchar(200) DEFAULT NULL,
  `auto_schedule_sche_2` varchar(200) DEFAULT NULL,
  `auto_schedule_sche_3` varchar(200) DEFAULT NULL,
  `diff_ot_only_after` decimal(5,2) DEFAULT '0.00',
  `diff_ot_only_after_if` int(11) DEFAULT '0',
  `auto_schedule_alternaterestday` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idroster`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `roster_calendar` */

DROP TABLE IF EXISTS `roster_calendar`;

CREATE TABLE `roster_calendar` (
  `idroster_calendar` int(11) NOT NULL AUTO_INCREMENT,
  `idroster` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `daytype1` tinytext,
  `daytype2` tinytext,
  `daytype3` tinytext,
  `daytype4` tinytext,
  `daytype5` tinytext,
  `daytype6` tinytext,
  `daytype7` tinytext,
  `daytype8` tinytext,
  `daytype9` tinytext,
  `daytype10` tinytext,
  `daytype11` tinytext,
  `daytype12` tinytext,
  `daytype13` tinytext,
  `daytype14` tinytext,
  `daytype15` tinytext,
  `daytype16` tinytext,
  `daytype17` tinytext,
  `daytype18` tinytext,
  `daytype19` tinytext,
  `daytype20` tinytext,
  `daytype21` tinytext,
  `daytype22` tinytext,
  `daytype23` tinytext,
  `daytype24` tinytext,
  `daytype25` tinytext,
  `daytype26` tinytext,
  `daytype27` tinytext,
  `daytype28` tinytext,
  `daytype29` tinytext,
  `daytype30` tinytext,
  `daytype31` tinytext,
  `leavetype1` int(11) DEFAULT NULL,
  `leavetype2` int(11) DEFAULT NULL,
  `leavetype3` int(11) DEFAULT NULL,
  `leavetype4` int(11) DEFAULT NULL,
  `leavetype5` int(11) DEFAULT NULL,
  `leavetype6` int(11) DEFAULT NULL,
  `leavetype7` int(11) DEFAULT NULL,
  `leavetype8` int(11) DEFAULT NULL,
  `leavetype9` int(11) DEFAULT NULL,
  `leavetype10` int(11) DEFAULT NULL,
  `leavetype11` int(11) DEFAULT NULL,
  `leavetype12` int(11) DEFAULT NULL,
  `leavetype13` int(11) DEFAULT NULL,
  `leavetype14` int(11) DEFAULT NULL,
  `leavetype15` int(11) DEFAULT NULL,
  `leavetype16` int(11) DEFAULT NULL,
  `leavetype17` int(11) DEFAULT NULL,
  `leavetype18` int(11) DEFAULT NULL,
  `leavetype19` int(11) DEFAULT NULL,
  `leavetype20` int(11) DEFAULT NULL,
  `leavetype21` int(11) DEFAULT NULL,
  `leavetype22` int(11) DEFAULT NULL,
  `leavetype23` int(11) DEFAULT NULL,
  `leavetype24` int(11) DEFAULT NULL,
  `leavetype25` int(11) DEFAULT NULL,
  `leavetype26` int(11) DEFAULT NULL,
  `leavetype27` int(11) DEFAULT NULL,
  `leavetype28` int(11) DEFAULT NULL,
  `leavetype29` int(11) DEFAULT NULL,
  `leavetype30` int(11) DEFAULT NULL,
  `leavetype31` int(11) DEFAULT NULL,
  `sche1_1` int(11) DEFAULT NULL,
  `sche1_2` int(11) DEFAULT NULL,
  `sche1_3` int(11) DEFAULT NULL,
  `sche1_4` int(11) DEFAULT NULL,
  `sche1_5` int(11) DEFAULT NULL,
  `sche1_6` int(11) DEFAULT NULL,
  `sche1_7` int(11) DEFAULT NULL,
  `sche1_8` int(11) DEFAULT NULL,
  `sche1_9` int(11) DEFAULT NULL,
  `sche1_10` int(11) DEFAULT NULL,
  `sche1_11` int(11) DEFAULT NULL,
  `sche1_12` int(11) DEFAULT NULL,
  `sche1_13` int(11) DEFAULT NULL,
  `sche1_14` int(11) DEFAULT NULL,
  `sche1_15` int(11) DEFAULT NULL,
  `sche1_16` int(11) DEFAULT NULL,
  `sche1_17` int(11) DEFAULT NULL,
  `sche1_18` int(11) DEFAULT NULL,
  `sche1_19` int(11) DEFAULT NULL,
  `sche1_20` int(11) DEFAULT NULL,
  `sche1_21` int(11) DEFAULT NULL,
  `sche1_22` int(11) DEFAULT NULL,
  `sche1_23` int(11) DEFAULT NULL,
  `sche1_24` int(11) DEFAULT NULL,
  `sche1_25` int(11) DEFAULT NULL,
  `sche1_26` int(11) DEFAULT NULL,
  `sche1_27` int(11) DEFAULT NULL,
  `sche1_28` int(11) DEFAULT NULL,
  `sche1_29` int(11) DEFAULT NULL,
  `sche1_30` int(11) DEFAULT NULL,
  `sche1_31` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2010-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sche2_1` int(11) DEFAULT NULL,
  `sche2_2` int(11) DEFAULT NULL,
  `sche2_3` int(11) DEFAULT NULL,
  `sche2_4` int(11) DEFAULT NULL,
  `sche2_5` int(11) DEFAULT NULL,
  `sche2_6` int(11) DEFAULT NULL,
  `sche2_7` int(11) DEFAULT NULL,
  `sche2_8` int(11) DEFAULT NULL,
  `sche2_9` int(11) DEFAULT NULL,
  `sche2_10` int(11) DEFAULT NULL,
  `sche2_11` int(11) DEFAULT NULL,
  `sche2_12` int(11) DEFAULT NULL,
  `sche2_13` int(11) DEFAULT NULL,
  `sche2_14` int(11) DEFAULT NULL,
  `sche2_15` int(11) DEFAULT NULL,
  `sche2_16` int(11) DEFAULT NULL,
  `sche2_17` int(11) DEFAULT NULL,
  `sche2_18` int(11) DEFAULT NULL,
  `sche2_19` int(11) DEFAULT NULL,
  `sche2_20` int(11) DEFAULT NULL,
  `sche2_21` int(11) DEFAULT NULL,
  `sche2_22` int(11) DEFAULT NULL,
  `sche2_23` int(11) DEFAULT NULL,
  `sche2_24` int(11) DEFAULT NULL,
  `sche2_25` int(11) DEFAULT NULL,
  `sche2_26` int(11) DEFAULT NULL,
  `sche2_27` int(11) DEFAULT NULL,
  `sche2_28` int(11) DEFAULT NULL,
  `sche2_29` int(11) DEFAULT NULL,
  `sche2_30` int(11) DEFAULT NULL,
  `sche2_31` int(11) DEFAULT NULL,
  `sche3_1` int(11) DEFAULT NULL,
  `sche3_2` int(11) DEFAULT NULL,
  `sche3_3` int(11) DEFAULT NULL,
  `sche3_4` int(11) DEFAULT NULL,
  `sche3_5` int(11) DEFAULT NULL,
  `sche3_6` int(11) DEFAULT NULL,
  `sche3_7` int(11) DEFAULT NULL,
  `sche3_8` int(11) DEFAULT NULL,
  `sche3_9` int(11) DEFAULT NULL,
  `sche3_10` int(11) DEFAULT NULL,
  `sche3_11` int(11) DEFAULT NULL,
  `sche3_12` int(11) DEFAULT NULL,
  `sche3_13` int(11) DEFAULT NULL,
  `sche3_14` int(11) DEFAULT NULL,
  `sche3_15` int(11) DEFAULT NULL,
  `sche3_16` int(11) DEFAULT NULL,
  `sche3_17` int(11) DEFAULT NULL,
  `sche3_18` int(11) DEFAULT NULL,
  `sche3_19` int(11) DEFAULT NULL,
  `sche3_20` int(11) DEFAULT NULL,
  `sche3_21` int(11) DEFAULT NULL,
  `sche3_22` int(11) DEFAULT NULL,
  `sche3_23` int(11) DEFAULT NULL,
  `sche3_24` int(11) DEFAULT NULL,
  `sche3_25` int(11) DEFAULT NULL,
  `sche3_26` int(11) DEFAULT NULL,
  `sche3_27` int(11) DEFAULT NULL,
  `sche3_28` int(11) DEFAULT NULL,
  `sche3_29` int(11) DEFAULT NULL,
  `sche3_30` int(11) DEFAULT NULL,
  `sche3_31` int(11) DEFAULT NULL,
  PRIMARY KEY (`idroster_calendar`),
  UNIQUE KEY `pk` (`idroster`,`year`,`month`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `idschedule` int(11) NOT NULL AUTO_INCREMENT,
  `schedulename` varchar(45) DEFAULT NULL,
  `scheduledesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `scheduletype` int(11) DEFAULT '0',
  `idpay_class` int(11) DEFAULT '0',
  PRIMARY KEY (`idschedule`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `schedule_settings` */

DROP TABLE IF EXISTS `schedule_settings`;

CREATE TABLE `schedule_settings` (
  `idschedule_settings` int(11) NOT NULL AUTO_INCREMENT,
  `idschedule` int(11) DEFAULT NULL,
  `in_replace` tinytext,
  `break_replace` tinytext,
  `resume_replace` tinytext,
  `out_replace` tinytext,
  `ot_replace` tinytext,
  `done_replace` tinytext,
  `in_grace` varchar(10) DEFAULT '0',
  `break_grace` varchar(10) DEFAULT '0',
  `resume_grace` varchar(10) DEFAULT '0',
  `out_grace` varchar(10) DEFAULT '0',
  `ot_grace` varchar(10) DEFAULT '0',
  `done_grace` varchar(10) DEFAULT '0',
  `flexilunch` varchar(10) DEFAULT 'F',
  `nolunch` tinytext,
  `flexidinner` varchar(10) DEFAULT 'F',
  `nodinner` tinytext,
  `minot` varchar(10) DEFAULT NULL,
  `maxot` decimal(5,3) DEFAULT '24.000',
  `round_work` int(11) DEFAULT '0',
  `round_overtime` int(11) DEFAULT '0',
  `diffotfrom` varchar(10) DEFAULT NULL,
  `diffotto` varchar(10) DEFAULT NULL,
  `earlytime` tinytext,
  `deductshort` tinytext,
  `deductlunch` tinytext,
  `otdonetowork` int(4) DEFAULT '1',
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `round_in_min` varchar(10) DEFAULT '0',
  `round_break_min` varchar(10) DEFAULT '0',
  `round_resume_min` varchar(10) DEFAULT '0',
  `round_out_min` varchar(10) DEFAULT '0',
  `round_ot_min` varchar(10) DEFAULT '0',
  `round_done_min` varchar(10) DEFAULT '0',
  `round_in` int(11) DEFAULT '0',
  `round_break` int(11) DEFAULT '0',
  `round_resume` int(11) DEFAULT '0',
  `round_out` int(11) DEFAULT '0',
  `round_ot` int(11) DEFAULT '0',
  `round_done` int(11) DEFAULT '0',
  `round_work_min` varchar(10) DEFAULT '0',
  `round_overtime_min` varchar(10) DEFAULT '0',
  `first_rounding_from` varchar(10) DEFAULT NULL,
  `first_rounding_to` varchar(10) DEFAULT NULL,
  `last_rounding_from` varchar(10) DEFAULT NULL,
  `last_rounding_to` varchar(10) DEFAULT NULL,
  `first_rounding` varchar(10) DEFAULT NULL,
  `last_rounding` varchar(10) DEFAULT NULL,
  `diffot` varchar(10) DEFAULT NULL,
  `define_in_out` tinytext,
  `auto_add_break` tinytext,
  `deduct_break_from_ot` tinytext,
  `include_break_into_ot` tinytext,
  `hours_break_from_ot` varchar(10) DEFAULT '',
  `ot_exceeded` varchar(10) DEFAULT NULL,
  `rotational_qualify_min` varchar(3) DEFAULT NULL,
  `rounding` tinytext,
  `flexi_pair` int(11) DEFAULT NULL,
  `job_able` tinytext,
  `same_day` varchar(10) DEFAULT NULL,
  `next_day` varchar(10) DEFAULT NULL,
  `last_out` varchar(10) DEFAULT NULL,
  `double_punch` varchar(10) DEFAULT NULL,
  `ignore_break` tinytext,
  `break_paid` tinytext,
  `deduct_break` varchar(10) DEFAULT NULL,
  `include_break` tinytext,
  `exclude_break` tinytext,
  `deduct_break_from_work` varchar(10) DEFAULT NULL,
  `work_exceeded` varchar(10) DEFAULT NULL,
  `auto_deduction` tinytext,
  `auto_addition` tinytext,
  `auto_add_time` varchar(10) DEFAULT NULL,
  `work_surpassed` varchar(10) DEFAULT NULL,
  `ot_start` varchar(10) DEFAULT NULL,
  `double_time` tinytext,
  `in_device` longtext,
  `break_device` longtext,
  `resume_device` longtext,
  `out_device` longtext,
  `ot_device` longtext,
  `done_device` longtext,
  `double_time_o` tinytext,
  `double_time_h` tinytext,
  `double_ignore` tinytext,
  `double_ignore_o` tinytext,
  `double_ignore_h` tinytext,
  `one_pair` tinytext,
  `latein_deduct` varchar(10) DEFAULT NULL,
  `latein_exceed` varchar(10) DEFAULT NULL,
  `latein_more` varchar(10) DEFAULT NULL,
  `latein_leave` int(11) DEFAULT '0',
  `earlyout_deduct` varchar(10) DEFAULT NULL,
  `earlyout_exceed` varchar(10) DEFAULT NULL,
  `earlyout_more` varchar(10) DEFAULT NULL,
  `earlyout_leave` int(11) DEFAULT '0',
  `deduct_break_from_auto` tinytext,
  `define_io_in` tinytext,
  `define_io_break` tinytext,
  `define_io_resume` tinytext,
  `define_io_out` tinytext,
  `define_io_ot` tinytext,
  `define_io_done` tinytext,
  `add_hour_overtime` varchar(10) DEFAULT NULL,
  `add_overtime_exceed` varchar(10) DEFAULT NULL,
  `round_short` int(11) DEFAULT '0',
  `round_short_min` varchar(10) DEFAULT '0',
  `earlytimeminot` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idschedule_settings`),
  KEY `sche_idschedule` (`idschedule`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `schedule_weekday` */

DROP TABLE IF EXISTS `schedule_weekday`;

CREATE TABLE `schedule_weekday` (
  `idschedule_weekday` int(11) NOT NULL AUTO_INCREMENT,
  `idschedule` int(11) DEFAULT NULL,
  `idschedule_dow` int(11) DEFAULT NULL,
  `daytype` varchar(45) DEFAULT NULL,
  `sche_in` varchar(10) DEFAULT NULL,
  `sche_break` varchar(10) DEFAULT NULL,
  `sche_resume` varchar(10) DEFAULT NULL,
  `sche_out` varchar(10) DEFAULT NULL,
  `sche_ot` varchar(10) DEFAULT NULL,
  `sche_done` varchar(10) DEFAULT NULL,
  `range_in` varchar(10) DEFAULT NULL,
  `range_break` varchar(10) DEFAULT NULL,
  `range_resume` varchar(10) DEFAULT NULL,
  `range_out` varchar(10) DEFAULT NULL,
  `range_ot` varchar(10) DEFAULT NULL,
  `range_done` varchar(10) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idschedule_weekday`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `servertemp` */

DROP TABLE IF EXISTS `servertemp`;

CREATE TABLE `servertemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `data` longtext,
  `flag` tinyint(4) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `sms` */

DROP TABLE IF EXISTS `sms`;

CREATE TABLE `sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_id` int(11) DEFAULT NULL,
  `sms` varchar(200) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `specialization_option` */

DROP TABLE IF EXISTS `specialization_option`;

CREATE TABLE `specialization_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_alarm` */

DROP TABLE IF EXISTS `system_events_alarm`;

CREATE TABLE `system_events_alarm` (
  `Priority` int(5) NOT NULL DEFAULT '0',
  `EventType_ControllerFlag` int(5) NOT NULL,
  `EventTypeID` int(11) NOT NULL,
  PRIMARY KEY (`Priority`,`EventType_ControllerFlag`,`EventTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_alarm_email` */

DROP TABLE IF EXISTS `system_events_alarm_email`;

CREATE TABLE `system_events_alarm_email` (
  `Priority` int(11) NOT NULL,
  `RecipientID` int(11) NOT NULL,
  PRIMARY KEY (`Priority`,`RecipientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_alarm_push` */

DROP TABLE IF EXISTS `system_events_alarm_push`;

CREATE TABLE `system_events_alarm_push` (
  `Priority` int(11) NOT NULL,
  `systemUserID` int(11) NOT NULL,
  PRIMARY KEY (`Priority`,`systemUserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_email` */

DROP TABLE IF EXISTS `system_events_email`;

CREATE TABLE `system_events_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_priority` */

DROP TABLE IF EXISTS `system_events_priority`;

CREATE TABLE `system_events_priority` (
  `Priority` int(5) NOT NULL DEFAULT '0',
  `PlayCount` int(5) DEFAULT '0',
  `SoundID` int(5) DEFAULT '0',
  `SendEmailFlag` int(5) DEFAULT '0',
  `SendPushFlag` int(5) DEFAULT '0',
  `Email_Subject` varchar(200) DEFAULT NULL,
  `Email_Body` longtext,
  `GridColor` int(5) DEFAULT '0',
  PRIMARY KEY (`Priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_events_sound` */

DROP TABLE IF EXISTS `system_events_sound`;

CREATE TABLE `system_events_sound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medianame` varchar(50) DEFAULT NULL,
  `media` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `system_milestone` */

DROP TABLE IF EXISTS `system_milestone`;

CREATE TABLE `system_milestone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(100) DEFAULT NULL,
  `setting_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `system_remember_syncdoor` */

DROP TABLE IF EXISTS `system_remember_syncdoor`;

CREATE TABLE `system_remember_syncdoor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DoorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_user` */

DROP TABLE IF EXISTS `system_user`;

CREATE TABLE `system_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `RolesID` int(11) DEFAULT NULL,
  `activeFlag` int(5) DEFAULT NULL,
  `Remark` varchar(100) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `ofis` tinyint(4) DEFAULT '0',
  `template1` longtext,
  `template2` longtext,
  `fingerid1` int(11) DEFAULT NULL,
  `fingerid2` int(11) DEFAULT NULL,
  `MobileOS` varchar(10) DEFAULT NULL,
  `MobileToken` longtext,
  `email` varchar(50) DEFAULT NULL,
  `default_home` int(3) DEFAULT '0',
  `attendanceview` longtext,
  `passwordUpdateOn` datetime DEFAULT NULL,
  `isRelease` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_lastlogin` */

DROP TABLE IF EXISTS `system_user_lastlogin`;

CREATE TABLE `system_user_lastlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `ipaddress` varchar(50) DEFAULT NULL,
  `ipaddress1` varchar(50) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `LogoutTime` datetime DEFAULT NULL,
  `LogoutStatusFlag` int(5) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_modules` */

DROP TABLE IF EXISTS `system_user_modules`;

CREATE TABLE `system_user_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `fieldcode` varchar(50) DEFAULT NULL,
  `auditkey` varchar(50) DEFAULT NULL,
  `activeFlag` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_modules_details` */

DROP TABLE IF EXISTS `system_user_modules_details`;

CREATE TABLE `system_user_modules_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModulesID` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `activeFlag` int(1) DEFAULT NULL,
  `fieldcode` varchar(50) DEFAULT NULL,
  `ordering` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_password_details` */

DROP TABLE IF EXISTS `system_user_password_details`;

CREATE TABLE `system_user_password_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_personalsettings` */

DROP TABLE IF EXISTS `system_user_personalsettings`;

CREATE TABLE `system_user_personalsettings` (
  `userid` int(11) NOT NULL,
  `LanguageCode` varchar(10) DEFAULT 'EN-US',
  `Theme` varchar(50) DEFAULT 'Seven',
  `NarBar` int(5) DEFAULT '0',
  `MonitoringView` int(5) DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_roles` */

DROP TABLE IF EXISTS `system_user_roles`;

CREATE TABLE `system_user_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `department` longtext,
  `doorgroup` longtext,
  `roles_type` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_roles_group` */

DROP TABLE IF EXISTS `system_user_roles_group`;

CREATE TABLE `system_user_roles_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RolesID` int(11) DEFAULT NULL,
  `ModulesID` int(11) DEFAULT NULL,
  `viewFlag` int(5) DEFAULT NULL,
  `EditFlag` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_roles_group_details` */

DROP TABLE IF EXISTS `system_user_roles_group_details`;

CREATE TABLE `system_user_roles_group_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `RolesID` int(11) DEFAULT NULL,
  `Modules_Details_ID` int(11) DEFAULT NULL,
  `right` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_server_lastlogin` */

DROP TABLE IF EXISTS `system_user_server_lastlogin`;

CREATE TABLE `system_user_server_lastlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `currenttime` datetime DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `system_user_temp` */

DROP TABLE IF EXISTS `system_user_temp`;

CREATE TABLE `system_user_temp` (
  `idsystem_user_temp` int(11) NOT NULL AUTO_INCREMENT,
  `idlogin` int(11) DEFAULT NULL,
  `idregister` int(11) DEFAULT NULL,
  `template1` longtext,
  `fingerid1` int(11) DEFAULT NULL,
  `template2` longtext,
  `fingerid2` int(11) DEFAULT NULL,
  `saved` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`idsystem_user_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `systemsetting_company` */

DROP TABLE IF EXISTS `systemsetting_company`;

CREATE TABLE `systemsetting_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address1` longtext,
  `Address2` longtext,
  `City` varchar(100) DEFAULT NULL,
  `Zip` varchar(50) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `ContactP` longtext,
  `DName` longtext,
  `DAddress1` longtext,
  `DCity` varchar(100) DEFAULT NULL,
  `DState` varchar(100) DEFAULT NULL,
  `watermark` longtext,
  `watermarkDisplayMode` int(5) DEFAULT '0',
  `ShowWatermarkFlag` int(5) DEFAULT '0',
  `FirstStartup` int(2) DEFAULT '0',
  `push_api_key` longtext,
  `DatabaseServerFilePath` longtext,
  `daysInterval` int(3) DEFAULT '1',
  `DateStart` varchar(11) DEFAULT NULL,
  `ReportSchedulerPath` longtext,
  `DatabaseBackupHistory` varchar(50) DEFAULT NULL,
  `ExportSchedulerPath` longtext,
  `TIMINGpath` longtext,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `timezone` varchar(10) DEFAULT NULL,
  `report_logo` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `systemsetting_company_country` */

DROP TABLE IF EXISTS `systemsetting_company_country`;

CREATE TABLE `systemsetting_company_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8;

/*Table structure for table `systemsettings` */

DROP TABLE IF EXISTS `systemsettings`;

CREATE TABLE `systemsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `settingname` varchar(50) DEFAULT NULL,
  `settingvalue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Table structure for table `temp_verify` */

DROP TABLE IF EXISTS `temp_verify`;

CREATE TABLE `temp_verify` (
  `idtemp_verify` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT '0',
  `isPass` tinyint(4) DEFAULT '0',
  `ofis` tinyint(4) DEFAULT '0',
  `createdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemp_verify`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_att_detailsexport` */

DROP TABLE IF EXISTS `template_att_detailsexport`;

CREATE TABLE `template_att_detailsexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_att_payrollexport` */

DROP TABLE IF EXISTS `template_att_payrollexport`;

CREATE TABLE `template_att_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2013-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_att_summaryexport` */

DROP TABLE IF EXISTS `template_att_summaryexport`;

CREATE TABLE `template_att_summaryexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_kaki_payrollexport` */

DROP TABLE IF EXISTS `template_kaki_payrollexport`;

CREATE TABLE `template_kaki_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2018-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_million_payrollexport` */

DROP TABLE IF EXISTS `template_million_payrollexport`;

CREATE TABLE `template_million_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `country` varchar(1) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_myob_payrollexport` */

DROP TABLE IF EXISTS `template_myob_payrollexport`;

CREATE TABLE `template_myob_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_pastel_payrollexport` */

DROP TABLE IF EXISTS `template_pastel_payrollexport`;

CREATE TABLE `template_pastel_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2020-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_reckon_payrollexport` */

DROP TABLE IF EXISTS `template_reckon_payrollexport`;

CREATE TABLE `template_reckon_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_sql_payrollexport` */

DROP TABLE IF EXISTS `template_sql_payrollexport`;

CREATE TABLE `template_sql_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2016-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_unipay_payrollexport` */

DROP TABLE IF EXISTS `template_unipay_payrollexport`;

CREATE TABLE `template_unipay_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_usa_payrollexport` */

DROP TABLE IF EXISTS `template_usa_payrollexport`;

CREATE TABLE `template_usa_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_vip_payrollexport` */

DROP TABLE IF EXISTS `template_vip_payrollexport`;

CREATE TABLE `template_vip_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2020-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `template_wc7_payrollexport` */

DROP TABLE IF EXISTS `template_wc7_payrollexport`;

CREATE TABLE `template_wc7_payrollexport` (
  `idtemplate` int(11) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtemplate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `timeset` */

DROP TABLE IF EXISTS `timeset`;

CREATE TABLE `timeset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timesetname` varchar(45) DEFAULT NULL,
  `timesetdesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesetname` (`timesetname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `timezone` */

DROP TABLE IF EXISTS `timezone`;

CREATE TABLE `timezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timesetid` int(11) DEFAULT '0',
  `timezoneid` int(11) DEFAULT '0',
  `sequence` int(11) DEFAULT NULL,
  `displaytimezone` varchar(200) DEFAULT NULL,
  `flag` tinytext,
  `actualtimezone` varchar(200) DEFAULT NULL,
  `TZIndex` int(11) DEFAULT NULL,
  `timezonename` varchar(45) DEFAULT NULL,
  `timezonedesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesetid` (`timesetid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `timezone_door_open` */

DROP TABLE IF EXISTS `timezone_door_open`;

CREATE TABLE `timezone_door_open` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT '',
  `holidayFlag` int(1) DEFAULT '0',
  `Flag` varchar(50) DEFAULT '',
  `forceOpenType` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `timezone_group` */

DROP TABLE IF EXISTS `timezone_group`;

CREATE TABLE `timezone_group` (
  `idtimezone_group` int(11) NOT NULL AUTO_INCREMENT,
  `timezonename` varchar(45) DEFAULT NULL,
  `timezonedesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idtimezone_group`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `Auto_No` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `ic` varchar(20) DEFAULT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `User_Group` int(11) DEFAULT '0',
  `designation` varchar(100) DEFAULT NULL,
  `Gender` tinytext,
  `DOB` date DEFAULT NULL,
  `IssueDate` date DEFAULT '2012-01-01',
  `expirydate` date DEFAULT '2029-12-31',
  `picture` longtext,
  `pictureflag` tinyint(4) DEFAULT '0',
  `Remark` varchar(200) DEFAULT NULL,
  `define_14` varchar(50) DEFAULT NULL,
  `define_13` varchar(50) DEFAULT '0',
  `define_11` varchar(50) DEFAULT NULL,
  `define_4` varchar(50) DEFAULT NULL,
  `define_2` varchar(50) DEFAULT '0',
  `define_1` varchar(50) DEFAULT NULL,
  `SuspendedDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `LastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pay_rate` decimal(9,3) DEFAULT '0.000',
  `pay_type` int(11) DEFAULT '0',
  `nationality` varchar(50) DEFAULT NULL,
  `maritalstatus` int(11) DEFAULT '0',
  `religion` int(11) DEFAULT '0',
  `race` varchar(50) DEFAULT NULL,
  `ename` varchar(50) DEFAULT NULL,
  `econtact` varchar(50) DEFAULT NULL,
  `erelation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Auto_No`),
  KEY `UserID` (`userid`),
  KEY `Name` (`Name`),
  KEY `User_Group` (`User_Group`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Table structure for table `user_biotemplate` */

DROP TABLE IF EXISTS `user_biotemplate`;

CREATE TABLE `user_biotemplate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) NOT NULL,
  `template` longtext,
  `bio_index` int(6) NOT NULL DEFAULT '0',
  `bio_type` int(6) NOT NULL DEFAULT '0',
  `majorver` varchar(30) DEFAULT NULL,
  `minorver` varchar(30) DEFAULT NULL,
  `bio_format` int(6) NOT NULL DEFAULT '0',
  `bio_no` int(6) NOT NULL DEFAULT '0',
  `valid` int(6) NOT NULL DEFAULT '1',
  `duress` int(6) NOT NULL DEFAULT '0',
  `del_tag` int(6) NOT NULL DEFAULT '0',
  `createdate` datetime DEFAULT '2019-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idadms` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_certifications` */

DROP TABLE IF EXISTS `user_certifications`;

CREATE TABLE `user_certifications` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_define` */

DROP TABLE IF EXISTS `user_define`;

CREATE TABLE `user_define` (
  `iduser_define` int(11) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(50) DEFAULT NULL,
  `itemdata` varchar(200) DEFAULT NULL,
  `itemtype` int(11) NOT NULL DEFAULT '0',
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`iduser_define`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_education_background` */

DROP TABLE IF EXISTS `user_education_background`;

CREATE TABLE `user_education_background` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `yearstart` datetime DEFAULT NULL,
  `yearend` datetime DEFAULT NULL,
  `qualification` int(11) DEFAULT NULL,
  `fieldofstudy` int(11) DEFAULT NULL,
  `grade` decimal(6,2) DEFAULT '0.00',
  `institution` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_face` */

DROP TABLE IF EXISTS `user_face`;

CREATE TABLE `user_face` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) DEFAULT NULL,
  `faceid` varchar(45) DEFAULT NULL,
  `template` longtext,
  `tmpLength` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `faceid` (`faceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_face_details` */

DROP TABLE IF EXISTS `user_face_details`;

CREATE TABLE `user_face_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idface` int(11) DEFAULT NULL,
  `tmplength` int(11) DEFAULT NULL,
  `template` longtext,
  `templateid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_family_details` */

DROP TABLE IF EXISTS `user_family_details`;

CREATE TABLE `user_family_details` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `contactnumber` varchar(50) DEFAULT NULL,
  `relation` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_group` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gName` varchar(200) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `depth` varchar(45) DEFAULT NULL,
  `path` longtext,
  `color_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Table structure for table `user_info` */

DROP TABLE IF EXISTS `user_info`;

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `employeeid` varchar(15) DEFAULT NULL,
  `defaultdeptid` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL,
  `privilege` int(11) NOT NULL DEFAULT '0',
  `enabled` varchar(10) DEFAULT NULL,
  `cardnumber` varchar(20) DEFAULT NULL,
  `accgroup` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  `dutygroup` int(11) NOT NULL DEFAULT '1',
  `serialno` varchar(20) DEFAULT NULL,
  `fp9` tinyint(2) DEFAULT '0',
  `fp10` tinyint(2) DEFAULT '0',
  `face` varchar(5) DEFAULT NULL,
  `CreateDate` datetime DEFAULT '2012-01-01 00:00:00',
  `LastUpdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idpay_class` int(11) DEFAULT '0',
  `userverifytype` int(11) DEFAULT '0',
  `idadms` varchar(50) DEFAULT NULL,
  `palm` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `username` (`username`),
  KEY `usergroup` (`usergroup`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

/*Table structure for table `user_job_experience` */

DROP TABLE IF EXISTS `user_job_experience`;

CREATE TABLE `user_job_experience` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `joineddate` datetime DEFAULT NULL,
  `leaveddate` datetime DEFAULT NULL,
  `companyname` varchar(50) DEFAULT NULL,
  `industry` int(11) DEFAULT '0',
  `specialization` int(11) DEFAULT '0',
  `positionlevel` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `salary` decimal(8,2) DEFAULT NULL,
  `reasonleaving` varchar(200) DEFAULT NULL,
  `briefjobfunction` longtext,
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_language_proficiency` */

DROP TABLE IF EXISTS `user_language_proficiency`;

CREATE TABLE `user_language_proficiency` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `language` int(11) DEFAULT '0',
  `written` smallint(2) DEFAULT '0',
  `spoken` smallint(2) DEFAULT '0',
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_pay_class` */

DROP TABLE IF EXISTS `user_pay_class`;

CREATE TABLE `user_pay_class` (
  `idpay_class` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `round_in_min` varchar(10) DEFAULT NULL,
  `round_out_min` varchar(10) DEFAULT NULL,
  `round_in` int(11) DEFAULT NULL,
  `round_out` int(11) DEFAULT NULL,
  `flexilunch` varchar(10) DEFAULT NULL,
  `nolunch` tinytext,
  `flexidinner` varchar(10) DEFAULT NULL,
  `nodinner` tinytext,
  `minot` varchar(10) DEFAULT NULL,
  `maxot` decimal(5,3) DEFAULT NULL,
  `round_work_min` varchar(10) DEFAULT NULL,
  `round_overtime_min` varchar(10) DEFAULT NULL,
  `round_work` int(11) DEFAULT NULL,
  `round_overtime` int(11) DEFAULT NULL,
  `first_rounding_from` varchar(10) DEFAULT NULL,
  `first_rounding_to` varchar(10) DEFAULT NULL,
  `last_rounding_from` varchar(10) DEFAULT NULL,
  `last_rounding_to` varchar(10) DEFAULT NULL,
  `first_rounding` varchar(10) DEFAULT NULL,
  `last_rounding` varchar(10) DEFAULT NULL,
  `diffot` varchar(10) DEFAULT NULL,
  `define_in_out` tinytext,
  `auto_add_break` tinytext,
  `deduct_break_from_ot` tinytext,
  `include_break_into_ot` tinytext,
  `hours_break_from_ot` varchar(10) DEFAULT NULL,
  `ot_exceeded` varchar(10) DEFAULT NULL,
  `rounding` tinytext,
  `job_able` tinytext,
  `same_day` varchar(10) DEFAULT NULL,
  `next_day` varchar(10) DEFAULT NULL,
  `last_out` varchar(10) DEFAULT NULL,
  `double_punch` varchar(10) DEFAULT NULL,
  `ignore_break` tinytext,
  `break_paid` tinytext,
  `deduct_break` varchar(10) DEFAULT NULL,
  `include_break` tinytext,
  `exclude_break` tinytext,
  `deduct_break_from_work` varchar(10) DEFAULT NULL,
  `work_exceeded` varchar(10) DEFAULT NULL,
  `auto_deduction` tinytext,
  `auto_addition` tinytext,
  `auto_add_time` varchar(10) DEFAULT NULL,
  `work_surpassed` varchar(10) DEFAULT NULL,
  `ot_start` varchar(10) DEFAULT NULL,
  `double_time` tinytext,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `double_time_o` tinytext,
  `double_time_h` tinytext,
  `double_ignore` tinytext,
  `double_ignore_o` tinytext,
  `double_ignore_h` tinytext,
  `round_short` int(11) DEFAULT '0',
  `round_short_min` varchar(10) DEFAULT '0',
  PRIMARY KEY (`idpay_class`),
  UNIQUE KEY `pk` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_remove` */

DROP TABLE IF EXISTS `user_remove`;

CREATE TABLE `user_remove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `accessid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_scheduler` */

DROP TABLE IF EXISTS `user_scheduler`;

CREATE TABLE `user_scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` int(1) DEFAULT '0',
  `runtime` varchar(11) DEFAULT NULL,
  `startrun` varchar(11) DEFAULT NULL,
  `enable` int(1) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL,
  `opt_device` longtext,
  `opt_user` longtext,
  `opt_department` longtext,
  `opt_userinfo` int(1) DEFAULT '0',
  `opt_fp` int(1) DEFAULT '0',
  `opt_face` int(1) DEFAULT '0',
  `opt_cardno` int(1) DEFAULT '0',
  `opt_photo` int(1) DEFAULT '0',
  `opt_access` int(1) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_role` int(11) NOT NULL DEFAULT '1',
  `cmdstart` datetime DEFAULT NULL,
  `cmdexecute` datetime DEFAULT NULL,
  `createdate` datetime DEFAULT '2019-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_scheduler_status` */

DROP TABLE IF EXISTS `user_scheduler_status`;

CREATE TABLE `user_scheduler_status` (
  `id` int(11) NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_skills` */

DROP TABLE IF EXISTS `user_skills`;

CREATE TABLE `user_skills` (
  `auto_no` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `skill` varchar(50) DEFAULT NULL,
  `proficiency` smallint(2) DEFAULT '0',
  `yearsofexperience` smallint(2) DEFAULT '0',
  `createdate` datetime DEFAULT '2022-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`auto_no`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_temperature` */

DROP TABLE IF EXISTS `user_temperature`;

CREATE TABLE `user_temperature` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `record_date` date DEFAULT NULL,
  `record_time` varchar(8) DEFAULT NULL,
  `temperature` varchar(5) DEFAULT NULL,
  `remark` longtext,
  `createdate` datetime DEFAULT '2020-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `serialno` varchar(50) DEFAULT NULL,
  `mask_flag` int(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `temppk` (`userid`,`record_date`,`record_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_template` */

DROP TABLE IF EXISTS `user_template`;

CREATE TABLE `user_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `tmplength` int(11) DEFAULT NULL,
  `template` longtext,
  `fingerid` smallint(6) DEFAULT NULL,
  `valid` smallint(6) DEFAULT '1',
  `serialno` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_template_fp10` */

DROP TABLE IF EXISTS `user_template_fp10`;

CREATE TABLE `user_template_fp10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `tmplength` int(11) DEFAULT NULL,
  `template` longtext,
  `fingerid` smallint(6) DEFAULT NULL,
  `valid` smallint(6) DEFAULT '1',
  `serialno` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `verify_code` */

DROP TABLE IF EXISTS `verify_code`;

CREATE TABLE `verify_code` (
  `idverify_code` int(11) NOT NULL,
  `verifycode` int(11) DEFAULT NULL,
  `verifytype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idverify_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `verifytype` */

DROP TABLE IF EXISTS `verifytype`;

CREATE TABLE `verifytype` (
  `idverifytype` int(11) NOT NULL AUTO_INCREMENT,
  `verifytypename` varchar(45) DEFAULT NULL,
  `verifytypedesc` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2012-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idverifytype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `verifytype_timezone` */

DROP TABLE IF EXISTS `verifytype_timezone`;

CREATE TABLE `verifytype_timezone` (
  `idverifytype_timezone` int(11) NOT NULL AUTO_INCREMENT,
  `idverifytype` int(11) DEFAULT NULL,
  `idverifytype_dow` int(11) DEFAULT NULL,
  `verifytype` varchar(100) DEFAULT NULL,
  `time1` varchar(8) DEFAULT NULL,
  `time2` varchar(8) DEFAULT NULL,
  `time3` varchar(8) DEFAULT NULL,
  `time4` varchar(8) DEFAULT NULL,
  `time5` varchar(8) DEFAULT NULL,
  `time6` varchar(8) DEFAULT NULL,
  `time7` varchar(8) DEFAULT NULL,
  `time8` varchar(8) DEFAULT NULL,
  `time9` varchar(8) DEFAULT NULL,
  `time10` varchar(8) DEFAULT NULL,
  `time11` varchar(8) DEFAULT NULL,
  `time12` varchar(8) DEFAULT NULL,
  `time13` varchar(8) DEFAULT NULL,
  `time14` varchar(8) DEFAULT NULL,
  `time15` varchar(8) DEFAULT NULL,
  `time16` varchar(8) DEFAULT NULL,
  `time17` varchar(8) DEFAULT NULL,
  `time18` varchar(8) DEFAULT NULL,
  `time19` varchar(8) DEFAULT NULL,
  `time20` varchar(8) DEFAULT NULL,
  `time21` varchar(8) DEFAULT NULL,
  `time22` varchar(8) DEFAULT NULL,
  `time23` varchar(8) DEFAULT NULL,
  `time24` varchar(8) DEFAULT NULL,
  `time25` varchar(8) DEFAULT NULL,
  `time26` varchar(8) DEFAULT NULL,
  `time27` varchar(8) DEFAULT NULL,
  `time28` varchar(8) DEFAULT NULL,
  `time29` varchar(8) DEFAULT NULL,
  `time30` varchar(8) DEFAULT NULL,
  `time31` varchar(8) DEFAULT NULL,
  `time32` varchar(8) DEFAULT NULL,
  `time33` varchar(8) DEFAULT NULL,
  `time34` varchar(8) DEFAULT NULL,
  `time35` varchar(8) DEFAULT NULL,
  `time36` varchar(8) DEFAULT NULL,
  `time37` varchar(8) DEFAULT NULL,
  `time38` varchar(8) DEFAULT NULL,
  `time39` varchar(8) DEFAULT NULL,
  `time40` varchar(8) DEFAULT NULL,
  `time41` varchar(8) DEFAULT NULL,
  `time42` varchar(8) DEFAULT NULL,
  `time43` varchar(8) DEFAULT NULL,
  `time44` varchar(8) DEFAULT NULL,
  `time45` varchar(8) DEFAULT NULL,
  `time46` varchar(8) DEFAULT NULL,
  `time47` varchar(8) DEFAULT NULL,
  `time48` varchar(8) DEFAULT NULL,
  `time49` varchar(8) DEFAULT NULL,
  `time50` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`idverifytype_timezone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor` */

DROP TABLE IF EXISTS `visitor`;

CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `ic` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `vehicle_type` int(11) DEFAULT NULL,
  `vehicle_registration` varchar(50) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `access_group` int(11) DEFAULT NULL,
  `department_visit` int(11) DEFAULT NULL,
  `person_visit` varchar(30) DEFAULT NULL,
  `card_number` varchar(20) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `photo` longtext,
  `approve` int(1) DEFAULT '0',
  `id_applicants` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_applicants` */

DROP TABLE IF EXISTS `visitor_applicants`;

CREATE TABLE `visitor_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `department_visit` int(11) DEFAULT NULL,
  `person_visit` varchar(30) DEFAULT NULL,
  `visit_date` datetime DEFAULT NULL,
  `photo` longtext,
  `approve` int(1) DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_blacklist` */

DROP TABLE IF EXISTS `visitor_blacklist`;

CREATE TABLE `visitor_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_visitor` int(11) DEFAULT NULL,
  `ic` varchar(50) DEFAULT NULL,
  `blacklisted` int(1) DEFAULT '1',
  `remark` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_checkinout` */

DROP TABLE IF EXISTS `visitor_checkinout`;

CREATE TABLE `visitor_checkinout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_visitor` int(11) DEFAULT NULL,
  `check_in_date` datetime DEFAULT NULL,
  `check_out_date` datetime DEFAULT NULL,
  `force_check_out` int(1) DEFAULT '0',
  `remark` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_email_template` */

DROP TABLE IF EXISTS `visitor_email_template`;

CREATE TABLE `visitor_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_role` */

DROP TABLE IF EXISTS `visitor_role`;

CREATE TABLE `visitor_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_user_id` */

DROP TABLE IF EXISTS `visitor_user_id`;

CREATE TABLE `visitor_user_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) DEFAULT NULL,
  `visitor_id` int(11) DEFAULT NULL,
  `session_id` varchar(100) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visitor_vehicle` */

DROP TABLE IF EXISTS `visitor_vehicle`;

CREATE TABLE `visitor_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createdate` datetime DEFAULT '2015-01-01 00:00:00',
  `lastupdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Table structure for table `visualmap` */

DROP TABLE IF EXISTS `visualmap`;

CREATE TABLE `visualmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `height` int(11) DEFAULT '0',
  `width` int(11) DEFAULT '0',
  `image` longtext,
  `img_ext` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `visualmap_userview` */

DROP TABLE IF EXISTS `visualmap_userview`;

CREATE TABLE `visualmap_userview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `visualmapid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `webster_info` */

DROP TABLE IF EXISTS `webster_info`;

CREATE TABLE `webster_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) DEFAULT NULL,
  `database_name` varchar(200) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `last_download_log` int(11) DEFAULT NULL,
  `transaction_auto_download` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `zone` */

DROP TABLE IF EXISTS `zone`;

CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `zoneTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_burglaralarm` */

DROP TABLE IF EXISTS `zone_burglaralarm`;

CREATE TABLE `zone_burglaralarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `eventType` int(11) DEFAULT NULL,
  `InAddress` int(11) DEFAULT NULL,
  `outtype` varchar(50) DEFAULT NULL,
  `OutAddress` int(11) DEFAULT NULL,
  `OutTime` int(11) DEFAULT NULL,
  `manualSync` int(1) DEFAULT '0',
  `enabledFlag` int(1) DEFAULT '0',
  `sync` int(1) DEFAULT '0',
  `timezone` varchar(200) DEFAULT NULL,
  `timezone_allday` varchar(50) DEFAULT NULL,
  `Reserved` int(11) DEFAULT NULL,
  `auto_off_aux` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_device` */

DROP TABLE IF EXISTS `zone_device`;

CREATE TABLE `zone_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idzone` int(11) DEFAULT NULL,
  `idDevice` int(11) DEFAULT NULL,
  `deviceFunc` varchar(50) DEFAULT NULL,
  `mode_antipass` int(11) DEFAULT '0',
  `mode_interlocking` int(11) DEFAULT '0',
  `mode_firealarm` int(11) DEFAULT '0',
  `mode_entranceLimit` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idzone` (`idzone`),
  KEY `idDevice` (`idDevice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_firealarm` */

DROP TABLE IF EXISTS `zone_firealarm`;

CREATE TABLE `zone_firealarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `eventType` int(11) DEFAULT NULL,
  `InAddress` int(11) DEFAULT NULL,
  `outtype` varchar(50) DEFAULT NULL,
  `OutAddress` int(11) DEFAULT NULL,
  `OutTime` int(11) DEFAULT NULL,
  `Reserved` int(11) DEFAULT NULL,
  `enabledFlag` int(1) DEFAULT '0',
  `auto_off_aux` int(1) DEFAULT '0',
  `door_alarm_trigger` longtext,
  `door_alarm_trigger_action` int(1) DEFAULT NULL,
  `door_alarm_trigger_delay` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_firstcard` */

DROP TABLE IF EXISTS `zone_firstcard`;

CREATE TABLE `zone_firstcard` (
  `idzone` int(11) NOT NULL,
  `timesetID` int(11) NOT NULL,
  PRIMARY KEY (`idzone`,`timesetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_firstcard_door` */

DROP TABLE IF EXISTS `zone_firstcard_door`;

CREATE TABLE `zone_firstcard_door` (
  `idZone` int(11) NOT NULL,
  `DoorID` int(11) NOT NULL,
  PRIMARY KEY (`idZone`,`DoorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_firstcard_user` */

DROP TABLE IF EXISTS `zone_firstcard_user`;

CREATE TABLE `zone_firstcard_user` (
  `idzone` int(11) NOT NULL,
  `userid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idzone`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_multicard_combination` */

DROP TABLE IF EXISTS `zone_multicard_combination`;

CREATE TABLE `zone_multicard_combination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_multicard_combination_door` */

DROP TABLE IF EXISTS `zone_multicard_combination_door`;

CREATE TABLE `zone_multicard_combination_door` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `combinationID` int(11) DEFAULT NULL,
  `doorID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_multicard_combination_usergroup` */

DROP TABLE IF EXISTS `zone_multicard_combination_usergroup`;

CREATE TABLE `zone_multicard_combination_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multicard_combinationid` int(11) DEFAULT NULL,
  `multicard_usergroupid` int(11) DEFAULT NULL,
  `totaluser` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_multicard_usergroup` */

DROP TABLE IF EXISTS `zone_multicard_usergroup`;

CREATE TABLE `zone_multicard_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zone_multicard_usergroup_user` */

DROP TABLE IF EXISTS `zone_multicard_usergroup_user`;

CREATE TABLE `zone_multicard_usergroup_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `multicard_usergroupid` int(11) DEFAULT NULL,
  `userid` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zonemode_antipass_interlock` */

DROP TABLE IF EXISTS `zonemode_antipass_interlock`;

CREATE TABLE `zonemode_antipass_interlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zoneTypeId` int(11) DEFAULT NULL,
  `DoorNo` int(11) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `sdkvalue` varchar(11) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Table structure for table `zonetype` */

DROP TABLE IF EXISTS `zonetype`;

CREATE TABLE `zonetype` (
  `zonetypeID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `langCode` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`zonetypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
