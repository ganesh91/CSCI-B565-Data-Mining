CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `cidm`
--

DROP TABLE IF EXISTS `cidm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cidm` (
  `C1` varchar(5) DEFAULT NULL,
  `C2` int(2) DEFAULT NULL,
  `C3` varchar(2) DEFAULT NULL,
  `C4` varchar(2) DEFAULT NULL,
  `C5` varchar(2) DEFAULT NULL,
  `C6` varchar(2) DEFAULT NULL,
  `c7` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidm`
--

LOCK TABLES `cidm` WRITE;
/*!40000 ALTER TABLE `cidm` DISABLE KEYS */;
INSERT INTO `cidm` VALUES ('CID1',1,'3','5','5','10','8'),('CID2',4,'1','2','3','NA','NA'),('CID3',7,'8','1','NA','NA','NA'),('CID4',2,'NA','NA','NA','NA','NA'),('CID5',4,'8','10','NA','NA','NA'),('CID6',3,'9','10','1','NA','NA'),('CID7',1,'2','3','NA','NA','NA'),('CID8',5,'4','9','5','NA','NA'),('CID9',10,'1','2','23','NA','NA'),('CID10',2,'4','3','7','9','NA'),('CID11',1,'10','8','NA','NA','NA'),('CID12',3,'5','1','2','NA','NA'),('CID13',8,'1','7','NA','NA','NA'),('CID14',5,'2','8','NA','NA','NA');
/*!40000 ALTER TABLE `cidm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster_genere`
--

DROP TABLE IF EXISTS `cluster_genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster_genere` (
  `cust_id` varchar(5) DEFAULT NULL,
  `Romance` decimal(23,0) DEFAULT NULL,
  `SciFi` decimal(23,0) DEFAULT NULL,
  `Horror` decimal(23,0) DEFAULT NULL,
  `Comedy` decimal(23,0) DEFAULT NULL,
  `Drama` decimal(23,0) DEFAULT NULL,
  `Action` decimal(23,0) DEFAULT NULL,
  `Documentary` decimal(23,0) DEFAULT NULL,
  `Classic` decimal(23,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster_genere`
--

LOCK TABLES `cluster_genere` WRITE;
/*!40000 ALTER TABLE `cluster_genere` DISABLE KEYS */;
INSERT INTO `cluster_genere` VALUES ('CID1',5,1,2,2,3,2,0,1),('CID10',0,2,1,2,3,3,3,2),('CID11',3,1,1,1,0,0,0,1),('CID12',2,1,1,1,2,2,1,1),('CID13',2,1,1,1,1,1,1,1),('CID14',2,0,1,0,1,2,1,2),('CID2',1,2,1,1,1,2,2,2),('CID3',2,1,1,1,1,1,1,1),('CID4',0,0,0,0,0,1,1,1),('CID5',2,1,1,1,0,1,1,2),('CID6',2,2,1,2,2,0,0,0),('CID7',1,1,1,1,1,1,1,1),('CID8',2,2,0,0,3,3,1,1),('CID9',2,1,0,1,0,1,1,1);
/*!40000 ALTER TABLE `cluster_genere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cluster_movie`
--

DROP TABLE IF EXISTS `cluster_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cluster_movie` (
  `cust_id` varchar(5) DEFAULT NULL,
  `M1` decimal(23,0) DEFAULT NULL,
  `M2` decimal(23,0) DEFAULT NULL,
  `M3` decimal(23,0) DEFAULT NULL,
  `M4` decimal(23,0) DEFAULT NULL,
  `M5` decimal(23,0) DEFAULT NULL,
  `M6` decimal(23,0) DEFAULT NULL,
  `M7` decimal(23,0) DEFAULT NULL,
  `M8` decimal(23,0) DEFAULT NULL,
  `M9` decimal(23,0) DEFAULT NULL,
  `M10` decimal(23,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cluster_movie`
--

LOCK TABLES `cluster_movie` WRITE;
/*!40000 ALTER TABLE `cluster_movie` DISABLE KEYS */;
INSERT INTO `cluster_movie` VALUES ('CID1',1,0,1,0,2,0,0,1,1,1),('CID10',0,1,1,1,0,0,1,0,0,0),('CID11',1,0,0,0,0,0,0,1,1,1),('CID12',1,1,1,0,1,0,0,0,0,0),('CID13',1,0,0,0,0,0,1,1,1,0),('CID14',0,1,0,0,1,0,0,1,1,0),('CID2',1,1,1,1,0,0,0,0,0,0),('CID3',1,0,0,0,0,0,1,1,1,0),('CID4',0,1,0,0,0,0,0,0,0,0),('CID5',0,0,0,1,0,0,0,1,1,1),('CID6',1,0,1,0,0,0,0,0,0,1),('CID7',1,1,1,0,0,0,0,0,0,0),('CID8',0,0,0,1,2,0,0,0,0,0),('CID9',1,1,0,0,0,0,0,0,0,1);
/*!40000 ALTER TABLE `cluster_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_film`
--

DROP TABLE IF EXISTS `cust_film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_film` (
  `cust_id` varchar(5) DEFAULT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `genere` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_film`
--

LOCK TABLES `cust_film` WRITE;
/*!40000 ALTER TABLE `cust_film` DISABLE KEYS */;
INSERT INTO `cust_film` VALUES ('CID1',1,'Romance'),('CID1',1,'Science  Fiction'),('CID1',3,'Horror'),('CID1',3,'Drama'),('CID1',3,'Comedy'),('CID1',5,'Action'),('CID1',5,'Romance'),('CID1',5,'Romance'),('CID1',5,'Drama'),('CID1',5,'Action'),('CID1',5,'Drama'),('CID1',8,'Horror'),('CID1',8,'Romance'),('CID1',8,'Classic'),('CID1',10,'Comedy'),('CID1',10,'Romance'),('CID10',2,'Classic'),('CID10',2,'Action'),('CID10',2,'Documentary'),('CID10',3,'Horror'),('CID10',3,'Comedy'),('CID10',3,'Drama'),('CID10',4,'Documentary'),('CID10',4,'Action'),('CID10',4,'Classic'),('CID10',4,'Science  Fiction'),('CID10',7,'Comedy'),('CID10',7,'Drama'),('CID10',7,'Documentary'),('CID10',7,'Action'),('CID10',9,'Science  Fiction'),('CID10',9,'Drama'),('CID11',1,'Science  Fiction'),('CID11',1,'Romance'),('CID11',8,'Romance'),('CID11',8,'Horror'),('CID11',8,'Classic'),('CID11',10,'Comedy'),('CID11',10,'Romance'),('CID12',1,'Science  Fiction'),('CID12',1,'Romance'),('CID12',2,'Documentary'),('CID12',2,'Action'),('CID12',2,'Classic'),('CID12',3,'Horror'),('CID12',3,'Comedy'),('CID12',3,'Drama'),('CID12',5,'Action'),('CID12',5,'Romance'),('CID12',5,'Drama'),('CID13',1,'Romance'),('CID13',1,'Science  Fiction'),('CID13',7,'Documentary'),('CID13',7,'Action'),('CID13',7,'Comedy'),('CID13',7,'Drama'),('CID13',8,'Romance'),('CID13',8,'Classic'),('CID13',8,'Horror'),('CID14',2,'Action'),('CID14',2,'Documentary'),('CID14',2,'Classic'),('CID14',5,'Romance'),('CID14',5,'Action'),('CID14',5,'Drama'),('CID14',8,'Romance'),('CID14',8,'Horror'),('CID14',8,'Classic'),('CID2',1,'Science  Fiction'),('CID2',1,'Romance'),('CID2',2,'Action'),('CID2',2,'Documentary'),('CID2',2,'Classic'),('CID2',3,'Horror'),('CID2',3,'Drama'),('CID2',3,'Comedy'),('CID2',4,'Documentary'),('CID2',4,'Action'),('CID2',4,'Classic'),('CID2',4,'Science  Fiction'),('CID3',1,'Science  Fiction'),('CID3',1,'Romance'),('CID3',7,'Documentary'),('CID3',7,'Action'),('CID3',7,'Comedy'),('CID3',7,'Drama'),('CID3',8,'Classic'),('CID3',8,'Romance'),('CID3',8,'Horror'),('CID4',2,'Action'),('CID4',2,'Documentary'),('CID4',2,'Classic'),('CID5',4,'Science  Fiction'),('CID5',4,'Documentary'),('CID5',4,'Action'),('CID5',4,'Classic'),('CID5',8,'Romance'),('CID5',8,'Horror'),('CID5',8,'Classic'),('CID5',10,'Comedy'),('CID5',10,'Romance'),('CID6',1,'Romance'),('CID6',1,'Science  Fiction'),('CID6',3,'Comedy'),('CID6',3,'Drama'),('CID6',3,'Horror'),('CID6',9,'Science  Fiction'),('CID6',9,'Drama'),('CID6',10,'Romance'),('CID6',10,'Comedy'),('CID7',1,'Science  Fiction'),('CID7',1,'Romance'),('CID7',2,'Documentary'),('CID7',2,'Classic'),('CID7',2,'Action'),('CID7',3,'Horror'),('CID7',3,'Comedy'),('CID7',3,'Drama'),('CID8',4,'Classic'),('CID8',4,'Science  Fiction'),('CID8',4,'Documentary'),('CID8',4,'Action'),('CID8',5,'Action'),('CID8',5,'Drama'),('CID8',5,'Action'),('CID8',5,'Drama'),('CID8',5,'Romance'),('CID8',5,'Romance'),('CID8',9,'Drama'),('CID8',9,'Science  Fiction'),('CID9',1,'Science  Fiction'),('CID9',1,'Romance'),('CID9',2,'Documentary'),('CID9',2,'Classic'),('CID9',2,'Action'),('CID9',10,'Romance'),('CID9',10,'Comedy');
/*!40000 ALTER TABLE `cust_film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_movie`
--

DROP TABLE IF EXISTS `cust_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cust_movie` (
  `cust_id` varchar(5) DEFAULT NULL,
  `movie_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_movie`
--

LOCK TABLES `cust_movie` WRITE;
/*!40000 ALTER TABLE `cust_movie` DISABLE KEYS */;
INSERT INTO `cust_movie` VALUES ('CID1','3'),('CID1','5'),('CID1','5'),('CID1','10'),('CID1','8'),('CID1','1'),('CID10','3'),('CID10','7'),('CID10','9'),('CID10','2'),('CID10','4'),('CID11','1'),('CID11','10'),('CID11','8'),('CID12','3'),('CID12','5'),('CID12','1'),('CID12','2'),('CID13','8'),('CID13','1'),('CID13','7'),('CID14','5'),('CID14','2'),('CID14','8'),('CID2','4'),('CID2','1'),('CID2','2'),('CID2','3'),('CID3','7'),('CID3','8'),('CID3','1'),('CID4','2'),('CID5','4'),('CID5','8'),('CID5','10'),('CID6','3'),('CID6','9'),('CID6','10'),('CID6','1'),('CID7','1'),('CID7','2'),('CID7','3'),('CID8','5'),('CID8','4'),('CID8','9'),('CID8','5'),('CID9','10'),('CID9','1'),('CID9','2'),('CID9','23');
/*!40000 ALTER TABLE `cust_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dc`
--

DROP TABLE IF EXISTS `dc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dc` (
  `Genere` varchar(16) DEFAULT NULL,
  `Code` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dc`
--

LOCK TABLES `dc` WRITE;
/*!40000 ALTER TABLE `dc` DISABLE KEYS */;
INSERT INTO `dc` VALUES ('Romance','r'),('Science  Fiction','s'),('Horror','h'),('Comedy','c'),('Drama','d'),('Action','a'),('Documentary','o'),('Classic','l');
/*!40000 ALTER TABLE `dc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midg`
--

DROP TABLE IF EXISTS `midg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `midg` (
  `Mv_ID` int(2) DEFAULT NULL,
  `G1` char(1) DEFAULT NULL,
  `G2` char(1) DEFAULT NULL,
  `G3` varchar(2) DEFAULT NULL,
  `G4` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midg`
--

LOCK TABLES `midg` WRITE;
/*!40000 ALTER TABLE `midg` DISABLE KEYS */;
INSERT INTO `midg` VALUES (1,'r','s','NA','NA'),(2,'o','l','a','NA'),(3,'c','d','h','NA'),(4,'s','l','o','a'),(5,'a','d','r','NA'),(6,'d','h','c','NA'),(7,'a','d','c','o'),(8,'h','l','r','NA'),(9,'s','d','NA','NA'),(10,'c','r','NA','NA');
/*!40000 ALTER TABLE `midg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genere`
--

DROP TABLE IF EXISTS `movie_genere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_genere` (
  `Mv_ID` int(11) DEFAULT NULL,
  `Genere` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genere`
--

LOCK TABLES `movie_genere` WRITE;
/*!40000 ALTER TABLE `movie_genere` DISABLE KEYS */;
INSERT INTO `movie_genere` VALUES (1,'Romance'),(1,'Science  Fiction'),(2,'Documentary'),(2,'Action'),(2,'Classic'),(3,'Comedy'),(3,'Horror'),(3,'Drama'),(4,'Documentary'),(4,'Classic'),(4,'Action'),(4,'Science  Fiction'),(5,'Action'),(5,'Romance'),(5,'Drama'),(6,'Drama'),(6,'Comedy'),(6,'Horror'),(7,'Documentary'),(7,'Action'),(7,'Comedy'),(7,'Drama'),(8,'Romance'),(8,'Classic'),(8,'Horror'),(9,'Science  Fiction'),(9,'Drama'),(10,'Comedy'),(10,'Romance');
/*!40000 ALTER TABLE `movie_genere` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-25 12:28:11
