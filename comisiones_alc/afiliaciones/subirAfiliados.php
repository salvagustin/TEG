<?php
ob_start();
ini_set('default_charset', 'UTF-8');
error_reporting(E_ALL & ~E_DEPRECATED);
ini_set('display_errors', 1);

require "../php/conexion.php";
require 'vendor/autoload.php'; 

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Shared\Date;

$con = new cnn();
$db = $con->getConexion(); 
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Importación</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> 
    <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <form action="" method="post" enctype="multipart/form-data">
        <div class="card border-primary shadow">
            <div class="card-header bg-primary text-white"><h3>Subir Excel </h3></div>
            <div class="card-body">
                <input type="file" name="archivo" accept=".xlsx, .xls" class="form-control-file" required>
            </div>
            <div class="card-footer text-center">
                <button type="submit" name="boton" class="btn btn-primary">Procesar Información</button>
                <a href="../afiliaciones.php" class="btn btn-secondary">
                  <i class="fas fa-redo"></i>
                  Cancelar
                </a>
            </div>
        </div>
    </form>

    <?php
if (isset($_POST["boton"])) {
    $rutaDir = "excel/";
    if (!file_exists($rutaDir)) mkdir($rutaDir, 0777, true);
    $archivoDestino = $rutaDir . $_FILES['archivo']['name'];

    if (move_uploaded_file($_FILES['archivo']['tmp_name'], $archivoDestino)) {
        try {
            $spreadsheet = IOFactory::load($archivoDestino);
            $sheet = $spreadsheet->getActiveSheet();
            $highestRow = $sheet->getHighestRow();
            $insertados = 0;

            // Iniciamos en la fila 14 según tu requerimiento
            for ($row = 14; $row <= $highestRow; $row++) {
                
                $nombreCompleto = trim($sheet->getCell("B$row")->getValue() ?? '');
                if (empty($nombreCompleto)) continue;

                // --- NUEVA LÓGICA DE SEPARACIÓN ---
                $partes = explode(" ", $nombreCompleto);
                $num_partes = count($partes);

                // Por defecto inicializamos
                $a1 = ""; $a2 = ""; $n1 = ""; $n2 = "";

                if ($num_partes >= 4) {
                    // Caso: Apellido1 Apellido2(o De Castro) Nombre1 Nombre2...
                    $a1 = $partes[0];
                    
                    // Si la segunda o tercera parte es "DE", unimos para el segundo apellido
                    if (strtoupper($partes[1]) == "DE") {
                        $a2 = $partes[1] . " " . $partes[2];
                        $n1 = $partes[3] ?? '';
                        $n2 = $partes[4] ?? ''; 
                    } else {
                        $a2 = $partes[1];
                        $n1 = $partes[2];
                        $n2 = $partes[3];
                    }
                } else {
                    // Caso simple: 3 partes o menos
                    $a1 = $partes[0] ?? '';
                    $a2 = $partes[1] ?? '';
                    $n1 = $partes[2] ?? '';
                }

                // Escapamos los datos para SQL
                $a1 = mysqli_real_escape_string($db, $a1);
                $a2 = mysqli_real_escape_string($db, $a2);
                $n1 = mysqli_real_escape_string($db, $n1);
                $n2 = mysqli_real_escape_string($db, $n2);

                // 3. OBTENER RESTO DE COLUMNAS
                $dui = mysqli_real_escape_string($db, trim($sheet->getCell("C$row")->getFormattedValue() ?? '')); 
                
                $cellFecha = $sheet->getCell("D$row");
                $fechaNacFinal = "NULL";
                if (Date::isDateTime($cellFecha)) {
                    $timestamp = (int)Date::excelToTimestamp($cellFecha->getValue());
                    $fechaNacFinal = "'" . date('Y-m-d', $timestamp) . "'";
                }

                $cargo = mysqli_real_escape_string($db, trim($sheet->getCell("E$row")->getFormattedValue() ?? ''));
                $correo = mysqli_real_escape_string($db, trim($sheet->getCell("G$row")->getFormattedValue() ?? ''));
                // CORRECCIÓN DEL CÓDIGO ALEATORIO ÚNICO
                // Usamos microtime() y el DUI para que nunca sea igual aunque se inserten rápido
                $cod = mb_strtoupper(substr(md5(microtime() . $dui), 0, 6));
                
                $elim = 0;

                if (!empty($dui)) {
                    $resCheck = $con->consulta("SELECT id FROM afiliados WHERE dui = '$dui'");
                    if ($con->conteo($resCheck) == 0) {
                        // Eliminamos el campo apellidoCasada de la consulta como pediste
                        $sql = "INSERT INTO afiliados (
                            primerNombre, segundoNombre, primerApellido, segundoApellido, dui, fechaNac, cargo, correo, codigo, eliminado
                        ) VALUES (
                            '$n1', '$n2', '$a1', '$a2', '$dui', $fechaNacFinal, '$cargo', '$correo','$cod', '$elim'
                        )";
                        
                        if ($con->consulta($sql)) $insertados++;
                    }
                }
            }

            echo "<script>
                Swal.fire({
                    icon: 'success',
                    title: 'Importación Exitosa',
                    text: 'Registros procesados: $insertados',
                }).then(() => {
                    window.location.href = '../afiliaciones.php';
                });
            </script>";

        } catch (Exception $e) {
            echo "<script>Swal.fire('Error', 'Error: " . addslashes($e->getMessage()) . "', 'error');</script>";
        }
    }
}
?>
</div>
</body>
</html>