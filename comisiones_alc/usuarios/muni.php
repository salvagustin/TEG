<?php
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";

$con = new cnn();

$continente = $_POST['continente'];

$sql = $con->consulta("SELECT * FROM municipios WHERE id_depto = '$continente' AND eliminado = 0 and id_muni = '$_SESSION[muni]'");

while ($ver = $con->arreglo($sql)) {
    echo $cadena = '<option value=' . $ver["id_muni"] . '>' . $ver["municipio"] . '</option>';
}
