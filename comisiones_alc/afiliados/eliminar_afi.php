<?php 
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
require "../seguro.php";
$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:s:i");



  if($_SESSION["rol"] == "Super" )

  {

$idDepa = $_POST["deptoExpe"];

 $idmuni = $_POST["muniExpe"];

  }

  else

  {

    $idDepa = $_SESSION["depto"];

    $idmuni = $_SESSION["muni"];

  }
$sql = $con->consulta("UPDATE afiliados SET eliminado = 1 WHERE id_depaPertenece = '$idDepa' and id_muniPertenece = '$idmuni' ");
     echo "<script>     window.location.href='../afiliaciones.php';     </script>";
?>
