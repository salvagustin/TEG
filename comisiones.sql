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
INSERT INTO `adm_rol` VALUES (5, 'Auto');
INSERT INTO `adm_rol` VALUES (6, 'prueba');

-- ----------------------------
-- Table structure for adm_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `adm_usuarios`;
CREATE TABLE `adm_usuarios`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_depto` int(11) NULL DEFAULT NULL,
  `id_muni` int(11) NULL DEFAULT NULL,
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
  INDEX `id_depto`(`id_depto`) USING BTREE,
  INDEX `id_muni`(`id_muni`) USING BTREE,
  CONSTRAINT `adm_usuarios_ibfk_1` FOREIGN KEY (`id_depto`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adm_usuarios_ibfk_2` FOREIGN KEY (`id_muni`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `adm_usuarios_ibfk_3` FOREIGN KEY (`rol`) REFERENCES `adm_rol` (`rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of adm_usuarios
-- ----------------------------
INSERT INTO `adm_usuarios` VALUES (1, 8, 148, 'gilber44', 'ed7cb761d60ca7068d41f880a9d79b19', 1, 'Gilber Edgardo ', 'Reyes Muñoz', '26042739', 'gilber_reyes@hotmail.es', 'Activo');
INSERT INTO `adm_usuarios` VALUES (2, 10, 193, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2, 'Aministrador', 'TEG', '', '', 'Activo');
INSERT INTO `adm_usuarios` VALUES (54, 10, 181, 'administrador', '21232f297a57a5a743894a0e4a801fc3', 3, 'Alcaldía Municipal', 'Ayutuxtepeque', '22069804', 'uaip@ayutuxtepeque.gob.sv', 'Activo');
INSERT INTO `adm_usuarios` VALUES (77, 10, 193, 'jose ruben', 'fe07d7f0598327c3190129bb0328bc21', 1, 'JOSE RUBEN ', 'CASTRO GOCHEZ', '25341230', 'jrcastro007@yahoo.com.mx', 'Activo');
INSERT INTO `adm_usuarios` VALUES (78, 10, 180, 'User1', '202cb962ac59075b964b07152d234b70', 3, 'Alcaldía Municipal', 'Apopa', '25341230', 'apopa@gmail.com', 'Activo');
INSERT INTO `adm_usuarios` VALUES (79, 10, 181, 'User1', '202cb962ac59075b964b07152d234b70', 3, 'usuario ', 'prueba', '25341230', '1234@hotmail.com', 'Activo');

-- ----------------------------
-- Table structure for afiliados
-- ----------------------------
DROP TABLE IF EXISTS `afiliados`;
CREATE TABLE `afiliados`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `afiliacion` int(11) NULL DEFAULT NULL,
  `primerNombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `segundoNombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `primerApellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `segundoApellido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `apellidoCasada` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sexo` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dui` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fechaNac` date NULL DEFAULT NULL,
  `deptoExpe` int(11) NULL DEFAULT NULL,
  `muniExpe` int(11) NULL DEFAULT NULL,
  `fechaExpe` date NULL DEFAULT NULL,
  `depto` int(11) NULL DEFAULT NULL,
  `muni` int(11) NULL DEFAULT NULL,
  `direccion` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `telefonoResi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `celularResi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `trabajoResi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cargo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pregunta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `respuesta` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `codigo` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `horaIngreso` time(0) NULL DEFAULT NULL,
  `fechaIngreso` date NULL DEFAULT NULL,
  `id_depaPertenece` int(11) NULL DEFAULT NULL,
  `id_muniPertenece` int(11) NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `deptoExpe`(`deptoExpe`) USING BTREE,
  INDEX `muniExpe`(`muniExpe`) USING BTREE,
  INDEX `muni`(`muni`) USING BTREE,
  INDEX `depto`(`depto`) USING BTREE,
  INDEX `muniPertenece`(`id_muniPertenece`) USING BTREE,
  INDEX `depaPertenece`(`id_depaPertenece`) USING BTREE,
  CONSTRAINT `afiliados_ibfk_1` FOREIGN KEY (`deptoExpe`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `afiliados_ibfk_2` FOREIGN KEY (`muniExpe`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `afiliados_ibfk_3` FOREIGN KEY (`id_muniPertenece`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `afiliados_ibfk_4` FOREIGN KEY (`id_depaPertenece`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2624 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of afiliados
-- ----------------------------
INSERT INTO `afiliados` VALUES (2220, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '2017-10-31', 1, 1, '', '', '', '', 'Empleado', 'TU COLOR FAVORITO', 'AZUL', '44D3A3', '11:47:26', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2221, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '2017-10-31', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2222, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '2017-11-01', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2223, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '2017-11-02', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2224, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '2017-11-03', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2225, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '2017-11-04', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2226, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '2017-11-05', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2227, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '2017-11-06', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2228, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '2017-11-07', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2229, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '2017-11-08', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2230, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '2017-11-09', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2231, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '2017-11-10', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2232, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '2017-11-11', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2233, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '2017-11-12', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2234, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '2017-11-13', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2235, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '2017-11-14', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2236, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '2017-11-15', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2237, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '2017-11-16', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:19:45', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2238, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2239, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2240, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2241, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2242, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2243, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2244, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2245, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2246, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2247, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2248, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2249, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2250, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2251, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2252, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2253, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2254, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2255, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:05:38', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2256, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2257, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2258, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2259, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2260, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2261, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2262, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2263, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2264, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2265, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2266, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2267, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2268, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2269, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2270, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2271, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:08', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2272, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:08', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2273, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2274, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:08', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2275, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:03', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2276, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2277, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2278, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2279, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2280, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2281, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2282, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2283, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2284, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2285, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2286, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2287, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2288, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2289, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2290, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2291, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2292, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2293, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:06:52', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2294, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2295, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2296, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2297, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2298, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2299, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2300, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2301, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2302, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2303, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2304, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2305, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2306, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2307, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2308, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2309, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2310, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2311, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:15:40', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2312, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2313, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2314, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2315, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2316, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2317, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2318, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2319, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2320, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2321, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2322, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2323, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2324, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2325, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2326, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2327, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2328, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2329, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', '', NULL, NULL, NULL, '20:16:04', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2330, 1, 'GILBER', 'EDGARDO', 'REYES', 'MUÑOZ', '', 'M', '04304568-3', '', '0000-00-00', 1, 1, '2017-10-31', 1, 1, '', '', '', '', 'Empleado', 'TU PELICULA FAVORITA', 'CABALLO DE GUERRA', 'C53C05', '21:18:26', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2331, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2332, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2333, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2334, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2335, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2336, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2337, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2338, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2339, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2340, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2341, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2342, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2343, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2344, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2345, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2346, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2347, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Empleado', NULL, NULL, NULL, '20:17:01', '2021-02-01', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2348, 1, 'ESMERALDA', 'CAROLINA', 'NAVARRETE', 'DOMINGUEZ', '', 'F', '04523784-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2349, 2, 'ROXANA', 'NATALI', 'ZELAYA', 'GRANADOS', '', 'F', '05523794-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2350, 3, 'GUADALUPE', 'DE JESUS', 'HERNANDEZ', 'ROMERO', '', 'M', '00508371-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2351, 4, 'MARIA', 'ROSAURA', 'MARTINEZ', 'DE HERNANDEZ', '', 'F', '01983344-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2352, 5, 'SULMA', 'GICELA', 'AMAYA', 'ORELLANA', '', 'F', '01159622-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2353, 6, 'LUCIA', 'DEL CARMEN', 'HERNANDEZ', 'DE CRUZ', '', 'F', '02598116-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2354, 7, 'RUTH', 'AVIGAIL', 'NAVARRETA', 'VILLATORO', '', 'F', '02488106-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2355, 8, 'BERTHA', 'CAROLINA', 'NAVARRETE', 'RUBIO', '', 'F', '00719484-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2356, 9, 'MANUEL', 'DE JASUS', 'FUENTES', 'CUEVA', '', 'M', '03357898-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2357, 10, 'CRISTINA', '', 'CRUZ', 'DOMINGUEZ', '', 'F', '02975022-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2358, 11, 'JULIO', 'HUMBERTO', 'ARAUJO', '', '', 'M', '02991541-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2359, 12, 'GILMAR', '', 'ANDRADE', 'ACOSTA', '', 'M', '01922110-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2360, 13, 'MARIA', 'CONCEPCION', 'REYES', '', '', 'F', '00729380-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2361, 14, 'JUAN', 'FRANCISCO', 'BENITEZ', 'VALLE', '', 'M', '04155717-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2362, 15, 'CELSO', 'ALBERTO', 'YANES', 'ZEPEDA', '', 'M', '04070940-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2363, 16, 'HENRRY', 'ISAAC', 'BENITEZ', 'BENITEZ', '', 'M', '04463500-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2364, 17, 'DOUGLAS', 'HAZIEL', 'ANDINO', 'SUAZO', '', 'M', '03816225-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2365, 18, 'MAURICIO', 'ALFREDO', 'ARANA', '', '', 'M', '02976374-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2366, 19, 'PEDRO', 'ERNESTO', 'OLIVA', 'VILLATORO', '', 'M', '02895606-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2367, 20, 'JOSE', 'ARTURO', 'VENTURA', 'REYES', '', 'M', '00014860-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2368, 21, 'VICTOR', 'MANUEL', 'HERNANDEZ', 'FUENTEZ', '', 'M', '02607016-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2369, 22, 'ZULMA', 'TERESA', 'REYES', 'GONZALEZ', '', 'F', '01849862-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2370, 23, 'SANDRA', 'ISABEL', 'BENITEZ', 'PERLA', '', 'F', '03575842-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2371, 24, 'WENDY', 'CAROLINA', 'CANALES', 'MATA', '', 'F', '02687662-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2372, 25, 'KRISSIA', 'GABRIELA', 'GOMEZ', '', 'DE TORRES', 'F', '04045396-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2373, 26, 'JORGE', 'MAURICIO', 'VASQUEZ', 'CABRERA', '', 'M', '05748793-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2374, 27, 'MARIA', 'ERLINDA', 'CABRERA', 'GRANADOS', '', 'F', '04210956-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2375, 28, 'SANTOS', 'ERLINDA', 'TORRES', 'ESCOBAR', '', 'F', '03853975-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2376, 29, 'MARIA', 'DEL CARMEN', 'EUCEDA', 'JIMENEZ', '', 'F', '03990337-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2377, 30, 'FREDI', 'ANTONIO', 'RUIZ', 'CABRERA', '', 'M', '04945602-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2378, 31, 'MARIA', 'BLANCA NUBIA', 'FERNANDEZ', 'YANES', '', 'F', '04337271-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2379, 32, 'MARIA', 'ARACELI', 'YANES', 'FERNANDEZ', '', 'F', '04466020-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2380, 33, 'JOSE', 'SANTOS', 'RUIZ', 'PEREZ', '', 'M', '00220463-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2381, 34, 'MARITZA', 'DEL CARMEN', 'RUIZ', 'CABRERA', '', 'F', '05707309-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2382, 35, 'WILFREDO', '', 'RUIZ', 'PEREZ', '', 'M', '03062792-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2383, 36, 'EVER', 'ARMANDO', 'LINO', 'RUIZ', '', 'M', '06173160-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2384, 37, 'MARTA', 'ALICIA', 'RUIZ', '', 'DE TELLES', 'F', '04400568-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2385, 38, 'GLORIA', 'DEL CARMEN', 'MARTÍNEZ', 'ALVARADO', '', 'F', '00985433-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2386, 39, 'JOSE', 'GUILLERMO', 'PEREZ', '', '', 'M', '04095803-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:59:46', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2387, 1, 'ESMERALDA', 'CAROLINA', 'NAVARRETE', 'DOMINGUEZ', '', 'F', '04523784-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2388, 2, 'ROXANA', 'NATALI', 'ZELAYA', 'GRANADOS', '', 'F', '05523794-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2389, 3, 'GUADALUPE', 'DE JESUS', 'HERNANDEZ', 'ROMERO', '', 'M', '00508371-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2390, 4, 'MARIA', 'ROSAURA', 'MARTINEZ', 'DE HERNANDEZ', '', 'F', '01983344-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2391, 5, 'SULMA', 'GICELA', 'AMAYA', 'ORELLANA', '', 'F', '01159622-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2392, 6, 'LUCIA', 'DEL CARMEN', 'HERNANDEZ', 'DE CRUZ', '', 'F', '02598116-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2393, 7, 'RUTH', 'AVIGAIL', 'NAVARRETA', 'VILLATORO', '', 'F', '02488106-2', '', '0000-00-00', 1, 1, '2021-02-01', 1, 1, '', '', '', '', 'Quezaltepeque', 'NOMBRE DE TU MADRE', 'TU MADRE', 'EE18A5', '17:10:26', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2394, 8, 'BERTHA', 'CAROLINA', 'NAVARRETE', 'RUBIO', '', 'F', '00719484-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2395, 9, 'MANUEL', 'DE JASUS', 'FUENTES', 'CUEVA', '', 'M', '03357898-5', '', '0000-00-00', 1, 1, '2021-03-08', 1, 1, '', '', '', '', 'Quezaltepeque', 'TU COLOR FAVORITO', 'AZUL', '61567A', '17:22:30', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2396, 10, 'CRISTINA', '', 'CRUZ', 'DOMINGUEZ', '', 'F', '02975022-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2397, 11, 'JULIO', 'HUMBERTO', 'ARAUJO', '', '', 'M', '02991541-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2398, 12, 'GILMAR', '', 'ANDRADE', 'ACOSTA', '', 'M', '01922110-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2399, 13, 'MARIA', 'CONCEPCION', 'REYES', '', '', 'F', '00729380-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2400, 14, 'JUAN', 'FRANCISCO', 'BENITEZ', 'VALLE', '', 'M', '04155717-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2401, 15, 'CELSO', 'ALBERTO', 'YANES', 'ZEPEDA', '', 'M', '04070940-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2402, 16, 'HENRRY', 'ISAAC', 'BENITEZ', 'BENITEZ', '', 'M', '04463500-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2403, 17, 'DOUGLAS', 'HAZIEL', 'ANDINO', 'SUAZO', '', 'M', '03816225-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2404, 18, 'MAURICIO', 'ALFREDO', 'ARANA', '', '', 'M', '02976374-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2405, 19, 'PEDRO', 'ERNESTO', 'OLIVA', 'VILLATORO', '', 'M', '02895606-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2406, 20, 'JOSE', 'ARTURO', 'VENTURA', 'REYES', '', 'M', '00014860-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2407, 21, 'VICTOR', 'MANUEL', 'HERNANDEZ', 'FUENTEZ', '', 'M', '02607016-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2408, 22, 'ZULMA', 'TERESA', 'REYES', 'GONZALEZ', '', 'F', '01849862-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2409, 23, 'SANDRA', 'ISABEL', 'BENITEZ', 'PERLA', '', 'F', '03575842-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2410, 24, 'WENDY', 'CAROLINA', 'CANALES', 'MATA', '', 'F', '02687662-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2411, 25, 'KRISSIA', 'GABRIELA', 'GOMEZ', '', 'DE TORRES', 'F', '04045396-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2412, 26, 'JORGE', 'MAURICIO', 'VASQUEZ', 'CABRERA', '', 'M', '05748793-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2413, 27, 'MARIA', 'ERLINDA', 'CABRERA', 'GRANADOS', '', 'F', '04210956-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2414, 28, 'SANTOS', 'ERLINDA', 'TORRES', 'ESCOBAR', '', 'F', '03853975-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2415, 29, 'MARIA', 'DEL CARMEN', 'EUCEDA', 'JIMENEZ', '', 'F', '03990337-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2416, 30, 'FREDI', 'ANTONIO', 'RUIZ', 'CABRERA', '', 'M', '04945602-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2417, 31, 'MARIA', 'BLANCA NUBIA', 'FERNANDEZ', 'YANES', '', 'F', '04337271-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2418, 32, 'MARIA', 'ARACELI', 'YANES', 'FERNANDEZ', '', 'F', '04466020-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2419, 33, 'JOSE', 'SANTOS', 'RUIZ', 'PEREZ', '', 'M', '00220463-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2420, 34, 'MARITZA', 'DEL CARMEN', 'RUIZ', 'CABRERA', '', 'F', '05707309-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2421, 35, 'WILFREDO', '', 'RUIZ', 'PEREZ', '', 'M', '03062792-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2422, 36, 'EVER', 'ARMANDO', 'LINO', 'RUIZ', '', 'M', '06173160-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2423, 37, 'MARTA', 'ALICIA', 'RUIZ', '', 'DE TELLES', 'F', '04400568-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2424, 38, 'GLORIA', 'DEL CARMEN', 'MARTÍNEZ', 'ALVARADO', '', 'F', '00985433-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2425, 39, 'JOSE', 'GUILLERMO', 'PEREZ', '', '', 'M', '04095803-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '17:05:37', '2021-03-08', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2426, 1, 'ESMERALDA', 'CAROLINA', 'NAVARRETE', 'DOMINGUEZ', '', 'F', '04523784-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, 'A52093', '16:28:16', '2021-03-10', 1, 1, '1');
INSERT INTO `afiliados` VALUES (2427, 2, 'ROXANA', 'NATALI', 'ZELAYA', 'GRANADOS', '', 'F', '05523794-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2428, 3, 'GUADALUPE', 'DE JESUS', 'HERNANDEZ', 'ROMERO', '', 'M', '00508371-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2429, 4, 'MARIA', 'ROSAURA', 'MARTINEZ', 'DE HERNANDEZ', '', 'F', '01983344-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2430, 5, 'SULMA', 'GICELA', 'AMAYA', 'ORELLANA', '', 'F', '01159622-6', '', '0000-00-00', 1, 1, '2021-03-10', 1, 1, '', '', '', '', 'Quezaltepeque', 'TU COLOR FAVORITO', 'NEGRO', 'B665BB', '17:03:00', '2021-03-10', 1, 1, '0');
INSERT INTO `afiliados` VALUES (2431, 6, 'LUCIA', 'DEL CARMEN', 'HERNANDEZ', 'DE CRUZ', '', 'F', '02598116-6', '', '0000-00-00', 1, 1, '2021-02-16', 1, 1, '', '', '', '', 'Quezaltepeque', 'TU PELICULA FAVORITA', '2012', '0F21C6', '16:25:54', '2021-03-10', 1, 1, '0');
INSERT INTO `afiliados` VALUES (2432, 7, 'RUTH', 'AVIGAIL', 'NAVARRETA', 'VILLATORO', '', 'F', '02488106-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2433, 8, 'BERTHA', 'CAROLINA', 'NAVARRETE', 'RUBIO', '', 'F', '00719484-2', '', '0000-00-00', 1, 1, '1963-12-31', 1, 1, '', '', '', '', 'Quezaltepeque', 'TU COLOR FAVORITO', 'PEPE', 'BEE6B7', '11:30:08', '2021-03-25', 1, 1, '0');
INSERT INTO `afiliados` VALUES (2434, 9, 'MANUEL', 'DE JASUS', 'FUENTES', 'CUEVA', '', 'M', '03357898-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2435, 10, 'CRISTINA', '', 'CRUZ', 'DOMINGUEZ', '', 'F', '02975022-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, '104933', '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2436, 11, 'JULIO', 'HUMBERTO', 'ARAUJO', '', '', 'M', '02991541-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2437, 12, 'GILMAR', '', 'ANDRADE', 'ACOSTA', '', 'M', '01922110-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2438, 13, 'MARIA', 'CONCEPCION', 'REYES', '', '', 'F', '00729380-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2439, 14, 'JUAN', 'FRANCISCO', 'BENITEZ', 'VALLE', '', 'M', '04155717-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2440, 15, 'CELSO', 'ALBERTO', 'YANES', 'ZEPEDA', '', 'M', '04070940-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2441, 16, 'HENRRY', 'ISAAC', 'BENITEZ', 'BENITEZ', '', 'M', '04463500-9', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2442, 17, 'DOUGLAS', 'HAZIEL', 'ANDINO', 'SUAZO', '', 'M', '03816225-0', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2443, 18, 'MAURICIO', 'ALFREDO', 'ARANA', '', '', 'M', '02976374-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2444, 19, 'PEDRO', 'ERNESTO', 'OLIVA', 'VILLATORO', '', 'M', '02895606-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2445, 20, 'JOSE', 'ARTURO', 'VENTURA', 'REYES', '', 'M', '00014860-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2446, 21, 'VICTOR', 'MANUEL', 'HERNANDEZ', 'FUENTEZ', '', 'M', '02607016-2', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2447, 22, 'ZULMA', 'TERESA', 'REYES', 'GONZALEZ', '', 'F', '01849862-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2448, 23, 'SANDRA', 'ISABEL', 'BENITEZ', 'PERLA', '', 'F', '03575842-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2449, 24, 'WENDY', 'CAROLINA', 'CANALES', 'MATA', '', 'F', '02687662-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2450, 25, 'KRISSIA', 'GABRIELA', 'GOMEZ', '', 'DE TORRES', 'F', '04045396-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2451, 26, 'JORGE', 'MAURICIO', 'VASQUEZ', 'CABRERA', '', 'M', '05748793-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2452, 27, 'MARIA', 'ERLINDA', 'CABRERA', 'GRANADOS', '', 'F', '04210956-5', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2453, 28, 'SANTOS', 'ERLINDA', 'TORRES', 'ESCOBAR', '', 'F', '03853975-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2454, 29, 'MARIA', 'DEL CARMEN', 'EUCEDA', 'JIMENEZ', '', 'F', '03990337-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2455, 30, 'FREDI', 'ANTONIO', 'RUIZ', 'CABRERA', '', 'M', '04945602-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2456, 31, 'MARIA', 'BLANCA NUBIA', 'FERNANDEZ', 'YANES', '', 'F', '04337271-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2457, 32, 'MARIA', 'ARACELI', 'YANES', 'FERNANDEZ', '', 'F', '04466020-8', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2458, 33, 'JOSE', 'SANTOS', 'RUIZ', 'PEREZ', '', 'M', '00220463-4', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2459, 34, 'MARITZA', 'DEL CARMEN', 'RUIZ', 'CABRERA', '', 'F', '05707309-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2460, 35, 'WILFREDO', '', 'RUIZ', 'PEREZ', '', 'M', '03062792-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2461, 36, 'EVER', 'ARMANDO', 'LINO', 'RUIZ', '', 'M', '06173160-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2462, 37, 'MARTA', 'ALICIA', 'RUIZ', '', 'DE TELLES', 'F', '04400568-6', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2463, 38, 'GLORIA', 'DEL CARMEN', 'MARTÍNEZ', 'ALVARADO', '', 'F', '00985433-3', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2464, 39, 'JOSE', 'GUILLERMO', 'PEREZ', '', '', 'M', '04095803-1', '', '0000-00-00', 1, 1, '0000-00-00', 1, 1, '', '', '', '', 'Quezaltepeque', NULL, NULL, NULL, '16:28:16', '2021-03-10', 1, 1, '2');
INSERT INTO `afiliados` VALUES (2465, 1, 'RAFAEL', 'ALEJANDRO', 'NÓCHEZ', 'SOLANO', '', 'M', '01889740-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '1');
INSERT INTO `afiliados` VALUES (2466, 2, 'BETSAIDA', 'DE JESUS', 'MUÑOZ', 'NOUBLEAU', '', 'F', '01454735-7', '', '0000-00-00', 10, 181, '2018-12-20', 10, 181, '', '', '', '', 'Empleado', 'TU PELICULA FAVORITA', 'MATRIX', '5EC5CC', '07:41:56', '2021-09-09', 10, 181, '0');
INSERT INTO `afiliados` VALUES (2467, 3, 'IRMA', 'ARACELY', 'FLORES', '', 'DE BAUTISTA', 'F', '02201915-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2468, 4, 'VICTOR', 'MANUEL', 'MIJANGO', 'DUKE', '', 'M', '01687162-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2469, 5, 'FRANCISCO', 'JAVIER', 'DELGADO', 'LANDAVERDE', '', 'M', '02177520-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2470, 6, 'CAYETANO JOEL', 'DEL CID', 'ZELAYA', 'QUINTANILLA', '', 'M', '03592528-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '1');
INSERT INTO `afiliados` VALUES (2471, 7, 'FRANCISCO', 'ERNESTO', 'MELENDEZ', 'SEGOVIA', '', 'M', '00994457-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2472, 8, 'MARIO', 'ERNESTO', 'CAMPOS', 'CUBIAS', '', 'M', '01075371-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2473, 9, 'ROSA', 'GLADYS', 'CRUZ', 'MELENDEZ', '', 'F', '01718037-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2474, 10, 'FLORENS', 'STEPHANIE', 'ARAGON', '', '', 'F', '04056228-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2475, 11, 'NAPOLEON', '', 'BENAVIDES', 'CISNEROS', '', 'M', '02264556-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2476, 12, 'FRANCISCO', 'JAVIER', 'CHAVEZ', 'FLORENTINO', '', 'M', '03253433-6', '', '0000-00-00', 10, 181, '2019-04-08', 10, 181, '', '', '', '', 'Empleado', 'TU COLOR FAVORITO', 'NEGRO', 'D8B15E', '14:23:09', '2021-06-23', 10, 181, '0');
INSERT INTO `afiliados` VALUES (2477, 13, 'JAIME', 'ARISTIDES', 'ALFARO', 'ESCOBAR', '', 'M', '03098708-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2478, 14, 'WILFREDO', '', 'FLORES', 'BENITEZ', '', 'M', '00854588-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2479, 15, 'ANDRES', '', 'MARTINEZ', 'DUEÑAS', '', 'M', '01990414-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2480, 16, 'ROSENDO', '', 'FLORES', 'MENENDEZ', '', 'M', '00868233-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2481, 17, 'GABRIEL', 'ANTONIO', 'GUARDADO', 'DELGADO', '', 'M', '01637062-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2482, 18, 'JOSE', 'GERMAN', 'MIRANDA', 'MIRANDA', '', 'M', '00106693-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2483, 19, 'JULIO', 'ERNESTO', 'MOLINA', '', '', 'M', '00465462-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2484, 20, 'JOSE', 'HERIBERTO', 'PONCE', 'RIVAS', '', 'M', '01885174-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2485, 21, 'RAUL', 'ARMANDO', 'ORTIZ', '', '', 'M', '02194957-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2486, 22, 'CARLOS', 'ANTONIO', 'RODRIGUEZ', 'ERAZO', '', 'M', '00788091-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2487, 23, 'JOSE', 'ALEXANDER', 'PREZA', 'CORTEZ', '', 'M', '00386836-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2488, 24, 'JOSE', 'ANTONIO', 'CUADRA', '', '', 'M', '00390869-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2489, 25, 'JOSE', 'ARTURO', 'ARAUJO', 'AGUILA', '', 'M', '00912409-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2490, 26, 'JOSE', 'DE JESUS', 'HERNANDEZ', 'MEJIA', '', 'M', '01452461-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2491, 27, 'OSCAR', 'ANTONIO', 'DUEÑAS', 'CASTILLO', '', 'M', '00846256-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2492, 28, 'JOSE', 'RAUL', 'NAJARRO', 'MEJIA', '', 'M', '01848239-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2493, 29, 'MARCO', 'ANTONIO', 'RODRIGUEZ', 'VALDEZ', '', 'M', '02589289-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2494, 30, 'ABRAHAM', 'DENIS', 'GARCIA', 'MENJIVAR', '', 'M', '01571897-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2495, 31, 'JOSE', 'RENE', 'BARRERA', 'MENDEZ', '', 'M', '00795684-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2496, 32, 'JOSE', 'MAURICIO', 'ERROA', '', '', 'M', '03040090-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2497, 33, 'JORGE', 'ALBERTO', 'MIANDA', 'ALONSO', '', 'M', '01476057-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2498, 34, 'OTONIEL', '', 'FLORES', 'QUINTANILLA', '', 'M', '04137412-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2499, 35, 'FAUSTINO', '', 'MENDOZA', '', '', 'M', '01995103-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2500, 36, 'CARMEN', 'GUADALUPE', 'MORAN', 'TORRES', '', 'F', '00939536-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2501, 37, 'JUAN', 'IDIAMIN', 'ABARCA', 'AGUILAR', '', 'M', '00771703-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2502, 38, 'CLAUDIA', 'LOURDES', 'ORTIZ', 'SANCHEZ', '', 'F', '03884419-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2503, 39, 'MARVIN', 'ENRIQUE', 'BONITO', 'DUQUE', '', 'M', '04125842-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2504, 40, 'GARY', 'GRAHAM', 'BAUTISTA', 'FLORES', '', 'M', '05622109-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2505, 41, 'JOSE', 'LUIS', 'RAMIREZ', 'GUZMAN', '', 'M', '04288220-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2506, 42, 'IRVIN', 'ARIEL', 'GONZALEZ', 'CASTRO', '', 'M', '05065613-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2507, 43, 'LUIS', 'BALTAZAR', 'MENDOZA', '', '', 'M', '00365164-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2508, 44, 'MARIA', 'JOSE', 'RAMOS', 'PORTILLO', '', 'F', '04856864-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2509, 45, 'WILLIAM', 'ENRIQUE', 'ASCENCIO', 'PORTILLO', '', 'M', '04446076-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2510, 46, 'ROBERTO', 'EDGARDO', 'MARTINEZ', 'PINTIN', '', 'M', '00864384-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2511, 47, 'ROBERTO', 'ERNESTO', 'LOPEZ', 'HERNANDEZ', '', 'M', '02270950-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2512, 48, 'FRANCISCO', 'RENE', 'BARRIOS', 'ZAVALETA', '', 'M', '00700407-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2513, 49, 'JOSE', 'ARMANDO', 'SANCHEZ', 'RAMIREZ', '', 'M', '00645527-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2514, 50, 'KATHERINE', 'VANESSA', 'ESCOBAR', 'MENJIVAR', '', 'F', '05163727-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2515, 51, 'CRISTIAN', 'JAVIER', 'PANAMEÑO', 'LANDAVERDE', '', 'M', '01268122-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2516, 52, 'VICTOR', 'RAFAEL', 'TELLO', 'FLAMENCO', '', 'M', '04562476-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2517, 53, 'LILIAN', 'MARGARITA', 'CALDERON', 'DE NAJERA', '', 'F', '02236232-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2518, 54, 'GUSTAVO', 'ADOLFO', 'IRAHETA', 'BONILLA', '', 'M', '02398014-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2519, 55, 'RAUL', 'ELIZARDO', 'SORIANO', 'RAMIREZ', '', 'M', '02632477-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2520, 56, 'ISRAEL', '', 'MEJIA', 'OSORIO', '', 'M', '00778296-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2521, 57, 'MELVIN', 'ALEXANDER', 'FUENTES', 'PORTILLO', '', 'M', '04791246-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2522, 58, 'NELSON', 'ISAIAS', 'ALVARADO', 'BORJA', '', 'M', '01891750-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2523, 59, 'JOAQUIN', '', 'GUEVARA', 'RUIZ', '', 'M', '02036544-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2524, 60, 'TANIA', '', 'AGUIÑADA', 'DERAS', '', 'F', '03383182-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2525, 61, 'ALEXIA', 'MARIBEL', 'FABIAN', 'MORALES', '', 'F', '04186260-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2526, 62, 'MARINA', 'ELIZABETH', 'ANTILLON', '', 'DE RAUDA', 'F', '00506013-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2527, 63, 'ANA', 'ARGELIA', 'LOPEZ', '', 'DE NUÑEZ', 'F', '01849401-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2528, 64, 'VICTOR', 'MANUEL', 'RODRIGUEZ', 'AQUINO', '', 'M', '04764955-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2529, 65, 'ROGEL', 'EVERALDI', 'HERNANDEZ', 'PALACIOS', '', 'M', '04330181-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2530, 66, 'CESAR', 'OSMARO', 'SANTOS', 'JIMENEZ', '', 'M', '00618409-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2531, 67, 'ENOC', 'ISAIAS', 'ORTIZ', 'REYNOZA', '', 'M', '05499450-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2532, 68, 'RICARDO', 'LEONEL', 'DELEON', 'LOPEZ', '', 'M', '03585751-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2533, 69, 'GERMAN', 'ALEXANDER', 'CONTRERAS', 'ORELLANA', '', 'M', '03965506-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2534, 70, 'BLANCA', 'DINORA', 'LOPEZ', 'PEÑA', '', 'F', '03397338-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2535, 71, 'REGINA', 'ESMERALDA', 'MERLOS', 'ANGEL', 'DE ALVARENGA', 'F', '03164085-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2536, 72, 'SIXTO', 'SALVADOR', 'ESCOBAR', 'LOPEZ', '', 'M', '01591820-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2537, 73, 'RICARDO', 'ANTONIO', 'ACOSTA', '', '', 'M', '00795628-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2538, 74, 'MARISOL', 'GUADALUPE', 'FUENTES', '', 'DE CHAVEZ', 'F', '00038496-7', '', '0000-00-00', 10, 181, '2017-06-06', 10, 181, '', '', '', '', 'Empleado', 'TU COLOR FAVORITO', 'CORRECTA', '34EB56', '11:48:29', '2021-06-23', 10, 181, '0');
INSERT INTO `afiliados` VALUES (2539, 75, 'VERONICA', 'GUADALUPE', 'CAMPOS', '', 'DE HERNANDEZ', 'F', '00249934-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2540, 76, 'CARLOS', 'ENRIQUE', 'ZEPEDA', 'CHACON', '', 'M', '00777068-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2541, 77, 'REYNA', 'VICTORIA', 'MADRID', 'CASTRO', '', 'F', '01628772-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2542, 78, 'ANA', 'MARLENE', 'PORTILLO', 'CORNEJO', 'DE RECINOS', 'F', '01671183-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2543, 79, 'EDVIN', 'ROLANDO', 'BAIRES', 'TOBAR', '', 'M', '03411617-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2544, 80, 'ANA', 'VILMA', 'CAMPOS', 'JIMENEZ', '', 'F', '03013246-3', '', '0000-00-00', 10, 181, '2018-10-15', 10, 181, '', '', '', '', 'Empleado', 'TU COLOR FAVORITO', 'CELESTE ', 'A09CD2', '12:03:56', '2021-06-23', 10, 181, '0');
INSERT INTO `afiliados` VALUES (2545, 81, 'VICTOR', 'HUGO', 'CASTRO', '', '', 'M', '01024300-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2546, 82, 'CARLOS', 'ALFONSO', 'DIAZ', 'CALDERON', '', 'M', '00093549-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2547, 83, 'CARLOS', 'ROBERTO', 'MERLOS', 'ROSALES', '', 'M', '00621588-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2548, 84, 'JOSE', 'ERNESTO', 'ESCOBAR', 'MARTINEZ', '', 'M', '04901277-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2549, 85, 'MARITZA', 'ISABEL', 'CASTELLON', 'RAMIREZ', '', 'F', '00893757-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2550, 86, 'SANDRA', 'YANIRA', 'ARTOLA', 'GUZMAN', '', 'F', '02140396-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2551, 87, 'KARINA', 'VANESSA', 'ROMERO', 'MOLINA', '', 'F', '02687584-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2552, 88, 'MOISES', 'ABRAHAM', 'HENRIQUEZ', '', '', 'M', '02619928-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2553, 89, 'SANDRA', 'EDITH', 'AVILES', 'CORDERO', 'DE PICHE', 'F', '01315299-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2554, 90, 'YENIFER', 'POLETH', 'HERNANDEZ', 'CARLOS', '', 'F', '04704913-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2555, 91, 'SONIA', 'GUADALUPE', 'VEGA', 'MARROQUIN', '', 'F', '01849156-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2556, 92, 'BLANCA', 'MARGARITA', 'PICHE', 'BARAHONA', '', 'F', '02882397-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2557, 93, 'RUBENIA', 'GUADALUPE', 'CARDONA', 'GUZMAN', 'DE ROMERO', 'F', '02458092-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2558, 94, 'CARLOS', 'ALBERTO', 'CALDERON', 'CLAVEL', '', 'M', '01447682-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2559, 95, 'GERMAN', 'HUMBERTO', 'CHAVEZ', 'MELGAR', '', 'M', '02353188-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2560, 96, 'ONEYDA', 'LILI', 'ORTIZ', 'GONZALEZ', '', 'F', '00194795-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2561, 97, 'MARLON', 'ANTONIO', 'GARCIA', 'CHAVARRIA', '', 'M', '03804641-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2562, 98, 'MARIO', 'ARMANDO', 'CASTILLO', 'VEGA', '', 'M', '02678589-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2563, 99, 'LUCIO', 'ERNESTO', 'VASQUEZ', 'TEJADA', '', 'M', '01945530-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2564, 100, 'JOSE', 'ENRIQUE', 'RIVAS', 'CABALLERO', '', 'M', '01933271-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2565, 101, 'EDGAR', 'JAIME', 'MONGE', 'TOBAR', '', 'M', '02627194-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2566, 102, 'WILLIAM', 'DOUGLAS', 'MENDEZ', 'PALACIOS', '', 'M', '03545828-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2567, 103, 'JOSE', 'LUIS', 'SERRANO', '', '', 'M', '00024973-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2568, 104, 'JORGE', 'ALBERTO', 'LETONA', 'MARTELL', '', 'M', '03995407-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2569, 105, 'ABEL', 'ANTONIO', 'VELASQUEZ', '', '', 'M', '02085842-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2570, 106, 'TEODORO', 'ORLANDO', 'RIVAS', 'AYALA', '', 'M', '00394522-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2571, 107, 'IRMA', 'YOLANDA', 'GARCIA', 'AGUILUZ', '', 'F', '00145642-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2572, 108, 'ROSA', 'ANTONIA', 'MONTOYA', 'RIVERA', 'DE SANDOVAL', 'F', '00568942-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2573, 109, 'DORA', 'LILIAN', 'FUENTES', 'FUENTES', '', 'F', '01677541-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2574, 110, 'XIOMARA', 'DE LOS ANGELES', 'LOPEZ', 'COLORADO', '', 'F', '05090661-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2575, 111, 'EDGARDO', 'ANTONIO', 'MARADIAGA', 'HERNANDEZ', '', 'M', '05060101-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2576, 112, 'NANCY', 'CAROLINA', 'SERRANO', 'GOMEZ', '', 'F', '04660668-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2577, 113, 'KAREN', 'VANESSA', 'BERMUDEZ', 'NAJARRO', '', 'F', '04553218-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2578, 114, 'ANA', 'LILIAN', 'CHAFOYA', '', 'DE QUIÑONES', 'F', '02560276-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2579, 115, 'PABLO', 'ULISES', 'LOPEZ', 'PALACIOS', '', 'M', '01450190-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2580, 116, 'JOSE', 'RUBEN', 'ESCOBAR', 'ACOSTA', '', 'M', '00162521-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2581, 117, 'AMILCAR', 'ABRAHAM', 'LANDAVERDE', '', '', 'M', '01098310-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2582, 118, 'JESUS', '', 'MARTINEZ', 'LOPEZ', '', 'M', '01180000-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2583, 119, 'SANTOS', 'MARTIR', 'RAMIREZ', 'GONZALEZ', '', 'M', '02712984-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2584, 120, 'MANUEL', 'DE JESUS', 'CEREN', 'RODRIGUEZ', '', 'M', '02581581-0', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2585, 121, 'MARIO', 'ANTONIO', 'ROMERO', 'HUEZO', '', 'M', '02544580-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2586, 122, 'SANTOS', 'DE JESUS', 'MOLINA', 'REPREZA', '', 'M', '00548360-1', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2587, 123, 'ROBERTO', '', 'CABEZAS', 'GARCIA', '', 'M', '03285140-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2588, 124, 'ENRIQUE', 'OTONIEL', 'HERNANDEZ', 'ESCOBAR', '', 'M', '03244812-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2589, 125, 'GABRIEL', 'EDUARDO', 'HERNANDEZ', 'RIVERA', '', 'M', '05088380-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2590, 126, 'DANIEL', 'ALEXANDER', 'GOCHEZ', 'TORRES', '', 'M', '00183863-4', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2591, 127, 'SIMON', 'ANTONIO', 'COREAS', 'GUERRERO', '', 'M', '00974834-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2592, 128, 'CARLOS', 'NOE', 'SERRANO', 'ALVAREZ', '', 'M', '01430775-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2593, 129, 'WILFREDO', 'TOLENTINO', 'MURCIA', '', '', 'M', '02436972-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2594, 130, 'JOSE', 'ANTONIO', 'GIRON', '', '', 'M', '00906261-9', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2595, 131, 'DIMAS', '', 'ALFARO', '', '', 'M', '01101716-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2596, 132, 'ISRAEL', 'ANTONIO', 'RAMIREZ', 'JACINTO', '', 'M', '02987042-2', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2597, 133, 'FRANCISCO', 'CRUZ', 'ROSALES', 'MENDOZA', '', 'M', '01803418-6', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2598, 134, 'JOSE', 'MARIO', 'MELARA', 'HERNANDEZ', '', 'M', '00117921-8', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2599, 135, 'ANIBAL', '', 'JIMENEZ', 'QUINTANILLA', '', 'M', '02731051-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2600, 136, 'KELVIN', 'OMAR', 'MELARA', 'ALVARENGA', '', 'M', '03696670-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2601, 137, 'LORENZO', 'DE JESUS', 'FUNES', 'CRUZ', '', 'M', '02531532-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2602, 138, 'MAXIMILIANO', '', 'FUNES', 'CRUZ', '', 'M', '00654277-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2603, 139, 'SANTIAGO', '', 'ROMERO', 'HERNANDEZ', '', 'M', '01370786-5', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2604, 140, 'GUILLERMO', 'ANTONIO', 'HERNANDEZ', 'PINEDA', '', 'M', '02977350-7', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2605, 141, 'EDWIN', 'ROLANDO', 'MARTINEZ', 'CHAVEZ', '', 'M', '00333652-3', '', '0000-00-00', 10, 181, '0000-00-00', 10, 181, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:49:29', '2021-06-21', 10, 181, '2');
INSERT INTO `afiliados` VALUES (2606, 1, 'JOSE', 'RUBEN', 'CASTRO', 'GOCHEZ', '', 'M', '01406471-5', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2607, 2, 'CARLOS', 'ALBERTO', 'REYES', 'VILLATORO', '', 'M', '03706685-9', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2608, 3, 'OMAR', 'ALEXIS', 'PRUDENCIO', 'RUBIO', '', 'M', '04993302-0', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2609, 4, 'RAMON', '', 'HIDALGO', 'REYES', '', 'M', '00257201-1', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2610, 5, 'MANUEL', 'DE JESUS', 'REYES', 'FLORES', '', 'M', '02236713-5', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2611, 6, 'LORENA', 'DEL ROSARIO', 'REYES', '', 'VDA DE RIVERA', 'F', '01170276-2', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2612, 7, 'MARICELA D', 'EL CARMEN', 'JIMENEZ', '', '', 'F', '04102096-2', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2613, 8, 'BLANCA', 'DEYSI', 'AMAYA', 'VALLATORO', 'DE REYES', 'F', '04174598-6', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2614, 9, 'PETRONILO', '', 'ARGUETA', '', '', 'M', '00910975-4', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2615, 10, 'FRANCISCO', '', 'CRUZ', 'FLORES', '', 'M', '00008596-1', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2616, 11, 'MARIA', 'ENCARNACION', 'MOLINA', 'LOPEZ', '', 'F', '00489433-8', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2617, 12, 'MARTHA', '', 'VILLATORO', '', 'DE REYES', 'F', '01354206-1', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2618, 13, 'ELENA', '', 'RAMIREZ', '', 'DE VIGIL', 'F', '03204407-2', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2619, 14, 'KAREN', 'EMISELA', 'CRUZ', 'BONILLA', 'DE MEJIA', 'M', '03689207-9', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2620, 15, 'LUIS', 'ALCIDES', 'ORELLANA', '', '', 'M', '02340992-2', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2621, 16, 'JOSE', 'MARIA', 'VIGIL', 'HERNANDEZ', '', 'M', '03217867-7', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2622, 17, 'ABILIO', 'ANTONIO', 'VALLE', '', '', 'M', '00558583-5', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');
INSERT INTO `afiliados` VALUES (2623, 18, 'LUIS', 'ALBERTO', 'CRUZ', 'BOMILLA', '', 'M', '03513465-6', '', '0000-00-00', 10, 180, '0000-00-00', 10, 180, '', '', '', '', 'Empleado', NULL, NULL, NULL, '11:37:23', '2021-08-04', 10, 180, '1');

-- ----------------------------
-- Table structure for candidatos
-- ----------------------------
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos`  (
  `id_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `id_afiliado` int(11) NULL DEFAULT NULL,
  `id_jornada` int(11) NULL DEFAULT NULL,
  `id_depa` int(11) NULL DEFAULT NULL,
  `id_muni` int(11) NULL DEFAULT NULL,
  `cargoEleccion` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `edad` int(11) NULL DEFAULT NULL,
  `domicilio` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `profesion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cargoMuni` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `foto` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `estado` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_candidato`) USING BTREE,
  INDEX `id_afiliado`(`id_afiliado`) USING BTREE,
  INDEX `id_jornada`(`id_jornada`) USING BTREE,
  INDEX `depa`(`id_depa`) USING BTREE,
  INDEX `muni`(`id_muni`) USING BTREE,
  CONSTRAINT `candidatos_ibfk_1` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidatos_ibfk_2` FOREIGN KEY (`id_jornada`) REFERENCES `jornadas` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidatos_ibfk_3` FOREIGN KEY (`id_depa`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `candidatos_ibfk_4` FOREIGN KEY (`id_muni`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidatos
-- ----------------------------
INSERT INTO `candidatos` VALUES (65, 2576, 65, 10, 181, 'CANDIDATO', 28, 'Ayutuxtepeque', 'Empleada', 'Encargada de presupuesto', 'Nancy.jpg', 'Activo', '0');
INSERT INTO `candidatos` VALUES (66, 2503, 65, 10, 181, 'CANDIDATO', 29, 'Ayutuxtepeque', 'Empleado', 'Asistente de UACI', 'Duque.jpg', 'Activo', '0');

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
-- Records of historial
-- ----------------------------
INSERT INTO `historial` VALUES (131, 1, '2020-08-16', 'Agrego nueva jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (132, 2, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (133, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (134, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (135, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (136, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (137, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (138, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (139, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (140, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (141, 1, '2020-08-16', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (142, 1, '2020-08-17', 'elimino los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (143, 1, '2020-08-17', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (144, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (145, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (146, 1, '2020-08-17', 'elimino los datos de un usuario', 'adm_usuarios', 12, 'Activo');
INSERT INTO `historial` VALUES (147, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (148, 1, '2020-08-17', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (149, 1, '2020-08-17', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (150, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (151, 1, '2020-08-17', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (152, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (153, 1, '2020-08-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (154, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (155, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (156, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (157, 1, '2020-08-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (158, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (159, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (160, 2, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (161, 2, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (162, 2, '2020-08-18', 'Actualizo los datos del medico', 'doctores', 11, 'Activo');
INSERT INTO `historial` VALUES (163, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (164, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (165, 1, '2020-08-18', 'Elimino los datos del afiliados', 'afiliados', 2, 'Activo');
INSERT INTO `historial` VALUES (166, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (167, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (168, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (169, 1, '2020-08-18', 'elimino los datos de un usuario', 'adm_usuarios', 1, 'Activo');
INSERT INTO `historial` VALUES (170, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (171, 1, '2020-08-18', 'elimino los datos de un usuario', 'adm_usuarios', 1, 'Activo');
INSERT INTO `historial` VALUES (172, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (173, 1, '2020-08-18', 'elimino los datos de un usuario', 'adm_usuarios', 1, 'Activo');
INSERT INTO `historial` VALUES (174, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (175, 1, '2020-08-18', 'elimino los datos de un usuario', 'adm_usuarios', 1, 'Activo');
INSERT INTO `historial` VALUES (176, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (177, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (178, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (179, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (180, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (181, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (182, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (183, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (184, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (185, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (186, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (187, 1, '2020-08-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (188, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (189, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (190, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (191, 1, '2020-08-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (192, 1, '2020-08-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (193, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (194, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (195, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (196, 2, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (197, 2, '2020-08-19', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (198, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (199, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (200, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (203, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (204, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (205, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (206, 1, '2020-08-19', 'Elimino los datos de la jornada electoral', 'jornadas', 0, 'Activo');
INSERT INTO `historial` VALUES (207, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (208, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (209, 1, '2020-08-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (210, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (211, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (212, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (213, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (214, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (215, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (216, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (217, 1, '2020-08-17', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (218, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (219, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (220, 1, '2020-08-19', 'elimino el parametro', 'parametros', 0, 'Activo');
INSERT INTO `historial` VALUES (221, 1, '2020-08-19', 'elimino el parametro', 'parametros', 1, 'Activo');
INSERT INTO `historial` VALUES (222, 1, '2020-08-19', 'elimino el parametro', 'parametros', 1, 'Activo');
INSERT INTO `historial` VALUES (223, 1, '2020-08-19', 'elimino el parametro', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (224, 1, '2020-08-19', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 0, 'Activo');
INSERT INTO `historial` VALUES (225, 1, '2020-08-19', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (226, 1, '2020-08-19', 'elimino el parametro', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (228, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (229, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (230, 1, '2020-08-19', 'elimino el parametro', 'parametros', 20, 'Activo');
INSERT INTO `historial` VALUES (231, 1, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (232, 2, '2020-08-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (233, 2, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (234, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (235, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (236, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (237, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (238, 1, '2020-08-20', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (239, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (240, 1, '2020-08-20', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (241, 1, '2020-08-20', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (242, 1, '2020-08-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (243, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (244, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (245, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (246, 1, '2020-08-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (247, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (248, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (249, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (250, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (251, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (252, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (253, 2, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (254, 2, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (255, 2, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (256, 1, '2020-08-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (257, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (258, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (259, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (260, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (261, 1, '2020-08-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (262, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (263, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (264, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (265, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (266, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (267, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (268, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (269, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (270, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 19, 'Activo');
INSERT INTO `historial` VALUES (271, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 2, 'Activo');
INSERT INTO `historial` VALUES (272, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (273, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 33, 'Activo');
INSERT INTO `historial` VALUES (274, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 32, 'Activo');
INSERT INTO `historial` VALUES (275, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 31, 'Activo');
INSERT INTO `historial` VALUES (276, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 30, 'Activo');
INSERT INTO `historial` VALUES (277, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 29, 'Activo');
INSERT INTO `historial` VALUES (278, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 28, 'Activo');
INSERT INTO `historial` VALUES (279, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 29, 'Activo');
INSERT INTO `historial` VALUES (280, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 28, 'Activo');
INSERT INTO `historial` VALUES (281, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 27, 'Activo');
INSERT INTO `historial` VALUES (282, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 26, 'Activo');
INSERT INTO `historial` VALUES (283, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 25, 'Activo');
INSERT INTO `historial` VALUES (284, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 24, 'Activo');
INSERT INTO `historial` VALUES (285, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 23, 'Activo');
INSERT INTO `historial` VALUES (286, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 22, 'Activo');
INSERT INTO `historial` VALUES (287, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 21, 'Activo');
INSERT INTO `historial` VALUES (288, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 20, 'Activo');
INSERT INTO `historial` VALUES (289, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 18, 'Activo');
INSERT INTO `historial` VALUES (290, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 18, 'Activo');
INSERT INTO `historial` VALUES (291, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 17, 'Activo');
INSERT INTO `historial` VALUES (292, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 16, 'Activo');
INSERT INTO `historial` VALUES (293, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 15, 'Activo');
INSERT INTO `historial` VALUES (294, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 14, 'Activo');
INSERT INTO `historial` VALUES (295, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 13, 'Activo');
INSERT INTO `historial` VALUES (296, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 12, 'Activo');
INSERT INTO `historial` VALUES (297, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 10, 'Activo');
INSERT INTO `historial` VALUES (298, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 9, 'Activo');
INSERT INTO `historial` VALUES (299, 1, '2020-08-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 11, 'Activo');
INSERT INTO `historial` VALUES (300, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (301, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (302, 1, '2020-08-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (303, 1, '2020-08-22', 'Inscribio a un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (304, 1, '2020-08-22', 'Inscribio a un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (305, 1, '2020-08-22', 'Inscribio a un Nuevo Candidato', 'candidatos', 3, 'Activo');
INSERT INTO `historial` VALUES (306, 1, '2020-08-22', 'Inscribio a un Nuevo Candidato', 'candidatos', 4, 'Activo');
INSERT INTO `historial` VALUES (307, 1, '2020-08-22', 'Inscribio a un Nuevo Candidato', 'candidatos', 5, 'Activo');
INSERT INTO `historial` VALUES (308, 1, '2020-08-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (309, 2, '2020-08-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (310, 2, '2020-08-23', 'Inscribio a un Nuevo Candidato', 'candidatos', 6, 'Activo');
INSERT INTO `historial` VALUES (311, 2, '2020-08-23', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 5, 'Activo');
INSERT INTO `historial` VALUES (312, 2, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (313, 1, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (314, 1, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (315, 1, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (316, 1, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (317, 1, '2020-08-24', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (318, 1, '2020-08-24', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (319, 1, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (320, 2, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (321, 2, '2020-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (322, 2, '2020-08-24', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (323, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (324, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (325, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (326, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (327, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (328, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (329, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (330, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (331, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (332, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (333, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (334, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (335, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (336, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (337, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (338, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (339, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (340, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (341, 1, '2020-08-25', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (342, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (343, 1, '2020-08-25', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (344, 1, '2020-08-25', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (345, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (346, 1, '2020-08-25', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (347, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (348, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (349, 1, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (350, 1, '2020-08-25', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (351, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (352, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (353, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (354, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (355, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (356, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (357, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (358, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (359, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (360, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (362, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (363, 1, '2020-08-25', 'El afiliado realizo su votacion', 'votacion', 1, 'Activo');
INSERT INTO `historial` VALUES (364, 1, '2020-08-25', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (365, 2, '2020-08-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (366, 2, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (367, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (368, 1, '2020-08-25', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (369, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (370, 2, '2020-08-26', 'Inicio votacion', 'votacion', NULL, 'Activo');
INSERT INTO `historial` VALUES (371, 2, '2020-08-26', 'El afiliado realizo su votacion', 'votacion', 3, 'Activo');
INSERT INTO `historial` VALUES (372, 2, '2020-08-26', 'Fin de la Seccion del votante', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (383, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (384, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (385, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (386, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (387, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (388, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (389, 1, '2020-08-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (390, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (391, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (392, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (393, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (394, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (395, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (396, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (397, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (398, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (399, 1, '2020-08-27', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (400, 1, '2020-08-27', 'Agrego nueva jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (401, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 7, 'Activo');
INSERT INTO `historial` VALUES (402, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 8, 'Activo');
INSERT INTO `historial` VALUES (403, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 9, 'Activo');
INSERT INTO `historial` VALUES (404, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 10, 'Activo');
INSERT INTO `historial` VALUES (405, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 11, 'Activo');
INSERT INTO `historial` VALUES (406, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 12, 'Activo');
INSERT INTO `historial` VALUES (407, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 13, 'Activo');
INSERT INTO `historial` VALUES (408, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 14, 'Activo');
INSERT INTO `historial` VALUES (409, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 15, 'Activo');
INSERT INTO `historial` VALUES (410, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 16, 'Activo');
INSERT INTO `historial` VALUES (411, 1, '2020-08-27', 'Inscribio a un Nuevo Candidato', 'candidatos', 17, 'Activo');
INSERT INTO `historial` VALUES (412, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (413, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (414, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (415, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (416, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (417, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (418, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (419, 2, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (420, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (421, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (422, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (423, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (424, 2, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (425, 2, '2020-08-28', 'Actualizo los datos del medico', 'doctores', 11, 'Activo');
INSERT INTO `historial` VALUES (426, 2, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (432, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (433, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (435, 1, '2020-08-28', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (436, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (439, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (441, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (450, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (451, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (452, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (453, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (454, 1, '2020-08-28', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (455, 1, '2020-08-28', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (456, 1, '2020-08-28', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (457, 1, '2020-08-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (458, 1, '2020-08-28', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (459, 1, '2020-08-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (460, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (476, 2, '2020-08-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (477, 2, '2020-08-29', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (478, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (479, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (480, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (482, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (483, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (484, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (485, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (486, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (487, 1, '2020-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (488, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (489, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (490, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (491, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (492, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (493, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (494, 1, '2020-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (495, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (496, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (497, 1, '2020-09-02', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (498, 1, '2020-09-02', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (499, 1, '2020-09-02', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (500, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (501, 1, '2020-09-03', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 2, 'Activo');
INSERT INTO `historial` VALUES (502, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (503, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (504, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (505, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (506, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (507, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (508, 1, '2020-09-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (509, 1, '2020-09-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (518, 2, '2020-09-06', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (519, 2, '2020-09-06', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (520, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (521, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (522, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 8, 'Activo');
INSERT INTO `historial` VALUES (523, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (524, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (525, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (526, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (527, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (528, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (529, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (530, 1, '2020-09-07', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (531, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (532, 1, '2020-09-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (542, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (545, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (547, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (555, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (556, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (557, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (558, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (562, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (563, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (564, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (565, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (566, 2, '2020-09-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (567, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (568, 2, '2020-09-07', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (569, 2, '2020-09-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (570, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (571, 2, '2020-09-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (572, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (573, 2, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (574, 2, '2020-09-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (580, 1, '2020-09-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (581, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (582, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (583, 2, '2020-09-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (584, 2, '2020-09-07', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (585, 2, '2020-09-07', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (586, 2, '2020-09-07', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (587, 2, '2020-09-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (589, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (590, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (591, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (592, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (593, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (594, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (595, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (596, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (597, 1, '2020-09-08', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (598, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (599, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (600, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (601, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (602, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (603, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (604, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (606, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (607, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 21, 'Activo');
INSERT INTO `historial` VALUES (609, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (610, 1, '2020-09-08', 'Agrego parametros', 'parametros', 23, 'Activo');
INSERT INTO `historial` VALUES (611, 1, '2020-09-08', 'Agrego parametros', 'parametros', 24, 'Activo');
INSERT INTO `historial` VALUES (612, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (613, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (614, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (615, 1, '2020-09-08', 'Actualizo los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (616, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (617, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (618, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (619, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (620, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (621, 2, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (622, 2, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (623, 2, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (624, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (625, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (626, 2, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (627, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (628, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (629, 2, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (630, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (631, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (632, 2, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (633, 2, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (634, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (635, 1, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (636, 2, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (637, 2, '2020-09-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (638, 1, '2020-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (639, 1, '2020-09-08', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (640, 1, '2020-09-08', 'Actualizo los datos del medico', 'doctores', 2, 'Activo');
INSERT INTO `historial` VALUES (641, 1, '2020-09-08', 'Actualizo los datos del medico', 'doctores', 2, 'Activo');
INSERT INTO `historial` VALUES (642, 1, '2020-09-08', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (643, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (644, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (651, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (652, 1, '2020-09-09', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (653, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (655, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (656, 1, '2020-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (657, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (658, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (661, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (662, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (665, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (681, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (682, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (684, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (687, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (688, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (689, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (691, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (694, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (695, 1, '2020-09-10', 'Agrego nueva jornada electoral', 'jornadas', 7, 'Activo');
INSERT INTO `historial` VALUES (696, 1, '2020-09-10', 'Agrego nueva jornada electoral', 'jornadas', 8, 'Activo');
INSERT INTO `historial` VALUES (697, 1, '2020-09-10', 'Agrego nueva jornada electoral', 'jornadas', 9, 'Activo');
INSERT INTO `historial` VALUES (698, 1, '2020-09-10', 'Agrego nueva jornada electoral', 'jornadas', 10, 'Activo');
INSERT INTO `historial` VALUES (699, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (701, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (702, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (705, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (707, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (709, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (710, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (715, 1, '2020-09-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (716, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (717, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (718, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (719, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (720, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (721, 1, '2020-09-10', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (722, 1, '2020-09-10', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (723, 1, '2020-09-10', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (724, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (734, 1, '2020-09-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (742, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (748, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (749, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (750, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (751, 1, '2020-09-11', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 495, 'Activo');
INSERT INTO `historial` VALUES (752, 1, '2020-09-11', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 494, 'Activo');
INSERT INTO `historial` VALUES (753, 1, '2020-09-11', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 493, 'Activo');
INSERT INTO `historial` VALUES (754, 1, '2020-09-11', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 492, 'Activo');
INSERT INTO `historial` VALUES (775, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (776, 1, '2020-09-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (777, 2, '2020-09-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (778, 2, '2020-09-12', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (780, 1, '2020-09-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (781, 1, '2020-09-12', 'Actualizo los datos de la jornada electoral', 'jornadas', 30, 'Activo');
INSERT INTO `historial` VALUES (782, 1, '2020-09-12', 'Inscribio a un Nuevo Candidato', 'candidatos', 21, 'Activo');
INSERT INTO `historial` VALUES (783, 1, '2020-09-12', 'Inscribio a un Nuevo Candidato', 'candidatos', 27, 'Activo');
INSERT INTO `historial` VALUES (784, 1, '2020-09-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (785, 1, '2020-09-12', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 2, 'Activo');
INSERT INTO `historial` VALUES (786, 1, '2020-09-12', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (797, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (799, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (800, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (801, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (802, 1, '2020-09-14', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (806, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (807, 1, '2020-09-14', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (808, 1, '2020-09-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (809, 1, '2020-09-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (810, 1, '2020-09-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (811, 1, '2020-09-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (812, 1, '2020-09-15', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (813, 1, '2020-09-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (814, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (815, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (816, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (817, 1, '2020-09-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (820, 2, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (821, 2, '2020-09-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (822, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (823, 1, '2020-09-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (824, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (825, 1, '2020-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (826, 1, '2020-09-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (827, 1, '2020-09-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (828, 1, '2020-09-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (829, 1, '2020-09-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (830, 1, '2020-09-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (831, 1, '2020-09-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (832, 1, '2020-09-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (833, 1, '2020-09-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (834, 1, '2020-09-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (835, 1, '2020-09-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (836, 1, '2020-09-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (837, 1, '2020-09-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (838, 1, '2020-09-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (839, 2, '2020-09-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (840, 2, '2020-09-24', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (848, 1, '2020-09-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (849, 1, '2020-09-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (850, 1, '2020-09-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (851, 1, '2020-09-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (852, 1, '2020-09-25', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (853, 1, '2020-09-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (864, 1, '2020-09-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (896, 1, '2020-09-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (897, 1, '2020-09-29', 'Actualizo los datos del medico', 'doctores', 11, 'Activo');
INSERT INTO `historial` VALUES (898, 1, '2020-09-29', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (941, 1, '2020-10-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (942, 1, '2020-10-01', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (955, 1, '2020-11-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (985, 1, '2020-11-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (986, 1, '2020-11-09', 'Actualizo los datos de la jornada electoral', 'jornadas', 30, 'Activo');
INSERT INTO `historial` VALUES (987, 1, '2020-11-09', 'Actualizo los datos de la jornada electoral', 'jornadas', 30, 'Activo');
INSERT INTO `historial` VALUES (992, 1, '2020-11-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (993, 1, '2020-11-09', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (994, 1, '2020-11-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (995, 1, '2020-11-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1005, 1, '2020-11-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1006, 1, '2020-11-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1007, 2, '2020-11-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1008, 2, '2020-11-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1009, 2, '2020-11-18', 'Actualizo los datos de la jornada electoral', 'jornadas', 30, 'Activo');
INSERT INTO `historial` VALUES (1012, 2, '2020-11-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1013, 2, '2020-11-18', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 153, 'Activo');
INSERT INTO `historial` VALUES (1016, 1, '2020-11-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1017, 1, '2020-11-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1018, 1, '2020-11-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1019, 2, '2020-11-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1020, 1, '2020-11-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1021, 1, '2020-11-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1022, 2, '2020-11-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1023, 2, '2020-11-22', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 27, 'Activo');
INSERT INTO `historial` VALUES (1024, 2, '2020-11-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1025, 2, '2020-11-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1029, 2, '2020-11-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1030, 2, '2020-11-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1031, 1, '2020-11-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1032, 2, '2020-11-23', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1033, 2, '2020-11-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1069, 2, '2020-11-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1070, 2, '2020-11-24', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1071, 1, '2020-11-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1072, 2, '2020-11-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1073, 2, '2020-11-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1075, 2, '2020-11-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1086, 2, '2020-11-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1125, 2, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1126, 2, '2020-11-26', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1127, 1, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1128, 1, '2020-11-26', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 5, 'Activo');
INSERT INTO `historial` VALUES (1129, 1, '2020-11-26', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1130, 2, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1131, 2, '2020-11-26', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1132, 1, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1133, 1, '2020-11-26', 'Elimino los datos de la jornada electoral', 'jornadas', 6, 'Activo');
INSERT INTO `historial` VALUES (1134, 2, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1135, 2, '2020-11-26', 'Elimino los datos del afiliados', 'afiliados', 12, 'Activo');
INSERT INTO `historial` VALUES (1136, 2, '2020-11-26', 'Elimino los datos del afiliados', 'afiliados', 7, 'Activo');
INSERT INTO `historial` VALUES (1137, 2, '2020-11-26', 'Elimino los datos del afiliados', 'afiliados', 175, 'Activo');
INSERT INTO `historial` VALUES (1138, 2, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1139, 1, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1140, 1, '2020-11-26', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1141, 1, '2020-11-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1142, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (1143, 1, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (1145, 2, '2020-11-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1146, 2, '2020-11-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1147, 2, '2020-11-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1148, 2, '2020-11-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1160, 1, '2020-11-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1161, 1, '2020-11-29', 'Actualizo los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (1162, 2, '2020-11-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1163, 2, '2020-11-30', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1177, 2, '2020-11-30', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1178, 2, '2020-11-30', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1179, 2, '2020-11-30', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1180, 2, '2020-11-30', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1181, 2, '2020-11-30', 'Actualizo los datos del medico', 'doctores', 2, 'Activo');
INSERT INTO `historial` VALUES (1184, 1, '2020-12-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1185, 1, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1186, 1, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1187, 1, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1188, 2, '2020-12-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1189, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1190, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1191, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1192, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1193, 1, '2020-12-01', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1194, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1195, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1196, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1197, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1198, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1199, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1200, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1201, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1202, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1203, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1204, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1205, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1206, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1207, 2, '2020-12-01', 'Agrego nuevo usuario', 'adm_usuarios', 0, 'Activo');
INSERT INTO `historial` VALUES (1231, 1, '2020-12-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1232, 1, '2020-12-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1234, 2, '2020-12-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1235, 2, '2020-12-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1236, 2, '2020-12-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1237, 2, '2020-12-03', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 1, 'Activo');
INSERT INTO `historial` VALUES (1238, 2, '0000-00-00', 'Actualizo los datos del parametros', 'parametros', 25, 'Activo');
INSERT INTO `historial` VALUES (1239, 2, '2020-12-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1241, 1, '2020-12-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1242, 1, '2020-12-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1243, 1, '2020-12-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1244, 1, '2020-12-03', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 1, 'Activo');
INSERT INTO `historial` VALUES (1245, 1, '2020-12-03', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1247, 2, '2020-12-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1248, 2, '2020-12-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1317, 2, '2020-12-14', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1318, 2, '2020-12-14', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1326, 2, '2020-12-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1328, 2, '2020-12-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1329, 2, '2020-12-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1330, 2, '2020-12-15', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1377, 2, '2020-12-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1381, 1, '2020-12-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1382, 1, '2020-12-15', 'Actualizo los datos de la jornada electoral', 'jornadas', 38, 'Activo');
INSERT INTO `historial` VALUES (1384, 1, '2020-12-15', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1401, 2, '2020-12-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1413, 2, '2020-12-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1414, 2, '2020-12-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1420, 2, '2020-12-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1421, 2, '2020-12-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1422, 2, '2020-12-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1424, 2, '2020-12-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1426, 1, '2020-12-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1428, 1, '2020-12-17', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1450, 2, '2020-12-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1451, 2, '2020-12-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1462, 2, '2020-12-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1463, 2, '2020-12-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1464, 2, '2020-12-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1471, 2, '2020-12-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1472, 2, '2020-12-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1476, 2, '2020-12-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1477, 2, '2020-12-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1483, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1490, 2, '2020-12-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1491, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1492, 1, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1493, 1, '2020-12-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1497, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1498, 2, '2020-12-21', 'Actualizo los datos del medico', 'doctores', 2, 'Activo');
INSERT INTO `historial` VALUES (1499, 2, '2020-12-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1500, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1519, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1549, 2, '2020-12-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1559, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1560, 2, '2020-12-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1564, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1565, 2, '2020-12-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1567, 2, '2020-12-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1568, 2, '2020-12-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1590, 2, '2021-01-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1598, 2, '2021-01-26', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1603, 2, '2021-01-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1604, 2, '2021-01-28', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1606, 1, '2021-01-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1607, 1, '2021-01-28', 'Actualizo los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1608, 1, '2021-01-28', 'Actualizo los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1609, 1, '2021-01-28', 'Actualizo los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1610, 1, '2021-01-28', 'Actualizo los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1611, 1, '2021-01-28', 'Actualizo los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1612, 2, '2021-01-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1613, 1, '2021-01-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1614, 2, '2021-01-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1615, 2, '2021-01-30', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1616, 2, '2021-01-30', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1620, 1, '2021-01-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1621, 2, '2021-01-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1622, 1, '2021-01-31', 'Elimino los datos del afiliados', 'afiliados', 2162, 'Activo');
INSERT INTO `historial` VALUES (1623, 1, '2021-01-31', 'Elimino los datos del afiliados', 'afiliados', 2163, 'Activo');
INSERT INTO `historial` VALUES (1632, 2, '2021-01-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1633, 1, '2021-02-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1634, 2, '2021-02-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1635, 2, '2021-02-01', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1636, 1, '2021-02-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1641, 2, '2021-02-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1671, 1, '2021-02-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1672, 1, '2021-02-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1744, 2, '2021-03-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1767, 2, '2021-03-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1768, 2, '2021-03-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1769, 2, '2021-03-11', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1770, 2, '2021-03-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1772, 2, '2021-03-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1774, 1, '2021-03-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1775, 1, '2021-03-12', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1779, 2, '2021-03-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1780, 2, '2021-03-15', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1783, 2, '2021-03-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1784, 2, '2021-03-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1786, 2, '2021-03-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1787, 2, '2021-03-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1798, 2, '2021-03-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1827, 2, '2021-05-20', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1828, 2, '2021-06-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1829, 2, '2021-06-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1830, 2, '2021-06-16', 'Elimino los datos de la jornada electoral', 'jornadas', 1, 'Activo');
INSERT INTO `historial` VALUES (1831, 2, '2021-06-16', 'Elimino los datos de la jornada electoral', 'jornadas', 2, 'Activo');
INSERT INTO `historial` VALUES (1832, 2, '2021-06-16', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1833, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1834, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1835, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1836, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1837, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1838, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1839, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1841, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1842, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1843, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1844, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1845, 2, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1846, 54, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1847, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1848, 54, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1849, 2, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1850, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1851, 54, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1854, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1855, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1856, 54, '2021-06-21', 'Actualizo los datos del medico', 'doctores', 54, 'Activo');
INSERT INTO `historial` VALUES (1857, 54, '2021-06-21', 'Actualizo los datos del medico', 'doctores', 54, 'Activo');
INSERT INTO `historial` VALUES (1858, 54, '2021-06-21', 'Agrego parametros', 'parametros', 37, 'Activo');
INSERT INTO `historial` VALUES (1859, 54, '2021-06-21', 'Elimino los datos del afiliados', 'afiliados', 2465, 'Activo');
INSERT INTO `historial` VALUES (1860, 54, '2021-06-21', 'Elimino los datos del afiliados', 'afiliados', 2470, 'Activo');
INSERT INTO `historial` VALUES (1861, 54, '2021-06-21', 'Agrego nueva jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1862, 54, '2021-06-21', 'Inscribio a un Nuevo Candidato', 'candidatos', 65, 'Activo');
INSERT INTO `historial` VALUES (1863, 54, '2021-06-21', 'Inscribio a un Nuevo Candidato', 'candidatos', 66, 'Activo');
INSERT INTO `historial` VALUES (1864, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1865, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1866, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1867, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1868, 54, '2021-06-21', 'Elimino los datos de la jornada electoral', 'jornadas', 61, 'Activo');
INSERT INTO `historial` VALUES (1869, 54, '2021-06-21', 'Agrego nueva jornada electoral', 'jornadas', 62, 'Activo');
INSERT INTO `historial` VALUES (1870, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 62, 'Activo');
INSERT INTO `historial` VALUES (1871, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 62, 'Activo');
INSERT INTO `historial` VALUES (1872, 54, '2021-06-21', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1873, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1874, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 62, 'Activo');
INSERT INTO `historial` VALUES (1875, 54, '2021-06-21', 'Elimino los datos de la jornada electoral', 'jornadas', 62, 'Activo');
INSERT INTO `historial` VALUES (1876, 54, '2021-06-21', 'Agrego nueva jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1877, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1878, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1879, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1880, 54, '2021-06-21', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1881, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1882, 54, '2021-06-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1883, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1884, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1885, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1886, 54, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1887, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1888, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1889, 54, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1890, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1892, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1893, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1894, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1895, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1896, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1897, 54, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1898, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1899, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1900, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1901, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1902, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1903, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1904, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1905, 1, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1906, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1907, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1908, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1909, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1910, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1911, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1912, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1913, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1914, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1915, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1916, 2, '2021-06-22', 'Actualizo los datos del medico', 'doctores', 11, 'Activo');
INSERT INTO `historial` VALUES (1917, 2, '2021-06-22', 'Actualizo los datos del medico', 'doctores', 11, 'Activo');
INSERT INTO `historial` VALUES (1918, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1921, 1, '2021-06-22', 'Agrego nuevo usuario', 'adm_usuarios', 74, 'Activo');
INSERT INTO `historial` VALUES (1922, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1923, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1924, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1925, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1926, 2, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1927, 2, '2021-06-22', 'Agrego nuevo usuario', 'adm_usuarios', 75, 'Activo');
INSERT INTO `historial` VALUES (1928, 2, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1930, 1, '2021-06-22', 'Actualizo los datos del medico', 'doctores', 2, 'Activo');
INSERT INTO `historial` VALUES (1932, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1933, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1934, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1935, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1936, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1937, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1938, 1, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1939, 1, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1940, 1, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1941, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1942, 1, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1943, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 30, 'Activo');
INSERT INTO `historial` VALUES (1944, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 31, 'Activo');
INSERT INTO `historial` VALUES (1945, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 35, 'Activo');
INSERT INTO `historial` VALUES (1946, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 36, 'Activo');
INSERT INTO `historial` VALUES (1947, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 36, 'Activo');
INSERT INTO `historial` VALUES (1948, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 50, 'Activo');
INSERT INTO `historial` VALUES (1949, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 51, 'Activo');
INSERT INTO `historial` VALUES (1950, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 51, 'Activo');
INSERT INTO `historial` VALUES (1951, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 52, 'Activo');
INSERT INTO `historial` VALUES (1952, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 52, 'Activo');
INSERT INTO `historial` VALUES (1953, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 63, 'Activo');
INSERT INTO `historial` VALUES (1954, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 54, 'Activo');
INSERT INTO `historial` VALUES (1955, 1, '2021-06-22', 'Elimino los datos de la jornada electoral', 'jornadas', 53, 'Activo');
INSERT INTO `historial` VALUES (1956, 1, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1957, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1958, 54, '2021-06-22', 'Agrego nueva jornada electoral', 'jornadas', 64, 'Activo');
INSERT INTO `historial` VALUES (1959, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 64, 'Activo');
INSERT INTO `historial` VALUES (1960, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 64, 'Activo');
INSERT INTO `historial` VALUES (1961, 54, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 64, 'Activo');
INSERT INTO `historial` VALUES (1962, 54, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1963, 1, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1964, 1, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1965, 1, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1966, 1, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1967, 1, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1968, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1969, 1, '2021-06-22', 'Actualizo los datos de la jornada electoral', 'jornadas', 64, 'Activo');
INSERT INTO `historial` VALUES (1970, 1, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1971, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1972, 54, '2021-06-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1973, 54, '2021-06-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1974, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1975, 54, '2021-06-23', 'Agrego nueva jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (1976, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1977, 54, '2021-06-23', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1978, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1979, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1980, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1981, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1982, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1983, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1984, 1, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1985, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1986, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1987, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1988, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1989, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1990, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1991, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1992, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1993, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1994, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1995, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1996, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1997, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1998, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (1999, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2000, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2001, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2002, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2003, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2004, 54, '2021-06-23', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2005, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2006, 54, '2021-06-23', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2007, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2008, 54, '2021-06-23', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2009, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2010, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2011, 54, '2021-06-23', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2012, 54, '2021-06-23', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2013, 2, '2021-07-02', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2014, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2015, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2016, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2017, 54, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2018, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2019, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2020, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2021, 54, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2022, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2023, 54, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2024, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2025, 2, '2021-07-04', 'Agrego nuevo usuario', 'adm_usuarios', 76, 'Activo');
INSERT INTO `historial` VALUES (2026, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2028, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2029, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2030, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2031, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2032, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2033, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2034, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2035, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2036, 54, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2037, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2038, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2039, 54, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2040, 54, '2021-07-04', 'Actualizo los datos del medico', 'doctores', 54, 'Activo');
INSERT INTO `historial` VALUES (2041, 54, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2042, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2043, 2, '2021-07-04', 'Agrego nuevo usuario', 'adm_usuarios', 77, 'Activo');
INSERT INTO `historial` VALUES (2044, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2045, 77, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2046, 77, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2047, 77, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2049, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2050, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2051, 2, '2021-07-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2052, 2, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2053, 77, '2021-07-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2054, 77, '2021-07-04', 'Actualizo los datos del medico', 'doctores', 54, 'Activo');
INSERT INTO `historial` VALUES (2055, 2, '2021-07-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2056, 2, '2021-07-07', 'Agrego nueva jornada electoral', 'jornadas', 66, 'Activo');
INSERT INTO `historial` VALUES (2057, 2, '2021-07-07', 'Actualizo los datos de la jornada electoral', 'jornadas', 66, 'Activo');
INSERT INTO `historial` VALUES (2058, 54, '2021-07-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2059, 54, '2021-07-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2060, 2, '2021-07-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2061, 2, '2021-07-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2062, 77, '2021-07-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2063, 77, '2021-07-07', 'Agrego nuevo usuario', 'adm_usuarios', 78, 'Activo');
INSERT INTO `historial` VALUES (2064, 77, '2021-07-07', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2065, 78, '2021-07-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2066, 1, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2067, 54, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2068, 54, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2069, 1, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2070, 2, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2071, 2, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2072, 54, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2073, 2, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2074, 1, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2075, 1, '2021-07-08', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2076, 2, '2021-07-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2077, 2, '2021-07-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2078, 2, '2021-07-12', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2079, 2, '2021-07-12', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2080, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2081, 2, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2082, 54, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2083, 54, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2084, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2085, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2086, 77, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2087, 54, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2088, 54, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2089, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2090, 77, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2091, 54, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2092, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2093, 2, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2094, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2095, 77, '2021-07-18', 'elimino el parametro', 'parametros', 36, 'Activo');
INSERT INTO `historial` VALUES (2096, 77, '2021-07-18', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2097, 77, '2021-07-18', 'Elimino los datos de la jornada electoral', 'jornadas', 66, 'Activo');
INSERT INTO `historial` VALUES (2098, 77, '2021-07-18', 'Elimino los datos del afiliados', 'afiliados', 2426, 'Activo');
INSERT INTO `historial` VALUES (2099, 77, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2100, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2101, 2, '2021-07-18', 'Agrego parametros', 'parametros', 39, 'Activo');
INSERT INTO `historial` VALUES (2102, 2, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2103, 54, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2104, 54, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2105, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2106, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2107, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2108, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2109, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2110, 2, '2021-07-18', 'Agrego nuevo usuario', 'adm_usuarios', 79, 'Activo');
INSERT INTO `historial` VALUES (2111, 78, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2112, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2113, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2114, 77, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2115, 78, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2116, 78, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2117, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2118, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2119, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2120, 2, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2121, 77, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2122, 77, '2021-07-18', 'elimino el parametro', 'parametros', 35, 'Activo');
INSERT INTO `historial` VALUES (2123, 77, '2021-07-18', 'elimino el parametro', 'parametros', 29, 'Activo');
INSERT INTO `historial` VALUES (2124, 77, '2021-07-18', 'elimino el parametro', 'parametros', 27, 'Activo');
INSERT INTO `historial` VALUES (2125, 77, '2021-07-18', 'elimino el parametro', 'parametros', 26, 'Activo');
INSERT INTO `historial` VALUES (2126, 77, '2021-07-18', 'elimino el parametro', 'parametros', 25, 'Activo');
INSERT INTO `historial` VALUES (2127, 77, '2021-07-18', 'elimino el parametro', 'parametros', 19, 'Activo');
INSERT INTO `historial` VALUES (2128, 77, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2129, 54, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2130, 54, '2021-07-18', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2131, 2, '2021-07-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2132, 78, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2133, 77, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2134, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2135, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2136, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2137, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2138, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2139, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2140, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2141, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2142, 78, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2143, 1, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2144, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2145, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2146, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2147, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2148, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2149, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2150, 1, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2151, 78, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2152, 78, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2153, 78, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2154, 78, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2155, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2156, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2157, 1, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2158, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2159, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2160, 54, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2161, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2162, 77, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2163, 77, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2164, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2165, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2166, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2167, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2168, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2169, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2170, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2171, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2172, 54, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2173, 77, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2174, 77, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2175, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2176, 54, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2177, 2, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2178, 2, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2179, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2180, 1, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2181, 1, '2021-07-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2182, 54, '2021-07-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2183, 54, '2021-07-19', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2184, 77, '2021-07-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2185, 54, '2021-07-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2186, 54, '2021-07-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2187, 54, '2021-07-21', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2188, 54, '2021-07-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2189, 54, '2021-07-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2190, 1, '2021-07-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2191, 1, '2021-07-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2192, 1, '2021-07-22', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2193, 54, '2021-07-22', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2194, 54, '2021-07-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2195, 54, '2021-07-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2197, 54, '2021-07-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2198, 78, '2021-07-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2200, 54, '2021-07-25', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2201, 54, '2021-07-28', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2202, 54, '2021-07-29', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2203, 54, '2021-08-03', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2204, 78, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2205, 78, '2021-08-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2206, 54, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2207, 78, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2208, 54, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2209, 54, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2210, 54, '2021-08-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2211, 78, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2212, 78, '2021-08-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2213, 54, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2214, 54, '2021-08-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2215, 78, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2216, 78, '2021-08-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2217, 54, '2021-08-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2218, 54, '2021-08-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2219, 54, '2021-08-06', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2220, 54, '2021-08-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2221, 54, '2021-08-07', 'Restablecio el codigo de seguridad del afiliado', 'afiliados', 2466, 'Activo');
INSERT INTO `historial` VALUES (2222, 54, '2021-08-07', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2223, 2, '2021-08-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2224, 2, '2021-08-09', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2225, 54, '2021-08-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2226, 54, '2021-08-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2227, 54, '2021-08-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2228, 54, '2021-08-10', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2229, 54, '2021-08-10', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2230, 2, '2021-08-24', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2231, 2, '2021-08-24', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2232, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2233, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2234, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2235, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2236, 54, '2021-08-31', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2237, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2238, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2239, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2240, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2241, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2242, 54, '2021-08-31', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2243, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2244, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2245, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2246, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2247, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2248, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2249, 54, '2021-08-31', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2250, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2251, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2252, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2253, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2254, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2255, 54, '2021-08-31', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2256, 54, '2021-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2257, 54, '2021-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2258, 54, '2021-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2259, 54, '2021-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2260, 54, '2021-09-01', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2261, 54, '2021-09-01', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2262, 54, '2021-09-02', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2263, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2264, 2, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2265, 2, '2021-09-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2266, 2, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2267, 2, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2268, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2269, 78, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2270, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2271, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2272, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2273, 54, '2021-09-04', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2274, 54, '2021-09-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2276, 78, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2277, 78, '2021-09-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2278, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2279, 54, '2021-09-04', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2280, 78, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2282, 54, '2021-09-04', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2283, 54, '2021-09-04', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2284, 54, '2021-09-04', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2285, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2286, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2287, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2288, 54, '2021-09-05', 'Actualizo datos de un Nuevo Candidato', 'candidatos', 65, 'Activo');
INSERT INTO `historial` VALUES (2289, 54, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2290, 78, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2291, 78, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2292, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2293, 54, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2294, 78, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2295, 78, '2021-09-05', 'Agrego nueva jornada electoral', 'jornadas', 67, 'Activo');
INSERT INTO `historial` VALUES (2296, 78, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2297, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2298, 54, '2021-09-05', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2299, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2300, 54, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2301, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2302, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2304, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2305, 54, '2021-09-05', 'Actualizo los datos de la jornada electoral', 'jornadas', 65, 'Activo');
INSERT INTO `historial` VALUES (2306, 54, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2307, 54, '2021-09-05', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2308, 54, '2021-09-05', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2309, 54, '2021-09-06', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2310, 54, '2021-09-08', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2311, 54, '2021-09-09', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2313, 54, '2021-09-16', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2314, 54, '2021-09-17', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2315, 54, '2021-09-17', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2316, 54, '2021-09-18', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2317, 54, '2021-09-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2318, 54, '2021-09-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2319, 54, '2021-09-19', 'Inicio de sesion al sistema', 'Administracion del Sistema', NULL, 'Activo');
INSERT INTO `historial` VALUES (2320, 54, '2021-09-19', 'Fin de la Seccion', 'Administarción del Sistema', NULL, 'Activo');

-- ----------------------------
-- Table structure for jornadas
-- ----------------------------
DROP TABLE IF EXISTS `jornadas`;
CREATE TABLE `jornadas`  (
  `id_jornada` int(11) NOT NULL AUTO_INCREMENT,
  `id_depa` int(11) NULL DEFAULT NULL,
  `id_muni` int(11) NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fecha` date NULL DEFAULT NULL,
  `horaDesde` time(0) NULL DEFAULT NULL,
  `horaHasta` time(0) NULL DEFAULT NULL,
  `periodoDesde` date NULL DEFAULT NULL,
  `periodoHasta` date NULL DEFAULT NULL,
  `estado` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `eliminado` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jornada`) USING BTREE,
  INDEX `muni`(`id_muni`) USING BTREE,
  INDEX `depa`(`id_depa`) USING BTREE,
  CONSTRAINT `jornadas_ibfk_1` FOREIGN KEY (`id_muni`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jornadas_ibfk_2` FOREIGN KEY (`id_depa`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jornadas
-- ----------------------------
INSERT INTO `jornadas` VALUES (65, 10, 181, 'Jornada Electoral 23062021 Alcaldía de Ayutuxtepeque', '2021-06-23', '08:00:00', '16:00:00', '2021-06-23', '2024-06-23', 'ACTIVO', '0');

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
-- Records of parametros
-- ----------------------------
INSERT INTO `parametros` VALUES (19, 8, 148, 'Alcaldía Municipal de ', 'Ezequiel Milla Guerra', 'Alcalde Municipal', 'Hector Ernesto Polio Saldivar', 'Secretario Municipal', '26097000', 'Alcaldía Municipal de La Unión. 1ra Calle Oriente y Av. Gral. Cabañas, Barrio. El Centro La Unión.', 'alcaldialaunion@hotmail.com', 'https://www.alcaldialaunion.gob.sv/', 'Logo.png', 'Juan Pedro Perez Perez', 'Maria Antonia Casttillo Flores', 'Maxima Ernestina Prudencio Turcios', 'Presidente  Suplente', 'Secretaria', 'Vocal', 'Alexis Rafael Sanchez Lainez', '', '', 'Observador designado por el Tribunal de Ética Gubernamental', '', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (25, 6, 106, 'Alcaldía Municipal de ', 'Roberto José d´Aubuisson ', 'Alcalde Municipal', ' Rommel Vladimir Huezo', 'Secretario Municipal', '2500-1300', '2a Av. Norte y 1a C Poniente. No. 2-3, Santa Tecla. La Libertad, El Salvador', '', 'http://www.santatecla.gob.sv/', 'santaTeclaLogo.png', 'Leonor Elena López de Córdova', 'Carmen Irene Contreras de Alas', 'José Guillermo Miranda Gutiérrez', 'Presidente', 'Secretario', 'Vocal', 'Jose Ruben Castro', '', '', 'Observador del CEG', '', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (26, 8, 142, 'Alcaldía Municipal de ', 'Alcalde bolívar', 'Alcalde Municipal', 'Hector Ernesto Polio Saldivar', 'Secretario municipal', '26097000', 'Alcaldía Municipal de La Unión. 1ra Calle Oriente y Av. Gral. Cabañas, Barrio. El Centro La Unión.', 'alcaldialaunion@hotmail.com', 'https://www.alcaldialaunion.gob.sv/', 'Bolivar.png', 'JOSE RUBEN CASTRO', 'ENZO GABRIEL CASTRO', 'DANIELA CASTRO', 'PRESIDENTE', 'SECRETARIO', 'VOCAL', 'observador1', '', '', 'cargo observador', '', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (27, 6, 109, 'Alcaldía Municipal de Quezaltepeque', 'Salvador Saget', 'Alcalde Municipal', 'Hector Ernesto Polio Saldivar', 'Secretario Municipal', '26097000', 'Barrio el Centro', 'amquezaltepeque@.gob.sv', 'https://www.Quezaltepeque.gob.sv/', 'Quezaltepeque.png', 'mienbro1', 'mienbro2', 'mienbro3', 'cargo1', 'cargo2', 'cargo3', 'observador1', '', '', 'Observador designado por el Tribunal de Ética Gubernamental', '', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (29, 11, 198, 'Alcaldía Municipal de Apastepeque', 'ENZO GABRIEL CASTRO  BONI', 'SUPERVISOR DE PROYECTOS', 'JUAN JOSE CLAROS GARCIA', 'Secretario Municipal', '23406392', 'BARRIO EL CENTRO FRENTE AL PARQUE', 'alcaldiapastepeque@ama.gob.sv', 'https://www.alcaldialaapastepeque.gob.sv/', 'Apastepeque.jpg', '', '', '', '', '', '', 'observador1', '', '', 'Observador designado por el Tribunal de Ética Gubernamental', '', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (35, 1, 3, 'Ahuachápan', 'Juan Manuel Pérez Gómez', 'Alcalde Municipal', '', '', '', 'Calle Principal #1, Ahuachapán', 'ahuacha@pan.gob.sv', 'http://ahuachapan.com', 'Ahuachpan-Escudo.png', '', '', '', '', '', '', 'Lic. Alcides Guandique', 'Lic. Esmeralda Cornejo', '', 'Técnico UDICA TEG', 'Técnica UDICA TEG', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (36, 1, 1, 'Ahuachapán', 'Juan Manuel Pérez Gómez', 'Alcalde Municipal', 'Sutano de Tal', 'Secretario CEG', '', '', '', '', 'library.png', '', '', '', '', '', '', 'Lic. Alcides Guandique', 'Lic. Melvin Aguilar', '', 'Técnico UDICA TEG', 'Técnica UDICA TEG', '', 'Activo', '1');
INSERT INTO `parametros` VALUES (37, 10, 181, 'Alcaldía Municipal de Ayutuxtepeque ', 'Joel Zelaya', 'Sindico Municipal', 'Rosa Gladys Cruz', 'Secretaria Municipal', '22069821', '1ra calle poniente casa #1, Ayutuxtepeque', 'uaip@ayutuxtepeque.gob.sv', 'http://www.ayutuxtepeque.gob.sv/', 'Logo ayutuxtepeque.png', 'Luis Baltazar Mendoza', '', 'Guadalupe de Romero', 'Presidente de la CEG', '', 'Vocal ', 'Edis Alcides Guandique', '', '', 'Representante del TEG', '', '', 'Activo', '0');

-- ----------------------------
-- Table structure for votacion
-- ----------------------------
DROP TABLE IF EXISTS `votacion`;
CREATE TABLE `votacion`  (
  `id_votacion` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `id_jornada` int(11) NULL DEFAULT NULL,
  `id_candidato` int(11) NULL DEFAULT NULL,
  `id_afiliado` int(11) NULL DEFAULT NULL,
  `id_depto` int(11) NULL DEFAULT NULL,
  `id_muni` int(11) NULL DEFAULT NULL,
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
  INDEX `id_depto`(`id_depto`) USING BTREE,
  INDEX `id_muni`(`id_muni`) USING BTREE,
  CONSTRAINT `votacion_ibfk_1` FOREIGN KEY (`id_jornada`) REFERENCES `jornadas` (`id_jornada`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_3` FOREIGN KEY (`id_afiliado`) REFERENCES `afiliados` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_4` FOREIGN KEY (`id_depto`) REFERENCES `departamentos` (`id_depto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `votacion_ibfk_5` FOREIGN KEY (`id_muni`) REFERENCES `municipios` (`id_muni`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of votacion
-- ----------------------------
INSERT INTO `votacion` VALUES (127, 65, 66, 2579, 10, 181, 1, 0, 0, '2021-06-23', '08:41:42', 0x30);
INSERT INTO `votacion` VALUES (128, 65, 65, 2529, 10, 181, 1, 0, 0, '2021-06-23', '08:54:59', 0x30);
INSERT INTO `votacion` VALUES (129, 65, 66, 2531, 10, 181, 1, 0, 0, '2021-06-23', '08:55:37', 0x30);
INSERT INTO `votacion` VALUES (130, 65, 65, 2509, 10, 181, 1, 0, 0, '2021-06-23', '08:56:38', 0x30);
INSERT INTO `votacion` VALUES (131, 65, 65, 2512, 10, 181, 1, 0, 0, '2021-06-23', '08:57:56', 0x30);
INSERT INTO `votacion` VALUES (132, 65, 66, 2530, 10, 181, 1, 0, 0, '2021-06-23', '08:58:11', 0x30);
INSERT INTO `votacion` VALUES (133, 65, 66, 2532, 10, 181, 1, 0, 0, '2021-06-23', '08:59:53', 0x30);
INSERT INTO `votacion` VALUES (134, 65, 65, 2510, 10, 181, 1, 0, 0, '2021-06-23', '09:00:36', 0x30);
INSERT INTO `votacion` VALUES (135, 65, 66, 2506, 10, 181, 1, 0, 0, '2021-06-23', '09:01:03', 0x30);
INSERT INTO `votacion` VALUES (136, 65, 66, 2506, 10, 181, 1, 0, 0, '2021-06-23', '09:01:18', 0x30);
INSERT INTO `votacion` VALUES (137, 65, 66, 2513, 10, 181, 1, 0, 0, '2021-06-23', '09:02:22', 0x30);
INSERT INTO `votacion` VALUES (138, 65, 65, 2505, 10, 181, 1, 0, 0, '2021-06-23', '09:02:27', 0x30);
INSERT INTO `votacion` VALUES (139, 65, 66, 2513, 10, 181, 1, 0, 0, '2021-06-23', '09:02:28', 0x30);
INSERT INTO `votacion` VALUES (140, 65, 66, 2561, 10, 181, 1, 0, 0, '2021-06-23', '09:06:19', 0x30);
INSERT INTO `votacion` VALUES (141, 65, 66, 2469, 10, 181, 1, 0, 0, '2021-06-23', '09:06:34', 0x30);
INSERT INTO `votacion` VALUES (142, 65, 66, 2469, 10, 181, 1, 0, 0, '2021-06-23', '09:06:40', 0x30);
INSERT INTO `votacion` VALUES (143, 65, 65, 2468, 10, 181, 1, 0, 0, '2021-06-23', '09:07:38', 0x30);
INSERT INTO `votacion` VALUES (144, 65, 65, 2467, 10, 181, 1, 0, 0, '2021-06-23', '09:08:09', 0x30);
INSERT INTO `votacion` VALUES (145, 65, 66, 2598, 10, 181, 1, 0, 0, '2021-06-23', '09:09:04', 0x30);
INSERT INTO `votacion` VALUES (146, 65, 65, 2589, 10, 181, 1, 0, 0, '2021-06-23', '09:09:37', 0x30);
INSERT INTO `votacion` VALUES (147, 65, 65, 2511, 10, 181, 1, 0, 0, '2021-06-23', '09:11:55', 0x30);
INSERT INTO `votacion` VALUES (148, 65, 66, 2474, 10, 181, 1, 0, 0, '2021-06-23', '09:13:28', 0x30);
INSERT INTO `votacion` VALUES (149, 65, 65, 2508, 10, 181, 1, 0, 0, '2021-06-23', '09:13:33', 0x30);
INSERT INTO `votacion` VALUES (150, 65, 66, 2535, 10, 181, 1, 0, 0, '2021-06-23', '09:22:14', 0x30);
INSERT INTO `votacion` VALUES (151, 65, 65, 2556, 10, 181, 1, 0, 0, '2021-06-23', '09:22:22', 0x30);
INSERT INTO `votacion` VALUES (152, 65, 66, 2473, 10, 181, 1, 0, 0, '2021-06-23', '09:23:56', 0x30);
INSERT INTO `votacion` VALUES (153, 65, 65, 2576, 10, 181, 1, 0, 0, '2021-06-23', '09:41:28', 0x30);
INSERT INTO `votacion` VALUES (154, 65, 65, 2503, 10, 181, 1, 0, 0, '2021-06-23', '09:41:29', 0x30);
INSERT INTO `votacion` VALUES (155, 65, 65, 2577, 10, 181, 1, 0, 0, '2021-06-23', '09:49:43', 0x30);
INSERT INTO `votacion` VALUES (156, 65, 65, 2514, 10, 181, 1, 0, 0, '2021-06-23', '09:51:26', 0x30);
INSERT INTO `votacion` VALUES (157, 65, 66, 2548, 10, 181, 1, 0, 0, '2021-06-23', '09:53:15', 0x30);
INSERT INTO `votacion` VALUES (158, 65, 66, 2550, 10, 181, 1, 0, 0, '2021-06-23', '09:53:22', 0x30);
INSERT INTO `votacion` VALUES (159, 65, 65, 2555, 10, 181, 1, 0, 0, '2021-06-23', '09:55:07', 0x30);
INSERT INTO `votacion` VALUES (160, 65, 65, 2539, 10, 181, 1, 0, 0, '2021-06-23', '09:55:21', 0x30);
INSERT INTO `votacion` VALUES (161, 65, 65, 2518, 10, 181, 1, 0, 0, '2021-06-23', '09:58:55', 0x30);
INSERT INTO `votacion` VALUES (162, 65, 65, 2546, 10, 181, 1, 0, 0, '2021-06-23', '10:00:02', 0x30);
INSERT INTO `votacion` VALUES (163, 65, 66, 2502, 10, 181, 1, 0, 0, '2021-06-23', '10:01:11', 0x30);
INSERT INTO `votacion` VALUES (164, 65, 65, 2552, 10, 181, 1, 0, 0, '2021-06-23', '10:02:48', 0x30);
INSERT INTO `votacion` VALUES (165, 65, 65, 2557, 10, 181, 1, 0, 0, '2021-06-23', '10:05:24', 0x30);
INSERT INTO `votacion` VALUES (166, 65, 66, 2578, 10, 181, 1, 0, 0, '2021-06-23', '10:05:41', 0x30);
INSERT INTO `votacion` VALUES (167, 65, 66, 2540, 10, 181, 1, 0, 0, '2021-06-23', '10:06:11', 0x30);
INSERT INTO `votacion` VALUES (168, 65, 66, 2504, 10, 181, 1, 0, 0, '2021-06-23', '10:06:30', 0x30);
INSERT INTO `votacion` VALUES (169, 65, 66, 2504, 10, 181, 1, 0, 0, '2021-06-23', '10:06:41', 0x30);
INSERT INTO `votacion` VALUES (170, 65, 66, 2501, 10, 181, 1, 0, 0, '2021-06-23', '10:06:54', 0x30);
INSERT INTO `votacion` VALUES (171, 65, 65, 2554, 10, 181, 1, 0, 0, '2021-06-23', '10:07:37', 0x30);
INSERT INTO `votacion` VALUES (172, 65, 65, 2574, 10, 181, 1, 0, 0, '2021-06-23', '10:09:10', 0x30);
INSERT INTO `votacion` VALUES (173, 65, 65, 2574, 10, 181, 1, 0, 0, '2021-06-23', '10:09:16', 0x30);
INSERT INTO `votacion` VALUES (174, 65, 65, 2524, 10, 181, 1, 0, 0, '2021-06-23', '10:09:54', 0x30);
INSERT INTO `votacion` VALUES (175, 65, 65, 2541, 10, 181, 1, 0, 0, '2021-06-23', '10:16:46', 0x30);
INSERT INTO `votacion` VALUES (176, 65, 66, 2549, 10, 181, 1, 0, 0, '2021-06-23', '10:16:47', 0x30);
INSERT INTO `votacion` VALUES (177, 65, 65, 2570, 10, 181, 1, 0, 0, '2021-06-23', '10:20:55', 0x30);
INSERT INTO `votacion` VALUES (178, 65, 66, 2499, 10, 181, 1, 0, 0, '2021-06-23', '10:21:37', 0x30);
INSERT INTO `votacion` VALUES (179, 65, 66, 2488, 10, 181, 1, 0, 0, '2021-06-23', '10:23:07', 0x30);
INSERT INTO `votacion` VALUES (180, 65, 65, 2481, 10, 181, 1, 0, 0, '2021-06-23', '10:23:07', 0x30);
INSERT INTO `votacion` VALUES (181, 65, 65, 2480, 10, 181, 1, 0, 0, '2021-06-23', '10:24:59', 0x30);
INSERT INTO `votacion` VALUES (182, 65, 66, 2497, 10, 181, 1, 0, 0, '2021-06-23', '10:26:14', 0x30);
INSERT INTO `votacion` VALUES (183, 65, 66, 2485, 10, 181, 1, 0, 0, '2021-06-23', '10:27:09', 0x30);
INSERT INTO `votacion` VALUES (184, 65, 65, 2484, 10, 181, 1, 0, 0, '2021-06-23', '10:32:49', 0x30);
INSERT INTO `votacion` VALUES (185, 65, 65, 2479, 10, 181, 1, 0, 0, '2021-06-23', '10:34:54', 0x30);
INSERT INTO `votacion` VALUES (186, 65, 65, 2479, 10, 181, 1, 0, 0, '2021-06-23', '10:35:00', 0x30);
INSERT INTO `votacion` VALUES (187, 65, 66, 2575, 10, 181, 1, 0, 0, '2021-06-23', '10:37:16', 0x30);
INSERT INTO `votacion` VALUES (188, 65, 66, 2600, 10, 181, 1, 0, 0, '2021-06-23', '10:38:10', 0x30);
INSERT INTO `votacion` VALUES (189, 65, 65, 2566, 10, 181, 1, 0, 0, '2021-06-23', '10:38:41', 0x30);
INSERT INTO `votacion` VALUES (190, 65, 66, 2597, 10, 181, 1, 0, 0, '2021-06-23', '10:41:46', 0x30);
INSERT INTO `votacion` VALUES (191, 65, 66, 2594, 10, 181, 1, 0, 0, '2021-06-23', '10:42:11', 0x30);
INSERT INTO `votacion` VALUES (192, 65, 65, 2558, 10, 181, 1, 0, 0, '2021-06-23', '10:45:27', 0x30);
INSERT INTO `votacion` VALUES (193, 65, 66, 2587, 10, 181, 1, 0, 0, '2021-06-23', '10:47:04', 0x30);
INSERT INTO `votacion` VALUES (194, 65, 66, 2596, 10, 181, 1, 0, 0, '2021-06-23', '10:52:49', 0x30);
INSERT INTO `votacion` VALUES (195, 65, 66, 2599, 10, 181, 1, 0, 0, '2021-06-23', '10:54:20', 0x30);
INSERT INTO `votacion` VALUES (196, 65, 65, 2568, 10, 181, 1, 0, 0, '2021-06-23', '11:03:21', 0x30);
INSERT INTO `votacion` VALUES (197, 65, 65, 2562, 10, 181, 1, 0, 0, '2021-06-23', '11:07:59', 0x30);
INSERT INTO `votacion` VALUES (198, 65, 65, 2593, 10, 181, 1, 0, 0, '2021-06-23', '11:11:03', 0x30);
INSERT INTO `votacion` VALUES (199, 65, 65, 2525, 10, 181, 1, 0, 0, '2021-06-23', '11:18:17', 0x30);
INSERT INTO `votacion` VALUES (200, 65, 65, 2521, 10, 181, 1, 0, 0, '2021-06-23', '11:49:41', 0x30);
INSERT INTO `votacion` VALUES (201, 65, 66, 2489, 10, 181, 1, 0, 0, '2021-06-23', '11:51:36', 0x30);
INSERT INTO `votacion` VALUES (202, 65, 66, 2466, 10, 181, 1, 0, 0, '2021-06-23', '11:55:44', 0x30);
INSERT INTO `votacion` VALUES (203, 65, 66, 2533, 10, 181, 1, 0, 0, '2021-06-23', '11:59:11', 0x30);
INSERT INTO `votacion` VALUES (204, 65, 65, 2538, 10, 181, 0, 1, 0, '2021-06-23', '12:23:44', 0x30);
INSERT INTO `votacion` VALUES (205, 65, 65, 2545, 10, 181, 0, 1, 0, '2021-06-23', '12:27:36', 0x30);
INSERT INTO `votacion` VALUES (206, 65, 65, 2527, 10, 181, 1, 0, 0, '2021-06-23', '12:42:50', 0x30);
INSERT INTO `votacion` VALUES (207, 65, 66, 2515, 10, 181, 1, 0, 0, '2021-06-23', '12:45:02', 0x30);
INSERT INTO `votacion` VALUES (208, 65, 65, 2542, 10, 181, 0, 1, 0, '2021-06-23', '12:58:22', 0x30);
INSERT INTO `votacion` VALUES (209, 65, 65, 2583, 10, 181, 0, 1, 0, '2021-06-23', '13:06:46', 0x30);
INSERT INTO `votacion` VALUES (210, 65, 65, 2605, 10, 181, 0, 1, 0, '2021-06-23', '13:08:17', 0x30);
INSERT INTO `votacion` VALUES (211, 65, 65, 2516, 10, 181, 1, 0, 0, '2021-06-23', '13:09:40', 0x30);
INSERT INTO `votacion` VALUES (212, 65, 65, 2565, 10, 181, 1, 0, 0, '2021-06-23', '13:11:35', 0x30);
INSERT INTO `votacion` VALUES (213, 65, 65, 2567, 10, 181, 0, 1, 0, '2021-06-23', '13:12:27', 0x30);
INSERT INTO `votacion` VALUES (214, 65, 65, 2498, 10, 181, 0, 1, 0, '2021-06-23', '13:26:16', 0x30);
INSERT INTO `votacion` VALUES (215, 65, 66, 2551, 10, 181, 1, 0, 0, '2021-06-23', '13:36:57', 0x30);
INSERT INTO `votacion` VALUES (216, 65, 66, 2543, 10, 181, 1, 0, 0, '2021-06-23', '13:37:16', 0x30);
INSERT INTO `votacion` VALUES (217, 65, 65, 2475, 10, 181, 1, 0, 0, '2021-06-23', '13:40:48', 0x30);
INSERT INTO `votacion` VALUES (218, 65, 66, 2526, 10, 181, 1, 0, 0, '2021-06-23', '13:43:59', 0x30);
INSERT INTO `votacion` VALUES (220, 65, 65, 2537, 10, 181, 1, 0, 0, '2021-06-23', '13:46:34', 0x30);
INSERT INTO `votacion` VALUES (221, 65, 65, 2603, 10, 181, 1, 0, 0, '2021-06-23', '13:54:19', 0x30);
INSERT INTO `votacion` VALUES (222, 65, 66, 2520, 10, 181, 1, 0, 0, '2021-06-23', '13:54:36', 0x30);
INSERT INTO `votacion` VALUES (223, 65, 65, 2534, 10, 181, 0, 1, 0, '2021-06-23', '13:56:31', 0x30);
INSERT INTO `votacion` VALUES (224, 65, 65, 2476, 10, 181, 0, 1, 0, '2021-06-23', '14:25:14', 0x30);
INSERT INTO `votacion` VALUES (225, 65, 65, 2507, 10, 181, 1, 0, 0, '2021-06-23', '15:14:49', 0x30);
INSERT INTO `votacion` VALUES (226, 65, 65, 2517, 10, 181, 1, 0, 0, '2021-06-23', '15:42:12', 0x30);
INSERT INTO `votacion` VALUES (232, 65, 65, 2544, 10, 181, 1, 0, 0, '2021-07-19', '17:09:27', 0x30);

-- ----------------------------
-- View structure for vista_votos
-- ----------------------------
DROP VIEW IF EXISTS `vista_votos`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vista_votos` AS select sum(`votacion`.`voto`) AS `votos`,`votacion`.`id_candidato` AS `candidato`,`votacion`.`id_jornada` AS `id_jornada` from `votacion` group by `votacion`.`id_candidato`;

SET FOREIGN_KEY_CHECKS = 1;
