<?php

ini_set('default_charset', 'UTF8');

require "../php/conexion.php";

require "../seguro.php";

$con = new cnn();

$fechas = date("Y-m-d");



$id = $_POST["id"];

$descripcion = $_POST["descripcion"];

$fecha = $_POST["fecha"];

$desde = $_POST["desde"];

$hasta = $_POST["hasta"];

$Jdesde = $_POST["Jdesde"];

$Jhasta = $_POST["Jhasta"];

$estado = $_POST["estado"];




$sql = $con->consulta("UPDATE jornadas SET  descripcion = '$descripcion', fecha = '$fecha', horaDesde = '$desde', horaHasta ='$hasta', periodoDesde='$Jdesde', periodoHasta='$Jhasta',estado='$estado' WHERE id_jornada = '$id'");



$detalle = "Actualizo los datos de la jornada electoral";

$lugar = "jornadas";



$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fechas', '$detalle', '$lugar', '$id', 'Activo')");



echo $result = $sql;

