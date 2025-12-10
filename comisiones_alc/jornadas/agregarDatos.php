<?php

ini_set('default_charset', 'UTF8');

require("../php/conexion.php");

require("../seguro.php");

$con = new cnn();

$fechas = date("Y-m-d");





$descripcion  = $_POST["descripcion"];

$fecha  = $_POST["fecha"];

$desde  = $_POST["desde"];

$hasta  = $_POST["hasta"];

$Jdesde  = $_POST["Jdesde"];

$Jhasta  = $_POST["Jhasta"];




$sql = $con->consulta("UPDATE jornadas SET estado='CERRADO' WHERE estado = 'ACTIVO'");



$update = $con->consulta("INSERT INTO jornadas VALUES(NULL, '$descripcion', '$fecha', '$desde', '$hasta','$Jdesde','$Jhasta','ACTIVO', 0)");







$bu = $con->consulta("SELECT id_jornada FROM jornadas ORDER BY id_jornada DESC LIMIT 1");

$busca = $con->arreglo($bu);



$detalle = "Agrego nueva jornada electoral";

$lugar = "jornadas";

$id = $busca["id_jornada"];



$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fechas', '$detalle', '$lugar', '$id', 'Activo')");



echo $result = $sql;

