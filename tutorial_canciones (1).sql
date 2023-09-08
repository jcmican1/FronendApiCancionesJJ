-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 08-09-2023 a las 16:25:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tutorial_canciones`
--

-- --------------------------------------------------------
create database tutorial_canciones;
use tutorial_canciones;
--
-- Estructura de tabla para la tabla `album`
--

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `anio` int(11) DEFAULT NULL,
  `descripcion` varchar(128) DEFAULT NULL,
  `medio` enum('DISCO','CASETE','CD') DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `album`
--

INSERT INTO `album` (`id`, `titulo`, `anio`, `descripcion`, `medio`, `usuario`) VALUES
(1, 'Álbum 1', 2020, 'Descripción del Álbum 1', 'CD', 1),
(2, 'Álbum 2', 2021, 'Descripción del Álbum 2', 'DISCO', 1),
(3, 'Álbum 3', 2019, 'Descripción del Álbum 3', 'CASETE', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `album_cancion`
--

CREATE TABLE `album_cancion` (
  `album_id` int(11) NOT NULL,
  `cancion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `album_cancion`
--

INSERT INTO `album_cancion` (`album_id`, `cancion_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cancion`
--

CREATE TABLE `cancion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) DEFAULT NULL,
  `minutos` int(11) DEFAULT NULL,
  `segundos` int(11) DEFAULT NULL,
  `interprete` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cancion`
--

INSERT INTO `cancion` (`id`, `titulo`, `minutos`, `segundos`, `interprete`) VALUES
(1, 'Canción 1', 3, 45, 'Interprete 1'),
(2, 'Canción 2', 4, 30, 'Interprete 2'),
(3, 'Canción 3', 2, 55, 'Interprete 1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `tablename` varchar(128) DEFAULT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `contrasena` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `tablename`, `nombre`, `contrasena`) VALUES
(1, 'usuario1', 'NombreUsuario1', 'Contraseña1'),
(2, 'usuario2', 'NombreUsuario2', 'Contraseña2');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo_unico_album` (`usuario`,`titulo`);

--
-- Indices de la tabla `album_cancion`
--
ALTER TABLE `album_cancion`
  ADD PRIMARY KEY (`album_id`,`cancion_id`),
  ADD KEY `cancion_id` (`cancion_id`);

--
-- Indices de la tabla `cancion`
--
ALTER TABLE `cancion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cancion`
--
ALTER TABLE `cancion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
