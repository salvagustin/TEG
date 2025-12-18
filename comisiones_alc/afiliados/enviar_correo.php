<?php
// Cargar autoload de Composer y conexión
require '../vendor/autoload.php';
require "../php/conexion.php";
require "../seguro.php"; // Para capturar la sesión del historial

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$con = new cnn();
$fecha = date("Y-m-d");

if(isset($_POST['id_afiliado'])) {
    $id = $_POST['id_afiliado'];
    
    // 1. Consultar datos del afiliado
    $res = $con->consulta("SELECT primerNombre, primerApellido, correo FROM afiliados WHERE id = '$id'");
    $afi = $con->arreglo($res);

    if(empty($afi['correo'])) {
        echo "error_correo_vacio";
        exit;
    }

    // 2. GENERAR NUEVO CÓDIGO (Tu lógica)
    $nuevoCodigo = mb_strtoupper(substr(md5(time()), 0, 6));

    // 3. ACTUALIZAR BASE DE DATOS
    $update = $con->consulta("UPDATE afiliados SET codigo = '$nuevoCodigo' WHERE id = '$id'");

    // 4. GUARDAR EN HISTORIAL
    $detalle = "Restableció y envió código de seguridad por correo";
    $lugar = "afiliados";
    $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");

    // 5. CONFIGURAR Y ENVIAR CORREO
    $mail = new PHPMailer(true);

    try {
        // Configuración del Servidor SMTP
        $mail->isSMTP();
        $mail->Host       = 's2893.syd1.stableserver.net'; // Servidor SMTP (ej: smtp.gmail.com)
        $mail->SMTPAuth   = true;
        $mail->Username   = 'ace.soporte@ace.gob.sv'; // Tu correo
        $mail->Password   = 'biiBuwDmQH';         // Tu contraseña
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port       = 465;

        // Destinatario
        $mail->setFrom('ace.soporte@ace.gob.sv', 'Sistema de Votaciones ACE');
        $mail->addAddress($afi['correo'], $afi['primerNombre']);

        // Contenido - Plantilla HTML
        $mail->isHTML(true);
        $mail->Subject = 'Nuevo Codigo de Acceso - ' . $afi['primerNombre'];
        
        // Cuerpo del mensaje con diseño básico
        $mail->Body = "
            <div style='font-family: sans-serif; border: 1px solid #ddd; padding: 20px; border-radius: 10px;'>
                <h2 style='color: #131d2e;'>Hola, " . $afi['primerNombre'] . " " . $afi['primerApellido'] . "</h2>
                <p>Se ha generado un nuevo codigo de seguridad para tu acceso al sistema de Votaciones de la Agencia de Ciberseguridad del Estado.</p>
                <div style='background-color: #f4f4f4; padding: 15px; text-align: center; border-radius: 5px;'>
                    <span style='font-size: 24px; font-weight: bold; color: #d9534f; letter-spacing: 2px;'>" . $nuevoCodigo . "</span>
                </div>
                <p style='font-size: 12px; color: #777; margin-top: 20px;'>
                    Si no solicitaste este cambio, por favor contacta al administrador.
                </p>
            </div>";

        $mail->send();
        echo 1; // Éxito total
    } catch (Exception $e) {
        echo "Error: " . $mail->ErrorInfo;
    }
}