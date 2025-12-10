<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

if (isset($_POST["boton"])) 
{
  $candidato     = $_POST['candidato'];
  $periodo       = $_POST['periodo'];
  $edad          = $_POST['edad'];
  $profesion     = $_POST['profesion'];
  $domicilio     = $_POST['domicilio'];
  $cargoMuni     = $_POST['cargoMuni'];
  $foto          = $_FILES['foto']['name'];
  $ruta          = "fotos/";

  $voto = $con->consulta("SELECT id_votacion FROM votacion WHERE eliminado = 0 AND id_jornada = '$periodo' AND fecha = '$fecha' ");

  if($con->conteo($voto) == 0)
  {
    if (empty($foto)) 
    {
      $sql = $con->consulta("INSERT INTO candidatos VALUES (NULL, '$candidato', '$periodo',  '$edad', '$domicilio', '$profesion', NULL, 'Activo', 0)");
    }
    else
    {
      $sql = $con->consulta("INSERT INTO candidatos VALUES (NULL, '$candidato', '$periodo',  '$edad', '$domicilio', '$profesion', '$foto', 'Activo', 0)");

      move_uploaded_file($_FILES['foto']['tmp_name'], $ruta . $_FILES['foto']['name']);
    }

    $consulta = $con->consulta("SELECT id_candidato FROM candidatos ORDER BY id_candidato DESC LIMIT 1");
    $datosS = $con->arreglo($consulta);

    $ulti = $datosS["id_candidato"];
    $accion = "Inscribio a un Nuevo Candidato";
    $lugar = "candidatos";
    $consultas = $con->consulta("INSERT INTO historial VALUES (NULL, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$ulti', 'Activo')");

    echo "<script> window.location.href='../candidatos.php'; </script>";

  }
  else
  {
	  echo "<script> alert ('La votación de este periodo ya ha iniciado');    window.location.href='../candidatos.php';  </script>";
  }
}