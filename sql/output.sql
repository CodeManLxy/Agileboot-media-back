-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agileboot-pure
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(128) NOT NULL DEFAULT '' COMMENT '配置名称',
  `config_key` varchar(128) NOT NULL DEFAULT '' COMMENT '配置键名',
  `config_options` varchar(1024) NOT NULL DEFAULT '' COMMENT '可选的选项',
  `config_value` varchar(256) NOT NULL DEFAULT '' COMMENT '配置值',
  `is_allow_change` tinyint(1) NOT NULL COMMENT '是否允许修改',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_key_uniq_idx` (`config_key`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','[\"skin-blue\",\"skin-green\",\"skin-purple\",\"skin-red\",\"skin-yellow\"]','skin-blue',1,NULL,NULL,'2022-08-28 22:12:19','2022-05-21 08:30:55','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow',0),(2,'用户管理-账号初始密码','sys.user.initPassword','','123456',1,NULL,1,'2023-07-20 14:42:08','2022-05-21 08:30:55','初始化密码 123456',0),(3,'主框架页-侧边栏主题','sys.index.sideTheme','[\"theme-dark\",\"theme-light\"]','theme-dark',1,NULL,NULL,'2022-08-28 22:12:15','2022-08-20 08:30:55','深色主题theme-dark，浅色主题theme-light',0),(4,'账号自助-验证码开关','sys.account.captchaOnOff','[\"true\",\"false\"]','false',0,NULL,1,'2023-07-20 14:39:36','2022-05-21 08:30:55','是否开启验证码功能（true开启，false关闭）',0),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','[\"true\",\"false\"]','true',0,NULL,1,'2022-10-05 22:18:57','2022-05-21 08:30:55','是否开启注册用户功能（true开启，false关闭）',0);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父部门id',
  `ancestors` text NOT NULL COMMENT '祖级列表',
  `dept_name` varchar(64) NOT NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NOT NULL DEFAULT '0' COMMENT '显示顺序',
  `leader_id` bigint DEFAULT NULL,
  `leader_name` varchar(64) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(16) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '部门状态（0停用 1启用）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'0','AgileBoot科技',0,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(2,1,'0,1','深圳总公司',1,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(3,1,'0,1','长沙分公司',2,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(4,2,'0,1,2','研发部门',1,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(5,2,'0,1,2','市场部门',2,NULL,'valarchie','15888888888','valarchie@163.com',0,NULL,'2022-05-21 08:30:54',1,'2023-07-20 22:46:41',0),(6,2,'0,1,2','测试部门',3,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(7,2,'0,1,2','财务部门',4,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(8,2,'0,1,2','运维部门',5,NULL,'valarchie','15888888888','valarchie@163.com',1,NULL,'2022-05-21 08:30:54',NULL,NULL,0),(9,3,'0,1,3','市场部!',1,NULL,'valarchie!!','15888188888','valarc1hie@163.com',0,NULL,'2022-05-21 08:30:54',1,'2023-07-20 22:33:31',0),(10,3,'0,1,3','财务部门',2,NULL,'valarchie','15888888888','valarchie@163.com',0,NULL,'2022-05-21 08:30:54',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_info`
--

DROP TABLE IF EXISTS `sys_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_info` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `ip_address` varchar(128) NOT NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) NOT NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `operation_system` varchar(50) NOT NULL DEFAULT '' COMMENT '操作系统',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '登录状态（1成功 0失败）',
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_info`
--

LOCK TABLES `sys_login_info` WRITE;
/*!40000 ALTER TABLE `sys_login_info` DISABLE KEYS */;
INSERT INTO `sys_login_info` VALUES (415,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',1,'登录成功','2023-06-29 22:49:37',0),(416,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',1,'登录成功','2023-07-02 22:12:30',0),(417,'admin','127.0.0.1','内网IP','Chrome 11','Mac OS X',0,'验证码过期','2023-07-02 22:16:06',0),(418,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',0,'用户不存在/密码错误','2024-03-11 14:02:00',0),(419,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-11 14:02:08',0),(420,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-12 14:39:57',0),(421,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-12 16:57:59',0),(422,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-12 17:04:30',0),(423,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-13 09:56:55',0),(424,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-13 11:01:39',0),(425,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-13 14:24:44',0),(426,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-14 09:52:09',0),(427,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-14 10:58:16',0),(428,'admin','0:0:0:0:0:0:0:1','内网IP','Chrome 12','Windows 10',1,'登录成功','2024-03-14 11:30:05',0);
/*!40000 ALTER TABLE `sys_login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(64) NOT NULL COMMENT '菜单名称',
  `menu_type` smallint NOT NULL DEFAULT '0' COMMENT '菜单的类型(1为普通菜单2为目录3为内嵌iFrame4为外链跳转)',
  `router_name` varchar(255) NOT NULL DEFAULT '' COMMENT '路由名称（需保持和前端对应的vue文件中的name保持一致defineOptions方法中设置的name）',
  `parent_id` bigint NOT NULL DEFAULT '0' COMMENT '父菜单ID',
  `path` varchar(255) DEFAULT NULL COMMENT '组件路径（对应前端项目view文件夹中的路径）',
  `is_button` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否按钮',
  `permission` varchar(128) DEFAULT NULL COMMENT '权限标识',
  `meta_info` varchar(1024) NOT NULL DEFAULT '{}' COMMENT '路由元信息（前端根据这个信息进行逻辑处理）',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '菜单状态（1启用 0停用）',
  `remark` varchar(256) DEFAULT '' COMMENT '备注',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',2,'',0,'/system',0,'','{\"title\":\"系统管理\",\"icon\":\"ep:management\",\"showParent\":true,\"rank\":1}',1,'系统管理目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:08:50',0),(2,'系统监控',2,'',0,'/monitor',0,'','{\"title\":\"系统监控\",\"icon\":\"ep:monitor\",\"showParent\":true,\"rank\":3}',1,'系统监控目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:09:15',0),(3,'系统工具',2,'',0,'/tool',0,'','{\"title\":\"系统工具\",\"icon\":\"ep:tools\",\"showParent\":true,\"rank\":2}',1,'系统工具目录',0,'2022-05-21 08:30:54',1,'2023-08-14 23:09:03',0),(4,'AgileBoot官网',3,'AgileBootguanwangIframeRouter',0,'/AgileBootguanwangIframeLink',0,'','{\"title\":\"AgileBoot官网\",\"icon\":\"ep:link\",\"showParent\":true,\"frameSrc\":\"https://element-plus.org/zh-CN/\",\"rank\":8}',1,'Agileboot官网地址',0,'2022-05-21 08:30:54',1,'2023-08-14 23:09:40',0),(5,'用户管理',1,'SystemUser',1,'/system/user/index',0,'system:user:list','{\"title\":\"用户管理\",\"icon\":\"ep:user-filled\",\"showParent\":true}',1,'用户管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:16:13',0),(6,'角色管理',1,'SystemRole',1,'/system/role/index',0,'system:role:list','{\"title\":\"角色管理\",\"icon\":\"ep:user\",\"showParent\":true}',1,'角色管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:16:23',0),(7,'菜单管理',1,'MenuManagement',1,'/system/menu/index',0,'system:menu:list','{\"title\":\"菜单管理\",\"icon\":\"ep:menu\",\"showParent\":true}',1,'菜单管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:41',0),(8,'部门管理',1,'Department',1,'/system/dept/index',0,'system:dept:list','{\"title\":\"部门管理\",\"icon\":\"fa-solid:code-branch\",\"showParent\":true}',1,'部门管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:35',0),(9,'岗位管理',1,'Post',1,'/system/post/index',0,'system:post:list','{\"title\":\"岗位管理\",\"icon\":\"ep:postcard\",\"showParent\":true}',1,'岗位管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:11',0),(10,'参数设置',1,'Config',1,'/system/config/index',0,'system:config:list','{\"title\":\"参数设置\",\"icon\":\"ep:setting\",\"showParent\":true}',1,'参数设置菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:15:03',0),(11,'通知公告',1,'SystemNotice',1,'/system/notice/index',0,'system:notice:list','{\"title\":\"通知公告\",\"icon\":\"ep:notification\",\"showParent\":true}',1,'通知公告菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:56',0),(12,'日志管理',1,'LogManagement',1,'/system/logd',0,'','{\"title\":\"日志管理\",\"icon\":\"ep:document\",\"showParent\":true}',1,'日志管理菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:47',0),(13,'在线用户',1,'OnlineUser',2,'/system/monitor/onlineUser/index',0,'monitor:online:list','{\"title\":\"在线用户\",\"icon\":\"fa-solid:users\",\"showParent\":true}',1,'在线用户菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:13',0),(14,'数据监控',1,'DataMonitor',2,'/system/monitor/druid/index',0,'monitor:druid:list','{\"title\":\"数据监控\",\"icon\":\"fa:database\",\"showParent\":true,\"frameSrc\":\"/druid/login.html\",\"isFrameSrcInternal\":true}',1,'数据监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:25',0),(15,'服务监控',1,'ServerInfo',2,'/system/monitor/server/index',0,'monitor:server:list','{\"title\":\"服务监控\",\"icon\":\"fa:server\",\"showParent\":true}',1,'服务监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:13:34',0),(16,'缓存监控',1,'CacheInfo',2,'/system/monitor/cache/index',0,'monitor:cache:list','{\"title\":\"缓存监控\",\"icon\":\"ep:reading\",\"showParent\":true}',1,'缓存监控菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:12:59',0),(17,'系统接口',1,'SystemAPI',3,'/tool/swagger/index',0,'tool:swagger:list','{\"title\":\"系统接口\",\"icon\":\"ep:document-remove\",\"showParent\":true,\"frameSrc\":\"/swagger-ui/index.html\",\"isFrameSrcInternal\":true}',1,'系统接口菜单',0,'2022-05-21 08:30:54',1,'2023-08-14 23:14:01',0),(18,'操作日志',1,'OperationLog',12,'/system/log/operationLog/index',0,'monitor:operlog:list','{\"title\":\"操作日志\"}',1,'操作日志菜单',0,'2022-05-21 08:30:54',NULL,NULL,0),(19,'登录日志',1,'LoginLog',12,'/system/log/loginLog/index',0,'monitor:logininfor:list','{\"title\":\"登录日志\"}',1,'登录日志菜单',0,'2022-05-21 08:30:54',NULL,NULL,0),(20,'用户查询',0,' ',5,'',1,'system:user:query','{\"title\":\"用户查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(21,'用户新增',0,' ',5,'',1,'system:user:add','{\"title\":\"用户新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(22,'用户修改',0,' ',5,'',1,'system:user:edit','{\"title\":\"用户修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(23,'用户删除',0,' ',5,'',1,'system:user:remove','{\"title\":\"用户删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(24,'用户导出',0,' ',5,'',1,'system:user:export','{\"title\":\"用户导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(25,'用户导入',0,' ',5,'',1,'system:user:import','{\"title\":\"用户导入\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(26,'重置密码',0,' ',5,'',1,'system:user:resetPwd','{\"title\":\"重置密码\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(27,'角色查询',0,' ',6,'',1,'system:role:query','{\"title\":\"角色查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(28,'角色新增',0,' ',6,'',1,'system:role:add','{\"title\":\"角色新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(29,'角色修改',0,' ',6,'',1,'system:role:edit','{\"title\":\"角色修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(30,'角色删除',0,' ',6,'',1,'system:role:remove','{\"title\":\"角色删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(31,'角色导出',0,' ',6,'',1,'system:role:export','{\"title\":\"角色导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(32,'菜单查询',0,' ',7,'',1,'system:menu:query','{\"title\":\"菜单查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(33,'菜单新增',0,' ',7,'',1,'system:menu:add','{\"title\":\"菜单新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(34,'菜单修改',0,' ',7,'',1,'system:menu:edit','{\"title\":\"菜单修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(35,'菜单删除',0,' ',7,'',1,'system:menu:remove','{\"title\":\"菜单删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(36,'部门查询',0,' ',8,'',1,'system:dept:query','{\"title\":\"部门查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(37,'部门新增',0,' ',8,'',1,'system:dept:add','{\"title\":\"部门新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(38,'部门修改',0,' ',8,'',1,'system:dept:edit','{\"title\":\"部门修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(39,'部门删除',0,' ',8,'',1,'system:dept:remove','{\"title\":\"部门删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(40,'岗位查询',0,' ',9,'',1,'system:post:query','{\"title\":\"岗位查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(41,'岗位新增',0,' ',9,'',1,'system:post:add','{\"title\":\"岗位新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(42,'岗位修改',0,' ',9,'',1,'system:post:edit','{\"title\":\"岗位修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(43,'岗位删除',0,' ',9,'',1,'system:post:remove','{\"title\":\"岗位删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(44,'岗位导出',0,' ',9,'',1,'system:post:export','{\"title\":\"岗位导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(45,'参数查询',0,' ',10,'',1,'system:config:query','{\"title\":\"参数查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(46,'参数新增',0,' ',10,'',1,'system:config:add','{\"title\":\"参数新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(47,'参数修改',0,' ',10,'',1,'system:config:edit','{\"title\":\"参数修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(48,'参数删除',0,' ',10,'',1,'system:config:remove','{\"title\":\"参数删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(49,'参数导出',0,' ',10,'',1,'system:config:export','{\"title\":\"参数导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(50,'公告查询',0,' ',11,'',1,'system:notice:query','{\"title\":\"公告查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(51,'公告新增',0,' ',11,'',1,'system:notice:add','{\"title\":\"公告新增\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(52,'公告修改',0,' ',11,'',1,'system:notice:edit','{\"title\":\"公告修改\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(53,'公告删除',0,' ',11,'',1,'system:notice:remove','{\"title\":\"公告删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(54,'操作查询',0,' ',18,'',1,'monitor:operlog:query','{\"title\":\"操作查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(55,'操作删除',0,' ',18,'',1,'monitor:operlog:remove','{\"title\":\"操作删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(56,'日志导出',0,' ',18,'',1,'monitor:operlog:export','{\"title\":\"日志导出\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(57,'登录查询',0,' ',19,'',1,'monitor:logininfor:query','{\"title\":\"登录查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(58,'登录删除',0,' ',19,'',1,'monitor:logininfor:remove','{\"title\":\"登录删除\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(59,'日志导出',0,' ',19,'',1,'monitor:logininfor:export','{\"title\":\"日志导出\",\"rank\":22}',1,'',0,'2022-05-21 08:30:54',1,'2023-07-22 17:02:28',0),(60,'在线查询',0,' ',13,'',1,'monitor:online:query','{\"title\":\"在线查询\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(61,'批量强退',0,' ',13,'',1,'monitor:online:batchLogout','{\"title\":\"批量强退\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(62,'单条强退',0,' ',13,'',1,'monitor:online:forceLogout','{\"title\":\"单条强退\"}',1,'',0,'2022-05-21 08:30:54',NULL,NULL,0),(63,'AgileBoot Github地址',4,'https://github.com/valarchie/AgileBoot-Back-End',0,'/external',0,'','{\"title\":\"AgileBoot Github地址\",\"icon\":\"fa-solid:external-link-alt\",\"showParent\":true,\"rank\":9}',1,'Agileboot github地址',0,'2022-05-21 08:30:54',1,'2023-08-14 23:12:13',0),(64,'首页',2,'',0,'/global',0,'121212','{\"title\":\"首页\",\"showParent\":true,\"rank\":3}',1,'',1,'2023-07-24 22:36:03',1,'2023-07-24 22:38:37',1),(65,'个人中心',1,'PersonalCenter',2053,'/system/user/profile',0,'434sdf','{\"title\":\"个人中心\",\"showParent\":true,\"rank\":3}',1,'',1,'2023-07-24 22:36:55',NULL,NULL,1),(66,'SystemCos',0,'',1,'',0,'','{\"title\":\"SystemCos\",\"icon\":\"ep:checked\",\"showLink\":true,\"showParent\":true,\"rank\":0}',1,'',1,'2024-03-12 17:00:22',1,'2024-03-12 17:01:28',1),(67,'Cos',1,'SystemCos',0,'/system/cos/index',0,'','{\"title\":\"Cos\",\"showLink\":true,\"showParent\":true,\"rank\":2}',1,'',1,'2024-03-12 17:05:56',1,'2024-03-12 17:06:18',0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(64) NOT NULL COMMENT '公告标题',
  `notice_type` smallint NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` text COMMENT '公告内容',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '公告状态（1正常 0关闭）',
  `creator_id` bigint NOT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 AgileBoot新版本发布啦',2,'新版本内容~~~~~~~~~~',1,1,'2022-05-21 08:30:55',1,'2022-08-29 20:12:37','管理员',0),(2,'维护通知：2018-07-01 AgileBoot系统凌晨维护',1,'维护内容',1,1,'2022-05-21 08:30:55',NULL,NULL,'管理员',0);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_operation_log`
--

DROP TABLE IF EXISTS `sys_operation_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_operation_log` (
  `operation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `business_type` smallint NOT NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `request_method` smallint NOT NULL DEFAULT '0' COMMENT '请求方式',
  `request_module` varchar(64) NOT NULL DEFAULT '' COMMENT '请求模块',
  `request_url` varchar(256) NOT NULL DEFAULT '' COMMENT '请求URL',
  `called_method` varchar(128) NOT NULL DEFAULT '' COMMENT '调用方法',
  `operator_type` smallint NOT NULL DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `user_id` bigint DEFAULT '0' COMMENT '用户ID',
  `username` varchar(32) DEFAULT '' COMMENT '操作人员',
  `operator_ip` varchar(128) DEFAULT '' COMMENT '操作人员ip',
  `operator_location` varchar(256) DEFAULT '' COMMENT '操作地点',
  `dept_id` bigint DEFAULT '0' COMMENT '部门ID',
  `dept_name` varchar(64) DEFAULT NULL COMMENT '部门名称',
  `operation_param` varchar(2048) DEFAULT '' COMMENT '请求参数',
  `operation_result` varchar(2048) DEFAULT '' COMMENT '返回参数',
  `status` smallint NOT NULL DEFAULT '1' COMMENT '操作状态（1正常 0异常）',
  `error_stack` varchar(2048) DEFAULT '' COMMENT '错误消息',
  `operation_time` datetime NOT NULL COMMENT '操作时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`operation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_operation_log`
--

LOCK TABLES `sys_operation_log` WRITE;
/*!40000 ALTER TABLE `sys_operation_log` DISABLE KEYS */;
INSERT INTO `sys_operation_log` VALUES (561,1,2,'菜单管理','/system/menus','com.agileboot.admin.controller.system.SysMenuController.add()',1,0,'admin','127.0.0.1','内网IP',0,NULL,'{\"menuName\":\"\",\"permission\":\"\",\"parentId\":2035,\"path\":\"\",\"isButton\":false,\"routerName\":\"\",\"meta\":{\"showParent\":true,\"rank\":0},\"status\":1},','',1,'','2023-07-22 17:06:57',0),(562,1,2,'菜单管理','/system/menus','com.agileboot.admin.controller.system.SysMenuController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"menuName\":\"SystemCos\",\"permission\":\"\",\"parentId\":1,\"path\":\"\",\"isButton\":false,\"routerName\":\"\",\"meta\":{\"showParent\":true,\"title\":\"SystemCos\",\"rank\":0,\"showLink\":true},\"status\":1},','',1,'','2024-03-12 17:00:22',0),(563,2,3,'菜单管理','/system/menus/66','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=66}','',1,'','2024-03-12 17:01:28',0),(564,2,3,'角色管理','/system/role','com.agileboot.admin.controller.system.SysRoleController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{}','',1,'','2024-03-12 17:04:16',0),(565,3,4,'菜单管理','/system/menus/66','com.agileboot.admin.controller.system.SysMenuController.remove()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=66}','',1,'','2024-03-12 17:04:47',0),(566,1,2,'菜单管理','/system/menus','com.agileboot.admin.controller.system.SysMenuController.add()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{\"menuName\":\"Cos\",\"permission\":\"\",\"parentId\":0,\"path\":\"/system/cos/index\",\"isButton\":false,\"routerName\":\"SystemCos\",\"meta\":{\"showParent\":true,\"title\":\"Cos\",\"rank\":0,\"showLink\":true},\"menuType\":1,\"status\":1},','',1,'','2024-03-12 17:05:56',0),(567,2,3,'菜单管理','/system/menus/67','com.agileboot.admin.controller.system.SysMenuController.edit()',1,0,'admin','0:0:0:0:0:0:0:1','内网IP',0,NULL,'{menuId=67}','',1,'','2024-03-12 17:06:18',0);
/*!40000 ALTER TABLE `sys_operation_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(64) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` smallint NOT NULL COMMENT '状态（1正常 0停用）',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `creator_id` bigint DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '逻辑删除',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(2,'se','项目经理',2,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(3,'hr','人力资源',3,1,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0),(4,'user','普通员工',5,0,'',NULL,'2022-05-21 08:30:54',NULL,NULL,0);
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(32) NOT NULL COMMENT '角色名称',
  `role_key` varchar(128) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` smallint DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3: 本部门数据权限 4: 本部门及以下数据权限 5: 本人权限）',
  `dept_id_set` varchar(1024) DEFAULT '' COMMENT '角色所拥有的部门数据权限',
  `status` smallint NOT NULL COMMENT '角色状态（1正常 0停用）',
  `creator_id` bigint DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,1,'',1,NULL,'2022-05-21 08:30:54',1,'2024-03-12 17:04:16','超级管理员',0),(2,'普通角色','common',3,2,'',1,NULL,'2022-05-21 08:30:54',NULL,NULL,'普通角色',0),(3,'闲置角色','unused',4,2,'',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'未使用的角色',0);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,1),(1,2),(1,3),(1,4),(1,17),(1,63),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(2,27),(2,28),(2,29),(2,30),(2,31),(2,32),(2,33),(2,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60),(2,61),(3,1),(111,1);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `post_id` bigint DEFAULT NULL COMMENT '职位id',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `username` varchar(64) NOT NULL COMMENT '用户账号',
  `nickname` varchar(32) NOT NULL COMMENT '用户昵称',
  `user_type` smallint DEFAULT '0' COMMENT '用户类型（00系统用户）',
  `email` varchar(128) DEFAULT '' COMMENT '用户邮箱',
  `phone_number` varchar(18) DEFAULT '' COMMENT '手机号码',
  `sex` smallint DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(512) DEFAULT '' COMMENT '头像地址',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '密码',
  `status` smallint NOT NULL DEFAULT '0' COMMENT '帐号状态（1正常 2停用 3冻结）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '超级管理员标志（1是，0否）',
  `creator_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `updater_id` bigint DEFAULT NULL COMMENT '更新者ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,1,4,'admin','valarchie1',0,'agileboot@163.com','15888888883',0,'/profile/avatar/20230725164110_blob_6b7a989b1cdd4dd396665d2cfd2addc5.png','$2a$10$o55UFZAtyWnDpRV6dvQe8.c/MjlFacC49ASj2usNXm9BY74SYI/uG',1,'0:0:0:0:0:0:0:1','2024-03-14 11:30:05',1,NULL,'2022-05-21 08:30:54',1,'2024-03-14 11:30:05','管理员',0),(2,2,2,5,'ag1','valarchie2',0,'agileboot1@qq.com','15666666666',1,'/profile/avatar/20230725114818_avatar_b5bf400732bb43369b4df58802049b22.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',1,'127.0.0.1','2022-05-21 08:30:54',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'测试员1',0),(3,2,0,5,'ag2','valarchie3',0,'agileboot2@qq.com','15666666667',1,'/profile/avatar/20230725114818_avatar_b5bf400732bb43369b4df58802049b22.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',1,'127.0.0.1','2022-05-21 08:30:54',0,NULL,'2022-05-21 08:30:54',NULL,NULL,'测试员2',0);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cos_group`
--

DROP TABLE IF EXISTS `t_cos_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cos_group` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_name` varchar(500) NOT NULL DEFAULT '' COMMENT '组名称',
  `backgroud_img` varchar(500) NOT NULL DEFAULT '' COMMENT '背景图',
  `like_count` bigint NOT NULL DEFAULT '0' COMMENT '点赞数',
  `group_description` varchar(1000) NOT NULL DEFAULT '' COMMENT '组表述',
  `is_free` tinyint NOT NULL DEFAULT '1' COMMENT '免费资源 1-yes 0-no',
  `price` varchar(50) NOT NULL DEFAULT '' COMMENT '价格',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='分组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cos_group`
--

LOCK TABLES `t_cos_group` WRITE;
/*!40000 ALTER TABLE `t_cos_group` DISABLE KEYS */;
INSERT INTO `t_cos_group` VALUES (1,'asd','asd',1,'asd',1,'1','2024-03-13 08:08:51','2024-03-13 08:08:54'),(2,'','',0,'',1,'','2024-03-13 10:08:10','2024-03-13 10:08:09'),(3,'cehsi1','',0,'ceshi',1,'1','2024-03-14 01:55:48','2024-03-14 01:55:48');
/*!40000 ALTER TABLE `t_cos_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cos_media`
--

DROP TABLE IF EXISTS `t_cos_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cos_media` (
  `id` bigint DEFAULT NULL,
  `img_url` varchar(1000) DEFAULT NULL,
  `group_id` bigint DEFAULT NULL,
  KEY `t_cos_media_group_id_index` (`group_id`),
  KEY `t_cos_media_id_index` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cos_media`
--

LOCK TABLES `t_cos_media` WRITE;
/*!40000 ALTER TABLE `t_cos_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cos_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cos_tag`
--

DROP TABLE IF EXISTS `t_cos_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cos_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tag_name` varchar(500) NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='标签表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cos_tag`
--

LOCK TABLES `t_cos_tag` WRITE;
/*!40000 ALTER TABLE `t_cos_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cos_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_group_tag`
--

DROP TABLE IF EXISTS `t_group_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_group_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` bigint NOT NULL DEFAULT '0' COMMENT '组id',
  `tag_id` bigint NOT NULL DEFAULT '0' COMMENT '标签id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='组标签关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_group_tag`
--

LOCK TABLES `t_group_tag` WRITE;
/*!40000 ALTER TABLE `t_group_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_group_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-14 11:51:54
