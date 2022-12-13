-- MariaDB dump 10.19  Distrib 10.9.4-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: cinema_master
-- ------------------------------------------------------
-- Server version	10.9.4-MariaDB

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
-- Table structure for table `Cines`
--

DROP TABLE IF EXISTS `Cines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cines` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(45) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Entradas`
--

DROP TABLE IF EXISTS `Entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entradas` (
  `numero_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `fk_numero_funcion` int(11) NOT NULL,
  PRIMARY KEY (`numero_venta`),
  KEY `fk_numero_funcion` (`fk_numero_funcion`),
  CONSTRAINT `vender` FOREIGN KEY (`fk_numero_funcion`) REFERENCES `Funciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Funciones`
--

DROP TABLE IF EXISTS `Funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Funciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_pelicula` varchar(45) NOT NULL,
  `fk_numero_sala` int(11) NOT NULL,
  `horario` datetime NOT NULL,
  `estado` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_pelicula` (`fk_id_pelicula`),
  KEY `fk_numero_sala` (`fk_numero_sala`),
  CONSTRAINT `proyectar` FOREIGN KEY (`fk_numero_sala`) REFERENCES `Salas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reproducir` FOREIGN KEY (`fk_id_pelicula`) REFERENCES `Peliculas` (`imdbID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Peliculas`
--

DROP TABLE IF EXISTS `Peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Peliculas` (
  `imdbID` varchar(45) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `año` varchar(45) NOT NULL,
  `duracion` varchar(45) NOT NULL,
  `clasificacion` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `director` varchar(100) NOT NULL,
  `actores` varchar(100) NOT NULL,
  `pais_origen` varchar(45) NOT NULL,
  `poster` varchar(200) NOT NULL,
  PRIMARY KEY (`imdbID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Salas`
--

DROP TABLE IF EXISTS `Salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cine` int(11) NOT NULL,
  `cantidad_butacas` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `numero_cine` (`numero_cine`),
  CONSTRAINT `aloja` FOREIGN KEY (`numero_cine`) REFERENCES `Cines` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-13 13:17:00
