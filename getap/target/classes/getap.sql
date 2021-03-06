-- MySQL dump 10.13  Distrib 5.1.66, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: getap
-- ------------------------------------------------------
-- Server version	5.1.66-0ubuntu0.10.04.1

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
-- Table structure for table `ap`
--

DROP TABLE IF EXISTS `ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  `origineEtat` smallint(6) DEFAULT NULL COMMENT 'False par default (non validée)',
  `idUser` int(11) DEFAULT NULL COMMENT 'NULL pour AP générique',
  PRIMARY KEY (`id`),
  KEY `fk_AP_User1` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap`
--

LOCK TABLES `ap` WRITE;
/*!40000 ALTER TABLE `ap` DISABLE KEYS */;
INSERT INTO `ap` VALUES (1,'SOS Matiere',0,NULL),(2,'Sortie théâtre',0,NULL),(3,'Tutorat',0,NULL),(4,'Entretien Conseillère d\'Orientation',0,NULL),(5,'conférence violences',1,8),(6,'SOS Maths',0,NULL),(7,'SOS Matiere Chimie',0,NULL),(8,'Techniques de veille (CDI)',0,NULL),(9,'Conférence XXX',0,NULL),(10,'Exemple Activité',0,NULL),(11,'Heure de colle Leçon de Maths',1,8);
/*!40000 ALTER TABLE `ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES (4,'SIO-SISR'),(3,'SIO-SLAM'),(1,'SIO11'),(2,'SIO12');
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dctap`
--

DROP TABLE IF EXISTS `dctap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dctap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anneeScolaire` varchar(9) NOT NULL,
  `dateAction` date NOT NULL,
  `dureeAP` int(11) NOT NULL,
  `Etat` int(11) NOT NULL,
  `idProf` int(11) NOT NULL,
  `idEleve` int(11) NOT NULL,
  `idAP` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProf` (`idProf`),
  KEY `idEleve` (`idEleve`),
  KEY `idAP` (`idAP`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dctap`
--

LOCK TABLES `dctap` WRITE;
/*!40000 ALTER TABLE `dctap` DISABLE KEYS */;
INSERT INTO `dctap` VALUES (1,'2011-2012','2012-05-02',180,2048,2,7,1),(2,'2011-2012','2012-05-02',245,0,2,7,1),(3,'2011-2012','2012-10-03',50,1024,2,7,1),(4,'2011-2012','2012-02-14',85,2048,4,7,1),(5,'2011-2012','2012-06-30',300,4096,3,7,3),(6,'2011-2012','2012-05-02',245,32,2,8,1),(7,'2011-2012','2012-05-02',245,0,2,8,1),(8,'2011-2012','2012-10-03',50,1,2,8,1),(9,'2011-2012','2012-02-14',85,1,4,8,1),(10,'2011-2012','2012-06-30',300,4096,4,8,3),(11,'2011-2012','2012-05-02',245,1,4,8,2),(12,'2011-2012','2012-05-02',245,1,4,8,4),(13,'2011-2012','2012-05-02',245,64,4,8,2),(14,'2011-2012','2012-05-02',245,1,4,8,4),(15,'2011-2012','2012-05-02',245,0,4,9,1),(16,'2011-2012','2012-05-02',245,0,4,9,1),(17,'2011-2012','2012-10-03',50,1024,4,9,1),(18,'2011-2012','2012-02-14',85,2048,4,9,1),(19,'2011-2012','2012-06-30',300,4096,4,9,3),(20,'2011-2012','2012-05-02',245,1,4,9,2),(21,'2011-2012','2012-05-02',245,1,4,9,4),(22,'2011-2012','2012-05-02',245,64,4,9,2),(23,'2011-2012','2012-05-02',245,1,4,9,4),(24,'2011-2012','2012-05-02',245,0,4,10,1),(25,'2011-2012','2012-05-02',245,0,4,10,1),(26,'2011-2012','2012-10-03',50,1024,4,10,1),(27,'2011-2012','2012-02-14',85,2048,4,10,1),(28,'2011-2012','2012-06-30',300,4096,4,10,3),(29,'2011-2012','2012-05-02',245,1,4,10,2),(30,'2011-2012','2012-05-02',245,1,4,10,4),(31,'2011-2012','2012-05-02',245,64,4,10,2),(32,'2011-2012','2012-05-02',245,1,4,10,4),(33,'2011-2012','2012-05-02',245,0,4,11,1),(34,'2011-2012','2012-05-02',245,0,4,11,1),(35,'2011-2012','2012-10-03',50,1024,4,11,1),(36,'2011-2012','2012-02-14',85,2048,4,11,1),(37,'2011-2012','2012-06-30',300,4096,4,11,3),(38,'2011-2012','2012-05-02',245,1,4,11,2),(39,'2011-2012','2012-05-02',245,1,4,11,4),(40,'2011-2012','2012-05-02',245,64,4,11,2),(41,'2011-2012','2012-05-02',245,1,4,11,4),(42,'2011-2012','2012-05-02',245,0,4,12,1),(43,'2011-2012','2012-05-02',245,0,4,12,1),(44,'2011-2012','2012-10-03',50,1024,4,12,1),(45,'2011-2012','2012-02-14',85,2048,4,12,1),(46,'2011-2012','2012-06-30',300,4096,4,12,3),(47,'2011-2012','2012-05-02',245,1,4,12,2),(48,'2011-2012','2012-05-02',245,1,4,12,4),(49,'2011-2012','2012-05-02',245,64,4,12,2),(50,'2011-2012','2012-05-02',245,1,4,12,4),(51,'2011-2012','2012-05-02',245,0,4,13,1),(52,'2011-2012','2012-05-02',245,0,4,13,1),(53,'2011-2012','2012-10-03',50,1024,4,13,1),(54,'2011-2012','2012-02-14',85,2048,4,13,1),(55,'2011-2012','2012-06-30',300,4096,4,13,3),(56,'2011-2012','2012-05-02',245,1,4,13,2),(57,'2011-2012','2012-05-02',245,1,4,13,4),(58,'2011-2012','2012-05-02',245,64,4,13,2),(59,'2011-2012','2012-05-02',245,1,4,13,4),(60,'2011-2012','2012-05-02',245,0,4,14,1),(61,'2011-2012','2012-05-02',245,0,4,14,1),(62,'2011-2012','2012-10-03',50,1024,4,14,1),(63,'2011-2012','2012-02-14',85,2048,4,14,1),(64,'2011-2012','2012-06-30',300,4096,4,14,3),(65,'2011-2012','2012-05-02',245,1,4,14,2),(66,'2011-2012','2012-05-02',245,1,4,14,4),(67,'2011-2012','2012-05-02',245,64,4,14,2),(68,'2011-2012','2012-05-02',245,1,4,14,4),(69,'2011-2012','2012-05-02',245,0,4,15,1),(70,'2011-2012','2012-05-02',245,0,4,15,1),(71,'2011-2012','2012-10-03',50,1024,4,15,1),(72,'2011-2012','2012-02-14',85,2048,4,15,1),(73,'2011-2012','2012-06-30',300,4096,3,15,3),(74,'2011-2012','2012-05-02',245,1,4,15,2),(75,'2011-2012','2012-05-02',245,1,4,15,4),(76,'2011-2012','2012-05-02',245,64,4,15,2),(77,'2011-2012','2012-05-02',245,1,2,15,4),(78,'2011-2012','2012-05-02',245,0,2,16,1),(79,'2011-2012','2012-05-02',245,0,2,16,1),(80,'2011-2012','2012-10-03',50,1024,2,16,1),(81,'2011-2012','2012-02-14',85,2048,4,16,1),(82,'2011-2012','2012-06-30',300,4096,3,16,3),(83,'2011-2012','2012-05-02',245,1,2,16,2),(84,'2011-2012','2012-05-02',245,1,2,16,4),(85,'2011-2012','2012-05-02',245,64,2,16,2),(86,'2011-2012','2012-05-02',245,1,2,16,4),(87,'2011-2012','2012-05-02',245,0,2,17,1),(88,'2011-2012','2012-05-02',245,0,2,17,1),(89,'2011-2012','2012-10-03',50,1024,2,17,1),(90,'2011-2012','2012-02-14',85,2048,4,17,1),(91,'2011-2012','2012-06-30',300,4096,3,17,3),(92,'2011-2012','2012-05-02',245,1,2,17,2),(93,'2011-2012','2012-05-02',245,1,2,17,4),(94,'2011-2012','2012-05-02',245,64,2,17,2),(95,'2011-2012','2012-05-02',245,1,2,17,4),(96,'2011-2012','2012-05-02',245,0,2,34,1),(97,'2011-2012','2012-05-02',245,0,2,34,1),(98,'2011-2012','2012-10-03',50,1024,2,34,1),(99,'2011-2012','2012-02-14',85,2048,4,34,1),(100,'2011-2012','2012-06-30',300,4096,3,34,3),(101,'2011-2012','2012-05-02',245,1,2,34,2),(102,'2011-2012','2012-05-02',245,1,2,34,4),(103,'2011-2012','2012-05-02',245,64,4,34,2),(104,'2011-2012','2012-05-02',245,1,4,34,4),(105,'2011-2012','2012-05-02',245,0,4,35,1),(106,'2011-2012','2012-05-02',245,0,4,35,1),(107,'2011-2012','2012-10-03',50,1024,4,35,1),(108,'2011-2012','2012-02-14',85,2048,4,35,1),(109,'2011-2012','2012-06-30',300,4096,3,35,3),(110,'2011-2012','2012-05-02',245,1,4,35,2),(111,'2011-2012','2012-05-02',245,1,4,35,4),(112,'2011-2012','2012-05-02',245,64,4,35,2),(113,'2011-2012','2012-05-02',245,1,4,35,4),(114,'2011-2012','2012-05-02',245,0,4,36,1),(115,'2011-2012','2012-05-02',245,0,4,36,1),(116,'2011-2012','2012-10-03',50,1024,2,36,1),(117,'2011-2012','2012-02-14',85,2048,4,36,1),(118,'2011-2012','2012-06-30',300,4096,3,36,3),(119,'2011-2012','2012-05-02',245,1,4,36,2),(120,'2011-2012','2012-05-02',245,1,4,36,4),(121,'2011-2012','2012-05-02',245,64,4,36,2),(122,'2011-2012','2012-05-02',245,1,4,36,4),(123,'2011-2012','2012-06-12',45,0,3,6,1),(124,'2011-2012','2012-06-07',30,0,2,8,5),(125,'2011-2012','2012-06-12',105,0,2,8,7),(126,'2011-2012','2012-06-13',60,0,61,8,11),(127,'2011-2012','2012-10-03',25,0,2,8,1),(128,'2011-2012','2012-11-02',5,8,2,60,4),(129,'2011-2012','2012-11-02',5,0,2,60,1);
/*!40000 ALTER TABLE `dctap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
INSERT INTO `discipline` VALUES (1,'Philosophie'),(2,'Lettres'),(3,'Allemand'),(4,'Anglais'),(5,'Espagnol'),(6,'Documentation');
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_accueil`
--

DROP TABLE IF EXISTS `param_accueil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_accueil` (
  `img` varchar(200) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  `titre` varchar(200) DEFAULT NULL,
  `texte` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_accueil`
--

LOCK TABLES `param_accueil` WRITE;
/*!40000 ALTER TABLE `param_accueil` DISABLE KEYS */;
INSERT INTO `param_accueil` VALUES ('/images/lycee2.jpg','/images/logolycee.jpg','Bienvenu sur GeTAP','GeTAP est une application de Gestion de Temps d\'Accompagnement Personnalisé pour les besoins d\'un établissement scolaire.<br/> L\'objectif principal est de reconnaître l\'investissement d\'un élève dans des activités vécues  <span class=\"T1\">hors du cadre</span> habituel réservé à cet usage (inscrit dans son emploi du temps hebdomadaire)<br/><br/>L\'élève est au centre de ce dispositif, il en est l\'acteur principal.<br/><br/><span class=\"T2\">L\'élève, </span><span class=\"T1\">après</span> s\'être investi dans une activité d\'accompagnement, déclare sa participation à cette activé, en renseignant :<br/><br/><span style=\"position:absolute;left:NaNcm;\">La nature de l\'activité </span> <br/><span style=\"position:absolute;left:NaNcm;\">Le jour</span><br/><span style=\"position:absolute;left:NaNcm;\">La durée</span><br/><span style=\"position:absolute;left:NaNcm;\">Le professeur intervenant </span><br/><br/>C\'est le professeur intervenant concerné qui valide la présence de l\'élève à l\'activité en question.<br/><br/>Le professeur se connecte à l\'application GeTAP pour être informé des demandes en attentes de validation.  (Une communication automatique par courriel est prévue, selon un intervalle qui reste à définir, mais cette fonctionnalité n\'est pas implémentée pour le moment)<br/><br/>L\'élève et le professeur peuvent, à tout moment, consulter le nombre d\'heures consommé en accompagnement personnalisé pour l\'année scolaire, ainsi que les demandes en attentes de validation et les autres.');
/*!40000 ALTER TABLE `param_accueil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `param_annee`
--

DROP TABLE IF EXISTS `param_annee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `param_annee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anneeScolaire` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `param_annee`
--

LOCK TABLES `param_annee` WRITE;
/*!40000 ALTER TABLE `param_annee` DISABLE KEYS */;
INSERT INTO `param_annee` VALUES (1,'2011-2012');
/*!40000 ALTER TABLE `param_annee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prof_principal`
--

DROP TABLE IF EXISTS `prof_principal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prof_principal` (
  `idUser` int(11) NOT NULL,
  `idClasse` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idClasse`),
  KEY `fk_User_has_Classe_Classe1` (`idClasse`),
  KEY `fk_User_has_Classe_User1` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prof_principal`
--

LOCK TABLES `prof_principal` WRITE;
/*!40000 ALTER TABLE `prof_principal` DISABLE KEYS */;
INSERT INTO `prof_principal` VALUES (4,1),(61,1),(62,1),(4,2),(61,2),(62,2),(2,3),(61,3),(62,3),(61,4),(62,4);
/*!40000 ALTER TABLE `prof_principal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `idEtab` varchar(20) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `mdp` varchar(45) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `role` varchar(20) NOT NULL COMMENT 'Admin \n\nProfPrin\n\nProfInter\n\nEleve',
  `idClasse` int(11) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `idDiscipline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ADMIN','Admin',NULL,'admin','admin','21232f297a57a5a743894a0e4a801fc3','admin',NULL,NULL,NULL),(2,'CAPUOZZO','Olivier',NULL,'kpu','kpu','46a7033a2bc3074cbbb7bb76a2e2731f','prof-principal',NULL,NULL,5),(3,'GUILLIEN','Yann',NULL,'yann','yann','182b7817e82d6eb4a6107a431b92fa2b','prof-intervenant',NULL,NULL,1),(4,'DALLAT  ','Gilles',NULL,'gil','gil','0d7d3a24242c6d235735b98149c6b35b','prof-principal',NULL,NULL,4),(5,'LAFOREST','Florian','01234567896','flo','flo','7e1e91156f7c4e1bd0831cf008ad5fdf','eleve',3,NULL,NULL),(6,'GEFFARD','Quentin','01234567895','quent','quent','12178f9c143bc496a230e893e838db26','eleve',3,NULL,NULL),(7,'FIDALGO','Antoine','01234567894','ant','ant','63b07e828bf016e976ff95d6ee07a105','eleve',3,NULL,NULL),(8,'eleve1','eleve1','01234567893','eleve1','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(9,'eleve2','eleve2','01234567892','eleve2','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(10,'eleve3','eleve3','01234567892','eleve3','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(11,'eleve4','eleve4','01234567892','eleve4','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(12,'eleve5','eleve5','01234567892','eleve5','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(13,'eleve6','eleve6','01234567892','eleve6','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(14,'eleve7','eleve7','01234567892','eleve7','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(15,'eleve8','eleve8','01234567892','eleve8','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(16,'eleve9','eleve9','01234567892','eleve9','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(17,'eleve10','eleve10','01234567892','eleve10','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(18,'eleve11','eleve11','01234567892','eleve11','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(19,'eleve12','eleve12','01234567892','eleve12','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(20,'eleve13','eleve13','01234567892','eleve13','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(21,'eleve14','eleve14','01234567892','eleve14','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(22,'eleve15','eleve15','01234567892','eleve15','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(23,'eleve16','eleve16','01234567892','eleve16','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(24,'eleve17','eleve17','01234567892','eleve17','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(25,'eleve18','eleve18','01234567892','eleve18','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(26,'eleve19','eleve19','01234567892','eleve19','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(27,'eleve20','eleve20','01234567892','eleve20','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(28,'eleve21','eleve21','01234567892','eleve21','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(29,'eleve22','eleve22','01234567892','eleve22','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(30,'eleve23','eleve23','01234567892','eleve23','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(31,'eleve24','eleve24','01234567892','eleve24','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(32,'eleve25','eleve25','01234567892','eleve25','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(33,'eleve26','eleve26','01234567892','eleve26','eleve','c16da4ad70df593520193184381b9f21','eleve',1,NULL,NULL),(34,'eleve27','eleve27','01234567892','eleve27','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(35,'eleve28','eleve28','01234567892','eleve28','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(36,'eleve29','eleve29','01234567892','eleve29','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(37,'eleve30','eleve30','01234567892','eleve30','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(38,'eleve31','eleve31','01234567892','eleve31','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(39,'eleve32','eleve32','01234567892','eleve32','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(40,'eleve33','eleve33','01234567892','eleve33','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(41,'eleve34','eleve34','01234567892','eleve34','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(42,'eleve35','eleve35','01234567892','eleve35','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(43,'eleve36','eleve36','01234567892','eleve36','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(44,'eleve37','eleve37','01234567892','eleve37','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(45,'eleve38','eleve38','01234567892','eleve38','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(46,'eleve39','eleve39','01234567892','eleve39','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(47,'eleve40','eleve40','01234567892','eleve40','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(48,'eleve41','eleve41','01234567892','eleve41','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(49,'eleve42','eleve42','01234567892','eleve42','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(50,'eleve43','eleve43','01234567892','eleve43','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(51,'eleve44','eleve44','01234567892','eleve44','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(52,'eleve45','eleve45','01234567892','eleve45','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(53,'eleve46','eleve46','01234567892','eleve46','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(54,'eleve47','eleve47','01234567892','eleve47','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(55,'eleve48','eleve48','01234567892','eleve48','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(57,'eleve49','eleve49','01234567892','eleve49','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(58,'eleve50','eleve50','01234567892','eleve50','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(59,'eleve51','eleve51','01234567892','eleve51','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(60,'eleve52','eleve52','01234567892','eleve52','eleve','c16da4ad70df593520193184381b9f21','eleve',2,NULL,NULL),(61,'prof','prof2',NULL,'p_prof','avh8p','248028116a83d1e9284999280ff8450f','prof-principal',NULL,NULL,5),(62,'ARDUISE','Doriane',NULL,'darduise','abvyo','b832a5e4aedf48f2f269b9a0b9ae7211','prof-principal',NULL,NULL,6);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-10 11:54:19
