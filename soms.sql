-- MySQL dump 10.13  Distrib 8.3.0, for macos13.6 (arm64)
--
-- Host: localhost    Database: soms
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` bigint NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `register_time` date DEFAULT NULL,
  `recommend_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `recommend_id` bigint DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_username_IDX` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1801258041845219328,'admin','$2a$10$ipKm1R/93c3D7r.e7LwDPedrH0YqkG6Rs1bL97BVKA/FnH4b8yGli','admin','2024-06-14','123456',NULL,'王小虎','陕西省西安市长安区'),(1803108897502789632,'user2','$2a$10$Zx2/sNNe4X3KDFsAsA7ll.jkFFtVxun/tp0Bpf1AwVhAuQo/BgN1u','user','2024-06-16',NULL,NULL,'赵小龙','新疆乌鲁木齐'),(1803109540149854208,'user3','$2a$10$hM82y3HGxUsDTvGv0tlpRusnCTBSk3yFiuhCit0olT0ncCnA5yOTy','user','2024-06-17',NULL,NULL,'阿福','陕西省周至县'),(1803240790223224832,'user4','$2a$10$LwZzunFT5s7K6rmDFSJq1exHr6iNJCcuAm390RVjQOgECnHgyutgK','user','2024-06-18',NULL,NULL,'扶风鱿鱼','陕西省宝鸡市扶风县'),(1803270575116779520,'user5','$2a$10$H3J.yqxJofygeBnrJEctL.T8jkOmfdgizmKHLB40EcesF4KWGA636','user','2024-06-19',NULL,NULL,'戏精峰少','陕西省长武县'),(1803313139152846848,'user','$2a$10$H3J.yqxJofygeBnrJEctL.T8jkOmfdgizmKHLB40EcesF4KWGA636','user','2024-06-14',NULL,NULL,'三桥老王','陕西西安市'),(1803617928315142144,'user6','$2a$10$NhEk1EufUtUQ0XqmM/vtrui4tYt3RmFxn93XgBqfK2JxfjfHV33dq','user','2024-06-20',NULL,1801258041845219328,'花开富贵','上海市浦东新区陆家嘴'),(1803730597546295296,'user7','$2a$10$pNnQvmrjwfD2d4fUJoLSSOJ/eM6FsUXOvdxzC5KxkZJTGE6AJE9Ke','普通用户','2024-06-20',NULL,1801258041845219328,'荷气生财','上海市浦东新区陆家嘴'),(1803730597961531392,'user8','$2a$10$LAkONo9woB11uBBJvTSSPumya5N0ivRY2qXU1w9gbrs6MlrZkyg8y','普通用户','2024-06-19',NULL,NULL,'笑对人生','陕西省汉中市'),(1803730598359990272,'user9','$2a$10$cMpMswDXPFOgZGy4yWP2Tuzopo0ClHiBg8.w204Mi6q9ePnw4GSdS','普通用户','2024-06-18',NULL,NULL,'孤独人生','陕西省宝鸡市扶风县'),(1803730598737477632,'user10','$2a$10$RCVBZ6t1UjFyOnFK1SmphOOTeM7iIGWYOrRVrQmRLvaiPBJu0Pdb.','普通用户','2024-06-17',NULL,NULL,'平安喜乐','四川省成都市');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `billCode` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '账单编码',
  `productName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '商品名称',
  `productDesc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '商品描述',
  `productUnit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '商品单位',
  `productCount` int DEFAULT NULL COMMENT '商品数量',
  `totalPrice` decimal(20,2) DEFAULT NULL COMMENT '商品总额',
  `isPayment` int DEFAULT NULL COMMENT '是否支付（1：未支付 2：已支付）',
  `createdBy` bigint DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` bigint DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `providerId` bigint DEFAULT NULL COMMENT '供应商ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (85,'BILL_1804167870859444224','康斯丹头油','生活-用品','个',1000,20000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832129802240),(86,'BILL_1804167870863638528','法式鹅肝','食品-鸡鸭鹅类','斤',1000,100000.00,1,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(88,'BILL_1804167870867832832','长城红葡萄酒','饮料-红酒','瓶',60,800.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832129802240),(89,'BILL_1804167870867832833','东北大米','食品-大米','斤',600,4000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(90,'BILL_1804167870867832834','泰国香米','食品-大米','斤',400,5000.00,1,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(91,'BILL_1804167870872027136','芝华士','饮料-洋酒','瓶',20,6000.00,1,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832129802240),(92,'BILL_1804167870872027137','沐浴液、精油','日用品-沐浴类','瓶',500,23000.00,1,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832117219328),(93,'BILL_1804167870872027138','脉动','饮料','瓶',1500,4500.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832113025024),(94,'BILL_1804167870872027139','海之蓝','饮料-国酒','瓶',50,10000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(95,'BILL_1804167870876221440','美国大杏仁','食品-坚果','袋',300,5000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832117219328),(96,'BILL_1804167870876221441','不锈钢盘碗','日用品-厨房用具','个',600,6000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832117219328),(97,'BILL_1804167870876221442','塑料杯','日用品-杯子','个',350,1750.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(98,'BILL_1804167870876221443','洗发水、护发素','日用品-洗发、护发','瓶',500,25000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832129802240),(100,'BILL_1804167870880415745','洗洁精','日用品-厨房清洁','瓶',500,7000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832108830720),(101,'BILL_1804167870880415746','豆瓣酱','食品-调料','瓶',200,2000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832121413632),(102,'BILL_1804167870880415747','橄榄油','食品-进口食用油','斤',200,9800.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832129802240),(103,'BILL_1804167870884610048','可口可乐','饮料','瓶',2000,6000.00,2,1801258041845219328,'2024-06-21 11:01:54',1801258041845219328,'2024-06-21 11:01:54',1803982832113025024);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` bigint NOT NULL COMMENT '主键ID',
  `proCode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '供应商编码',
  `proName` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  `proDesc` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '供应商详细描述',
  `proContact` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '供应商联系人',
  `proPhone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `proAddress` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '地址',
  `proFax` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '传真',
  `createId` bigint DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `modifyId` bigint DEFAULT NULL COMMENT '更新者（userId）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1803982832108830720,'SX_ZHS001','陕西西瑞（集团）','战略合作伙伴，陕西省属国有粮食企业，以粮食收购、储存、加工、粮油贸易、食品开发、物流配送、连锁经营为主业','李华','12345678910','陕西省西安市莲湖区','0771-98861133',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832113025024,'JS_GYS003','无锡喜源坤商行','长期合作伙伴，主营产品：日化品批销','周一清','18567674532','江苏无锡盛岸西路','0510-32274422',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832113025025,'HB_GYS001','石家庄帅益食品贸易有限公司','长期合作伙伴，主营产品:饮料、水饮料、植物蛋白饮料、休闲食品、果汁饮料、功能饮料等','王军','13309094212','河北省石家庄新华区','0311-67738876',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832117219328,'JS_GYS001','兴化佳美调味品厂','长期合作伙伴，主营产品：天然香辛料、鸡精、复合调味料','徐国洋','13754444221','江苏省兴化市林湖工业区','0523-21299098',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832121413632,'GZ_GYS001','深圳市泰香米业有限公司','初次合作伙伴，主营产品：良记金轮米,龙轮香米等','郑程瀚','13402013312','广东省深圳市福田区深南大道6006华丰大厦','0755-67776212',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832121413633,'ZJ_GYS001','慈溪市广和绿色食品厂','长期合作伙伴，主营产品：豆瓣酱、黄豆酱、甜面酱，辣椒，大蒜等农产品','薛圣丹','18099953223','浙江省宁波市慈溪周巷小安村','0574-34449090',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832125607936,'GZ_GYS002','深圳市喜来客商贸有限公司','长期合作伙伴，主营产品：坚果炒货.果脯蜜饯.天然花茶.营养豆豆.特色美食.进口食品.海味零食.肉脯肉','林妮','18599897645','广东省深圳市福龙工业区B2栋3楼西','0755-67772341',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832129802240,'GX_GYS001','优百商贸有限公司','长期合作伙伴，主营产品：日化产品','李立国','13323566543','广西南宁市秀厢大道42-1号','0771-98861134',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328),(1803982832129802241,'BJ_GYS002','北京纳福尔食用油有限公司','长期合作伙伴，主营产品：山茶油、大豆油、花生油、橄榄油等','马莺','13422235678','北京市朝阳区珠江帝景1号楼','010-588634233',1801258041845219328,'2024-06-21 10:46:38','2024-06-21 10:46:38',1801258041845219328);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_block`
--

DROP TABLE IF EXISTS `token_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_block` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_block`
--

LOCK TABLES `token_block` WRITE;
/*!40000 ALTER TABLE `token_block` DISABLE KEYS */;
INSERT INTO `token_block` VALUES (1,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjE4MDEyNTgwNDE4NDUyMTkzMjgsInJvbGUiOiJhZG1pbiIsImV4cGlyZV90aW1lIjoxNzE5NjU1ODA2MTc0fQ.HIloc_bs8dK2XupZhJpovTNB0_MbuWaTGRDJYRekYbc'),(3,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1aWQiOjE4MDEyNTgwNDE4NDUyMTkzMjgsInJvbGUiOiJhZG1pbiIsImV4cGlyZV90aW1lIjoxNzE5NjU1OTQ5NDQyfQ.S9fycUXWNn6Fk_9_Upz_wgYcaN4nDwSk6LDvA8mQiS0');
/*!40000 ALTER TABLE `token_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'soms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-22 18:24:36
