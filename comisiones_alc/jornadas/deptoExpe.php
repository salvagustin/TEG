<?php
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

echo $continente = $_POST['continente'];

$sql = $con->consulta("SELECT * FROM municipios WHERE id_depto = '$continente' AND eliminado = 0");

while ($ver = $con->arreglo($sql)) {
  echo $cadena = '<option value=' . $ver["id_muni"] . '>' . $ver["municipio"] . '</option>';
}

