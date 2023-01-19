
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
DROP TABLE IF EXISTS `columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `columns` WRITE;
/*!40000 ALTER TABLE `columns` DISABLE KEYS */;
INSERT INTO `columns` VALUES (63,'Molestias autem moll','2023-01-15 07:15:16','2023-01-15 07:15:16'),(71,'Ad laboris aliquip r','2023-01-15 17:45:42','2023-01-15 17:45:42');
/*!40000 ALTER TABLE `columns` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `column_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_column_id_foreign` (`column_id`),
  CONSTRAINT `cards_column_id_foreign` FOREIGN KEY (`column_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (147,63,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:46:14','2023-01-15 13:48:19','2023-01-15 17:46:14'),(150,63,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:46:14','2023-01-15 13:52:50','2023-01-15 17:46:14'),(171,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:46:14','2023-01-15 17:46:06','2023-01-15 17:46:14'),(172,63,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:46:14','2023-01-15 17:46:14','2023-01-15 17:46:14'),(173,63,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:46:14','2023-01-15 17:46:14','2023-01-15 17:46:14'),(174,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:47:41','2023-01-15 17:46:15','2023-01-15 17:47:41'),(181,71,'Quidem totam beatae','Consequatur sit con','2023-01-15 17:46:28','2023-01-15 17:46:22','2023-01-15 17:46:28'),(189,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:46:54','2023-01-15 17:46:49','2023-01-15 17:46:54'),(192,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:48:21','2023-01-15 17:46:54','2023-01-15 17:48:21'),(198,63,'Quidem totam beatae','Consequatur sit con','2023-01-15 17:47:41','2023-01-15 17:47:25','2023-01-15 17:47:41'),(200,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:47:41','2023-01-15 17:47:41','2023-01-15 17:47:41'),(201,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:47:53','2023-01-15 17:47:41','2023-01-15 17:47:53'),(206,63,'Quidem totam beatae','Consequatur sit con','2023-01-15 17:47:53','2023-01-15 17:47:46','2023-01-15 17:47:53'),(210,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:47:53','2023-01-15 17:47:53','2023-01-15 17:47:53'),(212,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:48:16','2023-01-15 17:47:53','2023-01-15 17:48:16'),(220,63,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:16','2023-01-15 17:48:08','2023-01-15 17:48:16'),(222,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:48:30','2023-01-15 17:48:08','2023-01-15 17:48:30'),(223,63,'Error saepe nihil no','Culpa dolores sint','2023-01-15 17:48:16','2023-01-15 17:48:16','2023-01-15 17:48:16'),(224,63,'Error saepe nihil no','Culpa dolores sint',NULL,'2023-01-15 17:48:16','2023-01-16 00:54:15'),(225,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:21','2023-01-15 17:48:16','2023-01-15 17:48:21'),(226,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:48:21','2023-01-15 17:48:21','2023-01-15 17:48:21'),(227,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:29','2023-01-15 17:48:21','2023-01-15 17:48:29'),(228,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:48:30','2023-01-15 17:48:21','2023-01-15 17:48:30'),(229,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:48:30','2023-01-15 17:48:30','2023-01-15 17:48:30'),(230,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:30','2023-01-15 17:48:30','2023-01-15 17:48:30'),(232,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:51','2023-01-15 17:48:30','2023-01-15 17:48:51'),(233,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:48:51','2023-01-15 17:48:30','2023-01-15 17:48:51'),(236,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:48:51','2023-01-15 17:48:42','2023-01-15 17:48:51'),(239,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:51','2023-01-15 17:48:51','2023-01-15 17:48:51'),(240,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:48:51','2023-01-15 17:48:51','2023-01-15 17:48:51'),(242,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:58','2023-01-15 17:48:51','2023-01-15 17:48:58'),(243,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:48:58','2023-01-15 17:48:51','2023-01-15 17:48:58'),(247,71,'Quidem totam beatae','Consequatur sit con','2023-01-15 17:49:14','2023-01-15 17:48:56','2023-01-15 17:49:14'),(249,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:48:58','2023-01-15 17:48:58','2023-01-15 17:48:58'),(250,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:48:58','2023-01-15 17:48:58','2023-01-15 17:48:58'),(251,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:14','2023-01-15 17:48:58','2023-01-15 17:49:14'),(252,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:14','2023-01-15 17:48:58','2023-01-15 17:49:14'),(253,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:14','2023-01-15 17:49:14','2023-01-15 17:49:14'),(254,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:14','2023-01-15 17:49:14','2023-01-15 17:49:14'),(257,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:36','2023-01-15 17:49:14','2023-01-15 17:49:36'),(266,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:40','2023-01-15 17:49:29','2023-01-15 17:49:40'),(267,71,'Quidem totam beatae','Consequatur sit con','2023-01-15 17:49:42','2023-01-15 17:49:29','2023-01-15 17:49:42'),(268,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:36','2023-01-15 17:49:29','2023-01-15 17:49:36'),(269,71,'Est sunt ea ut acc','Nemo fuga Nihil tem','2023-01-15 17:49:41','2023-01-15 17:49:29','2023-01-15 17:49:41'),(270,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:36','2023-01-15 17:49:36','2023-01-15 17:49:36'),(271,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:40','2023-01-15 17:49:36','2023-01-15 17:49:40'),(272,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:40','2023-01-15 17:49:36','2023-01-15 17:49:40'),(273,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:40','2023-01-15 17:49:40','2023-01-15 17:49:40'),(274,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:40','2023-01-15 17:49:40','2023-01-15 17:49:40'),(275,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:41','2023-01-15 17:49:40','2023-01-15 17:49:41'),(276,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:41','2023-01-15 17:49:40','2023-01-15 17:49:41'),(277,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:41','2023-01-15 17:49:40','2023-01-15 17:49:41'),(278,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:41','2023-01-15 17:49:41','2023-01-15 17:49:41'),(279,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:41','2023-01-15 17:49:41','2023-01-15 17:49:41'),(280,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:41','2023-01-15 17:49:41','2023-01-15 17:49:41'),(281,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:42','2023-01-15 17:49:41','2023-01-15 17:49:42'),(282,71,'Est sunt ea ut acc','Nemo fuga Nihil tem','2023-01-15 17:49:42','2023-01-15 17:49:41','2023-01-15 17:49:42'),(283,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:42','2023-01-15 17:49:41','2023-01-15 17:49:42'),(284,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:42','2023-01-15 17:49:41','2023-01-15 17:49:42'),(285,71,'Rerum magni ad volup','Commodo asperiores t','2023-01-15 17:49:42','2023-01-15 17:49:42','2023-01-15 17:49:42'),(286,71,'Est sunt ea ut acc','Nemo fuga Nihil tem','2023-01-15 17:49:42','2023-01-15 17:49:42','2023-01-15 17:49:42'),(287,71,'Sed reiciendis earum','Nostrud possimus ex','2023-01-15 17:49:42','2023-01-15 17:49:42','2023-01-15 17:49:42'),(288,71,'Vero itaque in rerum','Adipisicing in offic','2023-01-15 17:49:42','2023-01-15 17:49:42','2023-01-15 17:49:42'),(289,71,'Sed reiciendis earum','Nostrud possimus ex',NULL,'2023-01-15 17:49:42','2023-01-16 01:07:41'),(292,63,'Est sunt ea ut acc','Nemo fuga Nihil tem',NULL,'2023-01-15 17:49:42','2023-01-16 00:54:15'),(293,71,'Rerum magni ad volup','Commodo asperiores t',NULL,'2023-01-15 17:49:42','2023-01-16 01:07:41');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

