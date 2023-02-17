-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2023 at 05:55 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

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

-- --------------------------------------------------------

--
-- Table structure for table `Cines`
--

CREATE TABLE `Cines` (
  `numero` int(11) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `nombre` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Cines`
--

INSERT INTO `Cines` (`numero`, `direccion`, `nombre`) VALUES
(1, 'Bravard 1300', 'Cinema Master Mall'),
(2, 'Alem 450', 'Cinema Master Alem'),
(3, 'Vieytes 102', 'Cine Vieytes '),
(4, 'Gorriti 2400', 'Cine Master Gorriti');

-- --------------------------------------------------------

--
-- Table structure for table `Combos`
--

CREATE TABLE `Combos` (
  `numCombo` int(5) NOT NULL,
  `gaseosas` int(2) NOT NULL,
  `pochoclos` int(2) DEFAULT NULL,
  `pochoclosGrandes` int(2) DEFAULT NULL,
  `nombreCombo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Entradas`
--

CREATE TABLE `Entradas` (
  `numero_venta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `precio` float NOT NULL,
  `cantidad_tickets` int(3) NOT NULL,
  `fk_numero_funcion` int(11) NOT NULL,
  `fk_numCombo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Entradas`
--

INSERT INTO `Entradas` (`numero_venta`, `fecha`, `tipo`, `precio`, `cantidad_tickets`, `fk_numero_funcion`, `fk_numCombo`) VALUES
(11, '2019-12-22 04:02:42', 'Jubilado', 500, 0, 1, NULL),
(20, '2019-12-22 04:08:14', 'Normal', 1000, 0, 1, NULL),
(21, '2019-12-22 04:12:10', 'Jubilado', 750, 3, 1, NULL),
(22, '2019-12-22 04:14:53', 'Jubilado', 750, 3, 1, NULL),
(23, '2019-12-22 04:16:17', 'Jubilado', 750, 3, 1, NULL),
(24, '2019-12-22 04:19:07', 'Jubilado', 750, 3, 1, NULL),
(25, '2019-12-22 04:19:21', 'Jubilado', 500, 2, 1, NULL),
(26, '2019-12-22 04:20:05', 'Jubilado', 500, 2, 1, NULL),
(27, '2019-12-22 04:21:25', 'Jubilado', 750, 3, 1, NULL),
(28, '2019-12-22 04:21:36', 'Jubilado', 750, 3, 1, NULL),
(29, '2019-12-22 04:22:56', 'Normal', 1500, 3, 1, NULL),
(30, '2019-12-22 04:35:55', 'Normal', 500, 1, 1, NULL),
(31, '2019-12-22 04:36:25', 'Jubilado', 1250, 5, 1, NULL),
(32, '2019-12-22 04:37:06', 'Jubilado', 750, 3, 1, NULL),
(33, '2019-12-22 04:37:32', 'Normal', 1500, 3, 1, NULL),
(34, '2019-12-22 06:56:29', 'Normal', 1000, 2, 2, NULL),
(35, '2019-12-22 06:59:49', 'Jubilado', 250, 1, 1, NULL),
(36, '2019-12-22 07:03:02', 'Normal', 500, 1, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Peliculas`
--

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
  `poster` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Peliculas`
--

INSERT INTO `Peliculas` (`imdbID`, `titulo`, `año`, `duracion`, `clasificacion`, `genero`, `director`, `actores`, `pais_origen`, `poster`) VALUES
('tt0372784', 'Batman Begins', '15 Jun 2005', '140 min', 'PG-13', 'Action, Crime, Drama', 'Christopher Nolan', 'Christian Bale, Michael Caine, Ken Watanabe', 'United States, United Kingdom', 'https://m.media-amazon.com/images/M/MV5BOTY4YjI2N2MtYmFlMC00ZjcyLTg3YjEtMDQyM2ZjYzQ5YWFkXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg'),
('tt0499549', 'Avatar', '18 Dec 2009', '180 min', 'PG-13', 'Action, Adventure, Fantasy', 'James Cameron', 'Sam Worthington, Zoe Saldana, Sigourney Weaver', 'United States', 'https://m.media-amazon.com/images/M/MV5BNjA3NGExZDktNDlhZC00NjYyLTgwNmUtZWUzMDYwMTZjZWUyXkEyXkFqcGdeQXVyMTU1MDM3NDk0._V1_SX300.jpg'),
('tt1877830', 'The Batman', '04 Mar 2022', '176 min', 'PG-13', 'Action, Crime, Drama', 'Matt Reeves', 'Robert Pattinson, Zoë Kravitz, Jeffrey Wright', 'United States', 'https://m.media-amazon.com/images/M/MV5BMDdmMTBiNTYtMDIzNi00NGVlLWIzMDYtZTk3MTQ3NGQxZGEwXkEyXkFqcGdeQXVyMzMwOTU5MDk@._V1_SX300.jpg'),
('tt2250912', 'Spider-Man: Homecoming', '07 Jul 2017', '133 min', 'PG-13', 'Action, Adventure, Sci-Fi', 'Jon Watts', 'Tom Holland, Michael Keaton, Robert Downey Jr.', 'United States', 'https://m.media-amazon.com/images/M/MV5BNTk4ODQ1MzgzNl5BMl5BanBnXkFtZTgwMTMyMzM4MTI@._V1_SX300.jpg'),
('tt4116284', 'The Lego Batman Movie', '10 Feb 2017', '104 min', 'PG', 'Animation, Action, Adventure', 'Chris McKay', 'Will Arnett, Michael Cera, Rosario Dawson', 'United States, Denmark, Australia', 'https://m.media-amazon.com/images/M/MV5BMTcyNTEyOTY0M15BMl5BanBnXkFtZTgwOTAyNzU3MDI@._V1_SX300.jpg'),
('tt9362722', 'Spider-Man: Across the Spider-Verse', '02 Jun 2023', '2HS', 'PG-13', 'Animation, Action, Adventure', 'Joaquim Dos Santos, Kemp Powers, Justin K. Thompson', 'Shameik Moore, Hailee Steinfeld, Oscar Isaac', 'United States', 'https://m.media-amazon.com/images/M/MV5BZGRhNDE1YjYtOGUzMC00YjliLThiOTgtYTkwNmQwNDZjYjFhXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_SX300.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Programacion`
--

CREATE TABLE `Programacion` (
  `id` int(11) NOT NULL,
  `fk_id_pelicula` varchar(45) NOT NULL,
  `fk_numero_sala` int(11) NOT NULL,
  `horario` datetime NOT NULL,
  `estado` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Programacion`
--

INSERT INTO `Programacion` (`id`, `fk_id_pelicula`, `fk_numero_sala`, `horario`, `estado`, `tipo`) VALUES
(1, 'tt0499549', 3, '2022-12-20 13:00:00', ' Venta', 'Normal'),
(2, 'tt9362722', 3, '2022-12-23 15:00:00', 'Reserva', 'Estreno'),
(3, 'tt1877830', 7, '2022-12-26 17:30:00', 'Venta', 'Normal'),
(4, 'tt0499549', 1, '2022-12-30 20:00:00', 'Inhabilitado', 'Pre-Estreno');

-- --------------------------------------------------------

--
-- Table structure for table `Salas`
--

CREATE TABLE `Salas` (
  `id` int(11) NOT NULL,
  `numero_cine` int(11) NOT NULL,
  `cantidad_butacas` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Salas`
--

INSERT INTO `Salas` (`id`, `numero_cine`, `cantidad_butacas`) VALUES
(1, 2, 45),
(2, 2, 80),
(3, 2, 50),
(4, 2, 65),
(5, 1, 30),
(6, 1, 80),
(7, 4, 70),
(8, 4, 58),
(9, 3, 90),
(10, 3, 120);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cines`
--
ALTER TABLE `Cines`
  ADD PRIMARY KEY (`numero`);

--
-- Indexes for table `Combos`
--
ALTER TABLE `Combos`
  ADD PRIMARY KEY (`numCombo`);

--
-- Indexes for table `Entradas`
--
ALTER TABLE `Entradas`
  ADD PRIMARY KEY (`numero_venta`),
  ADD KEY `fk_numero_funcion` (`fk_numero_funcion`),
  ADD KEY `fk_numCombo` (`fk_numCombo`);

--
-- Indexes for table `Peliculas`
--
ALTER TABLE `Peliculas`
  ADD PRIMARY KEY (`imdbID`);

--
-- Indexes for table `Programacion`
--
ALTER TABLE `Programacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_pelicula` (`fk_id_pelicula`),
  ADD KEY `fk_numero_sala` (`fk_numero_sala`);

--
-- Indexes for table `Salas`
--
ALTER TABLE `Salas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `numero_cine` (`numero_cine`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cines`
--
ALTER TABLE `Cines`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Combos`
--
ALTER TABLE `Combos`
  MODIFY `numCombo` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Entradas`
--
ALTER TABLE `Entradas`
  MODIFY `numero_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `Programacion`
--
ALTER TABLE `Programacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Salas`
--
ALTER TABLE `Salas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Entradas`
--
ALTER TABLE `Entradas`
  ADD CONSTRAINT `incluir` FOREIGN KEY (`fk_numCombo`) REFERENCES `Combos` (`numCombo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vender` FOREIGN KEY (`fk_numero_funcion`) REFERENCES `Programacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Programacion`
--
ALTER TABLE `Programacion`
  ADD CONSTRAINT `proyectar` FOREIGN KEY (`fk_numero_sala`) REFERENCES `Salas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reproducir` FOREIGN KEY (`fk_id_pelicula`) REFERENCES `Peliculas` (`imdbID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Salas`
--
ALTER TABLE `Salas`
  ADD CONSTRAINT `aloja` FOREIGN KEY (`numero_cine`) REFERENCES `Cines` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
