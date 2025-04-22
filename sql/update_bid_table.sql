-- 添加案例图片字段到bid表
ALTER TABLE `bid` ADD COLUMN `case_img` VARCHAR(255) DEFAULT NULL COMMENT '投标案例图片'; 