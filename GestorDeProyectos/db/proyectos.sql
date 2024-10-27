-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 22-04-2024 a las 03:45:43
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Base de datos: `proyectos`

-- --------------------------------------------------------
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS proyectos;
USE proyectos;

-- Estructura de tabla para la tabla `anteproyectos`
CREATE TABLE `anteproyectos` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_limite` date DEFAULT NULL,
  `estado` enum('Aprobado','Rechazado') NOT NULL,
  `estudiante_id` int(11) DEFAULT NULL,
  `evaluador_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `estudiante_id` (`estudiante_id`),
  KEY `evaluador_id` (`evaluador_id`),
  KEY `director_id` (`director_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `anteproyectos`
INSERT INTO `anteproyectos` (`codigo`, `titulo`, `descripcion`, `fecha_creacion`, `fecha_limite`, `estado`, `estudiante_id`, `evaluador_id`, `director_id`) VALUES
(1, 'Sistema de gestion de inventarios', 'Desarrollo de un sistema web para la gestion de inventarios de una empresa comercial. El sistema debe permitir realizar operaciones CRUD sobre los productos, categorias y proveedores, asi como generar reportes y graficos estadisticos.', '2024-04-13', '2024-06-30', 'Aprobado', 246801379, 1357924680, 369851470);

-- Estructura de tabla para la tabla `calificaciones`
CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `anteproyecto_id` int(11) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `calificacion` decimal(4,2) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `anteproyecto_id` (`anteproyecto_id`),
  KEY `evaluador_id` (`evaluador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `calificaciones`
INSERT INTO `calificaciones` (`id`, `anteproyecto_id`, `evaluador_id`, `calificacion`, `observaciones`, `fecha`) VALUES
(6, 1, 1357924680, 3.50, 'El anteproyecto necesita mejorar la seccion de metodologia.', '2024-04-20');

-- Estructura de tabla para la tabla `ideas_anteproyecto`
CREATE TABLE `ideas_anteproyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `ideas_anteproyecto`
INSERT INTO `ideas_anteproyecto` (`id`, `titulo`, `descripcion`) VALUES
(1, 'Sistema de gestion de inventarios', 'Desarrollo de un sistema web para la gestion de inventarios de una empresa comercial. El sistema debe permitir realizar operaciones CRUD sobre los productos, categorias y proveedores, asi como generar reportes y graficos estadisticos.'),
(2, 'Aplicacion movil de delivery', 'Diseno y desarrollo de una aplicacion movil para la entrega a domicilio de productos de supermercado. La aplicacion debe permitir a los usuarios realizar pedidos, realizar pagos en linea y realizar un seguimiento de sus envios.'),
(3, 'Plataforma de educacion en linea', 'Creacion de una plataforma web para cursos en linea. La plataforma debe permitir a los instructores crear y publicar cursos, y a los estudiantes inscribirse y acceder al contenido del curso. Tambien debe incluir un sistema de evaluacion y calificacion.'),
(4, 'Sistema de facturacion electronica', 'Desarrollo de un sistema web para la emision de facturas electronicas. El sistema debe cumplir con los requisitos legales y tecnicos para la facturacion electronica, y permitir a los usuarios crear, enviar y almacenar facturas electronicas.'),
(5, 'Aplicacion de seguimiento de fitness', 'Diseno y desarrollo de una aplicacion movil para el seguimiento de actividades de fitness. La aplicacion debe permitir a los usuarios registrar sus rutinas de ejercicios, monitorear su progreso y establecer metas personales.');

-- Estructura de tabla para la tabla `roles`
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `roles`
INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(2, 'Coordinador'),
(3, 'Director'),
(4, 'Evaluador'),
(5, 'Estudiante');

-- Estructura de tabla para la tabla `usuarios`
CREATE TABLE `usuarios` (
  `cedula` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `rol_id` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `usuarios`
INSERT INTO `usuarios` (`cedula`, `nombre`, `email`, `contrasena`, `rol_id`) VALUES
(246801379, 'Luis Gonzalez', 'luisg@uts.edu.co', '123', 5),
(369851470, 'Pedro Martinez', 'pedrom@uts.edu.co', '123', 3),
(987654321, 'Maria Rodriguez', 'mariam@uts.edu.co', '123', 2),
(1234567890, 'Juan Perez', 'juanp@uts.edu.co', '123', 1),
(1357924680, 'Ana Portillo', 'anap@uts.edu.co', '123', 4);

-- Restricciones para tablas volcadas
ALTER TABLE `anteproyectos`
  ADD CONSTRAINT `anteproyectos_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE,
  ADD CONSTRAINT `anteproyectos_ibfk_2` FOREIGN KEY (`evaluador_id`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE,
  ADD CONSTRAINT `anteproyectos_ibfk_3` FOREIGN KEY (`director_id`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE;

ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`anteproyecto_id`) REFERENCES `anteproyectos` (`codigo`) ON DELETE CASCADE,
  ADD CONSTRAINT `calificaciones_ibfk_2` FOREIGN KEY (`evaluador_id`) REFERENCES `usuarios` (`cedula`) ON DELETE CASCADE;

ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);
