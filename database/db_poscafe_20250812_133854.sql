-- MariaDB dump 10.17  Distrib 10.5.6-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: db_poscafe
-- ------------------------------------------------------
-- Server version	10.5.6-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Minuman','2025-03-20 15:42:31','2025-03-20 15:42:31'),(2,'Makanan','2025-03-25 21:21:29','2025-03-28 15:23:18'),(3,'Coffe','2025-03-25 21:21:37','2025-03-25 21:21:37'),(4,'Juss','2025-03-25 21:21:50','2025-03-25 21:21:50'),(5,'Steak','2025-03-25 21:25:46','2025-03-25 21:25:46'),(6,'Cemilan','2025-03-25 21:34:48','2025-03-28 15:25:09');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1),(6,'2023_12_13_144216_create_products_table',1),(7,'2023_12_14_134344_add_roles_phone_at_users',1),(8,'2023_12_27_135124_add_favorite_at_products',1),(9,'2024_01_03_145442_create_orders_table',1),(10,'2024_01_03_145447_create_order_items_table',1),(11,'2024_09_08_025520_create_categories_table',1),(12,'2024_09_08_030550_alter_category_products',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,11,1,8000,'2025-04-03 08:41:09','2025-04-03 08:41:09'),(2,1,9,1,10000,'2025-04-03 08:41:09','2025-04-03 08:41:09'),(3,1,8,1,35000,'2025-04-03 08:41:09','2025-04-03 08:41:09'),(4,2,6,1,5000,'2025-04-03 08:41:10','2025-04-03 08:41:10'),(5,2,5,1,8000,'2025-04-03 08:41:10','2025-04-03 08:41:10'),(6,2,4,1,20000,'2025-04-03 08:41:10','2025-04-03 08:41:10'),(7,3,8,1,35000,'2025-04-03 08:56:19','2025-04-03 08:56:19'),(8,3,10,1,5000,'2025-04-03 08:56:19','2025-04-03 08:56:19'),(9,3,7,1,3000,'2025-04-03 08:56:19','2025-04-03 08:56:19'),(10,3,1,1,3000,'2025-04-03 08:56:19','2025-04-03 08:56:19'),(11,4,6,1,5000,'2025-04-04 01:36:40','2025-04-04 01:36:40'),(12,4,4,1,20000,'2025-04-04 01:36:40','2025-04-04 01:36:40'),(13,4,2,1,13000,'2025-04-04 01:36:40','2025-04-04 01:36:40'),(14,5,12,1,10000,'2025-04-04 01:39:09','2025-04-04 01:39:09'),(15,5,7,1,3000,'2025-04-04 01:39:09','2025-04-04 01:39:09'),(16,5,1,1,3000,'2025-04-04 01:39:09','2025-04-04 01:39:09');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total_price` int(11) NOT NULL,
  `total_item` int(11) NOT NULL,
  `kasir_id` bigint(20) unsigned NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_kasir_id_foreign` (`kasir_id`),
  CONSTRAINT `orders_kasir_id_foreign` FOREIGN KEY (`kasir_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2025-04-03 15:39:45',53000,3,2,'Tunai','2025-04-03 08:41:09','2025-04-03 08:41:09'),(2,'2025-04-03 15:40:27',33000,3,2,'Tunai','2025-04-03 08:41:10','2025-04-03 08:41:10'),(3,'2025-04-03 15:55:43',46000,4,3,'Tunai','2025-04-03 08:56:19','2025-04-03 08:56:19'),(4,'2025-04-04 08:32:56',38000,3,2,'Tunai','2025-04-04 01:36:40','2025-04-04 01:36:40'),(5,'2025-04-04 08:38:41',16000,3,2,'Tunai','2025-04-04 01:39:09','2025-04-04 01:39:09');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',2,'auth_token','f2d8a0768be360c15c5f3cc4da543bcc3cc328bd6ae75623a8ebb0880a44bf76','[\"*\"]',NULL,NULL,'2025-03-27 17:13:49','2025-03-27 17:13:49'),(2,'App\\Models\\User',2,'auth_token','fd25f108227346337a3e0399301cb38d9fd53889bfbe60a51735bc372fca300a','[\"*\"]','2025-03-27 17:31:15',NULL,'2025-03-27 17:17:21','2025-03-27 17:31:15'),(3,'App\\Models\\User',2,'auth_token','46c39d8d41740bca725c80b542239c2a59ba70049c730a6eefd2b0c1d287a6ff','[\"*\"]','2025-03-28 15:40:07',NULL,'2025-03-27 17:45:31','2025-03-28 15:40:07'),(4,'App\\Models\\User',2,'auth_token','d42229d8c459d0bba273b3c555c2e672526a1254b768a89823941e87098e1b61','[\"*\"]','2025-04-10 22:28:33',NULL,'2025-03-28 15:42:43','2025-04-10 22:28:33'),(6,'App\\Models\\User',3,'auth_token','905bfddae4b5d70ed15d6e7c1605aab543a63d92f6d9a44b1c0dc132defedd98','[\"*\"]','2025-04-03 08:58:57',NULL,'2025-04-03 08:55:17','2025-04-03 08:58:57'),(7,'App\\Models\\User',2,'auth_token','fd4e48b61f3e22095a3995583803bce672b8bb04cc1cf8483b7cc7167de98870','[\"*\"]','2025-04-04 01:39:09',NULL,'2025-04-04 01:22:03','2025-04-04 01:39:09'),(8,'App\\Models\\User',2,'auth_token','bc06358848247e47d3f342768c746144ee83a1323465f3bc4e5f00eff6a98778','[\"*\"]',NULL,NULL,'2025-04-07 20:07:20','2025-04-07 20:07:20');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_best_seller` tinyint(1) NOT NULL DEFAULT 0,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Air Mineral',NULL,3000,5,'Minuman','1742510595.png','2025-03-20 15:43:16','2025-03-25 21:22:52',0,1),(2,'Coffe Latte',NULL,13000,5,'Coffe','1742963009.jpg','2025-03-25 21:23:30','2025-03-25 21:23:30',0,3),(3,'Coffe Capuchino',NULL,13000,5,'Coffe','1742963046.jpg','2025-03-25 21:24:06','2025-03-25 21:24:06',0,3),(4,'Ayam Bakar',NULL,20000,5,'Makanan','1742963182.jpg','2025-03-25 21:26:22','2025-03-28 15:26:02',0,2),(5,'Juss Apukat',NULL,8000,5,'Juss','1742963382.jpg','2025-03-25 21:29:42','2025-03-25 21:29:42',0,4),(6,'Juss Jambubiji',NULL,5000,5,'Juss','1742963424.jpg','2025-03-25 21:30:24','2025-03-25 21:30:24',0,4),(7,'Es Teh Manis',NULL,3000,5,'Minuman','1742963462.jpg','2025-03-25 21:31:02','2025-03-25 21:31:02',0,1),(8,'Steak Daging',NULL,35000,5,'Steak','1742963583.jpg','2025-03-25 21:33:03','2025-03-25 21:33:03',0,5),(9,'Kentang Goreng',NULL,10000,5,'Cemilan','1742963725.jpg','2025-03-25 21:35:25','2025-03-28 15:25:47',0,6),(10,'Tempe Mendoan',NULL,5000,15,'Cemilan','1742964108.jpg','2025-03-25 21:41:48','2025-03-28 15:25:35',0,6),(11,'Juss Sirsat',NULL,8000,5,'Juss','1743557054.jpg','2025-04-01 18:24:14','2025-04-01 18:24:14',0,4),(12,'Steak Ayam',NULL,10000,5,'Steak','1743755693.jpg','2025-04-04 01:34:54','2025-04-04 01:34:54',0,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` enum('admin','staff','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Sabiqul Ulum','sabiqul@fic11.com',NULL,'admin','2025-03-20 15:22:12','$2y$12$rMJcj9KzIOcR4pwhe9k8TuQQz68K9Jkl2HqhDUmP/qUQbDE5KI7im',NULL,NULL,NULL,'n5SSJISooAmjz1rwSfB97mUiUNgRDX2OpvHtCKnaegvClfeDhyp9pOl4jREm','2025-03-20 15:22:12','2025-03-20 15:22:12'),(3,'Code with Bahri','bahri@fic11.com',NULL,'staff','2025-03-20 15:40:19','$2y$12$rMJcj9KzIOcR4pwhe9k8TuQQz68K9Jkl2HqhDUmP/qUQbDE5KI7im',NULL,NULL,NULL,'EGB5C8cGQj','2025-03-20 15:40:19','2025-03-20 15:40:19'),(25,'Dr. Lawrence Parisian','thiel.johnathan@example.org',NULL,'user','2025-03-20 15:40:19','$2y$12$UaBghAMGIunyDDRIzPbXqeKMeCNUk28J9WkkLleXEBHJZHxPOgDvq',NULL,NULL,NULL,'xKOrSEz24t','2025-03-20 15:40:19','2025-03-20 15:40:19'),(27,'Dasia Torp','zackary64@example.org',NULL,'user','2025-03-20 15:40:19','$2y$12$UaBghAMGIunyDDRIzPbXqeKMeCNUk28J9WkkLleXEBHJZHxPOgDvq',NULL,NULL,NULL,'DdyTgLyu49','2025-03-20 15:40:19','2025-03-20 15:40:19'),(28,'Dr. Anderson Lubowitz','paul61@example.com',NULL,'user','2025-03-20 15:40:19','$2y$12$UaBghAMGIunyDDRIzPbXqeKMeCNUk28J9WkkLleXEBHJZHxPOgDvq',NULL,NULL,NULL,'0enrfQAD43','2025-03-20 15:40:19','2025-03-20 15:40:19');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_poscafe'
--

--
-- Dumping routines for database 'db_poscafe'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-12 13:38:54
