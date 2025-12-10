<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

	$id=$_POST['id'];
	$n=$_POST['rol'];


	$sql = $con->consulta("UPDATE adm_rol SET con = '$n' WHERE rol = '$id'");

$detalle = "Actualizo los datos del Rol";
$lugar="adm_rol";

//$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

	echo $result=$sql;
