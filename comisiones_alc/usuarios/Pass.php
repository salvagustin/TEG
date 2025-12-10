<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

  $id  = $_POST["idPass"];
 $contra1  =  md5($_POST["contra1"]);;
$contra2  =  md5($_POST["contra2"]);





    if($contra1==$contra2)
{
    $sql = $con->consulta("UPDATE adm_usuarios SET  pas='$contra2'  WHERE id = '$id'");

$detalle = "Actualizo los datos del medico";
$lugar="doctores";

//$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");
    } else {   $result = 0; }
	echo $result=$sql;
