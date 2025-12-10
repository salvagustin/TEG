<?php
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
require "../seguro.php";

$con = new cnn();

$continente = $_POST['continente'];
if($_SESSION["rol"] == "Super")
{
  $sql = $con->consulta("SELECT * FROM municipios WHERE id_depto = '$continente' AND eliminado = 0");
}
else
{
  $sql = $con->consulta("SELECT * FROM municipios WHERE id_depto = '$continente' AND id_muni = '$_SESSION[muni]' AND eliminado = 0");
}


while ($ver = $con->arreglo($sql)) {
  if($ver["id_muni"] == $_SESSION["muni"])
  {
    echo $cadena = '<option value=' . $ver["id_muni"] . 'selected >' . $ver["municipio"] . '</option>';
  }
  else
  {
    echo $cadena = '<option value=' . $ver["id_muni"] . ' >' . $ver["municipio"] . '</option>';

  }
  
}

