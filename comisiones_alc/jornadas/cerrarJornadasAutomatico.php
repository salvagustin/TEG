<?php
// Desactiva la visualización de errores para entornos de producción
error_reporting(0);
ini_set('display_errors', 0);

// Incluye el archivo de conexión (AJUSTA ESTA RUTA si es necesario)
// Se asume que conexion.php está dos niveles arriba (../..) del script actual
require_once(__DIR__ . '/../php/conexion.php'); 

// Crea una nueva instancia de la conexión
$con = new cnn();

// --- Lógica de Cierre Automático ---
// Concatenamos la fecha y la hora de finalización (horaHasta) y la comparamos con la hora actual del servidor (NOW()).
// La jornada 69 en tu ejemplo (2025-12-09 11:50:00) será cerrada por este script si la hora actual es posterior.
$sql_update = "
    UPDATE jornadas
    SET estado = 'CERRADO'
    WHERE estado = 'ACTIVO'
    -- CONCAT(fecha, ' ', horaHasta) crea un TIMESTAMP completo para comparación
    AND CONCAT(fecha, ' ', horaHasta) <= NOW()
";

$resultado = $con->consulta($sql_update);

// Opcional: Para depuración, puedes imprimir cuántas filas fueron afectadas
// Nota: El objeto mysqli puede variar dependiendo de cómo esté implementada la clase cnn.
// Si tu clase cnn guarda la conexión en una propiedad llamada 'mysqli', puedes usar:
// if (isset($con->mysqli) && $con->mysqli instanceof mysqli) {
//     echo "Jornadas actualizadas: " . $con->mysqli->affected_rows;
// }

// Finaliza la ejecución del script
exit();
?>

<!-- 
COMANDO PARA ACTIVAR EL CRON JOB
 * * * * * php /var/www/TEG/comisiones_alc/jornadas/cerrarJornadasAutomatico.php  
-->