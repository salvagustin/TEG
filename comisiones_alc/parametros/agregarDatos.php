<?php

ini_set('default_charset', 'UTF8');

require ("../php/conexion.php");

require ("../seguro.php");

$con = new cnn();

$fecha = date("Y-m-d");



if (isset($_POST["boton"])) {



    $municipalidad = $_POST['municipalidad'];

    $nombreAlcalde = $_POST['alcalde'];

    $cargoAlcalde = $_POST['cargoAlcalde'];

    $nombreSecretario = $_POST['nombreSecretario'];

    $cargoSecretario = $_POST['cargoSecretario'];

    $telefono = $_POST['telefono'];

    $direc = $_POST['direc'];

    $correo = $_POST['correo'];

    $paginaW = $_POST['paginaW'];



    $miembro1 = $_POST['miembro1'];

    $miembro2 = $_POST['miembro2'];

    $miembro3 = $_POST['miembro3'];

    $cargo1 = $_POST['cargo1'];

    $cargo2 = $_POST['cargo2'];

    $cargo3 = $_POST['cargo3'];

    $observador = $_POST['observador'];
    $observador2 = $_POST['observador2'];
    $observador3 = $_POST['observador3'];

    $cargoobservador = $_POST['cargoobservador'];
    $cargoobservador2 = $_POST['cargoobservador2'];
    $cargoobservador3 = $_POST['cargoobservador3'];



    $logo = $_FILES['logo']['name'];

    $ruta = "logos/";



    if (empty($logo)) {

    $cargo2 = $_POST['cargo2'];

        $sql = $con->consulta("INSERT INTO parametros VALUES (NULL, '$municipalidad', '$nombreAlcalde', '$cargoAlcalde', '$nombreSecretario', '$cargoSecretario', '$telefono', '$direc', '$correo', '$paginaW', NULL, '$miembro1', '$miembro2', '$miembro3', '$cargo1', '$cargo2', '$cargo3', '$observador', '$observador2', '$observador3', '$cargoobservador', '$cargoobservador2', '$cargoobservador3', 'Activo', 0)");

        ///son img

    } else {

        $sql = $con->consulta("INSERT INTO parametros VALUES (NULL, '$municipalidad', '$nombreAlcalde', '$cargoAlcalde', '$nombreSecretario', '$cargoSecretario', '$telefono', '$direc', '$correo', '$paginaW', '$logo', '$miembro1', '$miembro2', '$miembro3', '$cargo1', '$cargo2', '$cargo3', '$observador', '$observador2', '$observador3', '$cargoobservador', '$cargoobservador2', '$cargoobservador3', 'Activo', 0)");

        move_uploaded_file($_FILES['logo']['tmp_name'], $ruta . $_FILES['logo']['name']);

    }



    $consulta = $con->consulta("SELECT id_parametro FROM parametros ORDER BY id_parametro DESC LIMIT 1");

    $datosS = $con->arreglo($consulta);



    $ulti = $datosS["id_parametro"];

    $accion = "Agrego parametros";

    $lugar = "parametros";



    $consultas = $con->consulta("INSERT INTO historial VALUES (NULL, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$ulti', 'Activo')");



    echo    "<script> window.location.href='../parametros.php'; </script>";

} 

?>



    