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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `name` varchar(50) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `section` varchar(1) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Mahesh',5,1,'A',1001),('Sita',6,1,'A',1002),('Ravi',5,1,'A',1003),('Anita',6,1,'A',1004),('Sunil',5,1,'A',1005),('Priya',6,1,'A',1006),('Vijay',5,1,'A',1007),('Kavita',6,1,'A',1008),('Amit',5,1,'A',1009),('Neha',6,1,'A',1010),('Raj',5,1,'B',1011),('Geeta',6,1,'B',1012),('Rani',5,1,'B',1013),('Amit',6,1,'B',1014),('Rita',5,1,'B',1015),('Sanjay',6,1,'B',1016),('Lata',5,1,'B',1017),('Deepak',6,1,'B',1018),('Jaya',5,1,'B',1019),('Nitin',6,1,'B',1020),('Kiran',5,1,'C',1021),('Poonam',6,1,'C',1022),('Manoj',5,1,'C',1023),('Sonal',6,1,'C',1024),('Suresh',5,1,'C',1025),('Rashmi',6,1,'C',1026),('Sanjana',5,1,'C',1027),('Harsh',6,1,'C',1028),('Divya',5,1,'C',1029),('Gaurav',6,1,'C',1030),('Alok',7,2,'A',1031),('Neetu',6,2,'A',1032),('Rajesh',7,2,'A',1033),('Sneha',6,2,'A',1034),('Mohan',7,2,'A',1035),('Suman',6,2,'A',1036),('Pankaj',7,2,'A',1037),('Anju',6,2,'A',1038),('Sandeep',7,2,'A',1039),('Tanu',6,2,'A',1040),('Aarti',7,2,'B',1041),('Naveen',6,2,'B',1042),('Chandan',7,2,'B',1043),('Gita',6,2,'B',1044),('Rakesh',7,2,'B',1045),('Meera',6,2,'B',1046),('Nitin',7,2,'B',1047),('Pooja',6,2,'B',1048),('Maya',7,2,'B',1049),('Vijay',6,2,'B',1050),('Ravi',7,2,'C',1051),('Sushma',6,2,'C',1052),('Rohit',7,2,'C',1053),('Kiran',6,2,'C',1054),('Nisha',7,2,'C',1055),('Amit',6,2,'C',1056),('Deepak',7,2,'C',1057),('Rita',6,2,'C',1058),('Sanjay',7,2,'C',1059),('Kavita',6,2,'C',1060),('Madhuri',8,3,'A',1061),('Sandeep',7,3,'A',1062),('Ashok',8,3,'A',1063),('Seema',7,3,'A',1064),('Sunita',8,3,'A',1065),('Ravi',7,3,'A',1066),('Anil',8,3,'A',1067),('Neelam',7,3,'A',1068),('Kiran',8,3,'A',1069),('Rajesh',7,3,'A',1070),('Vinay',8,3,'B',1071),('Rekha',7,3,'B',1072),('Amit',8,3,'B',1073),('Neeta',7,3,'B',1074),('Rani',8,3,'B',1075),('Ramesh',7,3,'B',1076),('Geeta',8,3,'B',1077),('Ankit',7,3,'B',1078),('Mohan',8,3,'B',1079),('Priya',7,3,'B',1080),('Suman',8,3,'C',1081),('Deepak',7,3,'C',1082),('Aarti',8,3,'C',1083),('Raj',7,3,'C',1084),('Kavita',8,3,'C',1085),('Sunil',7,3,'C',1086),('Pooja',8,3,'C',1087),('Vijay',7,3,'C',1088),('Sonia',8,3,'C',1089),('Anju',7,3,'C',1090),('Ravi',9,4,'A',1091),('Pooja',8,4,'A',1092),('Manoj',9,4,'A',1093),('Aarti',8,4,'A',1094),('Sandeep',9,4,'A',1095),('Neha',8,4,'A',1096),('Rajesh',9,4,'A',1097),('Kavita',8,4,'A',1098),('Ankit',9,4,'A',1099),('Rita',8,4,'A',1100),('Sanjay',9,4,'B',1101),('Sunita',8,4,'B',1102),('Deepak',9,4,'B',1103),('Meera',8,4,'B',1104),('Nitin',9,4,'B',1105),('Geeta',8,4,'B',1106),('Vijay',9,4,'B',1107),('Rekha',8,4,'B',1108),('Kiran',9,4,'B',1109),('Maya',8,4,'B',1110),('Raj',9,4,'C',1111),('Anju',8,4,'C',1112),('Poonam',9,4,'C',1113),('Suresh',8,4,'C',1114),('Rani',9,4,'C',1115),('Amit',8,4,'C',1116),('Suman',9,4,'C',1117),('Harsh',8,4,'C',1118),('Ravi',9,4,'C',1119),('Nisha',8,4,'C',1120),('Nitin',10,5,'A',1121),('Sonia',9,5,'A',1122),('Alok',10,5,'A',1123),('Sneha',9,5,'A',1124),('Ravi',10,5,'A',1125),('Sanjana',9,5,'A',1126),('Geeta',10,5,'A',1127),('Deepak',9,5,'A',1128),('Kavita',10,5,'A',1129),('Rajesh',9,5,'A',1130),('Mohan',10,5,'B',1131),('Rekha',9,5,'B',1132),('Rani',10,5,'B',1133),('Pooja',9,5,'B',1134),('Sandeep',10,5,'B',1135),('Meera',9,5,'B',1136),('Amit',10,5,'B',1137),('Nisha',9,5,'B',1138),('Sunil',10,5,'B',1139),('Suman',9,5,'B',1140),('Aarti',10,5,'C',1141),('Vijay',9,5,'C',1142),('Rajesh',10,5,'C',1143),('Kiran',9,5,'C',1144),('Maya',10,5,'C',1145),('Harsh',9,5,'C',1146),('Poonam',10,5,'C',1147),('Nitin',9,5,'C',1148),('Rita',10,5,'C',1149),('Anju',9,5,'C',1150),('Raj',11,6,'A',1151),('Kavita',10,6,'A',1152),('Sunil',11,6,'A',1153),('Pooja',10,6,'A',1154),('Anil',11,6,'A',1155),('Meera',10,6,'A',1156),('Nitin',11,6,'A',1157),('Suman',10,6,'A',1158),('Geeta',11,6,'A',1159),('Ravi',10,6,'A',1160),('Mohan',11,6,'B',1161),('Anju',10,6,'B',1162),('Sandeep',11,6,'B',1163),('Deepak',10,6,'B',1164),('Rita',11,6,'B',1165),('Nisha',10,6,'B',1166),('Rajesh',11,6,'B',1167),('Kiran',10,6,'B',1168),('Sonia',11,6,'B',1169),('Poonam',10,6,'B',1170),('Vijay',11,6,'C',1171),('Harsh',10,6,'C',1172),('Rani',11,6,'C',1173),('Maya',10,6,'C',1174),('Sunita',11,6,'C',1175),('Amit',10,6,'C',1176),('Suman',11,6,'C',1177),('Ravi',10,6,'C',1178),('Pooja',11,6,'C',1179),('Kavita',10,6,'C',1180),('Sanjay',12,7,'A',1181),('Neetu',11,7,'A',1182),('Ravi',12,7,'A',1183),('Sita',11,7,'A',1184),('Alok',12,7,'A',1185),('Geeta',11,7,'A',1186),('Deepak',12,7,'A',1187),('Mohan',11,7,'A',1188),('Priya',12,7,'A',1189),('Rajesh',11,7,'A',1190),('Sonia',12,7,'B',1191),('Harsh',11,7,'B',1192),('Aarti',12,7,'B',1193),('Suman',11,7,'B',1194),('Rekha',12,7,'B',1195),('Sunil',11,7,'B',1196),('Nitin',12,7,'B',1197),('Anju',11,7,'B',1198),('Raj',12,7,'B',1199),('Maya',11,7,'B',1200),('Sandeep',12,7,'C',1201),('Pooja',11,7,'C',1202),('Rita',12,7,'C',1203),('Amit',11,7,'C',1204),('Kiran',12,7,'C',1205),('Nisha',11,7,'C',1206),('Mohan',12,7,'C',1207),('Vijay',11,7,'C',1208),('Ravi',12,7,'C',1209),('Suman',11,7,'C',1210),('Rajesh',13,8,'A',1211),('Maya',12,8,'A',1212),('Sunil',13,8,'A',1213),('Neetu',12,8,'A',1214),('Amit',13,8,'A',1215),('Pooja',12,8,'A',1216),('Deepak',13,8,'A',1217),('Suman',12,8,'A',1218),('Kavita',13,8,'A',1219),('Ravi',12,8,'A',1220),('Sonia',13,8,'B',1221),('Harsh',12,8,'B',1222),('Anju',13,8,'B',1223),('Ravi',12,8,'B',1224),('Rekha',13,8,'B',1225),('Nitin',12,8,'B',1226),('Sandeep',13,8,'B',1227),('Aarti',12,8,'B',1228),('Raj',13,8,'B',1229),('Mohan',12,8,'B',1230),('Suman',13,8,'C',1231),('Rita',12,8,'C',1232),('Kiran',13,8,'C',1233),('Geeta',12,8,'C',1234),('Pooja',13,8,'C',1235),('Sandeep',12,8,'C',1236),('Rajesh',13,8,'C',1237),('Nisha',12,8,'C',1238),('Ravi',13,8,'C',1239),('Anju',12,8,'C',1240),('Sunil',14,9,'A',1241),('Pooja',13,9,'A',1242),('Raj',14,9,'A',1243),('Maya',13,9,'A',1244),('Sandeep',14,9,'A',1245),('Rekha',13,9,'A',1246),('Ravi',14,9,'A',1247),('Geeta',13,9,'A',1248),('Nitin',14,9,'A',1249),('Kiran',13,9,'A',1250),('Harsh',14,9,'B',1251),('Neetu',13,9,'B',1252),('Aarti',14,9,'B',1253),('Mohan',13,9,'B',1254),('Suman',14,9,'B',1255),('Sunita',13,9,'B',1256),('Ravi',14,9,'B',1257),('Rajesh',13,9,'B',1258),('Anju',14,9,'B',1259),('Pooja',13,9,'B',1260),('Sonia',14,9,'C',1261),('Rita',13,9,'C',1262),('Kavita',14,9,'C',1263),('Nitin',13,9,'C',1264),('Maya',14,9,'C',1265),('Raj',13,9,'C',1266),('Sandeep',14,9,'C',1267),('Geeta',13,9,'C',1268),('Ravi',14,9,'C',1269),('Anju',13,9,'C',1270),('Rajesh',15,10,'A',1271),('Kiran',14,10,'A',1272),('Ravi',15,10,'A',1273),('Pooja',14,10,'A',1274),('Sunil',15,10,'A',1275),('Suman',14,10,'A',1276),('Nitin',15,10,'A',1277),('Geeta',14,10,'A',1278),('Rekha',15,10,'A',1279),('Maya',14,10,'A',1280),('Sandeep',15,10,'B',1281),('Raj',14,10,'B',1282),('Aarti',15,10,'B',1283),('Rita',14,10,'B',1284),('Anju',15,10,'B',1285),('Sunita',14,10,'B',1286),('Pooja',15,10,'B',1287),('Nisha',14,10,'B',1288),('Harsh',15,10,'B',1289),('Mohan',14,10,'B',1290),('Maya',15,10,'C',1291),('Suman',14,10,'C',1292),('Sonia',15,10,'C',1293),('Rajesh',14,10,'C',1294),('Ravi',15,10,'C',1295),('Geeta',14,10,'C',1296),('Nitin',15,10,'C',1297),('Pooja',14,10,'C',1298),('Sandeep',15,10,'C',1299),('Rekha',14,10,'C',1300);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 22:59:19
