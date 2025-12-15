<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
$fecha = date("Y-m-d");

if (isset($_POST["boton"])) 
{
    $candidato 	   = $_POST['candidato'];
    $periodo 	   = $_POST['periodo'];
    $edad 	 	   = $_POST['edad'];
    $profesion 	   = $_POST['profesion'];
    $domicilio 	   = $_POST['domicilio'];
    $foto 	 	   = $_FILES['foto']['name'];
    $ruta 	 	   = "fotos/";

    $voto = $con->consulta("SELECT id_votacion FROM votacion WHERE eliminado = 0 AND id_jornada = '$periodo' AND fecha = '$fecha' ");

    if($con->conteo($voto) == 0)
    {
        
        $check_candidato_sql = "SELECT id_candidato FROM candidatos WHERE id_afiliado = '$candidato' AND id_jornada = '$periodo' AND eliminado = 0";
        $check_candidato = $con->consulta($check_candidato_sql);
        
        
        if ($con->conteo($check_candidato) > 0) 
        {
           
            echo "<script> alert ('ERROR: La persona seleccionada ya está registrada como candidato para este periodo.'); window.location.href='../candidatos.php'; </script>";
            
        } 
        else 
        {
            
            if (empty($foto)) 
            {
                $sql = $con->consulta("INSERT INTO candidatos VALUES (NULL, '$candidato', '$periodo', '$edad', '$domicilio', '$profesion', NULL, 'Activo', 0)");
            }
            else
            {
                $nombre_encriptado = md5($candidato . time()) . ".jpg"; 
                move_uploaded_file($_FILES['foto']['tmp_name'], $ruta . $nombre_encriptado);
                
                $sql = $con->consulta("INSERT INTO candidatos VALUES (NULL, '$candidato', '$periodo', '$edad', '$domicilio', '$profesion', '$nombre_encriptado', 'Activo', 0)");
            }

            $consulta = $con->consulta("SELECT id_candidato FROM candidatos ORDER BY id_candidato DESC LIMIT 1");
            $datosS = $con->arreglo($consulta);

            $ulti = $datosS["id_candidato"];
            $accion = "Inscribio a un Nuevo Candidato";
            $lugar = "candidatos";
            $consultas = $con->consulta("INSERT INTO historial VALUES (NULL, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$ulti', 'Activo')");

            echo "<script> window.location.href='../candidatos.php'; </script>";
        }
        // =======================================================
        // LÓGICA DE VERIFICACIÓN DE DUPLICIDAD FIN
        // =======================================================
    }
    else
    {
        echo "<script> alert ('La votación de este periodo ya ha iniciado'); window.location.href='../candidatos.php'; </script>";
    }
}