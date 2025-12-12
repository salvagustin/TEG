<?php
// session_timeout.php

// 1. Definir el tiempo de inactividad máximo (en segundos)
// EJEMPLO: 10 minutos (600 segundos)
$inactivity_limit = 600; 
$login_page = 'index.php'; // Define la página de login aquí (ajusta si es diferente)

// 2. Comprobar si la sesión ha expirado por inactividad
// time() es el tiempo actual en segundos
if (isset($_SESSION['ultima_actividad']) && (time() - $_SESSION['ultima_actividad'] > $inactivity_limit)) {
    
    // Si la inactividad supera el límite, destruir la sesión
    session_unset();    // Eliminar variables de sesión
    session_destroy();  // Destruir la sesión

    // Redireccionar a la página de inicio de sesión con un mensaje de expiración
    header("Location: " . $login_page . "?timeout=1"); 
    exit();
}

// 3. Si la sesión es válida (o se acaba de iniciar), actualizar la marca de tiempo de la última actividad
$_SESSION['ultima_actividad'] = time();

?>