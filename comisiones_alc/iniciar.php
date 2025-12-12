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
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="iniciar.php" class="nav-link">Inicio</a>
                </li>
            </ul>
            <!-- SEARCH FORM -->
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Messages Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" href="salir.php">
                        <i class="far ion-log-out"></i> Salir
                    </a>
                </li>
                <!-- Notifications Dropdown Menu -->
            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <?php include("aside.php"); ?>
        </aside>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Inicio</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
                            </ol>
                        </div><!-- /.col -->

                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <!-- ./col -->
                    </div>
                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <div class="col" id="tabla">
                        </div>
                    </div>
                    <!-- /.row (main row) -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer text-justify">
            <?php include "pie.php"; ?>
        </footer>
    </div>
    <!-- ./wrapper -->
    <!-- jQuery -->
    <?php include("footer.php"); ?>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#tabla').load('ingresos.php');
        });
    </script>
</body>
</html>