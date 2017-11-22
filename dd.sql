-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 192.168.134.1    Database: adminset
-- ------------------------------------------------------
-- Server version	5.6.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_permissionlist`
--

DROP TABLE IF EXISTS `accounts_permissionlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_permissionlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_rolelist`
--

DROP TABLE IF EXISTS `accounts_rolelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_rolelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_rolelist_permission`
--

DROP TABLE IF EXISTS `accounts_rolelist_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_rolelist_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolelist_id` int(11) NOT NULL,
  `permissionlist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_rolelist_permis_rolelist_id_permissionli_4a3ad44e_uniq` (`rolelist_id`,`permissionlist_id`),
  KEY `accounts_rolelist_pe_permissionlist_id_40c1a242_fk_accounts_` (`permissionlist_id`),
  CONSTRAINT `accounts_rolelist_pe_permissionlist_id_40c1a242_fk_accounts_` FOREIGN KEY (`permissionlist_id`) REFERENCES `accounts_permissionlist` (`id`),
  CONSTRAINT `accounts_rolelist_pe_rolelist_id_eb971769_fk_accounts_` FOREIGN KEY (`rolelist_id`) REFERENCES `accounts_rolelist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts_userinfo`
--

DROP TABLE IF EXISTS `accounts_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `accounts_userinfo_role_id_9048fe09_fk_accounts_rolelist_id` (`role_id`),
  CONSTRAINT `accounts_userinfo_role_id_9048fe09_fk_accounts_rolelist_id` FOREIGN KEY (`role_id`) REFERENCES `accounts_rolelist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(30) NOT NULL,
  `db_port` varchar(10) NOT NULL,
  `alarm_type` varchar(30) NOT NULL,
  `send_mail` smallint(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alarm_db_ip_db_port_e5959f73_idx` (`db_ip`,`db_port`),
  KEY `alarm_create_time_73f863f3` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alarm_temp`
--

DROP TABLE IF EXISTS `alarm_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alarm_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(30) NOT NULL,
  `db_port` varchar(10) NOT NULL,
  `alarm_type` varchar(30) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alarm_temp_db_ip_db_port_alarm_type_c1f3486f_idx` (`db_ip`,`db_port`,`alarm_type`),
  KEY `alarm_temp_create_time_6b86e421` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appconf_appowner`
--

DROP TABLE IF EXISTS `appconf_appowner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconf_appowner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `qq` varchar(100) DEFAULT NULL,
  `weChat` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appconf_product`
--

DROP TABLE IF EXISTS `appconf_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconf_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `appconf_product_owner_id_e48e3452_fk_appconf_appowner_id` (`owner_id`),
  CONSTRAINT `appconf_product_owner_id_e48e3452_fk_appconf_appowner_id` FOREIGN KEY (`owner_id`) REFERENCES `appconf_appowner` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appconf_project`
--

DROP TABLE IF EXISTS `appconf_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconf_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `language_type` varchar(30) DEFAULT NULL,
  `app_type` varchar(30) DEFAULT NULL,
  `server_type` varchar(30) DEFAULT NULL,
  `app_arch` varchar(30) DEFAULT NULL,
  `source_type` varchar(255) NOT NULL,
  `source_address` varchar(255) DEFAULT NULL,
  `appPath` varchar(255) DEFAULT NULL,
  `configPath` varchar(255) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `appconf_project_owner_id_65e78373_fk_appconf_appowner_id` (`owner_id`),
  KEY `appconf_project_product_id_15653260_fk_appconf_product_id` (`product_id`),
  CONSTRAINT `appconf_project_owner_id_65e78373_fk_appconf_appowner_id` FOREIGN KEY (`owner_id`) REFERENCES `appconf_appowner` (`id`),
  CONSTRAINT `appconf_project_product_id_15653260_fk_appconf_product_id` FOREIGN KEY (`product_id`) REFERENCES `appconf_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `appconf_project_serverlist`
--

DROP TABLE IF EXISTS `appconf_project_serverlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appconf_project_serverlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `host_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appconf_project_serverList_project_id_host_id_4201db29_uniq` (`project_id`,`host_id`),
  KEY `appconf_project_serverList_host_id_e34f782f_fk_cmdb_host_id` (`host_id`),
  CONSTRAINT `appconf_project_serv_project_id_b834fba8_fk_appconf_p` FOREIGN KEY (`project_id`) REFERENCES `appconf_project` (`id`),
  CONSTRAINT `appconf_project_serverList_host_id_e34f782f_fk_cmdb_host_id` FOREIGN KEY (`host_id`) REFERENCES `cmdb_host` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_host`
--

DROP TABLE IF EXISTS `cmdb_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_host` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `ip` char(39) NOT NULL,
  `other_ip` varchar(100) DEFAULT NULL,
  `asset_no` varchar(50) DEFAULT NULL,
  `asset_type` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `vendor` varchar(50) DEFAULT NULL,
  `cpu_model` varchar(100) DEFAULT NULL,
  `cpu_num` varchar(100) DEFAULT NULL,
  `memory` varchar(30) DEFAULT NULL,
  `disk` varchar(255) DEFAULT NULL,
  `sn` varchar(60) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `memo` longtext,
  `group_id` int(11) DEFAULT NULL,
  `idc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`),
  KEY `cmdb_host_group_id_bcc2faaa_fk_cmdb_hostgroup_id` (`group_id`),
  KEY `cmdb_host_idc_id_363c74a2_fk_cmdb_idc_id` (`idc_id`),
  CONSTRAINT `cmdb_host_group_id_bcc2faaa_fk_cmdb_hostgroup_id` FOREIGN KEY (`group_id`) REFERENCES `cmdb_hostgroup` (`id`),
  CONSTRAINT `cmdb_host_idc_id_363c74a2_fk_cmdb_idc_id` FOREIGN KEY (`idc_id`) REFERENCES `cmdb_idc` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_hostgroup`
--

DROP TABLE IF EXISTS `cmdb_hostgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_hostgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_idc`
--

DROP TABLE IF EXISTS `cmdb_idc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_idc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `contact_phone` varchar(30) DEFAULT NULL,
  `jigui` varchar(30) DEFAULT NULL,
  `ip_range` varchar(30) DEFAULT NULL,
  `bandwidth` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_interface`
--

DROP TABLE IF EXISTS `cmdb_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_interface` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `vendor` varchar(30) DEFAULT NULL,
  `bandwidth` varchar(30) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_ipsource`
--

DROP TABLE IF EXISTS `cmdb_ipsource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_ipsource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `net` varchar(30) NOT NULL,
  `subnet` varchar(30) DEFAULT NULL,
  `describe` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cmdb_userinfo`
--

DROP TABLE IF EXISTS `cmdb_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cmdb_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbmanage_backuplog`
--

DROP TABLE IF EXISTS `dbmanage_backuplog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbmanage_backuplog` (
  `start_date` datetime(6) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `ip` char(39) NOT NULL,
  `type` varchar(10) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `spend_time` int(11) NOT NULL,
  `local_path` varchar(500) NOT NULL,
  `remote_path` varchar(500) NOT NULL,
  `is_copy_to_remote` int(11) DEFAULT NULL,
  `copy_date` datetime(6) DEFAULT NULL,
  `remote_ip` char(39) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbmanage_dbconfiginfo`
--

DROP TABLE IF EXISTS `dbmanage_dbconfiginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbmanage_dbconfiginfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `ip` char(39) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `backup_config` longtext NOT NULL,
  `regdate` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hostname` (`hostname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dbmanage_restorelog`
--

DROP TABLE IF EXISTS `dbmanage_restorelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbmanage_restorelog` (
  `start_date` datetime(6) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) NOT NULL,
  `ip` char(39) NOT NULL,
  `type` varchar(100) NOT NULL,
  `restore_ip` char(39) NOT NULL,
  `restore_file` varchar(3000) NOT NULL,
  `restore_endpos` varchar(300) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `spend_time` int(11) NOT NULL,
  `local_path` varchar(500) NOT NULL,
  `remote_path` varchar(500) NOT NULL,
  `remote_ip` char(39) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_crontabschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minute` varchar(64) NOT NULL,
  `hour` varchar(64) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(64) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_intervalschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_beat_periodictask`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) unsigned NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_beat_periodictasks`
--

DROP TABLE IF EXISTS `django_celery_beat_periodictasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL,
  PRIMARY KEY (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_beat_solarschedule`
--

DROP TABLE IF EXISTS `django_celery_beat_solarschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_celery_results_taskresult`
--

DROP TABLE IF EXISTS `django_celery_results_taskresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext,
  `hidden` tinyint(1) NOT NULL,
  `meta` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`),
  KEY `django_celery_results_taskresult_hidden_cd77412f` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_account`
--

DROP TABLE IF EXISTS `myapp_db_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL,
  `tags` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_db_account_tags_d9e1181a` (`tags`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_account_account`
--

DROP TABLE IF EXISTS `myapp_db_account_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_account_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_account_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_account_account_db_account_id_userinfo_id_631e088a_uniq` (`db_account_id`,`userinfo_id`),
  KEY `myapp_db_account_acc_userinfo_id_f9bc7e0f_fk_accounts_` (`userinfo_id`),
  CONSTRAINT `myapp_db_account_acc_db_account_id_efedf036_fk_myapp_db_` FOREIGN KEY (`db_account_id`) REFERENCES `myapp_db_account` (`id`),
  CONSTRAINT `myapp_db_account_acc_userinfo_id_f9bc7e0f_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_account_dbname`
--

DROP TABLE IF EXISTS `myapp_db_account_dbname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_account_dbname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_account_id` int(11) NOT NULL,
  `db_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_account_dbname_db_account_id_db_name_id_106a2af7_uniq` (`db_account_id`,`db_name_id`),
  KEY `myapp_db_account_dbname_db_name_id_693e2cb3_fk_myapp_db_name_id` (`db_name_id`),
  CONSTRAINT `myapp_db_account_dbn_db_account_id_b37f1a2b_fk_myapp_db_` FOREIGN KEY (`db_account_id`) REFERENCES `myapp_db_account` (`id`),
  CONSTRAINT `myapp_db_account_dbname_db_name_id_693e2cb3_fk_myapp_db_name_id` FOREIGN KEY (`db_name_id`) REFERENCES `myapp_db_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_group`
--

DROP TABLE IF EXISTS `myapp_db_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname` (`groupname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_group_account`
--

DROP TABLE IF EXISTS `myapp_db_group_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_group_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_group_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_group_account_db_group_id_userinfo_id_36dc36d3_uniq` (`db_group_id`,`userinfo_id`),
  KEY `myapp_db_group_accou_userinfo_id_6a6ec059_fk_accounts_` (`userinfo_id`),
  CONSTRAINT `myapp_db_group_accou_userinfo_id_6a6ec059_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`),
  CONSTRAINT `myapp_db_group_account_db_group_id_16d71fae_fk_myapp_db_group_id` FOREIGN KEY (`db_group_id`) REFERENCES `myapp_db_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_group_dbname`
--

DROP TABLE IF EXISTS `myapp_db_group_dbname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_group_dbname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_group_id` int(11) NOT NULL,
  `db_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_group_dbname_db_group_id_db_name_id_bffa3a64_uniq` (`db_group_id`,`db_name_id`),
  KEY `myapp_db_group_dbname_db_name_id_f385465b_fk_myapp_db_name_id` (`db_name_id`),
  CONSTRAINT `myapp_db_group_dbname_db_group_id_6eb1e160_fk_myapp_db_group_id` FOREIGN KEY (`db_group_id`) REFERENCES `myapp_db_group` (`id`),
  CONSTRAINT `myapp_db_group_dbname_db_name_id_f385465b_fk_myapp_db_name_id` FOREIGN KEY (`db_name_id`) REFERENCES `myapp_db_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_instance`
--

DROP TABLE IF EXISTS `myapp_db_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(30) NOT NULL,
  `port` varchar(10) NOT NULL,
  `role` varchar(30) NOT NULL,
  `db_type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_instance_ip_port_b37b05ac_uniq` (`ip`,`port`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_name`
--

DROP TABLE IF EXISTS `myapp_db_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbtag` varchar(30) NOT NULL,
  `dbname` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbtag` (`dbtag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_name_account`
--

DROP TABLE IF EXISTS `myapp_db_name_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_name_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_name_account_db_name_id_userinfo_id_bb111a42_uniq` (`db_name_id`,`userinfo_id`),
  KEY `myapp_db_name_accoun_userinfo_id_378cd830_fk_accounts_` (`userinfo_id`),
  CONSTRAINT `myapp_db_name_accoun_userinfo_id_378cd830_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`),
  CONSTRAINT `myapp_db_name_account_db_name_id_1c6af6de_fk_myapp_db_name_id` FOREIGN KEY (`db_name_id`) REFERENCES `myapp_db_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_db_name_instance`
--

DROP TABLE IF EXISTS `myapp_db_name_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_db_name_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_name_id` int(11) NOT NULL,
  `db_instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `myapp_db_name_instance_db_name_id_db_instance_id_14cbcb24_uniq` (`db_name_id`,`db_instance_id`),
  KEY `myapp_db_name_instan_db_instance_id_d7d872ca_fk_myapp_db_` (`db_instance_id`),
  CONSTRAINT `myapp_db_name_instan_db_instance_id_d7d872ca_fk_myapp_db_` FOREIGN KEY (`db_instance_id`) REFERENCES `myapp_db_instance` (`id`),
  CONSTRAINT `myapp_db_name_instance_db_name_id_f7e01431_fk_myapp_db_name_id` FOREIGN KEY (`db_name_id`) REFERENCES `myapp_db_name` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_incep_error_log`
--

DROP TABLE IF EXISTS `myapp_incep_error_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_incep_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `myid` int(11) NOT NULL,
  `stage` varchar(20) NOT NULL,
  `errlevel` int(11) NOT NULL,
  `stagestatus` varchar(40) NOT NULL,
  `errormessage` longtext NOT NULL,
  `sqltext` longtext NOT NULL,
  `affectrow` int(11) NOT NULL,
  `sequence` varchar(30) NOT NULL,
  `backup_db` varchar(100) NOT NULL,
  `execute_time` varchar(20) NOT NULL,
  `sqlsha` varchar(50) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `finish_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_incep_error_log_sequence_d1a93900` (`sequence`),
  KEY `myapp_incep_error_log_create_time_c92c0f1a` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_login_log`
--

DROP TABLE IF EXISTS `myapp_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(35) NOT NULL,
  `ipaddr` varchar(35) NOT NULL,
  `action` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_login_log_create_time_7f0dcec9` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_oper_log`
--

DROP TABLE IF EXISTS `myapp_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_oper_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(35) NOT NULL,
  `ipaddr` varchar(35) NOT NULL,
  `dbtag` varchar(35) NOT NULL,
  `dbname` varchar(40) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqltype` varchar(20) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `login_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_oper_log_dbtag_sqltype_create_time_cfafdbf7_idx` (`dbtag`,`sqltype`,`create_time`),
  KEY `myapp_oper_log_create_time_dd95545f` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_task`
--

DROP TABLE IF EXISTS `myapp_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(35) NOT NULL,
  `dbtag` varchar(35) NOT NULL,
  `sqltext` longtext NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `status` varchar(20) NOT NULL,
  `sqlsha` longtext NOT NULL,
  `sche_time` datetime(6) NOT NULL,
  `specification` varchar(100) NOT NULL,
  `operator` varchar(35) NOT NULL,
  `backup_status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_task_create_time_c0c2c4df` (`create_time`),
  KEY `myapp_task_status_d636a6db` (`status`),
  KEY `myapp_task_sche_time_681cd70d` (`sche_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_upload`
--

DROP TABLE IF EXISTS `myapp_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `filename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `myapp_user_profile`
--

DROP TABLE IF EXISTS `myapp_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myapp_user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `select_limit` int(11) NOT NULL,
  `export_limit` int(11) NOT NULL,
  `task_email` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `myapp_user_profile_task_email_950ac8fc` (`task_email`),
  CONSTRAINT `myapp_user_profile_user_id_0b750bc3_fk_accounts_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_connected`
--

DROP TABLE IF EXISTS `mysql_connected`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_connected` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(30) NOT NULL,
  `db_port` varchar(10) NOT NULL,
  `connect_server` varchar(100) NOT NULL,
  `connect_user` varchar(50) DEFAULT NULL,
  `connect_db` varchar(50) DEFAULT NULL,
  `connect_count` int(11) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mysql_connected_db_ip_db_port_create_time_539644f1_idx` (`db_ip`,`db_port`,`create_time`),
  KEY `mysql_connected_create_time_7bdda82f` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_monitor`
--

DROP TABLE IF EXISTS `mysql_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_monitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) NOT NULL,
  `monitor` smallint(6) NOT NULL,
  `check_longsql` smallint(6) NOT NULL,
  `longsql_time` smallint(6) NOT NULL,
  `longsql_autokill` smallint(6) NOT NULL,
  `check_active` smallint(6) NOT NULL,
  `active_threshold` smallint(6) NOT NULL,
  `check_connections` smallint(6) NOT NULL,
  `connection_threshold` int(11) NOT NULL,
  `check_delay` smallint(6) NOT NULL,
  `delay_threshold` int(11) NOT NULL,
  `check_slave` smallint(6) NOT NULL,
  `replchannel` varchar(30) NOT NULL,
  `alarm_times` smallint(6) NOT NULL,
  `alarm_interval` smallint(6) NOT NULL,
  `mail_to` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `instance_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `instance_id` (`instance_id`),
  KEY `mysql_monitor_account_id_b35a69ca_fk_myapp_db_account_id` (`account_id`),
  CONSTRAINT `mysql_monitor_account_id_b35a69ca_fk_myapp_db_account_id` FOREIGN KEY (`account_id`) REFERENCES `myapp_db_account` (`id`),
  CONSTRAINT `mysql_monitor_instance_id_dd73ee18_fk_myapp_db_instance_id` FOREIGN KEY (`instance_id`) REFERENCES `myapp_db_instance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_processlist`
--

DROP TABLE IF EXISTS `mysql_processlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_processlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(20) NOT NULL,
  `db_port` smallint(6) NOT NULL,
  `conn_id` varchar(30) NOT NULL,
  `user` varchar(32) NOT NULL,
  `host` varchar(64) NOT NULL,
  `db` varchar(64) NOT NULL,
  `command` varchar(16) NOT NULL,
  `time` int(11) NOT NULL,
  `state` varchar(64) DEFAULT NULL,
  `info` longtext,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_replication`
--

DROP TABLE IF EXISTS `mysql_replication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_replication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(20) NOT NULL,
  `db_port` smallint(6) NOT NULL,
  `is_master` smallint(6) NOT NULL,
  `is_slave` smallint(6) NOT NULL,
  `read_only` varchar(10) DEFAULT NULL,
  `gtid_mode` varchar(10) DEFAULT NULL,
  `master_server` varchar(30) DEFAULT NULL,
  `master_port` varchar(20) DEFAULT NULL,
  `slave_io_run` varchar(20) DEFAULT NULL,
  `slave_sql_run` varchar(20) DEFAULT NULL,
  `delay` varchar(20) DEFAULT NULL,
  `current_binlog_file` varchar(30) DEFAULT NULL,
  `current_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_file` varchar(30) DEFAULT NULL,
  `master_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_space` bigint(20) NOT NULL,
  `slave_sql_running_state` varchar(100) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mysql_replication_db_ip_db_port_fb13d000_uniq` (`db_ip`,`db_port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_replication_his`
--

DROP TABLE IF EXISTS `mysql_replication_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_replication_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(20) NOT NULL,
  `db_port` smallint(6) NOT NULL,
  `is_master` smallint(6) NOT NULL,
  `is_slave` smallint(6) NOT NULL,
  `read_only` varchar(10) DEFAULT NULL,
  `gtid_mode` varchar(10) DEFAULT NULL,
  `master_server` varchar(30) DEFAULT NULL,
  `master_port` varchar(20) DEFAULT NULL,
  `slave_io_run` varchar(20) DEFAULT NULL,
  `slave_sql_run` varchar(20) DEFAULT NULL,
  `delay` varchar(20) DEFAULT NULL,
  `current_binlog_file` varchar(30) DEFAULT NULL,
  `current_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_file` varchar(30) DEFAULT NULL,
  `master_binlog_pos` varchar(30) DEFAULT NULL,
  `master_binlog_space` bigint(20) NOT NULL,
  `slave_sql_running_state` varchar(100) DEFAULT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mysql_replication_his_db_ip_db_port_create_time_cec3d3fe_idx` (`db_ip`,`db_port`,`create_time`),
  KEY `mysql_replication_his_create_time_be34e6d8` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_status`
--

DROP TABLE IF EXISTS `mysql_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(30) NOT NULL,
  `db_port` varchar(10) NOT NULL,
  `connect` smallint(6) NOT NULL,
  `role` varchar(30) NOT NULL,
  `uptime` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `max_connections` smallint(6) NOT NULL,
  `max_connect_errors` bigint(20) NOT NULL,
  `open_files_limit` int(11) NOT NULL,
  `open_files` smallint(6) NOT NULL,
  `table_open_cache` smallint(6) NOT NULL,
  `open_tables` smallint(6) NOT NULL,
  `max_tmp_tables` smallint(6) NOT NULL,
  `max_heap_table_size` int(11) NOT NULL,
  `max_allowed_packet` int(11) NOT NULL,
  `threads_connected` int(11) NOT NULL,
  `threads_running` int(11) NOT NULL,
  `threads_created` int(11) NOT NULL,
  `threads_cached` int(11) NOT NULL,
  `connections` int(11) NOT NULL,
  `aborted_clients` int(11) NOT NULL,
  `aborted_connects` int(11) NOT NULL,
  `connections_persecond` smallint(6) NOT NULL,
  `bytes_received_persecond` int(11) NOT NULL,
  `bytes_sent_persecond` int(11) NOT NULL,
  `com_select_persecond` smallint(6) NOT NULL,
  `com_insert_persecond` smallint(6) NOT NULL,
  `com_update_persecond` smallint(6) NOT NULL,
  `com_delete_persecond` smallint(6) NOT NULL,
  `com_commit_persecond` smallint(6) NOT NULL,
  `com_rollback_persecond` smallint(6) NOT NULL,
  `questions_persecond` int(11) NOT NULL,
  `queries_persecond` int(11) NOT NULL,
  `transaction_persecond` smallint(6) NOT NULL,
  `created_tmp_tables_persecond` smallint(6) NOT NULL,
  `created_tmp_disk_tables_persecond` smallint(6) NOT NULL,
  `created_tmp_files_persecond` smallint(6) NOT NULL,
  `table_locks_immediate_persecond` int(11) NOT NULL,
  `table_locks_waited_persecond` smallint(6) NOT NULL,
  `key_buffer_size` bigint(20) NOT NULL,
  `sort_buffer_size` int(11) NOT NULL,
  `join_buffer_size` int(11) NOT NULL,
  `key_blocks_not_flushed` int(11) NOT NULL,
  `key_blocks_unused` int(11) NOT NULL,
  `key_blocks_used` int(11) NOT NULL,
  `key_read_requests_persecond` int(11) NOT NULL,
  `key_reads_persecond` int(11) NOT NULL,
  `key_write_requests_persecond` int(11) NOT NULL,
  `key_writes_persecond` int(11) NOT NULL,
  `innodb_version` varchar(30) NOT NULL,
  `innodb_buffer_pool_instances` smallint(6) NOT NULL,
  `innodb_buffer_pool_size` bigint(20) NOT NULL,
  `innodb_doublewrite` varchar(10) NOT NULL,
  `innodb_file_per_table` varchar(10) NOT NULL,
  `innodb_flush_log_at_trx_commit` int(11) NOT NULL,
  `innodb_flush_method` varchar(30) NOT NULL,
  `innodb_force_recovery` int(11) NOT NULL,
  `innodb_io_capacity` int(11) NOT NULL,
  `innodb_read_io_threads` int(11) NOT NULL,
  `innodb_write_io_threads` int(11) NOT NULL,
  `innodb_buffer_pool_pages_total` int(11) NOT NULL,
  `innodb_buffer_pool_pages_data` int(11) NOT NULL,
  `innodb_buffer_pool_pages_dirty` int(11) NOT NULL,
  `innodb_buffer_pool_pages_flushed` bigint(20) NOT NULL,
  `innodb_buffer_pool_pages_free` int(11) NOT NULL,
  `innodb_buffer_pool_pages_misc` int(11) NOT NULL,
  `innodb_page_size` int(11) NOT NULL,
  `innodb_pages_created` bigint(20) NOT NULL,
  `innodb_pages_read` bigint(20) NOT NULL,
  `innodb_pages_written` bigint(20) NOT NULL,
  `innodb_row_lock_current_waits` varchar(100) NOT NULL,
  `innodb_buffer_pool_pages_flushed_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_read_requests_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_reads_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_write_requests_persecond` int(11) NOT NULL,
  `innodb_rows_read_persecond` int(11) NOT NULL,
  `innodb_rows_inserted_persecond` int(11) NOT NULL,
  `innodb_rows_updated_persecond` int(11) NOT NULL,
  `innodb_rows_deleted_persecond` int(11) NOT NULL,
  `query_cache_hitrate` varchar(10) NOT NULL,
  `thread_cache_hitrate` varchar(10) NOT NULL,
  `key_buffer_read_rate` varchar(10) NOT NULL,
  `key_buffer_write_rate` varchar(10) NOT NULL,
  `key_blocks_used_rate` varchar(10) NOT NULL,
  `created_tmp_disk_tables_rate` varchar(10) NOT NULL,
  `connections_usage_rate` varchar(10) NOT NULL,
  `open_files_usage_rate` varchar(10) NOT NULL,
  `open_tables_usage_rate` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mysql_status_db_ip_db_port_543654be_uniq` (`db_ip`,`db_port`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mysql_status_his`
--

DROP TABLE IF EXISTS `mysql_status_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_status_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_ip` varchar(30) NOT NULL,
  `db_port` varchar(10) NOT NULL,
  `connect` smallint(6) NOT NULL,
  `role` varchar(30) NOT NULL,
  `uptime` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `max_connections` smallint(6) NOT NULL,
  `max_connect_errors` bigint(20) NOT NULL,
  `open_files_limit` int(11) NOT NULL,
  `open_files` smallint(6) NOT NULL,
  `table_open_cache` smallint(6) NOT NULL,
  `open_tables` smallint(6) NOT NULL,
  `max_tmp_tables` smallint(6) NOT NULL,
  `max_heap_table_size` int(11) NOT NULL,
  `max_allowed_packet` int(11) NOT NULL,
  `threads_connected` int(11) NOT NULL,
  `threads_running` int(11) NOT NULL,
  `threads_created` int(11) NOT NULL,
  `threads_cached` int(11) NOT NULL,
  `connections` int(11) NOT NULL,
  `aborted_clients` int(11) NOT NULL,
  `aborted_connects` int(11) NOT NULL,
  `connections_persecond` smallint(6) NOT NULL,
  `bytes_received_persecond` int(11) NOT NULL,
  `bytes_sent_persecond` int(11) NOT NULL,
  `com_select_persecond` smallint(6) NOT NULL,
  `com_insert_persecond` smallint(6) NOT NULL,
  `com_update_persecond` smallint(6) NOT NULL,
  `com_delete_persecond` smallint(6) NOT NULL,
  `com_commit_persecond` smallint(6) NOT NULL,
  `com_rollback_persecond` smallint(6) NOT NULL,
  `questions_persecond` int(11) NOT NULL,
  `queries_persecond` int(11) NOT NULL,
  `transaction_persecond` smallint(6) NOT NULL,
  `created_tmp_tables_persecond` smallint(6) NOT NULL,
  `created_tmp_disk_tables_persecond` smallint(6) NOT NULL,
  `created_tmp_files_persecond` smallint(6) NOT NULL,
  `table_locks_immediate_persecond` int(11) NOT NULL,
  `table_locks_waited_persecond` smallint(6) NOT NULL,
  `key_buffer_size` bigint(20) NOT NULL,
  `sort_buffer_size` int(11) NOT NULL,
  `join_buffer_size` int(11) NOT NULL,
  `key_blocks_not_flushed` int(11) NOT NULL,
  `key_blocks_unused` int(11) NOT NULL,
  `key_blocks_used` int(11) NOT NULL,
  `key_read_requests_persecond` int(11) NOT NULL,
  `key_reads_persecond` int(11) NOT NULL,
  `key_write_requests_persecond` int(11) NOT NULL,
  `key_writes_persecond` int(11) NOT NULL,
  `innodb_version` varchar(30) NOT NULL,
  `innodb_buffer_pool_instances` smallint(6) NOT NULL,
  `innodb_buffer_pool_size` bigint(20) NOT NULL,
  `innodb_doublewrite` varchar(10) NOT NULL,
  `innodb_file_per_table` varchar(10) NOT NULL,
  `innodb_flush_log_at_trx_commit` int(11) NOT NULL,
  `innodb_flush_method` varchar(30) NOT NULL,
  `innodb_force_recovery` int(11) NOT NULL,
  `innodb_io_capacity` int(11) NOT NULL,
  `innodb_read_io_threads` int(11) NOT NULL,
  `innodb_write_io_threads` int(11) NOT NULL,
  `innodb_buffer_pool_pages_total` int(11) NOT NULL,
  `innodb_buffer_pool_pages_data` int(11) NOT NULL,
  `innodb_buffer_pool_pages_dirty` int(11) NOT NULL,
  `innodb_buffer_pool_pages_flushed` bigint(20) NOT NULL,
  `innodb_buffer_pool_pages_free` int(11) NOT NULL,
  `innodb_buffer_pool_pages_misc` int(11) NOT NULL,
  `innodb_page_size` int(11) NOT NULL,
  `innodb_pages_created` bigint(20) NOT NULL,
  `innodb_pages_read` bigint(20) NOT NULL,
  `innodb_pages_written` bigint(20) NOT NULL,
  `innodb_row_lock_current_waits` varchar(100) NOT NULL,
  `innodb_buffer_pool_pages_flushed_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_read_requests_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_reads_persecond` int(11) NOT NULL,
  `innodb_buffer_pool_write_requests_persecond` int(11) NOT NULL,
  `innodb_rows_read_persecond` int(11) NOT NULL,
  `innodb_rows_inserted_persecond` int(11) NOT NULL,
  `innodb_rows_updated_persecond` int(11) NOT NULL,
  `innodb_rows_deleted_persecond` int(11) NOT NULL,
  `query_cache_hitrate` varchar(10) NOT NULL,
  `thread_cache_hitrate` varchar(10) NOT NULL,
  `key_buffer_read_rate` varchar(10) NOT NULL,
  `key_buffer_write_rate` varchar(10) NOT NULL,
  `key_blocks_used_rate` varchar(10) NOT NULL,
  `created_tmp_disk_tables_rate` varchar(10) NOT NULL,
  `connections_usage_rate` varchar(10) NOT NULL,
  `open_files_usage_rate` varchar(10) NOT NULL,
  `open_tables_usage_rate` varchar(10) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mysql_status_his_db_ip_db_port_create_time_1a04d15b_idx` (`db_ip`,`db_port`,`create_time`),
  KEY `mysql_status_his_create_time_db655313` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navi_navi`
--

DROP TABLE IF EXISTS `navi_navi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navi_navi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `passforget_passwd_forget`
--

DROP TABLE IF EXISTS `passforget_passwd_forget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passforget_passwd_forget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `vc_value` varchar(40) NOT NULL,
  `is_valid` smallint(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `passforget_passwd_forget_username_is_valid_f0839cca_idx` (`username`,`is_valid`),
  KEY `passforget_passwd_forget_vc_value_80b7bc2b` (`vc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_blacklist`
--

DROP TABLE IF EXISTS `tb_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dbtag` varchar(255) NOT NULL,
  `tbname` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dbtag` (`dbtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_blacklist_user_permit`
--

DROP TABLE IF EXISTS `tb_blacklist_user_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_blacklist_user_permit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tb_blacklist_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tb_blacklist_user_permit_tb_blacklist_id_userinfo_8367a5d2_uniq` (`tb_blacklist_id`,`userinfo_id`),
  KEY `tb_blacklist_user_pe_userinfo_id_20b77bef_fk_accounts_` (`userinfo_id`),
  CONSTRAINT `tb_blacklist_user_pe_tb_blacklist_id_3f1be554_fk_tb_blackl` FOREIGN KEY (`tb_blacklist_id`) REFERENCES `tb_blacklist` (`id`),
  CONSTRAINT `tb_blacklist_user_pe_userinfo_id_20b77bef_fk_accounts_` FOREIGN KEY (`userinfo_id`) REFERENCES `accounts_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-16 12:24:54
