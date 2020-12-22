-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-12-2020 a las 13:15:15
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chocolates`
--
CREATE DATABASE IF NOT EXISTS `chocolates` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `chocolates`;

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteProductos` (IN `idProducto` INT)  NO SQL
BEGIN
DELETE FROM productos WHERE productos.idProducto = idProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertProductos` (IN `Nombre` VARCHAR(20), IN `Tipo` VARCHAR(20), IN `Precio` INT(2), IN `Cantidad` INT(3), IN `Foto` VARCHAR(20))  NO SQL
BEGIN
INSERT INTO productos (productos.nombre, productos.tipo, productos.precio, productos.cantidad, productos.foto)
VALUES (Nombre, Tipo, Precio, Cantidad, Foto);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spSelectAll` ()  NO SQL
SELECT * FROM productos$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateProductos` (IN `idProducto` INT(3), IN `Nombre` VARCHAR(20), IN `Tipo` VARCHAR(20), IN `Precio` INT(3), IN `Cantidad` INT(3), IN `Foto` VARCHAR(20))  NO SQL
BEGIN

UPDATE productos 
SET
productos.nombre = Nombre,
productos.tipo = Tipo,
productos.precio = Precio,
productos.cantidad = Cantidad,
productos.foto = Foto

WHERE productos.idProducto = idProducto;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(3) NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` int(3) NOT NULL,
  `cantidad` int(3) NOT NULL,
  `foto` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `tipo`, `precio`, `cantidad`, `foto`) VALUES
(1, 'Bombones', 'Chocolate', 12, 43, 'bombones'),
(2, 'Tableta de Chocolate', 'Chocolate', 3, 89, 'tableta'),
(3, 'M&M', 'Chocolate', 4, 76, 'mym'),
(4, 'Tarta 3 Chocolates', 'Tarta', 20, 45, 'tarta3Chocolates'),
(5, 'Milka', 'Chocolate', 2, 98, 'milka'),
(6, 'Ferrero Rocher', 'Bombones', 7, 76, 'ferrero'),
(7, 'Tarta Chocolate y Fresa', 'Tarta', 23, 12, 'tartaChocolateFresa'),
(8, 'Caja Roja', 'Bombones', 5, 91, 'cajaRoja'),
(11, 'test', 'test', 99, 99, 'prueba');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
