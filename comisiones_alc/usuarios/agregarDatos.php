<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

	$usu = $_POST['usu'];
	$pass = md5($_POST['pass']);
	$rol = $_POST["rol"];
    $nom = $_POST["nom"];
    $ape = $_POST["ape"];
    $tel = $_POST["tel"]; 
    $mail1 = $_POST["mail1"];
    $mail2 = $_POST["mail2"];

//if($mail1==$mail2)
//{
	$sql = $con->consulta("INSERT INTO adm_usuarios VALUES (NULL, '$usu', '$pass', '$rol', '$nom', '$ape', '$tel', '$mail1', 'Activo')");
//}
//else { $sql; }

$consulta = $con->consulta("SELECT id FROM adm_usuarios ORDER BY  id DESC LIMIT 1");
$datosS = $con->arreglo($consulta);
$ulti = $datosS["id"];

$accion = "Agrego nuevo usuario";
$lugar = "adm_usuarios";
$consultas = $con->consulta("INSERT INTO historial VALUES (null, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$ulti', 'Activo')");   

echo $result = $sql;