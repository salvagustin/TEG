<?php
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
require "../seguro.php";

$con = new cnn();
$fecha = date("Y-m-d");

$id = $_POST['id'];

$sql = $con->consulta("UPDATE jornadas SET eliminado =  1, estado = 'CERRADO' WHERE id_jornada = '$id'");

$detalle = "Elimino los datos de la jornada electoral";
$lugar = "jornadas";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

echo $result = $sql;
