<?php
ini_set('default_charset','UTF8');
require("seguro.php");
require("php/conexion.php");
$con = new cnn();
?>
<!DOCTYPE html>
<html>
<head>
  <?php include("head.php"); ?>
    <script src="roles/funciones.js"></script>
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
            <h1 class="m-0 text-dark">Roles</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
              <li class="breadcrumb-item active">Roles</li>
            </ol>
          </div><!-- /.col -->
            <div class="container">
		<div id="tabla"></div>
	</div>   
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <?php include("roles/agregarRol.php"); ?>
        </div>
        <!-- /.row --> 
        <!-- Main row -->
        <div class="row">
         <?php include("roles/editarRol.php"); ?>
        </div>
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer text-justify">
    <?php include("pie.php"); ?>
  </footer>
  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
<!-- jQuery -->
<?php include("footer.php"); ?>
    <script type="text/javascript">
	$(document).ready(function(){
		$('#tabla').load('roles/ver_rol.php');
	});
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#guardarnuevo').click(function(){
          rol=$('#rol').val();
         agregardatos(rol);
        });

        $('#actualizadatos').click(function(){
          actualizaDatos();
        });

    });
</script>
    <script>
  $(function () {
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