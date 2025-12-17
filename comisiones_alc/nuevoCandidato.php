<?php
ini_set('default_charset', 'UTF8');
require("seguro.php");
require("php/conexion.php");
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';
$con = new cnn();
$fecha = date("Y-m-d");

if($_SESSION["rol"] == "Administrador")
{
  $can = $con->consulta("SELECT id, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui FROM afiliados  WHERE eliminado <> 1 ORDER BY primerNombre ASC, segundoNombre ASC, primerApellido ASC");
}
else
{
  $can = $con->consulta("SELECT id, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui FROM afiliados  WHERE eliminado <> 1 ORDER BY primerNombre ASC, segundoNombre ASC, primerApellido ASC");
}


$pe = $con->consulta("SELECT periodoDesde, periodoHasta, id_jornada FROM jornadas WHERE estado = 'Activo' ");

?>
<!DOCTYPE html>
<html>
<head>
  <?php include("head.php"); ?>
  <script type="text/javascript">
function validar()
{ 
  var o = document.getElementById('foto');
  var filePath = o.value;
  var foto = o.files[0];
  var c =0;
    if (o.files.length==0 || !(/\.(jpg|png)$/i).test(foto.name)) 
    {
      c=1;   
      alert('Ingrese una imagen con alguno de los siguientes formatos: .jpeg/.jpg/.png.');
      o.value = '';
    }
    else 
    {
      var img = new Image();
      img.onload = function dimension() 
      {
        if (this.width.toFixed(0) != 400 && this.height.toFixed(0) != 400) 
        {
          c=1;
          alert('Las medidas deben ser: 400 x 401 pixeles');
          //alert(c);
          o.value = '';
        }
      };
      img.src = URL.createObjectURL(foto);
    }                 
    if(c === 1)
    {    
      return false;    
    }
    else
    {
      return true;
    }
}
</script>
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
      <?php include("aside.php"); ?>
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">Candidatos</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
                <li class="breadcrumb-item active">Candidatos</li>
              </ol>
            </div><!-- /.col -->
            <div class="container">
              <div class="row">
                <div class="col">
                  <form action="candidatos/agregarDatos.php" method="post" enctype="multipart/form-data" id="form1" name="form1">
                    <div class="card card-primary card-outline" style="border-top: 3px solid #131d2e;">
                      <div class="card-header bg-primary">
                        <h3 class="card-title">Nuevo candidato  </h3>
                      </div>
                      <div class="card-body">
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label for="">Candidato *</label>
                              <select name="candidato" id="candidato" class="form-control select2" required>
                                <option value="">Seleccione...</option>
                                <?php
                                  while ($candi = $con->arreglo($can)) 
                                  {
                                ?>
                                  <option value="<?php echo $candi["id"]; ?>"><?php echo $candi["dui"]; ?> -- <?php echo $candi["primerNombre"]; ?> <?php echo $candi["segundoNombre"]; ?> <?php echo $candi["primerApellido"]; ?> <?php echo $candi["segundoApellido"]; ?></option>
                                <?php
                                  }
                                ?>
                              </select>
                            </div>
                          </div>
                          
                          <div class="col-3">
                            <div class="form-group">
                              <label for="">Jornada electoral *</label>
                              <select name="periodo" id="periodo" class="form-control select2" required>
                                <option value="">Seleccione</option>
                                <?php while ($peri = $con->arreglo($pe)) { ?>
                                  <option value="<?php echo $peri["id_jornada"]; ?>"><?php echo date('d/m/Y', strtotime($peri["periodoDesde"])); ?> al <?php echo date('d/m/Y', strtotime($peri["periodoHasta"])); ?></option>
                                <?php } ?>
                              </select>
                            </div>
                          </div>
                        </div>
                        <hr>
                        <div class="row">
                          <div class="col">
                            <div class="custom-file">
                              <input type="file" class="form-control" id="foto" name="foto" onchange="return validar()" required>
                              <label class="" for="foto">Fotografia (Con una resolucion de 400x400 pixeles)</label>
                            </div>
                          </div>
                        </div>
                        <hr>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label for="">Domicilio</label>
                              <input type="text" name="domicilio" id="domicilio" class="form-control" placeholder="Domicilio del candidato">
                            </div>
                          </div>
                          <div class="col">
                            <div class="form group">
                              <label for="">Profesión u oficio </label>
                              <input type="text" name="profesion" id="profesion" class="form-control" placeholder="Profesión del candidato">
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      *Datos Obligatorios
                      <div class="card-footer text-center">
                        <button type="submit" class="btn btn-primary" id="boton" name="boton" style="background-color:#131d2e; border-color: #131d2e; "><i class="far fa-save"></i> Registrar candidato</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer text-justify">
      <?php include "pie.php"; ?>
    </footer>
  </div>
  <!-- ./wrapper -->
  <!-- jQuery -->
  <?php include("footer.php"); ?>
  

</body>

</html>