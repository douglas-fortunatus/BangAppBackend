-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: bangapp
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

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
-- Table structure for table `bang_battles`
--

DROP TABLE IF EXISTS `bang_battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_battles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8mb4_unicode_ci,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `battle1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `battle2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_battles`
--

LOCK TABLES `bang_battles` WRITE;
/*!40000 ALTER TABLE `bang_battles` DISABLE KEYS */;
INSERT INTO `bang_battles` VALUES (1,'Awesome battle of images','image','images/battle/amber1.jpeg','images/battle/amber2.jpeg','2023-07-31 18:14:19','2023-07-31 18:14:19'),(2,'Exciting image battle','image','images/battle/amber3.jpeg','images/battle/gigi1.jpeg','2023-07-31 18:14:19','2023-07-31 18:14:19'),(3,'Exciting image battle','image','images/battle/gigi2.jpeg','images/battle/gigi3.jpeg','2023-07-31 18:14:19','2023-07-31 18:14:19'),(4,'Exciting image battle','image','images/battle/gigi4.jpeg','images/battle/9CHDlPTwUxFFMSf2SM1AQCcLKd0Iz4zb5h9gBtH9.jpg','2023-07-31 18:14:19','2023-07-31 18:14:19');
/*!40000 ALTER TABLE `bang_battles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bang_inspirations`
--

DROP TABLE IF EXISTS `bang_inspirations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_inspirations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tittle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `view_count` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_inspirations`
--

LOCK TABLES `bang_inspirations` WRITE;
/*!40000 ALTER TABLE `bang_inspirations` DISABLE KEYS */;
INSERT INTO `bang_inspirations` VALUES (4,'bang_logo.jpg','this is title','0','64a034d64920d.mp4','BangInspiration','bang_logo.jpg','2023-07-01 11:14:46','2023-07-01 11:14:46'),(5,'bang_logo.jpg','this is title','0','64a038ffcf499.mp4','BangInspiration','bang_logo.jpg','2023-07-01 11:32:31','2023-07-01 11:32:31');
/*!40000 ALTER TABLE `bang_inspirations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bang_update_comments`
--

DROP TABLE IF EXISTS `bang_update_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_update_comments` (
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `body` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `bang_update_comments_user_id_foreign` (`user_id`),
  KEY `bang_update_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `bang_update_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `bang_updates` (`id`),
  CONSTRAINT `bang_update_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_update_comments`
--

LOCK TABLES `bang_update_comments` WRITE;
/*!40000 ALTER TABLE `bang_update_comments` DISABLE KEYS */;
INSERT INTO `bang_update_comments` VALUES (13,10,'oiii','2023-09-19 12:41:42','2023-09-19 12:41:42'),(13,10,'oiii','2023-09-19 12:41:42','2023-09-19 12:41:42'),(13,10,'oiii','2023-09-19 12:41:42','2023-09-19 12:41:42'),(13,10,'oiii','2023-09-19 12:41:43','2023-09-19 12:41:43'),(13,10,'oiii','2023-09-19 12:41:43','2023-09-19 12:41:43'),(13,10,'oiii','2023-09-19 12:41:43','2023-09-19 12:41:43'),(13,10,'oiii','2023-09-19 12:41:43','2023-09-19 12:41:43'),(13,10,'oiii','2023-09-19 12:41:44','2023-09-19 12:41:44'),(13,10,'oiii','2023-09-19 12:41:45','2023-09-19 12:41:45'),(13,10,'oiii','2023-09-19 12:41:45','2023-09-19 12:41:45'),(13,10,'oiii','2023-09-19 12:41:45','2023-09-19 12:41:45'),(13,10,'oiii','2023-09-19 12:42:30','2023-09-19 12:42:30'),(13,10,'oiii','2023-09-19 12:42:30','2023-09-19 12:42:30'),(11,5,'hellox','2023-09-19 15:05:01','2023-09-19 15:05:01'),(11,5,'hellox','2023-09-19 15:05:10','2023-09-19 15:05:10'),(13,6,'vvvb','2023-09-19 15:11:46','2023-09-19 15:11:46'),(13,6,'vvvb','2023-09-19 15:11:46','2023-09-19 15:11:46'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:47','2023-09-19 15:11:47'),(13,6,'vvvb','2023-09-19 15:11:53','2023-09-19 15:11:53'),(13,6,'hello world','2023-09-19 15:12:00','2023-09-19 15:12:00'),(13,6,'hello world','2023-09-19 15:12:03','2023-09-19 15:12:03'),(13,6,'hello world','2023-09-19 15:12:04','2023-09-19 15:12:04'),(13,6,'hello world','2023-09-19 15:12:05','2023-09-19 15:12:05'),(13,5,'hello','2023-09-19 15:12:35','2023-09-19 15:12:35'),(13,5,'hellop workd','2023-09-19 15:12:50','2023-09-19 15:12:50'),(13,5,'hellop workd','2023-09-19 15:12:52','2023-09-19 15:12:52');
/*!40000 ALTER TABLE `bang_update_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bang_update_likes`
--

DROP TABLE IF EXISTS `bang_update_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_update_likes` (
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `bang_update_likes_user_id_foreign` (`user_id`),
  KEY `bang_update_likes_post_id_foreign` (`post_id`),
  CONSTRAINT `bang_update_likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `bang_updates` (`id`),
  CONSTRAINT `bang_update_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_update_likes`
--

LOCK TABLES `bang_update_likes` WRITE;
/*!40000 ALTER TABLE `bang_update_likes` DISABLE KEYS */;
INSERT INTO `bang_update_likes` VALUES (1,3,NULL,NULL),(6,3,NULL,NULL),(11,11,NULL,NULL),(13,10,NULL,NULL),(11,5,NULL,NULL);
/*!40000 ALTER TABLE `bang_update_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bang_updates`
--

DROP TABLE IF EXISTS `bang_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bang_updates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `caption` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('video','image') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bang_updates`
--

LOCK TABLES `bang_updates` WRITE;
/*!40000 ALTER TABLE `bang_updates` DISABLE KEYS */;
INSERT INTO `bang_updates` VALUES (2,'Faiza amdharau diva wa diamond','649d7f5109d74.jpeg','image','2023-06-29 09:55:45','2023-06-29 09:55:45'),(3,'Angela amkataa Harmonize','649d7ff87efd9.mp4','video','2023-06-29 09:58:32','2023-06-29 09:58:32'),(4,'Bang Updates 1','649dadfdd172a.jpeg','image','2023-06-29 13:14:53','2023-06-29 13:14:53'),(5,'Bang Updates 2','649dae6bad629.jpeg','image','2023-06-29 13:16:43','2023-06-29 13:16:43'),(6,'Bang Updates 3','649dae768ce58.jpeg','image','2023-06-29 13:16:54','2023-06-29 13:16:54'),(7,'Faiza amdharau diva wa diamond','649d7f5109d74.jpeg','image','2023-06-29 06:55:45','2023-06-29 06:55:45'),(8,'Angela amkataa Harmonize','649d7ff87efd9.mp4','video','2023-06-29 06:58:32','2023-06-29 06:58:32'),(9,'Bang Updates 1','649dadfdd172a.jpeg','image','2023-06-29 10:14:53','2023-06-29 10:14:53'),(10,'Bang Updates 2','649dae6bad629.jpeg','image','2023-06-29 10:16:43','2023-06-29 10:16:43'),(11,'Bang Updates 3','649dae768ce58.jpeg','image','2023-06-29 10:16:54','2023-06-29 10:16:54');
/*!40000 ALTER TABLE `bang_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_comments`
--

DROP TABLE IF EXISTS `battle_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `battles_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `battle_comments_user_id_foreign` (`user_id`),
  KEY `battle_comments_battles_id_foreign` (`battles_id`),
  CONSTRAINT `battle_comments_battles_id_foreign` FOREIGN KEY (`battles_id`) REFERENCES `bang_battles` (`id`),
  CONSTRAINT `battle_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_comments`
--

LOCK TABLES `battle_comments` WRITE;
/*!40000 ALTER TABLE `battle_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `battle_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battle_likes`
--

DROP TABLE IF EXISTS `battle_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battle_likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `battle_id` bigint unsigned NOT NULL,
  `like_type` enum('A','B') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `battle_likes_user_id_foreign` (`user_id`),
  KEY `battle_likes_battle_id_foreign` (`battle_id`),
  CONSTRAINT `battle_likes_battle_id_foreign` FOREIGN KEY (`battle_id`) REFERENCES `bang_battles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `battle_likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battle_likes`
--

LOCK TABLES `battle_likes` WRITE;
/*!40000 ALTER TABLE `battle_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `battle_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Angelo Kilback','angelo-kilback','2023-05-13 02:11:51','2023-05-13 02:11:51'),(2,'Okey Vandervort','okey-vandervort','2023-05-13 02:11:51','2023-05-13 02:11:51'),(3,'Rafaela McCullough','rafaela-mccullough','2023-05-13 02:11:51','2023-05-13 02:11:51'),(4,'Jeff Bahringer','jeff-bahringer','2023-05-13 02:11:51','2023-05-13 02:11:51'),(5,'Jakob Gerhold','jakob-gerhold','2023-05-13 02:11:51','2023-05-13 02:11:51'),(6,'Imogene Pfannerstill Jr.','imogene-pfannerstill-jr','2023-05-13 02:11:51','2023-05-13 02:11:51'),(7,'Dr. Bartholome Swaniawski','dr-bartholome-swaniawski','2023-05-13 02:11:51','2023-05-13 02:11:51'),(8,'Timmothy Steuber PhD','timmothy-steuber-phd','2023-05-13 02:11:52','2023-05-13 02:11:52');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `challenge_img` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `public_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenges_post_id_foreign` (`post_id`),
  KEY `challenges_user_id_foreign` (`user_id`),
  CONSTRAINT `challenges_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (20,14,3,'challenges/AzK6C0ksEpvTlQVEyIejrIvUBxWlN5e6Ob1HoErS.png',NULL,'image',NULL,1,'2023-07-25 16:39:02','2023-07-25 16:39:02'),(21,13,1,'challenges/4qImOnF6jlOG4Cg58lbV9JKOyBnb1h8wIZtzs3xR.png',NULL,'image',NULL,0,'2023-07-27 16:27:49','2023-07-27 16:27:49'),(22,13,1,'challenges/I9EXlFiTk7FfDJ7BM4j2g93SjJS85B8YIvLEZ055.png',NULL,'image',NULL,0,'2023-07-27 16:32:57','2023-07-27 16:32:57'),(23,13,1,'challenges/b4lPFEGRUME17CLnxuNA4VT6uNyrwk3pHVZWeXDk.png',NULL,'image',NULL,0,'2023-07-27 16:49:36','2023-07-27 16:49:36'),(24,13,1,'challenges/Vse2WEpnEYVB1Z5trOn368IV2FgwhCBg2TJFCEFB.png',NULL,'image',NULL,0,'2023-07-27 16:57:23','2023-07-27 16:57:23'),(25,13,1,'challenges/2AADKxddVjSZ7Oa0930T8RbxCNITT482Gbofy2Wo.png',NULL,'image',NULL,1,'2023-07-27 16:58:21','2023-07-27 16:58:21'),(26,13,1,'challenges/Xm3ROhq7I8NV6Tuwo7XPUpjUlFxrmnTiWAzVhjyb.png',NULL,'image',NULL,0,'2023-07-27 17:00:31','2023-07-27 17:00:31'),(27,13,1,'challenges/g1BwAwJv9nKf37Qlgcok4ybQNIvnNEHqfJ9cwdvh.png',NULL,'image',NULL,0,'2023-07-27 17:03:24','2023-07-27 17:03:24'),(28,13,1,'challenges/5TPSwBWbZvmlpiD2t5cIedSclEP5DzSeVrIDMc3c.png',NULL,'image',NULL,1,'2023-07-27 18:15:19','2023-07-27 18:15:19'),(29,13,1,'challenges/OLv9B1OFxrD5b2qNiyOmVF8EKWvbHlOvXc0XPDtV.png',NULL,'image',NULL,0,'2023-07-27 18:20:28','2023-07-27 18:20:28'),(30,13,1,'challenges/8JMskDQ2Ht56PvFlb0EQ2OUNtVH1apncGPwqGdfr.png',NULL,'image',NULL,0,'2023-07-27 18:31:25','2023-07-27 18:31:25'),(31,13,1,'challenges/J4U69GlXsOc2vYU3Wrls1PGJkjRwNIHAWtS45q3w.png',NULL,'image',NULL,0,'2023-07-31 18:41:02','2023-07-31 18:41:02'),(32,13,1,'challenges/uuOmGhC5nMLDjmku4vSgvT3iVTg1F6O42ZrpxOn6.png',NULL,'image',NULL,0,'2023-07-31 18:41:03','2023-07-31 18:41:03'),(33,14,1,'challenges/H7pk7zM840x8pITEnRgPcJ8l6OyNWWNlT3IHeC4L.png',NULL,'image',NULL,0,'2023-07-31 18:42:33','2023-07-31 18:42:33');
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_post_id_foreign` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (13,6,6,'hey','2023-07-08 07:35:44','2023-07-08 07:35:44'),(14,11,28,'hello','2023-09-18 16:56:09','2023-09-18 16:56:09'),(15,11,33,'hhello','2023-09-18 17:40:04','2023-09-18 17:40:04'),(16,11,33,'second','2023-09-18 17:40:19','2023-09-18 17:40:19'),(17,11,39,'comment one','2023-09-18 18:36:07','2023-09-18 18:36:07'),(18,13,55,'nice','2023-09-19 16:06:21','2023-09-19 16:06:21'),(19,13,55,'nice','2023-09-19 16:06:22','2023-09-19 16:06:22'),(20,13,60,'B unyama sana😲😲😀','2023-09-19 16:16:27','2023-09-19 16:16:27'),(21,13,62,'unyama sana','2023-09-19 16:29:19','2023-09-19 16:29:19'),(22,13,62,'umetisha mkuu😲','2023-09-19 16:30:16','2023-09-19 16:30:16'),(23,13,62,'hatari!!','2023-09-19 16:30:45','2023-09-19 16:30:45'),(24,13,64,'B unyama sana','2023-09-19 17:29:05','2023-09-19 17:29:05');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_posts`
--

DROP TABLE IF EXISTS `deleted_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinned` tinyint NOT NULL DEFAULT '0',
  `public_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deleted_posts_user_id_foreign` (`user_id`),
  CONSTRAINT `deleted_posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_posts`
--

LOCK TABLES `deleted_posts` WRITE;
/*!40000 ALTER TABLE `deleted_posts` DISABLE KEYS */;
INSERT INTO `deleted_posts` VALUES (2,3,'3','image','images/8OAIZdvw157In7QTBiL19FV3iOqlXE7kJGJjWZlK.png',NULL,0,NULL,'2023-07-22 07:06:28','2023-07-22 07:06:28'),(3,6,'6','image','images/LcW1FAfOGeKEQvvaAdbMTfJRaGWKsj7fzI5MnATb.jpg',NULL,0,NULL,'2023-07-22 10:50:16','2023-07-22 10:50:16'),(4,6,'6','image','images/hmm98JKyslaQBECdScISGTv1iShsuVSt0TTWQqxD.jpg',NULL,0,NULL,'2023-07-22 11:17:35','2023-07-22 11:17:35'),(5,6,'6','image','images/wPbqpadNRBWgHVAFFtL01VqtWsOVtkg92wufiXEf.jpg',NULL,1,NULL,'2023-09-18 19:40:33','2023-09-18 19:40:33'),(6,6,'6','image','images/wPbqpadNRBWgHVAFFtL01VqtWsOVtkg92wufiXEf.jpg',NULL,1,NULL,'2023-09-18 19:41:13','2023-09-18 19:41:13'),(7,6,'6','image','images/kmkeDTeEu5Ym7DdEvj2LPUoLXVVe4tj5Y8xiyV1K.png',NULL,0,NULL,'2023-09-18 19:42:43','2023-09-18 19:42:43'),(8,14,'14','image','images/bEayROkNi7xnEk3Y2FBlTYcKrYvGvLuJDIlEN05o.png','images/Yan2CIxS48R2UA5nxj2seMyLG7uqiSGTiZOmV8D7.png',0,NULL,'2023-09-19 17:01:37','2023-09-19 17:01:37');
/*!40000 ALTER TABLE `deleted_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorites` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `favorited_id` bigint unsigned NOT NULL,
  `favorited_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `favorites_user_id_favorited_id_favorited_type_unique` (`user_id`,`favorited_id`,`favorited_type`),
  CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` bigint unsigned NOT NULL,
  `following_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_follower_id_foreign` (`follower_id`),
  KEY `followers_following_id_foreign` (`following_id`),
  CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followers_following_id_foreign` FOREIGN KEY (`following_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (1,3,1),(2,3,1);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobbies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hobbies_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (508,'Reading',NULL,NULL),(509,'Cooking',NULL,NULL),(510,'Hiking',NULL,NULL),(511,'3D printing',NULL,NULL),(512,'Amateur radio',NULL,NULL),(513,'Scrapbook',NULL,NULL),(514,'Acting',NULL,NULL),(515,'Baton twirling',NULL,NULL),(516,'Board games',NULL,NULL),(517,'Book restoration',NULL,NULL),(518,'Cabaret',NULL,NULL),(519,'Calligraphy',NULL,NULL),(520,'Candle making',NULL,NULL),(521,'Computer programming',NULL,NULL),(522,'Coffee roasting',NULL,NULL),(523,'Colouring',NULL,NULL),(524,'Cosplaying',NULL,NULL),(525,'Couponing',NULL,NULL),(526,'Creative writing',NULL,NULL),(527,'Crocheting',NULL,NULL),(528,'Cryptography',NULL,NULL),(529,'Dance',NULL,NULL),(530,'Digital arts',NULL,NULL),(531,'Drama',NULL,NULL),(532,'Drawing',NULL,NULL),(533,'Do it yourself',NULL,NULL),(534,'Electronics',NULL,NULL),(535,'Embroidery',NULL,NULL),(536,'Fashion',NULL,NULL),(537,'Flower arranging',NULL,NULL),(538,'Foreign language learning',NULL,NULL),(539,'Gaming',NULL,NULL),(540,'Tabletop games',NULL,NULL),(541,'Role-playing games',NULL,NULL),(542,'Gambling',NULL,NULL),(543,'Genealogy',NULL,NULL),(544,'Glassblowing',NULL,NULL),(545,'Gunsmithing',NULL,NULL),(546,'Homebrewing',NULL,NULL),(547,'Ice skating',NULL,NULL),(548,'Jewelry making',NULL,NULL),(549,'Jigsaw puzzles',NULL,NULL),(550,'Juggling',NULL,NULL),(551,'Knapping',NULL,NULL),(552,'Knitting',NULL,NULL),(553,'Kabaddi',NULL,NULL),(554,'Knife making',NULL,NULL),(555,'Lacemaking',NULL,NULL),(556,'Lapidary',NULL,NULL),(557,'Leather crafting',NULL,NULL),(558,'Lego building',NULL,NULL),(559,'Lockpicking',NULL,NULL),(560,'Machining',NULL,NULL),(561,'Macrame',NULL,NULL),(562,'Metalworking',NULL,NULL),(563,'Magic',NULL,NULL),(564,'Model building',NULL,NULL),(565,'Listening to music',NULL,NULL),(566,'Origami',NULL,NULL),(567,'Painting',NULL,NULL),(568,'Playing musical instruments',NULL,NULL),(569,'Pet',NULL,NULL),(570,'Poi',NULL,NULL),(571,'Pottery',NULL,NULL),(572,'Puzzles',NULL,NULL),(573,'Quilting',NULL,NULL),(574,'Scrapbooking',NULL,NULL),(575,'Sculpting',NULL,NULL),(576,'Sewing',NULL,NULL),(577,'Singing',NULL,NULL),(578,'Sketching',NULL,NULL),(579,'Soapmaking',NULL,NULL),(580,'Sports',NULL,NULL),(581,'Stand-up comedy',NULL,NULL),(582,'Sudoku',NULL,NULL),(583,'Table tennis',NULL,NULL),(584,'Taxidermy',NULL,NULL),(585,'Video gaming',NULL,NULL),(586,'Watching movies',NULL,NULL),(587,'Web surfing',NULL,NULL),(588,'Whittling',NULL,NULL),(589,'Wood carving',NULL,NULL),(590,'Woodworking',NULL,NULL),(591,'World Building',NULL,NULL),(592,'Writing',NULL,NULL),(593,'Yoga',NULL,NULL),(594,'Yo-yoing',NULL,NULL),(595,'Air sports',NULL,NULL),(596,'Archery',NULL,NULL),(597,'Astronomy',NULL,NULL),(598,'Backpacking',NULL,NULL),(599,'Base jumping',NULL,NULL),(600,'Baseball',NULL,NULL),(601,'Basketball',NULL,NULL),(602,'Beekeeping',NULL,NULL),(603,'Bird watching',NULL,NULL),(604,'Blacksmithing',NULL,NULL),(605,'Board sports',NULL,NULL),(606,'Bodybuilding',NULL,NULL),(607,'Brazilian jiu-jitsu',NULL,NULL),(608,'Community',NULL,NULL),(609,'Cycling',NULL,NULL),(610,'Dowsing',NULL,NULL),(611,'Driving',NULL,NULL),(612,'Fishing',NULL,NULL),(613,'Flag football',NULL,NULL),(614,'Flying',NULL,NULL),(615,'Flying disc',NULL,NULL),(616,'Foraging',NULL,NULL),(617,'Gardening',NULL,NULL),(618,'Geocaching',NULL,NULL),(619,'Ghost hunting',NULL,NULL),(620,'Graffiti',NULL,NULL),(621,'Handball',NULL,NULL),(622,'Hooping',NULL,NULL),(623,'Horseback riding',NULL,NULL),(624,'Hunting',NULL,NULL),(625,'Inline skating',NULL,NULL),(626,'Jogging',NULL,NULL),(627,'Kayaking',NULL,NULL),(628,'Kite flying',NULL,NULL),(629,'Kitesurfing',NULL,NULL),(630,'Larping',NULL,NULL),(631,'Letterboxing',NULL,NULL),(632,'Metal detecting',NULL,NULL),(633,'Motor sports',NULL,NULL),(634,'Mountain biking',NULL,NULL),(635,'Mountaineering',NULL,NULL),(636,'Mushroom hunting',NULL,NULL),(637,'Mycology',NULL,NULL),(638,'Netball',NULL,NULL),(639,'Nordic skating',NULL,NULL),(640,'Orienteering',NULL,NULL),(641,'Paintball',NULL,NULL),(642,'Parkour',NULL,NULL),(643,'Photography',NULL,NULL),(644,'Polo',NULL,NULL),(645,'Rafting',NULL,NULL),(646,'Rappelling',NULL,NULL),(647,'Rock climbing',NULL,NULL),(648,'Roller skating',NULL,NULL),(649,'Rugby',NULL,NULL),(650,'Running',NULL,NULL),(651,'Sailing',NULL,NULL),(652,'Sand art',NULL,NULL),(653,'Scouting',NULL,NULL),(654,'Scuba diving',NULL,NULL),(655,'Sculling',NULL,NULL),(656,'Rowing',NULL,NULL),(657,'Shooting',NULL,NULL),(658,'Shopping',NULL,NULL),(659,'Skateboarding',NULL,NULL),(660,'Skiing',NULL,NULL),(661,'Skim Boarding',NULL,NULL),(662,'Skydiving',NULL,NULL),(663,'Slacklining',NULL,NULL),(664,'Snowboarding',NULL,NULL),(665,'Stone skipping',NULL,NULL),(666,'Surfing',NULL,NULL),(667,'Swimming',NULL,NULL),(668,'Taekwondo',NULL,NULL),(669,'Tai chi',NULL,NULL),(670,'Urban exploration',NULL,NULL),(671,'Vacation',NULL,NULL),(672,'Vehicle restoration',NULL,NULL),(673,'Water sports',NULL,NULL);
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `like_type` enum('A','B') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `likes_user_id_foreign` (`user_id`),
  KEY `likes_post_id_foreign` (`post_id`),
  CONSTRAINT `likes_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `likes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (67,10,14,NULL,NULL,'A'),(76,1,13,NULL,NULL,'A'),(77,1,11,NULL,NULL,'A'),(78,1,6,NULL,NULL,'A'),(82,10,15,NULL,NULL,'B'),(87,10,23,NULL,NULL,'A'),(88,6,34,NULL,NULL,'A'),(92,6,16,NULL,NULL,'A'),(93,11,28,NULL,NULL,'A'),(94,11,37,NULL,NULL,'A'),(95,11,33,NULL,NULL,'A'),(98,6,39,NULL,NULL,'A'),(102,11,41,NULL,NULL,'B'),(109,11,36,NULL,NULL,'A'),(113,11,48,NULL,NULL,'A'),(114,11,45,NULL,NULL,'A'),(117,11,43,NULL,NULL,'B'),(120,13,56,NULL,NULL,'B'),(121,13,55,NULL,NULL,'A'),(134,13,60,NULL,NULL,'B'),(139,6,64,NULL,NULL,'A'),(140,6,63,NULL,NULL,'A'),(141,13,61,NULL,NULL,'B'),(194,11,69,NULL,NULL,'A');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` bigint unsigned NOT NULL,
  `receiver_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `messages_sender_id_foreign` (`sender_id`),
  KEY `messages_receiver_id_foreign` (`receiver_id`),
  CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,10,6,'Hello Martin this is Chrispin here',NULL,NULL),(2,6,10,'hello Chrispin this is my message',NULL,NULL),(3,10,6,'Hello Martin im reminding you to work on that issue asap',NULL,NULL),(4,3,6,'hello this is my first message',NULL,NULL),(5,3,6,'hello this is my second message',NULL,NULL),(6,6,10,'helo','2023-08-13 10:22:01','2023-08-13 10:22:01'),(7,6,10,'hello','2023-08-13 10:36:56','2023-08-13 10:36:56');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (51,'2014_10_12_000000_create_users_table',1),(52,'2014_10_12_100000_create_password_resets_table',1),(53,'2016_06_01_000001_create_oauth_auth_codes_table',1),(54,'2016_06_01_000002_create_oauth_access_tokens_table',1),(55,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(56,'2016_06_01_000004_create_oauth_clients_table',1),(57,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(58,'2019_08_19_000000_create_failed_jobs_table',1),(59,'2020_06_05_102233_create_categories_table',1),(60,'2020_06_05_103613_create_posts_table',1),(61,'2020_06_05_153154_create_comments_table',1),(62,'2020_06_05_170822_create_favorites_table',1),(64,'2020_06_19_220146_create_followers_table',1),(65,'2023_04_17_130704_create_images_table',1),(66,'2023_05_08_100346_create_likes_table',1),(70,'2023_06_29_122510_create_bang_updates_table',1),(71,'2023_07_01_114457_create_bang_inspirations_table',1),(72,'2023_07_08_121817_bang_update_likes',2),(73,'2023_07_08_122810_bang_update_comments',2),(75,'2023_07_22_085846_create_deleted_posts_table',3),(78,'2023_07_25_153828_create_challenges_table',4),(79,'2020_06_05_175343_create_notifications_table',5),(80,'2023_07_30_084122_create_hobbies_table',6),(81,'2023_07_30_115108_create_user_hobby_table',7),(82,'2023_07_31_190259_create_bang_battles_table',8),(83,'2023_07_31_190437_create_battle_likes_table',9),(85,'2023_07_31_192726_create_battle_comments_table',10),(86,'2023_08_13_083723_create_messages_table',11),(87,'0000_00_00_000000_create_websockets_statistics_entries_table',12);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned DEFAULT NULL,
  `is_read` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `body` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('image','video') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `challenge_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pinned` tinyint(1) NOT NULL DEFAULT '0',
  `public_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (3,3,'martin','video','images/videos/video1.mp4',NULL,0,NULL,'2023-05-13 11:37:38','2023-05-13 11:37:38'),(5,3,'martin','image','images/KmKgZhNQQ7VCt3OyAK8zNCiRV9ltbjb6PfEyXsgF.jpg','images/cdvLCB7UIpFT1UbA0BHwmwrCbCjLvUdM0m5xrbtm.jpg',0,NULL,'2023-05-13 11:38:52','2023-05-13 11:38:52'),(6,3,'martin','image','images/wPbqpadNRBWgHVAFFtL01VqtWsOVtkg92wufiXEf.jpg',NULL,0,NULL,'2023-05-13 11:39:08','2023-05-13 11:39:08'),(11,3,NULL,'image','images/G3S4KkusV78aIcKJ82E9ckP4krc9a7mACXZD3HMJ.png',NULL,0,NULL,'2023-07-22 04:22:31','2023-07-22 04:22:31'),(13,6,NULL,'image','images/kmkeDTeEu5Ym7DdEvj2LPUoLXVVe4tj5Y8xiyV1K.png',NULL,0,NULL,'2023-07-25 13:12:21','2023-07-25 13:12:21'),(14,1,NULL,'image','images/4LzNOoU21VXq5rscxiisycdWjmKe5gta7V6MVuNU.png',NULL,0,NULL,'2023-07-25 16:33:48','2023-07-25 16:33:48'),(15,1,NULL,'image','images/ZMwavZ4ZM9OOXU2SXvmZaix3pr7uEYinH41ZjPFS.png','images/eL5gCCkcEu3lamJrBrZuoZyXGdTZRwuc3WOi2Psy.png',0,NULL,'2023-07-30 04:46:38','2023-07-30 04:46:38'),(16,1,NULL,'image','images/e7eakRFmuQiQvfVCKb3CDgzpt7o8bGnGZS9YpFpp.png','images/UTkPsZgTKS9V5soE8MVmW4iBOHHDP7bFGDU59vBK.png',0,NULL,'2023-07-30 04:47:27','2023-07-30 04:47:27'),(17,3,'martin','video','images/videos/video1.mp4',NULL,0,NULL,'2023-05-13 08:37:38','2023-05-13 08:37:38'),(18,3,'martin','image','images/KmKgZhNQQ7VCt3OyAK8zNCiRV9ltbjb6PfEyXsgF.jpg','images/cdvLCB7UIpFT1UbA0BHwmwrCbCjLvUdM0m5xrbtm.jpg',0,NULL,'2023-05-13 08:38:52','2023-05-13 08:38:52'),(19,3,'martin','image','images/wPbqpadNRBWgHVAFFtL01VqtWsOVtkg92wufiXEf.jpg',NULL,0,NULL,'2023-05-13 08:39:08','2023-05-13 08:39:08'),(20,6,'martin','image','images/wPbqpadNRBWgHVAFFtL01VqtWsOVtkg92wufiXEf.jpg',NULL,1,NULL,'2023-05-13 08:39:08','2023-05-13 08:39:08'),(21,3,NULL,'image','images/G3S4KkusV78aIcKJ82E9ckP4krc9a7mACXZD3HMJ.png',NULL,0,NULL,'2023-07-22 01:22:31','2023-07-22 01:22:31'),(23,1,NULL,'image','images/4LzNOoU21VXq5rscxiisycdWjmKe5gta7V6MVuNU.png',NULL,0,NULL,'2023-07-25 13:33:48','2023-07-25 13:33:48'),(24,1,NULL,'image','images/ZMwavZ4ZM9OOXU2SXvmZaix3pr7uEYinH41ZjPFS.png','images/eL5gCCkcEu3lamJrBrZuoZyXGdTZRwuc3WOi2Psy.png',0,NULL,'2023-07-30 01:46:38','2023-07-30 01:46:38'),(25,1,NULL,'image','images/e7eakRFmuQiQvfVCKb3CDgzpt7o8bGnGZS9YpFpp.png','images/UTkPsZgTKS9V5soE8MVmW4iBOHHDP7bFGDU59vBK.png',0,NULL,'2023-07-30 01:47:27','2023-07-30 01:47:27'),(26,1,NULL,'image','images/va5KAspBrvknE4iqPvMxOK8gufHnYmX0H1WE8YXz.png',NULL,0,NULL,'2023-08-08 12:23:08','2023-08-08 12:23:08'),(27,1,NULL,'image','images/ztyQF8XZvCdypgzZTMtyrhpBWszn8CPbcSedwgdY.png',NULL,0,NULL,'2023-08-08 12:33:01','2023-08-08 12:33:01'),(28,1,NULL,'image','images/9m6qpGButc67c7N3HRUjCQtbYv3OVzzjuVTXhqMe.png',NULL,0,NULL,'2023-08-08 12:35:33','2023-08-08 12:35:33'),(29,6,'hii picha ni kali sana','image','images/5RXJcTmSz36TY8lpkqGB5w5sinr7zZ89ky9ZTEXs.png',NULL,0,NULL,'2023-08-08 13:22:09','2023-08-08 13:22:09'),(30,6,'hii picha ni kali sana','image','images/Wjt9Q68aW01iW3tu29p06AJ8zzPevPRkhKOpdZ5W.png',NULL,0,NULL,'2023-08-08 13:26:06','2023-08-08 13:26:06'),(31,6,'hii picha ni kali sana','image','images/EU18H113tjyDRhc9zqBj2vHDAfa8VoB3HELczVEz.png',NULL,0,NULL,'2023-08-08 13:38:51','2023-08-08 13:38:51'),(32,6,'hii ni sebule yangu','image','images/yOwznGhNSqk7gqLckTSUng7PFx5YMYMP4qNOSFxA.png',NULL,0,NULL,'2023-08-08 13:44:19','2023-08-08 13:44:19'),(33,6,'caption yoyote','image','images/1ryPy0lNzdZrbUGaDDAJE77BJctucoIs9e0qjiaa.png',NULL,0,NULL,'2023-08-08 13:46:26','2023-08-08 13:46:26'),(34,6,'picha ya kwanza','image','images/vOU3TqRr5JkDXdsjkDdevtn7Xt77C0Pxyy3sJmCz.png',NULL,0,NULL,'2023-08-08 14:21:47','2023-08-08 14:21:47'),(35,6,'hii ndo picha ya kwanza','image','images/jVFKqV2y7ee0LeliL7tSJPnczJ3M4bqBTYv1ixhx.png',NULL,0,NULL,'2023-08-08 14:50:29','2023-08-08 14:50:29'),(36,6,NULL,'image','images/PkuYx3mFTHEkJTOnqxiuLDUjYE6KKDKe8KEzZvUC.png','images/6dTGakXajENAwxGANcQ2FUMEa5goDJwasvjFkbYk.png',0,NULL,'2023-09-18 15:35:58','2023-09-18 15:35:58'),(37,6,'martin','image','images/9rIqaOVEWXpKxi9c3kL9oVRaj3vToy9ZMLvw83tx.png',NULL,0,NULL,'2023-09-18 16:29:34','2023-09-18 16:29:34'),(38,11,'post by herman','image','images/PVdieqyIr8oxNMq5b0A7WYqAqwokVFvRYhvN1D3s.png',NULL,0,NULL,'2023-09-18 16:58:18','2023-09-18 16:58:18'),(39,11,'post two','image','images/VBatqJHVope8svd42tKri4COrPgCeB6JscwAdnxi.png',NULL,0,NULL,'2023-09-18 16:59:29','2023-09-18 16:59:29'),(40,11,'caption','image','images/20Nk0jqLnmll23GsYRQs8AXr8YZxJAX1TfyGKT8j.png',NULL,0,NULL,'2023-09-18 17:33:16','2023-09-18 17:33:16'),(41,6,NULL,'image','images/rcFcDK0XAaKVfwXxQm8lDZVXypwNAQm2xyWGfsMO.png','images/TiOsFCyRIUCDmDgDoSkc383RLmWdYGRWp4UNLIAq.png',0,NULL,'2023-09-18 17:35:29','2023-09-18 17:35:29'),(42,6,NULL,'image','images/cNUVJPulQWfRJjLr7qDqVpsBBUjsaZ1nIP8JYIPy.png','images/slLYfJXecbH7XozmeuQ9w06mo4gZe1CzO9j1BnVg.png',0,NULL,'2023-09-18 17:47:27','2023-09-18 17:47:27'),(43,6,NULL,'image','images/IynR2lWKuZnEB4Yx7jBFChQsYy4ZISO7nfLrzWaX.png','images/X6lSuk0gox9ScezCDkOWbzoKGgWmZkhOLlZaYHXB.png',0,NULL,'2023-09-18 17:48:44','2023-09-18 17:48:44'),(45,11,'capyiooo','image','images/CYZs7Jw0A7nttYAy3z8wxUPifBAk3qroxIkML6Bu.png',NULL,0,NULL,'2023-09-18 18:40:15','2023-09-18 18:40:15'),(48,6,NULL,'video','images/videos/video1.mp4',NULL,0,NULL,'2023-09-18 19:05:12','2023-09-18 19:05:12'),(49,11,'ok','image','images/izRuA0x4Y3C36wN9yQN7RUrgIObEgqXMc2HxB0Dc.png',NULL,0,NULL,'2023-09-18 19:11:28','2023-09-18 19:11:28'),(50,11,NULL,'image','images/2DIkgRNhP7P2uPoivMf9eoc6X6N0AMTrjNeZC5nO.png',NULL,1,NULL,'2023-09-18 19:30:20','2023-09-18 19:30:20'),(51,11,'pinned post','image','images/iVRuCHzx7gxRQFQ5RbhS4n5Yh4M5HSeCxKHiT1B7.png',NULL,1,NULL,'2023-09-18 19:31:46','2023-09-18 19:31:46'),(52,11,'pin2','image','images/0kNNDmKKN1t5wRB5kfpK6fNyCK9INGG7ARZUzNx8.png',NULL,1,NULL,'2023-09-18 19:34:20','2023-09-18 19:34:20'),(53,11,NULL,'image','images/nXa3We4diyIU7tLjtF1VFHlNk2DhuUlKgvDgNYhA.png',NULL,0,NULL,'2023-09-18 19:35:13','2023-09-18 19:35:13'),(54,6,'@the office','image','images/KoAXiXo7pavlDuJ8JYUSOB76NlyIY60q3pb5zMfs.png',NULL,0,NULL,'2023-09-19 07:16:15','2023-09-19 07:16:15'),(55,13,'@the office','image','images/q2fT6aiIZ3o1HJN4K4PW0cZ1SVlex8D8OOi3AXKs.png',NULL,0,NULL,'2023-09-19 08:54:30','2023-09-19 08:54:30'),(56,13,NULL,'image','images/Fkh3v5yDyhpaWIXZZoSzdYPX1Q95tqdR29yUKkDD.png','images/eRTIwosg99jVeG4EIyrch5Aig3elRdI3INnru2Hv.png',0,NULL,'2023-09-19 08:59:46','2023-09-19 08:59:46'),(58,13,'hbd to you','image','images/NskcDie5qz5DLKhM7JVsWu74gMtdt2yq9ScMVv8U.png',NULL,0,NULL,'2023-09-19 09:09:12','2023-09-19 09:09:12'),(59,13,NULL,'image','images/NJPmPwk34OTSidYQtD3MEbHmAfJ9KH9jJLaikip6.png','images/PKT6uRBXgccc5JcG2xUuVguFwN7cT0RNFGt2WXei.png',0,NULL,'2023-09-19 16:00:38','2023-09-19 16:00:38'),(60,13,NULL,'image','images/T839WAMaU68fKeRU1y5hiy4tYaP93mSuSQ6UluLn.png','images/rrtK1wPoRITJscQOVNcbI9ACYulM1n01eB8Ozs74.png',0,NULL,'2023-09-19 16:03:09','2023-09-19 16:03:09'),(61,13,NULL,'image','images/H1xfGsriEnE7bbAz17XyO2ixhstmSmhfFB9qWW6A.png','images/gAP5wCUpCZuyF9mVavpxwPKHLKE97ulpd4yOuyRP.png',0,NULL,'2023-09-19 16:13:52','2023-09-19 16:13:52'),(62,6,NULL,'image','images/nkcGhtUKROD8XRcKlWDBQ4HZJhBKjzEaCdcJUYLV.png',NULL,0,NULL,'2023-09-19 16:24:09','2023-09-19 16:24:09'),(63,6,NULL,'image','images/RSivGWvjJBXdlZBOSEiwWe4ZvdYVM1oLUhtIMJi4.png',NULL,0,NULL,'2023-09-19 16:28:33','2023-09-19 16:28:33'),(64,14,NULL,'image','images/YfFZ4g0r7l8E8d4U9jV5pasYR03ljl3xFOxRlZZ8.png','images/DqGyLd0ZJ524zdnCKMcAbICeR8nsobdSovmlOVsJ.png',0,NULL,'2023-09-19 16:58:26','2023-09-19 16:58:26'),(66,6,NULL,'image','images/y72jgw07VtGNIMuogQ8oDoOZVYOgHf5uUDYHXB6u.png',NULL,0,NULL,'2023-09-19 17:01:28','2023-09-19 17:01:28'),(67,6,'hii picha ni kali sana','image','images/BwiFvgO9frPCwJyQgyhH87bH7zWexgBu2V2GiOmF.png','images/QGzSpfHIaNyLHJSbIYlb9uFQE9Gv7WiLVT3jyX6Q.png',0,NULL,'2023-09-19 17:27:31','2023-09-19 17:27:31'),(68,6,'hii picha ni kali sana','image','images/10wmiRLBRaodUXfwiQm5ceOeWgCTHhZo144LIGNk.png','images/DZlvSJMQhOdagSjLxyHIqw1sIoKodASjAaiUn0bD.png',0,NULL,'2023-09-19 17:28:18','2023-09-19 17:28:18'),(69,13,'A or B','image','images/JUbp5P8YVtU8TpaQr4QqIr8uVXainu6uKMNhyYeD.png','images/z3DfVoLgv9u2OMeRkg4Kmpc0wJzvURnO16MxgYRE.png',0,NULL,'2023-09-19 17:44:54','2023-09-19 17:44:54'),(70,13,'A or B','image','images/dYMUzcZ4VnJFfHa17TBZrCFzSTPNCX1Wt3FnqB1N.png','images/ANBaFgPNXJLlNlCAz8V1HObl21719w5EAdRyUial.png',0,NULL,'2023-09-19 17:46:44','2023-09-19 17:46:44');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_hobby`
--

DROP TABLE IF EXISTS `user_hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_hobby` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `hobby_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_hobby_user_id_hobby_id_unique` (`user_id`,`hobby_id`),
  KEY `user_hobby_hobby_id_foreign` (`hobby_id`),
  CONSTRAINT `user_hobby_hobby_id_foreign` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_hobby_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_hobby`
--

LOCK TABLES `user_hobby` WRITE;
/*!40000 ALTER TABLE `user_hobby` DISABLE KEYS */;
INSERT INTO `user_hobby` VALUES (10,10,608,'2023-07-30 10:50:43','2023-07-30 10:50:43'),(11,10,521,'2023-07-30 10:50:43','2023-07-30 10:50:43'),(12,10,509,'2023-07-30 10:50:43','2023-07-30 10:50:43'),(13,11,604,'2023-09-18 16:44:44','2023-09-18 16:44:44'),(14,12,514,'2023-09-19 08:06:09','2023-09-19 08:06:09'),(15,12,596,'2023-09-19 08:06:09','2023-09-19 08:06:09'),(16,12,599,'2023-09-19 08:06:09','2023-09-19 08:06:09'),(17,13,511,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(18,13,514,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(19,13,595,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(20,13,512,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(21,13,596,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(22,13,597,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(23,13,598,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(24,13,599,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(25,13,600,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(26,13,601,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(27,13,515,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(28,13,602,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(29,13,603,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(30,13,604,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(31,13,516,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(32,13,605,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(33,13,606,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(34,13,517,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(35,13,607,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(36,13,518,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(37,13,519,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(38,13,520,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(39,13,522,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(40,13,523,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(41,13,608,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(42,13,521,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(43,13,509,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(44,13,524,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(45,13,525,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(46,13,526,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(47,13,527,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(48,13,528,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(49,13,609,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(50,13,529,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(51,13,530,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(52,13,533,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(53,13,610,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(54,13,531,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(55,13,532,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(56,13,611,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(57,13,534,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(58,13,535,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(59,13,536,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(60,13,612,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(61,13,613,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(62,13,537,'2023-09-19 08:36:32','2023-09-19 08:36:32'),(63,13,614,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(64,13,615,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(65,13,616,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(66,13,538,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(67,13,542,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(68,13,539,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(69,13,617,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(70,13,543,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(71,13,618,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(72,13,619,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(73,13,544,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(74,13,620,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(75,13,545,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(76,13,621,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(77,13,510,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(78,13,546,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(79,13,622,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(80,13,623,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(81,13,624,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(82,13,547,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(83,13,625,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(84,13,548,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(85,13,549,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(86,13,626,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(87,13,550,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(88,13,553,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(89,13,627,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(90,13,628,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(91,13,629,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(92,13,551,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(93,13,554,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(94,13,552,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(95,13,555,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(96,13,556,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(97,13,630,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(98,13,557,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(99,13,558,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(100,13,631,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(101,13,565,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(102,13,559,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(103,13,560,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(104,13,561,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(105,13,563,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(106,13,632,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(107,13,562,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(108,13,564,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(109,13,633,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(110,13,634,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(111,13,635,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(112,13,636,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(113,13,637,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(114,13,638,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(115,13,639,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(116,13,640,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(117,13,566,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(118,13,641,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(119,13,567,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(120,13,642,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(121,13,569,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(122,13,643,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(123,13,568,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(124,13,570,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(125,13,644,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(126,13,571,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(127,13,572,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(128,13,573,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(129,13,645,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(130,13,646,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(131,13,508,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(132,13,647,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(133,13,541,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(134,13,648,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(135,13,656,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(136,13,649,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(137,13,650,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(138,13,651,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(139,13,652,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(140,13,653,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(141,13,513,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(142,13,574,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(143,13,654,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(144,13,655,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(145,13,575,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(146,13,576,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(147,13,657,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(148,13,658,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(149,13,577,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(150,13,659,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(151,13,578,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(152,13,660,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(153,13,661,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(154,13,662,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(155,13,663,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(156,13,664,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(157,13,579,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(158,13,580,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(159,13,581,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(160,13,665,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(161,13,582,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(162,13,666,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(163,13,667,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(164,13,583,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(165,13,540,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(166,13,668,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(167,13,669,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(168,13,584,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(169,13,670,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(170,13,671,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(171,13,672,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(172,13,585,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(173,13,586,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(174,13,673,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(175,13,587,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(176,13,588,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(177,13,589,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(178,13,590,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(179,13,591,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(180,13,592,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(181,13,594,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(182,13,593,'2023-09-19 08:36:33','2023-09-19 08:36:33'),(183,14,536,'2023-09-19 16:41:36','2023-09-19 16:41:36'),(184,14,563,'2023-09-19 16:41:36','2023-09-19 16:41:36'),(185,15,599,'2023-09-19 18:35:05','2023-09-19 18:35:05'),(186,15,514,'2023-09-19 18:35:05','2023-09-19 18:35:05');
/*!40000 ALTER TABLE `user_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(700) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `occupation` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_token` varchar(10000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'crispin','martinkaboja@gmail.com','mohammed@gmail.com',NULL,'bang_logo.jpg','chrispin',NULL,NULL,NULL,NULL,'$2y$10$zOwW8bHBeJcSYCYCamWiiuYT/JujlktWxvJ7CuO3j4.axzqBCTB2a',NULL,'dzUHuiw9SKSZS69rFPP_rG:APA91bFQagXq1Fw68o_VAr26IXQu2UrlqpvMRgGViNjxHNJC7GrRfPdHPa2aKRXRvC027l1U8zXBB6FJm6FWq_JFO2JTyDGRy7XXtUh6rp38Cppv14xr4lIQbzR3jjc4Zmr0eBrAzYhH','2023-05-13 02:11:51','2023-07-30 12:27:14'),(2,'Mr. Vincenzo Heathcote','','bstokes@example.net','2023-05-13 02:11:51','bang_logo.jpg','',NULL,NULL,NULL,NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vVVcyj8Bci','vsddfewfef4rweed','2023-05-13 02:11:51','2023-07-23 13:02:38'),(3,'Kiara Rohan','','fredrick.schumm@example.com','2023-05-13 02:11:51','bang_logo.jpg','',NULL,NULL,NULL,NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9Pj5oqlKMj','','2023-05-13 02:11:51','2023-05-13 02:11:51'),(4,'Ryder Padberg','','jkeebler@example.com','2023-05-13 02:11:51','bang_logo.jpg','',NULL,NULL,NULL,NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','9QvPW8g9wB','','2023-05-13 02:11:51','2023-05-13 02:11:51'),(5,'Judy O\'Kon DVM','','gcrist@example.org','2023-05-13 02:11:52','bang_logo.jpg','',NULL,NULL,NULL,NULL,'$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','BFLWJzn5A4','','2023-05-13 02:11:52','2023-05-13 02:11:52'),(6,'martin','','martin@gmail.com',NULL,'bang_logo.jpg','',NULL,NULL,NULL,NULL,'$2y$10$zOwW8bHBeJcSYCYCamWiiuYT/JujlktWxvJ7CuO3j4.axzqBCTB2a',NULL,'eT8KvQTBSKGtU_D-acXZeI:APA91bFLBErJ6updm36604IZ4crwpLCaUMryzZnqOaMA5qRnjByEnikNgOr9pBZL-Qlxvfvtt9Lu-uKEgwrYwucKF_8YbXdDSWh3pvoVQFstG0Uhqfv4UdUl_oGyI8TC2nnVyWfmF8AX','2023-05-13 02:14:41','2023-09-19 18:59:15'),(10,'chrispin','','chrispin@gmail.com',NULL,'bang_logo.jpg','',710426565,'1993-07-01',NULL,NULL,'$2y$10$NZql4mSEQIAbEpsraAeZfOP11xXuJxtcDt3RUQ0kEwrHVVgHRqBKq',NULL,'dzUHuiw9SKSZS69rFPP_rG:APA91bFQagXq1Fw68o_VAr26IXQu2UrlqpvMRgGViNjxHNJC7GrRfPdHPa2aKRXRvC027l1U8zXBB6FJm6FWq_JFO2JTyDGRy7XXtUh6rp38Cppv14xr4lIQbzR3jjc4Zmr0eBrAzYhH','2023-07-30 10:50:43','2023-07-30 10:50:45'),(11,'herman',NULL,'herman@gmail.com',NULL,NULL,NULL,621189850,'2000-09-01',NULL,NULL,'$2y$10$nSks0GOB/Hl.KZw8lOwuQ.q6RJhdK3bUyEOToAA0WgUQUikW85k26',NULL,'dhSRsjCSSnWlRc_IEqvY1w:APA91bGxx4CMT_FZ4OGC-fi3TGiVCDgtl6-xoGRe-XNS4iicRaRI8pdclcPy1VWdvGhve1ZGF8zmdSQF-oOqhzU1hEygbK2no9Z30snQMmK7Ux-aIQbDdWUetATmJlj6lXykRifcvD3n','2023-09-18 16:44:44','2023-09-19 15:02:46'),(12,'hbmartin',NULL,'martinkaboja@gmail.com',NULL,NULL,NULL,785929950,'2000-09-06',NULL,NULL,'$2y$10$FqQJmITPLNW/xizhZPcK8.xGctfl4IBAg5jvJ/LtNKLMO4YEaDEBq',NULL,'dUqr_vakRBqLJaxvlUA_Ru:APA91bHwYWsdyjr57G0FPfoeEapodH_VPJg_apRoa-byKaL8FaZc0X2ctxJUmolWDBJZ22qbOIkDB3nuJrSAMipK8YiFs47HXQlhcQzqRn9EIRN_WHncRiBcWPGMJ9IXkiyVxjubNiZl','2023-09-19 08:06:09','2023-09-19 08:06:10'),(13,'Fabiankisinini',NULL,'kisininichrispin@gmail.com',NULL,NULL,NULL,717161736,'1981-11-13',NULL,NULL,'$2y$10$SzZXMSqCRnWrXlE5/.N/nuUD8zKx9hgHlQUWfZoJjdczxRstHKOU.',NULL,'eqCep_Z8QDKurRddEBX9ZH:APA91bHDc-iFo6SnGK3w_YkZcUbvA45VrWv6C_P26E3ccRoY0cxQ3URTfttepp10Nbo2v6Weui1kjRp-RupUePpVuSZnlhl02rS5g-XGANM8vGhEDYwnmBRVQVlRCN0u92ECKeTsCFpO','2023-09-19 08:36:32','2023-09-19 08:36:36'),(14,'Rehemasekoi',NULL,'Sekoyorehema@gmail.com',NULL,NULL,NULL,659512993,'2000-02-05',NULL,NULL,'$2y$10$aFmd0qIlQYYpFSOMlKfLje9lsYi1XgoW1o1kdSVDt38rYzz3khbse',NULL,'evRxfIDgTBCvfPycbei_qD:APA91bGD7WXDfqMazvozrBowNA_BSIk543QYYJ2d7ey7aJelYDYRc_BZXTvySViH1_TnBd9LXx7y_z5Kc2uelh_qCgmyXOv51d7p4mu5YAFn4s0pp2UptEd2VmGPbCKuTS5-k8TzP41C','2023-09-19 16:41:36','2023-09-19 16:41:37'),(15,'martnkb',NULL,'martinkaboja@gmaill.com',NULL,NULL,NULL,710424254,'2000-09-06',NULL,NULL,'$2y$10$uE3FOHMX6pl/GVQfs9FD1OJl0kK7YTky0MALLbMXUWAcFfpxufCVa',NULL,'eT8KvQTBSKGtU_D-acXZeI:APA91bFLBErJ6updm36604IZ4crwpLCaUMryzZnqOaMA5qRnjByEnikNgOr9pBZL-Qlxvfvtt9Lu-uKEgwrYwucKF_8YbXdDSWh3pvoVQFstG0Uhqfv4UdUl_oGyI8TC2nnVyWfmF8AX','2023-09-19 18:35:05','2023-09-19 18:35:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
INSERT INTO `websockets_statistics_entries` VALUES (1,'12345',0,0,1,'2023-08-15 13:15:19','2023-08-15 13:15:19'),(2,'12345',0,0,1,'2023-08-15 13:16:17','2023-08-15 13:16:17'),(3,'12345',0,0,1,'2023-08-15 13:17:16','2023-08-15 13:17:16'),(4,'12345',0,0,1,'2023-08-15 13:18:17','2023-08-15 13:18:17'),(5,'12345',0,0,1,'2023-08-15 13:19:16','2023-08-15 13:19:16'),(6,'12345',0,0,1,'2023-08-15 13:20:17','2023-08-15 13:20:17'),(7,'12345',0,0,1,'2023-08-15 13:21:17','2023-08-15 13:21:17'),(8,'12345',0,0,1,'2023-08-15 13:22:17','2023-08-15 13:22:17'),(9,'12345',1,8,1,'2023-08-15 14:27:27','2023-08-15 14:27:27'),(10,'12345',1,1,2,'2023-08-15 14:28:26','2023-08-15 14:28:26'),(11,'12345',1,1,1,'2023-08-15 14:29:26','2023-08-15 14:29:26'),(12,'12345',1,1,1,'2023-08-15 14:30:26','2023-08-15 14:30:26'),(13,'12345',1,2,1,'2023-08-15 14:54:53','2023-08-15 14:54:53'),(14,'12345',1,2,1,'2023-08-15 14:55:52','2023-08-15 14:55:52'),(15,'12345',1,1,1,'2023-08-15 14:56:52','2023-08-15 14:56:52'),(16,'12345',1,1,1,'2023-08-15 14:57:53','2023-08-15 14:57:53'),(17,'12345',1,2,1,'2023-08-15 14:58:52','2023-08-15 14:58:52'),(18,'12345',1,1,1,'2023-08-15 14:59:53','2023-08-15 14:59:53'),(19,'12345',1,2,1,'2023-08-15 15:00:53','2023-08-15 15:00:53'),(20,'12345',1,2,1,'2023-08-15 15:01:54','2023-08-15 15:01:54'),(21,'12345',1,1,1,'2023-08-15 15:02:52','2023-08-15 15:02:52'),(22,'12345',1,1,1,'2023-08-15 15:03:52','2023-08-15 15:03:52'),(23,'12345',1,2,1,'2023-08-15 15:04:52','2023-08-15 15:04:52'),(24,'12345',1,1,1,'2023-08-15 15:05:52','2023-08-15 15:05:52'),(25,'12345',1,1,1,'2023-08-15 15:06:53','2023-08-15 15:06:53'),(26,'12345',1,2,1,'2023-08-15 15:07:53','2023-08-15 15:07:53'),(27,'12345',1,2,1,'2023-08-15 15:08:53','2023-08-15 15:08:53'),(28,'12345',1,1,2,'2023-08-15 15:09:53','2023-08-15 15:09:53'),(29,'12345',1,1,1,'2023-08-15 15:10:53','2023-08-15 15:10:53'),(30,'12345',1,1,1,'2023-08-15 15:11:53','2023-08-15 15:11:53'),(31,'12345',1,2,1,'2023-08-15 15:12:53','2023-08-15 15:12:53'),(32,'12345',1,1,1,'2023-08-15 15:13:53','2023-08-15 15:13:53'),(33,'12345',1,1,2,'2023-08-15 15:14:53','2023-08-15 15:14:53'),(34,'12345',1,1,1,'2023-08-15 15:15:53','2023-08-15 15:15:53'),(35,'12345',1,1,1,'2023-08-15 15:16:53','2023-08-15 15:16:53'),(36,'12345',1,2,1,'2023-08-15 15:17:53','2023-08-15 15:17:53'),(37,'12345',1,1,1,'2023-08-15 15:18:53','2023-08-15 15:18:53'),(38,'12345',1,1,1,'2023-08-15 15:19:53','2023-08-15 15:19:53'),(39,'12345',1,2,1,'2023-08-15 15:20:53','2023-08-15 15:20:53'),(40,'12345',1,1,1,'2023-08-15 15:21:53','2023-08-15 15:21:53'),(41,'12345',1,1,1,'2023-08-15 15:22:53','2023-08-15 15:22:53'),(42,'12345',1,1,1,'2023-08-15 15:23:53','2023-08-15 15:23:53'),(43,'12345',1,1,1,'2023-08-15 15:24:53','2023-08-15 15:24:53'),(44,'12345',1,1,1,'2023-08-15 15:25:53','2023-08-15 15:25:53'),(45,'12345',1,1,1,'2023-08-15 15:26:53','2023-08-15 15:26:53'),(46,'12345',1,2,1,'2023-08-15 15:27:53','2023-08-15 15:27:53'),(47,'12345',1,1,1,'2023-08-15 15:28:54','2023-08-15 15:28:54'),(48,'12345',1,2,1,'2023-08-15 15:29:55','2023-08-15 15:29:55'),(49,'12345',1,0,1,'2023-08-15 15:30:53','2023-08-15 15:30:53'),(50,'12345',1,1,1,'2023-08-15 15:31:53','2023-08-15 15:31:53'),(51,'12345',1,1,1,'2023-08-15 15:32:53','2023-08-15 15:32:53'),(52,'12345',1,1,1,'2023-08-15 15:33:53','2023-08-15 15:33:53'),(53,'12345',1,1,1,'2023-08-15 15:34:53','2023-08-15 15:34:53'),(54,'12345',1,1,1,'2023-08-15 15:35:53','2023-08-15 15:35:53'),(55,'12345',1,1,1,'2023-08-15 15:36:53','2023-08-15 15:36:53'),(56,'12345',1,1,1,'2023-08-15 15:37:53','2023-08-15 15:37:53'),(57,'12345',1,1,1,'2023-08-15 15:38:53','2023-08-15 15:38:53'),(58,'12345',1,1,1,'2023-08-15 15:39:53','2023-08-15 15:39:53'),(59,'12345',1,1,1,'2023-08-15 15:40:53','2023-08-15 15:40:53'),(60,'12345',1,1,1,'2023-08-15 15:41:53','2023-08-15 15:41:53'),(61,'12345',1,2,1,'2023-08-15 15:42:54','2023-08-15 15:42:54'),(62,'12345',1,2,1,'2023-08-15 15:43:53','2023-08-15 15:43:53'),(63,'12345',1,1,1,'2023-08-15 15:44:53','2023-08-15 15:44:53'),(64,'12345',1,1,1,'2023-08-15 15:45:53','2023-08-15 15:45:53'),(65,'12345',1,1,1,'2023-08-15 15:46:53','2023-08-15 15:46:53'),(66,'12345',1,1,1,'2023-08-15 15:47:53','2023-08-15 15:47:53'),(67,'12345',1,1,1,'2023-08-15 15:48:53','2023-08-15 15:48:53'),(68,'12345',1,2,1,'2023-08-15 15:49:53','2023-08-15 15:49:53'),(69,'12345',1,1,1,'2023-08-15 15:50:54','2023-08-15 15:50:54'),(70,'12345',1,2,1,'2023-08-15 15:51:53','2023-08-15 15:51:53'),(71,'12345',1,1,1,'2023-08-15 15:52:53','2023-08-15 15:52:53'),(72,'12345',1,1,1,'2023-08-15 15:53:53','2023-08-15 15:53:53'),(73,'12345',1,1,1,'2023-08-15 15:54:54','2023-08-15 15:54:54'),(74,'12345',1,1,1,'2023-08-15 15:55:54','2023-08-15 15:55:54'),(75,'12345',1,1,1,'2023-08-15 15:56:53','2023-08-15 15:56:53'),(76,'12345',1,1,1,'2023-08-15 15:57:53','2023-08-15 15:57:53'),(77,'12345',1,1,1,'2023-08-15 15:58:53','2023-08-15 15:58:53'),(78,'12345',1,1,1,'2023-08-15 15:59:53','2023-08-15 15:59:53'),(79,'12345',1,1,1,'2023-08-15 16:00:53','2023-08-15 16:00:53'),(80,'12345',1,1,1,'2023-08-15 16:01:53','2023-08-15 16:01:53'),(81,'12345',1,1,2,'2023-08-15 16:02:53','2023-08-15 16:02:53'),(82,'12345',1,1,2,'2023-08-15 16:03:53','2023-08-15 16:03:53'),(83,'12345',1,1,1,'2023-08-15 16:04:53','2023-08-15 16:04:53'),(84,'12345',1,1,1,'2023-08-15 16:05:53','2023-08-15 16:05:53'),(85,'12345',1,1,1,'2023-08-15 16:06:54','2023-08-15 16:06:54'),(86,'12345',1,2,1,'2023-08-15 16:07:53','2023-08-15 16:07:53'),(87,'12345',1,1,1,'2023-08-15 16:08:53','2023-08-15 16:08:53'),(88,'12345',1,1,1,'2023-08-15 16:09:53','2023-08-15 16:09:53'),(89,'12345',1,1,1,'2023-08-15 16:10:53','2023-08-15 16:10:53'),(90,'12345',1,1,1,'2023-08-15 16:11:53','2023-08-15 16:11:53'),(91,'12345',1,1,1,'2023-08-15 16:12:53','2023-08-15 16:12:53'),(92,'12345',1,1,1,'2023-08-15 16:13:53','2023-08-15 16:13:53'),(93,'12345',1,1,1,'2023-08-15 16:14:53','2023-08-15 16:14:53'),(94,'12345',1,2,1,'2023-08-15 16:15:53','2023-08-15 16:15:53'),(95,'12345',1,1,1,'2023-08-15 16:16:53','2023-08-15 16:16:53'),(96,'12345',1,1,1,'2023-08-15 16:17:53','2023-08-15 16:17:53'),(97,'12345',1,1,1,'2023-08-15 16:18:53','2023-08-15 16:18:53'),(98,'12345',1,1,1,'2023-08-15 16:19:53','2023-08-15 16:19:53'),(99,'12345',1,1,1,'2023-08-15 16:20:53','2023-08-15 16:20:53'),(100,'12345',1,1,1,'2023-08-15 16:21:53','2023-08-15 16:21:53'),(101,'12345',1,1,1,'2023-08-15 16:22:53','2023-08-15 16:22:53'),(102,'12345',1,2,1,'2023-08-15 16:23:53','2023-08-15 16:23:53'),(103,'12345',1,1,1,'2023-08-15 16:24:53','2023-08-15 16:24:53'),(104,'12345',1,1,1,'2023-08-15 16:25:53','2023-08-15 16:25:53'),(105,'12345',1,1,1,'2023-08-15 16:26:53','2023-08-15 16:26:53'),(106,'12345',1,1,1,'2023-08-15 16:27:53','2023-08-15 16:27:53'),(107,'12345',1,1,1,'2023-08-15 16:28:53','2023-08-15 16:28:53'),(108,'12345',1,1,1,'2023-08-15 16:29:53','2023-08-15 16:29:53'),(109,'12345',1,1,1,'2023-08-15 16:30:53','2023-08-15 16:30:53'),(110,'12345',1,1,1,'2023-08-15 16:31:53','2023-08-15 16:31:53'),(111,'12345',1,1,1,'2023-08-15 16:32:53','2023-08-15 16:32:53'),(112,'12345',1,1,1,'2023-08-15 16:33:53','2023-08-15 16:33:53'),(113,'12345',1,1,1,'2023-08-15 16:34:53','2023-08-15 16:34:53'),(114,'12345',1,1,1,'2023-08-15 16:35:53','2023-08-15 16:35:53'),(115,'12345',1,1,1,'2023-08-15 16:36:53','2023-08-15 16:36:53'),(116,'12345',1,1,1,'2023-08-15 16:37:53','2023-08-15 16:37:53'),(117,'12345',1,1,1,'2023-08-15 16:38:54','2023-08-15 16:38:54'),(118,'12345',1,1,1,'2023-08-15 16:39:53','2023-08-15 16:39:53'),(119,'12345',1,1,1,'2023-08-15 16:40:53','2023-08-15 16:40:53'),(120,'12345',1,1,1,'2023-08-15 16:41:53','2023-08-15 16:41:53'),(121,'12345',1,1,1,'2023-08-15 16:42:53','2023-08-15 16:42:53'),(122,'12345',1,2,1,'2023-08-15 16:43:53','2023-08-15 16:43:53'),(123,'12345',1,1,1,'2023-08-15 16:44:53','2023-08-15 16:44:53'),(124,'12345',1,1,1,'2023-08-15 16:45:53','2023-08-15 16:45:53'),(125,'12345',1,1,1,'2023-08-15 16:46:53','2023-08-15 16:46:53'),(126,'12345',1,1,1,'2023-08-15 16:47:53','2023-08-15 16:47:53'),(127,'12345',1,1,1,'2023-08-15 16:48:53','2023-08-15 16:48:53'),(128,'12345',1,1,1,'2023-08-15 16:49:55','2023-08-15 16:49:55'),(129,'12345',1,2,1,'2023-08-15 16:50:53','2023-08-15 16:50:53'),(130,'12345',1,1,1,'2023-08-15 16:51:53','2023-08-15 16:51:53'),(131,'12345',1,1,0,'2023-08-15 16:53:39','2023-08-15 16:53:39'),(132,'12345',0,1,1,'2023-08-15 16:54:39','2023-08-15 16:54:39'),(133,'12345',0,2,1,'2023-08-15 16:55:39','2023-08-15 16:55:39'),(134,'12345',0,2,1,'2023-08-15 16:56:39','2023-08-15 16:56:39'),(135,'12345',0,2,1,'2023-08-15 16:57:39','2023-08-15 16:57:39'),(136,'12345',0,2,1,'2023-08-15 16:58:39','2023-08-15 16:58:39'),(137,'12345',0,2,1,'2023-08-15 16:59:39','2023-08-15 16:59:39'),(138,'12345',0,2,1,'2023-08-15 17:00:39','2023-08-15 17:00:39'),(139,'12345',0,2,1,'2023-08-15 17:01:39','2023-08-15 17:01:39'),(140,'12345',0,2,1,'2023-08-15 17:02:39','2023-08-15 17:02:39'),(141,'12345',0,2,1,'2023-08-15 17:03:40','2023-08-15 17:03:40'),(142,'12345',0,2,1,'2023-08-15 17:04:39','2023-08-15 17:04:39'),(143,'12345',0,2,1,'2023-08-15 17:05:40','2023-08-15 17:05:40'),(144,'12345',0,2,1,'2023-08-15 17:06:39','2023-08-15 17:06:39'),(145,'12345',0,2,1,'2023-08-15 17:07:39','2023-08-15 17:07:39'),(146,'12345',1,0,0,'2023-08-15 17:09:56','2023-08-15 17:09:56'),(147,'12345',0,2,1,'2023-08-15 17:10:56','2023-08-15 17:10:56'),(148,'12345',0,2,1,'2023-08-15 17:11:56','2023-08-15 17:11:56'),(149,'12345',0,2,1,'2023-08-15 17:12:56','2023-08-15 17:12:56'),(150,'12345',1,9,0,'2023-08-15 17:16:44','2023-08-15 17:16:44'),(151,'12345',1,1,1,'2023-08-15 17:17:43','2023-08-15 17:17:43'),(152,'12345',1,1,1,'2023-08-15 17:18:43','2023-08-15 17:18:43'),(153,'12345',1,1,1,'2023-08-15 17:19:43','2023-08-15 17:19:43'),(154,'12345',1,1,1,'2023-08-15 17:20:43','2023-08-15 17:20:43'),(155,'12345',1,1,1,'2023-08-15 17:21:43','2023-08-15 17:21:43'),(156,'12345',1,1,1,'2023-08-15 17:22:43','2023-08-15 17:22:43'),(157,'12345',1,1,1,'2023-08-15 17:23:43','2023-08-15 17:23:43'),(158,'12345',1,1,1,'2023-08-15 17:24:43','2023-08-15 17:24:43'),(159,'12345',1,1,1,'2023-08-15 17:25:43','2023-08-15 17:25:43'),(160,'12345',1,1,1,'2023-08-15 17:26:43','2023-08-15 17:26:43'),(161,'12345',1,1,1,'2023-08-15 17:27:43','2023-08-15 17:27:43'),(162,'12345',1,1,1,'2023-08-15 17:28:43','2023-08-15 17:28:43'),(163,'12345',1,0,1,'2023-08-15 17:29:44','2023-08-15 17:29:44'),(164,'12345',1,2,1,'2023-08-15 17:30:45','2023-08-15 17:30:45'),(165,'12345',1,1,1,'2023-08-15 17:31:43','2023-08-15 17:31:43'),(166,'12345',1,1,1,'2023-08-15 17:32:44','2023-08-15 17:32:44'),(167,'12345',1,1,1,'2023-08-15 17:33:58','2023-08-15 17:33:58'),(168,'12345',1,1,1,'2023-08-15 17:34:55','2023-08-15 17:34:55'),(169,'12345',1,1,1,'2023-08-15 17:35:55','2023-08-15 17:35:55'),(170,'12345',1,1,1,'2023-08-15 17:36:55','2023-08-15 17:36:55'),(171,'12345',1,0,1,'2023-08-15 17:37:55','2023-08-15 17:37:55'),(172,'12345',1,0,1,'2023-08-15 17:40:30','2023-08-15 17:40:30');
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 19:09:31
