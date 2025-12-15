<?php
ob_start();
ini_set( 'default_charset', 'UTF-8' ); // Corregido a UTF-8
error_reporting( 0 );
require "../php/conexion.php";
// Asegúrate de incluir la librería PHPExcel/Shared/Date.php si es necesario
require_once 'PHPExcel/Classes/PHPExcel/Shared/Date.php';

$con = new cnn();
$fechas = date("Y-m-d");
$hora = date( "H:i:s" );
?>

<!DOCTYPE html>
<html lang="en">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Votaciones ACE</title>
<link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
<script src="../plantilla/alertifyjs/alertify.js"></script>
<link href="plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
<script>
    function fileValidation() {
        var fileInput = document.getElementById('archivo');
        var filePath = fileInput.value;
        var allowedExtensions = /(.xlsx|.xls)$/i;
        if (!allowedExtensions.exec(filePath)) {
            Swal.fire('Error', 'Cargue un archivo excel con extensión xls o xlsx', 'error');
            fileInput.value = '';
            return false;
        }
    }
</script>
</head>

<body>
<nav id="navbar-example2" class="navbar navbar-light bg-light"> <a class="navbar-brand" href="index.php">Registros de afiliados ACE</a> </nav>
<div class="container">
<div class="row">
<div class="col">
<form action="" method="post" enctype="multipart/form-data">
<div class="card card-primary">
<div class="card-header bg-primary">
<h3 class="card-title text-white">Subir archivo excel</h3>
<button type="button" class="close" onclick="window.close();" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
</div>
<div class="card-body">
<div class="form-group">
<div class="custom-file">
<input type="file" class="form-control-file" id="archivo" name="archivo" onchange="return fileValidation()">                                     </div>
</div>
</div>
<div class="card-footer text-center">
<button type="submit" class="btn btn-primary" name="boton"><i class="fas fa-cloud-upload-alt"></i> Subir padrón</button>
</div>
</div>
</div>
</form>
</div>
        <?php
// ...
// CÓDIGO ANTERIOR HASTA EL INICIO DEL PROCESO DE IMPORTACIÓN

if ( isset( $_POST[ "boton" ] ) )
{
    // 1. FORZAR INCLUSIÓN DE PHPEXCEL Y VERIFICAR DISPONIBILIDAD
    // Si la librería está en la carpeta raíz del proyecto, usa la ruta correcta
    require_once 'afiliaciones/PHPExcel/PHPExcel/IOFactory.php';
    require_once 'PHPExcel/PHPExcel/Shared/Date.php'; // Esta es la ruta correcta dentro de afiliados/

    $archivos = $_FILES[ 'archivo' ][ "name" ];
    $ruta = "excel/";
    
    if (!move_uploaded_file( $_FILES[ 'archivo' ][ 'tmp_name' ], $ruta . $_FILES[ 'archivo' ][ 'name' ] )) {
         echo "<script> Swal.fire('Error de Subida', 'No se pudo mover el archivo al directorio excel/. Verifique permisos.', 'error'); </script>";
         goto end_script;
    }
    
    $archivo = $ruta . $archivos;
    
    try {
        $inputFileType = PHPExcel_IOFactory::identify( $archivo );
        $objReader = PHPExcel_IOFactory::createReader( $inputFileType );
        $objPHPExcel = $objReader->load( $archivo );
        $sheet = $objPHPExcel->getSheet(0);
        $highestRow = $sheet->getHighestRow();
    } catch (Exception $e) {
        echo "<script> Swal.fire('Error de Lectura', 'Error al cargar el archivo Excel: " . addslashes($e->getMessage()) . "', 'error'); </script>";
        goto end_script;
    }
    
    $registros_insertados = 0;

    // Bucle para leer filas, empezando desde la fila 2
    for ( $row = 2; $row <= $highestRow; $row++ )
    {
        // 2. Mapeo de columnas basado en tu Excel (A-K)
        $nombre1   = trim( $sheet->getCell( "A" . $row )->getValue() );    // primerNombre
        $nombre2   = trim( $sheet->getCell( "B" . $row )->getValue() );    // segundoNombre
        $apellido1 = trim( $sheet->getCell( "C" . $row )->getValue() );    // primerApellido
        $apellido2 = trim( $sheet->getCell( "D" . $row )->getValue() );    // segundoApellido
        $apellido3 = trim( $sheet->getCell( "E" . $row )->getValue() );    // apellidoCasada
        $sexo      = trim( $sheet->getCell( "F" . $row )->getValue() );    // sexo
        $fecha_nac_excel = $sheet->getCell( "G" . $row )->getValue();      // G (Fecha Nacimiento)
        $cargo     = trim( $sheet->getCell( "H" . $row )->getValue() );    // cargo
        $DUI       = trim( $sheet->getCell( "I" . $row )->getValue() );    // DUI
        $codigo    = trim( $sheet->getCell( "J" . $row )->getValue() );    // codigo
        $eliminado = trim( $sheet->getCell( "K" . $row )->getValue() );    // eliminado
        
        
        // 3. Conversión de FECHA
        $fecha_nac = 'NULL'; 
        if (PHPExcel_Shared_Date::isDateTime($fecha_nac_excel)) {
            $timestamp = PHPExcel_Shared_Date::ExcelToPHP($fecha_nac_excel);
            $fecha_nac = "'" . date('Y-m-d', $timestamp) . "'"; // Formatear y añadir comillas
        }
        
        // 4. SANEAR VALORES CRÍTICOS (DUI)
        $DUI_safe = mysqli_real_escape_string($con->conexion, $DUI);
        
        // 5. Verificación de existencia por DUI
        // Aseguramos que el DUI no exista en registros NO eliminados
        $bus = $con->consulta("SELECT id FROM afiliados WHERE dui = '$DUI_safe' AND eliminado <> '1'"); 
        
        if ($con->conteo($bus) == 0 && !empty($DUI_safe)) {
            
            // 6. CORRECCIÓN DE LA CONSULTA INSERT FINAL
            // Usamos $fecha_nac SIN comillas si es 'NULL' o CON comillas si es fecha.
            $sql_insert = 
                "INSERT INTO afiliados (
                    primerNombre, segundoNombre, primerApellido, segundoApellido, 
                    apellidoCasada, sexo, dui, fechaNac, cargo, codigo, eliminado
                ) VALUES ( 
                    '$nombre1', '$nombre2', '$apellido1', '$apellido2', 
                    '$apellido3', '$sexo', '$DUI_safe', $fecha_nac, '$cargo', '$codigo', '$eliminado'
                )";

            $insertar = $con->consulta($sql_insert);

            // 7. DEPURACIÓN: Si la inserción falla, muestra un error detallado (solo para desarrollo)
            if (!$insertar) {
                // Si quieres ver el error de la base de datos
                echo "<script> Swal.fire('SQL Error', '" . addslashes(mysqli_error($con->conexion)) . "', 'error'); </script>";
            } else {
                $registros_insertados++;
            }
        }
    }
    
    // --- RESULTADOS ---
    ?> 
    <script> 
        Swal.fire({
            icon: 'success',
            title: 'Importación Finalizada',
            text: '<?php echo $registros_insertados; ?> Afiliados registrados con éxito. (Se omitieron duplicados/DUI vacíos).',
            confirmButtonText: 'Aceptar',
        }).then((result) => {
            if (result.isConfirmed) { 
                window.opener.location.reload('afiliaciones.php'); 
                window.close(); 
            }
        }); 
    </script>
    <?php
}

// Etiqueta para terminar el script si hay un error de subida (goto)
end_script:
?>
</div>
</body>
</html>
<script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
<script src="../plantilla/bootstrap/popper.min.js"></script>
<script src="../plantilla/bootstrap/bootstrap.min.js"></script>

</body>
</html>