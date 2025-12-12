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
INSERT INTO `adm_rol` VALUES (3, 'Técnico');
INSERT INTO `adm_rol` VALUES (4, 'Votante');

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
-- SuperUser---V0tac10N3s$2025
-- ----------------------------
INSERT INTO `adm_usuarios` VALUES (1, 'admin', '202cb962ac59075b964b07152d234b70', 2, 'adminis', 'trador', '12345678', 'admin@admin.com', 'Activo');


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
  `apellidoCasada` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dui` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fechaNac` date NULL DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `codigo` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2624 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


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
-- Table structure for departamentos
-- ----------------------------
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos`  (
  `id_depto` int(5) NOT NULL AUTO_INCREMENT,
  `codigo` int(5) NOT NULL,
  `depto` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eliminado` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_depto`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departamentos
-- ----------------------------
INSERT INTO `departamentos` VALUES (1, 1, 'Ahuachapán', '', '0');
INSERT INTO `departamentos` VALUES (2, 9, 'Cabañas', '', '0');
INSERT INTO `departamentos` VALUES (3, 4, 'Chalatenango', '', '0');
INSERT INTO `departamentos` VALUES (4, 0, 'Cuscatlán', '', '0');
INSERT INTO `departamentos` VALUES (5, 13, 'Morazán', '', '0');
INSERT INTO `departamentos` VALUES (6, 5, 'La Libertad', '', '0');
INSERT INTO `departamentos` VALUES (7, 8, 'La Paz', '', '0');
INSERT INTO `departamentos` VALUES (8, 7, 'La Union', 'Activo', '0');
INSERT INTO `departamentos` VALUES (9, 12, 'San Miguel', '', '0');
INSERT INTO `departamentos` VALUES (10, 6, 'San Salvador', '', '0');
INSERT INTO `departamentos` VALUES (11, 10, 'San Vicente', '', '0');
INSERT INTO `departamentos` VALUES (12, 2, 'Santa Ana ', '', '0');
INSERT INTO `departamentos` VALUES (13, 3, 'Sonsonate', '', '0');
INSERT INTO `departamentos` VALUES (14, 11, 'Usulután', '', '0');

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
-- Records of jornadas
-- ----------------------------

-- ----------------------------
-- Table structure for municipios
-- ----------------------------
DROP TABLE IF EXISTS `municipios`;
CREATE TABLE `municipios`  (
  `id_muni` int(5) NOT NULL AUTO_INCREMENT,
  `id_depto` int(5) NOT NULL,
  `codigo` int(5) NOT NULL,
  `municipio` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `estado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `eliminado` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_muni`) USING BTREE,
  INDEX `id_depto`(`id_depto`) USING BTREE,
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`id_depto`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 263 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of municipios
-- ----------------------------
INSERT INTO `municipios` VALUES (1, 1, 0, 'Ahuachapán', '', '0');
INSERT INTO `municipios` VALUES (2, 1, 0, 'Apaneca', '', '0');
INSERT INTO `municipios` VALUES (3, 1, 0, 'Atiquizaya', '', '0');
INSERT INTO `municipios` VALUES (4, 1, 0, 'Concepción de Ataco', '', '0');
INSERT INTO `municipios` VALUES (5, 1, 0, 'El Refugio', '', '0');
INSERT INTO `municipios` VALUES (6, 1, 0, 'Guaymango', '', '0');
INSERT INTO `municipios` VALUES (7, 1, 0, 'Jujutla', '', '0');
INSERT INTO `municipios` VALUES (8, 1, 0, 'San Francisco Menéndez', '', '0');
INSERT INTO `municipios` VALUES (9, 1, 0, 'San Lorenzo', '', '0');
INSERT INTO `municipios` VALUES (10, 1, 0, 'San Pedro Puxtla', '', '0');
INSERT INTO `municipios` VALUES (11, 1, 0, 'Tacuba', '', '0');
INSERT INTO `municipios` VALUES (12, 1, 0, 'Turín', '', '0');
INSERT INTO `municipios` VALUES (13, 2, 0, 'Cinquera', '', '0');
INSERT INTO `municipios` VALUES (14, 2, 0, 'Dolores / Villa Dolores', '', '0');
INSERT INTO `municipios` VALUES (15, 2, 0, 'Guacotecti', '', '0');
INSERT INTO `municipios` VALUES (16, 2, 0, 'Ilobasco', '', '0');
INSERT INTO `municipios` VALUES (17, 2, 0, 'Jutiapa', '', '0');
INSERT INTO `municipios` VALUES (18, 2, 0, 'San Isidro', '', '0');
INSERT INTO `municipios` VALUES (19, 2, 0, 'Sensuntepeque', '', '0');
INSERT INTO `municipios` VALUES (20, 2, 0, 'Tejutepeque', '', '0');
INSERT INTO `municipios` VALUES (21, 2, 0, 'Victoria', '', '0');
INSERT INTO `municipios` VALUES (22, 3, 0, 'Agua Caliente', '', '0');
INSERT INTO `municipios` VALUES (23, 3, 0, 'Arcatao', '', '0');
INSERT INTO `municipios` VALUES (24, 3, 0, 'Azacualpa', '', '0');
INSERT INTO `municipios` VALUES (25, 3, 0, 'Chalatenango', '', '0');
INSERT INTO `municipios` VALUES (26, 3, 0, 'Citalá', '', '0');
INSERT INTO `municipios` VALUES (27, 3, 0, 'Comalapa', '', '0');
INSERT INTO `municipios` VALUES (28, 3, 0, 'Concepción Quezaltepeque', '', '0');
INSERT INTO `municipios` VALUES (29, 3, 0, 'Dulce Nombre de María', '', '0');
INSERT INTO `municipios` VALUES (30, 3, 0, 'El Carrizal', '', '0');
INSERT INTO `municipios` VALUES (31, 3, 0, 'El Paraíso', '', '0');
INSERT INTO `municipios` VALUES (32, 3, 0, 'La Laguna', '', '0');
INSERT INTO `municipios` VALUES (33, 3, 0, 'La Palma', '', '0');
INSERT INTO `municipios` VALUES (34, 3, 0, 'La Reina', '', '0');
INSERT INTO `municipios` VALUES (35, 3, 0, 'Las Vueltas', '', '0');
INSERT INTO `municipios` VALUES (36, 3, 0, 'Nombre de Jesús', '', '0');
INSERT INTO `municipios` VALUES (37, 3, 0, 'Nueva Concepción', '', '0');
INSERT INTO `municipios` VALUES (38, 3, 0, 'Nueva Trinidad', '', '0');
INSERT INTO `municipios` VALUES (39, 3, 0, 'Ojos de Agua', '', '0');
INSERT INTO `municipios` VALUES (40, 3, 0, 'Potonico', '', '0');
INSERT INTO `municipios` VALUES (41, 3, 0, 'San Antonio de la Cruz', '', '0');
INSERT INTO `municipios` VALUES (42, 3, 0, 'San Antonio Los Ranchos', '', '0');
INSERT INTO `municipios` VALUES (43, 3, 0, 'San Fernando', '', '0');
INSERT INTO `municipios` VALUES (44, 3, 0, 'San Francisco Lempa', '', '0');
INSERT INTO `municipios` VALUES (45, 3, 0, 'San Francisco Morazán', '', '0');
INSERT INTO `municipios` VALUES (46, 3, 0, 'San Ignacio', '', '0');
INSERT INTO `municipios` VALUES (47, 3, 0, 'San Isidro Labrador', '', '0');
INSERT INTO `municipios` VALUES (48, 3, 0, 'San José Cancasque', '', '0');
INSERT INTO `municipios` VALUES (49, 3, 0, 'San José Las Flores', '', '0');
INSERT INTO `municipios` VALUES (50, 3, 0, 'San Luis del Carmen', '', '0');
INSERT INTO `municipios` VALUES (51, 3, 0, 'San Miguel de Mercedes', '', '0');
INSERT INTO `municipios` VALUES (52, 3, 0, 'San Rafael', '', '0');
INSERT INTO `municipios` VALUES (53, 3, 0, 'Santa Rita', '', '0');
INSERT INTO `municipios` VALUES (54, 3, 0, 'Tejutla', '', '0');
INSERT INTO `municipios` VALUES (55, 4, 0, 'Candelaria', '', '0');
INSERT INTO `municipios` VALUES (56, 4, 0, 'Cojutepeque', '', '0');
INSERT INTO `municipios` VALUES (57, 4, 0, 'El Carmen', '', '0');
INSERT INTO `municipios` VALUES (58, 4, 0, 'El Rosario', '', '0');
INSERT INTO `municipios` VALUES (59, 4, 0, 'Monte San Juan', '', '0');
INSERT INTO `municipios` VALUES (60, 4, 0, 'Oratorio de Concepción', '', '0');
INSERT INTO `municipios` VALUES (61, 4, 0, 'San Bartolomé Perulapía', '', '0');
INSERT INTO `municipios` VALUES (62, 4, 0, 'San Cristóbal', '', '0');
INSERT INTO `municipios` VALUES (63, 4, 0, 'San José Guayabal', '', '0');
INSERT INTO `municipios` VALUES (64, 4, 0, 'San Pedro Perulapán', '', '0');
INSERT INTO `municipios` VALUES (65, 4, 0, 'San Rafael Cedros', '', '0');
INSERT INTO `municipios` VALUES (66, 4, 0, 'San Ramón', '', '0');
INSERT INTO `municipios` VALUES (67, 4, 0, 'Santa Cruz Analquito', '', '0');
INSERT INTO `municipios` VALUES (68, 4, 0, 'Santa Cruz Michapa', '', '0');
INSERT INTO `municipios` VALUES (69, 4, 0, 'Suchitoto', '', '0');
INSERT INTO `municipios` VALUES (70, 4, 0, 'Tenancingo', '', '0');
INSERT INTO `municipios` VALUES (71, 5, 0, 'Arambala', '', '0');
INSERT INTO `municipios` VALUES (72, 5, 0, 'Cacaopera', '', '0');
INSERT INTO `municipios` VALUES (73, 5, 0, 'Chilanga', '', '0');
INSERT INTO `municipios` VALUES (74, 5, 0, 'Corinto', '', '0');
INSERT INTO `municipios` VALUES (75, 5, 0, 'Delicias de Concepción', '', '0');
INSERT INTO `municipios` VALUES (76, 5, 0, 'El Divisadero', '', '0');
INSERT INTO `municipios` VALUES (77, 5, 0, 'El Rosario', '', '0');
INSERT INTO `municipios` VALUES (78, 5, 0, 'Gualococti', '', '0');
INSERT INTO `municipios` VALUES (79, 5, 0, 'Guatajiagua', '', '0');
INSERT INTO `municipios` VALUES (80, 5, 0, 'Joateca', '', '0');
INSERT INTO `municipios` VALUES (81, 5, 0, 'Jocoaitique', '', '0');
INSERT INTO `municipios` VALUES (82, 5, 0, 'Jocoro', '', '0');
INSERT INTO `municipios` VALUES (83, 5, 0, 'Lolotiquillo', '', '0');
INSERT INTO `municipios` VALUES (84, 5, 0, 'Meanguera', '', '0');
INSERT INTO `municipios` VALUES (85, 5, 0, 'Osicala', '', '0');
INSERT INTO `municipios` VALUES (86, 5, 0, 'Perquín', '', '0');
INSERT INTO `municipios` VALUES (87, 5, 0, 'San Carlos', '', '0');
INSERT INTO `municipios` VALUES (88, 5, 0, 'San Fernando', '', '0');
INSERT INTO `municipios` VALUES (89, 5, 0, 'San Francisco Gotera', '', '0');
INSERT INTO `municipios` VALUES (90, 5, 0, 'San Isidro', '', '0');
INSERT INTO `municipios` VALUES (91, 5, 0, 'San Simón', '', '0');
INSERT INTO `municipios` VALUES (92, 5, 0, 'Sensembra', '', '0');
INSERT INTO `municipios` VALUES (93, 5, 0, 'Sociedad', '', '0');
INSERT INTO `municipios` VALUES (94, 5, 0, 'Torola', '', '0');
INSERT INTO `municipios` VALUES (95, 5, 0, 'Yamabal', '', '0');
INSERT INTO `municipios` VALUES (96, 5, 0, 'Yoloaiquín', '', '0');
INSERT INTO `municipios` VALUES (97, 6, 0, 'Antiguo Cuscatlán', '', '0');
INSERT INTO `municipios` VALUES (98, 6, 0, 'Chiltiupán', '', '0');
INSERT INTO `municipios` VALUES (99, 6, 0, 'Ciudad Arce', '', '0');
INSERT INTO `municipios` VALUES (100, 6, 0, 'Colón', '', '0');
INSERT INTO `municipios` VALUES (101, 6, 0, 'Comasagua', '', '0');
INSERT INTO `municipios` VALUES (102, 6, 0, 'Huizúcar', '', '0');
INSERT INTO `municipios` VALUES (103, 6, 0, 'Jayaque', '', '0');
INSERT INTO `municipios` VALUES (104, 6, 0, 'Jicalapa', '', '0');
INSERT INTO `municipios` VALUES (105, 6, 0, 'La Libertad', '', '0');
INSERT INTO `municipios` VALUES (106, 6, 0, 'Santa Tecla', '', '0');
INSERT INTO `municipios` VALUES (107, 6, 0, 'Nuevo Cuscatlán', '', '0');
INSERT INTO `municipios` VALUES (108, 6, 0, 'San Juan Opico', '', '0');
INSERT INTO `municipios` VALUES (109, 6, 0, 'Quezaltepeque', '', '0');
INSERT INTO `municipios` VALUES (110, 6, 0, 'Sacacoyo', '', '0');
INSERT INTO `municipios` VALUES (111, 6, 0, 'San José Villanueva', '', '0');
INSERT INTO `municipios` VALUES (112, 6, 0, 'San Matías', '', '0');
INSERT INTO `municipios` VALUES (113, 6, 0, 'San Pablo Tacachico', '', '0');
INSERT INTO `municipios` VALUES (114, 6, 0, 'Talnique', '', '0');
INSERT INTO `municipios` VALUES (115, 6, 0, 'Tamanique', '', '0');
INSERT INTO `municipios` VALUES (116, 6, 0, 'Teotepeque', '', '0');
INSERT INTO `municipios` VALUES (117, 6, 0, 'Tepecoyo', '', '0');
INSERT INTO `municipios` VALUES (118, 6, 0, 'Zaragoza', '', '0');
INSERT INTO `municipios` VALUES (119, 7, 0, 'Cuyultitán', '', '0');
INSERT INTO `municipios` VALUES (120, 7, 0, 'Rosario de La Paz', '', '0');
INSERT INTO `municipios` VALUES (121, 7, 0, 'Jerusalén', '', '0');
INSERT INTO `municipios` VALUES (122, 7, 0, 'Mercedes La Ceiba', '', '0');
INSERT INTO `municipios` VALUES (123, 7, 0, 'Olocuilta', '', '0');
INSERT INTO `municipios` VALUES (124, 7, 0, 'Paraíso de Osorio', '', '0');
INSERT INTO `municipios` VALUES (125, 7, 0, 'San Antonio Masahuat', '', '0');
INSERT INTO `municipios` VALUES (126, 7, 0, 'San Emigdio', '', '0');
INSERT INTO `municipios` VALUES (127, 7, 0, 'San Francisco Chinameca', '', '0');
INSERT INTO `municipios` VALUES (128, 7, 0, 'San Juan Nonualco', '', '0');
INSERT INTO `municipios` VALUES (129, 7, 0, 'San Juan Talpa', '', '0');
INSERT INTO `municipios` VALUES (130, 7, 0, 'San Juan Tepezontes', '', '0');
INSERT INTO `municipios` VALUES (131, 7, 0, 'San Luis La Herradura', '', '0');
INSERT INTO `municipios` VALUES (132, 7, 0, 'San Luis Talpa', '', '0');
INSERT INTO `municipios` VALUES (133, 7, 0, 'San Miguel Tepezontes', '', '0');
INSERT INTO `municipios` VALUES (134, 7, 0, 'San Pedro Masahuat', '', '0');
INSERT INTO `municipios` VALUES (135, 7, 0, 'San Pedro Nonualco', '', '0');
INSERT INTO `municipios` VALUES (136, 7, 0, 'San Rafael Obrajuelo', '', '0');
INSERT INTO `municipios` VALUES (137, 7, 0, 'Santa María Ostuma', '', '0');
INSERT INTO `municipios` VALUES (138, 7, 0, 'Santiago Nonualco', '', '0');
INSERT INTO `municipios` VALUES (139, 7, 0, 'Tapalhuaca', '', '0');
INSERT INTO `municipios` VALUES (140, 7, 0, 'Zacatecoluca', '', '0');
INSERT INTO `municipios` VALUES (141, 8, 0, 'Anamorós', '', '0');
INSERT INTO `municipios` VALUES (142, 8, 0, 'Bolívar', '', '0');
INSERT INTO `municipios` VALUES (143, 8, 0, 'Concepción de Oriente', '', '0');
INSERT INTO `municipios` VALUES (144, 8, 0, 'Conchagua', '', '0');
INSERT INTO `municipios` VALUES (145, 8, 0, 'El Carmen', '', '0');
INSERT INTO `municipios` VALUES (146, 8, 0, 'El Sauce', '', '0');
INSERT INTO `municipios` VALUES (147, 8, 0, 'Intipucá', '', '0');
INSERT INTO `municipios` VALUES (148, 8, 701, 'La Union', 'Activo', '0');
INSERT INTO `municipios` VALUES (149, 8, 0, 'Lilisque', '', '0');
INSERT INTO `municipios` VALUES (150, 8, 0, 'Meanguera del Golfo', '', '0');
INSERT INTO `municipios` VALUES (151, 8, 0, 'Nueva Esparta', '', '0');
INSERT INTO `municipios` VALUES (152, 8, 0, 'Pasaquina', '', '0');
INSERT INTO `municipios` VALUES (153, 8, 0, 'Polorós', '', '0');
INSERT INTO `municipios` VALUES (154, 8, 0, 'San Alejo', '', '0');
INSERT INTO `municipios` VALUES (155, 8, 0, 'San José', '', '0');
INSERT INTO `municipios` VALUES (156, 8, 0, 'Santa Rosa de Lima', '', '0');
INSERT INTO `municipios` VALUES (157, 8, 0, 'Yayantique', '', '0');
INSERT INTO `municipios` VALUES (158, 8, 0, 'Yucuaiquín', '', '0');
INSERT INTO `municipios` VALUES (159, 9, 0, 'Carolina', '', '0');
INSERT INTO `municipios` VALUES (160, 9, 0, 'Chapeltique', '', '0');
INSERT INTO `municipios` VALUES (161, 9, 0, 'Chinameca', '', '0');
INSERT INTO `municipios` VALUES (162, 9, 0, 'Chirilagua', '', '0');
INSERT INTO `municipios` VALUES (163, 9, 0, 'Ciudad Barrios', '', '0');
INSERT INTO `municipios` VALUES (164, 9, 0, 'Comacarán', '', '0');
INSERT INTO `municipios` VALUES (165, 9, 0, 'El Tránsito', '', '0');
INSERT INTO `municipios` VALUES (166, 9, 0, 'Lolotique', '', '0');
INSERT INTO `municipios` VALUES (167, 9, 0, 'Moncagua', '', '0');
INSERT INTO `municipios` VALUES (168, 9, 0, 'Nueva Guadalupe', '', '0');
INSERT INTO `municipios` VALUES (169, 9, 0, 'Nuevo Edén de San Juan', '', '0');
INSERT INTO `municipios` VALUES (170, 9, 0, 'Quelepa', '', '0');
INSERT INTO `municipios` VALUES (171, 9, 0, 'San Antonio del Mosco', '', '0');
INSERT INTO `municipios` VALUES (172, 9, 0, 'San Gerardo', '', '0');
INSERT INTO `municipios` VALUES (173, 9, 0, 'San Jorge', '', '0');
INSERT INTO `municipios` VALUES (174, 9, 0, 'San Luis de la Reina', '', '0');
INSERT INTO `municipios` VALUES (175, 9, 0, 'San Miguel', '', '0');
INSERT INTO `municipios` VALUES (176, 9, 0, 'San Rafael Oriente', '', '0');
INSERT INTO `municipios` VALUES (177, 9, 0, 'Sesori', '', '0');
INSERT INTO `municipios` VALUES (178, 9, 0, 'Uluazapa', '', '0');
INSERT INTO `municipios` VALUES (179, 10, 0, 'Aguilares', '', '0');
INSERT INTO `municipios` VALUES (180, 10, 0, 'Apopa', '', '0');
INSERT INTO `municipios` VALUES (181, 10, 0, 'Ayutuxtepeque', '', '0');
INSERT INTO `municipios` VALUES (182, 10, 0, 'Delgado', '', '0');
INSERT INTO `municipios` VALUES (183, 10, 0, 'Cuscatancingo', '', '0');
INSERT INTO `municipios` VALUES (184, 10, 0, 'El Paisnal', '', '0');
INSERT INTO `municipios` VALUES (185, 10, 0, 'Guazapa', '', '0');
INSERT INTO `municipios` VALUES (186, 10, 0, 'Ilopango', '', '0');
INSERT INTO `municipios` VALUES (187, 10, 0, 'Mejicanos', '', '0');
INSERT INTO `municipios` VALUES (188, 10, 0, 'Nejapa', '', '0');
INSERT INTO `municipios` VALUES (189, 10, 0, 'Panchimalco', '', '0');
INSERT INTO `municipios` VALUES (190, 10, 0, 'Rosario de Mora', '', '0');
INSERT INTO `municipios` VALUES (191, 10, 0, 'San Marcos', '', '0');
INSERT INTO `municipios` VALUES (192, 10, 0, 'San Martín', '', '0');
INSERT INTO `municipios` VALUES (193, 10, 0, 'San Salvador', '', '0');
INSERT INTO `municipios` VALUES (194, 10, 0, 'Santiago Texacuangos', '', '0');
INSERT INTO `municipios` VALUES (195, 10, 0, 'Santo Tomás', '', '0');
INSERT INTO `municipios` VALUES (196, 10, 0, 'Soyapango', '', '0');
INSERT INTO `municipios` VALUES (197, 10, 0, 'Tonacatepeque', '', '0');
INSERT INTO `municipios` VALUES (198, 11, 0, 'Apastepeque', '', '0');
INSERT INTO `municipios` VALUES (199, 11, 0, 'Guadalupe', '', '0');
INSERT INTO `municipios` VALUES (200, 11, 0, 'San Cayetano Istepeque', '', '0');
INSERT INTO `municipios` VALUES (201, 11, 0, 'San Esteban Catarina', '', '0');
INSERT INTO `municipios` VALUES (202, 11, 0, 'San Ildefonso', '', '0');
INSERT INTO `municipios` VALUES (203, 11, 0, 'San Lorenzo', '', '0');
INSERT INTO `municipios` VALUES (204, 11, 0, 'San Sebastián', '', '0');
INSERT INTO `municipios` VALUES (205, 11, 0, 'San Vicente', '', '0');
INSERT INTO `municipios` VALUES (206, 11, 0, 'Santa Clara', '', '0');
INSERT INTO `municipios` VALUES (207, 11, 0, 'Santo Domingo', '', '0');
INSERT INTO `municipios` VALUES (208, 11, 0, 'Tecoluca', '', '0');
INSERT INTO `municipios` VALUES (209, 11, 0, 'Tepetitán', '', '0');
INSERT INTO `municipios` VALUES (210, 11, 0, 'Verapaz', '', '0');
INSERT INTO `municipios` VALUES (211, 12, 0, 'Candelaria de la Frontera', '', '0');
INSERT INTO `municipios` VALUES (212, 12, 0, 'Chalchuapa', '', '0');
INSERT INTO `municipios` VALUES (213, 12, 0, 'Coatepeque', '', '0');
INSERT INTO `municipios` VALUES (214, 12, 0, 'El Congo', '', '0');
INSERT INTO `municipios` VALUES (215, 12, 0, 'El Porvenir', '', '0');
INSERT INTO `municipios` VALUES (216, 12, 0, 'Masahuat', '', '0');
INSERT INTO `municipios` VALUES (217, 12, 0, 'Metapán', '', '0');
INSERT INTO `municipios` VALUES (218, 12, 0, 'San Antonio Pajonal', '', '0');
INSERT INTO `municipios` VALUES (219, 12, 0, 'San Sebastián Salitrillo', '', '0');
INSERT INTO `municipios` VALUES (220, 12, 0, 'Santa Ana', '', '0');
INSERT INTO `municipios` VALUES (221, 12, 0, 'Santa Rosa Guachipilín', '', '0');
INSERT INTO `municipios` VALUES (222, 12, 0, 'Santiago de la Frontera', '', '0');
INSERT INTO `municipios` VALUES (223, 12, 0, 'Texistepeque', '', '0');
INSERT INTO `municipios` VALUES (224, 13, 0, 'Acajutla', '', '0');
INSERT INTO `municipios` VALUES (225, 13, 0, 'Armenia', '', '0');
INSERT INTO `municipios` VALUES (226, 13, 0, 'Caluco', '', '0');
INSERT INTO `municipios` VALUES (227, 13, 0, 'Cuisnahuat', '', '0');
INSERT INTO `municipios` VALUES (228, 13, 0, 'Izalco', '', '0');
INSERT INTO `municipios` VALUES (229, 13, 0, 'Juayúa', '', '0');
INSERT INTO `municipios` VALUES (230, 13, 0, 'Nahuizalco', '', '0');
INSERT INTO `municipios` VALUES (231, 13, 0, 'Nahulingo', '', '0');
INSERT INTO `municipios` VALUES (232, 13, 0, 'Salcoatitán', '', '0');
INSERT INTO `municipios` VALUES (233, 13, 0, 'San Antonio del Monte', '', '0');
INSERT INTO `municipios` VALUES (234, 13, 0, 'San Julián', '', '0');
INSERT INTO `municipios` VALUES (235, 13, 0, 'Santa Catarina Masahuat', '', '0');
INSERT INTO `municipios` VALUES (236, 13, 0, 'Santa Isabel Ishuatán', '', '0');
INSERT INTO `municipios` VALUES (237, 13, 0, 'Santo Domingo de Guzmán', '', '0');
INSERT INTO `municipios` VALUES (238, 13, 0, 'Sonsonate', '', '0');
INSERT INTO `municipios` VALUES (239, 13, 0, 'Sonzacate', '', '0');
INSERT INTO `municipios` VALUES (240, 14, 0, 'Alegría', '', '0');
INSERT INTO `municipios` VALUES (241, 14, 0, 'Berlín', '', '0');
INSERT INTO `municipios` VALUES (242, 14, 0, 'California', '', '0');
INSERT INTO `municipios` VALUES (243, 14, 0, 'Concepción Batres', '', '0');
INSERT INTO `municipios` VALUES (244, 14, 0, 'El Triunfo', '', '0');
INSERT INTO `municipios` VALUES (245, 14, 0, 'Ereguayquín', '', '0');
INSERT INTO `municipios` VALUES (246, 14, 0, 'Estanzuelas', '', '0');
INSERT INTO `municipios` VALUES (247, 14, 0, 'Jiquilisco', '', '0');
INSERT INTO `municipios` VALUES (248, 14, 0, 'Jucuapa', '', '0');
INSERT INTO `municipios` VALUES (249, 14, 0, 'Jucuarán', '', '0');
INSERT INTO `municipios` VALUES (250, 14, 0, 'Mercedes Umaña', '', '0');
INSERT INTO `municipios` VALUES (251, 14, 0, 'Nueva Granada', '', '0');
INSERT INTO `municipios` VALUES (252, 14, 0, 'Ozatlán', '', '0');
INSERT INTO `municipios` VALUES (253, 14, 0, 'Puerto El Triunfo', '', '0');
INSERT INTO `municipios` VALUES (254, 14, 0, 'San Agustín', '', '0');
INSERT INTO `municipios` VALUES (255, 14, 0, 'San Buenaventura', '', '0');
INSERT INTO `municipios` VALUES (256, 14, 0, 'San Dionisio', '', '0');
INSERT INTO `municipios` VALUES (257, 14, 0, 'San Francisco Javier', '', '0');
INSERT INTO `municipios` VALUES (258, 14, 0, 'Santa Elena', '', '0');
INSERT INTO `municipios` VALUES (259, 14, 0, 'Santa María', '', '0');
INSERT INTO `municipios` VALUES (260, 14, 0, 'Santiago de María', '', '0');
INSERT INTO `municipios` VALUES (261, 14, 0, 'Tecapán', '', '0');
INSERT INTO `municipios` VALUES (262, 14, 0, 'Usulután', '', '0');

-- ----------------------------
-- Table structure for parametros
-- ----------------------------
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE `parametros`  (
  `id_parametro` int(10) NOT NULL AUTO_INCREMENT,
  `id_depto` int(10) NULL DEFAULT NULL,
  `id_muni` int(10) NULL DEFAULT NULL,
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
  PRIMARY KEY (`id_parametro`) USING BTREE,
  INDEX `depto`(`id_depto`) USING BTREE,
  INDEX `muni`(`id_muni`) USING BTREE,
  CONSTRAINT `parametros_ibfk_1` FOREIGN KEY (`id_depto`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `parametros_ibfk_2` FOREIGN KEY (`id_muni`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;


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


