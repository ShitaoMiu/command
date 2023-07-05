-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: command
-- ------------------------------------------------------
-- Server version	5.5.5-10.11.2-MariaDB

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
-- Table structure for table `codes`
--

DROP TABLE IF EXISTS `codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `codes` (
  `codeNo` varchar(20) DEFAULT NULL COMMENT '1.페이지 , 2.메뉴 , 3. 프로그램',
  `codeValue` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `codes`
--

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_board`
--

DROP TABLE IF EXISTS `contents_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_board` (
  `contentsBoardIdx` int(10) NOT NULL AUTO_INCREMENT,
  `contentsBoardName` varchar(100) NOT NULL,
  `contentsBoardId` varchar(100) NOT NULL,
  `contentsBoardType` varchar(100) NOT NULL,
  `contentsIsBoardMeCert` varchar(2) DEFAULT NULL,
  `contentsIsBoardSMS` varchar(2) NOT NULL,
  `contentsBoardCommentNum` varchar(100) DEFAULT NULL,
  `contentsBoardNoticeNum` varchar(100) DEFAULT NULL,
  `regId` varchar(100) NOT NULL,
  `regDate` datetime DEFAULT NULL,
  `modId` varchar(100) DEFAULT NULL,
  `modDate` datetime DEFAULT NULL,
  PRIMARY KEY (`contentsBoardIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_board`
--

LOCK TABLES `contents_board` WRITE;
/*!40000 ALTER TABLE `contents_board` DISABLE KEYS */;
INSERT INTO `contents_board` VALUES (1,'테스트게시판','BBS_0','0','Y','N','2','2','admin','2023-05-05 15:23:13',NULL,NULL);
/*!40000 ALTER TABLE `contents_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_board_banwords`
--

DROP TABLE IF EXISTS `contents_board_banwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_board_banwords` (
  `contentsBoardBanIdx` int(10) NOT NULL,
  `contentsBoardBanword` varchar(100) NOT NULL,
  `regId` varchar(100) NOT NULL,
  `regDate` datetime DEFAULT NULL,
  `modId` varchar(100) DEFAULT NULL,
  `modDate` datetime DEFAULT NULL,
  `contentsBoardIdx` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_board_banwords`
--

LOCK TABLES `contents_board_banwords` WRITE;
/*!40000 ALTER TABLE `contents_board_banwords` DISABLE KEYS */;
INSERT INTO `contents_board_banwords` VALUES (1,'111111111111','admin','2023-05-05 15:23:13',NULL,NULL,NULL),(1,'222222222','admin','2023-05-05 15:23:13',NULL,NULL,NULL),(1,'3333333333','admin','2023-05-05 15:23:13',NULL,NULL,NULL);
/*!40000 ALTER TABLE `contents_board_banwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_board_columns`
--

DROP TABLE IF EXISTS `contents_board_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_board_columns` (
  `contentsBoardColumnIdx` int(10) NOT NULL,
  `contentsBoardColumnType` varchar(2) NOT NULL,
  `contentsBoardColumnOrder` int(4) NOT NULL,
  `contentsBoardColumnName` varchar(100) NOT NULL,
  `regId` varchar(100) NOT NULL,
  `regDate` datetime DEFAULT NULL,
  `modId` varchar(100) DEFAULT NULL,
  `modDate` datetime DEFAULT NULL,
  `contentsBoardIdx` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_board_columns`
--

LOCK TABLES `contents_board_columns` WRITE;
/*!40000 ALTER TABLE `contents_board_columns` DISABLE KEYS */;
/*!40000 ALTER TABLE `contents_board_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contents_page`
--

DROP TABLE IF EXISTS `contents_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contents_page` (
  `pageContentIdx` int(11) NOT NULL,
  `pageMenuContents` blob DEFAULT NULL,
  `pageContentEnables` varchar(100) NOT NULL DEFAULT 'Y',
  `regId` varchar(100) NOT NULL,
  `regDate` date DEFAULT NULL,
  `modId` varchar(100) DEFAULT NULL,
  `modDate` date DEFAULT NULL,
  `menuIdx` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contents_page`
--

LOCK TABLES `contents_page` WRITE;
/*!40000 ALTER TABLE `contents_page` DISABLE KEYS */;
INSERT INTO `contents_page` VALUES (1,NULL,'Y','admin','2023-05-07',NULL,NULL,22),(2,NULL,'Y','admin','2023-05-04','admin','2023-05-07',22);
/*!40000 ALTER TABLE `contents_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ids`
--

DROP TABLE IF EXISTS `ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ids` (
  `TABLE_NAME` varchar(16) NOT NULL,
  `NEXT_ID` decimal(30,0) NOT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ids`
--

LOCK TABLES `ids` WRITE;
/*!40000 ALTER TABLE `ids` DISABLE KEYS */;
INSERT INTO `ids` VALUES ('FILE_ID',300),('SAMPLE',115);
/*!40000 ALTER TABLE `ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnfile`
--

DROP TABLE IF EXISTS `lettnfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lettnfile` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `CREAT_DT` datetime NOT NULL,
  `USE_AT` char(1) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnfile`
--

LOCK TABLES `lettnfile` WRITE;
/*!40000 ALTER TABLE `lettnfile` DISABLE KEYS */;
INSERT INTO `lettnfile` VALUES ('FILE_000000000000140','2023-05-06 19:10:25','Y'),('FILE_000000000000141','2023-05-06 19:10:25','Y'),('FILE_000000000000142','2023-05-06 19:11:15','Y'),('FILE_000000000000143','2023-05-06 19:11:15','Y'),('FILE_000000000000144','2023-05-06 19:12:23','Y'),('FILE_000000000000145','2023-05-06 19:12:23','Y'),('FILE_000000000000146','2023-05-06 19:16:00','Y'),('FILE_000000000000147','2023-05-06 19:16:00','Y'),('FILE_000000000000150','2023-05-06 19:36:49','Y'),('FILE_000000000000151','2023-05-06 19:36:49','Y'),('FILE_000000000000160','2023-05-06 20:43:04','Y'),('FILE_000000000000161','2023-05-06 20:43:04','Y'),('FILE_000000000000170','2023-05-06 20:44:24','Y'),('FILE_000000000000171','2023-05-06 20:44:24','Y'),('FILE_000000000000172','2023-05-06 20:45:05','Y'),('FILE_000000000000173','2023-05-06 20:45:05','Y'),('FILE_000000000000174','2023-05-06 20:45:20','Y'),('FILE_000000000000175','2023-05-06 20:45:20','Y'),('FILE_000000000000176','2023-05-06 20:45:21','Y'),('FILE_000000000000177','2023-05-06 20:45:21','Y'),('FILE_000000000000178','2023-05-06 20:45:21','Y'),('FILE_000000000000179','2023-05-06 20:45:21','Y'),('FILE_000000000000180','2023-05-06 20:45:21','Y'),('FILE_000000000000181','2023-05-06 20:45:21','Y'),('FILE_000000000000182','2023-05-06 20:45:27','Y'),('FILE_000000000000183','2023-05-06 20:45:27','Y'),('FILE_000000000000184','2023-05-06 20:45:39','Y'),('FILE_000000000000185','2023-05-06 20:45:39','Y'),('FILE_000000000000190','2023-05-06 20:51:26','Y'),('FILE_000000000000191','2023-05-06 20:51:26','Y'),('FILE_000000000000192','2023-05-06 20:53:36','Y'),('FILE_000000000000193','2023-05-06 20:53:36','Y'),('FILE_000000000000194','2023-05-06 20:53:36','Y'),('FILE_000000000000195','2023-05-06 20:53:36','Y'),('FILE_000000000000196','2023-05-06 20:55:34','Y'),('FILE_000000000000197','2023-05-06 20:55:34','Y'),('FILE_000000000000200','2023-05-06 22:15:48','Y'),('FILE_000000000000201','2023-05-06 22:15:48','Y'),('FILE_000000000000202','2023-05-06 22:16:59','Y'),('FILE_000000000000203','2023-05-06 22:16:59','Y'),('FILE_000000000000204','2023-05-06 22:17:12','Y'),('FILE_000000000000205','2023-05-06 22:17:12','Y'),('FILE_000000000000206','2023-05-06 22:17:28','Y'),('FILE_000000000000207','2023-05-06 22:17:28','Y'),('FILE_000000000000208','2023-05-06 22:17:34','Y'),('FILE_000000000000209','2023-05-06 22:17:34','Y'),('FILE_000000000000210','2023-05-06 22:17:48','Y'),('FILE_000000000000211','2023-05-06 22:17:48','Y'),('FILE_000000000000212','2023-05-06 22:18:37','Y'),('FILE_000000000000213','2023-05-06 22:18:37','Y'),('FILE_000000000000214','2023-05-06 22:19:18','Y'),('FILE_000000000000215','2023-05-06 22:19:18','Y'),('FILE_000000000000216','2023-05-06 22:20:02','Y'),('FILE_000000000000217','2023-05-06 22:20:02','Y'),('FILE_000000000000218','2023-05-06 22:20:26','Y'),('FILE_000000000000219','2023-05-06 22:20:26','Y'),('FILE_000000000000220','2023-05-06 22:21:14','Y'),('FILE_000000000000221','2023-05-06 22:21:14','Y'),('FILE_000000000000222','2023-05-06 22:21:41','Y'),('FILE_000000000000223','2023-05-06 22:21:41','Y'),('FILE_000000000000224','2023-05-06 22:21:54','Y'),('FILE_000000000000225','2023-05-06 22:21:54','Y'),('FILE_000000000000230','2023-05-06 23:07:44','Y'),('FILE_000000000000231','2023-05-06 23:07:44','Y'),('FILE_000000000000232','2023-05-06 23:07:46','Y'),('FILE_000000000000233','2023-05-06 23:07:46','Y'),('FILE_000000000000234','2023-05-06 23:07:47','Y'),('FILE_000000000000235','2023-05-06 23:07:47','Y'),('FILE_000000000000236','2023-05-06 23:07:47','Y'),('FILE_000000000000237','2023-05-06 23:07:47','Y'),('FILE_000000000000238','2023-05-06 23:07:47','Y'),('FILE_000000000000239','2023-05-06 23:07:47','Y'),('FILE_000000000000240','2023-05-06 23:07:47','Y'),('FILE_000000000000241','2023-05-06 23:07:47','Y'),('FILE_000000000000242','2023-05-06 23:08:38','Y'),('FILE_000000000000243','2023-05-06 23:08:38','Y'),('FILE_000000000000244','2023-05-06 23:10:21','Y'),('FILE_000000000000245','2023-05-06 23:10:21','Y'),('FILE_000000000000246','2023-05-06 23:11:36','Y'),('FILE_000000000000247','2023-05-06 23:11:36','Y'),('FILE_000000000000250','2023-05-06 23:12:12','Y'),('FILE_000000000000251','2023-05-06 23:12:12','Y'),('FILE_000000000000260','2023-05-06 23:15:25','Y'),('FILE_000000000000261','2023-05-06 23:15:25','Y'),('FILE_000000000000262','2023-05-06 23:22:40','Y'),('FILE_000000000000263','2023-05-06 23:22:54','Y'),('FILE_000000000000264','2023-05-06 23:25:38','Y'),('FILE_000000000000265','2023-05-06 23:25:38','Y'),('FILE_000000000000270','2023-05-06 23:28:24','Y'),('FILE_000000000000271','2023-05-06 23:28:24','Y'),('FILE_000000000000280','2023-05-15 22:04:27','Y'),('FILE_000000000000281','2023-05-15 22:04:27','Y'),('FILE_000000000000290','2023-05-15 22:11:50','Y'),('FILE_000000000000291','2023-05-15 22:11:50','Y');
/*!40000 ALTER TABLE `lettnfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lettnfiledetail`
--

DROP TABLE IF EXISTS `lettnfiledetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lettnfiledetail` (
  `ATCH_FILE_ID` char(20) NOT NULL,
  `FILE_SN` decimal(10,0) NOT NULL,
  `FILE_STRE_COURS` varchar(2000) NOT NULL,
  `STRE_FILE_NM` varchar(255) NOT NULL,
  `ORIGNL_FILE_NM` varchar(255) DEFAULT NULL,
  `FILE_EXTSN` varchar(20) NOT NULL,
  `FILE_CN` mediumtext DEFAULT NULL,
  `FILE_SIZE` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`ATCH_FILE_ID`,`FILE_SN`),
  CONSTRAINT `LETTNFILEDETAIL_ibfk_1` FOREIGN KEY (`ATCH_FILE_ID`) REFERENCES `lettnfile` (`ATCH_FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lettnfiledetail`
--

LOCK TABLES `lettnfiledetail` WRITE;
/*!40000 ALTER TABLE `lettnfiledetail` DISABLE KEYS */;
INSERT INTO `lettnfiledetail` VALUES ('FILE_000000000000264',0,'/upload','SiteFaviCon_202305061125386590','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323),('FILE_000000000000265',0,'/upload','MainImgFile_202305061125386640','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323),('FILE_000000000000265',1,'/upload','MainImgFile_202305061125386651','dog-g81c5dc7be_1920.jpg','jpg','',368665),('FILE_000000000000270',0,'/upload','SiteFaviCon_202305061128249620','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323),('FILE_000000000000271',0,'/upload','MainImgFile_202305061128249660','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323),('FILE_000000000000271',1,'/upload','MainImgFile_202305061128249671','dog-g81c5dc7be_1920.jpg','jpg','',368665),('FILE_000000000000280',0,'/upload','SiteFaviCon_202305151004278920','dog-g81c5dc7be_1920.jpg','jpg','',368665),('FILE_000000000000281',0,'/upload','MainImgFile_202305151004278970','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323),('FILE_000000000000290',0,'/upload','SiteFaviCon_202305151011500040','dog-g81c5dc7be_1920.jpg','jpg','',368665),('FILE_000000000000291',0,'/upload','MainImgFile_202305151011500080','beautiful-flowers-ga8a797abf_1920.jpg','jpg','',293323);
/*!40000 ALTER TABLE `lettnfiledetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `memberId` varchar(20) NOT NULL,
  `password` varchar(200) NOT NULL,
  `passwordHint` varchar(100) DEFAULT NULL,
  `memberNm` varchar(50) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `detailAdres` varchar(100) DEFAULT NULL,
  `memberPhone` varchar(20) NOT NULL,
  `groupId` char(20) DEFAULT NULL,
  `mberFax` varchar(20) DEFAULT NULL,
  `mberEmail` varchar(50) DEFAULT NULL,
  `telNo` varchar(20) NOT NULL,
  `sexCode` char(1) DEFAULT NULL,
  `regDate` date DEFAULT NULL,
  `modDate` date DEFAULT NULL,
  `regId` varchar(100) NOT NULL,
  `updId` varchar(100) NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('admin','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박지은','12345','서울특별시 강남구 논현동 123-1','2층','01012345678','adminGrp','02-2146-2992','lvhfw30@gmail.com','02-2146-2992','M','2023-04-18',NULL,'admin','admin'),('cmjoo37','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','정하윤','12345','서울특별시 마포구 서교동 123-1','2층','01012345678','memberGrp','02-5933-2675','jmhmg70@gmail.com','02-5933-2675','M','2023-04-18',NULL,'admin','admin'),('dihak60','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','임세은','12345','서울특별시 중랑구 면목동 123-1','2층','01012345678','memberGrp','02-3322-3160','xdsys33@gmail.com','02-3322-3160','M','2023-04-18',NULL,'admin','admin'),('dmrgb22','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김세은','12345','서울특별시 강동구 천호동 123-1','2층','01012345678','memberGrp','02-5414-3758','epyoe88@gmail.com','02-5414-3758','M','2023-04-18',NULL,'admin','admin'),('ebtra15','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','이하은','12345','서울특별시 강서구 화곡동 123-1','2층','01012345678','memberGrp','02-4069-3295','nasaq13@gmail.com','02-4069-3295','M','2023-04-18',NULL,'admin','admin'),('edazw15','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김예은','12345','서울특별시 구로구 구로동 123-1','2층','01012345678','memberGrp','02-9464-4831','mjchb31@gmail.com','02-9464-4831','M','2023-04-18',NULL,'admin','admin'),('fjzhx86','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김윤지','12345','서울특별시 서초구 방배동 123-1','2층','01012345678','memberGrp','02-6794-1606','usger11@gmail.com','02-6794-1606','M','2023-04-18',NULL,'admin','admin'),('foaqt44','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','임하은','12345','서울특별시 은평구 불광동 123-1','2층','01012345678','memberGrp','02-6675-5188','xwktx15@gmail.com','02-6675-5188','M','2023-04-18',NULL,'admin','admin'),('fpxny66','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김하은','12345','서울특별시 중구 소공동 123-1','2층','01012345678','memberGrp','02-5854-9818','ffapd73@gmail.com','02-5854-9818','M','2023-04-18',NULL,'admin','admin'),('fvwpr58','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박예은','12345','인천광역시 부평구 부평동 123-1','2층','01012345678','memberGrp','02-2200-1255','nukxy04@gmail.com','02-2200-1255','M','2023-04-18',NULL,'admin','admin'),('fzits31','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','이세은','12345','서울특별시 영등포구 여의도동 123-1','2층','01012345678','memberGrp','02-9152-7903','vkvrm44@gmail.com','02-9152-7903','M','2023-04-18',NULL,'admin','admin'),('gvfrt75','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김윤진','12345','인천광역시 남동구 간석동 123-1','2층','01012345678','memberGrp','02-9580-9343','dbmkc08@gmail.com','02-9580-9343','M','2023-04-18',NULL,'admin','admin'),('jrbes39','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박지윤','12345','서울특별시 광진구 구의동 123-1','2층','01012345678','memberGrp','02-8945-6764','hhfbg22@gmail.com','02-8945-6764','M','2023-04-18',NULL,'admin','admin'),('jvjdl66','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박윤지','12345','서울특별시 양천구 목동 123-1','2층','01012345678','memberGrp','02-5443-3925','fqtfh24@gmail.com','02-5443-3925','M','2023-04-18',NULL,'admin','admin'),('jzenh51','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박지현','12345','경기도 수원시 장안구 정자동 123-1','2층','01012345678','memberGrp','02-0310-8588','jamhy30@gmail.com','02-0310-8588','M','2023-04-18',NULL,'admin','admin'),('liwkd91','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','이예은','12345','서울특별시 성동구 성수동 123-1','2층','01012345678','memberGrp','02-6196-6239','nvbaf11@gmail.com','02-6196-6239','M','2023-04-18',NULL,'admin','admin'),('ljapd89','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','장나은','12345','서울특별시 금천구 시흥동 123-1','2층','01012345678','memberGrp','02-4961-8910','xstui29@gmail.com','02-4961-8910','M','2023-04-18',NULL,'admin','admin'),('lskoz08','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','최하은','12345','서울특별시 성북구 안암동 123-1','2층','01012345678','memberGrp','02-2857-7205','qlzhb77@gmail.com','02-2857-7205','M','2023-04-18',NULL,'admin','admin'),('luvhj14','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','조지우','12345','서울특별시 종로구 관수동 123-1','2층','01012345678','memberGrp','02-0628-0010','muzbj92@gmail.com','02-0628-0010','M','2023-04-18',NULL,'admin','admin'),('lxxyz78','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','이나은','12345','경기도 광명시 철산동 123-1','2층','01012345678','memberGrp','02-5922-7546','aovkg69@gmail.com','02-5922-7546','M','2023-04-18',NULL,'admin','admin'),('nfclm82','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김나은','12345','서울특별시 송파구 잠실동 123-1','2층','01012345678','memberGrp','02-2114-5540','azeao48@gmail.com','02-2114-5540','M','2023-04-18',NULL,'admin','admin'),('olwal46','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김지윤','12345','서울특별시 용산구 이태원동 123-1','2층','01012345678','memberGrp','02-2005-5537','dvkai43@gmail.com','02-2005-5537','M','2023-04-18',NULL,'admin','admin'),('ozdwo08','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김예지','12345','경기도 성남시 분당구 서현동 123-1','2층','01012345678','memberGrp','02-4705-4703','ktgoy02@gmail.com','02-4705-4703','M','2023-04-18',NULL,'admin','admin'),('pcjsz94','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김하윤','12345','서울특별시 노원구 상계동 123-1','2층','01012345678','memberGrp','02-7746-9468','ritkl96@gmail.com','02-7746-9468','M','2023-04-18',NULL,'admin','admin'),('rfjec17','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','유하은','12345','경기도 안양시 동안구 호계동 123-1','2층','01012345678','memberGrp','02-8914-1038','fxorm07@gmail.com','02-8914-1038','M','2023-04-18',NULL,'admin','admin'),('tmiwy10','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박하은','12345','서울특별시 서대문구 창천동 123-1','2층','01012345678','memberGrp','02-4036-4096','ngsig49@gmail.com','02-4036-4096','M','2023-04-18',NULL,'admin','admin'),('upsxl98','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','강지우','12345','경기도 부천시 원미구 상동 123-1','2층','01012345678','memberGrp','02-5771-2557','ynvsy55@gmail.com','02-5771-2557','M','2023-04-18',NULL,'admin','admin'),('vvjjr51','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','최지우','12345','서울특별시 관악구 봉천동 123-1','2층','01012345678','memberGrp','02-6915-8741','jeytn27@gmail.com','02-6915-8741','M','2023-04-18',NULL,'admin','admin'),('wgojl77','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','박세은','12345','서울특별시 동대문구 장안동 123-1','2층','01012345678','memberGrp','02-9692-2582','exmbi00@gmail.com','02-9692-2582','M','2023-04-18',NULL,'admin','admin'),('woqdn53','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','정윤지','12345','인천광역시 서구 심곡동 123-1','2층','01012345678','memberGrp','02-7892-9203','rchbi28@gmail.com','02-7892-9203','M','2023-04-18',NULL,'admin','admin'),('zdpqq39','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','이지은','12345','서울특별시 도봉구 창동 123-1','2층','01012345678','memberGrp','02-0487-1584','xavhz34@gmail.com','02-0487-1584','M','2023-04-18',NULL,'admin','admin'),('zkhfo88','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김지우','12345','서울특별시 동작구 사당동 123-1','2층','01012345678','memberGrp','02-9908-7010','ywzyb40@gmail.com','02-9908-7010','M','2023-04-18',NULL,'admin','admin'),('zrfwz92','2e590e7c7199a3db3d1e4e4a4ee4c6f4d54a4adfaf2e26aafbc0e9db3d3e4974','어머니 성함은?','김하람','12345','인천광역시 중구 북성동','2층','01012345678','memberGrp','02-7892-9203','hkpnr36@gmail.com','02-7892-9203','M','2023-04-18',NULL,'admin','admin');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_groups`
--

DROP TABLE IF EXISTS `members_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_groups` (
  `memGrpId` varchar(10) NOT NULL COMMENT '그룹아이디',
  `memGrpNm` varchar(100) NOT NULL COMMENT '그룹이름',
  `memGrpDescription` varchar(100) DEFAULT NULL COMMENT '그룹설명',
  `memGrpAuth` varchar(100) NOT NULL COMMENT '그룹권한',
  `memGrpDelYn` varchar(1) DEFAULT 'N' COMMENT '그룹 삭제여부',
  `regDt` date DEFAULT current_timestamp() COMMENT '등록일',
  `modDt` date DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`memGrpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_groups`
--

LOCK TABLES `members_groups` WRITE;
/*!40000 ALTER TABLE `members_groups` DISABLE KEYS */;
INSERT INTO `members_groups` VALUES ('adminGrp','관리자그룹','모든메뉴를 다 통제할수 있는 기능','1','N',NULL,NULL),('memberGrp','회원그룹','일반회원그룹','2','N','2023-04-18',NULL);
/*!40000 ALTER TABLE `members_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_menus_permissions`
--

DROP TABLE IF EXISTS `members_menus_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_menus_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memberId` varchar(20) NOT NULL,
  `menuIdx` int(11) NOT NULL,
  `canRead` tinyint(1) NOT NULL,
  `canWrite` tinyint(1) NOT NULL,
  `canModify` tinyint(1) NOT NULL,
  `canDelete` tinyint(1) NOT NULL,
  `canManage` tinyint(1) NOT NULL,
  `regId` varchar(100) DEFAULT NULL,
  `regDate` datetime DEFAULT NULL,
  `updId` varchar(100) DEFAULT NULL,
  `updDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_member_menu` (`memberId`,`menuIdx`),
  KEY `menuIdx` (`menuIdx`),
  CONSTRAINT `members_menus_permissions_ibfk_1` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`),
  CONSTRAINT `members_menus_permissions_ibfk_2` FOREIGN KEY (`menuIdx`) REFERENCES `menus` (`menuIdx`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_menus_permissions`
--

LOCK TABLES `members_menus_permissions` WRITE;
/*!40000 ALTER TABLE `members_menus_permissions` DISABLE KEYS */;
INSERT INTO `members_menus_permissions` VALUES (30,'admin',6,1,1,0,1,0,NULL,NULL,NULL,NULL),(31,'dmrgb22',6,0,1,1,1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `members_menus_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `menuIdx` int(11) NOT NULL,
  `menuNm` varchar(100) DEFAULT NULL,
  `menuOrder` int(11) DEFAULT NULL,
  `parentMenuIdx` int(11) DEFAULT NULL,
  `menuLevel` varchar(10) DEFAULT NULL,
  `menuUrl` varchar(100) DEFAULT NULL,
  `menuType` varchar(30) DEFAULT 'MENU',
  `menuDescription` varchar(100) DEFAULT NULL,
  `regDate` datetime NOT NULL DEFAULT current_timestamp(),
  `updDate` datetime DEFAULT NULL,
  `regId` varchar(100) DEFAULT NULL,
  `updId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`menuIdx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (0,'root',1,NULL,'',NULL,'menu','root','2023-05-12 20:55:05',NULL,NULL,NULL),(1,'서비스페이지',1,0,'0','/main','menu','서비스페이지','2023-05-12 20:55:05',NULL,NULL,NULL),(2,'관리자페이지',2,0,'0','/admin','menu','관리자페이지','2023-05-12 20:55:05',NULL,NULL,NULL),(3,'사이트관리',1,2,'1','/admin/site','menu','사이트관리','2023-05-12 20:55:05',NULL,NULL,NULL),(5,'사이트기본정보',1,27,'3','/admin/site/basic/info','menu','사이트 기본정보','2023-05-12 20:55:05',NULL,'admin',NULL),(6,'메뉴관리',2,3,'2','/admin/site/menu','menu','메뉴관리','2023-05-12 20:55:05',NULL,'admin',NULL),(7,'보안설정',3,3,'2','/admin/site/security','menu','보안설정','2023-05-12 20:55:05',NULL,'admin',NULL),(9,'외부리소스관리',5,2,'1','/admin/resource','menu','외부리소스관리','2023-05-12 20:55:05',NULL,'admin',NULL),(10,'기능설정',4,3,'2','/admin/site/function','menu','사이트기능 설정','2023-05-12 20:55:05',NULL,'admin',NULL),(11,'메세지(sms)전송',1,10,'3','/admin/site/function/sms','menu','메세지(sms)전송','2023-05-12 20:55:05',NULL,'admin',NULL),(12,'메일전송',2,10,'3','/admin/site/function/email','menu','메일 전송','2023-05-12 20:55:05',NULL,'admin',NULL),(14,'서버상태설정',5,3,'2','/admin/site/server','menu','서버상태설정','2023-05-12 20:55:05',NULL,'admin',NULL),(15,'서버상태관리',1,14,'3','/admin/site/server/status','menu','서버 상태 관리','2023-05-12 20:55:05',NULL,'admin',NULL),(20,'콘텐츠관리',3,2,'1','/admin/content','menu','콘텐츠 관리','2023-05-12 20:55:05',NULL,'admin',NULL),(21,'게시판설정',1,20,'2','/admin/content/board','menu','게시판설정','2023-05-12 20:55:05',NULL,'admin',NULL),(22,'게시물관리',2,20,'2','/admin/content/post','menu','게시물관리','2023-05-12 20:55:05',NULL,'admin',NULL),(23,'페이지관리',3,20,'2','/admin/content/page','menu','페이지 관리','2023-05-12 20:55:05',NULL,'admin',NULL),(24,'팝업관리',4,20,'2','/admin/content/popup','menu','팝업관리','2023-05-12 20:55:05',NULL,'admin',NULL),(25,'배너관리',5,20,'2','/admin/content/banner','menu','배너관리','2023-05-12 20:55:05',NULL,'admin',NULL),(26,'프로그램 관리',4,2,'1','/admin/program','menu','프로그램 관리','2023-05-12 20:55:05',NULL,'admin',NULL),(27,'사이트설정',1,3,'2','/admin/site/basic','menu','사이트설정','2023-05-12 20:55:05',NULL,'admin',NULL),(28,'회사소개',1,1,'1','/main/comp','page','회사소개','2023-05-12 20:55:05',NULL,'admin',NULL),(30,'아이피 설정',1,7,'3','/admin/site/security/ipset','menu','아이피 설정','2023-05-12 20:55:05',NULL,'admin',NULL),(31,'아이피 리스트',2,7,'3','/admin/site/security/iplist','menu','아이피 리스트','2023-05-12 20:55:05',NULL,'admin',NULL);
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus_members`
--

DROP TABLE IF EXISTS `menus_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus_members` (
  `menuIdx` int(11) NOT NULL,
  `memberId` varchar(20) NOT NULL,
  PRIMARY KEY (`menuIdx`,`memberId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `menus_members_ibfk_1` FOREIGN KEY (`menuIdx`) REFERENCES `menus` (`menuIdx`),
  CONSTRAINT `menus_members_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus_members`
--

LOCK TABLES `menus_members` WRITE;
/*!40000 ALTER TABLE `menus_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `menus_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_egov`
--

DROP TABLE IF EXISTS `sample_egov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_egov` (
  `ID` varchar(16) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `USE_YN` char(1) DEFAULT NULL,
  `REG_USER` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_egov`
--

LOCK TABLES `sample_egov` WRITE;
/*!40000 ALTER TABLE `sample_egov` DISABLE KEYS */;
INSERT INTO `sample_egov` VALUES ('SAMPLE-00002','Runtime Environment','Persistence Layer','Y','eGov'),('SAMPLE-00003','Runtime Environment','Presentation Layer','Y','eGov'),('SAMPLE-00004','Runtime Environment','Business Layer','Y','eGov'),('SAMPLE-00005','Runtime Environment','Batch Layer','Y','eGov'),('SAMPLE-00006','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00007','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00008','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00009','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00010','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00011','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00012','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00013','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00014','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00015','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00016','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00017','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00018','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00019','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00020','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00021','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00022','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00023','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00024','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00025','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00026','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00027','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00028','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00029','Runtime Environment','Integration Layer','Y','eGov'),('SAMPLE-00030','Runtime Environment','Integration Layer','Y','eGov');
/*!40000 ALTER TABLE `sample_egov` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitebasic`
--

DROP TABLE IF EXISTS `sitebasic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitebasic` (
  `siteBasicIdx` int(10) NOT NULL,
  `siteNm` varchar(100) NOT NULL,
  `siteAddr` varchar(100) DEFAULT NULL,
  `siteExpl` varchar(1000) DEFAULT NULL,
  `siteOpenYN` varchar(1) NOT NULL DEFAULT 'Y',
  `loginStatusYN` varchar(1) NOT NULL DEFAULT 'Y',
  `faviconFileId` varchar(100) DEFAULT NULL,
  `mainImgFileId` varchar(100) DEFAULT NULL,
  `socialLoginYN` varchar(1) DEFAULT 'N',
  `socialType` varchar(100) DEFAULT NULL,
  `regId` varchar(100) NOT NULL,
  `regDate` date NOT NULL DEFAULT current_timestamp(),
  `modId` varchar(100) DEFAULT NULL,
  `modDate` date DEFAULT NULL,
  `siteSubAddr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`siteBasicIdx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitebasic`
--

LOCK TABLES `sitebasic` WRITE;
/*!40000 ALTER TABLE `sitebasic` DISABLE KEYS */;
INSERT INTO `sitebasic` VALUES (1,'1111111111111','경기 성남시 분당구 판교역로 166','3423423423423423423424234','Y','N','','','Y','N,K','admin','2023-05-06','admin','2023-05-15','1층');
/*!40000 ALTER TABLE `sitebasic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'command'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-15 23:07:28
