CREATE DATABASE  IF NOT EXISTS `sql12707653` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sql12707653`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: sql12.freesqldatabase.com    Database: sql12707653
-- ------------------------------------------------------
-- Server version	5.5.62-0ubuntu0.14.04.1

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
-- Table structure for table `Psychiatrist`
--

DROP TABLE IF EXISTS `Psychiatrist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Psychiatrist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hospital_id` (`hospital_id`),
  CONSTRAINT `Psychiatrist_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `Hospital` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Psychiatrist`
--

LOCK TABLES `Psychiatrist` WRITE;
/*!40000 ALTER TABLE `Psychiatrist` DISABLE KEYS */;
INSERT INTO `Psychiatrist` VALUES (1,'Dr. John Doe','General Psychiatry','123-456-7890','johndoe@apollo.com',1),(2,'Dr. Jane Smith','Child Psychiatry','123-456-7891','janesmith@apollo.com',1),(3,'Dr. Emily Brown','Forensic Psychiatry','123-456-7892','emilybrown@apollo.com',1),(4,'Dr. Michael Davis','Geriatric Psychiatry','123-456-7893','michaeldavis@apollo.com',1),(5,'Dr. Sarah Wilson','Neuropsychiatry','123-456-7894','sarahwilson@apollo.com',1),(6,'Dr. Raj Kumar','General Psychiatry','234-567-8901','rajkumar@jnmch.com',2),(7,'Dr. Priya Singh','Child Psychiatry','234-567-8902','priyasingh@jnmch.com',2),(8,'Dr. Anil Sharma','Forensic Psychiatry','234-567-8903','anilsharma@jnmch.com',2),(9,'Dr. Sunita Verma','Geriatric Psychiatry','234-567-8904','sunitaverma@jnmch.com',2),(10,'Dr. Vikram Mehta','Neuropsychiatry','234-567-8905','vikrammehta@jnmch.com',2),(11,'Dr. Suresh Reddy','General Psychiatry','345-678-9012','sureshreddy@igims.com',3),(12,'Dr. Anjali Gupta','Child Psychiatry','345-678-9013','anjaligupta@igims.com',3),(13,'Dr. Deepak Pandey','Forensic Psychiatry','345-678-9014','deepakpandey@igims.com',3),(14,'Dr. Rina Das','Geriatric Psychiatry','345-678-9015','rinadas@igims.com',3),(15,'Dr. Abhay Kumar','Neuropsychiatry','345-678-9016','abhaykumar@igims.com',3),(16,'Dr. Amit Patel','General Psychiatry','456-789-0123','amitpatel@aiims.com',4),(17,'Dr. Meera Nair','Child Psychiatry','456-789-0124','meeranair@aiims.com',4),(18,'Dr. Neeraj Jain','Forensic Psychiatry','456-789-0125','neerajjain@aiims.com',4),(19,'Dr. Kavita Rao','Geriatric Psychiatry','456-789-0126','kavitarao@aiims.com',4),(20,'Dr. Rakesh Sharma','Neuropsychiatry','456-789-0127','rakeshsharma@aiims.com',4);
/*!40000 ALTER TABLE `Psychiatrist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-21 20:23:21
