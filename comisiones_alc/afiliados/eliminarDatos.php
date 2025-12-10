<?php

ini_set('default_charset', 'UTF8');

require "../php/conexion.php";

require "../seguro.php";



$con = new cnn();

$fecha = date("Y-m-d");



$id = $_POST['id'];



$sql = $con->consulta("UPDATE afiliados SET eliminado =  '1' WHERE id = '$id'");



$detalle = "Elimino los datos del afiliados";

$lugar = "afiliados";



$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");



echo $result = $sql;

