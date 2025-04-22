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
-- Table structure for table `task_category`
--

DROP TABLE IF EXISTS `task_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_category` (
  `id` bigint NOT NULL COMMENT '任务分类ID',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `category_img` varchar(255) DEFAULT NULL COMMENT '分类图片展示地址',
  `is_popular` tinyint DEFAULT '0' COMMENT '是否热门 0 否 1 热门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_category`
--

LOCK TABLES `task_category` WRITE;
/*!40000 ALTER TABLE `task_category` DISABLE KEYS */;
INSERT INTO `task_category` VALUES (157123941263519,'网站/软件开发','http://recruit1.oss-cn-shenzhen.aliyuncs.com/f5c7a84b-89fb-4b04-8e15-4afe18068de6.jpg',1),(157123944799651,'数据科学/分析学','http://recruit1.oss-cn-shenzhen.aliyuncs.com/853bca3f-eb79-478f-85f0-aa03e9def32e.jpg',1),(157123947616803,'会计/咨询','http://recruit1.oss-cn-shenzhen.aliyuncs.com/ab9a164d-ea0c-4409-a214-901bea818b89.jpg',1),(157123949774553,'写作/翻译','http://recruit1.oss-cn-shenzhen.aliyuncs.com/c588a079-e60b-46bd-b274-c3a477a06a90.jpg',1),(157123952210737,'销售/市场营销','http://recruit1.oss-cn-shenzhen.aliyuncs.com/062b6bac-1127-4209-8987-b532180129e9.jpg',1),(157123953698793,'图形/设计','http://recruit1.oss-cn-shenzhen.aliyuncs.com/07d93a43-d92f-44a8-8c86-cf471933eff5.jpg',1),(157123955607669,'数字营销','http://recruit1.oss-cn-shenzhen.aliyuncs.com/875d9129-a0f8-48a8-857a-b5fc2886e215.jpg',1),(157123956834969,'教育培训','http://recruit1.oss-cn-shenzhen.aliyuncs.com/45f15358-b3ba-4dc3-822e-ae6a233617a3.jpg',1);
/*!40000 ALTER TABLE `task_category` ENABLE KEYS */;
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
