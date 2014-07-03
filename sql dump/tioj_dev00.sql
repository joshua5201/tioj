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
-- Table structure for table `active_admin_comments`
--

DROP TABLE IF EXISTS `active_admin_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_admin_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `resource_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_active_admin_comments_on_namespace` (`namespace`),
  KEY `index_active_admin_comments_on_author_type_and_author_id` (`author_type`,`author_id`),
  KEY `index_active_admin_comments_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_admin_comments`
--

LOCK TABLES `active_admin_comments` WRITE;
/*!40000 ALTER TABLE `active_admin_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_admin_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_admin_users_on_email` (`email`),
  UNIQUE KEY `index_admin_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (2,'big2632@gmail.com','$2a$10$42dI9chomjqmIzYXSYmgyOPB0nE9K5p9kHNsvbH5Yv6NewzVDY/da',NULL,NULL,NULL,5,'2014-06-29 17:42:08','2014-06-26 13:20:30','127.0.0.1','127.0.0.1','2014-06-22 15:39:35','2014-06-29 17:42:08');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `era` int(11) DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'ann #1','i\r\nwant\r\nto jizzzzzzz',1,'2014-06-21 18:17:11','2014-06-27 09:11:16',2013,0,1),(5,'jjj','iii',2,'2014-06-21 19:08:57','2014-06-21 19:11:04',2013,0,0),(6,'hello','world\r\nworld\r\nworld....',1,'2014-06-21 19:11:38','2014-06-28 17:53:05',2014,1,1),(7,'2014','',1,'2014-06-22 06:26:44','2014-06-28 16:29:52',2014,1,0),(10,'2012','',2,'2014-06-22 06:34:49','2014-06-22 06:34:49',NULL,0,0),(11,'2013','',2,'2014-06-22 06:36:01','2014-06-22 07:23:03',2013,1,0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (6,6,'0003.inf','2014-06-27 08:25:34','2014-06-27 08:25:34'),(7,7,'mat','2014-06-28 16:29:52','2014-06-28 16:29:52'),(8,7,'samplegen','2014-06-28 16:30:03','2014-06-28 16:30:03');
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem_joints`
--

LOCK TABLES `contest_problem_joints` WRITE;
/*!40000 ALTER TABLE `contest_problem_joints` DISABLE KEYS */;
INSERT INTO `contest_problem_joints` VALUES (1,1,1,'2014-06-21 08:28:09','2014-06-24 12:32:38'),(2,2,1,'2014-06-23 08:07:03','2014-06-23 08:07:03'),(3,2,2,'2014-06-23 08:07:03','2014-06-23 08:07:03'),(4,1,2,'2014-06-24 12:23:30','2014-06-24 12:32:38'),(5,1,3,'2014-06-26 16:41:26','2014-06-26 16:41:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
INSERT INTO `contests` VALUES (1,'contest 1','present contest','2014-06-21 08:00:00','2015-06-21 08:27:00',2,'2014-06-21 08:28:09','2014-06-28 07:08:27'),(2,'contest 2','past contest\r\njizzz','2012-06-23 08:06:00','2013-06-23 08:06:00',1,'2014-06-23 08:07:03','2014-06-28 07:12:49'),(3,'contest 3','future contest','2015-06-26 15:48:00','2016-06-26 15:48:00',0,'2014-06-26 15:49:09','2014-06-26 15:49:09');
/*!40000 ALTER TABLE `contests` ENABLE KEYS */;
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
  `testdatum_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
INSERT INTO `limits` VALUES (3,1000,65536,65536,'2014-06-21 06:05:01','2014-06-21 06:43:15',21),(4,1000,65536,65536,'2014-06-21 06:08:26','2014-06-21 06:08:26',22),(5,1000,65536,65536,'2014-06-21 06:29:16','2014-06-21 06:32:33',23),(6,1000,65536,65536,'2014-06-21 06:42:17','2014-06-21 06:42:17',24),(7,1000,65536,65536,'2014-06-21 06:42:40','2014-06-21 06:42:40',25),(8,1000,65536,65536,'2014-06-21 07:13:17','2014-06-21 07:13:17',26),(11,1000,65536,65536,'2014-06-21 08:11:59','2014-06-21 08:11:59',29),(12,1000,65536,65536,'2014-06-21 08:12:06','2014-06-21 08:12:06',30),(13,1000,65536,65536,'2014-06-21 08:12:12','2014-06-21 08:12:12',31),(14,1000,30000,65536,'2014-06-21 08:12:19','2014-06-22 12:47:37',32),(15,1000,65536,65536,'2014-06-21 08:12:27','2014-06-22 12:46:24',33),(16,1000,65536,65536,'2014-06-24 06:12:58','2014-06-24 06:12:58',34),(17,1000,65536,65536,'2014-06-24 06:13:06','2014-06-24 06:13:06',35),(18,1000,65536,65536,'2014-06-24 06:13:14','2014-06-24 06:13:14',36),(19,1000,65536,65536,'2014-06-24 06:13:24','2014-06-24 06:13:24',37),(20,1000,65536,65536,'2014-06-24 06:13:32','2014-06-24 06:13:32',38),(21,1000,65536,65536,'2014-06-24 06:13:39','2014-06-24 06:13:39',39),(22,1000,65536,65536,'2014-06-24 06:13:48','2014-06-24 06:13:48',40),(23,1000,65536,65536,'2014-06-24 06:13:57','2014-06-24 06:13:57',41),(24,1000,65536,65536,'2014-06-24 06:14:04','2014-06-24 06:14:04',42),(25,1000,65536,65536,'2014-06-24 06:14:13','2014-06-24 06:14:13',43),(26,1000,65536,65536,'2014-06-24 07:27:56','2014-06-24 07:27:56',44),(27,1000,65536,65536,'2014-06-24 07:28:04','2014-06-24 07:28:04',45),(28,1000,65536,65536,'2014-06-24 07:28:13','2014-06-24 07:28:13',46),(29,1000,65536,65536,'2014-06-24 07:28:23','2014-06-24 07:28:23',47),(30,1000,65536,65536,'2014-06-24 07:28:34','2014-06-24 07:28:34',48);
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
INSERT INTO `posts` VALUES (1,'jizz','jizz',NULL,NULL,'2014-06-29 13:57:19','2014-06-29 13:57:19');
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
  `problem_type` int(11) DEFAULT NULL,
  `sjcode` text COLLATE utf8_unicode_ci,
  `interlib` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'0129 爆搜題','輸入第1行有一個正整數k 代表有幾組測資\r\n第2行有一個正整數n\r\n接著第3+n*(i-1)行到第2+n*(i)行是第i組測資\r\n每組測資有三個n x n的方陣 A , B , C, \r\n如果 A x B = C 則輸出 \"I need wrestling !!\", 否則輸出\"QAQQQQQQQQQQ\"','classic','2014-06-20 15:40:13','2014-07-01 15:08:28','','','2\r\n2\r\n1 2\r\n2 1\r\n0 0\r\n0 0\r\n7 1\r\n2 2\r\n1 2\r\n2 1\r\n0 0\r\n0 0\r\n0 0\r\n0 0','QAQQQQQQQQQQ\r\nI need wrestling !!','hint',NULL,0,0,'',''),(2,'\\(\\infty\\)','hello \\(A_a\\)\r\n蘿蔔 \\\\(A_a\\\\)\r\n$A_a$ \\\\$\r\n`\\(\\infty\\)`\r\n`\\[\\infty\\]`','','2014-06-21 07:13:08','2014-06-24 06:11:38','','','','','',NULL,0,1,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<fstream>\r\n#include<string>\r\n\r\nusing namespace std;\r\n\r\nint main(int argc, char *argv[])\r\n{\r\n   ifstream userout(argv[1]), testdata(argv[2]);\r\n   ifstream answer(argv[3]);\r\n   string s; int n;\r\n   testdata >> s >> n;\r\n   int scount[200] = {0}, ccount[200] = {0};\r\n   for(int i = 0; i < s.size(); ++i)\r\n      ++scount[s[i]];\r\n   \r\n   int minimal = 0;\r\n   for(int i = \'a\'; i <= \'z\'; ++i)\r\n      if(scount[i] > 0) ++minimal;\r\n   if(minimal > n){\r\n      int k;\r\n      userout >> k;\r\n      if(k == -1) cout << 0;\r\n      else cout << 1;\r\n      return 0;\r\n   }\r\n   \r\n   string cand; int k;\r\n   userout >> k >> cand;\r\n   \r\n   int ansk; string ansp;\r\n   answer >> ansk >> ansp;\r\n   \r\n   if(k != ansk){\r\n      cout << 1;\r\n      return 0;\r\n   }\r\n   \r\n   if(cand.size() != n){\r\n      cout << 1;\r\n      return 0;\r\n   }\r\n   \r\n   for(int i = 0; i < cand.size(); ++i)\r\n      ++ccount[cand[i]];\r\n   \r\n   for(int i = \'a\'; i <= \'z\'; ++i){\r\n      if(ccount[i] * k < scount[i]){\r\n         cout << 1;\r\n         return 0;\r\n      }\r\n   }\r\n   \r\n   cout << 0;\r\n   \r\n   return 0;\r\n}\r\n',NULL),(3,'interactive','','','2014-06-24 07:07:35','2014-07-03 16:19:31','','','','','',NULL,0,2,NULL,'#include <cstdio>\r\nconst int HD_ERR=-1031482637;\r\nconst char *HD_YAA=\"YAAAAAAAAAZZZZZZZ\";\r\nconst char *HD_NOO=\"JIZZZZZZZZZZZZZZZ\";\r\nint HD_A=HD_ERR,HD_B=HD_ERR;\r\nint HD_ANS;\r\nvoid init()\r\n{\r\n    scanf(\"%d %d\",&HD_A,&HD_B);\r\n    HD_ANS=HD_A+HD_B;\r\n}\r\n\r\nint get_a()\r\n{\r\n    return HD_A;\r\n}\r\n\r\nint get_b()\r\n{\r\n    return HD_B;\r\n}\r\n\r\nvoid zero()\r\n{\r\n    if(HD_A==HD_ERR || HD_B==HD_ERR)printf(\"%s\",HD_NOO);\r\n    else\r\n    {\r\n        if(HD_ANS%3==0)printf(\"%s\",HD_YAA);\r\n        else printf(\"%s\",HD_NOO);\r\n    }\r\n}\r\n\r\nvoid one()\r\n{\r\n    if(HD_A==HD_ERR || HD_B==HD_ERR)printf(\"%s\",HD_NOO);\r\n    else\r\n    {\r\n        if(HD_ANS%3==1)printf(\"%s\",HD_YAA);\r\n        else printf(\"%s\",HD_NOO);\r\n    }\r\n}\r\n\r\nvoid two()\r\n{\r\n    if(HD_A==HD_ERR || HD_B==HD_ERR)printf(\"%s\",HD_NOO);\r\n    else\r\n    {\r\n        if(HD_ANS%3==2)printf(\"%s\",HD_YAA);\r\n        else printf(\"%s\",HD_NOO);\r\n    }\r\n}\r\n'),(4,'Unsolvable problem','','','2014-06-24 13:22:48','2014-06-24 13:22:48','','','','','',NULL,0,0,NULL,NULL),(5,'jizz','test#### ########## ############### ########################### #### ######### ############## ################### ######### ################### ########### ######this should wrap','','2014-06-24 16:30:19','2014-06-26 13:38:27','test#### ########## ############### ########################### #### ######### ############## ################### ######### ################### ########### ######this should wrap','test#### ########## ############### ########################### #### ######### ############## ################### ######### ################### ########### ######this should wrap','','','',NULL,0,0,NULL,NULL),(7,'','','','2014-06-25 12:09:16','2014-06-25 12:09:16','','','','','',NULL,0,0,NULL,NULL);
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
INSERT INTO `schema_migrations` VALUES ('20140131174639'),('20140131175010'),('20140131175102'),('20140131175153'),('20140201174405'),('20140203101504'),('20140203101934'),('20140203111940'),('20140206093208'),('20140206100424'),('20140206100458'),('20140413143616'),('20140418045046'),('20140426061543'),('20140430011011'),('20140607103418'),('20140609132824'),('20140613154934'),('20140614102332'),('20140617121220'),('20140617122408'),('20140617135637'),('20140618103628'),('20140619162501'),('20140620140855'),('20140620151303'),('20140620152237'),('20140620152508'),('20140621050153'),('20140621065138'),('20140621074306'),('20140621074737'),('20140621083255'),('20140621171003'),('20140621171530'),('20140622041407'),('20140622065458'),('20140622072528'),('20140622073308'),('20140622083745'),('20140622091329'),('20140622091330'),('20140622091331'),('20140622151726'),('20140622151731'),('20140623163219'),('20140624054449'),('20140624070514'),('20140624102813'),('20140627090350'),('20140628162323'),('20140628175154');
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
  `contest_id` int(11) DEFAULT NULL,
  `_result` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_time` int(11) DEFAULT NULL,
  `total_memory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<cstdlib>\r\n#include<ctime>\r\n \r\nusing namespace std;\r\n \r\nint n;\r\nvoid in(int A[1000][1000])\r\n{\r\n   for(int i = 0; i < n; ++i)\r\n      for(int j = 0; j < n; ++j)\r\n         scanf(\"%d\", &A[i][j]);\r\n}\r\n \r\nvoid mul(int A[1000][1000], int r[1000])\r\n{\r\n   int s[1000] = {0};\r\n   for(int i = 0; i < n; ++i)\r\n      for(int k = 0; k < n; ++k)\r\n         s[i] += A[i][k] * r[k];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = s[i];\r\n}\r\n \r\nbool test(int A[1000][1000], int B[1000][1000], int C[1000][1000])\r\n{\r\n   int r[1000], l[1000];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = l[i] = rand() % 255;\r\n \r\n   mul(C, l);\r\n   mul(B, r);\r\n   mul(A, r);\r\n \r\n   for(int i = 0; i < n; ++i)\r\n      if(r[i] != l[i])\r\n         return false;\r\n \r\n   return true;\r\n}\r\n \r\nint A[1000][1000], B[1000][1000], C[1000][1000];\r\n \r\nint main()\r\n{\r\n   srand(time(NULL));\r\n   scanf(\"%d\", &n);\r\n \r\n   in(A); in(B); in(C);\r\n   bool flag = true;\r\n   for(int i = 0; i < 10 && flag; ++i){\r\n      if(test(A, B, C) == false){\r\n         printf(\"QAQQQQQQQQQQ\");\r\n         flag = false;\r\n      }\r\n   }\r\n   if(flag)\r\n      printf(\"I need wrestling !!\");\r\n   return 0;\r\n}','c++11','AC',100,'2014-06-20 16:00:48','2014-06-28 12:55:02',1,1,NULL,'AC/2/384/AC/3/384/AC/9/1536/AC/8/1408/AC/578/11980/AC/635/12040/AC/538/11904/AC/685/11904/AC/644/11904/AC/463/12032/',3565,12040),(2,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<cstdlib>\r\n#include<ctime>\r\n \r\nusing namespace std;\r\n \r\nint n;\r\nvoid in(int A[1000][1000])\r\n{\r\n   for(int i = 0; i < n; ++i)\r\n      for(int j = 0; j < n; ++j)\r\n         scanf(\"%d\", &A[i][j]);\r\n}\r\n \r\nvoid mul(int A[1000][1000], int r[1000])\r\n{\r\n   int s[1000] = {0};\r\n   for(int i = 0; i < n; ++i)\r\n      for(int k = 0; k < n; ++k)\r\n         s[i] += A[i][k] * r[k];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = s[i];\r\n}\r\n \r\nbool test(int A[1000][1000], int B[1000][1000], int C[1000][1000])\r\n{\r\n   int r[1000], l[1000];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = l[i] = rand() % 255;\r\n \r\n   mul(C, l);\r\n   mul(B, r);\r\n   mul(A, r);\r\n \r\n   for(int i = 0; i < n; ++i)\r\n      if(r[i] != l[i])\r\n         return false;\r\n \r\n   return true;\r\n}\r\n \r\nint A[1000][1000], B[1000][1000], C[1000][1000];\r\n \r\nint main()\r\n{\r\n   srand(time(NULL));\r\n   scanf(\"%d\", &n);\r\n \r\n   in(A); in(B); in(C);\r\n   bool flag = true;\r\n   for(int i = 0; i < 10 && flag; ++i){\r\n      if(test(A, B, C) == false){\r\n         printf(\"QAQQQQQQQQQQ\");\r\n         flag = false;\r\n      }\r\n   }\r\n   if(flag)\r\n      printf(\"I need wrestling !!\");\r\n   return 0;\r\n}','c++11','AC',100,'2014-06-21 08:28:43','2014-06-28 12:25:47',1,1,1,'AC/6/512/AC/6/384/AC/19/1408/AC/9/1536/AC/374/12032/AC/341/11904/AC/534/11904/AC/578/12032/AC/500/12032/AC/385/12032/',2752,12032),(3,'int main()\r\n{\r\nwhile(true);\r\n}','c++11','TLE',0,'2014-06-23 08:06:26','2014-06-28 12:26:08',1,1,1,'TLE/1993/128/TLE/1988/128/TLE/1991/128/TLE/1987/128/TLE/1986/128/TLE/1979/128/TLE/1984/128/TLE/1996/128/TLE/1991/128/TLE/1993/128/',19888,128),(5,'int main()\r\n{\r\nwhile(true);\r\n}','c++11','TLE',0,'2014-06-23 08:11:07','2014-06-28 12:26:58',1,1,NULL,'TLE/1998/128/TLE/1997/128/TLE/1993/128/TLE/1993/128/TLE/1998/128/TLE/1985/128/TLE/1992/128/TLE/1984/128/TLE/1984/128/TLE/1985/128/',19909,128),(6,'int main()\r\n{\r\nwhile(true);\r\n}','c++11','TLE',0,'2014-06-23 08:11:33','2014-06-28 12:27:24',1,1,NULL,'TLE/1994/128/TLE/1985/128/TLE/1997/128/TLE/1986/128/TLE/1998/128/TLE/1984/128/TLE/1984/128/TLE/1985/128/TLE/1984/128/TLE/1998/128/',19895,128),(7,'int main()\r\n{\r\nwhile(true);\r\n}','c++11','TLE',0,'2014-06-23 08:12:01','2014-06-28 12:27:45',1,1,NULL,'TLE/1998/128/TLE/1989/128/TLE/1998/128/TLE/1984/128/TLE/1984/128/TLE/1985/128/TLE/1998/128/TLE/1972/128/TLE/1977/128/TLE/1984/128/',19869,128),(8,'int main()\r\n{\r\nwhile(true);\r\n}','c++11','TLE',0,'2014-06-23 08:13:11','2014-06-28 12:55:27',1,1,1,'TLE/1846/128/TLE/1769/128/TLE/1762/128/TLE/1750/128/TLE/1759/128/TLE/1688/128/TLE/1753/128/TLE/1796/128/TLE/1798/128/TLE/1978/128/',17899,128),(9,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<string>\r\n#include<cmath>\r\n\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\n   string s;\r\n   int n;\r\n   cin >> s >> n;\r\n   int c[200] = {0};\r\n   for(int i = 0; i < s.size(); ++i)\r\n      ++c[s[i]];\r\n   \r\n   for(int k = 1; k <= 1000; ++k){\r\n      int eva = 0;\r\n      for(int it = (int)\'a\'; it <= (int)\'z\'; ++it){\r\n         eva += ceil(1.0*c[it]/k);\r\n      }\r\n      if(eva <= n){\r\n         cout << k << endl;\r\n         for(int it = (int)\'a\'; it <= (int)\'z\'; ++it){\r\n            cout << string(ceil(1.0*c[it]/k), (char)it);\r\n         }\r\n         cout << string(n-eva, \'a\');\r\n         return 0;\r\n      }\r\n   }\r\n   \r\n   cout << -1;\r\n   \r\n   return 0;\r\n}\r\n','c++11','AC',100,'2014-06-24 06:20:55','2014-06-28 13:02:55',2,1,NULL,'AC/2/256/AC/3/256/AC/3/256/AC/2/256/AC/2/256/AC/2/256/AC/2/256/AC/2/256/AC/2/256/AC/2/256/AC/2/256/',24,256),(10,' #include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<string>\r\n#include<cmath>\r\n#include<ctime>\r\n\r\nusing namespace std;\r\n\r\nint main()\r\n{\r\nsrand(time(NULL));\r\nif(rand() % 2){\r\ncout << \"jizz\";\r\n}\r\n\r\n   string s;\r\n   int n;\r\n   cin >> s >> n;\r\n   int c[200] = {0};\r\n   for(int i = 0; i < s.size(); ++i)\r\n      ++c[s[i]];\r\n   \r\n   for(int k = 1; k <= 1000; ++k){\r\n      int eva = 0;\r\n      for(int it = (int)\'a\'; it <= (int)\'z\'; ++it){\r\n         eva += ceil(1.0*c[it]/k);\r\n      }\r\n      if(eva <= n){\r\n         cout << k << endl;\r\n         for(int it = (int)\'a\'; it <= (int)\'z\'; ++it){\r\n            cout << string(ceil(1.0*c[it]/k), (char)it);\r\n         }\r\n         cout << string(n-eva, \'a\');\r\n         return 0;\r\n      }\r\n   }\r\n   \r\n   cout << -1;\r\n   \r\n   return 0;\r\n}\r\n','c++11','AC',100,'2014-06-24 06:42:23','2014-06-28 12:27:51',2,1,NULL,'AC/2/256/AC/5/256/AC/2/256/AC/2/256/AC/5/256/AC/1/256/AC/5/256/AC/5/256/AC/5/256/AC/4/256/AC/4/256/',40,256),(11,'#include <cstdio>\r\n#include <cstdlib>\r\n#include <iostream>\r\n#include \"lib0003.h\"\r\nusing namespace std;\r\nint main()\r\n{\r\n    init();\r\n    int a,b,c;\r\n    a=get_a();\r\n    b=get_b();\r\n    c=a+b;\r\n    if(c%3==0)zero();\r\n    else if(c%3==1)one();\r\n    else two();\r\n    return 0;\r\n}\r\n','c++11','AC',100,'2014-06-24 07:27:22','2014-06-28 12:27:52',3,1,NULL,'AC/4/256/AC/5/256/AC/5/256/AC/6/256/AC/2/256/',22,256),(31,'','c++11','queued',0,'2014-06-29 17:58:58','2014-06-29 17:58:58',1,2,1,NULL,NULL,NULL),(32,'','c++11','queued',0,'2014-06-29 18:15:25','2014-06-29 18:15:25',2,2,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,6,'Article',NULL,NULL,'tags','2014-06-22 10:55:46'),(2,2,6,'Article',NULL,NULL,'tags','2014-06-22 10:55:46'),(3,3,6,'Article',NULL,NULL,'tags','2014-06-22 10:55:46'),(4,4,1,'Problem',NULL,NULL,'tags','2014-06-22 11:10:41'),(5,1,1,'Problem',NULL,NULL,'tags','2014-06-22 11:10:58'),(6,5,1,'Problem',NULL,NULL,'tags','2014-06-22 11:10:58'),(8,6,2,'Problem',NULL,NULL,'tags','2014-06-22 11:15:42'),(10,8,1,'Problem',NULL,NULL,'tags','2014-06-26 08:49:00'),(11,9,1,'Problem',NULL,NULL,'tags','2014-06-28 19:38:30'),(12,10,3,'Problem',NULL,NULL,'tags','2014-07-03 16:19:31');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `taggings_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'jizz',2),(2,'in',1),(3,'my pants',1),(4,'classic',1),(5,'in my pants',1),(6,'baby',1),(7,'i really need to jizzzzzz',0),(8,'jizzzzzzzz',1),(9,'fun-and-jizz',1),(10,'inter',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) DEFAULT NULL,
  `test_input` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_output` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
INSERT INTO `testdata` VALUES (21,1,'1154c938-402d-4e56-b3aa-2c33c49c0694','f9a93bf9-95c4-4a80-bee3-06269c80e029','2014-06-21 05:52:22','2014-06-21 05:52:22'),(22,1,'c2a08e58-3789-4482-ae0c-aeeaea54ce49','ee325a76-d91f-4003-82fc-3635dcdc1c46','2014-06-21 06:08:17','2014-06-21 06:08:17'),(23,1,'952ac274-8449-4da8-87d1-027ffd9fcfdf','43f22c6c-aef0-4db0-9732-1f60bd92eb5b','2014-06-21 06:27:04','2014-06-21 06:33:08'),(24,1,'17336cd3-9387-416b-88f3-9a35ea8448b9','3c79bff2-90dc-48b9-8610-b652cfb54191','2014-06-21 06:42:17','2014-06-21 06:42:53'),(25,1,'d9773125-96f0-4d86-aef5-7cf091933b5a','8a3590ae-417b-486c-a52d-2ab8ed562090','2014-06-21 06:42:40','2014-06-21 06:43:06'),(26,2,'1981ea56-bc74-44d5-8b74-d3ad11bb347e','13270c95-fd66-4577-b21b-77d523ac54c3','2014-06-21 07:13:17','2014-06-24 06:12:49'),(29,1,'6806457b-f120-4d82-ba66-ae813f5b462f','522e5610-eb7b-49f5-9416-dc3207035797','2014-06-21 08:11:59','2014-06-21 08:11:59'),(30,1,'ca9ae1e0-3f2f-4a81-85b5-2ce2afc654fe','41f97314-6ac7-4679-aedb-3b05fffa1175','2014-06-21 08:12:06','2014-06-21 08:12:06'),(31,1,'17327fe9-1cb4-4f4c-ad63-4c8a3907778d','2c36bbb1-a331-46a7-a6e7-dd3127cd0cdb','2014-06-21 08:12:12','2014-06-21 08:12:12'),(32,1,'db53adfa-d8dc-404a-9132-4aac3c61565c','7a14b802-ab42-4b88-8f9f-3d351917de28','2014-06-21 08:12:19','2014-06-21 08:12:19'),(33,1,'add15908-f4a6-4f3e-b8c7-5358837e67c6','541b990a-c558-40a8-ad16-ed3d7dd2f5c2','2014-06-21 08:12:27','2014-06-21 08:12:27'),(34,2,'90f31273-2ee6-4ff0-a2a4-85bcac9c7a89','0f4c559d-7550-4f78-bcba-78c49ced4b46','2014-06-24 06:12:58','2014-06-24 06:12:58'),(35,2,'e6165af7-5553-44db-b9f3-c345c23aa189','87952260-cf4f-481e-a544-316b32ad8704','2014-06-24 06:13:06','2014-06-24 06:13:06'),(36,2,'2e5b7317-aebe-4ab1-a8a6-e440c0bd9970','de50c72c-9bd4-447e-9d57-1333b2fe2b0d','2014-06-24 06:13:14','2014-06-24 06:13:14'),(37,2,'5c47c24d-608d-445c-95af-6f5d342e3000','9454f41d-e9cd-45f1-89da-978b011f528f','2014-06-24 06:13:24','2014-06-24 06:13:24'),(38,2,'c69a86db-ff2e-43d6-ba6b-88f3b9962873','aa63dd8c-3ac6-4e7b-9110-d22d8e79ffc9','2014-06-24 06:13:32','2014-06-24 06:13:32'),(39,2,'ad280939-aec9-446d-b202-13153ac8a5b6','003c527b-12be-4726-8f49-45b04cbdbfb5','2014-06-24 06:13:39','2014-06-24 06:13:39'),(40,2,'fdb4c7a6-bca8-4097-9ee9-88e48f9833f6','9b354241-885d-483b-9606-ae7961337772','2014-06-24 06:13:48','2014-06-24 06:13:48'),(41,2,'730e150d-6fda-4013-80bc-caf88284f3a5','c466609b-ac8f-4589-b791-1818a6aa22dd','2014-06-24 06:13:57','2014-06-24 06:13:57'),(42,2,'27e4f14b-2b4a-48f0-af64-3b73ee37ec95','e984548e-4056-40a3-9c74-f5ca46823f4a','2014-06-24 06:14:04','2014-06-24 06:14:04'),(43,2,'594de0d2-01f2-4eeb-8f8e-e1bf4963d88b','22b2a21e-b385-4fe5-a7b4-15d3a850cec0','2014-06-24 06:14:13','2014-06-24 06:14:13'),(44,3,'78ccbd0d-a5a7-4a31-aab8-94246291f586','78dbc449-19e7-4c99-8455-d638f7c0395c','2014-06-24 07:27:56','2014-06-24 07:27:56'),(45,3,'c349ac8d-40a0-4bc2-a637-46a766221610','05a6cde8-ccbc-4c6a-b34f-a5d48d554adb','2014-06-24 07:28:04','2014-06-24 07:28:04'),(46,3,'a275b6b5-6468-4564-b306-024e7248437a','74a687cf-4ef8-4384-a6d2-e34c17207f44','2014-06-24 07:28:13','2014-06-24 07:28:13'),(47,3,'987c8642-e388-4ac9-a1e2-0c0d3f0512a9','fccd30d2-4846-46b3-b9ce-e414f205b94b','2014-06-24 07:28:23','2014-06-24 07:28:23'),(48,3,'d7126e25-aa28-4b55-a34a-f479006ca3d4','e59e315d-d1aa-4cd7-90aa-f7fd8afe8d0b','2014-06-24 07:28:34','2014-06-24 07:28:34');
/*!40000 ALTER TABLE `testdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testdata_sets`
--

DROP TABLE IF EXISTS `testdata_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata_sets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_id` int(11) DEFAULT NULL,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata_sets`
--

LOCK TABLES `testdata_sets` WRITE;
/*!40000 ALTER TABLE `testdata_sets` DISABLE KEYS */;
INSERT INTO `testdata_sets` VALUES (1,1,0,1,20,'2014-06-21 08:09:19','2014-06-21 08:20:47'),(2,1,2,4,30,'2014-06-21 08:20:47','2014-06-21 08:20:47'),(3,1,5,9,50,'2014-06-21 08:20:47','2014-06-21 08:20:47'),(4,2,0,10,100,'2014-06-24 06:14:45','2014-06-24 06:15:10'),(5,3,0,4,100,'2014-06-24 07:29:17','2014-06-24 07:29:17');
/*!40000 ALTER TABLE `testdata_sets` ENABLE KEYS */;
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
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'big2632@gmail.com','$2a$10$kG9B4/oKGyraEoz/rxodMeb1lVNQ91iIccctAFdc0Y5pLlFAWH.e6','f018d9cd4391e6d38042398c50120af57fe401af60353cf02eacaeba6a4ff10d','2014-06-18 08:38:30',NULL,11,'2014-06-29 15:19:35','2014-06-26 13:06:20','127.0.0.1','127.0.0.1','2014-04-29 09:15:45','2014-06-29 15:19:35','jizz','INFOR_Wallpaper.jpg',1),(2,'jizz@gmail.com','$2a$10$mLmHwhuQvEVhAooScs4E0.zzdV0xjpsYal2PkALoh0UjA0JCbokmC',NULL,NULL,'2014-07-01 15:05:54',8,'2014-07-03 16:17:40','2014-07-01 15:05:54','127.0.0.1','127.0.0.1','2014-06-18 14:53:37','2014-07-03 16:17:40',NULL,'100.png',0),(3,'jizzjizz@jizz.jizz','$2a$10$WXpHmZyRVjJYQZi3WQFGFe1W4229AvPO78HVr7XXLt6pk4QJ2GGz.',NULL,NULL,NULL,1,'2014-06-20 03:59:30','2014-06-20 03:59:30','127.0.0.1','127.0.0.1','2014-06-20 03:59:30','2014-06-20 03:59:30',NULL,'100.png',0),(4,'jizzjizz@gmail.jizz','$2a$10$6t56BL1LpbuAp1mCWvkWYOfl18G73Zq3jIq4B/s976PGVa/l/tcIq',NULL,NULL,NULL,1,'2014-06-28 17:31:54','2014-06-28 17:31:54','127.0.0.1','127.0.0.1','2014-06-28 17:31:54','2014-06-28 17:31:55',NULL,'100.png',0),(5,'jizz@gmail.com.jizz','$2a$10$.fZybJRxgTYC0jLx3EJwweeGwdwgkHSw4UyGOyAoZycMRPYvUqyW6',NULL,NULL,NULL,1,'2014-06-28 18:13:31','2014-06-28 18:13:31','127.0.0.1','127.0.0.1','2014-06-28 18:13:31','2014-06-28 18:13:37',NULL,'100.png',0),(6,'jizztest@test.test','$2a$10$pBqVNnIDMkznJXXm.sjVZ.yvdBhJ5nGjmCgYP0roDL5wOsFlbcw4q',NULL,NULL,NULL,1,'2014-06-29 13:09:33','2014-06-29 13:09:33','127.0.0.1','127.0.0.1','2014-06-29 13:09:33','2014-06-29 13:09:34',NULL,'100.png',0);
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

-- Dump completed on 2014-07-04  0:36:34
