<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require "../seguro.php";

$con = new cnn();

if($_SESSION["rol" ] == "Super")
{
  $para = $con->consulta("SELECT  parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.nombreSecretario, parametros.cargoSecretario, parametros.telefono, parametros.direccion, parametros.correo, parametros.logo FROM parametros WHERE parametros.eliminado = 0");

  $jor = $con->consulta("SELECT periodoDesde, periodoHasta FROM jornadas WHERE eliminado = 0 AND estado = 'Activo'" );

  $da = $con->consulta("SELECT afiliacion, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui, cargo FROM afiliados WHERE eliminado <> 1 ORDER BY primerApellido ASC, segundoApellido ASC, primerNombre ASC");
 

}
else
{
  $para = $con->consulta("SELECT parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.nombreSecretario, parametros.cargoSecretario, parametros.telefono, parametros.direccion, parametros.correo, parametros.logo FROM parametros  WHERE parametros.eliminado = 0");

  $jor = $con->consulta("SELECT periodoDesde, periodoHasta FROM jornadas WHERE eliminado = 0 AND estado = 'Activo' ");

  $da = $con->consulta("SELECT afiliados, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui, cargo FROM afiliados WHERE eliminado <> 1  ORDER BY primerApellido ASC, segundoApellido ASC, primerNombre ASC");


}

$parametro = $con->arreglo($para);
$jornada = $con->arreglo($jor);

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Admin Registros | CEG</title>
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
</head>

<body>
 
  
  ?>
  <div class="row">
    <div class="col-2 text-center">
      <img src="../parametros/logos/<?php echo $parametro["logo"]; ?>" width="81" height="91">
    </div>
    <div class="col text-center">
      <h1>PADRÓN ELECTORAL</h1>
      <h2>MUNICIPALIDAD DE LA AGENCIA DE CIBERSEGURIDAD DEL ESTADO  </h1>
      <h4>ELECCIÓN DE MIEMBRA O MIEMBRO PROPIETARIO Y SUPLENTE DE LA COMISIÓN DE ÉTICA GUBERNAMENTAL DE LA MUNICIPALIDAD DE LA AGENCIA DE CIBERSEGURIDAD DEL ESTADO EN EL PERIODO DE <?php echo date('d/m/Y', strtotime($jornada["periodoDesde"])); ?> A <?php echo date('d/m/Y', strtotime($jornada["periodoHasta"])); ?></h4>
    </div>
    <div class="col-2 text-center">
       <img src="../plantilla/dist/img/Escudo.fw.png" width="81" height="91">
    </div>
  </div>
  
  <div class="row">
    <div class="col table-responsive">
      <table class="table table-bordered table-sm">
        <thead>
          <th class="text-center">No.</th>
          <th class="text-center">APELLIDOS, NOMBRES</th>
          <th class="text-center">CARGO</th>
          <th class="text-center">DUI</th>
          <th class="text-center" style="width: 18rem">FIRMA</th>
        </thead>
        <tbody>
          <?php 
            $i=0;
          while($dato = $con->arreglo($da)){  $i++ ?> 
          <tr>
            <th scope="row"><?php echo $i; ?></th>
            <td><?php echo $dato["primerApellido"];?> <?php echo $dato["segundoApellido"]; ?> <?php echo $dato["apellidoCasada"];?>, <?php echo $dato["primerNombre"]; ?> <?php echo $dato["segundoNombre"]; ?></td>
            <td><?php echo $dato["cargo"]; ?></td>
            <td class="text-center"><?php echo $dato["dui"];?></td>
            <td></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>