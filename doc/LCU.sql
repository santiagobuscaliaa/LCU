-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-02-2026 a las 21:28:40
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `LCU`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `butaca`
--

CREATE TABLE `butaca` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `butaca` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `butaca`
--

INSERT INTO `butaca` (`id`, `id_ticket`, `butaca`) VALUES
(1, 1, 'A5'),
(2, 1, 'C2'),
(3, 1, 'F9'),
(4, 2, 'J3'),
(5, 2, 'H11'),
(6, 2, 'B6'),
(7, 3, 'D4'),
(8, 3, 'A1'),
(9, 3, 'G7'),
(10, 3, 'E8'),
(11, 4, 'I10'),
(12, 4, 'C3'),
(13, 4, 'C4'),
(14, 5, 'B1'),
(15, 5, 'B2'),
(16, 5, 'B9'),
(17, 5, 'J12'),
(18, 6, 'E2'),
(19, 6, 'G10'),
(20, 6, 'H1'),
(21, 7, 'A12'),
(22, 7, 'D7'),
(23, 7, 'F3'),
(24, 8, 'I6'),
(25, 8, 'E11'),
(26, 8, 'G2'),
(27, 8, 'A7'),
(28, 9, 'J8'),
(29, 9, 'C10'),
(30, 9, 'H4'),
(31, 10, 'F12'),
(32, 10, 'D2'),
(33, 10, 'B7'),
(34, 10, 'I3'),
(35, 11, 'E6'),
(36, 11, 'A3'),
(37, 11, 'J1'),
(38, 12, 'H9'),
(39, 12, 'G5'),
(40, 12, 'D11'),
(41, 12, 'C7'),
(42, 13, 'B10'),
(43, 13, 'I1'),
(44, 13, 'F4'),
(45, 14, 'A9'),
(46, 14, 'E5'),
(47, 14, 'J10'),
(48, 15, 'C1'),
(49, 15, 'H2'),
(50, 15, 'D8'),
(51, 15, 'G12'),
(52, 16, 'I8'),
(53, 16, 'F7'),
(54, 16, 'B3'),
(55, 17, 'J5'),
(56, 17, 'A6'),
(57, 17, 'E1'),
(58, 18, 'G9'),
(59, 18, 'D5'),
(60, 18, 'I2'),
(61, 18, 'B11'),
(62, 19, 'H7'),
(63, 19, 'C6'),
(64, 19, 'F2'),
(65, 20, 'A10'),
(66, 20, 'J7'),
(67, 20, 'E9'),
(68, 21, 'D1'),
(69, 21, 'G3'),
(70, 21, 'I12'),
(71, 21, 'B4'),
(72, 22, 'H10'),
(73, 22, 'C12'),
(74, 22, 'A2'),
(75, 31, 'F1'),
(76, 32, 'C3,C4'),
(77, 33, 'A2'),
(78, 34, 'A5'),
(79, 35, 'A3'),
(80, 36, 'D3'),
(81, 37, 'F2'),
(82, 38, 'A3'),
(83, 39, 'B5'),
(84, 40, 'C4'),
(85, 41, 'C4'),
(86, 42, 'E4'),
(87, 43, 'D6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candy`
--

CREATE TABLE `candy` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` varchar(15) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoría` enum('Pochoclos','Bebidas','Snacks','Combos','Otros') NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `tamaño` varchar(20) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `candy`
--

INSERT INTO `candy` (`id`, `nombre`, `precio`, `stock`, `categoría`, `tipo`, `tamaño`, `imagen`) VALUES
(1, 'Pochoclos Dulces Chico', '6000', 50, 'Pochoclos', 'Dulces', 'Chico', '-pocho.jpg'),
(2, 'Pochoclos Dulces Mediano', '8000', 50, 'Pochoclos', 'Dulces', 'Mediano', '-pocho.jpg'),
(3, 'Pochoclos Dulces Grande', '10000', 50, 'Pochoclos', 'Dulces', 'Grande', '-pocho.jpg'),
(4, 'Pochoclos Salados Chico', '6000', 50, 'Pochoclos', 'Salados', 'Chico', '-pocho.jpg'),
(5, 'Pochoclos Salados Mediano', '8000', 50, 'Pochoclos', 'Salados', 'Mediano', '-pocho.jpg'),
(6, 'Pochoclos Salados Grande', '10000', 50, 'Pochoclos', 'Salados', 'Grande', '-pocho.jpg'),
(7, 'Coca Cola Chica', '4000', 50, 'Bebidas', 'Coca', 'Chico', '-bebi.jpg'),
(8, 'Coca Cola Mediana', '5500', 50, 'Bebidas', 'Coca', 'Mediano', '-bebi.jpg'),
(9, 'Coca Cola Grande', '7000', 50, 'Bebidas', 'Coca', 'Grande', '-bebi.jpg'),
(10, 'Sprite Chica', '4000', 50, 'Bebidas', 'Sprite', 'Chico', '-bebi.jpg'),
(11, 'Sprite Mediana', '5500', 50, 'Bebidas', 'Sprite', 'Mediano', '-bebi.jpg'),
(12, 'Sprite Grande', '7000', 50, 'Bebidas', 'Sprite', 'Grande', '-bebi.jpg'),
(13, 'Agua Mineral', '3000', 50, 'Bebidas', 'Agua', 'Único', '-bebi.jpg'),
(14, 'Lays Chicas', '3000', 50, 'Snacks', 'Papas', 'Chico', '-snacks.webp'),
(15, 'Lays Grandes', '5000', 50, 'Snacks', 'Papas', 'Grande', '-snacks.webp'),
(16, 'Nachos Chicos', '4500', 50, 'Snacks', 'Nachos', 'Chico', '-snacks.webp'),
(17, 'Nachos Grandes', '7000', 50, 'Snacks', 'Nachos', 'Grande', '-snacks.webp'),
(18, 'Chocolate', '3500', 50, 'Snacks', 'Chocolate', 'Único', '-snacks.webp'),
(19, 'Combo 1 Chico', '10000', 30, 'Combos', 'Pochoclo + Bebida', 'Chico', '-combos.jpg'),
(20, 'Combo 1 Grande', '14000', 30, 'Combos', 'Pochoclo + Bebida', 'Grande', '-combos.jpg'),
(21, 'Combo 2 Chico', '13000', 30, 'Combos', 'Pochoclo + Bebida + Snack', 'Chico', '-combos.jpg'),
(22, 'Combo 2 Grande', '18000', 30, 'Combos', 'Pochoclo + Bebida + Snack', 'Grande', '-combos.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_candy`
--

CREATE TABLE `compra_candy` (
  `id` int(11) NOT NULL,
  `id_resumen` int(11) NOT NULL,
  `id_candy` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra_candy`
--

INSERT INTO `compra_candy` (`id`, `id_resumen`, `id_candy`, `cantidad`, `precio`) VALUES
(1, 23, 13, 1, 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id` int(11) NOT NULL,
  `horario` enum('10:00','12:00','14:00','16:00','18:00','20:00','21:00','22:00') NOT NULL,
  `dia` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  `id_formato` int(11) NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `funcion`
--

INSERT INTO `funcion` (`id`, `horario`, `dia`, `id_formato`, `id_pelicula`, `id_sala`) VALUES
(1, '10:00', 'Lunes', 1, 1, 1),
(2, '14:00', 'Lunes', 1, 1, 1),
(3, '18:00', 'Lunes', 2, 1, 1),
(4, '10:00', 'Martes', 1, 1, 1),
(5, '14:00', 'Martes', 1, 1, 1),
(6, '18:00', 'Martes', 2, 1, 1),
(7, '10:00', 'Miércoles', 1, 1, 1),
(8, '14:00', 'Miércoles', 1, 1, 1),
(9, '18:00', 'Miércoles', 2, 1, 1),
(10, '10:00', 'Jueves', 1, 1, 1),
(11, '14:00', 'Jueves', 1, 1, 1),
(12, '18:00', 'Jueves', 2, 1, 1),
(13, '10:00', 'Viernes', 1, 1, 1),
(14, '14:00', 'Viernes', 1, 1, 1),
(15, '18:00', 'Viernes', 2, 1, 1),
(16, '10:00', 'Sábado', 1, 1, 1),
(17, '14:00', 'Sábado', 1, 1, 1),
(18, '18:00', 'Sábado', 2, 1, 1),
(19, '10:00', 'Domingo', 1, 1, 1),
(20, '14:00', 'Domingo', 1, 1, 1),
(21, '18:00', 'Domingo', 2, 1, 1),
(22, '12:00', 'Lunes', 1, 2, 1),
(23, '16:00', 'Lunes', 1, 2, 1),
(24, '20:00', 'Lunes', 2, 2, 1),
(25, '12:00', 'Martes', 1, 2, 1),
(26, '16:00', 'Martes', 1, 2, 1),
(27, '20:00', 'Martes', 2, 2, 1),
(28, '12:00', 'Miércoles', 1, 2, 1),
(29, '16:00', 'Miércoles', 1, 2, 1),
(30, '20:00', 'Miércoles', 2, 2, 1),
(31, '12:00', 'Jueves', 1, 2, 1),
(32, '16:00', 'Jueves', 1, 2, 1),
(33, '20:00', 'Jueves', 2, 2, 1),
(34, '12:00', 'Viernes', 1, 2, 1),
(35, '16:00', 'Viernes', 1, 2, 1),
(36, '20:00', 'Viernes', 2, 2, 1),
(37, '12:00', 'Sábado', 1, 2, 1),
(38, '16:00', 'Sábado', 1, 2, 1),
(39, '20:00', 'Sábado', 2, 2, 1),
(40, '12:00', 'Domingo', 1, 2, 1),
(41, '16:00', 'Domingo', 1, 2, 1),
(42, '20:00', 'Domingo', 2, 2, 1),
(43, '10:00', 'Lunes', 1, 3, 1),
(44, '16:00', 'Lunes', 1, 3, 1),
(45, '21:00', 'Lunes', 2, 3, 1),
(46, '10:00', 'Martes', 1, 3, 1),
(47, '16:00', 'Martes', 1, 3, 1),
(48, '21:00', 'Martes', 2, 3, 1),
(49, '10:00', 'Miércoles', 1, 3, 1),
(50, '16:00', 'Miércoles', 1, 3, 1),
(51, '21:00', 'Miércoles', 2, 3, 1),
(52, '10:00', 'Jueves', 1, 3, 1),
(53, '16:00', 'Jueves', 1, 3, 1),
(54, '21:00', 'Jueves', 2, 3, 1),
(55, '10:00', 'Viernes', 1, 3, 1),
(56, '16:00', 'Viernes', 1, 3, 1),
(57, '21:00', 'Viernes', 2, 3, 1),
(58, '10:00', 'Sábado', 1, 3, 1),
(59, '16:00', 'Sábado', 1, 3, 1),
(60, '21:00', 'Sábado', 2, 3, 1),
(61, '10:00', 'Domingo', 1, 3, 1),
(62, '16:00', 'Domingo', 1, 3, 1),
(63, '21:00', 'Domingo', 2, 3, 1),
(64, '12:00', 'Lunes', 1, 4, 1),
(65, '18:00', 'Lunes', 1, 4, 1),
(66, '22:00', 'Lunes', 2, 4, 1),
(67, '12:00', 'Martes', 1, 4, 1),
(68, '18:00', 'Martes', 1, 4, 1),
(69, '22:00', 'Martes', 2, 4, 1),
(70, '12:00', 'Miércoles', 1, 4, 1),
(71, '18:00', 'Miércoles', 1, 4, 1),
(72, '22:00', 'Miércoles', 2, 4, 1),
(73, '12:00', 'Jueves', 1, 4, 1),
(74, '18:00', 'Jueves', 1, 4, 1),
(75, '22:00', 'Jueves', 2, 4, 1),
(76, '12:00', 'Viernes', 1, 4, 1),
(77, '18:00', 'Viernes', 1, 4, 1),
(78, '22:00', 'Viernes', 2, 4, 1),
(79, '12:00', 'Sábado', 1, 4, 1),
(80, '18:00', 'Sábado', 1, 4, 1),
(81, '22:00', 'Sábado', 2, 4, 1),
(82, '12:00', 'Domingo', 1, 4, 1),
(83, '18:00', 'Domingo', 1, 4, 1),
(84, '22:00', 'Domingo', 2, 4, 1),
(85, '14:00', 'Lunes', 1, 5, 1),
(86, '20:00', 'Lunes', 1, 5, 1),
(87, '22:00', 'Lunes', 2, 5, 1),
(88, '14:00', 'Martes', 1, 5, 1),
(89, '20:00', 'Martes', 1, 5, 1),
(90, '22:00', 'Martes', 2, 5, 1),
(91, '14:00', 'Miércoles', 1, 5, 1),
(92, '20:00', 'Miércoles', 1, 5, 1),
(93, '22:00', 'Miércoles', 2, 5, 1),
(94, '14:00', 'Jueves', 1, 5, 1),
(95, '20:00', 'Jueves', 1, 5, 1),
(96, '22:00', 'Jueves', 2, 5, 1),
(97, '14:00', 'Viernes', 1, 5, 1),
(98, '20:00', 'Viernes', 1, 5, 1),
(99, '22:00', 'Viernes', 2, 5, 1),
(100, '14:00', 'Sábado', 1, 5, 1),
(101, '20:00', 'Sábado', 1, 5, 1),
(102, '22:00', 'Sábado', 2, 5, 1),
(103, '14:00', 'Domingo', 1, 5, 1),
(104, '20:00', 'Domingo', 1, 5, 1),
(105, '22:00', 'Domingo', 2, 5, 1),
(106, '10:00', 'Lunes', 1, 6, 2),
(107, '14:00', 'Lunes', 1, 6, 2),
(108, '18:00', 'Lunes', 2, 6, 2),
(109, '10:00', 'Martes', 1, 6, 2),
(110, '14:00', 'Martes', 1, 6, 2),
(111, '18:00', 'Martes', 2, 6, 2),
(112, '10:00', 'Miércoles', 1, 6, 2),
(113, '14:00', 'Miércoles', 1, 6, 2),
(114, '18:00', 'Miércoles', 2, 6, 2),
(115, '10:00', 'Jueves', 1, 6, 2),
(116, '14:00', 'Jueves', 1, 6, 2),
(117, '18:00', 'Jueves', 2, 6, 2),
(118, '10:00', 'Viernes', 1, 6, 2),
(119, '14:00', 'Viernes', 1, 6, 2),
(120, '18:00', 'Viernes', 2, 6, 2),
(121, '10:00', 'Sábado', 1, 6, 2),
(122, '14:00', 'Sábado', 1, 6, 2),
(123, '18:00', 'Sábado', 2, 6, 2),
(124, '10:00', 'Domingo', 1, 6, 2),
(125, '14:00', 'Domingo', 1, 6, 2),
(126, '18:00', 'Domingo', 2, 6, 2),
(127, '12:00', 'Lunes', 1, 7, 2),
(128, '16:00', 'Lunes', 1, 7, 2),
(129, '20:00', 'Lunes', 2, 7, 2),
(130, '12:00', 'Martes', 1, 7, 2),
(131, '16:00', 'Martes', 1, 7, 2),
(132, '20:00', 'Martes', 2, 7, 2),
(133, '12:00', 'Miércoles', 1, 7, 2),
(134, '16:00', 'Miércoles', 1, 7, 2),
(135, '20:00', 'Miércoles', 2, 7, 2),
(136, '12:00', 'Jueves', 1, 7, 2),
(137, '16:00', 'Jueves', 1, 7, 2),
(138, '20:00', 'Jueves', 2, 7, 2),
(139, '12:00', 'Viernes', 1, 7, 2),
(140, '16:00', 'Viernes', 1, 7, 2),
(141, '20:00', 'Viernes', 2, 7, 2),
(142, '12:00', 'Sábado', 1, 7, 2),
(143, '16:00', 'Sábado', 1, 7, 2),
(144, '20:00', 'Sábado', 2, 7, 2),
(145, '12:00', 'Domingo', 1, 7, 2),
(146, '16:00', 'Domingo', 1, 7, 2),
(147, '20:00', 'Domingo', 2, 7, 2),
(148, '10:00', 'Lunes', 1, 8, 2),
(149, '16:00', 'Lunes', 1, 8, 2),
(150, '21:00', 'Lunes', 2, 8, 2),
(151, '10:00', 'Martes', 1, 8, 2),
(152, '16:00', 'Martes', 1, 8, 2),
(153, '21:00', 'Martes', 2, 8, 2),
(154, '10:00', 'Miércoles', 1, 8, 2),
(155, '16:00', 'Miércoles', 1, 8, 2),
(156, '21:00', 'Miércoles', 2, 8, 2),
(157, '10:00', 'Jueves', 1, 8, 2),
(158, '16:00', 'Jueves', 1, 8, 2),
(159, '21:00', 'Jueves', 2, 8, 2),
(160, '10:00', 'Viernes', 1, 8, 2),
(161, '16:00', 'Viernes', 1, 8, 2),
(162, '21:00', 'Viernes', 2, 8, 2),
(163, '10:00', 'Sábado', 1, 8, 2),
(164, '16:00', 'Sábado', 1, 8, 2),
(165, '21:00', 'Sábado', 2, 8, 2),
(166, '10:00', 'Domingo', 1, 8, 2),
(167, '16:00', 'Domingo', 1, 8, 2),
(168, '21:00', 'Domingo', 2, 8, 2),
(169, '12:00', 'Lunes', 1, 9, 2),
(170, '18:00', 'Lunes', 1, 9, 2),
(171, '22:00', 'Lunes', 2, 9, 2),
(172, '12:00', 'Martes', 1, 9, 2),
(173, '18:00', 'Martes', 1, 9, 2),
(174, '22:00', 'Martes', 2, 9, 2),
(175, '12:00', 'Miércoles', 1, 9, 2),
(176, '18:00', 'Miércoles', 1, 9, 2),
(177, '22:00', 'Miércoles', 2, 9, 2),
(178, '12:00', 'Jueves', 1, 9, 2),
(179, '18:00', 'Jueves', 1, 9, 2),
(180, '22:00', 'Jueves', 2, 9, 2),
(181, '12:00', 'Viernes', 1, 9, 2),
(182, '18:00', 'Viernes', 1, 9, 2),
(183, '22:00', 'Viernes', 2, 9, 2),
(184, '12:00', 'Sábado', 1, 9, 2),
(185, '18:00', 'Sábado', 1, 9, 2),
(186, '22:00', 'Sábado', 2, 9, 2),
(187, '12:00', 'Domingo', 1, 9, 2),
(188, '18:00', 'Domingo', 1, 9, 2),
(189, '22:00', 'Domingo', 2, 9, 2),
(190, '14:00', 'Lunes', 1, 10, 2),
(191, '20:00', 'Lunes', 1, 10, 2),
(192, '22:00', 'Lunes', 2, 10, 2),
(193, '14:00', 'Martes', 1, 10, 2),
(194, '20:00', 'Martes', 1, 10, 2),
(195, '22:00', 'Martes', 2, 10, 2),
(196, '14:00', 'Miércoles', 1, 10, 2),
(197, '20:00', 'Miércoles', 1, 10, 2),
(198, '22:00', 'Miércoles', 2, 10, 2),
(199, '14:00', 'Jueves', 1, 10, 2),
(200, '20:00', 'Jueves', 1, 10, 2),
(201, '22:00', 'Jueves', 2, 10, 2),
(202, '14:00', 'Viernes', 1, 10, 2),
(203, '20:00', 'Viernes', 1, 10, 2),
(204, '22:00', 'Viernes', 2, 10, 2),
(205, '14:00', 'Sábado', 1, 10, 2),
(206, '20:00', 'Sábado', 1, 10, 2),
(207, '22:00', 'Sábado', 2, 10, 2),
(208, '14:00', 'Domingo', 1, 10, 2),
(209, '20:00', 'Domingo', 1, 10, 2),
(210, '22:00', 'Domingo', 2, 10, 2),
(211, '10:00', 'Lunes', 1, 11, 3),
(212, '14:00', 'Lunes', 1, 11, 3),
(213, '18:00', 'Lunes', 2, 11, 3),
(214, '10:00', 'Martes', 1, 11, 3),
(215, '14:00', 'Martes', 1, 11, 3),
(216, '18:00', 'Martes', 2, 11, 3),
(217, '10:00', 'Miércoles', 1, 11, 3),
(218, '14:00', 'Miércoles', 1, 11, 3),
(219, '18:00', 'Miércoles', 2, 11, 3),
(220, '10:00', 'Jueves', 1, 11, 3),
(221, '14:00', 'Jueves', 1, 11, 3),
(222, '18:00', 'Jueves', 2, 11, 3),
(223, '10:00', 'Viernes', 1, 11, 3),
(224, '14:00', 'Viernes', 1, 11, 3),
(225, '18:00', 'Viernes', 2, 11, 3),
(226, '10:00', 'Sábado', 1, 11, 3),
(227, '14:00', 'Sábado', 1, 11, 3),
(228, '18:00', 'Sábado', 2, 11, 3),
(229, '10:00', 'Domingo', 1, 11, 3),
(230, '14:00', 'Domingo', 1, 11, 3),
(231, '18:00', 'Domingo', 2, 11, 3),
(232, '12:00', 'Lunes', 1, 12, 3),
(233, '16:00', 'Lunes', 1, 12, 3),
(234, '20:00', 'Lunes', 2, 12, 3),
(235, '12:00', 'Martes', 1, 12, 3),
(236, '16:00', 'Martes', 1, 12, 3),
(237, '20:00', 'Martes', 2, 12, 3),
(238, '12:00', 'Miércoles', 1, 12, 3),
(239, '16:00', 'Miércoles', 1, 12, 3),
(240, '20:00', 'Miércoles', 2, 12, 3),
(241, '12:00', 'Jueves', 1, 12, 3),
(242, '16:00', 'Jueves', 1, 12, 3),
(243, '20:00', 'Jueves', 2, 12, 3),
(244, '12:00', 'Viernes', 1, 12, 3),
(245, '16:00', 'Viernes', 1, 12, 3),
(246, '20:00', 'Viernes', 2, 12, 3),
(247, '12:00', 'Sábado', 1, 12, 3),
(248, '16:00', 'Sábado', 1, 12, 3),
(249, '20:00', 'Sábado', 2, 12, 3),
(250, '12:00', 'Domingo', 1, 12, 3),
(251, '16:00', 'Domingo', 1, 12, 3),
(252, '20:00', 'Domingo', 2, 12, 3),
(253, '10:00', 'Lunes', 1, 13, 3),
(254, '16:00', 'Lunes', 1, 13, 3),
(255, '21:00', 'Lunes', 2, 13, 3),
(256, '10:00', 'Martes', 1, 13, 3),
(257, '16:00', 'Martes', 1, 13, 3),
(258, '21:00', 'Martes', 2, 13, 3),
(259, '10:00', 'Miércoles', 1, 13, 3),
(260, '16:00', 'Miércoles', 1, 13, 3),
(261, '21:00', 'Miércoles', 2, 13, 3),
(262, '10:00', 'Jueves', 1, 13, 3),
(263, '16:00', 'Jueves', 1, 13, 3),
(264, '21:00', 'Jueves', 2, 13, 3),
(265, '10:00', 'Viernes', 1, 13, 3),
(266, '16:00', 'Viernes', 1, 13, 3),
(267, '21:00', 'Viernes', 2, 13, 3),
(268, '10:00', 'Sábado', 1, 13, 3),
(269, '16:00', 'Sábado', 1, 13, 3),
(270, '21:00', 'Sábado', 2, 13, 3),
(271, '10:00', 'Domingo', 1, 13, 3),
(272, '16:00', 'Domingo', 1, 13, 3),
(273, '21:00', 'Domingo', 2, 13, 3),
(274, '12:00', 'Lunes', 1, 14, 3),
(275, '18:00', 'Lunes', 1, 14, 3),
(276, '22:00', 'Lunes', 2, 14, 3),
(277, '12:00', 'Martes', 1, 14, 3),
(278, '18:00', 'Martes', 1, 14, 3),
(279, '22:00', 'Martes', 2, 14, 3),
(280, '12:00', 'Miércoles', 1, 14, 3),
(281, '18:00', 'Miércoles', 1, 14, 3),
(282, '22:00', 'Miércoles', 2, 14, 3),
(283, '12:00', 'Jueves', 1, 14, 3),
(284, '18:00', 'Jueves', 1, 14, 3),
(285, '22:00', 'Jueves', 2, 14, 3),
(286, '12:00', 'Viernes', 1, 14, 3),
(287, '18:00', 'Viernes', 1, 14, 3),
(288, '22:00', 'Viernes', 2, 14, 3),
(289, '12:00', 'Sábado', 1, 14, 3),
(290, '18:00', 'Sábado', 1, 14, 3),
(291, '22:00', 'Sábado', 2, 14, 3),
(292, '12:00', 'Domingo', 1, 14, 3),
(293, '18:00', 'Domingo', 1, 14, 3),
(294, '22:00', 'Domingo', 2, 14, 3),
(295, '14:00', 'Lunes', 1, 15, 3),
(296, '20:00', 'Lunes', 1, 15, 3),
(297, '22:00', 'Lunes', 2, 15, 3),
(298, '14:00', 'Martes', 1, 15, 3),
(299, '20:00', 'Martes', 1, 15, 3),
(300, '22:00', 'Martes', 2, 15, 3),
(301, '14:00', 'Miércoles', 1, 15, 3),
(302, '20:00', 'Miércoles', 1, 15, 3),
(303, '22:00', 'Miércoles', 2, 15, 3),
(304, '14:00', 'Jueves', 1, 15, 3),
(305, '20:00', 'Jueves', 1, 15, 3),
(306, '22:00', 'Jueves', 2, 15, 3),
(307, '14:00', 'Viernes', 1, 15, 3),
(308, '20:00', 'Viernes', 1, 15, 3),
(309, '22:00', 'Viernes', 2, 15, 3),
(310, '14:00', 'Sábado', 1, 15, 3),
(311, '20:00', 'Sábado', 1, 15, 3),
(312, '22:00', 'Sábado', 2, 15, 3),
(313, '14:00', 'Domingo', 1, 15, 3),
(314, '20:00', 'Domingo', 1, 15, 3),
(315, '22:00', 'Domingo', 2, 15, 3),
(316, '10:00', 'Lunes', 1, 16, 4),
(317, '14:00', 'Lunes', 1, 16, 4),
(318, '18:00', 'Lunes', 2, 16, 4),
(319, '10:00', 'Martes', 1, 16, 4),
(320, '14:00', 'Martes', 1, 16, 4),
(321, '18:00', 'Martes', 2, 16, 4),
(322, '10:00', 'Miércoles', 1, 16, 4),
(323, '14:00', 'Miércoles', 1, 16, 4),
(324, '18:00', 'Miércoles', 2, 16, 4),
(325, '10:00', 'Jueves', 1, 16, 4),
(326, '14:00', 'Jueves', 1, 16, 4),
(327, '18:00', 'Jueves', 2, 16, 4),
(328, '10:00', 'Viernes', 1, 16, 4),
(329, '14:00', 'Viernes', 1, 16, 4),
(330, '18:00', 'Viernes', 2, 16, 4),
(331, '10:00', 'Sábado', 1, 16, 4),
(332, '14:00', 'Sábado', 1, 16, 4),
(333, '18:00', 'Sábado', 2, 16, 4),
(334, '10:00', 'Domingo', 1, 16, 4),
(335, '14:00', 'Domingo', 1, 16, 4),
(336, '18:00', 'Domingo', 2, 16, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_compra`
--

CREATE TABLE `historial_compra` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_resumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_compra`
--

INSERT INTO `historial_compra` (`id`, `id_usuario`, `id_resumen`) VALUES
(1, 3, 1),
(2, 6, 2),
(3, 1, 3),
(4, 8, 4),
(5, 2, 5),
(6, 9, 6),
(7, 5, 7),
(8, 4, 8),
(9, 10, 9),
(10, 7, 10),
(11, 2, 11),
(12, 1, 12),
(13, 3, 13),
(14, 8, 14),
(15, 9, 15),
(16, 10, 16),
(17, 5, 17),
(18, 6, 18),
(19, 7, 19),
(20, 4, 20),
(21, 1, 21),
(22, 9, 22),
(26, 1, 23),
(27, 1, 25),
(28, 1, 26),
(29, 1, 27),
(30, 1, 28),
(31, 2, 29),
(32, 3, 30),
(33, 3, 31),
(34, 3, 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `sinopsis` text NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `año` int(11) NOT NULL,
  `genero` enum('Acción','Comedia','Drama','Ciencia Ficción','Terror','Animación','Documental') NOT NULL,
  `clas_edad` enum('ATP','+13','+16','+18') NOT NULL,
  `poster` varchar(150) NOT NULL,
  `imdb` varchar(150) NOT NULL,
  `rotten` varchar(150) NOT NULL,
  `trailer` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`id`, `titulo`, `sinopsis`, `duracion`, `año`, `genero`, `clas_edad`, `poster`, `imdb`, `rotten`, `trailer`) VALUES
(1, 'Había una vez en Hollywood', 'En Los Ángeles de 1969, un actor de televisión y su doble de riesgo intentan adaptarse a los cambios de la industria cinematográfica mientras se cruzan con la familia Manson.', '2h 41min', 2019, 'Comedia', '+16', '-onceuponatime.jpg', 'https://www.imdb.com/title/tt7131622/', 'https://www.rottentomatoes.com/m/once_upon_a_time_in_hollywood', 'https://www.youtube.com/watch?v=ELeMaP8EPAA'),
(2, 'El secreto de sus ojos', 'Un empleado judicial escribe una novela basada en un brutal asesinato sin resolver que marcó su vida, mientras revive un amor imposible y una justicia pendiente.', '2h 9min', 2009, 'Drama', '+16', '-secreto.jpg', 'https://www.imdb.com/title/tt1305806/', 'https://www.rottentomatoes.com/m/secret_in_their_eyes', 'https://youtu.be/hKa8U-8vsfU?si=yW7u5b4EyUAJBtiD'),
(3, 'Avatar: Fuego y Ceniza', 'Tercera entrega de la saga Avatar. Presenta al Pueblo de las Cenizas, un clan Na\'vi no tan pacífico que utilizará la violencia si lo necesita para conseguir sus objetivos, aunque sea contra otros clanes.', '3h 12min', 2025, 'Ciencia Ficción', '+13', '-avatar.jpg', 'https://www.imdb.com/es/title/tt1757678/', 'https://www.rottentomatoes.com/m/avatar_fire_and_ash', 'https://youtu.be/bf38f_JINyw?si=mmRYVsrLnwKLLLVU'),
(4, 'Whiplash', 'Un joven baterista de jazz busca la perfección bajo la despiadada tutela de un instructor que no se detiene ante nada para sacar lo mejor de él.', '1h 47min', 2014, 'Drama', '+16', '-whiplash.jpg', 'https://www.imdb.com/title/tt2582802/', 'https://www.rottentomatoes.com/m/whiplash_2014', 'https://www.youtube.com/watch?v=7d_jQycdQGo'),
(5, 'Argentina 1985', 'Basada en hechos reales, narra el histórico juicio a las Juntas Militares que gobernaron Argentina, liderado por el fiscal Julio Strassera y su equipo.', '2h 20min', 2022, 'Drama', '+13', '-arg.jpg', 'https://www.imdb.com/title/tt15301048/', 'https://www.rottentomatoes.com/m/argentina_1985', 'https://www.youtube.com/watch?v=2L0EekZ9QfQ'),
(6, 'Kill Bill: Volumen 1', 'Una asesina traicionada por su antiguo equipo busca venganza contra quienes intentaron matarla el día de su boda.', '1h 51min', 2003, 'Acción', '+18', '-kill.jpg', 'https://www.imdb.com/title/tt0266697/', 'https://www.rottentomatoes.com/m/kill_bill_vol_1', 'https://www.youtube.com/watch?v=7kSuas6mRpk'),
(7, 'Gladiador', 'Un general romano leal es traicionado, pierde a su familia, se convierte en esclavo y luego gladiador, y busca venganza contra el emperador corrupto que lo traicionó.', '2h 35min', 2000, 'Acción', '+16', '-gla.jpg', 'https://www.imdb.com/title/tt0172495/', 'https://www.rottentomatoes.com/m/gladiator', 'https://www.youtube.com/watch?v=owK1qxDselE'),
(8, 'Diario de una pasión', 'En un hogar de retiro, un anciano lee a una mujer la historia de dos jóvenes amantes separados por la guerra y las diferencias sociales, que luchan por mantener vivo su amor.', '2h 3min', 2004, 'Drama', '+13', '-diario.jpg', 'https://www.imdb.com/title/tt0332280/', 'https://www.rottentomatoes.com/m/notebook', 'https://www.youtube.com/watch?v=FC6biTjEyZw'),
(9, 'Supercool', 'Dos adolescentes planean comprar alcohol para una fiesta y perder su virginidad antes de graduarse, pero su noche se descontrola completamente.', '1h 53min', 2007, 'Comedia', '+16', '-superbad.jpg', 'https://www.imdb.com/title/tt0829482/', 'https://www.rottentomatoes.com/m/superbad', 'https://www.youtube.com/watch?v=4eaZ_48ZYog'),
(10, 'Coraline', 'Una niña descubre una puerta secreta en su nueva casa que la lleva a un mundo alternativo donde todo parece mejor, hasta que se da cuenta de su oscuro propósito.', '1h 40min', 2009, 'Animación', 'ATP', '-coraline.jpg', 'https://www.imdb.com/title/tt0327597/', 'https://www.rottentomatoes.com/m/coraline', 'https://www.youtube.com/watch?v=m9bOpeuvNwY'),
(11, 'Bastardos sin gloria', 'Durante la Segunda Guerra Mundial, un grupo de soldados judíos-americanos busca vengarse de los nazis mientras una joven trama su propia revancha en un cine de París.', '2h 33min', 2009, 'Drama', '+18', '-bastardos.jpg', 'https://www.imdb.com/title/tt0361748/', 'https://www.rottentomatoes.com/m/inglourious_basterds', 'https://www.youtube.com/watch?v=KnrRy6kSFF0'),
(12, 'Huye', 'Un joven afroamericano visita a la familia de su novia blanca y, tras una serie de incidentes inquietantes, descubre un terrible secreto que ocultan.', '1h 44min', 2017, 'Terror', '+16', '-getout.jpg', 'https://www.imdb.com/title/tt5052448/', 'https://www.rottentomatoes.com/m/get_out', 'https://www.youtube.com/watch?v=sRfnevzM9kQ'),
(13, 'El lobo de Wall Street', 'Jordan Belfort asciende como corredor de bolsa en Nueva York mediante el fraude y la corrupción, viviendo una vida de excesos, poder y desenfreno.', '3h', 2013, 'Comedia', '+18', '-lobo.jpg', 'https://www.imdb.com/title/tt0993846/', 'https://www.rottentomatoes.com/m/the_wolf_of_wall_street_2013', 'https://www.youtube.com/watch?v=iszwuX1AK6A'),
(14, 'Interestelar', 'Un grupo de exploradores viaja a través de un agujero de gusano en el espacio para asegurar el futuro de la humanidad, mientras el amor y el tiempo se entrelazan.', '2h 49min', 2014, 'Ciencia Ficción', '+13', '-interestelar.jpg', 'https://www.imdb.com/title/tt0816692/', 'https://www.rottentomatoes.com/m/interstellar_2014', 'https://www.youtube.com/watch?v=zSWdZVtXT7E'),
(15, 'Spiderman: A través del Spider-Verso', 'Miles Morales se adentra en el multiverso junto a Gwen Stacy y un equipo de Spider-Personas para enfrentar a un enemigo que amenaza todos los universos.', '2h 20min', 2023, 'Animación', 'ATP', '-spiderman.jpg', 'https://www.imdb.com/title/tt9362722/', 'https://www.rottentomatoes.com/m/spider_man_across_the_spider_verse', 'https://www.youtube.com/watch?v=shW9i6k8cB0'),
(16, 'El Faro', 'Dos fareros quedan aislados en una remota isla de Nueva Inglaterra y poco a poco pierden la cordura en medio de tormentas, secretos y la soledad.', '1h 49min', 2019, 'Terror', '+18', '-faro.jpg', 'https://www.imdb.com/title/tt7984734/', 'https://www.rottentomatoes.com/m/the_lighthouse_2019', 'https://www.youtube.com/watch?v=Hyag7lR8CPA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_formato`
--

CREATE TABLE `precio_formato` (
  `id` int(11) NOT NULL,
  `formato` enum('2D','3D') NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `precio_formato`
--

INSERT INTO `precio_formato` (`id`, `formato`, `precio`) VALUES
(1, '2D', 10000),
(2, '3D', 12500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen_compra`
--

CREATE TABLE `resumen_compra` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_candy` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 0,
  `total` varchar(15) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `resumen_compra`
--

INSERT INTO `resumen_compra` (`id`, `id_ticket`, `id_usuario`, `id_candy`, `cantidad`, `total`, `estado`) VALUES
(1, 1, 3, 2, 0, '27400', 1),
(2, 2, 6, 5, 0, '19800', 1),
(3, 3, 1, 3, 0, '35650', 0),
(4, 4, 8, 1, 0, '22500', 1),
(5, 5, 2, 4, 0, '31400', 1),
(6, 6, 9, 6, 0, '18300', 0),
(7, 7, 5, 2, 0, '26700', 1),
(8, 8, 4, 1, 0, '29200', 1),
(9, 9, 10, 3, 0, '31900', 0),
(10, 10, 7, 6, 0, '20450', 1),
(11, 11, 2, 4, 0, '33800', 1),
(12, 12, 1, 5, 0, '26100', 0),
(13, 13, 3, 2, 0, '28700', 1),
(14, 14, 8, 6, 0, '33000', 1),
(15, 15, 9, 5, 0, '17600', 0),
(16, 16, 10, 3, 0, '29550', 1),
(17, 17, 5, 1, 0, '26900', 1),
(18, 18, 6, 4, 0, '30800', 0),
(19, 19, 7, 2, 0, '22700', 1),
(20, 20, 4, 5, 0, '24300', 1),
(21, 21, 1, 3, 0, '31600', 0),
(22, 22, 9, 6, 0, '28950', 1),
(23, 34, 1, NULL, 0, '12500', 1),
(24, 35, 1, NULL, 0, '10000', 1),
(25, 36, 1, NULL, 0, '12500', 1),
(26, 37, 1, NULL, 0, '10000', 1),
(27, 38, 1, NULL, 0, '12500', 1),
(28, 39, 1, NULL, 0, '10000', 1),
(29, 40, 2, NULL, 0, '12500', 1),
(30, 41, 3, NULL, 0, '10000', 1),
(31, 42, 3, NULL, 0, '12500', 1),
(32, 43, 3, NULL, 0, '10000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `asientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`id`, `numero`, `asientos`) VALUES
(1, '1', 120),
(2, '2', 120),
(3, '3', 120),
(4, '4', 120);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `cantidad` enum('1','2','3','4','5','6','7','8','9','10') NOT NULL,
  `id_funcion` int(11) NOT NULL,
  `id_formato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`id`, `cantidad`, `id_funcion`, `id_formato`) VALUES
(1, '3', 1, 1),
(2, '2', 5, 1),
(3, '5', 10, 1),
(4, '2', 12, 2),
(5, '1', 6, 1),
(6, '4', 15, 2),
(7, '7', 20, 1),
(8, '9', 22, 2),
(9, '6', 25, 1),
(10, '8', 28, 2),
(11, '10', 30, 2),
(12, '4', 33, 1),
(13, '5', 35, 2),
(14, '2', 38, 1),
(15, '3', 40, 2),
(16, '7', 42, 1),
(17, '1', 43, 2),
(18, '6', 44, 1),
(19, '9', 45, 2),
(20, '8', 46, 1),
(21, '10', 47, 2),
(22, '5', 48, 1),
(23, '1', 88, 1),
(24, '1', 91, 1),
(25, '1', 91, 1),
(26, '1', 91, 1),
(27, '1', 91, 1),
(28, '1', 91, 1),
(29, '1', 91, 1),
(30, '1', 91, 1),
(31, '1', 91, 1),
(32, '2', 48, 2),
(33, '1', 216, 2),
(34, '1', 162, 2),
(35, '1', 325, 1),
(36, '1', 198, 2),
(37, '1', 7, 1),
(38, '1', 333, 2),
(39, '1', 89, 1),
(40, '1', 276, 2),
(41, '1', 133, 1),
(42, '1', 87, 2),
(43, '1', 35, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nacimiento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `apellidos`, `nacimiento`, `email`, `telefono`, `password`, `avatar`) VALUES
(1, 'Alvaro', 'Gomez', '2006-08-03', 'alvarogomez@gmail.com', '2477123455', 'Alva12345', 'alva'),
(2, 'Lucia', 'Martinez', '2004-11-15', 'luciamartinez@gmail.com', '2477456211', 'Luci12345', 'luci'),
(3, 'Mateo', 'Fernandez', '2006-02-20', 'mateofernandez@gmail.com', '2477985643', 'Mate12345', 'mateofernandez@gmail.com_1770495734.jpg'),
(4, 'Sofia', 'Lopez', '2005-09-12', 'sofialopez@gmail.com', '2477231987', 'Sofia12345', 'sofi'),
(5, 'Valentin', 'Rodriguez', '2004-06-30', 'valentinrodriguez@gmail.com', '2477564890', 'Val12345', 'val'),
(6, 'Camila', 'Perez', '2006-01-25', 'camilaperez@gmail.com', '2477654321', 'Cami12345', 'cami'),
(7, 'Tomas', 'Ruiz', '2005-03-18', 'tomasruiz@gmail.com', '2477890123', 'Tom12345', 'tom'),
(8, 'Martina', 'Sanchez', '2004-12-07', 'martinasanchez@gmail.com', '2477345098', 'Marti12345', 'marti'),
(9, 'Nicolas', 'Torres', '2005-05-10', 'nicolastorres@gmail.com', '2477222333', 'Nico12345', 'nico'),
(10, 'Julieta', 'Diaz', '2006-09-02', 'julietadiaz@gmail.com', '2477555666', 'Juli12345', 'juli');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `butaca`
--
ALTER TABLE `butaca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_butaca_ticket` (`id_ticket`);

--
-- Indices de la tabla `candy`
--
ALTER TABLE `candy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_nombre_candy` (`nombre`);

--
-- Indices de la tabla `compra_candy`
--
ALTER TABLE `compra_candy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resumen` (`id_resumen`),
  ADD KEY `id_candy` (`id_candy`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcion_sala` (`id_sala`),
  ADD KEY `fk_funcion_pelicula` (`id_pelicula`),
  ADD KEY `fk_funcion_formato` (`id_formato`);

--
-- Indices de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historial_resumen` (`id_resumen`),
  ADD KEY `fk_historial_usuario` (`id_usuario`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precio_formato`
--
ALTER TABLE `precio_formato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resumen_candy` (`id_candy`),
  ADD KEY `fk_resumen_ticket` (`id_ticket`),
  ADD KEY `fk_resumen_usuario` (`id_usuario`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_funcion` (`id_funcion`),
  ADD KEY `fk_ticket_formato` (`id_formato`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_email_usuario` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `butaca`
--
ALTER TABLE `butaca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `candy`
--
ALTER TABLE `candy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `compra_candy`
--
ALTER TABLE `compra_candy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `precio_formato`
--
ALTER TABLE `precio_formato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `butaca`
--
ALTER TABLE `butaca`
  ADD CONSTRAINT `fk_butaca_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fk_funcion_formato` FOREIGN KEY (`id_formato`) REFERENCES `precio_formato` (`id`),
  ADD CONSTRAINT `fk_funcion_pelicula` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `fk_funcion_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`);

--
-- Filtros para la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD CONSTRAINT `fk_historial_resumen` FOREIGN KEY (`id_resumen`) REFERENCES `resumen_compra` (`id`),
  ADD CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  ADD CONSTRAINT `fk_resumen_candy` FOREIGN KEY (`id_candy`) REFERENCES `candy` (`id`),
  ADD CONSTRAINT `fk_resumen_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `fk_resumen_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_formato` FOREIGN KEY (`id_formato`) REFERENCES `precio_formato` (`id`),
  ADD CONSTRAINT `fk_ticket_funcion` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
