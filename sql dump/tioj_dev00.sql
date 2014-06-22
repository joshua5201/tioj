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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest_problem_joints`
--

LOCK TABLES `contest_problem_joints` WRITE;
/*!40000 ALTER TABLE `contest_problem_joints` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contests`
--

LOCK TABLES `contests` WRITE;
/*!40000 ALTER TABLE `contests` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `limits`
--

LOCK TABLES `limits` WRITE;
/*!40000 ALTER TABLE `limits` DISABLE KEYS */;
INSERT INTO `limits` VALUES (1,1000,65536,65536,'2014-06-20 15:40:13','2014-06-20 15:40:13',1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problems`
--

LOCK TABLES `problems` WRITE;
/*!40000 ALTER TABLE `problems` DISABLE KEYS */;
INSERT INTO `problems` VALUES (1,'0129 爆搜題','輸入第1行有一個正整數k 代表有幾組測資\r\n第2行有一個正整數n\r\n接著第3+n*(i-1)行到第2+n*(i)行是第i組測資\r\n每組測資有三個n x n的方陣 A , B , C, \r\n如果 A x B = C 則輸出 \"I need wrestling !!\", 否則輸出\"QAQQQQQQQQQQ\"','classic','2014-06-20 15:40:13','2014-06-20 15:41:06','','','2\r\n2\r\n1 2\r\n2 1\r\n0 0\r\n0 0\r\n7 1\r\n2 2\r\n1 2\r\n2 1\r\n0 0\r\n0 0\r\n0 0\r\n0 0','QAQQQQQQQQQQ\r\nI need wrestling !!','',NULL,0);
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
INSERT INTO `schema_migrations` VALUES ('20140131174639'),('20140131175010'),('20140131175102'),('20140131175153'),('20140201174405'),('20140203101504'),('20140203101934'),('20140203111940'),('20140206093208'),('20140206100424'),('20140206100458'),('20140413143616'),('20140418045046'),('20140426061543'),('20140430011011'),('20140607103418'),('20140609132824'),('20140613154934'),('20140614102332'),('20140617121220'),('20140617122408'),('20140617135637'),('20140618103628'),('20140619162501'),('20140620140855'),('20140620151303'),('20140620152237'),('20140620152508');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,'#include<iostream>\r\n#include<algorithm>\r\n#include<cstdio>\r\n#include<cstdlib>\r\n#include<ctime>\r\n \r\nusing namespace std;\r\n \r\nint n;\r\nvoid in(int A[1000][1000])\r\n{\r\n   for(int i = 0; i < n; ++i)\r\n      for(int j = 0; j < n; ++j)\r\n         scanf(\"%d\", &A[i][j]);\r\n}\r\n \r\nvoid mul(int A[1000][1000], int r[1000])\r\n{\r\n   int s[1000] = {0};\r\n   for(int i = 0; i < n; ++i)\r\n      for(int k = 0; k < n; ++k)\r\n         s[i] += A[i][k] * r[k];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = s[i];\r\n}\r\n \r\nbool test(int A[1000][1000], int B[1000][1000], int C[1000][1000])\r\n{\r\n   int r[1000], l[1000];\r\n   for(int i = 0; i < n; ++i)\r\n      r[i] = l[i] = rand() % 255;\r\n \r\n   mul(C, l);\r\n   mul(B, r);\r\n   mul(A, r);\r\n \r\n   for(int i = 0; i < n; ++i)\r\n      if(r[i] != l[i])\r\n         return false;\r\n \r\n   return true;\r\n}\r\n \r\nint A[1000][1000], B[1000][1000], C[1000][1000];\r\n \r\nint main()\r\n{\r\n   srand(time(NULL));\r\n   scanf(\"%d\", &n);\r\n \r\n   in(A); in(B); in(C);\r\n   bool flag = true;\r\n   for(int i = 0; i < 10 && flag; ++i){\r\n      if(test(A, B, C) == false){\r\n         printf(\"QAQQQQQQQQQQ\");\r\n         flag = false;\r\n      }\r\n   }\r\n   if(flag)\r\n      printf(\"I need wrestling !!\");\r\n   return 0;\r\n}','c++11','AC',0,'2014-06-20 16:00:48','2014-06-20 17:19:14',1,1,NULL);
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
  `problem_id` int(11) DEFAULT NULL,
  `test_input` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_output` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testdata`
--

LOCK TABLES `testdata` WRITE;
/*!40000 ALTER TABLE `testdata` DISABLE KEYS */;
INSERT INTO `testdata` VALUES (12,1,'8adac75d-a4c8-4fb4-8c32-84a8a7034a4c','b1f439e0-39b2-4fa1-ab6e-1896d498e91a','2014-06-20 17:17:50','2014-06-20 17:17:50'),(13,1,'10e1ff33-2d55-4e83-9100-ce1fa399a8a0','b0fdb4ba-3e42-4911-baeb-fe54b86735a5','2014-06-20 17:18:01','2014-06-20 17:18:01'),(14,1,'d6491e5c-1dd4-4afa-8d9c-848c0dbee7e2','b673d093-f502-4929-a52f-f5a90ce68ae9','2014-06-20 17:18:17','2014-06-20 17:18:17'),(15,1,'3a3ba492-7be7-45d9-a325-6b095f06d768','42727146-8640-4686-ba9a-2a4f2bfaea19','2014-06-20 17:18:57','2014-06-20 17:18:57'),(16,1,'4beeac02-c65b-4759-b61b-688242b34e67','4ea4724b-5415-441a-b42a-9980d499383e','2014-06-20 17:19:08','2014-06-20 17:19:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'big2632@gmail.com','$2a$10$kG9B4/oKGyraEoz/rxodMeb1lVNQ91iIccctAFdc0Y5pLlFAWH.e6','f018d9cd4391e6d38042398c50120af57fe401af60353cf02eacaeba6a4ff10d','2014-06-18 08:38:30',NULL,6,'2014-06-20 15:37:11','2014-06-19 13:07:18','127.0.0.1','127.0.0.1','2014-04-29 09:15:45','2014-06-20 15:37:11',NULL,NULL,1),(2,'jizz@gmail.com','$2a$10$mLmHwhuQvEVhAooScs4E0.zzdV0xjpsYal2PkALoh0UjA0JCbokmC',NULL,NULL,NULL,3,'2014-06-19 15:15:22','2014-06-19 11:56:57','127.0.0.1','127.0.0.1','2014-06-18 14:53:37','2014-06-20 03:59:11',NULL,NULL,0),(3,'jizzjizz@jizz.jizz','$2a$10$WXpHmZyRVjJYQZi3WQFGFe1W4229AvPO78HVr7XXLt6pk4QJ2GGz.',NULL,NULL,NULL,1,'2014-06-20 03:59:30','2014-06-20 03:59:30','127.0.0.1','127.0.0.1','2014-06-20 03:59:30','2014-06-20 03:59:30',NULL,NULL,0);
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

-- Dump completed on 2014-06-21  1:20:25
