<?php
ob_start();
ini_set( 'default_charset', 'UTF8' );
error_reporting( 0 );
require "../php/conexion.php";


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
<title>Registros</title>
<link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
<script src="../plantilla/alertifyjs/alertify.js"></script>
<link href="../plantilla/dist/img/icon.jpg" rel="shortcut icon" type="image/vnd.microsoft.icon">
<script>
  function fileValidation() {
    var fileInput = document.getElementById('archivo');
    var filePath = fileInput.value;
    var allowedExtensions = /(.xlsx|.xls)$/i;
    if (!allowedExtensions.exec(filePath)) {
      alert('Cargue un archivo excel con extensión xls o xlsx ');
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
<button type="button" class="close" onclick="  window.close();" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
</div>
<div class="card-body">
<div class="form-group">
<div class="custom-file">
<input type="file" class="form-control-file" id="archivo" name="archivo" onchange="return fileValidation()">                                      </div>
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
  if ( isset( $_POST[ "boton" ] ) )
  {
    $archivos = $_FILES[ 'archivo' ][ "name" ];
    $ruta = "excel/";
    move_uploaded_file( $_FILES[ 'archivo' ][ 'tmp_name' ], $ruta . $_FILES[ 'archivo' ][ 'name' ] );
    $archivo = $ruta . $archivos;
    $inputFileType = PHPExcel_IOFactory::identify( $archivo );
    $objReader = PHPExcel_IOFactory::createReader( $inputFileType );
    $objPHPExcel = $objReader->load( $archivo );
    $sheet = $objPHPExcel->getSheet(0);
    $highestRow = $sheet->getHighestRow();
    $highestColumn = $sheet->getHighestColumn();

    $a = $con->consulta( "SELECT afiliacion FROM afiliados ORDER BY afiliacion DESC LIMIT 1" );
    $afi = $con->arreglo( $a );
        $i = 1;
    for ( $row = 2; $row <= $highestRow; $row++ )
    {
            $nombre1 = trim( $sheet->getCell( "A" . $row )->getValue() );
            $nombre2 = trim( $sheet->getCell( "B" . $row )->getValue() );
            $apellido1 = trim( $sheet->getCell( "C" . $row )->getValue() );
            $apellido2 = trim( $sheet->getCell( "D" . $row )->getValue() );
            $apellido3 = trim( $sheet->getCell( "E" . $row )->getValue() );
            $sexo = trim( $sheet->getCell( "F" . $row )->getValue() );
            $DUI = trim( $sheet->getCell( "G" . $row )->getValue() );
            $NIT = "";
            $fecha_na = "";
            $depto = trim( $sheet->getCell( "H" . $row )->getValue() );
            $muni = trim( $sheet->getCell( "I" . $row )->getValue() );
            $fechaExpeDu = trim( $sheet->getCell( "J" . $row )->getValue() );
            $depaResi = trim( $sheet->getCell( "H" . $row )->getValue() );
            $muniResi = trim( $sheet->getCell( "I" . $row )->getValue() );
            $direc = "";
            $telefono = "";
            $celular = "";
            $telefonoT = "";
            $cargo = trim( $sheet->getCell( "K" . $row )->getValue() );
            $depaPerte = trim( $sheet->getCell( "H" . $row )->getValue() );
            $muniperte = trim( $sheet->getCell( "I" . $row )->getValue() );
            //$fecha_nac = date("Y-m-d", strtotime($fecha_na));
          //   $fechaExpeDui = date("Y-m-d", strtotime($fechaExpeDu));
		$fecha_nac = '2022-01-01';
		$fechaExpeDui = '2022-01-01';


            if ( empty( $nombre1 ) )

            {

            } else {


                    $busmuni = $con->consulta( "SELECT	departamentos.id_depto, municipios.id_muni FROM	departamentos	INNER JOIN	municipios	ON 	departamentos.id_depto = municipios.id_depto WHERE depto LIKE '%$depto%' and municipio LIKE'%$muni%'" );
                    $idmuni = $con->arreglo( $busmuni );
                    $depa1 = $idmuni[ "id_depto" ];
                    $muni1 = $idmuni[ "id_muni" ];
                    /////////////            
                    $busmuni = $con->consulta( "SELECT	departamentos.id_depto, municipios.id_muni FROM	departamentos	INNER JOIN	municipios	ON 	departamentos.id_depto = municipios.id_depto WHERE depto LIKE '%$depaResi%' and municipio LIKE'%$muniResi%'" );
                    $idmuni = $con->arreglo( $busmuni );
                    $depa2 = $idmuni[ "id_depto" ];
                    $muni2 = $idmuni[ "id_muni" ];
                    ///////////////     
                    $busmuni = $con->consulta( "SELECT	departamentos.id_depto, municipios.id_muni FROM	departamentos	INNER JOIN	municipios	ON 	departamentos.id_depto = municipios.id_depto WHERE depto LIKE '%$depaPerte%' and municipio LIKE'%$muniperte%'" );
                    $idmuni = $con->arreglo( $busmuni );
                    $depa3 = $idmuni[ "id_depto" ];
                    $muni3 = $idmuni[ "id_muni" ];
                    ////////////////      
               $bus=$con->consulta("SELECT id FROM afiliados WHERE	dui = '$DUI' AND eliminado <> '1' "); 
               
            if($con->conteo($bus) == 0){
					
				//if($fechaExpeDui==$fech){
					   $insertar = $con->consulta( "INSERT INTO afiliados VALUES (NULL, '$i', '$nombre1', '$nombre2', '$apellido1', '$apellido2', '$apellido3', '$sexo', '$DUI', '$NIT', '$fecha_nac', '$depa1', '$muni1', '$fechaExpeDui', '$depa2', '$muni2', '$direc', '$telefono', '$celular', '$telefonoT', '$cargo', NULL, NULL, NULL, '$hora', '$fechas','$depa3','$muni3', 2)" );
				//}		
                 
                }        
              $i++;
            } 

    
    }
      
$conteoo=$con->consulta("SELECT	afiliados.id FROM	afiliados WHERE	afiliados.eliminado = 2 AND	afiliados.id_depaPertenece = '$depa3' AND afiliados.id_muniPertenece = '$muni3'");
$conte=$con->conteo($conteoo);
      


   ?> <script>          
    Swal.fire({
        icon: 'success',
        title: 'Datos subidos  correctamente: <?php echo  $conte ; ?> Afiliados registrados',
  confirmButtonText: `Aceptar`,

}).then((result) => {
         if (result.isConfirmed) {    window.opener.location.reload('afiliaciones.php');  window.close(); }
        })  </script><?php
 


   //echo " <div class='alert alert-success text-center' role='alert'>    Afiliados Agregados.   </div>";
   // echo "<script> window.opener.location.reload('afiliaciones.php'); self.close();</script>";
    }


    ?>
</div>
</body>
</html>
<script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
<script src="../plantilla/bootstrap/popper.min.js"></script>
<script src="../plantilla/bootstrap/bootstrap.min.js"></script>

</body>
</html>
