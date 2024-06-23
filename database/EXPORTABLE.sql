CREATE DATABASE  IF NOT EXISTS `validacion` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `validacion`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: validacion
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `adapterarchivo`
--

DROP TABLE IF EXISTS `adapterarchivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adapterarchivo` (
  `id_adapterArchivo` int NOT NULL AUTO_INCREMENT,
  `nombreAdapter` varchar(50) DEFAULT NULL,
  `rutaArchivo` varchar(255) DEFAULT NULL,
  `id_alumno` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_adapterArchivo`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `adapterarchivo_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `adapterarchivo_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adapterarchivo`
--

LOCK TABLES `adapterarchivo` WRITE;
/*!40000 ALTER TABLE `adapterarchivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `adapterarchivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admincontraseña`
--

DROP TABLE IF EXISTS `admincontraseña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admincontraseña` (
  `id_adminContraseña` int NOT NULL AUTO_INCREMENT,
  `contraseñahasheada` varchar(100) DEFAULT NULL,
  `id_validadorContraseña` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_adminContraseña`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `admincontraseña_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`),
  CONSTRAINT `admincontraseña_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admincontraseña`
--

LOCK TABLES `admincontraseña` WRITE;
/*!40000 ALTER TABLE `admincontraseña` DISABLE KEYS */;
/*!40000 ALTER TABLE `admincontraseña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `nombreMateria` varchar(50) DEFAULT NULL,
  `nota` double DEFAULT NULL,
  PRIMARY KEY (`id_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credencialesxdefecto`
--

DROP TABLE IF EXISTS `credencialesxdefecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credencialesxdefecto` (
  `id_credencialesXDefecto` int NOT NULL AUTO_INCREMENT,
  `credencialesXDefecto` text,
  `id_validadorContraseña` int DEFAULT NULL,
  PRIMARY KEY (`id_credencialesXDefecto`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `credencialesxdefecto_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credencialesxdefecto`
--

LOCK TABLES `credencialesxdefecto` WRITE;
/*!40000 ALTER TABLE `credencialesxdefecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `credencialesxdefecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intentoiniciosesion`
--

DROP TABLE IF EXISTS `intentoiniciosesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intentoiniciosesion` (
  `id_intento` int NOT NULL AUTO_INCREMENT,
  `intentoExitoso` tinyint(1) DEFAULT NULL,
  `fechaIntento` date DEFAULT NULL,
  `horaIntento` time DEFAULT NULL,
  `tiempoRespuesta` double DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_intento`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `intentoiniciosesion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intentoiniciosesion`
--

LOCK TABLES `intentoiniciosesion` WRITE;
/*!40000 ALTER TABLE `intentoiniciosesion` DISABLE KEYS */;
/*!40000 ALTER TABLE `intentoiniciosesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(64) DEFAULT NULL,
  `ultimoCambioContraseña` date DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacioncaracteres`
--

DROP TABLE IF EXISTS `validacioncaracteres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacioncaracteres` (
  `id_validacionCaracteres` int NOT NULL AUTO_INCREMENT,
  `caracteresProhibidos` text,
  `id_validadorContraseña` int DEFAULT NULL,
  PRIMARY KEY (`id_validacionCaracteres`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `validacioncaracteres_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacioncaracteres`
--

LOCK TABLES `validacioncaracteres` WRITE;
/*!40000 ALTER TABLE `validacioncaracteres` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacioncaracteres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacioncomplejidad`
--

DROP TABLE IF EXISTS `validacioncomplejidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacioncomplejidad` (
  `id_validacionComplejidad` int NOT NULL AUTO_INCREMENT,
  `id_validadorContraseña` int DEFAULT NULL,
  `minimoNumeros` int DEFAULT NULL,
  `minimoSimbolos` int DEFAULT NULL,
  `minimoMinuscula` int DEFAULT NULL,
  `minimoMayuscula` int DEFAULT NULL,
  PRIMARY KEY (`id_validacionComplejidad`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `validacioncomplejidad_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacioncomplejidad`
--

LOCK TABLES `validacioncomplejidad` WRITE;
/*!40000 ALTER TABLE `validacioncomplejidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacioncomplejidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacionlongitud`
--

DROP TABLE IF EXISTS `validacionlongitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacionlongitud` (
  `id_validacionLongitud` int NOT NULL AUTO_INCREMENT,
  `longitudMinima` int DEFAULT NULL,
  `longitudMaxima` int DEFAULT NULL,
  `id_validadorContraseña` int DEFAULT NULL,
  PRIMARY KEY (`id_validacionLongitud`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `validacionlongitud_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacionlongitud`
--

LOCK TABLES `validacionlongitud` WRITE;
/*!40000 ALTER TABLE `validacionlongitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacionlongitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacionpeores`
--

DROP TABLE IF EXISTS `validacionpeores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacionpeores` (
  `id_validacionPeores` int NOT NULL AUTO_INCREMENT,
  `peoresContrasenas` text,
  `id_validadorContraseña` int DEFAULT NULL,
  PRIMARY KEY (`id_validacionPeores`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `validacionpeores_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacionpeores`
--

LOCK TABLES `validacionpeores` WRITE;
/*!40000 ALTER TABLE `validacionpeores` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacionpeores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validacionultimarotacion`
--

DROP TABLE IF EXISTS `validacionultimarotacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validacionultimarotacion` (
  `id_validacionRotacion` int NOT NULL AUTO_INCREMENT,
  `diasMaximos` int DEFAULT NULL,
  `id_validadorContraseña` int DEFAULT NULL,
  PRIMARY KEY (`id_validacionRotacion`),
  KEY `id_validadorContraseña` (`id_validadorContraseña`),
  CONSTRAINT `validacionultimarotacion_ibfk_1` FOREIGN KEY (`id_validadorContraseña`) REFERENCES `validadorcontraseña` (`id_validadorContraseña`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validacionultimarotacion`
--

LOCK TABLES `validacionultimarotacion` WRITE;
/*!40000 ALTER TABLE `validacionultimarotacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `validacionultimarotacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `validadorcontraseña`
--

DROP TABLE IF EXISTS `validadorcontraseña`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `validadorcontraseña` (
  `id_validadorContraseña` int NOT NULL AUTO_INCREMENT,
  `nombreValidacion` varchar(50) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id_validadorContraseña`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `validadorcontraseña_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `validadorcontraseña`
--

LOCK TABLES `validadorcontraseña` WRITE;
/*!40000 ALTER TABLE `validadorcontraseña` DISABLE KEYS */;
/*!40000 ALTER TABLE `validadorcontraseña` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'validacion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21 13:51:28
