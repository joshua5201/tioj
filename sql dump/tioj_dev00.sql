-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tioj_dev
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest_problem_joints`
--

DROP TABLE IF EXISTS `contest_problem_joints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contest_problem_joints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contest_id` int(11) DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem_joints`
--

LOCK TABLES `contest_problem_joints` WRITE;
/*!40000 ALTER TABLE `contest_problem_joints` DISABLE KEYS */;
INSERT INTO `contest_problem_joints` VALUES (9,20,1,'2014-06-18 08:35:02','2014-06-18 08:35:02'),(10,20,2,'2014-06-18 08:35:02','2014-06-18 09:00:56'),(11,20,8,'2014-06-18 08:35:02','2014-06-18 09:00:56'),(13,21,2,'2014-06-18 09:11:27','2014-06-18 09:11:27'),(14,20,3,'2014-06-18 10:09:38','2014-06-18 10:09:38'),(15,23,1,'2014-06-18 14:52:54','2014-06-18 14:52:54'),(16,23,2,'2014-06-18 14:52:54','2014-06-18 14:52:54');
/*!40000 ALTER TABLE `contest_problem_joints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contests`
--

DROP TABLE IF EXISTS `contests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `contest_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
INSERT INTO `contests` VALUES (2,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:28:26','2014-06-17 13:28:26'),(3,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:28:39','2014-06-17 13:28:39'),(4,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:32:16','2014-06-17 13:32:16'),(5,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:33:49','2014-06-17 13:33:49'),(7,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:34:58','2014-06-17 13:34:58'),(9,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-06-17 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:38:33','2014-06-17 13:38:33'),(10,'first contest','jizz\r\nizz\r\nzz\r\nz','2014-07-01 12:25:56','2014-07-01 13:25:56',1,'2014-06-17 13:47:56','2014-06-17 13:47:56'),(12,'past contest','jizz','2014-04-17 14:00:48','2014-05-17 14:00:48',1,'2014-06-17 14:01:05','2014-06-17 14:01:05'),(13,'present contest','jizz','2014-04-17 14:00:48','2020-08-17 14:00:48',1,'2014-06-17 14:01:22','2014-06-17 14:01:22'),(14,'future contest','jizz','2020-04-17 14:00:48','2050-08-17 14:00:48',1,'2014-06-17 14:01:41','2014-06-17 14:01:41'),(15,'future contest','jizz','2020-04-17 14:00:48','2050-08-17 14:00:48',1,'2014-06-17 14:01:59','2014-06-17 14:01:59'),(18,'222','333','2014-06-18 03:59:05','2014-06-18 03:59:05',1,'2014-06-18 03:22:19','2014-06-18 03:59:13'),(19,'jjj','jjj','2014-06-18 04:12:51','2014-06-18 04:12:51',1,'2014-06-18 03:59:26','2014-06-18 04:12:59'),(20,'333','333','2014-06-18 09:00:00','2014-06-18 09:00:00',1,'2014-06-18 03:59:35','2014-06-18 10:09:38'),(21,'ah ha!','eureka!','2014-05-18 09:00:00','2019-06-18 15:59:00',1,'2014-06-18 09:11:27','2014-06-18 09:13:14'),(22,'','','2014-06-18 10:19:00','2014-06-18 10:19:00',1,'2014-06-18 10:20:00','2014-06-18 10:20:00'),(23,'test','test','2014-06-19 02:52:00','2015-06-18 14:52:00',0,'2014-06-18 14:52:54','2014-06-19 11:26:27');
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `get_submissions`
--

DROP TABLE IF EXISTS `get_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `get_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `get_submissions`
--

LOCK TABLES `get_submissions` WRITE;
/*!40000 ALTER TABLE `get_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `get_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `limits`
--

DROP TABLE IF EXISTS `limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT '1000',
  `memory` int(11) DEFAULT '65536',
  `output` int(11) DEFAULT '65536',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
INSERT INTO `limits` VALUES (1,1000,65536,65536,'2014-04-29 09:07:27','2014-05-20 08:11:59',1),(2,1000,65536,65536,'2014-04-29 09:13:24','2014-04-29 09:13:24',2),(9,1000,65536,65536,'2014-06-09 14:17:31','2014-06-09 14:17:31',9),(10,1000,65536,65536,'2014-06-09 14:22:27','2014-06-09 14:22:27',10),(11,1000,65536,65536,'2014-06-09 14:24:30','2014-06-09 14:24:30',11),(12,1000,65536,65536,'2014-06-17 13:00:48','2014-06-17 13:00:48',12),(13,1000,65536,65536,'2014-06-18 11:07:28','2014-06-18 11:07:28',13),(14,1000,65536,65536,'2014-06-18 11:07:35','2014-06-18 11:07:35',14),(15,1000,65536,65536,'2014-06-18 11:07:40','2014-06-18 11:07:40',15),(16,1000,65536,65536,'2014-06-18 11:07:44','2014-06-18 11:07:44',16),(17,1000,65536,65536,'2014-06-18 12:53:58','2014-06-18 12:53:58',17),(18,1000,65536,65536,'2014-06-18 12:54:04','2014-06-18 12:54:04',18);
/*!40000 ALTER TABLE `limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'test/','test?\r\ntesttest??',NULL,NULL,'2014-06-19 08:19:26','2014-06-19 08:19:26');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problems`
--

DROP TABLE IF EXISTS `problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `source` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `input` text COLLATE utf8_unicode_ci,
  `output` text COLLATE utf8_unicode_ci,
  `example_input` text COLLATE utf8_unicode_ci,
  `example_output` text COLLATE utf8_unicode_ci,
  `hint` text COLLATE utf8_unicode_ci,
  `created_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible_state` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'sum','sum up all the numbers','original','2014-04-29 09:07:27','2014-06-18 16:18:47','','','3\r\n1 2 3','6','while loop',NULL,1),(2,'sort','sort the numbers','original','2014-04-29 09:13:24','2014-04-29 09:13:24','','','5\r\n1 5 4 2 3','1 2 3 4 5','STL',NULL,0),(9,'','','','2014-06-09 14:17:31','2014-06-18 14:09:30','','','','','',NULL,1),(10,'','','','2014-06-09 14:22:27','2014-06-18 14:09:37','','','','','',NULL,2),(11,'','','','2014-06-09 14:24:30','2014-06-09 14:24:30','','','','','',NULL,0),(12,'','','','2014-06-17 13:00:48','2014-06-17 13:00:48','','','','','',NULL,0),(13,'','','','2014-06-18 11:07:28','2014-06-18 11:07:28','','','','','',NULL,0),(14,'','','','2014-06-18 11:07:35','2014-06-18 11:07:35','','','','','',NULL,0),(15,'','','','2014-06-18 11:07:40','2014-06-18 11:07:40','','','','','',NULL,0),(16,'','','','2014-06-18 11:07:44','2014-06-18 11:07:44','','','','','',NULL,0),(17,'','','','2014-06-18 12:53:58','2014-06-18 12:53:58','','','','','',NULL,0),(18,'','','','2014-06-18 12:54:04','2014-06-18 12:54:04','','','','','',NULL,0);
/*!40000 ALTER TABLE `problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140131174639'),('20140131175010'),('20140131175102'),('20140131175153'),('20140201174405'),('20140203101504'),('20140203101934'),('20140203111940'),('20140206093208'),('20140206100424'),('20140206100458'),('20140413143616'),('20140418045046'),('20140426061543'),('20140430011011'),('20140607103418'),('20140609132824'),('20140613154934'),('20140614102332'),('20140617121220'),('20140617122408'),('20140617135637'),('20140618103628');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` text COLLATE utf8_unicode_ci,
  `compiler` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `result` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'queued',
  `score` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `problem_id` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,'#include<iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\nint n;\r\ncin >> n;\r\nint res = 0;\r\nwhile(n--){\r\nint a;\r\ncin >> a;\r\nres += a;\r\n}\r\ncout << res << endl << endl;\r\nreturn 0;\r\n}','c++','Accepted',0,'2014-04-29 12:24:37','2014-05-20 08:24:33',1,NULL),(2,'#include<iostream>\r\nusing namespace std;\r\nint main()\r\n{\r\ncout << 12;\r\nreturn 0;\r\n}','c++','Wrong Answer',0,'2014-05-01 14:13:53','2014-05-20 08:26:22',1,0),(3,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\n   int n;\r\n   cin >> n;\r\n   n *= 0;\r\n   cout << 15 / n;\r\n   \r\n   return 0;\r\n}\r\n','c++','Runtime Error (exited with nonzero status)',0,'2014-05-02 12:35:06','2014-05-20 08:25:57',1,0),(4,'#include<cstdio>\r\nint main()\r\n{\r\n   puts(\"12\");\r\n   while(true);\r\n   \r\n   return 0;\r\n}','c++','Time Limit Exceeded',0,'2014-05-02 12:35:34','2014-05-20 08:23:04',1,0),(5,'\r\nint main()\r\n{\r\n   \r\n   return 0;\r\n}\r\n','c++','Wrong Answer',0,'2014-05-02 12:35:47','2014-05-20 08:26:15',1,0),(6,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n\r\nusing namespace std;\r\n\r\nconst int SZ = 1;\r\nint a[SZ];\r\n\r\nint main()\r\n{\r\n   for(int i = 0; i < SZ; ++i)\r\na[i] = i*i;\r\n   return 0;\r\n}\r\n','c++','Wrong Answer',0,'2014-05-02 13:59:22','2014-05-20 08:26:09',1,0),(7,'jizz','','queued',0,'2014-06-18 14:21:35','2014-06-18 14:21:35',1,0),(8,'','','queued',0,'2014-06-19 04:15:45','2014-06-19 04:15:45',1,0),(9,'','c++11','queued',0,'2014-06-19 07:56:10','2014-06-19 07:56:10',1,0),(10,'','c++11','queued',10,'2014-06-19 11:23:08','2014-06-19 11:27:21',1,0),(11,'','c++11','queued',20,'2014-06-19 11:26:48','2014-06-19 11:27:29',2,0),(12,'','c++11','queued',100,'2014-06-19 11:26:56','2014-06-19 11:27:36',1,0),(13,'','c++11','queued',7,'2014-06-19 11:27:01','2014-06-19 11:27:43',2,0),(14,'','c++11','queued',0,'2014-06-19 11:57:11','2014-06-19 11:57:11',1,0),(15,'','c++11','queued',0,'2014-06-19 11:57:29','2014-06-19 11:57:29',2,0),(16,'','c++11','queued',0,'2014-06-19 12:06:59','2014-06-19 12:06:59',11,0),(17,'','c++11','queued',0,'2014-06-19 12:17:31','2014-06-19 12:17:31',11,2),(18,'','c++11','queued',50,'2014-06-19 12:17:47','2014-06-19 12:20:24',2,2),(19,'','c++11','queued',100,'2014-06-19 12:17:58','2014-06-19 12:20:12',1,1),(20,'','c++11','queued',100,'2014-06-19 12:18:03','2014-06-19 12:20:06',2,1),(21,'','c++11','queued',0,'2014-06-19 12:25:09','2014-06-19 12:25:09',1,2);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `input` text COLLATE utf8_unicode_ci,
  `answer` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `problem_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
INSERT INTO `testdata` VALUES (1,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-04-29 09:18:49','2014-04-29 09:18:49',1),(2,'10\r\n10 20 30 40 50 60 70 80 90 100','550','2014-04-29 09:19:16','2014-04-29 09:19:16',1),(3,'10\r\n4 3 7 8 0 5 2 1 6 9 ','0 1 2 3 4 5 6 7 8 9','2014-04-29 09:19:52','2014-04-29 09:19:52',2),(4,'10\r\n40 30 70 80 00 50 20 10 60 90 ','0 10 20 30 40 50 60 70 80 90','2014-04-29 09:20:46','2014-04-29 09:20:46',2),(5,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:03','2014-05-01 14:24:03',1),(6,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:09','2014-05-01 14:24:09',1),(7,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:15','2014-05-01 14:24:15',1),(8,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:21','2014-05-01 14:24:21',1),(9,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:27','2014-05-01 14:24:27',1),(10,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:33','2014-05-01 14:24:33',1),(11,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:38','2014-05-01 14:24:38',1),(12,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:44','2014-05-01 14:24:44',1),(13,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:49','2014-05-01 14:24:49',1),(14,'10\r\n1 2 3 4 5 6 7 8 9 10','55','2014-05-01 14:24:54','2014-05-01 14:24:54',1);
/*!40000 ALTER TABLE `testdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'big2632@gmail.com','$2a$10$kG9B4/oKGyraEoz/rxodMeb1lVNQ91iIccctAFdc0Y5pLlFAWH.e6','f018d9cd4391e6d38042398c50120af57fe401af60353cf02eacaeba6a4ff10d','2014-06-18 08:38:30',NULL,4,'2014-06-18 08:39:37','2014-06-08 12:56:52','127.0.0.1','127.0.0.1','2014-04-29 09:15:45','2014-06-18 08:39:37',NULL,NULL,1),(2,'jizz@gmail.com','$2a$10$mLmHwhuQvEVhAooScs4E0.zzdV0xjpsYal2PkALoh0UjA0JCbokmC',NULL,NULL,'2014-06-19 11:56:57',2,'2014-06-19 11:56:57','2014-06-18 14:53:37','127.0.0.1','127.0.0.1','2014-06-18 14:53:37','2014-06-19 11:56:57',NULL,NULL,0);
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

-- Dump completed on 2014-06-19 20:31:08
