-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2023 at 07:21 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema_master`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarPelicula` (IN `id` VARCHAR(45) CHARSET utf8, IN `nuevoTitulo` VARCHAR(45) CHARSET utf8, IN `nuevoAño` VARCHAR(45) CHARSET utf8, IN `nuevaDuracion` VARCHAR(45) CHARSET utf8, IN `nuevaClasificacion` VARCHAR(45) CHARSET utf8, IN `nuevoGenero` VARCHAR(45) CHARSET utf8, IN `nuevoPoster` VARCHAR(200) CHARSET utf8)   UPDATE `Peliculas`
SET
    `titulo` = nuevoTitulo,
    `año` = nuevoAño,
    `duracion` = nuevaDuracion,
    `clasificacion` = nuevaClasificacion,
    `genero` = nuevoGenero,
    `poster` = nuevoPoster
WHERE
    `imdbID` = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BorrarPelicula` (IN `id` VARCHAR(20) CHARSET utf8)   DELETE FROM `Peliculas` WHERE `imdbID` = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CargarNuevaPelicula` (IN `imdbID` VARCHAR(20) CHARSET utf8, IN `titulo` VARCHAR(45) CHARSET utf8, IN `año` VARCHAR(45) CHARSET utf8, IN `duracion` VARCHAR(45) CHARSET utf8, IN `clasificacion` VARCHAR(45) CHARSET utf8, IN `genero` VARCHAR(45) CHARSET utf8, IN `director` VARCHAR(45) CHARSET utf8, IN `actores` VARCHAR(150) CHARSET utf8, IN `pais_origen` VARCHAR(45) CHARSET utf8, IN `poster` VARCHAR(200) CHARSET utf8)   INSERT INTO
    `Peliculas` (
        `imdbID`,
        `titulo`,
        `año`,
        `duracion`,
        `clasificacion`,
        `genero`,
        `director`,
        `actores`,
        `pais_origen`,
        `poster`
    )
VALUES
    (
        $imdbID,
        $titulo,
        $año,
        $duracion,
        $clasificacion,
        $genero,
        $director,
        $actores,
        $pais_origen,
        $poster
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EntradasCompradasJoin1` ()   SELECT
   entradas.numero_venta, entradas.fecha, entradas.tipo, entradas.precio, entradas.cantidad_tickets, 	combos.nombreCombo, programacion.horario, programacion.id
FROM
    entradas
    LEFT OUTER JOIN programacion ON entradas.fk_numero_funcion = programacion.id
    LEFT OUTER JOIN combos ON entradas.fk_numCombo = combos.numCombo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerPelicula` (IN `id` VARCHAR(20) CHARSET utf8)   SELECT * FROM Peliculas WHERE imdbID LIKE id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerTodasLasPeliculas` ()   SELECT * FROM Peliculas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ProgramacionSemanalJoin2` ()   SELECT
    *
FROM
    Programacion
    LEFT OUTER JOIN Peliculas ON Programacion.fk_id_pelicula = Peliculas.imdbID
    LEFT OUTER JOIN Salas ON Programacion.fk_numero_sala = Salas.id
    LEFT OUTER JOIN Cines ON Salas.numero_cine = Cines.numero$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cines`
--

CREATE TABLE `cines` (
  `numero` int(11) NOT NULL,
  `direccion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_dni_encargado` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cines`
--

INSERT INTO `cines` (`numero`, `direccion`, `nombre`, `fk_dni_encargado`) VALUES
(1, 'Bravard 1300', 'Cinema Master Mall', NULL),
(2, 'Alem 450', 'Cinema Master Alem', NULL),
(3, 'Vieytes 102', 'Cine Vieytes ', NULL),
(4, 'Gorriti 2400', 'Cine Master Gorriti', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `combos`
--

CREATE TABLE `combos` (
  `numCombo` int(5) NOT NULL,
  `gaseosas` int(2) NOT NULL,
  `pochoclos` int(2) DEFAULT NULL,
  `pochoclosGrandes` int(2) DEFAULT NULL,
  `nombreCombo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `combos`
--

INSERT INTO `combos` (`numCombo`, `gaseosas`, `pochoclos`, `pochoclosGrandes`, `nombreCombo`) VALUES
(1, 2, 2, NULL, 'Combo Duo'),
(2, 4, 2, 2, 'Combo Familiar'),
(3, 2, NULL, 2, 'Combo Pareja'),
(4, 1, 1, NULL, 'Combo Simple');

-- --------------------------------------------------------

--
-- Table structure for table `encargados`
--

CREATE TABLE `encargados` (
  `dni` int(9) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `numero` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `encargados`
--

INSERT INTO `encargados` (`dni`, `nombre`, `apellido`, `mail`, `numero`) VALUES
(42548598, 'Monica', 'Smith', 'MonicSmith@gmail.com', '+54 9 291 365 8742'),
(44453822, 'Juan', 'Perez', 'juan321@gmail.com', '+54 9 291 445 9888');

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

CREATE TABLE `entradas` (
  `numero_venta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` float NOT NULL,
  `cantidad_tickets` int(3) NOT NULL,
  `fk_numero_funcion` int(11) NOT NULL,
  `fk_numCombo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entradas`
--

INSERT INTO `entradas` (`numero_venta`, `fecha`, `tipo`, `precio`, `cantidad_tickets`, `fk_numero_funcion`, `fk_numCombo`) VALUES
(11, '2019-12-22 04:02:42', 'Jubilado', 500, 0, 1, NULL),
(20, '2019-12-22 04:08:14', 'Normal', 1000, 0, 1, NULL),
(21, '2019-12-22 04:12:10', 'Jubilado', 750, 3, 1, 1),
(22, '2019-12-22 04:14:53', 'Jubilado', 750, 3, 1, 2),
(23, '2019-12-22 04:16:17', 'Jubilado', 750, 3, 1, 4),
(24, '2019-12-22 04:19:07', 'Jubilado', 750, 3, 1, 3),
(25, '2019-12-22 04:19:21', 'Jubilado', 500, 2, 1, 1),
(26, '2019-12-22 04:20:05', 'Jubilado', 500, 2, 1, 3),
(27, '2019-12-22 04:21:25', 'Jubilado', 750, 3, 1, NULL),
(28, '2019-12-22 04:21:36', 'Jubilado', 750, 3, 1, NULL),
(29, '2019-12-22 04:22:56', 'Normal', 1500, 3, 1, 1),
(30, '2019-12-22 04:35:55', 'Normal', 500, 1, 1, NULL),
(31, '2019-12-22 04:36:25', 'Jubilado', 1250, 5, 1, 2),
(32, '2019-12-22 04:37:06', 'Jubilado', 750, 3, 1, 4),
(33, '2019-12-22 04:37:32', 'Normal', 1500, 3, 1, NULL),
(34, '2019-12-22 06:56:29', 'Normal', 1000, 2, 2, NULL),
(35, '2019-12-22 06:59:49', 'Jubilado', 250, 1, 1, NULL),
(36, '2019-12-22 07:03:02', 'Normal', 500, 1, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `peliculas`
--

CREATE TABLE `peliculas` (
  `imdbID` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `año` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duracion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `clasificacion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actores` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pais_origen` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poster` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `peliculas`
--

INSERT INTO `peliculas` (`imdbID`, `titulo`, `año`, `duracion`, `clasificacion`, `genero`, `director`, `actores`, `pais_origen`, `poster`) VALUES
('tt0372784', 'Batman Begins', '15 Jun 2005', '140 min', 'PG-13', 'Action, Crime, Drama', 'Christopher Nolan', 'Christian Bale, Michael Caine, Ken Watanabe', 'United States, United Kingdom', 'https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
('tt0499549', 'Avatar', '18 Dec 2009', '180 min', 'PG-13', 'Action, Adventure, Fantasy', 'James Cameron', 'Sam Worthington, Zoe Saldana, Sigourney Weaver', 'United States', 'https://m.media-amazon.com/images/M/MV5BNjA3NGExZDktNDlhZC00NjYyLTgwNmUtZWUzMDYwMTZjZWUyXkEyXkFqcGdeQXVyMTU1MDM3NDk0._V1_SX300.jpg'),
('tt1877830', 'The Batman', '04 Mar 2022', '176 min', 'PG-13', 'Action, Crime, Drama', 'Matt Reeves', 'Robert Pattinson, Zoë Kravitz, Jeffrey Wright', 'United States', 'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg'),
('tt2250912', 'Spider-Man: Homecoming', '07 Jul 2017', '133 min', 'PG-13', 'Action, Adventure, Sci-Fi', 'Jon Watts', 'Tom Holland, Michael Keaton, Robert Downey Jr.', 'United States', 'https://m.media-amazon.com/images/M/MV5BNTk4ODQ1MzgzNl5BMl5BanBnXkFtZTgwMTMyMzM4MTI@._V1_SX300.jpg'),
('tt4116284', 'The Lego Batman Movie', '10 Feb 2017', '104 min', 'PG', 'Animation, Action, Adventure', 'Chris McKay', 'Will Arnett, Michael Cera, Rosario Dawson', 'United States, Denmark, Australia', 'https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg'),
('tt9362722', 'Spider-Man: Across the Spider-Verse', '02 Jun 2023', '2HS', 'PG-13', 'Animation, Action, Adventure', 'Joaquim Dos Santos, Kemp Powers, Justin K. Thompson', 'Shameik Moore, Hailee Steinfeld, Oscar Isaac', 'United States', 'https://m.media-amazon.com/images/M/MV5BZGRhNDE1YjYtOGUzMC00YjliLThiOTgtYTkwNmQwNDZjYjFhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_SX300.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `programacion`
--

CREATE TABLE `programacion` (
  `id` int(11) NOT NULL,
  `fk_id_pelicula` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_numero_sala` int(11) NOT NULL,
  `horario` datetime NOT NULL,
  `estado` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programacion`
--

INSERT INTO `programacion` (`id`, `fk_id_pelicula`, `fk_numero_sala`, `horario`, `estado`, `tipo`) VALUES
(1, 'tt0499549', 3, '2022-12-20 13:00:00', ' Venta', 'Normal'),
(2, 'tt9362722', 3, '2022-12-23 15:00:00', 'Reserva', 'Estreno'),
(3, 'tt1877830', 7, '2022-12-26 17:30:00', 'Venta', 'Normal'),
(4, 'tt0499549', 1, '2022-12-30 20:00:00', 'Inhabilitado', 'Pre-Estreno');

-- --------------------------------------------------------

--
-- Table structure for table `salas`
--

CREATE TABLE `salas` (
  `id` int(11) NOT NULL,
  `numero_cine` int(11) NOT NULL,
  `cantidad_butacas` int(10) UNSIGNED NOT NULL,
  `nombre_sala` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salas`
--

INSERT INTO `salas` (`id`, `numero_cine`, `cantidad_butacas`, `nombre_sala`) VALUES
(1, 2, 45, 'Sala A1'),
(2, 2, 80, 'Sala A2'),
(3, 2, 50, 'Sala A3'),
(4, 2, 65, 'Sala A4'),
(5, 1, 30, 'Sala 1'),
(6, 1, 80, 'Sala 2'),
(7, 4, 70, 'Sala Turbo 1'),
(8, 4, 58, 'Sala Normal 1'),
(9, 3, 90, 'Sala C'),
(10, 3, 120, 'Sala D');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cines`
--
ALTER TABLE `cines`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_dni_encargado` (`fk_dni_encargado`);

--
-- Indexes for table `combos`
--
ALTER TABLE `combos`
  ADD PRIMARY KEY (`numCombo`);

--
-- Indexes for table `encargados`
--
ALTER TABLE `encargados`
  ADD PRIMARY KEY (`dni`);

--
-- Indexes for table `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`numero_venta`),
  ADD KEY `fk_numero_funcion` (`fk_numero_funcion`),
  ADD KEY `fk_numCombo` (`fk_numCombo`);

--
-- Indexes for table `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`imdbID`);

--
-- Indexes for table `programacion`
--
ALTER TABLE `programacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_pelicula` (`fk_id_pelicula`),
  ADD KEY `fk_numero_sala` (`fk_numero_sala`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_cine` (`numero_cine`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cines`
--
ALTER TABLE `cines`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `combos`
--
ALTER TABLE `combos`
  MODIFY `numCombo` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `entradas`
--
ALTER TABLE `entradas`
  MODIFY `numero_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `programacion`
--
ALTER TABLE `programacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `salas`
--
ALTER TABLE `salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cines`
--
ALTER TABLE `cines`
  ADD CONSTRAINT `encargado` FOREIGN KEY (`fk_dni_encargado`) REFERENCES `encargados` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `incluir` FOREIGN KEY (`fk_numCombo`) REFERENCES `combos` (`numCombo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vender` FOREIGN KEY (`fk_numero_funcion`) REFERENCES `programacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `programacion`
--
ALTER TABLE `programacion`
  ADD CONSTRAINT `proyectar` FOREIGN KEY (`fk_numero_sala`) REFERENCES `salas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reproducir` FOREIGN KEY (`fk_id_pelicula`) REFERENCES `peliculas` (`imdbID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `aloja` FOREIGN KEY (`numero_cine`) REFERENCES `cines` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
