<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

  $id  = $_POST["id"];
 $usu  = $_POST["usua"];
$nom  = $_POST["nom"];
$ape  = $_POST["ape"];
$tel  = $_POST["tel"];
$mai1 = $_POST["mai"];
 $nrol = $_POST["nrol"];
$deptoExpe = $_POST["deptoExpe"];
 $muniExpe = $_POST["muniExpe"];


    
    $sql = $con->consulta("UPDATE adm_usuarios SET   usu='$usu', rol='$nrol', nom='$nom', ape='$ape', tel='$tel', mai='$mai1',id_depto='$deptoExpe',id_muni='$muniExpe' WHERE id = '$id'");

$detalle = "Actualizo los datos del medico";
$lugar="doctores";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

	echo $result=$sql;
