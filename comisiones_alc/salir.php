<?php 
    ini_set('default_charset','UTF8');
    require("seguro.php");
    require("php/conexion.php");
    $db = new cnn();
    $fecha = time();
    $fecha_con_formato = date("Y-m-d",$fecha);
    $accion= "Fin de la Seccion";
    $lugar="Administarción del Sistema";

    $consulta = $db->consulta("INSERT INTO historial  VALUES (null, '$_SESSION[id]', '$fecha_con_formato', '$accion', '$lugar', null, 'Activo')");
					  
    session_start();
    session_destroy();
	// para hosting web
    //header("location: ../index.php");
	header("location:index.php");

