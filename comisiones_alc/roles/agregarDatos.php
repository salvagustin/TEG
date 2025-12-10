<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

	$n=$_POST['rol'];
	

	$sql=$con->consulta("INSERT INTO adm_rol VALUES (NULL, '$n')");

$consulta = $con->consulta("SELECT rol FROM  adm_rol ORDER BY  rol DESC LIMIT 1");
$datosS = $con->arreglo($consulta);
$ulti=$datosS["rol"];

$accion="Agrego nuevo rol";
$lugar="adm_rol";

//$consultas = $con->consulta("INSERT INTO historial VALUES (null, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$ulti', 'Activo')");   

echo $result=$sql;

 

 ?>