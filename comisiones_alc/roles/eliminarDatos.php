<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

	$id=$_POST['id'];

 $sql = $con->consulta("DELETE FROM adm_rol WHERE rol = '$id'");

$detalle = "elimino un rol";
$lugar="adm_rol";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

	echo $result=$sql;
