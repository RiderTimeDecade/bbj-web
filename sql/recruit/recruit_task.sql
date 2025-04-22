-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recruit
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` bigint NOT NULL COMMENT '任务ID',
  `category_id` bigint DEFAULT NULL COMMENT '任务分类ID',
  `employer_id` bigint DEFAULT NULL COMMENT '任务发布雇主ID',
  `task_title` varchar(255) DEFAULT NULL COMMENT '任务标题',
  `task_profile` varchar(255) DEFAULT NULL COMMENT '任务简介',
  `task_desc` text COMMENT '任务描述',
  `fees_low` double DEFAULT NULL COMMENT '最低预算价格',
  `fees_high` double DEFAULT NULL COMMENT '最高预算价格',
  `fees_file` varchar(255) DEFAULT NULL COMMENT '任务附件地址',
  `filename` varchar(255) DEFAULT NULL COMMENT '附件文件名称',
  `employee_id` bigint DEFAULT NULL COMMENT '完成任务雇员ID',
  `task_price` double DEFAULT NULL COMMENT '任务成交价格',
  `task_status` tinyint DEFAULT NULL COMMENT '任务状态',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '成交时间',
  `bid_time` timestamp NULL DEFAULT NULL COMMENT '中标时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `task_result` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (157124009918832,157123941263519,157123889925612,'我需要一个微信小程序','一个商城系统','微信小程序',1000,2000,'http://recruit1.oss-cn-shenzhen.aliyuncs.com/d7077ec8-0ed5-4e7d-8e6f-d45138baf212.pdf','常用类.pdf',157124288026264,1500,3,'2019-10-16 16:37:10','2019-10-16 16:31:23','2019-10-16 15:34:59',NULL),(157124090699406,157123941263519,157123889925612,'我需要找个人玩游戏','LOL、王者荣耀一起来','快来玩耍呀！',10,100,'http://recruit1.oss-cn-shenzhen.aliyuncs.com/5084c0a5-71cb-495d-a929-fb6348c8211d.pdf','面向对象.pdf',157124288026264,10,3,'2019-10-16 16:39:57','2019-10-16 16:24:40','2019-10-16 15:48:27',NULL),(157124114265141,157123941263519,157123889925612,'急需一个Java WEB网站！！！！！！！AAAAAA','期末实训课程设计','来快活呀',100,1000,'http://recruit1.oss-cn-shenzhen.aliyuncs.com/31f0cc27-f9a6-4740-9f08-9e016c97d0df.pdf','封装继承.pdf',NULL,NULL,0,NULL,NULL,'2019-10-16 15:52:23',NULL),(174479687188266,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓1','找到关键词上传即可','1',0,1,'','',174479422504700,1,3,'2025-04-18 09:51:34','2025-04-16 09:53:59','2025-04-16 09:47:52','http://recruit1.oss-cn-shenzhen.aliyuncs.com/b98f2926-fdbf-4bb2-895d-a5ff838c747d.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/b8eace2a-d926-4b7c-bb07-467807d101e1.jpg'),(174496864998942,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓2','百度找图上传即可','1',0,1,'','',174479422504700,1,3,'2025-04-19 02:58:14','2025-04-18 09:51:41','2025-04-18 09:30:50','http://recruit1.oss-cn-shenzhen.aliyuncs.com/c53e7286-f05d-4556-a22c-7242434e488a.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/0d2a77bd-db68-4ef6-9191-fb30ce11d580.jpg'),(174496868253920,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓3','33333','1',0,1,'','',174479422504700,1,3,'2025-04-19 02:59:10','2025-04-18 09:51:45','2025-04-18 09:31:23','http://recruit1.oss-cn-shenzhen.aliyuncs.com/a14d49db-0929-450c-b350-62aa1947d046.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/e2ec6856-5afc-4e6d-84ae-e4e422a50dbb.png'),(174496869654259,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓4','444','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-18 09:51:48','2025-04-18 09:31:37','http://recruit1.oss-cn-shenzhen.aliyuncs.com/cc1b03a6-fe63-452b-9818-08387b81474f.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/5a14cfdc-6308-42c4-bb2e-780562f18fe9.jpg'),(174503260954277,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓6','2222','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:19:08','2025-04-19 03:16:50','http://recruit1.oss-cn-shenzhen.aliyuncs.com/d3ab2436-737e-408d-a594-14bef59b5977.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/2d292416-ef83-42f2-b754-8a654c7f243d.jpg'),(174503262236670,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓7','1','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:19:13','2025-04-19 03:17:02','http://recruit1.oss-cn-shenzhen.aliyuncs.com/a9a2f46d-a4d3-4f9b-a984-1f85d5d1e237.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/6205968d-2931-4fd2-a9d8-4fec2fa6b9af.jpg'),(174503263943061,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓8','1','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:19:16','2025-04-19 03:17:19','http://recruit1.oss-cn-shenzhen.aliyuncs.com/f2729ec3-223a-4db9-816f-98eea3bcd1e6.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/aaa34ede-5cea-450e-9ce1-888a986a9cbe.jpg'),(174503333206342,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓9','1','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:30:29','2025-04-19 03:28:52','http://recruit1.oss-cn-shenzhen.aliyuncs.com/6e987819-1261-42f9-bc4d-fd3b0a5c90fb.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/2d664778-dcf0-444b-8219-4dda50b0d08c.jpg'),(174503334486340,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓10','1','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:30:33','2025-04-19 03:29:05','http://recruit1.oss-cn-shenzhen.aliyuncs.com/6edf3013-583d-42ae-945d-f21e77834594.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/c726b26e-a0c6-4354-8ff8-fd7b636bc8d9.png'),(174503336864646,157123953698793,174479425109397,'思佰尔图片-关键词氧气仓11','1','1',0,1,'','',174479422504700,1,2,NULL,'2025-04-19 03:30:38','2025-04-19 03:29:29','http://recruit1.oss-cn-shenzhen.aliyuncs.com/6d689e21-fb96-4fe5-8674-a55f727a0d2b.png;http://recruit1.oss-cn-shenzhen.aliyuncs.com/0eab1fa8-f75b-40a9-81e4-eaf4e510fdb1.jpg');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 15:37:52
