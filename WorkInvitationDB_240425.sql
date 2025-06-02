-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: projects_db
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `chat_file`
--

DROP TABLE IF EXISTS `chat_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `project_id` int NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `alerted` tinyint(1) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `chat_file` longtext COLLATE utf8mb4_unicode_ci,
  `size` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `chatFileCategory_id` int DEFAULT NULL,
  `lot` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_2A03AB51C33D4F7` (`chatFileCategory_id`),
  KEY `IDX_2A03AB51A76ED395` (`user_id`),
  KEY `IDX_2A03AB51CD53EDB6` (`receiver_id`),
  KEY `IDX_2A03AB51166D1F9C` (`project_id`),
  CONSTRAINT `FK_2A03AB51166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_2A03AB51A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_2A03AB51C33D4F7` FOREIGN KEY (`chatFileCategory_id`) REFERENCES `chat_item_category` (`id`),
  CONSTRAINT `FK_2A03AB51CD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file`
--

LOCK TABLES `chat_file` WRITE;
/*!40000 ALTER TABLE `chat_file` DISABLE KEYS */;
INSERT INTO `chat_file` VALUES (1,13,8,8,1,0,'Resume.txt','Resume-6613fad77a5cd.txt','3068','txt','2024-04-08 14:10:31',1,NULL),(2,13,8,8,1,0,'Resume.txt','Resume-6613fba8ea28a.txt','3068','txt','2024-04-08 14:14:00',1,NULL),(3,13,8,8,1,0,'INVITATION.pdf','INVITATION-6613fd65f2928.pdf','1032567','pdf','2024-04-08 14:21:25',1,NULL),(4,13,8,8,1,0,'INVITATION.pdf','INVITATION-6613fd7b0b476.pdf','1032567','pdf','2024-04-08 14:21:47',5,NULL),(5,13,8,8,1,0,'INVITATION.pdf','INVITATION-66140bc10d82b.pdf','1032567','pdf','2024-04-08 15:22:41',5,NULL),(6,13,8,8,1,0,'Resume.txt','Resume-66140f43299ae.txt','3068','txt','2024-04-08 15:37:39',1,NULL),(7,13,8,8,1,0,'Facture Lodanone.pdf','Facture-Lodanone-66141058cbf80.pdf','188533','pdf','2024-04-08 15:42:16',1,NULL),(8,13,8,8,1,0,'Resume.txt','Resume-6614134dd9dd2.txt','3068','txt','2024-04-08 15:54:53',1,NULL),(9,13,8,8,1,0,'Resume.txt','Resume-66141377e28ba.txt','3068','txt','2024-04-08 15:55:35',1,NULL),(10,13,8,8,1,0,'Resume.txt','Resume-6614157b598a7.txt','3068','txt','2024-04-08 16:04:11',1,NULL),(11,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-661415e400482.pdf','212253','pdf','2024-04-08 16:05:55',1,NULL),(12,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-6614161d504db.pdf','212253','pdf','2024-04-08 16:06:53',1,NULL),(13,13,8,8,1,0,'Resume.txt','Resume-661419269b17c.txt','3068','txt','2024-04-08 16:19:50',1,NULL),(14,13,8,8,1,0,'Resume.txt','Resume-66141947df908.txt','3068','txt','2024-04-08 16:20:23',1,NULL),(15,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-661419bb0c12a.jpg','38767','jpg','2024-04-08 16:22:19',1,NULL),(16,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141bf6754ab.jpg','38767','jpg','2024-04-08 16:31:50',1,NULL),(17,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141c1d9a4eb.jpg','38767','jpg','2024-04-08 16:32:29',1,NULL),(18,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141d9848518.jpg','38767','jpg','2024-04-08 16:38:48',1,NULL),(19,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66142e1804cf4.jpg','38767','jpg','2024-04-08 17:49:12',5,NULL),(20,13,8,8,1,0,'Resume.txt','Resume-661430b2a47b2.txt','3068','txt','2024-04-08 18:00:18',4,NULL),(21,13,8,8,1,0,'Resume.txt','Resume-661430f9da589.txt','3068','txt','2024-04-08 18:01:29',5,NULL),(22,13,8,8,1,0,'Resume.txt','Resume-6614a6e1513b2.txt','3068','txt','2024-04-09 02:24:32',4,NULL),(23,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-6615810182915.pdf','212253','pdf','2024-04-09 17:55:12',4,NULL),(24,13,8,8,1,0,'Resume.txt','Resume-661586d9052d5.txt','3068','txt','2024-04-09 18:20:09',4,NULL),(25,13,8,8,1,0,'Resume.txt','Resume-66158792f09a8.txt','3068','txt','2024-04-09 18:23:14',5,NULL),(26,13,8,8,1,0,'Resume-661430f9da589.txt','Resume-661430f9da589-661587f8740e3.txt','3068','txt','2024-04-09 18:24:56',4,NULL),(27,13,8,8,1,0,'Resume.txt','Resume-6615884cb8474.txt','3068','txt','2024-04-09 18:26:20',5,NULL),(28,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c54206330.txt','3068','txt','2024-04-10 16:58:41',4,NULL),(29,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c59fafaeb.txt','3068','txt','2024-04-10 17:00:15',4,NULL),(30,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c76be297c.txt','3068','txt','2024-04-10 17:07:55',4,NULL),(31,13,8,8,1,0,'Resume.txt','Resume-6616cb7928007.txt','3068','txt','2024-04-10 17:25:13',4,NULL),(32,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cd6d57466.txt','3068','txt','2024-04-10 17:33:33',4,NULL),(33,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cd89b0211.txt','3068','txt','2024-04-10 17:34:01',5,NULL),(34,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cec197112.txt','3068','txt','2024-04-10 17:39:13',4,NULL),(35,8,13,8,1,0,'images.jpeg','images-661d28a2260bc.jpg','6160','jpeg','2024-04-15 13:16:17',1,NULL),(36,13,8,8,1,0,'images.jpeg','images-661d3a5d49571.jpg','6160','jpeg','2024-04-15 14:31:57',4,NULL),(37,13,8,8,1,0,'images.png','images-661d48111153b.png','8451','png','2024-04-15 15:30:25',1,NULL),(38,13,8,8,1,0,'images.png','images-661d499b316a5.png','8451','png','2024-04-15 15:36:59',5,NULL),(39,13,8,8,1,0,'Resume.txt','Resume-661d4ab14cfb1.txt','3068','txt','2024-04-15 15:41:37',5,NULL),(40,13,8,8,1,0,'images.png','images-661d4ab3b6e69.png','8451','png','2024-04-15 15:41:39',5,NULL),(42,13,35,144,1,1,'Conair-Man01.jpg','Conair-Man01-6720a5c23e0be.jpg','65321','jpg','2024-10-29 09:07:14',1,NULL),(44,13,35,144,1,1,'Conair-Man06.jpg','Conair-Man06-672156258c548.jpg','76064','jpg','2024-10-29 21:39:49',4,NULL),(46,13,35,144,1,0,'Conair-Man07.jpg','1194433301','53091','jpg','2024-10-30 13:00:41',1,NULL),(50,13,35,144,1,0,'Conair-Man01.jpg','Conair-Man01-67222e98c6c91.jpg','65321','jpg','2024-10-30 13:03:20',1,'1672534757'),(51,13,35,144,1,0,'Conair-Man02.jpg','Conair-Man02-67222e9908433.jpg','52429','jpg','2024-10-30 13:03:21',1,'1672534757'),(52,13,35,144,1,0,'Conair-Man05.jpg','Conair-Man05-67222e9944d4e.jpg','144483','jpg','2024-10-30 13:03:21',1,'1672534757'),(53,13,35,144,1,0,'Conair-Man07.jpg','Conair-Man07-6722488474a6a.jpg','53091','jpg','2024-10-30 14:53:56',4,'8688669044'),(54,13,35,144,1,0,'CooperRivet01.jpg','CooperRivet01-672248849ec9b.jpg','234814','jpg','2024-10-30 14:53:56',4,'8688669044'),(55,13,35,144,1,0,'CooperRivet02.jpg','CooperRivet02-67224884aad16.jpg','132151','jpg','2024-10-30 14:53:56',4,'8688669044'),(56,13,35,144,1,0,'CooperRivet02.jpg','CooperRivet02-67224a5310e64.jpg','132151','jpg','2024-10-30 15:01:39',5,'5409775617'),(57,13,35,144,1,0,'Demolition04.jpg','Demolition04-67229174d89c5.jpg','56112','jpg','2024-10-30 20:05:08',5,'7099995719'),(58,13,35,144,1,0,'DemolitionPlatinium.jpg','DemolitionPlatinium-672291750db0c.jpg','106541','jpg','2024-10-30 20:05:09',5,'7099995719'),(59,13,35,144,1,0,'DemolitionPlatinium01.jpg','DemolitionPlatinium01-6722917519879.jpg','197562','jpg','2024-10-30 20:05:09',5,'7099995719'),(60,13,35,144,1,0,'commandeTest.pdf','commandeTest-6723b06793265.pdf','72844','pdf','2024-10-31 16:29:29',1,'3450187063'),(61,13,35,144,1,0,'infoServer.txt','infoServer-6723b06c5c89c.txt','96','txt','2024-10-31 16:29:33',1,'3450187063'),(62,13,35,144,1,0,'stock_table.sql','stock-table-6723b06d564c2.txt','2170','sql','2024-10-31 16:29:33',1,'3450187063'),(63,36,13,144,1,0,'Dash02.jpg','Dash02-674e432928dbc.jpg','117518','jpg','2024-12-02 23:30:49',4,'9881613960'),(64,35,13,144,1,0,'Dash03.jpg','Dash03-6767262cf1da2.jpg','139002','jpg','2024-12-21 20:33:49',1,'2378369595'),(65,13,36,144,1,0,'screen02.jpg','screen02-67b3121c5cccd.jpg','29712','jpg','2025-02-17 10:40:28',4,'7288086377'),(66,13,36,144,1,0,'screen02.jpg','screen02-67b3122302870.jpg','29712','jpg','2025-02-17 10:40:35',4,'8994785937'),(67,13,36,144,1,0,'6d4c8093-23c5-4666-a4ff-22a1049aa679.jpeg','6d4c8093-23c5-4666-a4ff-22a1049aa679-67b34ad6432d2.jpg','108052','jpeg','2025-02-17 14:42:30',1,'5696529452');
/*!40000 ALTER TABLE `chat_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_file_chat_file`
--

DROP TABLE IF EXISTS `chat_file_chat_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_file_chat_file` (
  `chat_file_source` int NOT NULL,
  `chat_file_target` int NOT NULL,
  PRIMARY KEY (`chat_file_source`,`chat_file_target`),
  KEY `IDX_B2FA9A3AD8EFAE54` (`chat_file_source`),
  KEY `IDX_B2FA9A3AC10AFEDB` (`chat_file_target`),
  CONSTRAINT `FK_B2FA9A3AC10AFEDB` FOREIGN KEY (`chat_file_target`) REFERENCES `chat_file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B2FA9A3AD8EFAE54` FOREIGN KEY (`chat_file_source`) REFERENCES `chat_file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file_chat_file`
--

LOCK TABLES `chat_file_chat_file` WRITE;
/*!40000 ALTER TABLE `chat_file_chat_file` DISABLE KEYS */;
INSERT INTO `chat_file_chat_file` VALUES (4,3),(5,4),(19,11),(21,20),(25,24),(27,26),(33,23),(38,37),(39,37),(40,37),(56,52),(57,56),(58,56),(59,56);
/*!40000 ALTER TABLE `chat_file_chat_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_file_chat_message`
--

DROP TABLE IF EXISTS `chat_file_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_file_chat_message` (
  `chat_file_id` int NOT NULL,
  `chat_message_id` int NOT NULL,
  PRIMARY KEY (`chat_file_id`,`chat_message_id`),
  KEY `IDX_BC0D9545DFC5B505` (`chat_file_id`),
  KEY `IDX_BC0D9545948B568F` (`chat_message_id`),
  CONSTRAINT `FK_BC0D9545948B568F` FOREIGN KEY (`chat_message_id`) REFERENCES `chat_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BC0D9545DFC5B505` FOREIGN KEY (`chat_file_id`) REFERENCES `chat_file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file_chat_message`
--

LOCK TABLES `chat_file_chat_message` WRITE;
/*!40000 ALTER TABLE `chat_file_chat_message` DISABLE KEYS */;
INSERT INTO `chat_file_chat_message` VALUES (24,25),(26,25),(28,1),(29,2),(30,1),(31,35),(32,35),(34,28),(36,42),(44,59),(53,78),(54,78),(55,78),(63,111),(65,235),(66,235);
/*!40000 ALTER TABLE `chat_file_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_item_category`
--

DROP TABLE IF EXISTS `chat_item_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_item_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_item_category`
--

LOCK TABLES `chat_item_category` WRITE;
/*!40000 ALTER TABLE `chat_item_category` DISABLE KEYS */;
INSERT INTO `chat_item_category` VALUES (1,'A','Not a response'),(2,'B','Text response to a text'),(3,'C','Text response to a file'),(4,'D','File response to a text'),(5,'E','File response to a file');
/*!40000 ALTER TABLE `chat_item_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `project_id` int NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `alerted` tinyint(1) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `chatMessageCategory_id` int NOT NULL,
  `chat_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FAB3FC164C8212DB` (`chatMessageCategory_id`),
  KEY `IDX_FAB3FC16A76ED395` (`user_id`),
  KEY `IDX_FAB3FC16CD53EDB6` (`receiver_id`),
  KEY `IDX_FAB3FC16166D1F9C` (`project_id`),
  CONSTRAINT `FK_FAB3FC16166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_FAB3FC164C8212DB` FOREIGN KEY (`chatMessageCategory_id`) REFERENCES `chat_item_category` (`id`),
  CONSTRAINT `FK_FAB3FC16A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_FAB3FC16CD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (1,13,8,8,1,1,'2024-04-08 13:07:46',1,'12'),(2,13,8,8,1,1,'2024-04-08 13:40:04',1,'56'),(3,13,8,8,1,1,'2024-04-08 13:58:26',2,'g'),(4,13,8,8,1,1,'2024-04-08 14:14:06',1,'456'),(5,13,8,8,1,1,'2024-04-08 14:16:54',2,'12'),(6,13,8,8,1,1,'2024-04-08 14:20:35',1,'46'),(7,13,8,8,1,1,'2024-04-08 14:20:54',2,'r46'),(8,13,8,8,1,1,'2024-04-08 15:22:39',3,'456'),(9,13,8,8,1,1,'2024-04-08 15:41:57',1,'123'),(10,13,8,8,1,1,'2024-04-08 15:42:32',2,'321'),(11,13,8,8,1,1,'2024-04-08 15:55:35',1,'123'),(12,13,8,8,1,1,'2024-04-08 16:05:55',1,'cvb'),(13,13,8,8,1,1,'2024-04-08 16:06:52',1,'12'),(14,13,8,8,1,1,'2024-04-08 16:19:23',1,'1'),(15,13,8,8,1,1,'2024-04-08 16:20:23',1,'1'),(16,13,8,8,1,1,'2024-04-08 16:22:19',1,'2'),(17,13,8,8,1,1,'2024-04-08 16:31:51',1,'4'),(18,13,8,8,1,1,'2024-04-08 16:32:28',1,'2'),(22,13,8,8,1,1,'2024-04-08 17:49:12',3,'Text also'),(23,13,8,8,1,1,'2024-04-09 00:56:11',3,'rep photo'),(24,13,8,8,1,1,'2024-04-09 00:56:52',3,'rep file'),(25,13,8,8,1,1,'2024-04-09 18:19:26',1,'foo'),(26,13,8,8,1,1,'2024-04-09 18:21:57',2,'foo reply'),(27,13,8,8,1,1,'2024-04-09 18:22:18',3,'resume reply'),(28,13,8,8,1,1,'2024-04-10 17:01:01',2,'123'),(29,13,8,8,1,1,'2024-04-10 17:04:19',2,'foo'),(33,13,8,8,1,1,'2024-04-10 17:16:05',1,'784'),(34,13,8,8,1,1,'2024-04-10 17:16:42',1,'aze'),(35,13,8,8,1,1,'2024-04-10 17:17:26',1,'po'),(36,13,8,8,1,1,'2024-04-10 17:30:52',2,'78'),(37,13,8,8,1,1,'2024-04-10 17:31:38',2,'pm'),(39,8,13,8,1,1,'2024-04-15 13:15:01',2,'rep 4'),(40,8,13,8,1,1,'2024-04-15 13:16:41',3,'rep img diesel'),(41,13,8,8,1,1,'2024-04-15 14:28:26',2,'Ok to rep 4'),(42,13,8,8,1,1,'2024-04-15 14:28:51',2,'Ok to OK to rep 4'),(43,13,8,8,1,1,'2024-04-15 14:31:59',2,'Image Ok to Ok to Ok to Rep 4'),(44,13,8,8,1,1,'2024-04-15 15:38:01',3,'ok'),(45,13,8,8,1,1,'2024-04-15 18:04:13',1,'123'),(46,8,13,8,1,1,'2024-04-15 19:20:14',1,'Got it'),(47,8,13,8,0,1,'2024-04-15 21:58:05',1,'Hello Jane\nIs there any update'),(48,8,13,8,0,1,'2024-04-15 22:19:41',1,'confirme it please'),(49,8,13,8,0,1,'2024-04-15 22:44:06',1,'I\'m fine'),(50,8,13,8,1,1,'2024-04-15 23:26:50',2,'Nice'),(51,8,13,8,1,1,'2024-04-16 00:36:53',1,'Thanks'),(52,13,13,141,1,1,'2024-10-03 20:23:41',1,'Test'),(53,35,13,129,1,1,'2024-10-03 20:57:22',1,'123'),(54,35,13,129,1,1,'2024-10-03 20:58:07',1,'456'),(55,36,13,144,1,1,'2024-10-26 00:18:59',1,'123'),(56,36,13,144,1,1,'2024-10-26 00:23:04',1,'123'),(57,35,13,144,1,1,'2024-10-26 11:06:31',1,'Hello,\nI\'m ready'),(58,35,13,144,1,1,'2024-10-26 11:11:22',1,'Foo'),(59,35,13,144,1,1,'2024-10-26 11:54:34',1,'123'),(60,35,13,144,1,1,'2024-10-26 11:56:31',1,'I\'m ready'),(61,13,35,144,1,1,'2024-10-26 14:48:00',1,'Okay'),(62,13,35,144,1,1,'2024-10-26 14:48:29',1,'This are the files'),(63,13,36,144,1,1,'2024-10-26 14:54:54',1,'aze'),(64,13,36,144,1,1,'2024-10-26 15:09:47',1,'aze'),(65,35,13,144,1,1,'2024-10-27 20:05:44',1,'Cool'),(66,13,13,144,1,1,'2024-10-27 22:14:57',2,'Aze reply'),(67,13,13,144,1,1,'2024-10-27 22:19:11',1,'foo'),(68,13,13,144,1,1,'2024-10-27 22:52:24',1,'foo'),(69,13,35,144,1,1,'2024-10-27 23:11:22',1,'foo'),(70,35,13,144,1,1,'2024-10-27 23:14:13',1,'bar'),(71,35,13,144,1,1,'2024-10-27 23:14:59',2,'baz'),(72,13,35,144,1,1,'2024-10-27 23:17:02',2,'tata'),(73,13,35,144,1,1,'2024-10-29 18:05:13',2,'Reply to cool wih text and image'),(74,13,35,144,1,1,'2024-10-29 21:39:44',2,'The 123 Conair'),(75,13,35,144,1,1,'2024-10-29 22:02:41',1,'Replying to an image with a text and an image'),(76,13,35,144,1,0,'2024-10-30 13:21:36',1,'Image reply'),(77,13,35,144,1,0,'2024-10-30 13:24:28',1,'Image reply 02\n'),(78,13,35,144,1,0,'2024-10-30 13:28:01',3,'Image reply 03\n'),(79,13,35,144,1,0,'2024-10-31 17:05:42',1,'foo test'),(80,13,35,144,1,0,'2024-10-31 17:48:29',2,'Okay'),(82,13,35,144,1,0,'2024-10-31 18:51:50',2,'456'),(83,13,35,144,1,0,'2024-11-11 14:26:12',2,'Re Cool'),(84,13,35,144,1,0,'2024-11-18 23:49:02',3,'File reply'),(85,13,35,144,1,0,'2024-11-18 23:52:26',2,'Reply on my own text'),(86,13,35,144,1,0,'2024-11-18 23:52:26',2,'Reply on my own text'),(87,13,35,144,1,0,'2024-11-19 23:13:29',1,'FOo'),(88,35,13,144,1,0,'2024-11-21 10:32:33',1,'baAr'),(89,35,13,144,1,0,'2024-11-22 00:29:48',1,'Bar'),(90,13,35,144,1,0,'2024-11-22 00:39:12',2,'Okay'),(91,35,13,144,1,0,'2024-11-22 01:58:20',1,'2332323'),(92,13,35,144,1,0,'2024-11-29 18:20:06',1,'azerty'),(93,13,35,144,1,0,'2024-11-29 18:25:59',1,'boo'),(94,13,35,144,1,0,'2024-11-29 18:33:48',1,'123'),(95,13,35,144,1,0,'2024-11-29 18:35:16',1,'this'),(96,35,13,144,1,0,'2024-11-29 18:37:47',1,'that'),(97,35,13,144,1,0,'2024-11-29 18:40:54',1,'tho'),(98,35,13,144,1,0,'2024-11-29 18:41:07',1,'tho'),(99,35,13,144,1,0,'2024-11-29 18:50:58',1,'100'),(100,35,13,144,1,0,'2024-11-29 18:55:24',1,'456'),(101,35,13,144,1,0,'2024-11-29 19:28:37',1,'200'),(102,35,13,144,1,0,'2024-11-29 19:31:49',1,'789'),(103,35,13,144,1,0,'2024-11-29 20:14:42',1,'56'),(104,13,35,144,1,0,'2024-11-29 22:39:32',1,'foo'),(105,35,13,144,1,0,'2024-11-29 22:41:40',1,'Bay'),(106,35,13,144,1,0,'2024-11-29 23:17:17',1,'123'),(107,35,13,144,1,0,'2024-11-29 23:32:44',1,'7875'),(108,13,36,144,1,0,'2024-12-02 17:49:28',1,'123'),(109,13,35,144,1,0,'2024-12-02 20:18:53',1,'Test'),(110,36,13,144,1,0,'2024-12-02 22:16:07',1,'Sure'),(111,13,36,144,1,0,'2024-12-02 23:25:42',1,'123'),(112,36,13,144,1,0,'2024-12-02 23:30:40',2,'456'),(113,13,36,144,1,0,'2024-12-10 15:45:48',1,'de\nde\nde\nde\nde\nde\nde\nde\nde\ned'),(115,13,36,144,1,0,'2024-12-10 19:47:10',1,'Foo bar'),(116,13,36,144,1,0,'2024-12-10 19:51:44',1,'Foooooooo'),(117,13,36,144,1,0,'2024-12-10 20:17:03',1,'123 456 789'),(118,13,36,144,1,0,'2024-12-10 21:12:28',1,'A\nB\nC'),(119,36,13,144,1,0,'2024-12-10 23:39:21',1,'Dooo'),(120,36,13,144,1,0,'2024-12-10 23:48:04',1,'Barr'),(121,13,36,144,1,0,'2024-12-10 23:57:17',1,'123456'),(122,36,13,144,1,0,'2024-12-11 00:02:28',1,'789789'),(123,13,36,144,1,0,'2024-12-11 00:08:56',1,'123456'),(124,36,13,144,1,0,'2024-12-11 00:16:33',1,'D test'),(125,13,36,144,1,0,'2024-12-11 07:30:51',1,'1231263'),(126,36,13,144,1,0,'2024-12-11 07:47:04',1,'Foooo'),(127,13,36,144,1,0,'2024-12-11 08:10:15',1,'azzz'),(128,35,13,144,1,0,'2024-12-21 20:31:34',1,'Foo bar'),(129,13,36,144,1,0,'2024-12-23 11:35:28',1,'123'),(130,36,13,144,1,0,'2024-12-23 14:50:58',1,'Hello Jane'),(131,36,13,144,1,0,'2024-12-23 17:46:51',1,'Send me the data'),(132,36,13,144,1,0,'2024-12-23 17:47:31',1,'Please, thank you'),(136,36,13,144,1,0,'2024-12-27 11:02:36',1,'Foo bar'),(140,35,13,144,1,0,'2024-12-27 12:05:06',1,'123'),(141,35,13,144,0,0,'2024-12-28 11:19:20',1,'Foo'),(142,35,13,144,1,0,'2024-12-28 11:30:54',1,'Bar baz'),(143,35,13,144,1,0,'2024-12-28 11:40:47',1,'123'),(144,35,13,144,1,0,'2024-12-28 11:41:01',1,'789'),(145,35,13,144,1,0,'2024-12-28 11:47:21',1,'5555'),(146,35,13,144,1,0,'2024-12-28 11:50:41',1,'2222'),(147,35,13,144,1,0,'2024-12-28 11:51:24',1,'++++++'),(148,35,13,144,1,0,'2024-12-28 11:52:10',1,'-----'),(149,35,13,144,1,0,'2024-12-28 11:55:27',1,'ddd'),(150,35,13,144,1,0,'2024-12-28 12:16:19',1,'oky'),(151,35,13,144,1,0,'2024-12-28 12:29:20',1,'111'),(152,35,13,144,1,0,'2024-12-28 12:32:05',1,'123456789'),(153,35,13,144,1,0,'2024-12-28 12:35:29',1,'Test'),(154,35,13,144,1,0,'2024-12-28 12:45:04',1,'Test 02'),(155,35,13,144,1,0,'2024-12-28 12:50:06',1,'Test 05'),(156,35,13,144,1,0,'2024-12-28 12:50:55',1,'Test 06'),(157,35,13,144,1,0,'2024-12-28 17:57:44',1,'123'),(158,35,13,144,1,0,'2024-12-29 10:28:12',1,'test25'),(159,35,13,144,1,0,'2024-12-29 10:28:26',1,'test25'),(161,35,13,144,1,0,'2024-12-30 09:33:38',1,'Foo test to Jane'),(162,13,35,144,1,0,'2024-12-30 09:48:51',1,'Momo'),(163,35,13,144,1,0,'2024-12-30 09:52:31',1,'457'),(164,13,35,144,1,0,'2024-12-30 12:48:05',1,'Message to sales'),(165,35,13,144,1,0,'2024-12-30 13:10:19',1,'Message to Jane'),(166,13,35,144,1,0,'2025-02-10 13:28:31',1,'122'),(167,13,35,144,1,0,'2025-02-10 13:31:08',1,'abc'),(168,13,35,144,1,0,'2025-02-10 13:43:58',1,'qsd'),(169,13,35,144,1,0,'2025-02-10 14:00:15',1,'789'),(170,13,35,144,1,0,'2025-02-10 14:06:58',1,'789'),(174,13,35,144,1,0,'2025-02-10 15:13:27',1,'aaa'),(175,13,35,144,1,0,'2025-02-10 15:52:22',1,'goo'),(176,13,35,144,1,0,'2025-02-10 15:54:44',1,'bbbb'),(177,13,35,144,1,0,'2025-02-10 16:03:51',1,'123'),(178,13,35,144,1,0,'2025-02-10 16:04:13',1,'456'),(179,13,35,144,1,0,'2025-02-10 16:06:22',1,'aze'),(180,13,35,144,1,0,'2025-02-10 16:15:18',1,'aze2'),(181,13,35,144,1,0,'2025-02-10 16:18:45',1,'aze3'),(182,13,35,144,1,0,'2025-02-10 16:34:21',1,'888'),(183,13,35,144,1,0,'2025-02-10 16:39:37',1,'tttt'),(184,13,35,144,1,0,'2025-02-10 16:41:19',1,'121212'),(190,35,13,144,1,0,'2025-02-10 17:54:25',1,'Okay'),(191,35,13,144,1,0,'2025-02-10 18:16:45',1,'foo'),(192,13,35,144,1,0,'2025-02-10 18:27:25',1,'baz'),(193,13,35,144,1,0,'2025-02-10 18:29:20',1,'123'),(194,35,13,144,1,0,'2025-02-10 20:45:48',1,'Foo message'),(195,35,13,144,1,0,'2025-02-10 20:46:37',1,'Bar\nBaz'),(196,35,13,144,1,0,'2025-02-11 21:31:38',1,'Okay'),(197,35,13,144,1,0,'2025-02-11 21:31:53',1,'Okay'),(198,35,13,144,1,0,'2025-02-11 21:32:36',1,'123'),(199,35,13,144,1,0,'2025-02-11 22:15:48',1,'Hello Jane'),(200,36,13,144,1,0,'2025-02-14 13:57:25',1,'Hello jane'),(201,13,36,144,1,0,'2025-02-14 14:58:38',1,'Hello video'),(202,36,13,144,1,0,'2025-02-14 15:14:15',2,'Hello Jane'),(203,36,13,144,1,0,'2025-02-14 15:15:38',1,'How\'re you doing'),(204,13,36,144,1,0,'2025-02-14 15:25:43',1,'Hello video'),(205,36,13,144,1,0,'2025-02-14 15:43:25',1,'Hello Jane'),(206,36,13,144,1,0,'2025-02-14 15:51:40',1,'Hello Video'),(207,13,36,144,1,0,'2025-02-14 15:53:25',1,'Hello video'),(208,36,13,144,1,0,'2025-02-14 18:05:55',1,'Hello Jane'),(209,13,36,144,1,0,'2025-02-15 13:47:57',1,'Hello video!'),(210,13,36,144,1,0,'2025-02-15 13:49:18',1,'Hello video!'),(211,36,13,144,1,0,'2025-02-15 13:52:19',1,'Hello Jane!'),(212,36,13,144,1,0,'2025-02-15 16:29:35',1,'Tout va bien'),(213,13,36,144,1,0,'2025-02-15 20:47:31',1,'cool'),(214,13,36,144,1,0,'2025-02-15 21:29:54',1,'123'),(215,36,13,144,1,0,'2025-02-15 21:44:09',1,'Okay'),(216,13,36,144,1,0,'2025-02-15 21:45:16',1,'cool'),(217,13,36,144,1,0,'2025-02-15 23:26:46',1,'Okay'),(218,36,13,144,1,0,'2025-02-15 23:52:23',1,'cool'),(219,13,36,144,1,0,'2025-02-16 12:59:40',1,'Hello'),(220,13,36,144,1,0,'2025-02-16 13:02:59',1,'Foo'),(221,36,13,144,1,0,'2025-02-16 13:24:54',1,'bar'),(222,13,36,144,1,0,'2025-02-16 13:32:05',1,'Baz'),(223,13,36,144,1,0,'2025-02-16 14:05:30',1,'123'),(224,13,36,144,1,0,'2025-02-16 14:16:33',1,'500'),(225,13,36,144,1,0,'2025-02-16 14:44:03',1,'123'),(226,13,36,144,1,0,'2025-02-16 14:44:45',1,'456'),(227,36,13,144,1,0,'2025-02-16 14:46:34',1,'123'),(228,36,13,144,1,0,'2025-02-16 14:48:01',1,'10'),(229,13,36,144,1,0,'2025-02-16 14:54:05',1,'120'),(230,13,36,144,1,0,'2025-02-16 15:04:16',1,'final'),(231,13,36,144,1,0,'2025-02-16 15:09:55',1,'800'),(232,13,36,144,1,0,'2025-02-16 15:14:37',1,'600'),(233,13,36,144,1,0,'2025-02-17 07:54:32',1,'Tere hommikust'),(234,13,36,144,1,0,'2025-02-17 08:27:30',1,'Tere Kulake'),(235,36,13,144,1,0,'2025-02-17 09:12:05',1,'Kuidas sul laheb'),(237,13,36,144,1,0,'2025-02-17 10:16:43',2,'Mul laheb hasti, tanan');
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message_chat_file`
--

DROP TABLE IF EXISTS `chat_message_chat_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message_chat_file` (
  `chat_message_id` int NOT NULL,
  `chat_file_id` int NOT NULL,
  PRIMARY KEY (`chat_message_id`,`chat_file_id`),
  KEY `IDX_A59A7FBE948B568F` (`chat_message_id`),
  KEY `IDX_A59A7FBEDFC5B505` (`chat_file_id`),
  CONSTRAINT `FK_A59A7FBE948B568F` FOREIGN KEY (`chat_message_id`) REFERENCES `chat_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A59A7FBEDFC5B505` FOREIGN KEY (`chat_file_id`) REFERENCES `chat_file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message_chat_file`
--

LOCK TABLES `chat_message_chat_file` WRITE;
/*!40000 ALTER TABLE `chat_message_chat_file` DISABLE KEYS */;
INSERT INTO `chat_message_chat_file` VALUES (8,4),(22,11),(23,19),(24,21),(27,24),(40,35),(44,38),(78,52),(84,62);
/*!40000 ALTER TABLE `chat_message_chat_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message_chat_message`
--

DROP TABLE IF EXISTS `chat_message_chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_message_chat_message` (
  `chat_message_source` int NOT NULL,
  `chat_message_target` int NOT NULL,
  PRIMARY KEY (`chat_message_source`,`chat_message_target`),
  KEY `IDX_348A40FF7E5B6C61` (`chat_message_source`),
  KEY `IDX_348A40FF67BE3CEE` (`chat_message_target`),
  CONSTRAINT `FK_348A40FF67BE3CEE` FOREIGN KEY (`chat_message_target`) REFERENCES `chat_message` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_348A40FF7E5B6C61` FOREIGN KEY (`chat_message_source`) REFERENCES `chat_message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message_chat_message`
--

LOCK TABLES `chat_message_chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message_chat_message` DISABLE KEYS */;
INSERT INTO `chat_message_chat_message` VALUES (3,2),(5,4),(7,6),(10,9),(26,25),(28,1),(29,1),(36,35),(37,26),(39,17),(41,39),(42,41),(43,42),(50,49),(66,63),(71,69),(72,71),(73,65),(74,59),(80,79),(83,65),(85,82),(86,82),(90,89),(112,111),(202,201),(237,235);
/*!40000 ALTER TABLE `chat_message_chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `contactsList_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4C62E638C6E5798F` (`contactsList_id`),
  CONSTRAINT `FK_4C62E638C6E5798F` FOREIGN KEY (`contactsList_id`) REFERENCES `contactslist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (159,'','josephine_darakjy@darakjy.org','',11),(160,'','art@venere.org','',11),(161,'','lpaprocki@hotmail.com','',11),(162,'','donette.foller@cox.net','',11),(163,'','simona@morasca.com','',11),(164,'','mitsue_tollner@yahoo.com','',11),(165,'','leota@hotmail.com','',11),(166,'','sage_wieser@cox.net','',11),(167,'','kris@gmail.com','',11),(168,'','minna_amigon@yahoo.com','',11),(169,'','amaclead@gmail.com','',11),(170,'','kiley.caldarera@aol.com','',11),(171,'','gruta@cox.net','',11),(172,'','calbares@gmail.com','',11),(173,'','mattie@aol.com','',11),(174,'','meaghan@hotmail.com','',11),(175,'','gladys.rim@rim.org','',11),(176,'','yuki_whobrey@aol.com','',11),(177,'','fletcher.flosi@yahoo.com','',11),(178,'','bette_nicka@cox.net','',11),(179,'','vinouye@aol.com','',11),(180,'','willard@hotmail.com','',11),(181,'','mroyster@royster.com','',11),(182,'','alisha@slusarski.com','',11),(183,'','allene_iturbide@cox.net','',11),(184,'','chanel.caudy@caudy.org','',11),(185,'','ezekiel@chui.com','',11),(186,'','wkusko@yahoo.com','',11),(187,'','bfigeroa@aol.com','',11),(188,'','ammie@corrio.com','',11),(189,'','francine_vocelka@vocelka.com','',11),(190,'','ernie_stenseth@aol.com','',11),(191,'','albina@glick.com','',11),(192,'','asergi@gmail.com','',11),(193,'','solange@shinko.com','',11),(194,'','jose@yahoo.com','',11),(195,'','rozella.ostrosky@ostrosky.com','',11),(196,'','valentine_gillian@gmail.com','',11),(197,'','kati.rulapaugh@hotmail.com','',11),(198,'','youlanda@aol.com','',11),(199,'','doldroyd@aol.com','',11),(200,'','roxane@hotmail.com','',11),(201,'','lperin@perin.org','',11),(202,'','erick.ferencz@aol.com','',11),(203,'','fsaylors@saylors.org','',11),(204,'','jina_briddick@briddick.com','',11),(205,'Foo','kanisha_waycott@yahoo.com','',11),(206,'','kanisha_waycott@yahoo.com','',11),(207,'','emerson.bowley@bowley.org','',11),(208,'','bmalet@yahoo.com','',11),(209,'testor05','abc200@aza.com','',2),(210,'testor06','abc206@aza.com','',2),(211,'testor07','abc207@aza.com','',2),(212,'testor08','abc208@aza.com','',2),(213,'testor09','abc209@aza.com','',2);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactslist`
--

DROP TABLE IF EXISTS `contactslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactslist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C83417DCA76ED395` (`user_id`),
  CONSTRAINT `FK_C83417DCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactslist`
--

LOCK TABLES `contactslist` WRITE;
/*!40000 ALTER TABLE `contactslist` DISABLE KEYS */;
INSERT INTO `contactslist` VALUES (2,13,'123','123','2024-09-17 23:49:19'),(10,13,'123 456 2544','123 456 784t','2024-09-18 00:55:33'),(11,13,'Foo bar baz','Foo bar baz','2024-09-22 22:16:10');
/*!40000 ALTER TABLE `contactslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invitation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `receiver_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` int NOT NULL,
  `status` int NOT NULL,
  `date_sending` datetime NOT NULL,
  `Project_id` int DEFAULT NULL,
  `receiver_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F11D61A2A76ED395` (`user_id`),
  KEY `IDX_F11D61A259301C4C` (`Project_id`),
  CONSTRAINT `FK_BE40627259301C4C` FOREIGN KEY (`Project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_BE406272A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitation`
--

LOCK TABLES `invitation` WRITE;
/*!40000 ALTER TABLE `invitation` DISABLE KEYS */;
INSERT INTO `invitation` VALUES (375,13,'testor06@test.com',1,4,'2024-08-15 00:00:00',117,'Testor06','2024-08-12 19:21:18'),(376,13,'testor04@test.com',1,4,'2024-08-15 00:00:00',117,'Testor04','2024-08-12 19:21:18'),(377,13,'jane@diamta.com',2,4,'2024-08-15 00:00:00',117,'jane','2024-08-12 20:14:43'),(381,13,'jane@diamta.com',4,4,'2024-08-17 00:00:00',121,'Jane','2024-08-17 23:45:09'),(382,13,'sales@diamta.com',13,4,'2024-08-18 15:28:38',124,'André Douvier','2024-08-18 15:28:38'),(383,13,'sales@diamta.com',1,4,'2024-08-28 16:19:21',125,'Diamta','2024-08-28 16:19:21'),(384,13,'sales@diamta.com',1,4,'2024-08-28 16:38:02',126,'bar','2024-08-28 16:38:02'),(385,13,'sales@diamta.com',2,4,'2024-08-28 00:00:00',127,'sales','2024-08-28 16:40:17'),(386,13,'sales@diamta.com',6,4,'2024-08-28 00:00:00',128,'André Douvier','2024-08-28 16:49:17'),(387,13,'yaosoft@hotmail.com',1,4,'2024-08-29 15:48:31',129,'Testeur10','2024-08-29 15:48:31'),(388,8,'sales@diamta.com',1,4,'2024-08-29 15:48:31',129,'Testeur10','2024-08-29 15:48:31'),(389,13,'sales@diamta.com',1,4,'2024-09-07 01:39:53',130,'Roger','2024-09-07 01:39:53'),(390,13,'sales@diamta.com',1,4,'2024-09-07 01:40:36',131,'Roger','2024-09-07 01:40:36'),(391,13,'sales@diamta.com',1,4,'2024-09-07 01:45:27',132,'testor02','2024-09-07 01:45:27'),(392,13,'sales@diamta.com',1,4,'2024-09-07 01:52:23',133,'testor02','2024-09-07 01:52:23'),(393,13,'sales@diamta.com',1,4,'2024-09-07 02:03:32',134,'testor02','2024-09-07 02:03:32'),(394,13,'sales@diamta.com',1,4,'2024-09-07 02:04:05',135,'testor02','2024-09-07 02:04:05'),(395,13,'sales@diamta.com',1,4,'2024-09-07 02:04:17',136,'testor02','2024-09-07 02:04:17'),(396,13,'sales@diamta.com',1,4,'2024-09-07 02:06:13',137,'testor05','2024-09-07 02:06:13'),(397,13,'sales@diamta.com',1,4,'2024-09-07 02:11:32',138,'testor05','2024-09-07 02:11:32'),(398,13,'sales@diamta.com',1,4,'2024-10-02 00:00:00',138,'Diamta','2024-10-02 07:26:49'),(399,13,'sales@diamta.com',1,4,'2024-10-02 10:47:04',139,'Foo','2024-10-02 10:47:04'),(400,13,'yaosoft@hotmail.com',2,4,'2024-10-02 00:00:00',141,'yaosoft@hotmail.com','2024-10-02 12:07:30'),(401,13,'yaosoft@hotmail.com',4,4,'2024-10-02 12:07:30',142,'yaosoft@hotmail.com','2024-10-02 12:07:30'),(402,13,'yaosoft@hotmail.com',3,4,'2024-10-25 16:08:13',143,'yaosoft@hotmail.com','2024-10-25 16:08:13'),(403,13,'yaosoft@hotmail.com',1,4,'2024-10-25 21:45:13',144,'yaosoft@hotmail.com','2024-10-25 21:45:13'),(404,13,'sales@diamta.com',3,4,'2024-10-25 21:45:13',144,'sales@diamta.com','2024-10-25 21:45:13'),(405,13,'videocm01@gmail.com',8,4,'2024-10-25 21:45:13',144,'videocm01@gmail.com','2024-10-25 21:45:13');
/*!40000 ALTER TABLE `invitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  `project_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FA76ED395` (`user_id`),
  KEY `IDX_B6BD307FCD53EDB6` (`receiver_id`),
  KEY `IDX_B6BD307F166D1F9C` (`project_id`),
  CONSTRAINT `FK_B6BD307F166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_B6BD307FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_B6BD307FCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupation`
--

LOCK TABLES `occupation` WRITE;
/*!40000 ALTER TABLE `occupation` DISABLE KEYS */;
INSERT INTO `occupation` VALUES (4,'Accountants and Auditors'),(5,'Actors'),(6,'Actuaries'),(7,'Acupuncturists'),(8,'Acute Care Nurses'),(9,'Adapted Physical Education Specialists'),(10,'Adhesive Bonding Machine Operators and Tenders'),(11,'Administrative Law Judges, Adjudicators, and Hearing Officers'),(12,'Administrative Services Managers'),(13,'Adult Basic Education, Adult Secondary Education, and English as a Second Language Instructors'),(14,'Advanced Practice Psychiatric Nurses'),(15,'Advertising and Promotions Managers'),(16,'Advertising Sales Agents'),(17,'Aerospace Engineering and Operations Technologists and Technicians'),(18,'Aerospace Engineers'),(19,'Agents and Business Managers of Artists, Performers, and Athletes'),(20,'Agricultural Engineers'),(21,'Agricultural Equipment Operators'),(22,'Agricultural Inspectors'),(23,'Agricultural Sciences Teachers, Postsecondary'),(24,'Agricultural Technicians'),(25,'Agricultural Workers, All Other'),(26,'Air Crew Members'),(27,'Air Crew Officers'),(28,'Air Traffic Controllers'),(29,'Aircraft Cargo Handling Supervisors'),(30,'Aircraft Launch and Recovery Officers'),(31,'Aircraft Launch and Recovery Specialists'),(32,'Aircraft Mechanics and Service Technicians'),(33,'Aircraft Service Attendants'),(34,'Aircraft Structure, Surfaces, Rigging, and Systems Assemblers'),(35,'Airfield Operations Specialists'),(36,'Airline Pilots, Copilots, and Flight Engineers'),(37,'Allergists and Immunologists'),(38,'Ambulance Drivers and Attendants, Except Emergency Medical Technicians'),(39,'Amusement and Recreation Attendants'),(40,'Anesthesiologist Assistants'),(41,'Anesthesiologists'),(42,'Animal Breeders'),(43,'Animal Caretakers'),(44,'Animal Control Workers'),(45,'Animal Scientists'),(46,'Animal Trainers'),(47,'Anthropologists and Archeologists'),(48,'Anthropology and Archeology Teachers, Postsecondary'),(49,'Appraisers and Assessors of Real Estate'),(50,'Appraisers of Personal and Business Property'),(51,'Arbitrators, Mediators, and Conciliators'),(52,'Architects, Except Landscape and Naval'),(53,'Architectural and Civil Drafters'),(54,'Architectural and Engineering Managers'),(55,'Architecture Teachers, Postsecondary'),(56,'Archivists'),(57,'Area, Ethnic, and Cultural Studies Teachers, Postsecondary'),(58,'Armored Assault Vehicle Crew Members'),(59,'Armored Assault Vehicle Officers'),(60,'Art Directors'),(61,'Art Therapists'),(62,'Art, Drama, and Music Teachers, Postsecondary'),(63,'Artillery and Missile Crew Members'),(64,'Artillery and Missile Officers'),(65,'Artists and Related Workers, All Other'),(66,'Assemblers and Fabricators, All Other'),(67,'Astronomers'),(68,'Athletes and Sports Competitors'),(69,'Athletic Trainers'),(70,'Atmospheric and Space Scientists'),(71,'Atmospheric, Earth, Marine, and Space Sciences Teachers, Postsecondary'),(72,'Audio and Video Technicians'),(73,'Audiologists'),(74,'Audiovisual Equipment Installers and Repairers'),(75,'Automotive and Watercraft Service Attendants'),(76,'Automotive Body and Related Repairers'),(77,'Automotive Engineering Technicians'),(78,'Automotive Engineers'),(79,'Automotive Glass Installers and Repairers'),(80,'Automotive Service Technicians and Mechanics'),(81,'Aviation Inspectors'),(82,'Avionics Technicians'),(83,'Baggage Porters and Bellhops'),(84,'Bailiffs'),(85,'Bakers'),(86,'Barbers'),(87,'Baristas'),(88,'Bartenders'),(89,'Bicycle Repairers'),(90,'Bill and Account Collectors'),(91,'Billing and Posting Clerks'),(92,'Biochemists and Biophysicists'),(93,'Bioengineers and Biomedical Engineers'),(94,'Biofuels Processing Technicians'),(95,'Biofuels Production Managers'),(96,'Biofuels/Biodiesel Technology and Product Development Managers'),(97,'Bioinformatics Scientists'),(98,'Bioinformatics Technicians'),(99,'Biological Science Teachers, Postsecondary'),(100,'Biological Scientists, All Other'),(101,'Biological Technicians'),(102,'Biologists'),(103,'Biomass Plant Technicians'),(104,'Biomass Power Plant Managers'),(105,'Biostatisticians'),(106,'Blockchain Engineers'),(107,'Boilermakers'),(108,'Bookkeeping, Accounting, and Auditing Clerks'),(109,'Brickmasons and Blockmasons'),(110,'Bridge and Lock Tenders'),(111,'Broadcast Announcers and Radio Disc Jockeys'),(112,'Broadcast Technicians'),(113,'Brokerage Clerks'),(114,'Brownfield Redevelopment Specialists and Site Managers'),(115,'Budget Analysts'),(116,'Building Cleaning Workers, All Other'),(117,'Bus and Truck Mechanics and Diesel Engine Specialists'),(118,'Bus Drivers, School'),(119,'Bus Drivers, Transit and Intercity'),(120,'Business Continuity Planners'),(121,'Business Intelligence Analysts'),(122,'Business Operations Specialists, All Other'),(123,'Business Teachers, Postsecondary'),(124,'Butchers and Meat Cutters'),(125,'Buyers and Purchasing Agents, Farm Products'),(126,'Cabinetmakers and Bench Carpenters'),(127,'Calibration Technologists and Technicians'),(128,'Camera and Photographic Equipment Repairers'),(129,'Camera Operators, Television, Video, and Film'),(130,'Captains, Mates, and Pilots of Water Vessels'),(131,'Cardiologists'),(132,'Cardiovascular Technologists and Technicians'),(133,'Career/Technical Education Teachers, Middle School'),(134,'Career/Technical Education Teachers, Postsecondary'),(135,'Career/Technical Education Teachers, Secondary School'),(136,'Cargo and Freight Agents'),(137,'Carpenters'),(138,'Carpet Installers'),(139,'Cartographers and Photogrammetrists'),(140,'Cashiers'),(141,'Cement Masons and Concrete Finishers'),(142,'Chefs and Head Cooks'),(143,'Chemical Engineers'),(144,'Chemical Equipment Operators and Tenders'),(145,'Chemical Plant and System Operators'),(146,'Chemical Technicians'),(147,'Chemistry Teachers, Postsecondary'),(148,'Chemists'),(149,'Chief Executives'),(150,'Chief Sustainability Officers'),(151,'Child, Family, and School Social Workers'),(152,'Childcare Workers'),(153,'Chiropractors'),(154,'Choreographers'),(155,'Civil Engineering Technologists and Technicians'),(156,'Civil Engineers'),(157,'Claims Adjusters, Examiners, and Investigators'),(158,'Cleaners of Vehicles and Equipment'),(159,'Cleaning, Washing, and Metal Pickling Equipment Operators and Tenders'),(160,'Clergy'),(161,'Climate Change Policy Analysts'),(162,'Clinical and Counseling Psychologists'),(163,'Clinical Data Managers'),(164,'Clinical Neuropsychologists'),(165,'Clinical Nurse Specialists'),(166,'Clinical Research Coordinators'),(167,'Coaches and Scouts'),(168,'Coating, Painting, and Spraying Machine Setters, Operators, and Tenders'),(169,'Coil Winders, Tapers, and Finishers'),(170,'Coin, Vending, and Amusement Machine Servicers and Repairers'),(171,'Command and Control Center Officers'),(172,'Command and Control Center Specialists'),(173,'Commercial and Industrial Designers'),(174,'Commercial Divers'),(175,'Commercial Pilots'),(176,'Communications Equipment Operators, All Other'),(177,'Communications Teachers, Postsecondary'),(178,'Community and Social Service Specialists, All Other'),(179,'Community Health Workers'),(180,'Compensation and Benefits Managers'),(181,'Compensation, Benefits, and Job Analysis Specialists'),(182,'Compliance Managers'),(183,'Compliance Officers'),(184,'Computer and Information Research Scientists'),(185,'Computer and Information Systems Managers'),(186,'Computer Hardware Engineers'),(187,'Computer Network Architects'),(188,'Computer Network Support Specialists'),(189,'Computer Numerically Controlled Tool Operators'),(190,'Computer Numerically Controlled Tool Programmers'),(191,'Computer Occupations, All Other'),(192,'Computer Programmers'),(193,'Computer Science Teachers, Postsecondary'),(194,'Computer Systems Analysts'),(195,'Computer Systems Engineers/Architects'),(196,'Computer User Support Specialists'),(197,'Computer, Automated Teller, and Office Machine Repairers'),(198,'Concierges'),(199,'Conservation Scientists'),(200,'Construction and Building Inspectors'),(201,'Construction and Related Workers, All Other'),(202,'Construction Laborers'),(203,'Construction Managers'),(204,'Continuous Mining Machine Operators'),(205,'Control and Valve Installers and Repairers, Except Mechanical Door'),(206,'Conveyor Operators and Tenders'),(207,'Cooks, All Other'),(208,'Cooks, Fast Food'),(209,'Cooks, Institution and Cafeteria'),(210,'Cooks, Private Household'),(211,'Cooks, Restaurant'),(212,'Cooks, Short Order'),(213,'Cooling and Freezing Equipment Operators and Tenders'),(214,'Coroners'),(215,'Correctional Officers and Jailers'),(216,'Correspondence Clerks'),(217,'Cost Estimators'),(218,'Costume Attendants'),(219,'Counselors, All Other'),(220,'Counter and Rental Clerks'),(221,'Couriers and Messengers'),(222,'Court Reporters and Simultaneous Captioners'),(223,'Court, Municipal, and License Clerks'),(224,'Craft Artists'),(225,'Crane and Tower Operators'),(226,'Credit Analysts'),(227,'Credit Authorizers, Checkers, and Clerks'),(228,'Credit Counselors'),(229,'Crematory Operators'),(230,'Criminal Justice and Law Enforcement Teachers, Postsecondary'),(231,'Critical Care Nurses'),(232,'Crossing Guards and Flaggers'),(233,'Crushing, Grinding, and Polishing Machine Setters, Operators, and Tenders'),(234,'Curators'),(235,'Customer Service Representatives'),(236,'Customs and Border Protection Officers'),(237,'Customs Brokers'),(238,'Cutters and Trimmers, Hand'),(239,'Cutting and Slicing Machine Setters, Operators, and Tenders'),(240,'Cutting, Punching, and Press Machine Setters, Operators, and Tenders, Metal and Plastic'),(241,'Cytogenetic Technologists'),(242,'Cytotechnologists'),(243,'Dancers'),(244,'Data Entry Keyers'),(245,'Data Scientists'),(246,'Data Warehousing Specialists'),(247,'Database Administrators'),(248,'Database Architects'),(249,'Demonstrators and Product Promoters'),(250,'Dental Assistants'),(251,'Dental Hygienists'),(252,'Dental Laboratory Technicians'),(253,'Dentists, All Other Specialists'),(254,'Dentists, General'),(255,'Dermatologists'),(256,'Derrick Operators, Oil and Gas'),(257,'Designers, All Other'),(258,'Desktop Publishers'),(259,'Detectives and Criminal Investigators'),(260,'Diagnostic Medical Sonographers'),(261,'Dietetic Technicians'),(262,'Dietitians and Nutritionists'),(263,'Digital Forensics Analysts'),(264,'Dining Room and Cafeteria Attendants and Bartender Helpers'),(265,'Directors, Religious Activities and Education'),(266,'Disc Jockeys, Except Radio'),(267,'Dishwashers'),(268,'Dispatchers, Except Police, Fire, and Ambulance'),(269,'Document Management Specialists'),(270,'Door-to-Door Sales Workers, News and Street Vendors, and Related Workers'),(271,'Drafters, All Other'),(272,'Dredge Operators'),(273,'Drilling and Boring Machine Tool Setters, Operators, and Tenders, Metal and Plastic'),(274,'Driver/Sales Workers'),(275,'Drywall and Ceiling Tile Installers'),(276,'Earth Drillers, Except Oil and Gas'),(277,'Economics Teachers, Postsecondary'),(278,'Economists'),(279,'Editors'),(280,'Education Administrators, All Other'),(281,'Education Administrators, Kindergarten through Secondary'),(282,'Education Administrators, Postsecondary'),(283,'Education and Childcare Administrators, Preschool and Daycare'),(284,'Education Teachers, Postsecondary'),(285,'Educational Instruction and Library Workers, All Other'),(286,'Educational, Guidance, and Career Counselors and Advisors'),(287,'Electric Motor, Power Tool, and Related Repairers'),(288,'Electrical and Electronic Engineering Technologists and Technicians'),(289,'Electrical and Electronic Equipment Assemblers'),(290,'Electrical and Electronics Drafters'),(291,'Electrical and Electronics Installers and Repairers, Transportation Equipment'),(292,'Electrical and Electronics Repairers, Commercial and Industrial Equipment'),(293,'Electrical and Electronics Repairers, Powerhouse, Substation, and Relay'),(294,'Electrical Engineers'),(295,'Electrical Power-Line Installers and Repairers'),(296,'Electricians'),(297,'Electro-Mechanical and Mechatronics Technologists and Technicians'),(298,'Electromechanical Equipment Assemblers'),(299,'Electronic Equipment Installers and Repairers, Motor Vehicles'),(300,'Electronics Engineers, Except Computer'),(301,'Elementary School Teachers, Except Special Education'),(302,'Elevator and Escalator Installers and Repairers'),(303,'Eligibility Interviewers, Government Programs'),(304,'Embalmers'),(305,'Emergency Management Directors'),(306,'Emergency Medical Technicians'),(307,'Emergency Medicine Physicians'),(308,'Endoscopy Technicians'),(309,'Energy Auditors'),(310,'Energy Engineers, Except Wind and Solar'),(311,'Engine and Other Machine Assemblers'),(312,'Engineering Teachers, Postsecondary'),(313,'Engineering Technologists and Technicians, Except Drafters, All Other'),(314,'Engineers, All Other'),(315,'English Language and Literature Teachers, Postsecondary'),(316,'Entertainers and Performers, Sports and Related Workers, All Other'),(317,'Entertainment and Recreation Managers, Except Gambling'),(318,'Entertainment Attendants and Related Workers, All Other'),(319,'Environmental Compliance Inspectors'),(320,'Environmental Economists'),(321,'Environmental Engineering Technologists and Technicians'),(322,'Environmental Engineers'),(323,'Environmental Restoration Planners'),(324,'Environmental Science and Protection Technicians, Including Health'),(325,'Environmental Science Teachers, Postsecondary'),(326,'Environmental Scientists and Specialists, Including Health'),(327,'Epidemiologists'),(328,'Equal Opportunity Representatives and Officers'),(329,'Etchers and Engravers'),(330,'Excavating and Loading Machine and Dragline Operators, Surface Mining'),(331,'Executive Secretaries and Executive Administrative Assistants'),(332,'Exercise Physiologists'),(333,'Exercise Trainers and Group Fitness Instructors'),(334,'Explosives Workers, Ordnance Handling Experts, and Blasters'),(335,'Extraction Workers, All Other'),(336,'Extruding and Drawing Machine Setters, Operators, and Tenders, Metal and Plastic'),(337,'Extruding and Forming Machine Setters, Operators, and Tenders, Synthetic and Glass Fibers'),(338,'Extruding, Forming, Pressing, and Compacting Machine Setters, Operators, and Tenders'),(339,'Fabric and Apparel Patternmakers'),(340,'Facilities Managers'),(341,'Fallers'),(342,'Family and Consumer Sciences Teachers, Postsecondary'),(343,'Family Medicine Physicians'),(344,'Farm and Home Management Educators'),(345,'Farm Equipment Mechanics and Service Technicians'),(346,'Farm Labor Contractors'),(347,'Farmers, Ranchers, and Other Agricultural Managers'),(348,'Farmworkers and Laborers, Crop, Nursery, and Greenhouse'),(349,'Farmworkers, Farm, Ranch, and Aquacultural Animals'),(350,'Fashion Designers'),(351,'Fast Food and Counter Workers'),(352,'Fence Erectors'),(353,'Fiberglass Laminators and Fabricators'),(354,'File Clerks'),(355,'Film and Video Editors'),(356,'Financial and Investment Analysts'),(357,'Financial Clerks, All Other'),(358,'Financial Examiners'),(359,'Financial Managers'),(360,'Financial Quantitative Analysts'),(361,'Financial Risk Specialists'),(362,'Financial Specialists, All Other'),(363,'Fine Artists, Including Painters, Sculptors, and Illustrators'),(364,'Fire Inspectors and Investigators'),(365,'Fire-Prevention and Protection Engineers'),(366,'Firefighters'),(367,'First-Line Supervisors of Air Crew Members'),(368,'First-Line Supervisors of All Other Tactical Operations Specialists'),(369,'First-Line Supervisors of Construction Trades and Extraction Workers'),(370,'First-Line Supervisors of Correctional Officers'),(371,'First-Line Supervisors of Entertainment and Recreation Workers, Except Gambling Services'),(372,'First-Line Supervisors of Farming, Fishing, and Forestry Workers'),(373,'First-Line Supervisors of Firefighting and Prevention Workers'),(374,'First-Line Supervisors of Food Preparation and Serving Workers'),(375,'First-Line Supervisors of Gambling Services Workers'),(376,'First-Line Supervisors of Helpers, Laborers, and Material Movers, Hand'),(377,'First-Line Supervisors of Housekeeping and Janitorial Workers'),(378,'First-Line Supervisors of Landscaping, Lawn Service, and Groundskeeping Workers'),(379,'First-Line Supervisors of Material-Moving Machine and Vehicle Operators'),(380,'First-Line Supervisors of Mechanics, Installers, and Repairers'),(381,'First-Line Supervisors of Non-Retail Sales Workers'),(382,'First-Line Supervisors of Office and Administrative Support Workers'),(383,'First-Line Supervisors of Passenger Attendants'),(384,'First-Line Supervisors of Personal Service Workers'),(385,'First-Line Supervisors of Police and Detectives'),(386,'First-Line Supervisors of Production and Operating Workers'),(387,'First-Line Supervisors of Protective Service Workers, All Other'),(388,'First-Line Supervisors of Retail Sales Workers'),(389,'First-Line Supervisors of Security Workers'),(390,'First-Line Supervisors of Transportation Workers, All Other'),(391,'First-Line Supervisors of Weapons Specialists/Crew Members'),(392,'Fish and Game Wardens'),(393,'Fishing and Hunting Workers'),(394,'Fitness and Wellness Coordinators'),(395,'Flight Attendants'),(396,'Floor Layers, Except Carpet, Wood, and Hard Tiles'),(397,'Floor Sanders and Finishers'),(398,'Floral Designers'),(399,'Food and Tobacco Roasting, Baking, and Drying Machine Operators and Tenders'),(400,'Food Batchmakers'),(401,'Food Cooking Machine Operators and Tenders'),(402,'Food Preparation and Serving Related Workers, All Other'),(403,'Food Preparation Workers'),(404,'Food Processing Workers, All Other'),(405,'Food Science Technicians'),(406,'Food Scientists and Technologists'),(407,'Food Servers, Nonrestaurant'),(408,'Food Service Managers'),(409,'Foreign Language and Literature Teachers, Postsecondary'),(410,'Forensic Science Technicians'),(411,'Forest and Conservation Technicians'),(412,'Forest and Conservation Workers'),(413,'Forest Fire Inspectors and Prevention Specialists'),(414,'Foresters'),(415,'Forestry and Conservation Science Teachers, Postsecondary'),(416,'Forging Machine Setters, Operators, and Tenders, Metal and Plastic'),(417,'Foundry Mold and Coremakers'),(418,'Fraud Examiners, Investigators and Analysts'),(419,'Freight Forwarders'),(420,'Fuel Cell Engineers'),(421,'Fundraisers'),(422,'Fundraising Managers'),(423,'Funeral Attendants'),(424,'Funeral Home Managers'),(425,'Furnace, Kiln, Oven, Drier, and Kettle Operators and Tenders'),(426,'Furniture Finishers'),(427,'Gambling and Sports Book Writers and Runners'),(428,'Gambling Cage Workers'),(429,'Gambling Change Persons and Booth Cashiers'),(430,'Gambling Dealers'),(431,'Gambling Managers'),(432,'Gambling Service Workers, All Other'),(433,'Gambling Surveillance Officers and Gambling Investigators'),(434,'Gas Compressor and Gas Pumping Station Operators'),(435,'Gas Plant Operators'),(436,'Gem and Diamond Workers'),(437,'General and Operations Managers'),(438,'General Internal Medicine Physicians'),(439,'Genetic Counselors'),(440,'Geneticists'),(441,'Geodetic Surveyors'),(442,'Geographers'),(443,'Geographic Information Systems Technologists and Technicians'),(444,'Geography Teachers, Postsecondary'),(445,'Geological Technicians, Except Hydrologic Technicians'),(446,'Geoscientists, Except Hydrologists and Geographers'),(447,'Geothermal Production Managers'),(448,'Geothermal Technicians'),(449,'Glass Blowers, Molders, Benders, and Finishers'),(450,'Glaziers'),(451,'Government Property Inspectors and Investigators'),(452,'Graders and Sorters, Agricultural Products'),(453,'Graphic Designers'),(454,'Grinding and Polishing Workers, Hand'),(455,'Grinding, Lapping, Polishing, and Buffing Machine Tool Setters, Operators, and Tenders, Metal and Plastic'),(456,'Grounds Maintenance Workers, All Other'),(457,'Hairdressers, Hairstylists, and Cosmetologists'),(458,'Hazardous Materials Removal Workers'),(459,'Health and Safety Engineers, Except Mining Safety Engineers and Inspectors'),(460,'Health Education Specialists'),(461,'Health Informatics Specialists'),(462,'Health Information Technologists and Medical Registrars'),(463,'Health Specialties Teachers, Postsecondary'),(464,'Health Technologists and Technicians, All Other'),(465,'Healthcare Diagnosing or Treating Practitioners, All Other'),(466,'Healthcare Practitioners and Technical Workers, All Other'),(467,'Healthcare Social Workers'),(468,'Healthcare Support Workers, All Other'),(469,'Hearing Aid Specialists'),(470,'Heat Treating Equipment Setters, Operators, and Tenders, Metal and Plastic'),(471,'Heating, Air Conditioning, and Refrigeration Mechanics and Installers'),(472,'Heavy and Tractor-Trailer Truck Drivers'),(473,'Helpers, Construction Trades, All Other'),(474,'Helpers--Brickmasons, Blockmasons, Stonemasons, and Tile and Marble Setters'),(475,'Helpers--Carpenters'),(476,'Helpers--Electricians'),(477,'Helpers--Extraction Workers'),(478,'Helpers--Installation, Maintenance, and Repair Workers'),(479,'Helpers--Painters, Paperhangers, Plasterers, and Stucco Masons'),(480,'Helpers--Pipelayers, Plumbers, Pipefitters, and Steamfitters'),(481,'Helpers--Production Workers'),(482,'Helpers--Roofers'),(483,'Highway Maintenance Workers'),(484,'Histology Technicians'),(485,'Historians'),(486,'History Teachers, Postsecondary'),(487,'Histotechnologists'),(488,'Hoist and Winch Operators'),(489,'Home Appliance Repairers'),(490,'Home Health Aides'),(491,'Hospitalists'),(492,'Hosts and Hostesses, Restaurant, Lounge, and Coffee Shop'),(493,'Hotel, Motel, and Resort Desk Clerks'),(494,'Human Factors Engineers and Ergonomists'),(495,'Human Resources Assistants, Except Payroll and Timekeeping'),(496,'Human Resources Managers'),(497,'Human Resources Specialists'),(498,'Hydroelectric Plant Technicians'),(499,'Hydroelectric Production Managers'),(500,'Hydrologic Technicians'),(501,'Hydrologists'),(502,'Industrial Ecologists'),(503,'Industrial Engineering Technologists and Technicians'),(504,'Industrial Engineers'),(505,'Industrial Machinery Mechanics'),(506,'Industrial Production Managers'),(507,'Industrial Truck and Tractor Operators'),(508,'Industrial-Organizational Psychologists'),(509,'Infantry'),(510,'Infantry Officers'),(511,'Information and Record Clerks, All Other'),(512,'Information Security Analysts'),(513,'Information Security Engineers'),(514,'Information Technology Project Managers'),(515,'Inspectors, Testers, Sorters, Samplers, and Weighers'),(516,'Installation, Maintenance, and Repair Workers, All Other'),(517,'Instructional Coordinators'),(518,'Insulation Workers, Floor, Ceiling, and Wall'),(519,'Insulation Workers, Mechanical'),(520,'Insurance Appraisers, Auto Damage'),(521,'Insurance Claims and Policy Processing Clerks'),(522,'Insurance Sales Agents'),(523,'Insurance Underwriters'),(524,'Intelligence Analysts'),(525,'Interior Designers'),(526,'Interpreters and Translators'),(527,'Interviewers, Except Eligibility and Loan'),(528,'Investment Fund Managers'),(529,'Janitors and Cleaners, Except Maids and Housekeeping Cleaners'),(530,'Jewelers and Precious Stone and Metal Workers'),(531,'Judges, Magistrate Judges, and Magistrates'),(532,'Judicial Law Clerks'),(533,'Kindergarten Teachers, Except Special Education'),(534,'Labor Relations Specialists'),(535,'Laborers and Freight, Stock, and Material Movers, Hand'),(536,'Landscape Architects'),(537,'Landscaping and Groundskeeping Workers'),(538,'Lathe and Turning Machine Tool Setters, Operators, and Tenders, Metal and Plastic'),(539,'Laundry and Dry-Cleaning Workers'),(540,'Law Teachers, Postsecondary'),(541,'Lawyers'),(542,'Layout Workers, Metal and Plastic'),(543,'Legal Secretaries and Administrative Assistants'),(544,'Legal Support Workers, All Other'),(545,'Legislators'),(546,'Librarians and Media Collections Specialists'),(547,'Library Assistants, Clerical'),(548,'Library Science Teachers, Postsecondary'),(549,'Library Technicians'),(550,'Licensed Practical and Licensed Vocational Nurses'),(551,'Life Scientists, All Other'),(552,'Life, Physical, and Social Science Technicians, All Other'),(553,'Lifeguards, Ski Patrol, and Other Recreational Protective Service Workers'),(554,'Light Truck Drivers'),(555,'Lighting Technicians'),(556,'Loading and Moving Machine Operators, Underground Mining'),(557,'Loan Interviewers and Clerks'),(558,'Loan Officers'),(559,'Locker Room, Coatroom, and Dressing Room Attendants'),(560,'Locksmiths and Safe Repairers'),(561,'Locomotive Engineers'),(562,'Lodging Managers'),(563,'Log Graders and Scalers'),(564,'Logging Equipment Operators'),(565,'Logging Workers, All Other'),(566,'Logisticians'),(567,'Logistics Analysts'),(568,'Logistics Engineers'),(569,'Loss Prevention Managers'),(570,'Low Vision Therapists, Orientation and Mobility Specialists, and Vision Rehabilitation Therapists'),(571,'Machine Feeders and Offbearers'),(572,'Machinists'),(573,'Magnetic Resonance Imaging Technologists'),(574,'Maids and Housekeeping Cleaners'),(575,'Mail Clerks and Mail Machine Operators, Except Postal Service'),(576,'Maintenance and Repair Workers, General'),(577,'Maintenance Workers, Machinery'),(578,'Makeup Artists, Theatrical and Performance'),(579,'Management Analysts'),(580,'Managers, All Other'),(581,'Manicurists and Pedicurists'),(582,'Manufactured Building and Mobile Home Installers'),(583,'Manufacturing Engineers'),(584,'Marine Engineers and Naval Architects'),(585,'Market Research Analysts and Marketing Specialists'),(586,'Marketing Managers'),(587,'Marriage and Family Therapists'),(588,'Massage Therapists'),(589,'Material Moving Workers, All Other'),(590,'Materials Engineers'),(591,'Materials Scientists'),(592,'Mathematical Science Occupations, All Other'),(593,'Mathematical Science Teachers, Postsecondary'),(594,'Mathematicians'),(595,'Meat, Poultry, and Fish Cutters and Trimmers'),(596,'Mechanical Door Repairers'),(597,'Mechanical Drafters'),(598,'Mechanical Engineering Technologists and Technicians'),(599,'Mechanical Engineers'),(600,'Mechatronics Engineers'),(601,'Media and Communication Equipment Workers, All Other'),(602,'Media and Communication Workers, All Other'),(603,'Media Programming Directors'),(604,'Media Technical Directors/Managers'),(605,'Medical and Clinical Laboratory Technicians'),(606,'Medical and Clinical Laboratory Technologists'),(607,'Medical and Health Services Managers'),(608,'Medical Appliance Technicians'),(609,'Medical Assistants'),(610,'Medical Dosimetrists'),(611,'Medical Equipment Preparers'),(612,'Medical Equipment Repairers'),(613,'Medical Records Specialists'),(614,'Medical Scientists, Except Epidemiologists'),(615,'Medical Secretaries and Administrative Assistants'),(616,'Medical Transcriptionists'),(617,'Meeting, Convention, and Event Planners'),(618,'Mental Health and Substance Abuse Social Workers'),(619,'Mental Health Counselors'),(620,'Merchandise Displayers and Window Trimmers'),(621,'Metal Workers and Plastic Workers, All Other'),(622,'Metal-Refining Furnace Operators and Tenders'),(623,'Meter Readers, Utilities'),(624,'Microbiologists'),(625,'Microsystems Engineers'),(626,'Middle School Teachers, Except Special and Career/Technical Education'),(627,'Midwives'),(628,'Military Enlisted Tactical Operations and Air/Weapons Specialists and Crew Members, All Other'),(629,'Military Officer Special and Tactical Operations Leaders, All Other'),(630,'Milling and Planing Machine Setters, Operators, and Tenders, Metal and Plastic'),(631,'Millwrights'),(632,'Mining and Geological Engineers, Including Mining Safety Engineers'),(633,'Mixing and Blending Machine Setters, Operators, and Tenders'),(634,'Mobile Heavy Equipment Mechanics, Except Engines'),(635,'Model Makers, Metal and Plastic'),(636,'Model Makers, Wood'),(637,'Models'),(638,'Molders, Shapers, and Casters, Except Metal and Plastic'),(639,'Molding, Coremaking, and Casting Machine Setters, Operators, and Tenders, Metal and Plastic'),(640,'Molecular and Cellular Biologists'),(641,'Morticians, Undertakers, and Funeral Arrangers'),(642,'Motion Picture Projectionists'),(643,'Motor Vehicle Operators, All Other'),(644,'Motorboat Mechanics and Service Technicians'),(645,'Motorboat Operators'),(646,'Motorcycle Mechanics'),(647,'Multiple Machine Tool Setters, Operators, and Tenders, Metal and Plastic'),(648,'Museum Technicians and Conservators'),(649,'Music Directors and Composers'),(650,'Music Therapists'),(651,'Musical Instrument Repairers and Tuners'),(652,'Musicians and Singers'),(653,'Nannies'),(654,'Nanosystems Engineers'),(655,'Nanotechnology Engineering Technologists and Technicians'),(656,'Natural Sciences Managers'),(657,'Naturopathic Physicians'),(658,'Network and Computer Systems Administrators'),(659,'Neurodiagnostic Technologists'),(660,'Neurologists'),(661,'Neuropsychologists'),(662,'New Accounts Clerks'),(663,'News Analysts, Reporters, and Journalists'),(664,'Non-Destructive Testing Specialists'),(665,'Nuclear Engineers'),(666,'Nuclear Medicine Technologists'),(667,'Nuclear Monitoring Technicians'),(668,'Nuclear Power Reactor Operators'),(669,'Nuclear Technicians'),(670,'Nurse Anesthetists'),(671,'Nurse Midwives'),(672,'Nurse Practitioners'),(673,'Nursing Assistants'),(674,'Nursing Instructors and Teachers, Postsecondary'),(675,'Obstetricians and Gynecologists'),(676,'Occupational Health and Safety Specialists'),(677,'Occupational Health and Safety Technicians'),(678,'Occupational Therapists'),(679,'Occupational Therapy Aides'),(680,'Occupational Therapy Assistants'),(681,'Office and Administrative Support Workers, All Other'),(682,'Office Clerks, General'),(683,'Office Machine Operators, Except Computer'),(684,'Online Merchants'),(685,'Operating Engineers and Other Construction Equipment Operators'),(686,'Operations Research Analysts'),(687,'Ophthalmic Laboratory Technicians'),(688,'Ophthalmic Medical Technicians'),(689,'Ophthalmic Medical Technologists'),(690,'Ophthalmologists, Except Pediatric'),(691,'Opticians, Dispensing'),(692,'Optometrists'),(693,'Oral and Maxillofacial Surgeons'),(694,'Order Clerks'),(695,'Orderlies'),(696,'Orthodontists'),(697,'Orthopedic Surgeons, Except Pediatric'),(698,'Orthoptists'),(699,'Orthotists and Prosthetists'),(700,'Outdoor Power Equipment and Other Small Engine Mechanics'),(701,'Packaging and Filling Machine Operators and Tenders'),(702,'Packers and Packagers, Hand'),(703,'Painters, Construction and Maintenance'),(704,'Painting, Coating, and Decorating Workers'),(705,'Paper Goods Machine Setters, Operators, and Tenders'),(706,'Paperhangers'),(707,'Paralegals and Legal Assistants'),(708,'Paramedics'),(709,'Park Naturalists'),(710,'Parking Attendants'),(711,'Parking Enforcement Workers'),(712,'Parts Salespersons'),(713,'Passenger Attendants'),(714,'Patient Representatives'),(715,'Patternmakers, Metal and Plastic'),(716,'Patternmakers, Wood'),(717,'Paving, Surfacing, and Tamping Equipment Operators'),(718,'Payroll and Timekeeping Clerks'),(719,'Pediatric Surgeons'),(720,'Pediatricians, General'),(721,'Penetration Testers'),(722,'Personal Care Aides'),(723,'Personal Care and Service Workers, All Other'),(724,'Personal Financial Advisors'),(725,'Personal Service Managers, All Other'),(726,'Pest Control Workers'),(727,'Pesticide Handlers, Sprayers, and Applicators, Vegetation'),(728,'Petroleum Engineers'),(729,'Petroleum Pump System Operators, Refinery Operators, and Gaugers'),(730,'Pharmacists'),(731,'Pharmacy Aides'),(732,'Pharmacy Technicians'),(733,'Philosophy and Religion Teachers, Postsecondary'),(734,'Phlebotomists'),(735,'Photographers'),(736,'Photographic Process Workers and Processing Machine Operators'),(737,'Photonics Engineers'),(738,'Photonics Technicians'),(739,'Physical Medicine and Rehabilitation Physicians'),(740,'Physical Scientists, All Other'),(741,'Physical Therapist Aides'),(742,'Physical Therapist Assistants'),(743,'Physical Therapists'),(744,'Physician Assistants'),(745,'Physicians, All Other'),(746,'Physicians, Pathologists'),(747,'Physicists'),(748,'Physics Teachers, Postsecondary'),(749,'Pile Driver Operators'),(750,'Pipelayers'),(751,'Plant and System Operators, All Other'),(752,'Plasterers and Stucco Masons'),(753,'Plating Machine Setters, Operators, and Tenders, Metal and Plastic'),(754,'Plumbers, Pipefitters, and Steamfitters'),(755,'Podiatrists'),(756,'Poets, Lyricists and Creative Writers'),(757,'Police and Sheriff\'s Patrol Officers'),(758,'Police Identification and Records Officers'),(759,'Political Science Teachers, Postsecondary'),(760,'Political Scientists'),(761,'Postal Service Clerks'),(762,'Postal Service Mail Carriers'),(763,'Postal Service Mail Sorters, Processors, and Processing Machine Operators'),(764,'Postmasters and Mail Superintendents'),(765,'Postsecondary Teachers, All Other'),(766,'Potters, Manufacturing'),(767,'Pourers and Casters, Metal'),(768,'Power Distributors and Dispatchers'),(769,'Power Plant Operators'),(770,'Precision Agriculture Technicians'),(771,'Precision Instrument and Equipment Repairers, All Other'),(772,'Prepress Technicians and Workers'),(773,'Preschool Teachers, Except Special Education'),(774,'Pressers, Textile, Garment, and Related Materials'),(775,'Preventive Medicine Physicians'),(776,'Print Binding and Finishing Workers'),(777,'Printing Press Operators'),(778,'Private Detectives and Investigators'),(779,'Probation Officers and Correctional Treatment Specialists'),(780,'Procurement Clerks'),(781,'Producers and Directors'),(782,'Production Workers, All Other'),(783,'Production, Planning, and Expediting Clerks'),(784,'Project Management Specialists'),(785,'Proofreaders and Copy Markers'),(786,'Property, Real Estate, and Community Association Managers'),(787,'Prosthodontists'),(788,'Protective Service Workers, All Other'),(789,'Psychiatric Aides'),(790,'Psychiatric Technicians'),(791,'Psychiatrists'),(792,'Psychologists, All Other'),(793,'Psychology Teachers, Postsecondary'),(794,'Public Relations Managers'),(795,'Public Relations Specialists'),(796,'Public Safety Telecommunicators'),(797,'Pump Operators, Except Wellhead Pumpers'),(798,'Purchasing Agents, Except Wholesale, Retail, and Farm Products'),(799,'Purchasing Managers'),(800,'Quality Control Analysts'),(801,'Quality Control Systems Managers'),(802,'Radiation Therapists'),(803,'Radio Frequency Identification Device Specialists'),(804,'Radio, Cellular, and Tower Equipment Installers and Repairers'),(805,'Radiologic Technologists and Technicians'),(806,'Radiologists'),(807,'Rail Car Repairers'),(808,'Rail Transportation Workers, All Other'),(809,'Rail Yard Engineers, Dinkey Operators, and Hostlers'),(810,'Rail-Track Laying and Maintenance Equipment Operators'),(811,'Railroad Brake, Signal, and Switch Operators and Locomotive Firers'),(812,'Railroad Conductors and Yardmasters'),(813,'Range Managers'),(814,'Real Estate Brokers'),(815,'Real Estate Sales Agents'),(816,'Receptionists and Information Clerks'),(817,'Recreation and Fitness Studies Teachers, Postsecondary'),(818,'Recreation Workers'),(819,'Recreational Therapists'),(820,'Recreational Vehicle Service Technicians'),(821,'Recycling and Reclamation Workers'),(822,'Recycling Coordinators'),(823,'Refractory Materials Repairers, Except Brickmasons'),(824,'Refuse and Recyclable Material Collectors'),(825,'Registered Nurses'),(826,'Regulatory Affairs Managers'),(827,'Regulatory Affairs Specialists'),(828,'Rehabilitation Counselors'),(829,'Reinforcing Iron and Rebar Workers'),(830,'Religious Workers, All Other'),(831,'Remote Sensing Scientists and Technologists'),(832,'Remote Sensing Technicians'),(833,'Reservation and Transportation Ticket Agents and Travel Clerks'),(834,'Residential Advisors'),(835,'Respiratory Therapists'),(836,'Retail Loss Prevention Specialists'),(837,'Retail Salespersons'),(838,'Riggers'),(839,'Robotics Engineers'),(840,'Robotics Technicians'),(841,'Rock Splitters, Quarry'),(842,'Rolling Machine Setters, Operators, and Tenders, Metal and Plastic'),(843,'Roof Bolters, Mining'),(844,'Roofers'),(845,'Rotary Drill Operators, Oil and Gas'),(846,'Roustabouts, Oil and Gas'),(847,'Sailors and Marine Oilers'),(848,'Sales and Related Workers, All Other'),(849,'Sales Engineers'),(850,'Sales Managers'),(851,'Sales Representatives of Services, Except Advertising, Insurance, Financial Services, and Travel'),(852,'Sales Representatives, Wholesale and Manufacturing, Except Technical and Scientific Products'),(853,'Sales Representatives, Wholesale and Manufacturing, Technical and Scientific Products'),(854,'Sawing Machine Setters, Operators, and Tenders, Wood'),(855,'School Bus Monitors'),(856,'School Psychologists'),(857,'Search Marketing Strategists'),(858,'Secondary School Teachers, Except Special and Career/Technical Education'),(859,'Secretaries and Administrative Assistants, Except Legal, Medical, and Executive'),(860,'Securities, Commodities, and Financial Services Sales Agents'),(861,'Security and Fire Alarm Systems Installers'),(862,'Security Guards'),(863,'Security Management Specialists'),(864,'Security Managers'),(865,'Segmental Pavers'),(866,'Self-Enrichment Teachers'),(867,'Semiconductor Processing Technicians'),(868,'Separating, Filtering, Clarifying, Precipitating, and Still Machine Setters, Operators, and Tenders'),(869,'Septic Tank Servicers and Sewer Pipe Cleaners'),(870,'Service Unit Operators, Oil and Gas'),(871,'Set and Exhibit Designers'),(872,'Sewers, Hand'),(873,'Sewing Machine Operators'),(874,'Shampooers'),(875,'Sheet Metal Workers'),(876,'Ship Engineers'),(877,'Shipping, Receiving, and Inventory Clerks'),(878,'Shoe and Leather Workers and Repairers'),(879,'Shoe Machine Operators and Tenders'),(880,'Shuttle Drivers and Chauffeurs'),(881,'Signal and Track Switch Repairers'),(882,'Skincare Specialists'),(883,'Slaughterers and Meat Packers'),(884,'Social and Community Service Managers'),(885,'Social and Human Service Assistants'),(886,'Social Science Research Assistants'),(887,'Social Sciences Teachers, Postsecondary, All Other'),(888,'Social Scientists and Related Workers, All Other'),(889,'Social Work Teachers, Postsecondary'),(890,'Social Workers, All Other'),(891,'Sociologists'),(892,'Sociology Teachers, Postsecondary'),(893,'Software Developers'),(894,'Software Quality Assurance Analysts and Testers'),(895,'Soil and Plant Scientists'),(896,'Solar Energy Installation Managers'),(897,'Solar Energy Systems Engineers'),(898,'Solar Photovoltaic Installers'),(899,'Solar Sales Representatives and Assessors'),(900,'Solar Thermal Installers and Technicians'),(901,'Sound Engineering Technicians'),(902,'Spa Managers'),(903,'Special Education Teachers, All Other'),(904,'Special Education Teachers, Elementary School'),(905,'Special Education Teachers, Kindergarten'),(906,'Special Education Teachers, Middle School'),(907,'Special Education Teachers, Preschool'),(908,'Special Education Teachers, Secondary School'),(909,'Special Effects Artists and Animators'),(910,'Special Forces'),(911,'Special Forces Officers'),(912,'Speech-Language Pathologists'),(913,'Speech-Language Pathology Assistants'),(914,'Sports Medicine Physicians'),(915,'Stationary Engineers and Boiler Operators'),(916,'Statistical Assistants'),(917,'Statisticians'),(918,'Stockers and Order Fillers'),(919,'Stone Cutters and Carvers, Manufacturing'),(920,'Stonemasons'),(921,'Structural Iron and Steel Workers'),(922,'Structural Metal Fabricators and Fitters'),(923,'Substance Abuse and Behavioral Disorder Counselors'),(924,'Substitute Teachers, Short-Term'),(925,'Subway and Streetcar Operators'),(926,'Supply Chain Managers'),(927,'Surgeons, All Other'),(928,'Surgical Assistants'),(929,'Surgical Technologists'),(930,'Survey Researchers'),(931,'Surveying and Mapping Technicians'),(932,'Surveyors'),(933,'Sustainability Specialists'),(934,'Switchboard Operators, Including Answering Service'),(935,'Tailors, Dressmakers, and Custom Sewers'),(936,'Talent Directors'),(937,'Tank Car, Truck, and Ship Loaders'),(938,'Tapers'),(939,'Tax Examiners and Collectors, and Revenue Agents'),(940,'Tax Preparers'),(941,'Taxi Drivers'),(942,'Teachers and Instructors, All Other'),(943,'Teaching Assistants, All Other'),(944,'Teaching Assistants, Postsecondary'),(945,'Teaching Assistants, Preschool, Elementary, Middle, and Secondary School, Except Special Education'),(946,'Teaching Assistants, Special Education'),(947,'Team Assemblers'),(948,'Technical Writers'),(949,'Telecommunications Engineering Specialists'),(950,'Telecommunications Equipment Installers and Repairers, Except Line Installers'),(951,'Telecommunications Line Installers and Repairers'),(952,'Telemarketers'),(953,'Telephone Operators'),(954,'Tellers'),(955,'Terrazzo Workers and Finishers'),(956,'Textile Bleaching and Dyeing Machine Operators and Tenders'),(957,'Textile Cutting Machine Setters, Operators, and Tenders'),(958,'Textile Knitting and Weaving Machine Setters, Operators, and Tenders'),(959,'Textile Winding, Twisting, and Drawing Out Machine Setters, Operators, and Tenders'),(960,'Textile, Apparel, and Furnishings Workers, All Other'),(961,'Therapists, All Other'),(962,'Tile and Stone Setters'),(963,'Timing Device Assemblers and Adjusters'),(964,'Tire Builders'),(965,'Tire Repairers and Changers'),(966,'Title Examiners, Abstractors, and Searchers'),(967,'Tool and Die Makers'),(968,'Tool Grinders, Filers, and Sharpeners'),(969,'Tour Guides and Escorts'),(970,'Traffic Technicians'),(971,'Training and Development Managers'),(972,'Training and Development Specialists'),(973,'Transit and Railroad Police'),(974,'Transportation Engineers'),(975,'Transportation Inspectors'),(976,'Transportation Planners'),(977,'Transportation Security Screeners'),(978,'Transportation Vehicle, Equipment and Systems Inspectors, Except Aviation'),(979,'Transportation Workers, All Other'),(980,'Transportation, Storage, and Distribution Managers'),(981,'Travel Agents'),(982,'Travel Guides'),(983,'Treasurers and Controllers'),(984,'Tree Trimmers and Pruners'),(985,'Tutors'),(986,'Umpires, Referees, and Other Sports Officials'),(987,'Underground Mining Machine Operators, All Other'),(988,'Upholsterers'),(989,'Urban and Regional Planners'),(990,'Urologists'),(991,'Ushers, Lobby Attendants, and Ticket Takers'),(992,'Validation Engineers'),(993,'Veterinarians'),(994,'Veterinary Assistants and Laboratory Animal Caretakers'),(995,'Veterinary Technologists and Technicians'),(996,'Video Game Designers'),(997,'Waiters and Waitresses'),(998,'Watch and Clock Repairers'),(999,'Water and Wastewater Treatment Plant and System Operators'),(1000,'Water Resource Specialists'),(1001,'Water/Wastewater Engineers'),(1002,'Weatherization Installers and Technicians'),(1003,'Web Administrators'),(1004,'Web and Digital Interface Designers'),(1005,'Web Developers'),(1006,'Weighers, Measurers, Checkers, and Samplers, Recordkeeping'),(1007,'Welders, Cutters, Solderers, and Brazers'),(1008,'Welding, Soldering, and Brazing Machine Setters, Operators, and Tenders'),(1009,'Wellhead Pumpers'),(1010,'Wholesale and Retail Buyers, Except Farm Products'),(1011,'Wind Energy Development Managers'),(1012,'Wind Energy Engineers'),(1013,'Wind Energy Operations Managers'),(1014,'Wind Turbine Service Technicians'),(1015,'Woodworkers, All Other'),(1016,'Woodworking Machine Setters, Operators, and Tenders, Except Sawing'),(1017,'Word Processors and Typists'),(1018,'Writers and Authors'),(1019,'Zoologists and Wildlife Biologists');
/*!40000 ALTER TABLE `occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci,
  `occupation_id` int DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture_size` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8157AA0FA76ED395` (`user_id`),
  KEY `IDX_8157AA0F22C8FC20` (`occupation_id`),
  CONSTRAINT `FK_8157AA0F22C8FC20` FOREIGN KEY (`occupation_id`) REFERENCES `occupation` (`id`),
  CONSTRAINT `FK_8157AA0FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (3,13,'Jane Jackson','Tallinn','EE','Terre Hommikust. Minu nili \r\non Yaovi.',1003,'37','441 457 8587','67d566cae1e3c.jpg','671892');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `budget` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProjectDuration_id` int DEFAULT NULL,
  `ProjectType_id` int DEFAULT NULL,
  `ProjectCategory_id` int DEFAULT NULL,
  `draft` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FB3D0EEA76ED395` (`user_id`),
  KEY `IDX_2FB3D0EE978E3B75` (`ProjectDuration_id`),
  KEY `IDX_2FB3D0EE2902C11E` (`ProjectType_id`),
  KEY `IDX_2FB3D0EEB271214F` (`ProjectCategory_id`),
  CONSTRAINT `FK_2FB3D0EE2902C11E` FOREIGN KEY (`ProjectType_id`) REFERENCES `project_type` (`id`),
  CONSTRAINT `FK_2FB3D0EE978E3B75` FOREIGN KEY (`ProjectDuration_id`) REFERENCES `project_duration` (`id`),
  CONSTRAINT `FK_2FB3D0EEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_2FB3D0EEB271214F` FOREIGN KEY (`ProjectCategory_id`) REFERENCES `project_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (4,9,'SMTP EMAIL Verify','2024-03-31 00:00:00','100','Go to the documentation and click back to see the list of form field types. One of the most important types in all of Symfony is the ChoiceType. It\'s kind of the loud, confident, over-achiever in the group: it\'s able to create a select drop-down, a multi-select list, radio buttons or checkboxes. It even works on weekends! Phew!\r\n\r\nIf you think about it, that makes sense: those are all different ways to choose one or more items. You pass this type a choices option - like \"Yes\" and \"No\" - and, by default, it will give you a select drop-down. Want radio buttons instead? Brave choice! Just set the expanded option to true. Need to be able to select \"multiple\" items instead of just one? Totally cool! Set multiple to true to get checkboxes. The ChoiceType is awesome!',2,NULL,NULL,0),(5,9,'Data Extraction from Website','2024-04-01 00:00:00','100','We are seeking for multiple freelancers to copy paste simple English text data from multiple webpages into MS excel or google sheets. We\'ll send you a list which is containing links of different websites along with a pre formatted excel or google sheet, and you\'ll have to copy paste text data from those webpages into excel or google sheet, these websites contains the data of bath accessaries manufacturers and exporters, in 5 different countries.\r\nData which needs to be copy paste may include name of company, contact info (phone number, fax and email address), website and names of products which they manufacture or export. Freshers can also apply as this is just a simple and basic copy paste task and we need multiple persons to work on this.',2,NULL,NULL,0),(6,9,'Test','2024-04-01 00:00:00','10','foo',2,NULL,NULL,0),(7,9,'Web scraper needed for project','2024-04-01 00:00:00','150','I am trying to build a list of a specific website company\'s websites.  The company is called Olly Olly, and they build all of their websites are on Wordpress.  I will provide examples websites.  \r\n\r\nI also have about 2 million wordpress websites in a csv file that you\'d be able to use to assist you, if that would be helpful.\r\n\r\nThere should be a few thousand live websites, will pay very well for this job and will have other jobs',2,NULL,NULL,0),(8,13,'Test','2024-04-01 00:00:00','10','Test',2,NULL,NULL,0),(100,13,'Foo','2024-07-16 20:02:15','10','text',2,NULL,NULL,0),(101,13,'Foo','2024-07-16 20:55:16','10','text',2,NULL,NULL,0),(102,13,'Foo','2024-07-16 20:57:12','10','text Foo Bar Baaz',2,3,3,0),(103,13,'Foo New','2024-07-18 21:50:58','100','Test text',2,NULL,NULL,0),(104,13,'Foo New','2024-07-18 21:52:00','100','Test text',2,NULL,NULL,0),(105,13,'Research stuff on the web','2024-07-29 23:07:38','100','Research stuff on the web. Research stuff on the web\r\n\r\nResearch stuff on the web',2,NULL,NULL,0),(106,13,'Research stuff on the web','2024-07-29 23:09:29','100','Research stuff on the web. Research stuff on the web\r\n\r\nResearch stuff on the web',2,NULL,NULL,0),(107,13,'Build My Website','2024-08-11 22:24:28','20','Build My Website',1,1,3,0),(108,13,'Build My Website','2024-08-11 22:58:43','50','Build My Website',1,1,3,0),(109,13,'French to English translation','2024-08-12 17:58:41','50','Hello,\r\n\r\nIt was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',2,1,4,0),(110,13,'French to English translation','2024-08-12 18:25:48','50','Hello,\r\n\r\nIt was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',2,1,4,0),(111,13,'French to English translation','2024-08-12 18:27:24','50','Hello,\r\n\r\nIt was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',2,1,4,0),(112,13,'French to English translation','2024-08-12 18:54:24','50','Hello,\r\n\r\nIt was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',2,1,4,0),(113,13,'French to English translation','2024-08-12 18:54:56','50','Hello,\r\n\r\nIt was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',2,1,4,0),(114,13,'Translation 2','2024-08-12 19:08:52','100','t was originally taken from a Latin text written by a Roman Scholar, Sceptic and Philosopher by the name of Marcus Tullius Cicero, who influenced the Latin language greatly.\r\n\r\nThe \"filler\" text we know today has been altered over the years (in fact \"Lorem\" isn\'t actually a Latin word. It is suggested that the reason that the text starts with \"Lorem\" is because there was a page break spanning the word \"Do-lorem\". If you a re looking for a translation of the text, it\'s meaningless. The original text talks about the pain and love involved in the pursuit of pleasure or something like that.\r\n\r\nThe reason we use Lorem Ipsum is simple. If we used real text, it would possibly distract from the DESIGN of a page (or indeed, might even be mistakenly inappropriate. Or if we used something like \"Insert Text Here...\", this would also distract from the design. Using Lorem Ipsum allows us to SEE the design without being distracted by readable or unrealistic text.',1,2,4,0),(115,13,'Test','2024-08-12 19:12:17','50','Test',1,2,2,0),(116,13,'Test Foo','2024-08-12 19:20:31','50','Test Foo',1,4,3,1),(117,13,'Test Foo','2024-08-12 19:21:18','50','Test Foo 56',1,4,3,1),(118,13,'Leads Generation','2024-08-17 21:09:49','10','Generate leads',1,4,1,1),(119,13,'Leads Generation 100','2024-08-17 21:12:43','20','Leads Generation',2,4,2,1),(120,13,'Website','2024-08-17 23:17:20','20','Website Website',2,2,3,1),(121,13,'Website','2024-08-17 23:28:07','20','Website Website',2,2,3,1),(124,13,'Translation','2024-08-18 15:28:37','50','Translation Translation',1,4,4,0),(125,13,'Test','2024-08-28 16:19:20','50','Test',2,2,2,0),(126,13,'Testvaù 01','2024-08-28 16:38:02','0','Testvaù 01',3,2,2,0),(127,13,'Foo','2024-08-28 16:40:17','20','Bar',2,2,2,0),(128,13,'Test 105','2024-08-28 16:49:17','50','Test 105',2,1,3,0),(129,13,'Foo','2024-08-29 15:48:30','10','Bar',2,2,2,0),(130,13,'Find leads from food companies','2024-09-07 01:39:49','250','Find leads from food companies',2,2,2,0),(131,13,'Find leads from food companies','2024-09-07 01:40:36','250','Find leads from food companies',2,2,2,0),(132,13,'Test Foo','2024-09-07 01:45:27','250','Test Foo',2,2,2,0),(133,13,'Test Foo','2024-09-07 01:52:22','250','Test Foo',2,2,3,0),(134,13,'French translation','2024-09-07 02:03:32','100','French translation',2,2,4,0),(135,13,'French translation','2024-09-07 02:04:05','100','French translation',2,2,4,0),(136,13,'French translation','2024-09-07 02:04:17','100','French translation',2,2,4,0),(137,13,'Foo','2024-09-07 02:06:12','100','Foo',2,3,4,0),(138,13,'Foo','2024-09-07 02:11:32','100','Foo',2,3,4,0),(139,13,'Foo test','2024-10-02 10:47:04','100','Description',2,2,2,1),(140,13,'Foo saved project','2024-10-02 11:04:04','0','',NULL,NULL,2,1),(141,13,'Bar researdh','2024-10-02 12:07:29','100','Bar researdh',3,3,2,0),(142,13,'Bar researdh','2024-10-02 12:07:29','100','Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh gg Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh Bar researdhBar researdh .',3,3,2,0),(143,13,'Tere Homikust Kulake','2024-10-25 16:08:13','50','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,',2,1,5,0),(144,13,'Test 251024','2024-10-25 21:45:13','0','Test 251024',2,3,2,0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_category`
--

DROP TABLE IF EXISTS `project_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_category`
--

LOCK TABLES `project_category` WRITE;
/*!40000 ALTER TABLE `project_category` DISABLE KEYS */;
INSERT INTO `project_category` VALUES (1,'Data Entry','Data extraction'),(2,'Research','Data research'),(3,'Web Development','Web development'),(4,'Translation','Translation'),(5,'Other','Other');
/*!40000 ALTER TABLE `project_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_duration`
--

DROP TABLE IF EXISTS `project_duration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_duration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_duration`
--

LOCK TABLES `project_duration` WRITE;
/*!40000 ALTER TABLE `project_duration` DISABLE KEYS */;
INSERT INTO `project_duration` VALUES (1,'Less than 2 Weeks','Less than 2 Weeks'),(2,'2 Weeks to 1  Month','2 Weeks to 1  Month'),(3,'More than 1 Month','More than 1 Month'),(4,'More than 2 Months','More than 2 Months');
/*!40000 ALTER TABLE `project_duration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_file`
--

DROP TABLE IF EXISTS `project_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `Project_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B50EFE0859301C4C` (`Project_id`),
  CONSTRAINT `FK_B50EFE0859301C4C` FOREIGN KEY (`Project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_file`
--

LOCK TABLES `project_file` WRITE;
/*!40000 ALTER TABLE `project_file` DISABLE KEYS */;
INSERT INTO `project_file` VALUES (7,'Rwanda_Credit Management companies_page1.json','7469','json','2024-08-10 22:00:26','Rwanda-Credit-Management-companies-page1-66b7e2fa88392.json',102),(8,'Rwanda_Plumbing AND Water companies_page20.json','2','json','2024-08-10 22:00:26','Rwanda-Plumbing-AND-Water-companies-page20-66b7e2fa9d85e.json',102),(12,'Tanzania_Churchs_page10.json','609','json','2024-08-11 13:30:06','Tanzania-Churchs-page10-66b8bcde1360a.json',102),(13,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-08-17 13:54:49','KDPaOagTJCmUc4-Copie-66c0aba93b562.png',116),(14,'KDPaOagTJCmUc4.jpg','550168','jpg','2024-08-17 13:54:49','KDPaOagTJCmUc4-66c0aba93d390.png',116),(69,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-08-17 23:06:39','KDPaOagTJCmUc4-Copie-66c12cff18be1.png',119),(70,'LlnjgFIGGIRRXN.jpg','54703','jpg','2024-08-17 23:06:39','LlnjgFIGGIRRXN-66c12cff1a897.jpg',119),(71,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 01:52:24','KDPaOagTJCmUc4-Copie-66dbb1d7ae5d8.png',133),(72,'Malawi_Auto Repair_page7.json','17145','json','2024-09-07 01:52:24','Malawi-Auto-Repair-page7-66dbb1d89c31a.json',133),(73,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 02:03:32','KDPaOagTJCmUc4-Copie-66dbb474baf79.png',134),(74,'Rwanda_Credit Management companies_page1.json','7469','json','2024-09-07 02:03:32','Rwanda-Credit-Management-companies-page1-66dbb474c3c3e.json',134),(75,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 02:04:05','KDPaOagTJCmUc4-Copie-66dbb495e45b7.png',135),(76,'Rwanda_Credit Management companies_page1.json','7469','json','2024-09-07 02:04:05','Rwanda-Credit-Management-companies-page1-66dbb495f04dd.json',135),(77,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 02:04:18','KDPaOagTJCmUc4-Copie-66dbb4a20fcd9.png',136),(78,'Rwanda_Credit Management companies_page1.json','7469','json','2024-09-07 02:04:18','Rwanda-Credit-Management-companies-page1-66dbb4a219fd5.json',136),(79,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 02:06:14','KDPaOagTJCmUc4-Copie-66dbb5161dc1b.png',137),(80,'Malawi_Auto Repair_page7.json','17145','json','2024-09-07 02:06:14','Malawi-Auto-Repair-page7-66dbb51637eaa.json',137),(81,'KDPaOagTJCmUc4 - Copie.jpg','550168','jpg','2024-09-07 02:11:32','KDPaOagTJCmUc4-Copie-66dbb6547f688.png',138),(82,'Malawi_Auto Repair_page7.json','17145','json','2024-09-07 02:11:32','Malawi-Auto-Repair-page7-66dbb6548a905.json',138),(83,'business-operations-survey-2023-business-practices.csv','2947560','csv','2024-10-02 10:47:06','business-operations-survey-2023-business-practices-66fd24a9e4ade.csv',139),(84,'CooperRivet02.jpg','132151','jpg','2024-10-25 16:08:13','CooperRivet02-671bc26dc165d.jpg',143);
/*!40000 ALTER TABLE `project_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_status`
--

DROP TABLE IF EXISTS `project_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_status`
--

LOCK TABLES `project_status` WRITE;
/*!40000 ALTER TABLE `project_status` DISABLE KEYS */;
INSERT INTO `project_status` VALUES (1,'Invitation registered','Invitation registered'),(2,'Started','Invitation replied'),(3,'Draft','Draft'),(4,'Invitation sent','Invitation sent'),(5,'Project viewed','Project viewed');
/*!40000 ALTER TABLE `project_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_type`
--

DROP TABLE IF EXISTS `project_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_type`
--

LOCK TABLES `project_type` WRITE;
/*!40000 ALTER TABLE `project_type` DISABLE KEYS */;
INSERT INTO `project_type` VALUES (1,'Company to employee','Company to employee'),(2,'Outsourced Project','Outsourced Project'),(3,'Teacher to students','Teacher to students'),(4,'Default','Default');
/*!40000 ALTER TABLE `project_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user_status`
--

DROP TABLE IF EXISTS `project_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_user_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D69D89DAA76ED395` (`user_id`),
  KEY `IDX_D69D89DA6BF700BD` (`status_id`),
  KEY `IDX_D69D89DA166D1F9C` (`project_id`),
  CONSTRAINT `FK_D69D89DA166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_D69D89DA6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `project_status` (`id`),
  CONSTRAINT `FK_D69D89DAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=867 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user_status`
--

LOCK TABLES `project_user_status` WRITE;
/*!40000 ALTER TABLE `project_user_status` DISABLE KEYS */;
INSERT INTO `project_user_status` VALUES (836,13,1,119,'2024-08-17 21:37:08','jane@diamta.com'),(840,13,1,120,'2024-08-17 23:17:20','jane@diamta.com'),(841,13,1,121,'2024-08-17 23:28:07','jane@diamta.com'),(844,35,4,124,'2024-08-18 15:28:38','sales@diamta.com'),(845,35,4,125,'2024-08-28 16:19:21','sales@diamta.com'),(846,35,4,126,'2024-08-28 16:38:02','sales@diamta.com'),(847,35,5,127,'2024-08-28 16:40:17','sales@diamta.com'),(848,35,4,128,'2024-08-28 16:49:17','sales@diamta.com'),(849,8,4,129,'2024-08-29 15:48:31','yaosoft@hotmail.com'),(850,35,5,129,'2024-08-29 15:48:31','sales@diamta.com'),(851,35,1,130,'2024-09-07 01:39:53','sales@diamta.com'),(852,35,1,131,'2024-09-07 01:40:36','sales@diamta.com'),(853,35,1,132,'2024-09-07 01:45:27','sales@diamta.com'),(854,35,1,133,'2024-09-07 01:52:23','sales@diamta.com'),(855,35,1,134,'2024-09-07 02:03:32','sales@diamta.com'),(856,35,1,135,'2024-09-07 02:04:05','sales@diamta.com'),(857,35,1,136,'2024-09-07 02:04:18','sales@diamta.com'),(858,35,1,137,'2024-09-07 02:06:13','sales@diamta.com'),(859,35,1,138,'2024-09-07 02:11:32','sales@diamta.com'),(860,35,1,139,'2024-10-02 10:47:05','sales@diamta.com'),(861,8,4,141,'2024-10-02 12:07:30','yaosoft@hotmail.com'),(862,8,1,142,'2024-10-02 12:07:30','yaosoft@hotmail.com'),(863,8,1,143,'2024-10-25 16:08:13','yaosoft@hotmail.com'),(864,8,4,144,'2024-10-25 21:45:13','yaosoft@hotmail.com'),(865,35,5,144,'2024-10-25 21:45:13','sales@diamta.com'),(866,36,5,144,'2024-10-25 21:45:13','videocm01@gmail.com');
/*!40000 ALTER TABLE `project_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `isadmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'	Johanna Toom','	johanna toom','yaosoft@hotmail.com','yaosoft@hotmail.com',1,NULL,'$2y$13$1NvF/zQMyvT9b98jZsmqYuIFPlDabv5hKvExhwjVp6HWxRONxuqYm','2024-07-13 20:32:04',NULL,NULL,'a:0:{}',1),(9,'Test','test','info@diamta.com','info@diamta.com',0,NULL,'$2y$13$NcGF0FOMKOpssyhpodYus.jMQvyR3ABO3SF/gpVFg1vd8hzOY04AS','2024-04-01 22:09:56','ts6XdbvylSpNIlyYhAmSqHqOMwqvYq3wPC6MeYSOBXI',NULL,'a:0:{}',0),(13,'jane@diamta.com','jane@diamta.com','jane@diamta.com','jane@diamta.com',0,NULL,'$2y$13$F/EWNjw9FF7hTMs0kzlM7.Pk.pg5bOPi0CWe0tDvJrZ.CaQ1jq0Dm','2024-07-08 15:25:30','gCrTrPnbiJLo2rAWP7BSYAFGjxwyGNZIK6riy3N7mW0',NULL,'a:0:{}',0),(15,'foo@bar.com','foo@bar.com','foo@bar.com','foo@bar.com',1,NULL,'$2y$13$YRxS97E6Mdi59Nk9gYyImeUZJBvlpfQn6vpUk.Q8aHjJF9eFeaeLS','2024-07-08 11:32:04',NULL,NULL,'a:0:{}',0),(17,'goo@oo.oo','goo@oo.oo','goo@oo.oo','goo@oo.oo',1,NULL,'$2y$13$VnZ/6eRHNhPJ8ca39ArHde2xRL34doG4EN5Nz0HqLcAd17RsPBmK2',NULL,NULL,NULL,'a:0:{}',0),(35,'sales@diamta.com','sales@diamta.com','sales@diamta.com','sales@diamta.com',1,NULL,'$2y$13$qdb2QmndPjV20OABUnhBCOPjDkJokjF1b6VlVHx/gY3HN.EbswEmS',NULL,NULL,NULL,'a:0:{}',0),(36,'videocm01@gmail.com','videocm01@gmail.com','videocm01@gmail.com','videocm01@gmail.com',1,NULL,'$2y$13$DZPf27eM0B/ANBKIfKPECuCRT1AuSS0pVk1JZ5qVyp.tM3Wqdg9yK',NULL,NULL,NULL,'a:0:{}',0),(37,'test10@diamta.com','test10@diamta.com','test10@diamta.com','test10@diamta.com',1,NULL,'$2y$13$HXPGaYXgxBeDfm6Sq0ojzekgFvVBnuDjClDBQ4pc2gNG5bRWmRepm',NULL,NULL,NULL,'a:0:{}',0),(38,'john@diamta.com','john@diamta.com','john@diamta.com','john@diamta.com',1,NULL,'$2y$13$En5gCthw0iv./iKWuSY47O6Je7z7uFs/xjjmErGfPRgOMoglxszyG',NULL,NULL,NULL,'a:0:{}',0),(39,'ach4life@gmail.com','ach4life@gmail.com','ach4life@gmail.com','ach4life@gmail.com',1,NULL,'$2y$13$yuRwABcuuXS.R2BInRII6.8UIZNfyM6kcJ7ggfhRNzRa7EC6K8xwm',NULL,NULL,NULL,'a:0:{}',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24  1:56:25
