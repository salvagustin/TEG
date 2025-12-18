/*
 Navicat Premium Data Transfer

 Source Server         : Alcaldia Armenia
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : alcaldiaarmenia.gob.sv:3306
 Source Schema         : alc4arw3_comisiones

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 19/09/2021 20:01:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adm_rol
-- ----------------------------
DROP TABLE IF EXISTS `adm_rol`;
CREATE TABLE `adm_rol`  (
  `rol` int(11) NOT NULL AUTO_INCREMENT,
  `con` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_rol
-- ----------------------------
INSERT INTO `adm_rol` VALUES (1, 'Super');
INSERT INTO `adm_rol` VALUES (2, 'Administrador');

-- ----------------------------
-- Table structure for adm_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `adm_usuarios`;
CREATE TABLE `adm_usuarios`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usu` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pas` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rol` int(5) NOT NULL,
  `nom` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ape` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mai` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rol`(`rol`) USING BTREE,
  CONSTRAINT `adm_usuarios_ibfk_3` FOREIGN KEY (`rol`) REFERENCES `adm_rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_usuarios
-- SuperUser--- Sup3rV0t4c10n3s
-- Us3rV0taciones  ----- V0tac10N3s$2025
-- ----------------------------
INSERT INTO `adm_usuarios` VALUES (3, 'Sup3rU53r', 'a3e0459970170984ae87486e93331453', 1, 'Super', 'User', '12345678', 'edgardo.flores@ace.gob.sv', 'Activo'); 
INSERT INTO `adm_usuarios` VALUES (2, 'Us3rV0taciones', '4e07d08c050fb3c8babec8df1ae5c465', 2, 'User', 'administrador', '12345678', 'edgardo.flores@ace.gob.sv', 'Activo');


-- ----------------------------
-- Table structure for afiliados
-- ----------------------------
DROP TABLE IF EXISTS `afiliados`;
CREATE TABLE `afiliados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primerNombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `segundoNombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `primerApellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `segundoApellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dui` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fechaNac` date NULL DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `correo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `codigo` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jornadas
-- ----------------------------
DROP TABLE IF EXISTS `jornadas`;
CREATE TABLE `jornadas`  (
  `id_jornada` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `horaDesde` time(0) NULL DEFAULT NULL,
  `horaHasta` time(0) NULL DEFAULT NULL,
  `periodoDesde` date NULL DEFAULT NULL,
  `periodoHasta` date NULL DEFAULT NULL,
  `estado` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jornada`) USING BTREE
  ) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `id_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `id_afiliado` int(11) NULL DEFAULT NULL,
  `id_jornada` int(11) NULL DEFAULT NULL,
  `edad` int(11) NULL DEFAULT NULL,
  `domicilio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `profesion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `estado` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_candidato`) USING BTREE,
  INDEX `id_afiliado`(`id_afiliado`) USING BTREE,
  INDEX `id_jornada`(`id_jornada`) USING BTREE,
  CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidatos_ibfk_2` FOREIGN KEY (`id_jornada`) REFERENCES `jornadas` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for historial
-- ----------------------------
DROP TABLE IF EXISTS `historial`;
CREATE TABLE `historial`  (
  `id_historial` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usu` int(10) NOT NULL,
  `fecha` date NOT NULL,
  `accion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lugar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_lugar` int(10) NULL DEFAULT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_historial`) USING BTREE,
  INDEX `usu`(`usu`) USING BTREE,
  CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`usu`) REFERENCES `adm_usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2321 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;



-- ----------------------------
-- Table structure for parametros
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros`  (
  `id_parametro` int(10) NOT NULL AUTO_INCREMENT,
  `municipalidad` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nombreAlcalde` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cargoAlcalde` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nombreSecretario` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cargoSecretario` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telefono` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `correo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `paginaweb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `miembro1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `miembro2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `miembro3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo1` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observador` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observador2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `observador3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo_observador` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo_observador2` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cargo_observador3` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `estado` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_parametro`) USING BTREE) 
  ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- Table structure for votacion
-- ----------------------------
DROP TABLE IF EXISTS `votacion`;
CREATE TABLE `votacion`  (
  `id_votacion` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `id_jornada` int(11) NULL DEFAULT NULL,
  `id_candidato` int(11) NULL DEFAULT NULL,
  `id_afiliado` int(11) NULL DEFAULT NULL,
  `voto` int(11) NULL DEFAULT NULL,
  `abstenciones` int(11) NULL DEFAULT NULL,
  `nulos` int(11) NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `hora` time(0) NULL DEFAULT NULL,
  `eliminado` varbinary(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id_votacion`) USING BTREE,
  INDEX `id_jornada`(`id_jornada`) USING BTREE,
  INDEX `id_candidato`(`id_candidato`) USING BTREE,
  INDEX `id_afiliado`(`id_afiliado`) USING BTREE,
  CONSTRAINT `votacion_ibfk_1` FOREIGN KEY (`id_jornada`) REFERENCES `jornadas` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_3` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
  ) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;


-- ----------------------------
-- View structure for vista_votos
-- ----------------------------
DROP VIEW IF EXISTS `vista_votos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_votos` AS select sum(`votacion`.`voto`) AS `votos`,`votacion`.`id_candidato` AS `candidato`,`votacion`.`id_jornada` AS `id_jornada` from `votacion` group by `votacion`.`id_candidato`;

SET FOREIGN_KEY_CHECKS = 1;


