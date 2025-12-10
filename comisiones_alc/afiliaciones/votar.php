<?php

ob_start();

ini_set('default_charset', 'UTF8');

require "seguro.php";

require "../php/conexion.php";

$con = new cnn();

$fecha = date("Y-m-d");

$hora = date("H:i:s");


$pe = $con->consulta("SELECT id_jornada, periodoDesde, periodoHasta FROM jornadas WHERE  estado = 'Activo'");

$periodo = $con->arreglo($pe);

$can = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.sexo, afiliados.segundoApellido, afiliados.apellidoCasada,  candidatos.foto, candidatos.id_candidato, candidatos.id_jornada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.estado = 'Activo' AND candidatos.id_jornada = '$periodo[id_jornada]' ORDER BY RAND() LIMIT 50");

?>

<!DOCTYPE html>

<html lang="es">

<head>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <meta http-equiv="x-ua-compatible" content="ie=edge">

  <title>Votaciones ACE</title>

  <!-- Font Awesome Icons -->

  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">

  <!-- Theme style -->

  <link rel="stylesheet" href="../plantilla/dist/css/adminlte.min.css">

  <!-- Google Font: Source Sans Pro -->

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

</head>



<body class="hold-transition layout-top-nav">

  <div class="wrapper">

    <!-- Navbar -->

    <nav class="main-header navbar navbar-expand-md navbar-light navbar-white">

      <div class="container">

        <a href="#" class="navbar-brand">

          <img src="../parametros/logos/<?php echo $para["logo"]; ?>" class="brand-image img-circle elevation-3" style="opacity: .8" >

          

        </a>

      </div>

    </nav>

    <!-- /.navbar -->

    <!-- Content Wrapper. Contains page content -->

    <div class="content-wrapper">

      <!-- Content Header (Page header) -->

      <div class="content-header">

        <div class="container">

          <div class="row">

            <div class="col text-center">

              <h1 class="m-0 text-dark"> ELECCIÓN DEL MIEMBRO PROPIETARIO Y SUPLENTE DE LA COMISIÓN DE ÉTICA GUBERNAMENTAL, DE ESTA MUNICIPALIDAD, POR PARTE DE LAS Y LOS EMPLEADOS MUNICIPALES, PARA EL PERIODO <?php echo date('m/Y', strtotime($periodo["periodoDesde"])); ?> - <?php echo date('m/Y', strtotime($periodo["periodoHasta"])); ?></h1>

            </div><!-- /.col -->

          </div><!-- /.row -->

        </div><!-- /.container-fluid -->

      </div>

      <!-- /.content-header -->

      <!-- Main content -->

      <div class="content">

        <div class="container">

          <form action="registrarVoto.php" method="post" id="form1" name="form1" onsubmit="return confirm('¿Está seguro de finalizar la votación? ');" >

            <div class="row">

              <?php

              while ($candidato = $con->arreglo($can)) {

              ?>

                <div class="col-6 text-center">

                  <div class="card border-primary card-primary card-outline text-center">

                    <img  <?php if($candidato["foto"]<>""){  ?> src="../candidatos/fotos/<?php echo $candidato["foto"]; ?>" <?php } else {  if ($candidato["sexo"]=="MASCULINO"){?> src="../candidatos/fotos/hombre.png" <?php } elseif($candidato["sexo"]=="FEMENINO"){ ?> src="../candidatos/fotos/mujer.png" <?php } } ?> class="text-center" width="50%"  >

                    <div class="card-body text-center">

                      <P class="text-center" style="font-size:30px"><b><?php if($candidato["primerNombre"] == ""){ echo "&nbsp; &nbsp;"; }else{ echo $candidato["primerNombre"]." ".$candidato["segundoNombre"]; } ?></b></P>

                      <P class="text-center" style="font-size:30px"><b><?php if($candidato["segundoNombre"] == ""){ echo "&nbsp; &nbsp;"; }else{ echo $candidato["primerApellido"]." ".$candidato["segundoApellido"]; } ?></b></P>

                      <!--<P class="text-center"><?php if($candidato["primerApellido"] == ""){ echo "&nbsp; &nbsp;"; }else{  } ?></P>

                      <P class="text-center"><?php if($candidato["segundoApellido"] == ""){ echo "&nbsp; &nbsp;"; }else{ echo $candidato["segundoApellido"]; } ?></P>

                      <P class="text-center"><?php if($candidato["apellidoCasada"] == ""){ echo "&nbsp; &nbsp;"; }else{ echo $candidato["apellidoCasada"]; } ?></P>-->

                    </div>

                    <ul class="list-group list-group-flush text-center">

                      <li class="list-group-item"><?php echo $candidato["cargoEleccion"]; ?></li>

                      <input type="hidden" name="candidato" id="cantidato" value="<?php echo $candidato["id_candidato"]; ?>">

                    </ul>

                    <div class="card-body">

                      

                      <div class="form-group">

                        <label for="voto">

                          <input class="form-control" type="radio" id="voto" name="voto" value="<?php echo $candidato["id_candidato"]; ?>">

                          <input type="hidden" name="jornada" id="jornada" value="<?php echo $periodo["id_jornada"]; ?>">

                          Marcar

                        </label>

                      </div> 

                    </div>

                  </div>

                </div>

              <?php

              }

              ?>

              <div class="col-6 text-center">

                  <div class="card border-primary card-primary card-outline">

                    <img src="abstencion.png" class="card-img-top">

                    <ul class="list-group list-group-flush text-center">

                      <li class="list-group-item">VOTO <BR> ABSTENCIÓN</li>

                    </ul>

                    <div class="card-body">

                      <div class="form-group">

                        <label for="voto">

                          <input class="form-control" type="radio" id="voto" name="voto" value="abstencion">

                          <input type="hidden" name="jornada" id="jornada" value="<?php echo $periodo["id_jornada"]; ?>">

                          Marcar

                        </label>

                      </div>

                    </div>

                  </div>

                </div>

            </div>

            <div class="row">

              <div class="col text-center">

                <button type="submit"  id="boton" name="boton" class="btn btn-primary btn-lg btn-block"><i class="fas fa-vote-yea"></i> Votar</button>

              </div>

            </div>

        </div>

        </form>

      </div><!-- /.container-fluid -->

    </div>

    <!-- /.content -->

  </div>

  <!-- /.content-wrapper -->

  <!-- Main Footer -->

  <footer class="main-footer">

    <b>Copyright &copy; <?php echo date("Y"); ?> <a href="#">Proyecto USAID Pro Integridad Pública</a>.</b>

    All rights reserved.

    <div class="float-right d-none d-sm-inline-block">

      <b>Version</b> 1.0.1

    </div>

  </footer>

  </div>

  <!-- jQuery -->

  <script src="../plantilla/plugins/jquery/jquery.min.js"></script>

  <!-- Bootstrap 4 -->

  <script src="../plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- AdminLTE App -->

  <script src="../plantilla/dist/js/adminlte.min.js"></script>

</body>

</html>
