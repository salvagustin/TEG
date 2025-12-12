<?php

ini_set('default_charset', 'UTF8');

require "../php/conexion.php";

require "../seguro.php";



$con = new cnn();

$fecha = date("Y-m-d");

$id = $_POST['id'];

$sql = $con->consulta("UPDATE afiliados SET eliminado =  '0' WHERE id = '$id'");

$detalle = "Activo el Afiliado nuevamente";
$lugar = "afiliados";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

echo $result = $sql;
