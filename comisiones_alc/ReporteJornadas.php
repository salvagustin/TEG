<?php
ini_set('default_charset', 'UTF8');
require "seguro.php";
require "php/conexion.php";
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';
$con = new cnn();
?>
<!DOCTYPE html>
<html>

<head>
  <?php include "head.php"; ?>
</head>

<body class="hold-transition sidebar-mini">
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

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <a href="index.php" class="brand-link">
          <img src="plantilla/dist/img/ACELogoBlanco.png" width="230">


        </a>
        <div class="sidebar">
          <?php
          //$consulta = $con->consulta("SELECT foto FROM adm_usuarios WHERE adm_usuarios.id='$_SESSION[id]'");
          //$dato = $con->arreglo($consulta);
          ?>
          <div class="user-panel mt-3 pb-3 mb-3 d-flex">

            <div class="info">
              <a class="d-block"><?php echo $_SESSION["nom"]; ?></a>
              <a class="d-block"><?php echo $_SESSION["rol"]; ?></a>
            </div>
          </div>

          <nav class="mt-2">
            <?php include "menu.php"; ?>
          </nav>
        </div>
      </aside>
    </aside>

    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>
                Reportes
              </h1>
            </div>
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="index.php">Inicio</a></li>
                <li class="breadcrumb-item active">Reportes</li>
              </ol>
            </div>
          </div>
        </div>
      </section>
      <section class="content">
        <div class="container-fluid">
          <div class="row">

            <div class="col">
              <form id="inventario" name="inventario" method="post" action="jornadas/repoJornada.php" target="_blank">
                <div class="card card-primary card-outline">
                  <div class="card-header">
                    <h3 class="card-title">Generar reportes </h3>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <div class="form-group">
                            <label for="">Desde</label>
                            <input name="Desde" type="date" id="Desde" class="form-control" form="inventario">
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <div class="form-group">
                            <label for="">Hasta</label>
                            <input name="Hasta" type="date" id="Hasta" class="form-control" form="inventario">
                          </div>
                        </div>
                      </div>
                    </div>

                    <?php if ($_SESSION["rol"] == "Super") { ?>
                      <div class="row">
                        <div class="col">
                          <div class="form-group">
                            <label for="">Departamento</label>
                            <select name="depto" id="depto" class="form-control select2">
                              <option value="Depat">Todos los Departamentos</option>
                              <?php $de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
                              while ($depto = $con->arreglo($de)) { ?>
                                <option value="<?php echo $depto["id_depto"]; ?>"><?php echo $depto["depto"]; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>
                        <div class="col">
                          <div class="form-group">
                            <label for="">municipio</label>
                            <select name="muni" id="muni" class="form-control select2 "></select>
                          </div>
                        </div>
                      </div>
                    <?php } ?>

                  </div>

                  <div class="card-footer text-center">
                    <button type="submit" name="boton1" id="boton1" class="btn btn-primary" form="inventario" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-download"></i> Generar reporte</button>
                  </div>
                </div>
              </form>
            </div>

          </div>


        </div>
      </section>

    </div>
    <footer class="main-footer text-justify">
      <?php include "pie.php"; ?>
    </footer>
  </div>
  <?php include "footer.php"; ?>
  <script type="text/javascript">
    $(function() {
      //Initialize Select2 Elements
      $('.select2').select2()
      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      })
    })
  </script>
  <script type="text/javascript">
    $(document).ready(function() {
      $('#depto').val(0);
      recargardeptoExpe();
      $('#depto').change(function() {
        recargardeptoExpe();
      });
    })

    function recargardeptoExpe() {
      $.ajax({
        type: "POST",
        url: "muni.php",
        data: "continente=" + $('#depto').val(),
        success: function(r) {
          $('#muni').html(r);
        }
      });
    }
  </script>
</body>

</html>