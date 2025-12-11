<?php
ob_start();
ini_set('default_charset', 'UTF8');
require "seguro.php";
require "../php/conexion.php";
$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:i:s");

?>
<!DOCTYPE html>
<html lang="en">
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
  <link href="../plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>
<body class="hold-transition layout-top-nav">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand-md navbar-light navbar-white" style="background-color:#131d2e; ">
      <div class="container">
        <a href="#" class="navbar-brand">
          <img src="../plantilla/dist/img/ACELogoBlanco.png" width="230">
        </a>
      </div>
    </nav>
  <div class="content-wrapper">
    <div class="content-header">
      <div class="container">
        <?php
          if(isset($_POST["boton"]))
          {
            $jornada = $_POST["jornada"];
            $voto = $_POST["voto"];
            $afiliado = $_SESSION["id"];
            $votos = 1;

            $can = $con->consulta("SELECT id_candidato FROM candidatos WHERE id_jornada = '$jornada'  LIMIT 1");
            $candi = $con->arreglo($can);

            if($voto == "abstencion")
            {
              $consulta = $con->consulta("INSERT INTO votacion VALUES(NULL, '$jornada', '$candi[id_candidato]', '$afiliado', 0, 1, 0, '$fecha', '$hora', 0)");
            ?>
            <div class="row">
              <div class="col">
                <div class="card card-primary card-outline">
                  <div class="card-body text-center">
                      <div class="login-logo">
                        <img src="../plantilla/dist/img/ACEAzul.png" width="230">
                      </div>
                    <h3>¡Gracias por participar en este proceso de elección!</h3>
                  </div>
                  <div class="card-footer text-center">
                    <a href="salir.php" class="btn btn-lg btn-primary" style="background-color: #131d2e; border-color: #131d2e; ">Finalizar</a>
                  </div>
                </div>
              </div>
            </div>
            <?php
              }
              elseif($voto == "nulo")
              {
                $consulta = $con->consulta("INSERT INTO votacion VALUES(NULL, '$jornada', '$candi[id_candidato]', '$afiliado',  0, 0, 1, '$fecha', '$hora', 0)");
              ?>
              <div class="row">
              <div class="col">
                <div class="card card-primary card-outline">
                  <div class="card-body text-center">
                      <div class="login-logo">
                        <img src="../plantilla/dist/img/ACEAzul.png" width="230">
                      </div>
                    <h3>¡Gracias por participar en este proceso de elección!</h3>
                  </div>
                  <div class="card-footer text-center">
                    <a href="salir.php" class="btn btn-lg btn-primary" style="background-color: #131d2e; border-color: #131d2e; ">Finalizar</a>
                  </div>
                </div>
              </div>
            </div>
              <?php
              }
              else
              {

                $consulta = $con->consulta("INSERT INTO votacion VALUES(NULL, '$jornada', '$voto', '$afiliado',  '$votos', 0, 0, '$fecha', '$hora', 0)");
              ?>
            <div class="row">
              <div class="col">
                <div class="card card-primary card-outline">
                  <div class="card-body text-center">
                      <div class="login-logo">
                        <img src="../plantilla/dist/img/ACEAzul.png" width="230">
                      </div>
                    <h3>¡Gracias por participar en este proceso de elección!</h3>
                  </div>
                  <div class="card-footer text-center">
                    <a href="salir.php" class="btn btn-lg btn-primary" style="background-color: #131d2e; border-color: #131d2e; ">Finalizar</a>
                  </div>
                </div>
              </div>
            </div>
          <?php
              }
            }
        ?>
      </div>
    </div>
  </div>
  
</div>
<!-- jQuery -->
<script src="../plantilla/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../plantilla/dist/js/adminlte.min.js"></script>
</body>
</html>