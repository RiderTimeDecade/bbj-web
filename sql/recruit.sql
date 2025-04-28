/*
 Navicat Premium Dump SQL

 Source Server         : datas
 Source Server Type    : MySQL
 Source Server Version : 90200 (9.2.0)
 Source Host           : localhost:3306
 Source Schema         : recruit

 Target Server Type    : MySQL
 Target Server Version : 90200 (9.2.0)
 File Encoding         : 65001

 Date: 28/04/2025 11:31:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin
-- ----------------------------
BEGIN;
INSERT INTO `admin` (`id`, `username`, `password`) VALUES (1, 'Yuu', 'e10adc3949ba59abbe56e057f20f883e');
COMMIT;

-- ----------------------------
-- Table structure for bid
-- ----------------------------
DROP TABLE IF EXISTS `bid`;
CREATE TABLE `bid` (
  `id` bigint NOT NULL COMMENT '投标ID',
  `task_id` bigint DEFAULT NULL COMMENT '任务ID',
  `employee_id` bigint DEFAULT NULL COMMENT '职业者ID',
  `bid_price` double DEFAULT NULL COMMENT '投标价格',
  `delivery_desc` varchar(255) DEFAULT NULL COMMENT '交货时间描述，例如 1 天',
  `delivery_time` timestamp NULL DEFAULT NULL COMMENT '交货时间',
  `bid_status` tinyint DEFAULT NULL COMMENT '竞标状态',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `case_img` varchar(255) DEFAULT NULL COMMENT '投标案例图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of bid
-- ----------------------------
BEGIN;
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174565906354165, 174565898211686, 174531461969955, 0.1, '1小时', '2025-04-26 18:17:44', 0, '2025-04-26 17:17:44', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_4d67c2a5-9028-4560-b7d7-d91d3edce7d9.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_2ee0ddd2-42e5-41c5-85c0-24df0a878ae2.png');
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174565907947982, 174565898223368, 174531461969955, 0.1, '1小时', '2025-04-26 18:17:59', 1, '2025-04-26 17:17:59', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_725b55b6-7a93-461e-a1a3-ebada6e99517.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_fb13e4a0-65a8-4d16-89c2-ea715072fd47.png');
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174565910359836, 174565898211686, 174565100199055, 0.1, '1小时', '2025-04-26 18:18:24', 1, '2025-04-26 17:18:24', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_5acf075d-0951-49ff-a1e1-6d7cdb36f181.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_6808346f-0d89-4479-884e-5ae2d26fcd7b.png');
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174565918343195, 174565898227884, 174565100199055, 0.1, '1小时', '2025-04-26 18:19:43', 0, '2025-04-26 17:19:43', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_829826ec-ea55-406c-80ad-a3f8ce53d4e3.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_ff1bb077-e99c-4804-8639-a7f36579cf08.png');
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174565919559957, 174565898225486, 174565100199055, 0.1, '1小时', '2025-04-26 18:19:56', 1, '2025-04-26 17:19:56', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_10696854-30d1-471d-8737-b0e7388ba6fd.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_b0aa83e4-30a0-4ec3-a16a-e4f39424c11b.png');
INSERT INTO `bid` (`id`, `task_id`, `employee_id`, `bid_price`, `delivery_desc`, `delivery_time`, `bid_status`, `create_time`, `case_img`) VALUES (174566385252681, 174565898227884, 174531461969955, 0.1, '1小时', '2025-04-26 19:37:33', 0, '2025-04-26 18:37:33', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_40334572-56bd-4b57-94ed-25ac8afa6933.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_4eda14dd-54e9-4afc-8d8d-9c66154d210d.png');
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` bigint NOT NULL COMMENT '雇员ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `head_img` varchar(255) DEFAULT 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/4aa3d423-b8cf-4520-91ba-3f30b578973f.png' COMMENT '头像地址',
  `tagline` varchar(255) DEFAULT NULL COMMENT '标语',
  `profile` text COMMENT '个人简介',
  `browse_count` int DEFAULT '0' COMMENT '主页被浏览次数',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (157124225706439, 'Yuu', '123', '1225459207@qq.com', '13055206361', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/dc7fa65a-ae93-4938-8f91-01f6c6e7ee4c.jpg', 'Good Man!', '来跟妲己一起玩耍呀~', 0, '2019-10-17 00:10:57');
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (157124288026264, 'Yuu2', '123', NULL, NULL, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/10f65b3a-e73d-4d8b-b95b-3841534ea0dc.png', NULL, NULL, 27, '2019-10-17 00:21:20');
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (174479422504700, 'zhang', '123456', '166@44.com', '16644445555', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/8a5d0f33-85be-4c16-97c0-21dc1066e900.jpg', '1', 'aa', 1, '2025-04-16 17:03:45');
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (174531461969955, 'mzq', 'mzq', NULL, NULL, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/10f65b3a-e73d-4d8b-b95b-3841534ea0dc.png', NULL, NULL, 5, '2025-04-22 17:37:00');
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (174537444260509, 'zj', 'zj', NULL, NULL, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/10f65b3a-e73d-4d8b-b95b-3841534ea0dc.png', NULL, NULL, 8, '2025-04-23 10:14:03');
INSERT INTO `employee` (`id`, `username`, `password`, `email`, `phone`, `head_img`, `tagline`, `profile`, `browse_count`, `create_time`) VALUES (174565100199055, 'kk', 'kk', NULL, NULL, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/10f65b3a-e73d-4d8b-b95b-3841534ea0dc.png', NULL, NULL, 0, '2025-04-26 15:03:22');
COMMIT;

-- ----------------------------
-- Table structure for employee_bookmarked
-- ----------------------------
DROP TABLE IF EXISTS `employee_bookmarked`;
CREATE TABLE `employee_bookmarked` (
  `id` bigint NOT NULL COMMENT '雇员收藏任务ID',
  `employee_id` bigint DEFAULT NULL COMMENT '雇员ID',
  `task_id` bigint DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of employee_bookmarked
-- ----------------------------
BEGIN;
INSERT INTO `employee_bookmarked` (`id`, `employee_id`, `task_id`) VALUES (157124280249465, 157124225706439, 157124114265141);
INSERT INTO `employee_bookmarked` (`id`, `employee_id`, `task_id`) VALUES (157124281570732, 157124225706439, 157124090699406);
INSERT INTO `employee_bookmarked` (`id`, `employee_id`, `task_id`) VALUES (157124282308079, 157124225706439, 157124009918832);
INSERT INTO `employee_bookmarked` (`id`, `employee_id`, `task_id`) VALUES (157124468269738, 157124288026264, 157124114265141);
COMMIT;

-- ----------------------------
-- Table structure for employee_skill
-- ----------------------------
DROP TABLE IF EXISTS `employee_skill`;
CREATE TABLE `employee_skill` (
  `id` bigint NOT NULL COMMENT '雇员技能对应ID',
  `employee_id` bigint DEFAULT NULL COMMENT '雇员ID',
  `skill_name` varchar(255) DEFAULT NULL COMMENT '技能名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of employee_skill
-- ----------------------------
BEGIN;
INSERT INTO `employee_skill` (`id`, `employee_id`, `skill_name`) VALUES (157124228454456, 157124225706439, 'Java');
INSERT INTO `employee_skill` (`id`, `employee_id`, `skill_name`) VALUES (157124228840540, 157124225706439, 'MySQL');
INSERT INTO `employee_skill` (`id`, `employee_id`, `skill_name`) VALUES (157124229314145, 157124225706439, 'SSM');
INSERT INTO `employee_skill` (`id`, `employee_id`, `skill_name`) VALUES (157124229869194, 157124225706439, 'Spring Boot');
COMMIT;

-- ----------------------------
-- Table structure for employer
-- ----------------------------
DROP TABLE IF EXISTS `employer`;
CREATE TABLE `employer` (
  `id` bigint NOT NULL COMMENT '雇主ID',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `head_img` varchar(255) DEFAULT NULL COMMENT '头像',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of employer
-- ----------------------------
BEGIN;
INSERT INTO `employer` (`id`, `username`, `password`, `head_img`, `phone`, `email`, `create_time`) VALUES (157123889925612, 'Yuu', '123456', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/37872ab6-0460-4905-85b1-5350e09df6e4.jpg', '13055206361', '1225459207@qq.com', '2019-10-16 23:14:59');
INSERT INTO `employer` (`id`, `username`, `password`, `head_img`, `phone`, `email`, `create_time`) VALUES (174479425109397, 'boss', '123456', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/6c8ec651-9fad-4690-89c9-aa654421ee3d.png', '15533336666', '155@133.com', '2025-04-16 17:04:11');
COMMIT;

-- ----------------------------
-- Table structure for home_bower
-- ----------------------------
DROP TABLE IF EXISTS `home_bower`;
CREATE TABLE `home_bower` (
  `id` bigint NOT NULL COMMENT '主页浏览表',
  `employee_id` bigint DEFAULT NULL COMMENT '雇员ID',
  `employer_id` bigint DEFAULT NULL COMMENT '雇主ID',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '浏览时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of home_bower
-- ----------------------------
BEGIN;
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124308317312, 157124288026264, 157123889925612, '2019-10-17 00:24:43');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124362128255, 157124288026264, 157123889925612, '2019-10-17 00:33:41');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124394802989, 157124288026264, 157123889925612, '2019-10-17 00:39:08');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124395181598, 157124288026264, 157123889925612, '2019-10-17 00:39:12');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124399959641, 157124288026264, 157123889925612, '2019-10-17 00:40:00');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124400572249, 157124288026264, 157123889925612, '2019-10-17 00:40:06');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124436645011, 157124288026264, 157123889925612, '2019-10-17 00:46:06');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124444335881, 157124288026264, 157123889925612, '2019-10-17 00:47:23');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124444529063, 157124288026264, 157123889925612, '2019-10-17 00:47:25');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124444718472, 157124288026264, 157123889925612, '2019-10-17 00:47:27');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124444939622, 157124288026264, 157123889925612, '2019-10-17 00:47:29');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124445119862, 157124288026264, 157123889925612, '2019-10-17 00:47:31');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460085914, 157124288026264, 157123889925612, '2019-10-17 00:50:01');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460223002, 157124288026264, 157123889925612, '2019-10-17 00:50:02');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460257603, 157124288026264, 157123889925612, '2019-10-17 00:50:03');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460283010, 157124288026264, 157123889925612, '2019-10-17 00:50:03');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460285719, 157124288026264, 157123889925612, '2019-10-17 00:50:03');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460324956, 157124288026264, 157123889925612, '2019-10-17 00:50:03');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460338967, 157124288026264, 157123889925612, '2019-10-17 00:50:03');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460378313, 157124288026264, 157123889925612, '2019-10-17 00:50:04');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460389161, 157124288026264, 157123889925612, '2019-10-17 00:50:04');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460425585, 157124288026264, 157123889925612, '2019-10-17 00:50:04');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460445058, 157124288026264, 157123889925612, '2019-10-17 00:50:04');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460465351, 157124288026264, 157123889925612, '2019-10-17 00:50:05');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460475301, 157124288026264, 157123889925612, '2019-10-17 00:50:05');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460514124, 157124288026264, 157123889925612, '2019-10-17 00:50:05');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (157124460528858, 157124288026264, 157123889925612, '2019-10-17 00:50:05');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174496009060476, 174479422504700, 174479425109397, '2025-04-18 15:08:11');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174537872015216, 174537444260509, 157123889925612, '2025-04-23 11:25:20');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174538739221259, 174537444260509, 157123889925612, '2025-04-23 13:49:52');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539073941000, 174537444260509, 157123889925612, '2025-04-23 14:45:39');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539074679487, 174537444260509, 157123889925612, '2025-04-23 14:45:47');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539101053926, 174537444260509, 157123889925612, '2025-04-23 14:50:11');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539101574822, 174537444260509, 157123889925612, '2025-04-23 14:50:16');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539102182600, 174537444260509, 157123889925612, '2025-04-23 14:50:22');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174539873183146, 174537444260509, 157123889925612, '2025-04-23 16:58:52');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174555194120213, 174531461969955, 157123889925612, '2025-04-25 11:32:21');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174555202134081, 174531461969955, 157123889925612, '2025-04-25 11:33:41');
INSERT INTO `home_bower` (`id`, `employee_id`, `employer_id`, `create_time`) VALUES (174564958030683, 174531461969955, 157123889925612, '2025-04-26 14:39:40');
COMMIT;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
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

-- ----------------------------
-- Records of task
-- ----------------------------
BEGIN;
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174565898211686, 157123947616803, 157123889925612, '测试1', '测试任务', '测试任务', 0.1, 0.1, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/147ad4d4-fa16-4dee-bebe-429dc54275a6.png', '屏幕快照 2025-04-18 的 19.55.05 下午.png', 174565100199055, 0.1, 3, '2025-04-26 17:18:50', '2025-04-26 17:18:50', '2025-04-26 17:16:22', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_5acf075d-0951-49ff-a1e1-6d7cdb36f181.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_6808346f-0d89-4479-884e-5ae2d26fcd7b.png');
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174565898223368, 157123947616803, 157123889925612, '测试2', '测试任务', '测试任务', 0.1, 0.1, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/147ad4d4-fa16-4dee-bebe-429dc54275a6.png', '屏幕快照 2025-04-18 的 19.55.05 下午.png', 174531461969955, 0.1, 3, '2025-04-26 17:19:05', '2025-04-26 17:19:05', '2025-04-26 17:16:22', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_725b55b6-7a93-461e-a1a3-ebada6e99517.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_fb13e4a0-65a8-4d16-89c2-ea715072fd47.png');
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174565898225486, 157123947616803, 157123889925612, '测试3', '测试任务', '测试任务', 0.1, 0.1, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/147ad4d4-fa16-4dee-bebe-429dc54275a6.png', '屏幕快照 2025-04-18 的 19.55.05 下午.png', 174565100199055, 0.1, 3, '2025-04-26 17:20:12', '2025-04-26 17:20:12', '2025-04-26 17:16:22', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_1_10696854-30d1-471d-8737-b0e7388ba6fd.png,http://recruit1.oss-cn-shenzhen.aliyuncs.com/bid_2_b0aa83e4-30a0-4ec3-a16a-e4f39424c11b.png');
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174565898227884, 157123947616803, 157123889925612, '测试4', '测试任务', '测试任务', 0.1, 0.1, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/147ad4d4-fa16-4dee-bebe-429dc54275a6.png', '屏幕快照 2025-04-18 的 19.55.05 下午.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 17:16:22', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174565898229846, 157123947616803, 157123889925612, '测试5', '测试任务', '测试任务', 0.1, 0.1, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/147ad4d4-fa16-4dee-bebe-429dc54275a6.png', '屏幕快照 2025-04-18 的 19.55.05 下午.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 17:16:22', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174566409452088, 157123947616803, 157123889925612, '测试1', '测试任务', '测试任务 123123', 0.4, 0.4, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/f3d081ce-412c-4433-89ef-4ce18e6413f5.png', '测试任务要求图.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 18:41:35', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174566409461671, 157123947616803, 157123889925612, '测试2', '测试任务', '测试任务 123123', 0.4, 0.4, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/f3d081ce-412c-4433-89ef-4ce18e6413f5.png', '测试任务要求图.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 18:41:35', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174566409464221, 157123947616803, 157123889925612, '测试3', '测试任务', '测试任务 123123', 0.4, 0.4, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/f3d081ce-412c-4433-89ef-4ce18e6413f5.png', '测试任务要求图.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 18:41:35', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174566409466656, 157123947616803, 157123889925612, '测试4', '测试任务', '测试任务 123123', 0.4, 0.4, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/f3d081ce-412c-4433-89ef-4ce18e6413f5.png', '测试任务要求图.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 18:41:35', NULL);
INSERT INTO `task` (`id`, `category_id`, `employer_id`, `task_title`, `task_profile`, `task_desc`, `fees_low`, `fees_high`, `fees_file`, `filename`, `employee_id`, `task_price`, `task_status`, `close_time`, `bid_time`, `create_time`, `task_result`) VALUES (174566409468761, 157123947616803, 157123889925612, '测试5', '测试任务', '测试任务 123123', 0.4, 0.4, 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/f3d081ce-412c-4433-89ef-4ce18e6413f5.png', '测试任务要求图.png', NULL, NULL, 0, NULL, NULL, '2025-04-26 18:41:35', NULL);
COMMIT;

-- ----------------------------
-- Table structure for task_category
-- ----------------------------
DROP TABLE IF EXISTS `task_category`;
CREATE TABLE `task_category` (
  `id` bigint NOT NULL COMMENT '任务分类ID',
  `category_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `category_img` varchar(255) DEFAULT NULL COMMENT '分类图片展示地址',
  `is_popular` tinyint DEFAULT '0' COMMENT '是否热门 0 否 1 热门',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of task_category
-- ----------------------------
BEGIN;
INSERT INTO `task_category` (`id`, `category_name`, `category_img`, `is_popular`) VALUES (157123947616803, '找图任务', 'http://recruit1.oss-cn-shenzhen.aliyuncs.com/ab9a164d-ea0c-4409-a214-901bea818b89.jpg', 1);
COMMIT;

-- ----------------------------
-- Table structure for task_skill
-- ----------------------------
DROP TABLE IF EXISTS `task_skill`;
CREATE TABLE `task_skill` (
  `id` bigint NOT NULL COMMENT '任务技能ID',
  `skill_name` varchar(255) DEFAULT NULL COMMENT '技能名称',
  `task_id` bigint DEFAULT NULL COMMENT '任务ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of task_skill
-- ----------------------------
BEGIN;
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157123994236997, 'Java', 157123994233279);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157123994237672, 'SSM', 157123994233279);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157123994237921, 'Spring Boot', 157123994233279);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157124026569962, '微信小程序', 157124009918832);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157124090700978, 'LOL', 157124090699406);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (157124090701279, '英雄联盟', 157124090699406);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174479687194659, '', 174479687188266);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174496865004120, '', 174496864998942);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174496868258246, '', 174496868253920);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174496869658220, '', 174496869654259);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503260961967, '', 174503260954277);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503262240058, '', 174503262236670);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503263946767, '', 174503263943061);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503333212110, '', 174503333206342);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503334494687, '', 174503334486340);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174503336869612, '', 174503336864646);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174531656802934, '', 174531656800964);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174531758344292, '', 174531758342140);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174531786216889, '', 174531786213762);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174532924761760, '', 174532924758914);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174537732022720, '', 174537732020716);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174537875580641, '', 174537875578944);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174539130439926, '', 174539130435774);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174540056328259, '', 174540056323851);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548689581148, '', 174548689578395);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548784647918, '', 174548784645456);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548784652916, '', 174548784652445);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548784655013, '', 174548784654647);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548784657592, '', 174548784656907);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174548784660275, '', 174548784659671);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556650964850, '', 174556650961311);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556674219827, '', 174556674216931);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556770785900, '', 174556770782565);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556795007735, '', 174556795005695);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556818426287, '', 174556818421976);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556818432671, '', 174556818432236);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556818434551, '', 174556818434094);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556818436575, '', 174556818436205);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556818438864, '', 174556818438468);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556845632321, '', 174556845629251);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556845639375, '', 174556845638798);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556845640900, '', 174556845640656);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556845642552, '', 174556845642123);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174556845644494, '', 174556845644024);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174557153758096, '', 174557153756357);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174557153760820, '', 174557153760511);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174557153762583, '', 174557153762211);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174557153764278, '', 174557153764029);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174557153765638, '', 174557153765342);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565191589238, '', 174565191585221);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565191596371, '', 174565191595927);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565191597942, '', 174565191597575);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565191599698, '', 174565191599310);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565191601384, '', 174565191601050);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565204925857, '', 174565204924535);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565252025741, '', 174565252022323);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565252031041, '', 174565252030753);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565252032472, '', 174565252032292);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565252034004, '', 174565252033784);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565252035522, '', 174565252035202);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565269334071, '', 174565269330327);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565269339734, '', 174565269339263);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565269341441, '', 174565269340996);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565269342913, '', 174565269342623);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565269344673, '', 174565269344320);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565288312920, '', 174565288309556);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565288318821, '', 174565288318562);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565288320548, '', 174565288320210);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565288322109, '', 174565288321876);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565288323639, '', 174565288323398);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565299419645, '', 174565299415914);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565299426915, '', 174565299426554);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565299429501, '', 174565299429245);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565299433267, '', 174565299432768);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565299435474, '', 174565299435024);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565313679228, '', 174565313676112);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565353829502, '', 174565353825751);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565353835391, '', 174565353834948);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565353838459, '', 174565353838019);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565353840719, '', 174565353840491);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565353842651, '', 174565353842289);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565357950943, '', 174565357949756);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565357955027, '', 174565357954591);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565357957717, '', 174565357957372);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565357960517, '', 174565357960173);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565357963718, '', 174565357963328);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565360867519, '', 174565360866260);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565360873087, '', 174565360872507);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565360875966, '', 174565360875329);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565360878476, '', 174565360878012);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565360881709, '', 174565360881275);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565454568787, '', 174565454564121);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565454580272, '', 174565454579807);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565454584031, '', 174565454583627);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565454588414, '', 174565454587900);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565454592567, '', 174565454592116);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565463426253, '', 174565463422677);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565463432484, '', 174565463432081);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565463434715, '', 174565463434329);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565463436996, '', 174565463436650);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565463439115, '', 174565463438873);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565496917895, '', 174565496916624);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565496922998, '', 174565496922497);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565496925694, '', 174565496925168);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565496929036, '', 174565496928641);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565496932033, '', 174565496931588);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565523362221, '', 174565523361357);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565523367124, '', 174565523366501);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565523370658, '', 174565523370038);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565523373948, '', 174565523373329);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565523376801, '', 174565523376305);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565542905558, '', 174565542903662);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565542910762, '', 174565542910145);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565542913389, '', 174565542912909);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565542917013, '', 174565542916727);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565542918936, '', 174565542918661);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565594059840, '', 174565594056976);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565594066475, '', 174565594066110);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565594068888, '', 174565594068562);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565594070975, '', 174565594070663);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565594073013, '', 174565594072628);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565602160758, '', 174565602159991);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565602164865, '', 174565602164400);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565602168455, '', 174565602167967);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565602171443, '', 174565602171045);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565602174478, '', 174565602173920);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565622011229, '', 174565622009956);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565622014082, '', 174565622013660);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565622016612, '', 174565622016122);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565622020173, '', 174565622019686);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565622023703, '', 174565622023307);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565626043033, '', 174565626041638);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565645297489, '', 174565645296397);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565645302709, '', 174565645302227);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565645306957, '', 174565645306328);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565645310058, '', 174565645309616);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565645312334, '', 174565645311976);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565662830932, '', 174565662827449);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565662837151, '', 174565662836831);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565662839491, '', 174565662839004);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565662841189, '', 174565662840818);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565662843256, '', 174565662842997);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565898214729, '', 174565898211686);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565898223746, '', 174565898223368);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565898226208, '', 174565898225486);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565898228136, '', 174565898227884);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174565898231115, '', 174565898229846);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174566409455107, '', 174566409452088);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174566409462041, '', 174566409461671);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174566409464685, '', 174566409464221);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174566409466936, '', 174566409466656);
INSERT INTO `task_skill` (`id`, `skill_name`, `task_id`) VALUES (174566409469107, '', 174566409468761);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
