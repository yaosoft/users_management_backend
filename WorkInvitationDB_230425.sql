-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: 237usadb
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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Ville_id` int DEFAULT NULL,
  `Quartier_id` int DEFAULT NULL,
  `user_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C35F0816A73F0036` (`Ville_id`),
  KEY `IDX_C35F0816DF1E57AB` (`Quartier_id`),
  CONSTRAINT `FK_C35F08165982D87C` FOREIGN KEY (`Quartier_id`) REFERENCES `quartier` (`id`),
  CONSTRAINT `FK_C35F08165E496260` FOREIGN KEY (`Ville_id`) REFERENCES `ville` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (42,'6456 65  ',1,3,'afa4ce89-ddf9-453e-9d68-514b6895e21f','2024-07-26 17:22:31'),(43,'ghhj ghjgh',2,244,'afa4ce89-ddf9-453e-9d68-514b6895e21f','2024-07-26 17:23:55'),(44,'aze aze',2,248,'afa4ce89-ddf9-453e-9d68-514b6895e21f','2024-07-26 21:39:36');
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_color` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_new_image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_line_description` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_size_order` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price_buy` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_price_benefit` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_tax` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `initial_product_quantity` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_category` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_sub_category` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `product_price` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_update` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_description`
--

DROP TABLE IF EXISTS `product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `Product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C1CBDE39AD9658A` (`Product_id`),
  CONSTRAINT `FK_C1CBDE39AD9658A` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_description`
--

LOCK TABLES `product_description` WRITE;
/*!40000 ALTER TABLE `product_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `Product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64617F03AD9658A` (`Product_id`),
  CONSTRAINT `FK_64617F03AD9658A` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `size` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `Product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7A2806CBAD9658A` (`Product_id`),
  CONSTRAINT `FK_7A2806CBAD9658A` FOREIGN KEY (`Product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_size`
--

LOCK TABLES `product_size` WRITE;
/*!40000 ALTER TABLE `product_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quartier`
--

DROP TABLE IF EXISTS `quartier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quartier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Ville_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FEE8962DA73F0036` (`Ville_id`),
  CONSTRAINT `FK_FEE8962D5E496260` FOREIGN KEY (`Ville_id`) REFERENCES `ville` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quartier`
--

LOCK TABLES `quartier` WRITE;
/*!40000 ALTER TABLE `quartier` DISABLE KEYS */;
INSERT INTO `quartier` VALUES (1,'BALI',NULL,1),(2,'BASE ELF',NULL,1),(3,'AKWA',NULL,1),(4,'AKWA NORD',NULL,1),(5,'AXE-LOURD DLA-YDE',NULL,1),(6,'BALI',NULL,1),(7,'BASE ELF',NULL,1),(8,'BASE NAVALE',NULL,1),(9,'BASSA',NULL,1),(10,'BASSA Z.I',NULL,1),(11,'BASSA-CCC',NULL,1),(12,'BEPENDA',NULL,1),(13,'BEPENDA AXE-LOURD',NULL,1),(14,'BEPENDA-OMNISPORT',NULL,1),(15,'BONABERI',NULL,1),(16,'BONABERI-BEKOKO',NULL,1),(17,'BONABERI-BOJONGO',NULL,1),(18,'BONABERI-BONASSAMA',NULL,1),(19,'BONABERI-MABANDA',NULL,1),(20,'BONABERI-SODIKO',NULL,1),(21,'BONADIBONG',NULL,1),(22,'BONAMOUSSADI',NULL,1),(23,'BONANJO',NULL,1),(24,'BONAPRISO',NULL,1),(25,'BORNE 10',NULL,1),(26,'BRAZZAVILLE',NULL,1),(27,'CAMP YABASSI',NULL,1),(28,'CITE-CICAM',NULL,1),(29,'CITE-PALMIERS',NULL,1),(30,'CITE-SIC',NULL,1),(31,'DAKAR',NULL,1),(32,'DEIDO',NULL,1),(33,'DEIDO BESSENGUE',NULL,1),(34,'NEW DEIDO',NULL,1),(35,'ESSEC',NULL,1),(36,'GHANA',NULL,1),(37,'JAPOMA',NULL,1),(38,'KENYA',NULL,1),(39,'KM5-TERMINUS',NULL,1),(40,'KOTTO',NULL,1),(42,'LOG-POM',NULL,1),(43,'LOGBABA',NULL,1),(44,'LOGBESSOU',NULL,1),(45,'MADAGASCAR',NULL,1),(46,'MAKEPE',NULL,1),(47,'MAKEPE-LOGPOM',NULL,1),(48,'MAKEPE-MISSOKE',NULL,1),(49,'MARCHE CONGO',NULL,1),(50,'MBANGUE',NULL,1),(51,'MBANYA&amp;SABLE',NULL,1),(52,'MBOPPI',NULL,1),(53,'NAMIBIA',NULL,1),(54,'NDOGBONG',NULL,1),(55,'NDOGPASSI I',NULL,1),(56,'NDOGPASSI II',NULL,1),(57,'NDOGPASSI III',NULL,1),(58,'NDOGSIMBI',NULL,1),(59,'NDOKOTTI',NULL,1),(60,'NEW-BELL',NULL,1),(61,'NKONGMONDO',NULL,1),(62,'NKOULOULOUN',NULL,1),(63,'NYALLA',NULL,1),(64,'PK10',NULL,1),(65,'PK11',NULL,1),(66,'PK12',NULL,1),(67,'PK13',NULL,1),(68,'PK14',NULL,1),(69,'PK15',NULL,1),(70,'PK16',NULL,1),(71,'PK17',NULL,1),(72,'PK18',NULL,1),(73,'PK19',NULL,1),(74,'PK23',NULL,1),(75,'PK25',NULL,1),(76,'PK8',NULL,1),(77,'PK9',NULL,1),(78,'ROND-POINT DEIDO',NULL,1),(79,'VILLAGE',NULL,1),(80,'YASSA',NULL,1),(81,'YOUPWE',NULL,1),(242,'AEROPORT',NULL,2),(243,'AHALA',NULL,2),(244,'ANGUISSA',NULL,2),(245,'Bastos',NULL,2),(246,'BIYEM-ASSI',NULL,2),(247,'BRIQUETERIE',NULL,2),(248,'Carrière',NULL,2),(249,'CENTRE VILLE',NULL,2),(250,'CENTRE VILLE COMMERCIAL',NULL,2),(251,'Cité Mfandena',NULL,2),(252,'CITE VERTE',NULL,2),(253,'DAMAS',NULL,2),(254,'Djoungolo',NULL,2),(255,'ECOLE DE POLICE',NULL,2),(256,'Efoulan',NULL,2),(257,'EKIE',NULL,2),(258,'EKOUMDOUM',NULL,2),(259,'EKOUNOU',NULL,2),(260,'Elig Effa',NULL,2),(261,'ELIG ESSONO',NULL,2),(262,'ELIG-EDZOUA',NULL,2),(263,'Elig-Essono',NULL,2),(264,'EMANA',NULL,2),(265,'Emombo',NULL,2),(266,'Essomba',NULL,2),(267,'ESSOS',NULL,2),(268,'ETOA-MEKI',NULL,2),(269,'ETOUDI',NULL,2),(270,'ETOUG-EBE',NULL,2),(271,'FOUDA',NULL,2),(272,'HIPPODROME',NULL,2),(273,'LAC',NULL,2),(274,'MADAGASCAR',NULL,2),(275,'MANGUIER',NULL,2),(276,'MBALLA I & IV',NULL,2),(277,'MBALLA II',NULL,2),(278,'MBALMAYO',NULL,2),(279,'Mbankolo',NULL,2),(280,'MELEN',NULL,2),(281,'MENDONG',NULL,2),(282,'MESSA',NULL,2),(283,'MESSASSI',NULL,2),(284,'MIMBOMAN',NULL,2),(285,'MINI-FERME',NULL,2),(286,'MOKOLO',NULL,2),(287,'MVAN',NULL,2),(288,'MVOG BETI',NULL,2),(289,'MVOG-ADA',NULL,2),(290,'MVOG-MBI',NULL,2),(291,'MVOLYE',NULL,2),(292,'NGOA EKELE',NULL,2),(293,'NGOUSSO',NULL,2),(294,'NKOABANG',NULL,2),(295,'Nkol-Eton',NULL,2),(296,'NKOLBIKOK',NULL,2),(297,'NKOLBISSON',NULL,2),(298,'NKOLDONGO',NULL,2),(299,'Nkolmesseng',NULL,2),(300,'NKOMKANA',NULL,2),(301,'Nkomo',NULL,2),(302,'NKONDENGUI',NULL,2),(303,'NLONGKAK',NULL,2),(304,'NSAM',NULL,2),(305,'Nsimeyong',NULL,2),(306,'NYOM',NULL,2),(307,'OBILI',NULL,2),(308,'Odza',NULL,2),(309,'Olembe',NULL,2),(310,'Olézoa',NULL,2),(311,'OMNISPORT',NULL,2),(312,'Oyom-Abang',NULL,2),(313,'Quartier Lac',NULL,2),(314,'SANTA-BARBARA',NULL,2),(315,'SIMBOCK',NULL,2),(316,'SOA & ELEVEUR',NULL,2),(317,'Titi Garage',NULL,2),(318,'TONGOLO',NULL,2),(319,'TROPICANA',NULL,2),(320,'TSINGA',NULL,2),(321,'Warda',NULL,2);
/*!40000 ALTER TABLE `quartier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_element`
--

DROP TABLE IF EXISTS `site_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_element` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `element_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `element_default_image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_element`
--

LOCK TABLES `site_element` WRITE;
/*!40000 ALTER TABLE `site_element` DISABLE KEYS */;
INSERT INTO `site_element` VALUES (50,'Favicon','','Browser\'s tab small icon','2025-01-16 12:04:04','','favicon-6789128bb0468.png'),(51,'Logo','https://237usa.com','Site logo','2025-01-16 14:08:49','','logo-santa-67891e3d01449.png'),(52,'Large','https://www.237usa.com/categories/hommes/jeans-et-pantalons','Large ad on the home page','2025-01-16 14:18:10','','testBan10-678921728a635.jpg'),(53,'A la une 01','https://237usa.com/categories/hommes/chaussures','1er produit à la une sur la page d\'accueil','2025-01-16 15:20:32','','promotion11-678923c086988.jpg'),(54,'A la une 02','https://237usa.com/categories/femmes/chaussures','2eme produit à la une sur la page d\'accueil','2025-01-16 15:25:19','','promotion02-678924df85d63.jpg'),(55,'Pub 01','https://www.booking.com/hotel/cm/la-principaute-douala-douala.fr.html','1ere bannière publicitaire sur la page d\'accueil','2025-01-16 15:41:33','','ban01-678928ae2032c.jpg'),(56,'Pub 02','https://www.booking.com/hotel/cm/la-principaute-douala-douala.fr.html','1ere bannière publicitaire sur la page d\'accueil','2025-01-16 15:45:07','','HotelLaPrincipaute530x240-67892984c2322.jpg');
/*!40000 ALTER TABLE `site_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_element_image`
--

DROP TABLE IF EXISTS `site_element_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_element_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `siteElement_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_53BC186D7BD4FE9C` (`siteElement_id`),
  CONSTRAINT `FK_53BC186D7BD4FE9C` FOREIGN KEY (`siteElement_id`) REFERENCES `site_element` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_element_image`
--

LOCK TABLES `site_element_image` WRITE;
/*!40000 ALTER TABLE `site_element_image` DISABLE KEYS */;
INSERT INTO `site_element_image` VALUES (10,'favicon.ico','favicon-6788f5b54a429.ico','3870','ico','2025-01-16 12:04:05',50),(11,'favicon.png','favicon-6788f5b5c1e46.png','42155','png','2025-01-16 12:04:05',50),(12,'favicon.png','favicon-6789128bb0468.png','39545','png','2025-01-16 14:07:07',50),(13,'logo_light.png','logo-light-67891e3ce8cd3.png','43182','png','2025-01-16 14:57:00',51),(14,'logo_santa.png','logo-santa-67891e3d01449.png','45096','png','2025-01-16 14:57:01',51),(15,'testBan10.jpg','testBan10-678921728a635.jpg','138922','jpg','2025-01-16 15:10:42',52),(16,'promotion11.jpg','promotion11-678923c086988.jpg','18821','jpg','2025-01-16 15:20:32',53),(17,'promotion02.jpg','promotion02-678924df85d63.jpg','18689','jpg','2025-01-16 15:25:19',54),(18,'ban01.jpg','ban01-678928ae2032c.jpg','77425','jpg','2025-01-16 15:41:34',55),(19,'HotelLaPrincipauté530x240.jpg','HotelLaPrincipaute530x240-67892984c2322.jpg','33139','jpg','2025-01-16 15:45:08',56);
/*!40000 ALTER TABLE `site_element_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `note` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,10,'ab','1686014b-f33b-4ad5-b891-be9f94db024e'),(2,0,'Foo','cfaff3eb-b37a-4dc2-955c-41f7a8c6ff63'),(3,0,'bar','cfaff3eb-b37a-4dc2-955c-41f7a8c6ff64');
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville`
--

DROP TABLE IF EXISTS `ville`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `map` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville`
--

LOCK TABLES `ville` WRITE;
/*!40000 ALTER TABLE `ville` DISABLE KEYS */;
INSERT INTO `ville` VALUES (1,'Douala',''),(2,'Yaoundé','');
/*!40000 ALTER TABLE `ville` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 11:15:09
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: diamta_projects
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
  PRIMARY KEY (`id`),
  KEY `IDX_2A03AB51C33D4F7` (`chatFileCategory_id`),
  KEY `IDX_2A03AB51A76ED395` (`user_id`),
  KEY `IDX_2A03AB51CD53EDB6` (`receiver_id`),
  KEY `IDX_2A03AB51166D1F9C` (`project_id`),
  CONSTRAINT `FK_2A03AB51166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_2A03AB51A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_2A03AB51C33D4F7` FOREIGN KEY (`chatFileCategory_id`) REFERENCES `chat_item_category` (`id`),
  CONSTRAINT `FK_2A03AB51CD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_file`
--

LOCK TABLES `chat_file` WRITE;
/*!40000 ALTER TABLE `chat_file` DISABLE KEYS */;
INSERT INTO `chat_file` VALUES (1,13,8,8,1,0,'Resume.txt','Resume-6613fad77a5cd.txt','3068','txt','2024-04-08 14:10:31',1),(2,13,8,8,1,0,'Resume.txt','Resume-6613fba8ea28a.txt','3068','txt','2024-04-08 14:14:00',1),(3,13,8,8,1,0,'INVITATION.pdf','INVITATION-6613fd65f2928.pdf','1032567','pdf','2024-04-08 14:21:25',1),(4,13,8,8,1,0,'INVITATION.pdf','INVITATION-6613fd7b0b476.pdf','1032567','pdf','2024-04-08 14:21:47',5),(5,13,8,8,1,0,'INVITATION.pdf','INVITATION-66140bc10d82b.pdf','1032567','pdf','2024-04-08 15:22:41',5),(6,13,8,8,1,0,'Resume.txt','Resume-66140f43299ae.txt','3068','txt','2024-04-08 15:37:39',1),(7,13,8,8,1,0,'Facture Lodanone.pdf','Facture-Lodanone-66141058cbf80.pdf','188533','pdf','2024-04-08 15:42:16',1),(8,13,8,8,1,0,'Resume.txt','Resume-6614134dd9dd2.txt','3068','txt','2024-04-08 15:54:53',1),(9,13,8,8,1,0,'Resume.txt','Resume-66141377e28ba.txt','3068','txt','2024-04-08 15:55:35',1),(10,13,8,8,1,0,'Resume.txt','Resume-6614157b598a7.txt','3068','txt','2024-04-08 16:04:11',1),(11,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-661415e400482.pdf','212253','pdf','2024-04-08 16:05:55',1),(12,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-6614161d504db.pdf','212253','pdf','2024-04-08 16:06:53',1),(13,13,8,8,1,0,'Resume.txt','Resume-661419269b17c.txt','3068','txt','2024-04-08 16:19:50',1),(14,13,8,8,1,0,'Resume.txt','Resume-66141947df908.txt','3068','txt','2024-04-08 16:20:23',1),(15,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-661419bb0c12a.jpg','38767','jpg','2024-04-08 16:22:19',1),(16,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141bf6754ab.jpg','38767','jpg','2024-04-08 16:31:50',1),(17,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141c1d9a4eb.jpg','38767','jpg','2024-04-08 16:32:29',1),(18,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66141d9848518.jpg','38767','jpg','2024-04-08 16:38:48',1),(19,13,8,8,1,0,'pic01-660f369b32088.jpg','pic01-660f369b32088-66142e1804cf4.jpg','38767','jpg','2024-04-08 17:49:12',5),(20,13,8,8,1,0,'Resume.txt','Resume-661430b2a47b2.txt','3068','txt','2024-04-08 18:00:18',4),(21,13,8,8,1,0,'Resume.txt','Resume-661430f9da589.txt','3068','txt','2024-04-08 18:01:29',5),(22,13,8,8,1,0,'Resume.txt','Resume-6614a6e1513b2.txt','3068','txt','2024-04-09 02:24:32',4),(23,13,8,8,1,0,'YaoviTchuissiResume.pdf','YaoviTchuissiResume-6615810182915.pdf','212253','pdf','2024-04-09 17:55:12',4),(24,13,8,8,1,0,'Resume.txt','Resume-661586d9052d5.txt','3068','txt','2024-04-09 18:20:09',4),(25,13,8,8,1,0,'Resume.txt','Resume-66158792f09a8.txt','3068','txt','2024-04-09 18:23:14',5),(26,13,8,8,1,0,'Resume-661430f9da589.txt','Resume-661430f9da589-661587f8740e3.txt','3068','txt','2024-04-09 18:24:56',4),(27,13,8,8,1,0,'Resume.txt','Resume-6615884cb8474.txt','3068','txt','2024-04-09 18:26:20',5),(28,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c54206330.txt','3068','txt','2024-04-10 16:58:41',4),(29,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c59fafaeb.txt','3068','txt','2024-04-10 17:00:15',4),(30,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616c76be297c.txt','3068','txt','2024-04-10 17:07:55',4),(31,13,8,8,1,0,'Resume.txt','Resume-6616cb7928007.txt','3068','txt','2024-04-10 17:25:13',4),(32,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cd6d57466.txt','3068','txt','2024-04-10 17:33:33',4),(33,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cd89b0211.txt','3068','txt','2024-04-10 17:34:01',5),(34,13,8,8,1,0,'Resume-661419269b17c.txt','Resume-661419269b17c-6616cec197112.txt','3068','txt','2024-04-10 17:39:13',4),(35,8,13,8,1,0,'images.jpeg','images-661d28a2260bc.jpg','6160','jpeg','2024-04-15 13:16:17',1),(36,13,8,8,1,0,'images.jpeg','images-661d3a5d49571.jpg','6160','jpeg','2024-04-15 14:31:57',4),(37,13,8,8,1,0,'images.png','images-661d48111153b.png','8451','png','2024-04-15 15:30:25',1),(38,13,8,8,1,0,'images.png','images-661d499b316a5.png','8451','png','2024-04-15 15:36:59',5),(39,13,8,8,1,0,'Resume.txt','Resume-661d4ab14cfb1.txt','3068','txt','2024-04-15 15:41:37',5),(40,13,8,8,1,0,'images.png','images-661d4ab3b6e69.png','8451','png','2024-04-15 15:41:39',5),(41,13,35,144,0,1,'Conair-Man01.jpg','Conair-Man01-6720a55997195.jpg','65321','jpg','2024-10-29 09:05:29',1),(42,13,35,144,0,1,'Conair-Man01.jpg','Conair-Man01-6720a5c23e0be.jpg','65321','jpg','2024-10-29 09:07:14',1),(43,13,35,144,0,1,'CooperRivet01.jpg','CooperRivet01-672123e069414.jpg','234814','jpg','2024-10-29 18:05:20',4),(44,13,35,144,0,1,'Conair-Man06.jpg','Conair-Man06-672156258c548.jpg','76064','jpg','2024-10-29 21:39:49',4),(45,13,35,144,0,1,'CooperRivet02.jpg','CooperRivet02-67215b89f3efe.jpg','132151','jpg','2024-10-29 22:02:49',1);
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
INSERT INTO `chat_file_chat_file` VALUES (4,3),(5,4),(19,11),(21,20),(25,24),(27,26),(33,23),(38,37),(39,37),(40,37);
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
INSERT INTO `chat_file_chat_message` VALUES (24,25),(26,25),(28,1),(29,2),(30,1),(31,35),(32,35),(34,28),(36,42),(43,65),(44,59);
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
INSERT INTO `chat_message` VALUES (1,13,8,8,1,1,'2024-04-08 13:07:46',1,'12'),(2,13,8,8,1,1,'2024-04-08 13:40:04',1,'56'),(3,13,8,8,1,1,'2024-04-08 13:58:26',2,'g'),(4,13,8,8,1,1,'2024-04-08 14:14:06',1,'456'),(5,13,8,8,1,1,'2024-04-08 14:16:54',2,'12'),(6,13,8,8,1,1,'2024-04-08 14:20:35',1,'46'),(7,13,8,8,1,1,'2024-04-08 14:20:54',2,'r46'),(8,13,8,8,1,1,'2024-04-08 15:22:39',3,'456'),(9,13,8,8,1,1,'2024-04-08 15:41:57',1,'123'),(10,13,8,8,1,1,'2024-04-08 15:42:32',2,'321'),(11,13,8,8,1,1,'2024-04-08 15:55:35',1,'123'),(12,13,8,8,1,1,'2024-04-08 16:05:55',1,'cvb'),(13,13,8,8,1,1,'2024-04-08 16:06:52',1,'12'),(14,13,8,8,1,1,'2024-04-08 16:19:23',1,'1'),(15,13,8,8,1,1,'2024-04-08 16:20:23',1,'1'),(16,13,8,8,1,1,'2024-04-08 16:22:19',1,'2'),(17,13,8,8,1,1,'2024-04-08 16:31:51',1,'4'),(18,13,8,8,1,1,'2024-04-08 16:32:28',1,'2'),(22,13,8,8,1,1,'2024-04-08 17:49:12',3,'Text also'),(23,13,8,8,1,1,'2024-04-09 00:56:11',3,'rep photo'),(24,13,8,8,1,1,'2024-04-09 00:56:52',3,'rep file'),(25,13,8,8,1,1,'2024-04-09 18:19:26',1,'foo'),(26,13,8,8,1,1,'2024-04-09 18:21:57',2,'foo reply'),(27,13,8,8,1,1,'2024-04-09 18:22:18',3,'resume reply'),(28,13,8,8,1,1,'2024-04-10 17:01:01',2,'123'),(29,13,8,8,1,1,'2024-04-10 17:04:19',2,'foo'),(33,13,8,8,1,1,'2024-04-10 17:16:05',1,'784'),(34,13,8,8,1,1,'2024-04-10 17:16:42',1,'aze'),(35,13,8,8,1,1,'2024-04-10 17:17:26',1,'po'),(36,13,8,8,1,1,'2024-04-10 17:30:52',2,'78'),(37,13,8,8,1,1,'2024-04-10 17:31:38',2,'pm'),(39,8,13,8,1,1,'2024-04-15 13:15:01',2,'rep 4'),(40,8,13,8,1,1,'2024-04-15 13:16:41',3,'rep img diesel'),(41,13,8,8,1,1,'2024-04-15 14:28:26',2,'Ok to rep 4'),(42,13,8,8,1,1,'2024-04-15 14:28:51',2,'Ok to OK to rep 4'),(43,13,8,8,1,1,'2024-04-15 14:31:59',2,'Image Ok to Ok to Ok to Rep 4'),(44,13,8,8,1,1,'2024-04-15 15:38:01',3,'ok'),(45,13,8,8,1,1,'2024-04-15 18:04:13',1,'123'),(46,8,13,8,0,1,'2024-04-15 19:20:14',1,'Got it'),(47,8,13,8,0,1,'2024-04-15 21:58:05',1,'Hello Jane\nIs there any update'),(48,8,13,8,0,1,'2024-04-15 22:19:41',1,'confirme it please'),(49,8,13,8,0,1,'2024-04-15 22:44:06',1,'I\'m fine'),(50,8,13,8,0,1,'2024-04-15 23:26:50',2,'Nice'),(51,8,13,8,0,1,'2024-04-16 00:36:53',1,'Thanks'),(52,13,13,141,0,1,'2024-10-03 20:23:41',1,'Test'),(53,35,13,129,0,1,'2024-10-03 20:57:22',1,'123'),(54,35,13,129,0,1,'2024-10-03 20:58:07',1,'456'),(55,36,13,144,0,1,'2024-10-26 00:18:59',1,'123'),(56,36,13,144,0,1,'2024-10-26 00:23:04',1,'123'),(57,35,13,144,0,1,'2024-10-26 11:06:31',1,'Hello,\nI\'m ready'),(58,35,13,144,0,1,'2024-10-26 11:11:22',1,'Foo'),(59,35,13,144,0,1,'2024-10-26 11:54:34',1,'123'),(60,35,13,144,0,1,'2024-10-26 11:56:31',1,'I\'m ready'),(61,13,35,144,0,1,'2024-10-26 14:48:00',1,'Okay'),(62,13,35,144,0,1,'2024-10-26 14:48:29',1,'This are the files'),(63,13,36,144,0,1,'2024-10-26 14:54:54',1,'aze'),(64,13,36,144,0,1,'2024-10-26 15:09:47',1,'aze'),(65,35,13,144,0,1,'2024-10-27 20:05:44',1,'Cool'),(66,13,13,144,0,1,'2024-10-27 22:14:57',2,'Aze reply'),(67,13,13,144,0,1,'2024-10-27 22:19:11',1,'foo'),(68,13,13,144,0,1,'2024-10-27 22:52:24',1,'foo'),(69,13,35,144,0,1,'2024-10-27 23:11:22',1,'foo'),(70,35,13,144,0,1,'2024-10-27 23:14:13',1,'bar'),(71,35,13,144,0,1,'2024-10-27 23:14:59',2,'baz'),(72,13,35,144,0,1,'2024-10-27 23:17:02',2,'tata'),(73,13,35,144,0,1,'2024-10-29 18:05:13',2,'Reply to cool wih text and image'),(74,13,35,144,0,1,'2024-10-29 21:39:44',2,'The 123 Conair'),(75,13,35,144,0,1,'2024-10-29 22:02:41',1,'Replying to an image with a text and an image');
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
INSERT INTO `chat_message_chat_file` VALUES (8,4),(22,11),(23,19),(24,21),(27,24),(40,35),(44,38);
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
INSERT INTO `chat_message_chat_message` VALUES (3,2),(5,4),(7,6),(10,9),(26,25),(28,1),(29,1),(36,35),(37,26),(39,17),(41,39),(42,41),(43,42),(50,49),(66,63),(71,69),(72,71),(73,65),(74,59);
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
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `biography` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_8157AA0FA76ED395` (`user_id`),
  CONSTRAINT `FK_8157AA0FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (3,13,'Jane Jackson',NULL,NULL,'Mayor','');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'	Johanna Toom','	johanna toom','yaosoft@hotmail.com','yaosoft@hotmail.com',1,NULL,'$2y$13$1NvF/zQMyvT9b98jZsmqYuIFPlDabv5hKvExhwjVp6HWxRONxuqYm','2024-07-13 20:32:04',NULL,NULL,'a:0:{}',1),(9,'Test','test','info@diamta.com','info@diamta.com',0,NULL,'$2y$13$NcGF0FOMKOpssyhpodYus.jMQvyR3ABO3SF/gpVFg1vd8hzOY04AS','2024-04-01 22:09:56','ts6XdbvylSpNIlyYhAmSqHqOMwqvYq3wPC6MeYSOBXI',NULL,'a:0:{}',0),(13,'jane@diamta.com','jane@diamta.com','jane@diamta.com','jane@diamta.com',0,NULL,'$2y$13$F8hkYeU3LrRROQ9dq6Fja.E6gy8pJtG6j/Zve36J920f0M7qwsOlm','2024-07-08 15:25:30','gCrTrPnbiJLo2rAWP7BSYAFGjxwyGNZIK6riy3N7mW0',NULL,'a:0:{}',0),(15,'foo@bar.com','foo@bar.com','foo@bar.com','foo@bar.com',1,NULL,'$2y$13$YRxS97E6Mdi59Nk9gYyImeUZJBvlpfQn6vpUk.Q8aHjJF9eFeaeLS','2024-07-08 11:32:04',NULL,NULL,'a:0:{}',0),(17,'goo@oo.oo','goo@oo.oo','goo@oo.oo','goo@oo.oo',1,NULL,'$2y$13$VnZ/6eRHNhPJ8ca39ArHde2xRL34doG4EN5Nz0HqLcAd17RsPBmK2',NULL,NULL,NULL,'a:0:{}',0),(35,'sales@diamta.com','sales@diamta.com','sales@diamta.com','sales@diamta.com',1,NULL,'$2y$13$qdb2QmndPjV20OABUnhBCOPjDkJokjF1b6VlVHx/gY3HN.EbswEmS',NULL,NULL,NULL,'a:0:{}',0),(36,'videocm01@gmail.com','videocm01@gmail.com','videocm01@gmail.com','videocm01@gmail.com',1,NULL,'$2y$13$ILBxokpNu1s.2fjVSdD5QeACYxJL7bH3R6AmE.IycbNrJiZRbt0ya',NULL,NULL,NULL,'a:0:{}',0);
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

-- Dump completed on 2025-04-23 11:15:11
