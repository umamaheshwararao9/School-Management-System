CREATE DATABASE  IF NOT EXISTS `school_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `school_database`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: school_database
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
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `t_name` varchar(50) DEFAULT NULL,
  `t_id` int NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('Keshava',2000,9312345678,'Hyderabad, Banjara Hills'),('Ramesh',2001,9312345679,'Hyderabad, Secunderabad'),('Sita',2002,9312345680,'Hyderabad, Kukatpally'),('Rajesh',2003,9312345681,'Hyderabad, Gachibowli'),('Sunita',2004,9312345682,'Hyderabad, Mehdipatnam'),('Ravi',2005,9312345683,'Hyderabad, Jubilee Hills'),('Priya',2006,9312345684,'Hyderabad, Ameerpet'),('Arun',2007,9312345685,'Hyderabad, Charminar'),('Neeta',2008,9312345686,'Hyderabad, Kondapur'),('Mohan',2009,9312345687,'Hyderabad, LB Nagar'),('Lakshmi',2010,9312345688,'Hyderabad, Malkajgiri'),('Vinod',2011,9312345689,'Hyderabad, Panjagutta'),('Geeta',2012,9312345690,'Hyderabad, Balanagar'),('Kumar',2013,9312345691,'Hyderabad, Rajendra Nagar'),('Meera',2014,9312345692,'Hyderabad, Alwal'),('Suraj',2015,9312345693,'Hyderabad, KPHB'),('Suman',2016,9312345694,'Hyderabad, Nallakunta'),('Kiran',2017,9312345695,'Hyderabad, Begumpet'),('Latha',2018,9312345696,'Hyderabad, Secunderabad'),('Venu',2019,9312345697,'Hyderabad, Saroornagar'),('Sheetal',2020,9312345698,'Hyderabad, Chikkadpally'),('Pradeep',2021,9312345699,'Hyderabad, Kothapet'),('Jyothi',2022,9312345700,'Hyderabad, Gandi Nagar'),('Anil',2023,9312345701,'Hyderabad, Ashok Nagar'),('Shreya',2024,9312345702,'Hyderabad, Mallampet'),('Arvind',2025,9312345703,'Hyderabad, Srinagar'),('Aarti',2026,9312345704,'Hyderabad, Sainikpuri'),('Subhash',2027,9312345705,'Hyderabad, Kothapet'),('Pooja',2028,9312345706,'Hyderabad, Musheerabad'),('Rajani',2029,9312345707,'Hyderabad, Habsiguda'),('Sandeep',2030,9312345708,'Hyderabad, Moosapet');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 22:59:18
