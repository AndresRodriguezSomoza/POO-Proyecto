-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2025 a las 04:44:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `amigosdedonbosco`
--
CREATE DATABASE IF NOT EXISTS `amigosdedonbosco` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `amigosdedonbosco`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cd`
--

CREATE TABLE `cd` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `artista` varchar(150) NOT NULL,
  `discografia` varchar(150) NOT NULL,
  `year` varchar(50) NOT NULL,
  `genero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cd`
--

INSERT INTO `cd` (`id`, `cdidentificacion`, `stock`, `titulo`, `artista`, `discografia`, `year`, `genero`) VALUES
(1, 'CDA86454', 5, 'Beat it', 'Michael Jackson', 'Epic Records', '1982', 'POP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(75) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `autor` varchar(120) NOT NULL,
  `editorial` varchar(120) NOT NULL,
  `numpag` int(11) NOT NULL,
  `year` varchar(20) NOT NULL,
  `categoria` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id`, `cdidentificacion`, `stock`, `titulo`, `autor`, `editorial`, `numpag`, `year`, `categoria`) VALUES
(3, 'LIB10007', 3, 'Cien años de soledad', 'Gabriel García Márquez', 'Penguin Random House', 471, '1967', 'Realismo magico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obra`
--

CREATE TABLE `obra` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(75) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `autor` varchar(120) NOT NULL,
  `editorial` varchar(120) NOT NULL,
  `year` varchar(50) NOT NULL,
  `genero` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `obra`
--

INSERT INTO `obra` (`id`, `cdidentificacion`, `stock`, `titulo`, `autor`, `editorial`, `year`, `genero`) VALUES
(1, 'OBR85412', 2, 'La Odisea', 'Homero', 'Gredos', '2016', 'Epico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patentes`
--

CREATE TABLE `patentes` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `inventor` varchar(150) NOT NULL,
  `titular` varchar(150) NOT NULL,
  `fecha_registro` int(11) NOT NULL,
  `pais` varchar(100) NOT NULL,
  `patente` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `patentes`
--

INSERT INTO `patentes` (`id`, `cdidentificacion`, `stock`, `titulo`, `inventor`, `titular`, `fecha_registro`, `pais`, `patente`) VALUES
(2, 'PAT87063', 1, 'Sistema de Purificación de Agua con Energía Solar', 'María González', 'EcoTec Solutions', 2024, 'Mexico', 'MX/a/2024/000123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revista`
--

CREATE TABLE `revista` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `editorial` varchar(150) NOT NULL,
  `edicion` int(11) NOT NULL,
  `year` varchar(50) NOT NULL,
  `periocidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `revista`
--

INSERT INTO `revista` (`id`, `cdidentificacion`, `stock`, `titulo`, `editorial`, `edicion`, `year`, `periocidad`) VALUES
(2, 'REV95051', 5, 'Club Nintendo', 'Nintendo', 1, '2018', 'Videojuegos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tesis`
--

CREATE TABLE `tesis` (
  `id` int(11) NOT NULL,
  `cdidentificacion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `titulo` varchar(120) NOT NULL,
  `autor` varchar(120) NOT NULL,
  `director` varchar(120) NOT NULL,
  `institucion` varchar(150) NOT NULL,
  `year` varchar(75) NOT NULL,
  `gradoacademico` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tesis`
--

INSERT INTO `tesis` (`id`, `cdidentificacion`, `stock`, `titulo`, `autor`, `director`, `institucion`, `year`, `gradoacademico`) VALUES
(1, 'TES96388', 4, 'Desarrollo de algoritmos', 'Ana Laura', 'Dr. Roberto Carlos', 'Universidad', '2024', 'Maestria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cd`
--
ALTER TABLE `cd`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `patentes`
--
ALTER TABLE `patentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `revista`
--
ALTER TABLE `revista`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tesis`
--
ALTER TABLE `tesis`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cd`
--
ALTER TABLE `cd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `obra`
--
ALTER TABLE `obra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `patentes`
--
ALTER TABLE `patentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `revista`
--
ALTER TABLE `revista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tesis`
--
ALTER TABLE `tesis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
