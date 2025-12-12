<?php
ini_set('default_charset', 'UTF8');
setlocale(LC_TIME, 'es_ES.UTF-8');
require "../php/conexion.php";
require "../seguro.php";
require "../php/numeroLetras.php";
$V = new EnLetras();


$con = new cnn();
  $Desde=$_POST["Desde"];
  $Hasta=$_POST["Hasta"];

 $jor = $con->consulta("SELECT jornadas.id_jornada, jornadas.fecha, jornadas.horaDesde, jornadas.horaHasta, jornadas.periodoDesde,jornadas.periodoHasta FROM jornadas  WHERE  jornadas.fecha >= '$Desde' AND jornadas.fecha <= '$Hasta' ");    
    
    
$jornada = $con->arreglo($jor);


?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Votaciones ACE</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="../plantilla/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <!-- Theme style -->
  <link rel="stylesheet" href="../plantilla/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="../plantilla/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="../plantilla/plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="../plantilla/plugins/summernote/summernote-bs4.css">
  <link rel="stylesheet" href="../plantilla/plugins/datatables-bs4/css/dataTables.bootstrap4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../plantilla/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../plantilla/plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="../plantilla/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../plantilla/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <link rel="stylesheet" type="text/css" href="../plantilla/alertifyjs/css/alertify.css">
  <link rel="stylesheet" type="text/css" href="../plantilla/alertifyjs/css/themes/default.css">
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="../plantilla/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="../plantilla/plugins/toastr/toastr.min.css">
  <link href="plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body onload="window.print()">
  <div class="row">
    <div class="col-3 text-center">
      <img src="../plantilla/dist/img/LogoEsa.png" width="81" height="91">
    </div>
    <div class="col text-center">
      <h2>AGENCIA DE CIBERSEGURIDAD DEL ESTADO </h2>  
      <h3>REPORTE DE JORNADAS ELECTORALES </h3>  
 
    </div>
    <div class="col-3 text-center">
      <img src="../plantilla/dist/img/LogoEsa.png" width="81" height="91">
    </div>
  </div>
	
 


  <div class="row">
    <div class="col table-responsive">
     <table class="table table-bordered table-hover">
    <thead class="thead-light">
      <th scope="col">FECHA</th>
      <th scope="col">DESCRIPCION</th>
      <th scope="col">PERIODO</th>
      <th scope="col">CANDIDATOS</th>
    <th scope="col">VOTOS TOTALES</th>
    <th scope="col">ABSTENCIONES</th>    
      </thead>
    <tbody>
<?php

    
$dato=$con->consulta("SELECT jornadas.id_jornada, jornadas.fecha, jornadas.horaDesde, jornadas.horaHasta, jornadas.periodoDesde, jornadas.periodoHasta, jornadas.descripcion   FROM jornadas  WHERE jornadas.fecha >= '$Desde' AND jornadas.fecha <= '$Hasta'");
    

        

    while(  $dat = $con->arreglo($dato)){
		  
        ?>
      <tr>
        <td><?php echo  $dat["fecha"] ?></td>
       <td><?php echo  $dat["descripcion"] ?></td>
        <td >    <?php echo date('m/Y', strtotime($dat["periodoDesde"]))." ".date('H:i a', strtotime($dat["horaDesde"])); ?> al   <?php echo date('m/Y', strtotime($dat["periodoHasta"]))." ".date('H:i a', strtotime($dat["horaHasta"])); ?></td>
          
        
            <td >
<?php   $candidatos = $con->consulta("SELECT	candidatos.id_candidato FROM candidatos	INNER JOIN	jornadas ON candidatos.id_jornada = jornadas.id_jornada WHERE
	jornadas.id_jornada = '$dat[id_jornada]' ");
              $candi = $con->conteo($candidatos);

             echo  $candi;  ?>
		  </td>      
        <td >
        <?php   $vo = $con->consulta("SELECT SUM(voto) AS votos FROM votacion WHERE id_jornada = '$dat[id_jornada]' AND  votacion.voto = 1 ");
              $votos = $con->arreglo($vo);
             echo  $votos["votos"];  ?>
		  </td>
                          <td >
        <?php   $abstenciones = $con->consulta("SELECT SUM(abstenciones) AS abstenciones FROM votacion WHERE id_jornada = '$dat[id_jornada]' ");
              $abste= $con->arreglo($abstenciones);
             echo  $abste["abstenciones"];  ?>
		  </td>
      </tr>
      <?php } ?>

    </tbody>
  </table>
    </div>
  </div>
</body>

</html>