<?php
ini_set('default_charset', 'UTF8');
require("seguro.php");
require("php/conexion.php");
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';
$con = new cnn();
?>

<!DOCTYPE html>
<html>
<head>
  <?php include("head.php"); ?>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
  <div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="iniciar.php" class="nav-link">Inicio</a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link" href="salir.php">
            <i class="far ion-log-out"></i> Salir
          </a>
        </li>
      </ul>
    </nav>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <?php include("aside.php"); ?>
    </aside>
    <div class="content-wrapper">
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">Escrutinio</h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
                <li class="breadcrumb-item active">Escrutinio</li>
              </ol>
            </div>
            <div id="tabla" style="width:100%"></div>
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
    </div>

    <footer class="main-footer text-justify">
      <?php include "pie.php"; ?>
    </footer>
  </div>

  <!-- jQuery -->
  <?php include("footer.php"); ?>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#tabla').load('scrutinio/ver_scutrinio.php');
    });

    $(function() {
      //Initialize Select2 Elements
      $('.select2').select2()
      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      })
    })
  </script>
</body>
</html>