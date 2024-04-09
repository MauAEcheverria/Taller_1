CREATE DATABASE  IF NOT EXISTS `trabajophp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `trabajophp`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trabajophp
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `identificacion` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ximenes','Sponton','1265132','xsponton0@youtu.be','356-301-9049'),(2,'Shamus','Rudsdale','1963826','srudsdale1@wikispaces.com','595-352-6359'),(3,'Roxanne','Elsom','1363574','relsom2@blinklist.com','829-593-2985'),(4,'Gray','Orsay','1107041','gorsay3@un.org','721-562-2647'),(5,'Bucky','Alldis','1754605','balldis4@yale.edu','958-702-3372'),(6,'Agathe','Binfield','1753729','abinfield5@pcworld.com','681-491-3876'),(7,'Emilie','Yallop','1142501','eyallop6@goodreads.com','765-417-6902'),(8,'Margarete','Vannucci','1048265','mvannucci7@elegantthemes.com','497-503-7662'),(9,'Gwenni','Acedo','1522350','gacedo8@xing.com','423-737-9862'),(10,'Mathilde','Duker','1583360','mduker9@pinterest.com','828-759-7840');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idempleado` int NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `apellidos` text NOT NULL,
  `identificacion` varchar(20) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  PRIMARY KEY (`idempleado`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Loise','Woolger','1601273','Associate Professor','821-825-4605'),(2,'Gratiana','Perrottet','1162908','Budget/Accounting Analyst IV','940-594-5440'),(3,'Prudy','Rosenwald','1287725','Physical Therapy Assistant','703-642-3929'),(4,'Whit','Grewes','1465104','Biostatistician IV','647-597-5827'),(5,'Feodor','Blazic','1773155','Senior Financial Analyst','577-438-7328'),(6,'Juliana','Stonebridge','1874118','Programmer Analyst I','138-517-8547'),(7,'Onfroi','Ridler','1235400','Nurse','639-672-0385'),(8,'Simona','Eppson','1758912','Environmental Tech','512-590-7996'),(9,'Mathian','Cossell','1522185','Web Developer III','291-553-0360'),(10,'Rosalyn','MacScherie','1315416','Recruiter','368-493-6503'),(11,'Deonne','Rizzotto','1583252','GIS Technical Architect','459-637-4760'),(12,'Emanuel','Shaw','1169700','Nurse','966-395-2848'),(13,'Denyse','Chaffin','1485528','Recruiter','893-182-7094'),(14,'Dee','Cattroll','1589880','Account Executive','233-161-6110'),(15,'Rosene','Chessman','1282562','Food Chemist','399-201-9046'),(16,'Querida','Abrahamowitcz','1116281','Marketing Assistant','889-246-2402'),(17,'Caty','Schuck','1210499','Administrative Assistant I','516-286-2240'),(18,'Selma','Fifield','1114033','Executive Secretary','221-512-3423'),(19,'Bertha','Simmens','1312013','Electrical Engineer','390-402-2088'),(20,'Nilson','Haswall','1577899','Web Designer II','525-869-0473');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio` (
  `idservicio` int NOT NULL AUTO_INCREMENT,
  `idempleado` int NOT NULL,
  `idcliente` int NOT NULL,
  `idtrabajo` int NOT NULL,
  `dia_contratacion` date DEFAULT NULL,
  `dia_finalizacion` date DEFAULT NULL,
  `cantidad_pago` double DEFAULT NULL,
  `tipo_pago` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idservicio`),
  KEY `idemp_idx` (`idempleado`),
  KEY `idcli_idx` (`idcliente`),
  KEY `idserv_idx` (`idtrabajo`),
  CONSTRAINT `idcli` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`),
  CONSTRAINT `idemp` FOREIGN KEY (`idempleado`) REFERENCES `empleados` (`idempleado`),
  CONSTRAINT `idwork` FOREIGN KEY (`idtrabajo`) REFERENCES `trabajo` (`idtrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES (2,9,1,1,'2024-04-24','2024-05-02',9021.35,'Cheque'),(3,4,10,2,'2024-06-23','2024-04-16',9922.68,'Transferencia'),(4,14,8,3,'2024-06-28','2024-06-22',9923.31,'Transferencia'),(5,1,6,4,'2024-04-12','2024-04-20',630.81,'Efectivo'),(6,6,7,5,'2024-04-18','2024-06-07',1426.95,'Cheque'),(7,16,5,6,'2024-06-09','2024-05-23',1815.41,'Efectivo'),(8,17,10,7,'2024-07-05','2024-05-18',2576.96,'Crédito'),(9,13,9,8,'2024-05-25','2024-04-26',3112.98,'Transferencia'),(10,17,3,9,'2024-06-30','2024-06-15',5004.71,'Transferencia'),(11,16,4,10,'2024-05-29','2024-07-01',7394.06,'Cheque'),(12,10,3,11,'2024-04-24','2024-06-21',7181.34,'Transferencia'),(13,2,3,12,'2024-06-10','2024-04-10',2915.3,'Crédito'),(14,9,3,13,'2024-04-16','2024-04-11',2181,'Transferencia'),(15,7,2,14,'2024-04-17','2024-07-07',789.12,'Crédito'),(16,15,2,15,'2024-05-25','2024-04-28',692.48,'Cheque'),(17,8,5,16,'2024-06-27','2024-05-20',6868.69,'Transferencia'),(18,12,9,17,'2024-04-17','2024-05-09',224.14,'Crédito'),(19,6,1,18,'2024-04-16','2024-04-29',7559.78,'Transferencia'),(20,10,8,19,'2024-06-21','2024-04-23',2497.76,'Crédito'),(21,11,9,20,'2024-06-13','2024-04-10',9382.68,'Transferencia'),(22,11,8,21,'2024-05-11','2024-04-15',567.9,'Efectivo'),(23,6,6,22,'2024-06-20','2024-04-26',7570.33,'Efectivo'),(24,2,8,23,'2024-04-21','2024-05-22',8814.56,'Crédito'),(25,10,5,24,'2024-06-14','2024-05-10',6600.55,'Transferencia'),(26,7,8,25,'2024-04-27','2024-06-05',2329.21,'Transferencia'),(27,1,10,26,'2024-06-04','2024-07-06',8600.27,'Crédito'),(28,14,10,27,'2024-04-25','2024-07-03',3541.38,'Efectivo'),(29,20,3,28,'2024-05-12','2024-04-25',8777.71,'Crédito'),(30,1,4,29,'2024-06-17','2024-04-11',518.64,'Efectivo'),(31,6,3,30,'2024-04-29','2024-06-15',3236.9,'Crédito'),(32,1,2,31,'2024-06-28','2024-06-24',4667.07,'Cheque'),(33,10,10,32,'2024-05-22','2024-07-02',2552.8,'Transferencia'),(34,13,6,33,'2024-05-27','2024-06-17',9857.22,'Cheque'),(35,7,10,34,'2024-06-21','2024-04-12',1544.58,'Efectivo'),(36,1,3,35,'2024-06-11','2024-04-25',6591.35,'Crédito'),(37,18,2,36,'2024-05-04','2024-04-19',5490.56,'Crédito'),(38,17,8,37,'2024-04-11','2024-04-21',9823.59,'Efectivo'),(39,7,6,38,'2024-06-22','2024-06-30',3969.88,'Transferencia'),(40,8,7,39,'2024-06-05','2024-06-21',2964.97,'Crédito'),(41,10,2,40,'2024-05-08','2024-06-18',9608.02,'Efectivo');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajo`
--

DROP TABLE IF EXISTS `trabajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajo` (
  `idtrabajo` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `detalles` text NOT NULL,
  `tipo_reunion` varchar(70) NOT NULL,
  `tipo_trabajo` varchar(45) NOT NULL,
  PRIMARY KEY (`idtrabajo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajo`
--

LOCK TABLES `trabajo` WRITE;
/*!40000 ALTER TABLE `trabajo` DISABLE KEYS */;
INSERT INTO `trabajo` VALUES (1,'nibh in quis','mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit','Remoto','Freelancer'),(2,'platea dictumst etiam faucibus cursus','pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis','Remoto','Indefinido'),(3,'nisl duis bibendum felis','habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate elementum nullam','Remoto','Prestación Servicios'),(4,'at dolor quis odio consequat','sed vestibulum sit amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel','Remoto','Indefinido'),(5,'cras in purus eu magna','in purus eu magna vulputate luctus cum sociis natoque penatibus et magnis dis parturient montes nascetur','Presencial','Indefinido'),(6,'duis bibendum morbi non','habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem','Presencial','Prestación Servicios'),(7,'ipsum praesent','amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor','Remoto','Prestación Servicios'),(8,'eget congue eget','sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst','Remoto','Freelancer'),(9,'id justo sit','cras pellentesque volutpat dui maecenas tristique est et tempus semper','Presencial','Freelancer'),(10,'justo morbi','pretium iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut erat id mauris vulputate','Remoto','Prestación Servicios'),(11,'sed accumsan felis','proin eu mi nulla ac enim in tempor turpis nec euismod scelerisque','Presencial','Prestación Servicios'),(12,'tortor eu','nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim','Remoto','Indefinido'),(13,'nisl aenean','ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non','Presencial','Indefinido'),(14,'in faucibus orci','ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit','Remoto','Prestación Servicios'),(15,'id justo','primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut','Presencial','Prestación Servicios'),(16,'velit donec','etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst','Remoto','Freelancer'),(17,'justo nec condimentum neque','mus vivamus vestibulum sagittis sapien cum sociis natoque penatibus et','Presencial','Freelancer'),(18,'felis sed lacus morbi sem','dolor sit amet consectetuer adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non','Presencial','Prestación Servicios'),(19,'luctus ultricies','vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas rhoncus aliquam lacus','Presencial','Prestación Servicios'),(20,'mauris non','eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra eget congue eget semper rutrum','Presencial','Indefinido'),(21,'suspendisse potenti nullam porttitor','amet cursus id turpis integer aliquet massa id lobortis convallis tortor risus dapibus augue vel','Presencial','Freelancer'),(22,'consequat metus sapien ut','tortor id nulla ultrices aliquet maecenas leo odio condimentum id luctus','Remoto','Freelancer'),(23,'ultrices posuere cubilia','nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices','Remoto','Indefinido'),(24,'porta volutpat','luctus et ultrices posuere cubilia curae duis faucibus accumsan odio','Remoto','Prestación Servicios'),(25,'felis donec semper sapien','integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in','Presencial','Prestación Servicios'),(26,'sapien non','adipiscing elit proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis','Remoto','Prestación Servicios'),(27,'dis parturient montes','dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque ut erat','Remoto','Freelancer'),(28,'scelerisque quam','vulputate nonummy maecenas tincidunt lacus at velit vivamus vel nulla eget eros elementum pellentesque quisque','Presencial','Freelancer'),(29,'tincidunt in leo','eu tincidunt in leo maecenas pulvinar lobortis est phasellus sit','Remoto','Prestación Servicios'),(30,'nisi nam ultrices','hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec','Presencial','Indefinido'),(31,'eu interdum eu tincidunt','dui nec nisi volutpat eleifend donec ut dolor morbi vel lectus in quam fringilla rhoncus mauris enim leo rhoncus','Remoto','Prestación Servicios'),(32,'cubilia curae nulla dapibus','tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis','Presencial','Freelancer'),(33,'id mauris','luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit','Presencial','Freelancer'),(34,'dolor sit amet consectetuer adipiscing','ut rhoncus aliquet pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus semper porta volutpat','Presencial','Prestación Servicios'),(35,'accumsan tortor quis','mi integer ac neque duis bibendum morbi non quam nec','Presencial','Freelancer'),(36,'elit proin risus praesent','ut erat id mauris vulputate elementum nullam varius nulla facilisi','Remoto','Freelancer'),(37,'pede justo lacinia','blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu','Remoto','Freelancer'),(38,'dui luctus rutrum','accumsan felis ut at dolor quis odio consequat varius integer ac leo pellentesque ultrices mattis odio donec','Presencial','Prestación Servicios'),(39,'ut ultrices vel','pede ac diam cras pellentesque volutpat dui maecenas tristique est et tempus semper est quam pharetra magna','Presencial','Prestación Servicios'),(40,'justo eu','feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce','Presencial','Prestación Servicios');
/*!40000 ALTER TABLE `trabajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'trabajophp'
--

--
-- Dumping routines for database 'trabajophp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-07 10:50:55
