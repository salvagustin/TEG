<?php
require '../vendor/autoload.php';
require "../php/conexion.php";
require "../seguro.php";

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$con = new cnn();
$fecha = date("Y-m-d");

if(isset($_POST['id'])) {
    $id = $_POST['id'];
    
    // Consultar datos del afiliado actual
    $res = $con->consulta("SELECT primerNombre, correo, codigo FROM afiliados WHERE id = '$id' AND eliminado = 0" );
    $afi = $con->arreglo($res);
    

    if(!$afi || empty($afi['correo'])) {
        echo "saltado"; // Si no tiene correo, saltamos al siguiente
        exit;
    }

    $mail = new PHPMailer(true);

    try {
        $mail->isSMTP();
        $mail->Host       = 's2893.syd1.stableserver.net'; // Servidor SMTP (ej: smtp.gmail.com)
        $mail->SMTPAuth   = true;
        $mail->Username   = 'ace.soporte@ace.gob.sv'; // Tu correo
        $mail->Password   = 'biiBuwDmQH';         // Tu contraseña
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;
        $mail->Port       = 465;

        $mail->setFrom('ace.soporte@ace.gob.sv', 'Sistema de Votaciones ACE');
        $mail->addAddress($afi['correo'], $afi['primerNombre']);

        $mail->isHTML(true);
        $mail->Subject = 'Sistema de Votaciones de Agencia de Ciberseguridad del Estado';
        $mail->Body    = "<h3>Hola " . $afi['primerNombre'] . "</h3><p>Por este medio informamos que las votaciones para el comite de etica gubernamental estan abiertas y puedes votar con el siguiente codigo personal:.</p>
                                                                   <h3>" . $afi['codigo'] . "</h3>";
        

        $mail->send();
        echo "enviado";
    } catch (Exception $e) {
        echo "error";
    }
}
?>