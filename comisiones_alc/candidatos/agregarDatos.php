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
        // --- NUEVA LÓGICA PARA CALCULAR LA EDAD ---
        // 1. Buscamos la fecha de nacimiento del afiliado
        $res_fecha = $con->consulta("SELECT fechaNac FROM afiliados WHERE id = '$candidato'");
        $datos_f = $con->arreglo($res_fecha);
        $fecha_nacimiento = $datos_f['fechaNac'];
        $edad = 0;

        if(!empty($fecha_nacimiento) && $fecha_nacimiento != '0000-00-00') {
            // 2. Calculamos la diferencia con la fecha actual
            $nacimiento = new DateTime($fecha_nacimiento);
            $hoy = new DateTime();
            $diferencia = $hoy->diff($nacimiento);
            $edad = $diferencia->y; // Obtenemos solo los años
        }
        // ------------------------------------------

        // Generar nombre de foto único (usando microtime para evitar duplicados)
        $nombre_encriptado = md5($candidato . microtime()) . ".jpg"; 
        move_uploaded_file($_FILES['foto']['tmp_name'], $ruta . $nombre_encriptado);
        
        // Insertar en candidatos con la $edad calculada automáticamente
        $sql = $con->consulta("INSERT INTO candidatos VALUES (NULL, '$candidato', '$periodo', '$edad', '$domicilio', '$profesion', '$nombre_encriptado', 'Activo', 0)");

        // Registro en historial
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