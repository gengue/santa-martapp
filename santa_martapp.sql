-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2014 at 12:16 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `santa_martapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `ID_EVENTO` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PERSONA_EVENTO` int(11) NOT NULL,
  `ID_LUGAR` int(11) NOT NULL,
  PRIMARY KEY (`ID_EVENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lugares`
--

CREATE TABLE IF NOT EXISTS `lugares` (
  `ID_LUGAR` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_RUTA_LUGAR` int(11) NOT NULL,
  `NOMBRE_LUGAR` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `DESCRIPCION_LUGAR` text COLLATE utf8_spanish_ci,
  PRIMARY KEY (`ID_LUGAR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `lugares_interes`
--

CREATE TABLE IF NOT EXISTS `lugares_interes` (
  `ID_LUGARINTERES` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_LUGAR` int(11) DEFAULT NULL,
  `NOMBRE_LUGARINTERES` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `LATITUD_LUGARINTERES` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LONGITUD_LUGARINTERES` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_LUGARINTERES`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mensajes_tablero`
--

CREATE TABLE IF NOT EXISTS `mensajes_tablero` (
  `ID_MENSAJES_TABLERO` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_TABLERO` int(11) NOT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `MENSAJE_TABLERO` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_MENSAJES_TABLERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `ID_PERSONA` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_USUARIO` int(11) DEFAULT NULL,
  `NOMBRE_PERSONA` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `APELLIDO_PERSONA` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `URL_FOTO_PERSONA` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `FECHA_CREACION` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `FECHA_MODIFICACION` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `FECHA_ELIMINACION` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `ESTADO_PERSONA` enum('ACTIVO','INACTIVO') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ACTIVO',
  PRIMARY KEY (`ID_PERSONA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `ID_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ROL` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rutas`
--

CREATE TABLE IF NOT EXISTS `rutas` (
  `ID_RUTA` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE_RUTA` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_RUTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rutas_tramos`
--

CREATE TABLE IF NOT EXISTS `rutas_tramos` (
  `ID_RUTA_TRAMO` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_RUTA` int(11) NOT NULL,
  `ID_TRAMO` int(11) NOT NULL,
  PRIMARY KEY (`ID_RUTA_TRAMO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tableros`
--

CREATE TABLE IF NOT EXISTS `tableros` (
  `ID_TABLERO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_TABLERO` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ID_EVENTO_TABLERO` int(11) NOT NULL,
  KEY `ID_TABLERO` (`ID_TABLERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_transporte`
--

CREATE TABLE IF NOT EXISTS `tipos_transporte` (
  `ID_TIPOTRANSPORTE` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE_TIPOTRANSPORTE` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_TIPOTRANSPORTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tramos`
--

CREATE TABLE IF NOT EXISTS `tramos` (
  `ID_TRAMO` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ID_TIPOTRANSPORTE` int(11) DEFAULT NULL,
  `LATITUD_TRAMO_DESDE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LONGITUD_TRAMO_DESDE` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LATITUD_TRAMO_HASTA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `LONGITUD_TRAMO_HASTA` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`ID_TRAMO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_USUARIO` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `CORREO_USUARIO` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `PASSWORD_USUARIO` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `ID_ROL_USUARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_eventos`
--

CREATE TABLE IF NOT EXISTS `usuarios_eventos` (
  `ID_USUARIO_EVENTO` int(11) NOT NULL,
  `ID_PERSONA` int(11) NOT NULL,
  `ID_EVENTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_USUARIO_EVENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
