-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.33 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6518
-- --------------------------------------------------------
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET NAMES utf8 */
;

/*!50503 SET NAMES utf8mb4 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

-- Volcando estructura de base de datos para colegiapp
CREATE DATABASE IF NOT EXISTS `colegiapp`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci */
;

USE `colegiapp`;

-- Volcando estructura para tabla colegiapp.alumnos
CREATE TABLE IF NOT EXISTS `alumnos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) unsigned NOT NULL,
  `grado` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__personas` (`id_persona`),
  CONSTRAINT `FK__personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

-- Volcando datos para la tabla colegiapp.alumnos: ~0 rows (aproximadamente)
DELETE FROM
  `alumnos`;

-- Volcando estructura para tabla colegiapp.materias
CREATE TABLE IF NOT EXISTS `materias` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

-- Volcando datos para la tabla colegiapp.materias: ~3 rows (aproximadamente)
DELETE FROM
  `materias`;

INSERT INTO
  `materias` (`id`, `nombre`)
VALUES
  (1, 'Informática'),
  (2, 'Contabilidad I'),
  (3, 'Administración II');

-- Volcando estructura para tabla colegiapp.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_rol` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci COMMENT = 'Rol[1 = estudiante, 2 = profesor]';

-- Volcando datos para la tabla colegiapp.personas: ~3 rows (aproximadamente)
DELETE FROM
  `personas`;

INSERT INTO
  `personas` (
    `id`,
    `nombres`,
    `apellidos`,
    `fecha_nacimiento`,
    `id_rol`
  )
VALUES
  (
    1,
    'Jhon Hader',
    'Rodriguez Perdomo',
    '1989-03-30',
    2
  ),
  (2, 'Juana ', 'Díaz', '1990-05-30', 2),
  (3, 'Pepito', 'Perez', '1995-12-10', 2);

-- Volcando estructura para tabla colegiapp.profesiones
CREATE TABLE IF NOT EXISTS `profesiones` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

-- Volcando datos para la tabla colegiapp.profesiones: ~3 rows (aproximadamente)
DELETE FROM
  `profesiones`;

INSERT INTO
  `profesiones` (`id`, `nombre`)
VALUES
  (1, 'Ingeniero de Sistemas'),
  (2, 'Contador Público'),
  (3, 'Administrador de Empresas');

-- Volcando estructura para tabla colegiapp.profesores
CREATE TABLE IF NOT EXISTS `profesores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_persona` bigint(20) unsigned NOT NULL,
  `id_profesion` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_profesores_personas` (`id_persona`),
  KEY `FK_profesores_profesiones` (`id_profesion`),
  CONSTRAINT `FK_profesores_personas` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_profesores_profesiones` FOREIGN KEY (`id_profesion`) REFERENCES `profesiones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_spanish2_ci;

-- Volcando datos para la tabla colegiapp.profesores: ~3 rows (aproximadamente)
DELETE FROM
  `profesores`;

INSERT INTO
  `profesores` (`id`, `id_persona`, `id_profesion`)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */
;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */
;

/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */
;