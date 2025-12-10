<?php 
ini_set('default_charset','UTF8');
require_once "../seguro.php";

require "../php/conexion.php";

$con = new cnn();
$fecha = date("Y-m-d");

	$id=$_POST['id'];

 $sql = $con->consulta("UPDATE parametros SET eliminado = 1 WHERE id_parametro = '$id'");

$detalle = "elimino el parametro";
$lugar="parametros";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

	echo $result=$sql;
