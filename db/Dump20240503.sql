CREATE DATABASE  IF NOT EXISTS `nemhr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nemhr`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: nemhr
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'nemhr@gmail.com','nemhr@2024','Super Admin ','NEMHR');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointmentID` int NOT NULL AUTO_INCREMENT,
  `hospitalID` int DEFAULT NULL,
  `doctorID` int NOT NULL,
  `patientID` int NOT NULL,
  `slotID` int NOT NULL,
  PRIMARY KEY (`appointmentID`),
  KEY `doctorID` (`doctorID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,7,1,25),(2,1,7,1,0),(3,1,7,1,49),(4,1,7,1,1),(12,1,7,1,262);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `cityID` int NOT NULL AUTO_INCREMENT,
  `stateID` int NOT NULL,
  `city` varchar(255) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `description` text,
  PRIMARY KEY (`cityID`),
  KEY `stateID` (`stateID`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`stateID`) REFERENCES `state` (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,1,'Lucknow','226001','Capital city of Uttar Pradesh'),(2,1,'Kanpur','208001','Industrial city in Uttar Pradesh'),(3,1,'Varanasi','221001','Historical and spiritual city in Uttar Pradesh'),(4,1,'Agra','282001','Home to the Taj Mahal and other Mughal monuments'),(5,1,'Prayagraj','211001','Famous for the Kumbh Mela and Sangam'),(6,1,'Ghaziabad','201001','Part of the National Capital Region (NCR)'),(7,1,'Meerut','250001','Historical city known for its sports goods industry'),(8,2,'Mumbai','400001','Description of Mumbai city'),(9,3,'Jaipur','302001','Jaipur is the capital city of Rajasthan and known for its historical monuments and vibrant culture.'),(10,3,'Jodhpur','342001','Jodhpur is a major city in Rajasthan, famous for its Mehrangarh Fort and vibrant bazaars.'),(11,3,'Udaipur','313001','Udaipur is known as the \"City of Lakes\" and is famous for its lakes, palaces, and rich history.'),(12,3,'Ajmer','305001','Ajmer is a city known for the Ajmer Sharif Dargah and its historical significance.'),(13,3,'Bikaner','334001','Bikaner is famous for its forts, palaces, and sweets like bhujia and rasgulla.'),(14,4,'Thiruvananthapuram','695001','Description of Thiruvananthapuram'),(15,4,'Kochi','682001','Description of Kochi'),(16,4,'Kozhikode','673001','Description of Kozhikode'),(17,4,'Thrissur','680001','Description of Thrissur'),(18,4,'Kollam','691001','Description of Kollam');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactform`
--

DROP TABLE IF EXISTS `contactform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactform` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `submission_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactform`
--

LOCK TABLES `contactform` WRITE;
/*!40000 ALTER TABLE `contactform` DISABLE KEYS */;
INSERT INTO `contactform` VALUES (1,'NEMHR','nemhr@gmail.com','Testing message from the frontend','2024-04-02 19:18:57'),(2,'Anurag','anurag@gmail.com','Hello nemhr ','2024-04-02 19:21:34');
/*!40000 ALTER TABLE `contactform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `countryID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `continent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'India','New Delhi','Asia','India is a country in South Asia known for its rich cultural heritage, diverse landscapes, and historical landmarks.'),(2,'Bangladesh','Dhaka','Asia','Bangladesh is a country in South Asia known for its lush greenery, river deltas, and vibrant culture.'),(3,'Sri Lanka','Colombo','Asia','Sri Lanka, formerly known as Ceylon, is an island country in South Asia renowned for its beaches, ancient ruins, and tea plantations.'),(4,'Nepal','Kathmandu','Asia','Nepal is a landlocked country in South Asia known for its majestic Himalayan mountains, rich cultural heritage, and trekking trails.'),(5,'Bhutan','Thimphu','Asia','Bhutan is a small landlocked country in South Asia known for its stunning mountain scenery, unique culture, and commitment to Gross National Happiness (GNH).');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `departmentID` int NOT NULL AUTO_INCREMENT,
  `hospitalID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `HOD` varchar(255) DEFAULT NULL,
  `facilities` text,
  `description` text,
  PRIMARY KEY (`departmentID`),
  KEY `hospitalID` (`hospitalID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (2,1,'Physician Department','Dr. John Doe','Emergency Care, Outpatient Services, Inpatient Care','The Physician Department provides comprehensive medical care for patients with various health concerns.'),(3,1,'Surgery Department','Dr. Jane Smith','Operating Theaters, Recovery Rooms, Surgical Wards','The Surgery Department specializes in surgical procedures, ranging from minor surgeries to complex operations.'),(4,1,'Pediatrics Department','Dr. Michael Johnson','Pediatric Wards, Neonatal Intensive Care Unit (NICU)','The Pediatrics Department offers medical care for infants, children, and adolescents, focusing on their unique healthcare needs.'),(5,16,'ortho','kh','','');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description` (
  `descriptionID` int NOT NULL AUTO_INCREMENT,
  `doctorID` int NOT NULL,
  `patientID` int NOT NULL,
  `appointmentID` int NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`descriptionID`),
  KEY `doctorID` (`doctorID`),
  KEY `patientID` (`patientID`),
  KEY `appointmentID` (`appointmentID`),
  CONSTRAINT `description_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`),
  CONSTRAINT `description_ibfk_2` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`),
  CONSTRAINT `description_ibfk_3` FOREIGN KEY (`appointmentID`) REFERENCES `appointments` (`appointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (1,7,1,4,'Description Testing ','2024-04-11 07:17:00');
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doctorID` int NOT NULL AUTO_INCREMENT,
  `hospitalID` int NOT NULL,
  `departmentID` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `DOB` date NOT NULL,
  `specialization` varchar(255) NOT NULL,
  `experience` int NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` text,
  `status` enum('active','inactive') DEFAULT NULL,
  PRIMARY KEY (`doctorID`),
  KEY `hospitalID` (`hospitalID`),
  KEY `departmentID` (`departmentID`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`),
  CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (7,1,2,'Anurag','Luk12345','Male','2002-02-02','Physician',3,'5345475675','nemhr@gmail.com','nemhr@2024','Lucknow near city house, ','This is testing doctor ','active'),(8,1,2,'Sumit','Luck1234','Male','2002-05-06','Physician',3,'7352954855','sumit@gmail.com','sumit123','Phagwara, Punjab 144411','This is testing doctor','active'),(9,16,5,'hb','kf','Male','2024-04-19','nh',1,'1234567891','gyvhy@g.g','gcg','f','hgvhg','active'),(10,1,3,'Abhishek','Lpu4343','Male','2018-02-08','Ortho',1,'1234567890','abhishek@gmail.com','abhi1234','Ansari Nagar, New Delhi','Testing Doctor add','inactive'),(11,1,4,'Ramesh Prasad','Luck122445','Male','1995-02-09','MBBS',4,'1234567890','ramesh@gmail.com','ramesh123','6th floor, Mainpura, Patna - 800013','Testing Add doctor','active');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_slots`
--

DROP TABLE IF EXISTS `doctor_slots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_slots` (
  `slotID` int NOT NULL AUTO_INCREMENT,
  `doctorID` int NOT NULL,
  `slotDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  PRIMARY KEY (`slotID`),
  KEY `doctorID` (`doctorID`),
  CONSTRAINT `doctor_slots_ibfk_1` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`doctorID`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_slots`
--

LOCK TABLES `doctor_slots` WRITE;
/*!40000 ALTER TABLE `doctor_slots` DISABLE KEYS */;
INSERT INTO `doctor_slots` VALUES (1,7,'2024-04-11','10:30:00','10:45:00'),(2,7,'2024-04-11','10:45:00','11:00:00'),(3,7,'2024-04-11','11:00:00','11:15:00'),(4,7,'2024-04-11','11:15:00','11:30:00'),(5,8,'2024-04-12','16:30:00','16:45:00'),(6,8,'2024-04-12','16:45:00','17:00:00'),(7,7,'2024-04-17','10:30:00','10:45:00'),(8,7,'2024-04-17','10:45:00','11:00:00'),(9,7,'2024-04-17','11:00:00','11:15:00'),(10,7,'2024-04-17','11:15:00','11:30:00'),(11,7,'2024-04-18','10:28:00','10:43:00'),(19,7,'2024-04-21','12:00:00','12:15:00'),(20,7,'2024-04-21','12:15:00','12:30:00'),(21,7,'2024-04-21','12:30:00','12:45:00'),(22,7,'2024-04-21','12:45:00','13:00:00'),(23,7,'2024-04-21','13:00:00','13:15:00'),(24,7,'2024-04-21','13:15:00','13:30:00'),(25,7,'2024-04-21','13:30:00','13:45:00'),(26,7,'2024-04-21','13:45:00','14:00:00'),(27,7,'2024-04-21','14:00:00','14:15:00'),(28,7,'2024-04-21','14:15:00','14:30:00'),(29,7,'2024-04-21','14:30:00','14:45:00'),(30,7,'2024-04-21','14:45:00','15:00:00'),(31,7,'2024-04-21','15:00:00','15:15:00'),(32,7,'2024-04-21','15:15:00','15:30:00'),(33,7,'2024-04-21','15:30:00','15:45:00'),(34,7,'2024-04-21','15:45:00','16:00:00'),(35,7,'2024-04-21','16:00:00','16:15:00'),(36,7,'2024-04-21','16:15:00','16:30:00'),(39,7,'2024-04-22','12:00:00','12:15:00'),(40,7,'2024-04-22','12:15:00','12:30:00'),(41,7,'2024-04-22','12:30:00','12:45:00'),(42,7,'2024-04-22','12:45:00','13:00:00'),(43,7,'2024-04-22','13:00:00','13:15:00'),(44,7,'2024-04-22','13:15:00','13:30:00'),(45,7,'2024-04-22','13:30:00','13:45:00'),(46,7,'2024-04-22','13:45:00','14:00:00'),(47,7,'2024-04-22','14:00:00','14:15:00'),(48,7,'2024-04-22','14:15:00','14:30:00'),(49,7,'2024-04-22','14:30:00','14:45:00'),(50,7,'2024-04-22','14:45:00','15:00:00'),(51,7,'2024-04-22','15:00:00','15:15:00'),(52,7,'2024-04-22','15:15:00','15:30:00'),(53,7,'2024-04-22','15:30:00','15:45:00'),(54,7,'2024-04-22','15:45:00','16:00:00'),(55,7,'2024-04-22','16:00:00','16:15:00'),(56,7,'2024-04-22','16:15:00','16:30:00'),(57,7,'2024-04-23','11:30:00','11:45:00'),(58,7,'2024-04-23','11:45:00','12:00:00'),(59,7,'2024-04-23','12:00:00','12:15:00'),(60,7,'2024-04-23','12:15:00','12:30:00'),(61,7,'2024-04-23','12:30:00','12:45:00'),(62,7,'2024-04-23','12:45:00','13:00:00'),(63,7,'2024-04-23','13:00:00','13:15:00'),(64,7,'2024-04-23','13:15:00','13:30:00'),(65,7,'2024-04-23','13:30:00','13:45:00'),(66,7,'2024-04-23','13:45:00','14:00:00'),(67,7,'2024-04-23','14:00:00','14:15:00'),(68,7,'2024-04-23','14:15:00','14:30:00'),(69,7,'2024-04-23','14:30:00','14:45:00'),(70,7,'2024-04-23','14:45:00','15:00:00'),(71,7,'2024-04-23','15:00:00','15:15:00'),(72,7,'2024-04-23','15:15:00','15:30:00'),(73,7,'2024-04-23','15:30:00','15:45:00'),(74,7,'2024-04-23','15:45:00','16:00:00'),(75,7,'2024-04-23','16:00:00','16:15:00'),(76,7,'2024-04-23','16:15:00','16:30:00'),(77,7,'2024-04-24','11:30:00','11:45:00'),(78,7,'2024-04-24','11:45:00','12:00:00'),(79,7,'2024-04-24','12:00:00','12:15:00'),(80,7,'2024-04-24','12:15:00','12:30:00'),(81,7,'2024-04-24','12:30:00','12:45:00'),(82,7,'2024-04-24','12:45:00','13:00:00'),(83,7,'2024-04-24','13:00:00','13:15:00'),(84,7,'2024-04-24','13:15:00','13:30:00'),(85,7,'2024-04-24','13:30:00','13:45:00'),(86,7,'2024-04-24','13:45:00','14:00:00'),(87,7,'2024-04-24','14:00:00','14:15:00'),(88,7,'2024-04-24','14:15:00','14:30:00'),(89,7,'2024-04-24','14:30:00','14:45:00'),(90,7,'2024-04-24','14:45:00','15:00:00'),(91,7,'2024-04-24','15:00:00','15:15:00'),(92,7,'2024-04-24','15:15:00','15:30:00'),(93,7,'2024-04-24','15:30:00','15:45:00'),(94,7,'2024-04-24','15:45:00','16:00:00'),(95,7,'2024-04-24','16:00:00','16:15:00'),(96,7,'2024-04-24','16:15:00','16:30:00'),(97,7,'2024-04-25','11:30:00','11:45:00'),(98,7,'2024-04-25','11:45:00','12:00:00'),(99,7,'2024-04-25','12:00:00','12:15:00'),(100,7,'2024-04-25','12:15:00','12:30:00'),(101,7,'2024-04-25','12:30:00','12:45:00'),(102,7,'2024-04-25','12:45:00','13:00:00'),(103,7,'2024-04-25','13:00:00','13:15:00'),(104,7,'2024-04-25','13:15:00','13:30:00'),(105,7,'2024-04-25','13:30:00','13:45:00'),(106,7,'2024-04-25','13:45:00','14:00:00'),(107,7,'2024-04-25','14:00:00','14:15:00'),(108,7,'2024-04-25','14:15:00','14:30:00'),(109,7,'2024-04-25','14:30:00','14:45:00'),(110,7,'2024-04-25','14:45:00','15:00:00'),(111,7,'2024-04-25','15:00:00','15:15:00'),(112,7,'2024-04-25','15:15:00','15:30:00'),(113,7,'2024-04-25','15:30:00','15:45:00'),(114,7,'2024-04-25','15:45:00','16:00:00'),(115,7,'2024-04-25','16:00:00','16:15:00'),(116,7,'2024-04-25','16:15:00','16:30:00'),(117,7,'2024-04-26','11:30:00','11:45:00'),(118,7,'2024-04-26','11:45:00','12:00:00'),(119,7,'2024-04-26','12:00:00','12:15:00'),(120,7,'2024-04-26','12:15:00','12:30:00'),(121,7,'2024-04-26','12:30:00','12:45:00'),(122,7,'2024-04-26','12:45:00','13:00:00'),(123,7,'2024-04-26','13:00:00','13:15:00'),(124,7,'2024-04-26','13:15:00','13:30:00'),(125,7,'2024-04-26','13:30:00','13:45:00'),(126,7,'2024-04-26','13:45:00','14:00:00'),(127,7,'2024-04-26','14:00:00','14:15:00'),(128,7,'2024-04-26','14:15:00','14:30:00'),(129,7,'2024-04-26','14:30:00','14:45:00'),(130,7,'2024-04-26','14:45:00','15:00:00'),(131,7,'2024-04-26','15:00:00','15:15:00'),(132,7,'2024-04-26','15:15:00','15:30:00'),(133,7,'2024-04-26','15:30:00','15:45:00'),(134,7,'2024-04-26','15:45:00','16:00:00'),(135,7,'2024-04-26','16:00:00','16:15:00'),(136,7,'2024-04-26','16:15:00','16:30:00'),(137,7,'2024-04-27','11:30:00','11:45:00'),(138,7,'2024-04-27','11:45:00','12:00:00'),(139,7,'2024-04-27','12:00:00','12:15:00'),(140,7,'2024-04-27','12:15:00','12:30:00'),(141,7,'2024-04-27','12:30:00','12:45:00'),(142,7,'2024-04-27','12:45:00','13:00:00'),(143,7,'2024-04-27','13:00:00','13:15:00'),(144,7,'2024-04-27','13:15:00','13:30:00'),(145,7,'2024-04-27','13:30:00','13:45:00'),(146,7,'2024-04-27','13:45:00','14:00:00'),(147,7,'2024-04-27','14:00:00','14:15:00'),(148,7,'2024-04-27','14:15:00','14:30:00'),(149,7,'2024-04-27','14:30:00','14:45:00'),(150,7,'2024-04-27','14:45:00','15:00:00'),(151,7,'2024-04-27','15:00:00','15:15:00'),(152,7,'2024-04-27','15:15:00','15:30:00'),(153,7,'2024-04-27','15:30:00','15:45:00'),(154,7,'2024-04-27','15:45:00','16:00:00'),(155,7,'2024-04-27','16:00:00','16:15:00'),(156,7,'2024-04-27','16:15:00','16:30:00'),(157,8,'1970-01-01','11:30:00','11:45:00'),(158,8,'1970-01-01','11:45:00','12:00:00'),(159,8,'1970-01-01','12:00:00','12:15:00'),(160,8,'1970-01-01','12:15:00','12:30:00'),(161,8,'1970-01-01','12:30:00','12:45:00'),(162,8,'1970-01-01','12:45:00','13:00:00'),(163,8,'1970-01-02','11:30:00','11:45:00'),(164,8,'1970-01-02','11:45:00','12:00:00'),(165,8,'1970-01-02','12:00:00','12:15:00'),(166,8,'1970-01-02','12:15:00','12:30:00'),(167,8,'1970-01-02','12:30:00','12:45:00'),(168,8,'1970-01-02','12:45:00','13:00:00'),(169,8,'1970-01-03','11:30:00','11:45:00'),(170,8,'1970-01-03','11:45:00','12:00:00'),(171,8,'1970-01-03','12:00:00','12:15:00'),(172,8,'1970-01-03','12:15:00','12:30:00'),(173,8,'1970-01-03','12:30:00','12:45:00'),(174,8,'1970-01-03','12:45:00','13:00:00'),(175,8,'1970-01-04','11:30:00','11:45:00'),(176,8,'1970-01-04','11:45:00','12:00:00'),(177,8,'1970-01-04','12:00:00','12:15:00'),(178,8,'1970-01-04','12:15:00','12:30:00'),(179,8,'1970-01-04','12:30:00','12:45:00'),(180,8,'1970-01-04','12:45:00','13:00:00'),(181,8,'1970-01-05','11:30:00','11:45:00'),(182,8,'1970-01-05','11:45:00','12:00:00'),(183,8,'1970-01-05','12:00:00','12:15:00'),(184,8,'1970-01-05','12:15:00','12:30:00'),(185,8,'1970-01-05','12:30:00','12:45:00'),(186,8,'1970-01-05','12:45:00','13:00:00'),(187,8,'1970-01-06','11:30:00','11:45:00'),(188,8,'1970-01-06','11:45:00','12:00:00'),(189,8,'1970-01-06','12:00:00','12:15:00'),(190,8,'1970-01-06','12:15:00','12:30:00'),(191,8,'1970-01-06','12:30:00','12:45:00'),(192,8,'1970-01-06','12:45:00','13:00:00'),(193,8,'1970-01-07','11:30:00','11:45:00'),(194,8,'1970-01-07','11:45:00','12:00:00'),(195,8,'1970-01-07','12:00:00','12:15:00'),(196,8,'1970-01-07','12:15:00','12:30:00'),(197,8,'1970-01-07','12:30:00','12:45:00'),(198,8,'1970-01-07','12:45:00','13:00:00'),(199,8,'1970-01-01','14:00:00','14:15:00'),(200,8,'1970-01-01','14:15:00','14:30:00'),(201,8,'1970-01-01','14:30:00','14:45:00'),(202,8,'1970-01-01','14:45:00','15:00:00'),(203,8,'1970-01-02','14:00:00','14:15:00'),(204,8,'1970-01-02','14:15:00','14:30:00'),(205,8,'1970-01-02','14:30:00','14:45:00'),(206,8,'1970-01-02','14:45:00','15:00:00'),(207,8,'1970-01-03','14:00:00','14:15:00'),(208,8,'1970-01-03','14:15:00','14:30:00'),(209,8,'1970-01-03','14:30:00','14:45:00'),(210,8,'1970-01-03','14:45:00','15:00:00'),(211,8,'1970-01-04','14:00:00','14:15:00'),(212,8,'1970-01-04','14:15:00','14:30:00'),(213,8,'1970-01-04','14:30:00','14:45:00'),(214,8,'1970-01-04','14:45:00','15:00:00'),(215,8,'1970-01-05','14:00:00','14:15:00'),(216,8,'1970-01-05','14:15:00','14:30:00'),(217,8,'1970-01-05','14:30:00','14:45:00'),(218,8,'1970-01-05','14:45:00','15:00:00'),(219,8,'1970-01-06','14:00:00','14:15:00'),(220,8,'1970-01-06','14:15:00','14:30:00'),(221,8,'1970-01-06','14:30:00','14:45:00'),(222,8,'1970-01-06','14:45:00','15:00:00'),(223,8,'1970-01-07','14:00:00','14:15:00'),(224,8,'1970-01-07','14:15:00','14:30:00'),(225,8,'1970-01-07','14:30:00','14:45:00'),(226,8,'1970-01-07','14:45:00','15:00:00'),(227,8,'2024-04-21','11:00:00','11:15:00'),(228,8,'2024-04-22','11:00:00','11:15:00'),(229,8,'2024-04-23','11:00:00','11:15:00'),(230,8,'2024-04-24','11:00:00','11:15:00'),(231,8,'2024-04-25','11:00:00','11:15:00'),(232,8,'2024-04-26','11:00:00','11:15:00'),(234,7,'2024-04-24','10:10:00','10:25:00'),(235,7,'2024-04-24','10:25:00','10:40:00'),(236,7,'2024-04-24','10:40:00','10:55:00'),(237,7,'2024-04-24','10:55:00','11:10:00'),(238,7,'2024-04-25','10:10:00','10:25:00'),(239,7,'2024-04-25','10:25:00','10:40:00'),(240,7,'2024-04-25','10:40:00','10:55:00'),(241,7,'2024-04-25','10:55:00','11:10:00'),(242,7,'2024-04-26','10:10:00','10:25:00'),(243,7,'2024-04-26','10:25:00','10:40:00'),(244,7,'2024-04-26','10:40:00','10:55:00'),(245,7,'2024-04-26','10:55:00','11:10:00'),(246,7,'2024-04-27','10:10:00','10:25:00'),(247,7,'2024-04-27','10:25:00','10:40:00'),(248,7,'2024-04-27','10:40:00','10:55:00'),(249,7,'2024-04-27','10:55:00','11:10:00'),(250,7,'2024-04-28','10:10:00','10:25:00'),(251,7,'2024-04-28','10:25:00','10:40:00'),(252,7,'2024-04-28','10:40:00','10:55:00'),(253,7,'2024-04-28','10:55:00','11:10:00'),(254,7,'2024-04-29','10:10:00','10:25:00'),(255,7,'2024-04-29','10:25:00','10:40:00'),(256,7,'2024-04-29','10:40:00','10:55:00'),(257,7,'2024-04-29','10:55:00','11:10:00'),(258,7,'2024-04-30','10:10:00','10:25:00'),(259,7,'2024-04-30','10:25:00','10:40:00'),(260,7,'2024-04-30','10:40:00','10:55:00'),(261,7,'2024-04-30','10:55:00','11:10:00'),(262,7,'2024-05-03','10:15:00','10:30:00'),(263,7,'2024-05-03','10:30:00','10:45:00'),(264,7,'2024-05-03','10:45:00','11:00:00'),(265,7,'2024-05-04','10:15:00','10:30:00'),(266,7,'2024-05-04','10:30:00','10:45:00'),(267,7,'2024-05-04','10:45:00','11:00:00'),(268,7,'2024-05-05','10:15:00','10:30:00'),(269,7,'2024-05-05','10:30:00','10:45:00'),(270,7,'2024-05-05','10:45:00','11:00:00'),(271,7,'2024-05-06','10:15:00','10:30:00'),(272,7,'2024-05-06','10:30:00','10:45:00'),(273,7,'2024-05-06','10:45:00','11:00:00'),(274,7,'2024-05-07','10:15:00','10:30:00'),(275,7,'2024-05-07','10:30:00','10:45:00'),(276,7,'2024-05-07','10:45:00','11:00:00'),(277,7,'2024-05-08','10:15:00','10:30:00'),(278,7,'2024-05-08','10:30:00','10:45:00'),(279,7,'2024-05-08','10:45:00','11:00:00'),(280,7,'2024-05-09','10:15:00','10:30:00'),(281,7,'2024-05-09','10:30:00','10:45:00'),(282,7,'2024-05-09','10:45:00','11:00:00');
/*!40000 ALTER TABLE `doctor_slots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hospitalID` int NOT NULL AUTO_INCREMENT,
  `cityID` int NOT NULL,
  `license` varchar(255) NOT NULL,
  `type` enum('private','public') DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `pincode` int NOT NULL,
  `description` text,
  `status` enum('active','inactive') DEFAULT NULL,
  PRIMARY KEY (`hospitalID`),
  KEY `cityID` (`cityID`),
  CONSTRAINT `hospital_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,1,'HOS12345','private','Lucknow Medical Center','123-456-7890','info@lucknowmedical.com','password123','www.lucknowmedical.com','123 Main Street lucknow',226001,'Lucknow Medical Center is a leading private hospital in the city providing high-quality healthcare services.','active'),(2,1,'HOS67890','public','Lucknow City Hospital','987-654-3210','info@lucknowcityhospital.com','hospital@123','www.lucknowcityhospital.com','456 Elm Street',226002,'Lucknow City Hospital is a government-funded hospital committed to serving the community.','active'),(3,1,'HOS54321','private','Sunshine Hospital','111-222-3333','contact@sunshinehospital.com','sun123','www.sunshinehospital.com','789 Oak Avenue',226003,'Sunshine Hospital offers a wide range of specialized medical services in Lucknow.','active'),(4,1,'HOS09876','public','Lucknow General Hospital','333-444-5555','info@lucknowgeneralhospital.com','general@123','www.lucknowgeneralhospital.com','321 Pine Street',226004,'Lucknow General Hospital provides affordable healthcare services to all sections of society.','active'),(5,1,'HOS13579','private','Royal Hospital','555-666-7777','info@royalhospital.com','royal@123',NULL,'987 Cedar Lane',226005,'Royal Hospital is known for its state-of-the-art facilities and personalized care in Lucknow.','active'),(6,2,'HOSP123456','private','Kanpur Hospital','123-456-7890','kanpurhospital@example.com','hospital_pass','www.kanpurhospital.com','123 Main Street',208001,'Kanpur Hospital is a leading healthcare facility providing comprehensive medical services.','active'),(7,2,'HOSP987654','public','City Care Hospital','987-654-3210','citycare@example.com','citycare_pass','www.citycarehospital.com','456 Park Avenue',208002,'City Care Hospital offers quality healthcare services to the community at affordable prices.','active'),(8,2,'HOSP246810','private','MediHealth Hospital','111-222-3333','medihealth@example.com','medihealth_pass',NULL,'789 Elm Street',208003,'MediHealth Hospital is committed to providing personalized care and advanced medical treatments.','active'),(9,2,'HOSP135790','public','Unity Hospital','555-666-7777','unityhospital@example.com','unity_pass','www.unityhospital.com','101 Oak Avenue',208004,'Unity Hospital strives to deliver compassionate healthcare services to all patients.','active'),(10,2,'HOSP112233','private','Advanced Care Hospital','999-888-7777','advancedcare@example.com','advancedcare_pass',NULL,'321 Maple Street',208005,'Advanced Care Hospital is equipped with state-of-the-art facilities to provide cutting-edge medical treatments.','active'),(11,3,'123456789','private','ABC Hospital','123-456-7890','abc@example.com','password123','www.abchospital.com','123 Main Street',221002,'ABC Hospital is a leading private healthcare provider in Varanasi.','active'),(12,3,'987654321','public','XYZ Medical Center','987-654-3210','xyz@example.com','securepwd456',NULL,'456 Oak Avenue',221003,'XYZ Medical Center offers comprehensive medical services to the community.','active'),(13,3,'555888999','private','Sunrise Hospital','111-222-3333','sunrise@example.com','sunrise@123','www.sunrisehospital.com','789 Elm Street',221004,'Sunrise Hospital specializes in advanced treatments and compassionate care.','active'),(14,3,'777333111','public','Unity Hospital','444-555-6666','unity@example.com','unitypass321',NULL,'321 Maple Drive',221005,'Unity Hospital is committed to providing high-quality healthcare services to all.','active'),(15,3,'444777222','private','City Clinic','777-888-9999','cityclinic@example.com','city123',NULL,'567 Pine Road',221006,'City Clinic offers a wide range of medical services with a focus on patient-centered care.','active'),(16,1,'Luck123','private','Indra Gandhi Hospital','5345475675','infoindra@gmail.com','indra123','Na','Lucknow , street123, Uttarpradesh - 144424',144424,'This is private hospital.','active');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insuranceID` int NOT NULL AUTO_INCREMENT,
  `patientID` int NOT NULL,
  `policyType` varchar(50) NOT NULL,
  `policyNumber` varchar(50) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `validFrom` date NOT NULL,
  `validTo` date NOT NULL,
  PRIMARY KEY (`insuranceID`),
  KEY `fk_patient_insurance` (`patientID`),
  CONSTRAINT `fk_patient_insurance` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,1,'Health','Bajaj2024123','Bajaj Allianz Life Insurance','2024-04-01','2025-04-01'),(2,2,'Health','Lic20241356','LIC','2024-04-01','2026-04-01');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` int NOT NULL AUTO_INCREMENT,
  `cityID` int NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `dateOfBirth` date NOT NULL,
  `bloodGroup` varchar(5) NOT NULL,
  `aadharNumber` varchar(12) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `userID` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`patientID`),
  KEY `patient_ibfk_1` (`cityID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`cityID`) REFERENCES `city` (`cityID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,1,'Anurag','Anand','Male','2000-02-02','B-','123456789012','7352954855','anurag@gmail.com','Lucknow','Uttar Pradesh','123, ABC Street','anurag@gmail.com','Anurag@2002','Patient with a history of allergies.'),(2,1,'Jane','Doe','Female','1988-08-20','A-','987654321098','8765432109','jane.doe@example.com','Lucknow','Uttar Pradesh','456, XYZ Avenue','jane456','pass456','Patient undergoing regular checkups.'),(3,1,'Michael','Smith','Male','1975-10-10','B+','345678901234','7654321098','michael.smith@example.com','Lucknow','Uttar Pradesh','789, PQR Road','michael789','mypass789','Patient with a chronic condition.'),(4,1,'Emily','Johnson','Female','1995-03-25','AB-','567890123456','6543210987','emily.johnson@example.com','Lucknow','Uttar Pradesh','1011, LMN Lane','emily1011','securepass','Patient with no known health issues.'),(5,1,'David','Brown','Male','1982-12-05','O-','890123456789','5432109876','david.brown@example.com','Lucknow','Uttar Pradesh','1213, RST Street','david1213','davidpass','Patient with a recent injury.'),(6,1,'Subham','Kumar','Male','2002-02-02','A+','123456456732','1234567891','subham@gmail.com','Lucknow','Uttar Pradesh','Lucknow haweli up','subham@gmail.com','Subham','na');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staffID` int NOT NULL AUTO_INCREMENT,
  `hospitalID` int NOT NULL,
  `departmentID` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `description` text,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  PRIMARY KEY (`staffID`),
  KEY `hospitalID` (`hospitalID`),
  KEY `departmentID` (`departmentID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`hospitalID`) REFERENCES `hospital` (`hospitalID`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,1,2,'Rishabh','Staff','1234567890','rishabh@gmail.com','6th floor, Mainpura, Patna - 800013','Testing stff add','active');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `stateID` int NOT NULL AUTO_INCREMENT,
  `countryID` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `capital` varchar(255) NOT NULL,
  `zone` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`stateID`),
  KEY `countryID` (`countryID`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`countryID`) REFERENCES `country` (`countryID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,1,'Uttar Pradesh','Lucknow','North','Uttar Pradesh is a state in northern India known for its historical monuments, vibrant culture, and religious significance.'),(2,1,'Maharashtra','Mumbai','West','Maharashtra is a state in western India known for its bustling cities, Bollywood film industry, and rich history.'),(3,1,'Rajasthan','Jaipur','North','Rajasthan is a state in northern India famous for its desert landscapes, palaces, forts, and colorful culture.'),(4,1,'Kerala','Thiruvananthapuram','South','Kerala, often referred to as God place is a state in southern India known for its lush greenery, backwaters, and diverse wildlife.'),(5,2,'Dhaka Division','Dhaka','Central','Dhaka Division is the largest administrative division of Bangladesh, containing the capital city of Dhaka and several other important districts.'),(7,3,'Western Province','Colombo','Western','The Western Province is the most populous province in Sri Lanka and includes the country\'s legislative capital, Sri Jayawardenepura Kotte, as well as its largest city, Colombo.'),(8,3,'Central Province','Kandy','Central','The Central Province is located in the central hills of Sri Lanka and is known for its picturesque landscapes, including tea plantations, mountains, and waterfalls.'),(9,3,'Southern Province','Galle','Southern','The Southern Province is situated in the southern part of Sri Lanka and is renowned for its stunning beaches, ancient temples, and diverse wildlife.'),(10,3,'Northern Province','Jaffna','Northern','The Northern Province is located in the northern part of Sri Lanka and has a rich cultural heritage, including historical sites such as Jaffna Fort and Nallur Kandaswamy Temple.'),(11,4,'Bagmati','Kathmandu','Central','Bagmati Pradesh is a state in central Nepal, with Kathmandu as its capital. It is known for its cultural significance and historical landmarks.'),(12,4,'Gandaki','Pokhara','Western','Gandaki Pradesh is a state in western Nepal, with Pokhara as its capital. It is renowned for its natural beauty, including the Annapurna mountain range and Fewa Lake.'),(13,4,'Lumbini','Butwal','Western','Lumbini Pradesh is a state in western Nepal, with Butwal as its capital. It is the birthplace of Gautama Buddha and holds great religious significance for Buddhists worldwide.'),(14,5,'Thimphu','Thimphu','Western','Thimphu is the capital and largest city of Bhutan. It is situated in the western part of the country, nestled in the Himalayas.');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'nemhr'
--

--
-- Dumping routines for database 'nemhr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-03 18:29:51
