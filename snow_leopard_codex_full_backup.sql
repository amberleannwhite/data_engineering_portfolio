-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: snow_leopard_codex
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `abilities`
--

DROP TABLE IF EXISTS `abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abilities` (
  `ability_id` int NOT NULL AUTO_INCREMENT,
  `ability_name` varchar(60) NOT NULL,
  `element` enum('Ice','Fire','Nature','Storm','Shadow','Light') NOT NULL,
  PRIMARY KEY (`ability_id`),
  UNIQUE KEY `ability_name` (`ability_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abilities`
--

LOCK TABLES `abilities` WRITE;
/*!40000 ALTER TABLE `abilities` DISABLE KEYS */;
INSERT INTO `abilities` VALUES (1,'Frost Aura','Ice'),(2,'Molten Breath','Fire'),(3,'Moonlight Heal','Nature'),(4,'Veilwalk','Shadow'),(5,'Starstep Dash','Storm');
/*!40000 ALTER TABLE `abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creature_abilities`
--

DROP TABLE IF EXISTS `creature_abilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creature_abilities` (
  `creature_id` int NOT NULL,
  `ability_id` int NOT NULL,
  `acquired_level` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`creature_id`,`ability_id`),
  KEY `fk_ca_ability` (`ability_id`),
  CONSTRAINT `fk_ca_ability` FOREIGN KEY (`ability_id`) REFERENCES `abilities` (`ability_id`) ON DELETE RESTRICT,
  CONSTRAINT `fk_ca_creature` FOREIGN KEY (`creature_id`) REFERENCES `creatures` (`creature_id`) ON DELETE CASCADE,
  CONSTRAINT `creature_abilities_chk_1` CHECK ((`acquired_level` between 1 and 10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creature_abilities`
--

LOCK TABLES `creature_abilities` WRITE;
/*!40000 ALTER TABLE `creature_abilities` DISABLE KEYS */;
INSERT INTO `creature_abilities` VALUES (1,1,6),(1,4,3),(2,2,8),(3,3,5),(4,5,7);
/*!40000 ALTER TABLE `creature_abilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creatures`
--

DROP TABLE IF EXISTS `creatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creatures` (
  `creature_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL,
  `temperament` enum('Calm','Fiery','Gentle','Wild','Stoic') DEFAULT 'Stoic',
  `realm_id` int DEFAULT NULL,
  PRIMARY KEY (`creature_id`),
  KEY `fk_creatures_realm` (`realm_id`),
  CONSTRAINT `fk_creatures_realm` FOREIGN KEY (`realm_id`) REFERENCES `realms` (`realm_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creatures`
--

LOCK TABLES `creatures` WRITE;
/*!40000 ALTER TABLE `creatures` DISABLE KEYS */;
INSERT INTO `creatures` VALUES (1,'Aurora','Snow Leopard','Calm',1),(2,'Cinderwing','Dragon','Fiery',2),(3,'Sylphria','Forest Sprite','Gentle',3),(4,'Nyx','Shadow Lynx','Wild',1);
/*!40000 ALTER TABLE `creatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realms`
--

DROP TABLE IF EXISTS `realms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realms` (
  `realm_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `climate` varchar(30) NOT NULL,
  `magic_density` tinyint NOT NULL,
  PRIMARY KEY (`realm_id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `realms_chk_1` CHECK ((`magic_density` between 1 and 100))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realms`
--

LOCK TABLES `realms` WRITE;
/*!40000 ALTER TABLE `realms` DISABLE KEYS */;
INSERT INTO `realms` VALUES (1,'Frostpeak Mountains','Frozen',87),(2,'Emberglow Caverns','Molten',92),(3,'Moonpetal Forest','Temperate',75);
/*!40000 ALTER TABLE `realms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-12 15:03:11
