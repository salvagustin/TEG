<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

	$id=$_POST['id'];

	$sql = $con->consulta("UPDATE adm_usuarios SET estado = 'Inactivo' WHERE id = '$id'");

$detalle = "elimino los datos de un usuario";
$lugar="adm_usuarios";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

	echo $result=$sql;
