-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-07-2022 a las 08:09:48
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Clase alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_cliente`
--

CREATE TABLE `categoria_cliente` (
  `id_categoria` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_cliente`
--

INSERT INTO `categoria_cliente` (`id_categoria`, `id_cliente`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 18),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 27),
(1, 30),
(1, 33),
(1, 45),
(1, 46),
(1, 51),
(1, 54),
(1, 57),
(1, 60),
(1, 63),
(1, 65),
(1, 66),
(1, 69),
(1, 72),
(1, 75),
(1, 78),
(1, 81),
(1, 84),
(1, 87),
(1, 90),
(1, 93),
(1, 96),
(1, 99),
(1, 102),
(1, 105),
(1, 108),
(1, 111),
(1, 114),
(1, 117),
(1, 120),
(1, 123),
(1, 126),
(1, 129),
(1, 132),
(1, 135),
(1, 138),
(1, 141),
(1, 144),
(1, 147),
(1, 150),
(1, 153),
(1, 156),
(1, 159),
(1, 162),
(1, 165),
(1, 168),
(1, 171),
(1, 174),
(1, 177),
(1, 180),
(1, 183),
(1, 186),
(1, 189),
(1, 192),
(1, 195),
(1, 198),
(1, 201),
(1, 204),
(1, 207),
(1, 210),
(1, 213),
(1, 216),
(1, 219),
(1, 222),
(1, 225),
(1, 228),
(1, 231),
(1, 234),
(1, 237),
(1, 240),
(1, 243),
(1, 246),
(1, 249),
(1, 252),
(1, 255),
(1, 258),
(1, 261),
(1, 264),
(2, 2),
(2, 22),
(3, 22),
(5, 22),
(6, 22),
(65, 236),
(65, 2336);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`) VALUES
(1, 'Jose J'),
(2, 'Damian'),
(3, 'Gimenez Rodriguez'),
(4, 'Gimenez Rodriguez'),
(6, '6'),
(7, 'BanzaUser'),
(8, 'BanzaUser'),
(9, 'BanzaUser'),
(18, 'test_user_01'),
(21, 'test_user_01'),
(24, 'test_user_01'),
(27, 'test_user_01'),
(30, 'test_user_01'),
(33, 'test_user_01'),
(36, 'test_user_01'),
(39, 'test_user_01'),
(42, 'test_user_01'),
(45, 'test_user_01'),
(48, 'test_user_01'),
(51, 'test_user_01'),
(54, 'test_user_01'),
(57, 'test_user_01'),
(60, 'test_user_01'),
(63, 'test_user_01'),
(66, 'test_user_01'),
(69, 'test_user_01'),
(72, 'test_user_01'),
(75, 'test_user_01'),
(78, 'test_user_01'),
(81, 'test_user_01'),
(84, 'test_user_01'),
(87, 'test_user_01'),
(90, 'test_user_01'),
(93, 'test_user_01'),
(96, 'test_user_01'),
(99, 'test_user_01'),
(102, 'test_user_01'),
(105, 'test_user_01'),
(108, 'test_user_01'),
(111, 'test_user_01'),
(114, 'test_user_01'),
(117, 'test_user_01'),
(120, 'test_user_01'),
(123, 'test_user_01'),
(126, 'test_user_01'),
(129, 'test_user_01'),
(132, 'test_user_01'),
(135, 'test_user_01'),
(138, 'test_user_01'),
(141, 'test_user_01'),
(144, 'test_user_01'),
(147, 'test_user_01'),
(150, 'test_user_01'),
(153, 'test_user_01'),
(156, 'test_user_01'),
(159, 'test_user_01'),
(162, 'test_user_01'),
(165, 'test_user_01'),
(168, 'test_user_01'),
(171, 'test_user_01'),
(174, 'test_user_01'),
(177, 'test_user_01'),
(180, 'test_user_01'),
(183, 'test_user_01'),
(186, 'test_user_01'),
(189, 'test_user_01'),
(192, 'test_user_01'),
(195, 'test_user_01'),
(198, 'test_user_01'),
(201, 'test_user_01'),
(204, 'test_user_01'),
(207, 'test_user_01'),
(210, 'test_user_01'),
(213, 'test_user_01'),
(216, 'test_user_01'),
(219, 'test_user_01'),
(222, 'test_user_01'),
(225, 'test_user_01'),
(228, 'test_user_01'),
(231, 'test_user_01'),
(234, 'test_user_01'),
(237, 'test_user_01'),
(240, 'test_user_01'),
(243, 'test_user_01'),
(246, 'test_user_01'),
(249, 'test_user_01'),
(252, 'test_user_01'),
(255, 'test_user_01'),
(258, 'test_user_01'),
(261, 'test_user_01'),
(264, 'test_user_01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `id` int(11) NOT NULL,
  `id_cliente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`id`, `id_cliente`) VALUES
(1, '1'),
(2, '1'),
(3, '1'),
(4, '1'),
(5, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id` int(11) NOT NULL,
  `id_cuenta` int(11) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `importe` float DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id`, `id_cuenta`, `tipo`, `importe`, `fecha`) VALUES
(1, 1, 'Egreso', -50, '2022-07-25'),
(2, 1, 'Egreso', -50, '2022-07-25'),
(3, 1, 'Ingreso', 50, '2022-07-25'),
(4, 1, 'Ingreso', 50, '2022-07-25'),
(5, 1, 'Ingreso', 50, '2022-07-25'),
(6, 1, 'Ingreso', 50, '2022-07-25'),
(7, 1, 'Ingreso', 50, '2022-07-25'),
(8, 1, 'Ingreso', 50, '2022-07-25'),
(9, 1, 'Egreso', -50, '2022-07-25'),
(10, 1, 'Egreso', -50, '2022-07-25'),
(11, 1, 'Egreso', -50, '2022-07-25'),
(12, 1, 'Egreso', -50, '2022-07-25'),
(13, 1, 'Egreso', -50, '2022-07-25'),
(14, 1, 'Egreso', -50, '2022-07-25'),
(15, 1, 'Ingreso', 50, '2022-07-25'),
(16, 1, 'Ingreso', 50, '2022-07-25'),
(17, 1, 'Ingreso', 50, '2022-07-25'),
(18, 1, 'Ingreso', 50, '2022-07-25'),
(19, 1, 'Ingreso', 50, '2022-07-25'),
(20, 1, 'Ingreso', 50, '2022-07-25'),
(21, 1, 'Ingreso', 50, '2022-07-25'),
(22, 1, 'Ingreso', 50, '2022-07-25'),
(23, 1, 'Ingreso', 50, '2022-07-25'),
(24, 1, 'Egreso', -50, '2022-07-25'),
(25, 1, 'Egreso', -50, '2022-07-25'),
(26, 1, 'Egreso', -50, '2022-07-25'),
(27, 1, 'Egreso', -50, '2022-07-25'),
(28, 1, 'Egreso', -50, '2022-07-25'),
(29, 1, 'Egreso', -50, '2022-07-25'),
(30, 1, 'Egreso', -50, '2022-07-25'),
(31, 1, 'Egreso', -50, '2022-07-25'),
(32, 1, 'Egreso', -50, '2022-07-25'),
(33, 1, 'asd', 50, '2022-07-25'),
(34, 1, 'asd', 50, '2022-07-25'),
(35, 1, 'asd', 50, '2022-07-25'),
(36, 1, 'Egreso', -50, '2022-07-25'),
(37, 1, 'Egreso', -50, '2022-07-25'),
(38, 1, 'Egreso', -50, '2022-07-25'),
(39, 1, 'Eegreso', 50, '2022-07-25'),
(40, 1, 'Eegreso', 50, '2022-07-25'),
(41, 1, 'Egreso', -50, '2022-07-25'),
(42, 1, 'Egreso', -50, '2022-07-25'),
(43, 1, 'Egereso', 50, '2022-07-25'),
(44, 1, 'Egereso', 50, '2022-07-25'),
(45, 1, 'Egreso', -50, '2022-07-25'),
(46, 1, 'Egreso', -50, '2022-07-25'),
(47, 1, 'Eggreso', 50, '2022-07-25'),
(48, 1, 'Eggreso', 50, '2022-07-25'),
(49, 1, 'Eggreso', 50, '2022-07-25'),
(50, 1, 'Eggreso', 50, '2022-07-25'),
(51, 1, 'Eggreso', 50, '2022-07-25'),
(52, 1, 'Eggreso', 50, '2022-07-25'),
(53, 1, 'Eggreso', 50, '2022-07-25'),
(54, 1, 'Egreso', -50, '2022-07-25'),
(55, 1, 'Egreso', -50, '2022-07-25'),
(56, 1, 'Egreso', -50, '2022-07-25'),
(57, 1, 'Egreso', -50, '2022-07-25'),
(58, 1, 'Egreso', -50, '2022-07-25'),
(59, 1, 'Egreso', -50, '2022-07-25'),
(60, 1, 'Egreso', -50, '2022-07-25'),
(61, 1, 'Eegreso', 50, '2022-07-25'),
(62, 1, 'Eegreso', 50, '2022-07-25'),
(63, 1, 'Eegreso', 50, '2022-07-25'),
(64, 1, 'Eegreso', 50, '2022-07-25'),
(65, 1, 'Eegreso', 50, '2022-07-25'),
(66, 1, 'Egreso', -50, '2022-07-25'),
(67, 1, 'Egreso', -50, '2022-07-25'),
(68, 1, 'Egreso', -50, '2022-07-25'),
(69, 1, 'Egreso', -50, '2022-07-25'),
(70, 1, 'Egreso', -50, '2022-07-25'),
(71, 1, 'Egereso', 50, '2022-07-25'),
(72, 1, 'Egereso', 50, '2022-07-25'),
(73, 1, 'Egereso', 50, '2022-07-25'),
(74, 1, 'Egereso', 50, '2022-07-25'),
(75, 1, 'Egreso', -50, '2022-07-25'),
(76, 1, 'Egreso', -50, '2022-07-25'),
(77, 1, 'Egreso', -50, '2022-07-25'),
(78, 1, 'Egreso', -50, '2022-07-25'),
(79, 1, 'Egreeso', 50, '2022-07-25'),
(80, 1, 'Egreeso', 50, '2022-07-25'),
(81, 1, 'Egreeso', 50, '2022-07-25'),
(82, 1, 'Egreeso', 50, '2022-07-25'),
(83, 1, 'Egreeso', 50, '2022-07-25'),
(84, 1, 'Egreso', -50, '2022-07-25'),
(85, 1, 'Egreso', -50, '2022-07-25'),
(86, 1, 'Egreso', -50, '2022-07-25'),
(87, 1, 'Egereso', 50, '2022-07-25'),
(88, 1, 'Egreso', -50, '2022-07-25'),
(89, 1, 'Ingreso', 0, '2022-07-25'),
(90, 1, 'Ingreso', 0, '2022-07-25'),
(91, 1, 'Ingreso', 50, '2022-07-25'),
(93, 2, 'Ingreso', 500, '2022-07-25'),
(94, 2, 'Ingreso', 500, '2022-07-25'),
(95, 3, 'Ingreso', 500, '2022-07-25'),
(96, 3, 'Ingreso', 500, '2022-07-25'),
(97, 3, 'Ingreso', 500.15, '2022-07-25'),
(98, 1, 'Ingreso', 500.15, '2022-07-25'),
(99, 1, 'Ingreso', 5, '2022-07-25'),
(100, 1, 'Ingreso', 500, '2022-07-25'),
(101, 1, 'Ingreso', 500, '2022-07-25'),
(102, 1, 'Ingreso', 500, '2022-07-25'),
(103, 1, 'Ingreso', 3, '2022-07-25'),
(104, 1, 'Ingreso', 500, '2022-07-25'),
(105, 1, 'Ingreso', 500, '2022-07-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria_cliente`
--
ALTER TABLE `categoria_cliente`
  ADD PRIMARY KEY (`id_categoria`,`id_cliente`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
