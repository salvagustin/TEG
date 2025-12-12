<?php

ini_set('default_charset', 'UTF8');
require "seguro.php";
require "php/conexion.php";
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';
$con = new cnn();

$id = base64_decode($_GET['id']);
$fecha=date("Y-m-d");

$ca = $con->consulta("SELECT *, jornadas.periodoDesde, jornadas.periodoHasta FROM candidatos INNER JOIN jornadas ON candidatos.id_jornada = jornadas.id_jornada WHERE id_candidato = '$id'");
$dato = $con->arreglo($ca);

if (isset($_POST["boton"]))
{
	$edad      = $_POST['edad'];
  $candidato = $_POST['candidato'];
  $foto      = $_FILES['foto']['name'];
  $profesion = $_POST['profesion'];
  $domicilio = $_POST['domicilio'];
  $ruta      = "candidatos/fotos/";

  if($_SESSION["rol"] == "Super")
  {
    $depto = $_POST["depto"];
    $muni = $_POST["muni"];

    if (empty($foto)) 
    {
      $sql = $con->consulta("UPDATE candidatos SET id_afiliado = '$candidato', edad = '$edad', domicilio = '$domicilio', profesion = '$profesion',  WHERE  id_candidato = '$id'");
    } 
    else 
    {
      $sql = $con->consulta(" UPDATE candidatos SET id_afiliado = '$candidato', edad = '$edad', domicilio = '$domicilio', profesion = '$profesion',  foto = '$foto' WHERE id_candidato = '$id'");
      move_uploaded_file($_FILES['foto']['tmp_name'], $ruta . $_FILES['foto']['name']);
    }
  }
  else
  {
    if (empty($foto)) 
    {
      $sql = $con->consulta("UPDATE candidatos SET id_afiliado = '$candidato', edad = '$edad', domicilio = '$domicilio', profesion = '$profesion' WHERE  id_candidato = '$id'");
    } 
    else 
    {
      $sql = $con->consulta(" UPDATE candidatos SET id_afiliado = '$candidato', edad = '$edad', domicilio = '$domicilio', profesion = '$profesion' foto = '$foto' WHERE id_candidato = '$id'");
      move_uploaded_file($_FILES['foto']['tmp_name'], $ruta . $_FILES['foto']['name']);
    }
  }
  $accion = "Actualizo datos de un Nuevo Candidato";
  $lugar = "candidatos";
  $consultas = $con->consulta("INSERT INTO historial VALUES (NULL, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$id', 'Activo')");
  header("Location: candidatos.php");

} 
else 
{
?>
  <!DOCTYPE html>
  <html>
  <head>
    <?php include "head.php"; ?>
    <script type="text/javascript">
      function validar()
      { 
        var o = document.getElementById('foto');
        var filePath = o.value;
        var foto = o.files[0];
        var c =0;
        if (o.files.length == 0 || !(/\.(jpg|png)$/i).test(foto.name)) 
        {
          c = 1;   
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
              c = 1;
              alert('Las medidas deben ser: 400 x 400 pixeles');
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
        <?php include "aside.php"; ?>
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
                    <form   action="" method="post" enctype="multipart/form-data" id="form1" name="form1">
                      <div class="card card-primary card-outline" style="border-top: 3px solid #131d2e;">
                        <div class="card-header bg-primary">
                          <h3 class="card-title">Actualizando los datos del candidato</h3>
                        </div>
                        <div class="card-body">
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label for="">Candidato *</label>
                                <select name="candidato" id="candidato" class="form-control select2">
                                  <?php
                                    $can = $con->consulta("SELECT id, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui FROM afiliados WHERE eliminado <> 1 ORDER BY primerNombre ASC, segundoNombre ASC, primerApellido ASC");
                                    while ($candi = $con->arreglo($can)) 
                                    {
                                  ?>
                                    <option value="<?php echo $candi["id"]; ?>" <?php if ($dato["id_afiliado"] == $candi["id"]) { ?> selected = "selected" <?php } ?>  ><?php echo $candi["dui"]; ?> -- <?php echo $candi["primerNombre"]; ?> <?php echo $candi["segundoNombre"]; ?> <?php echo $candi["primerApellido"]; ?> <?php echo $candi["segundoApellido"]; ?></option>
                                  <?php
                                    }
                                  ?>
                                </select>
                              </div>
                            </div>
                            <div class="col-2">
                              <div class="form-group">
                                <label for="">Edad</label>
                                  <input type="text" class="form-control" id="edad" name="edad" value="<?php echo $dato["edad"]; ?>" placeholder="A00">
                              </div>
                            </div>
                            <div class="col-3">
                              <div class="form-group">
                                <label for="">Jornada electoral</label>
                                <p><?php echo date('m/Y', strtotime($dato["periodoDesde"])); ?> al <?php echo date('m/Y', strtotime($dato["periodoHasta"])); ?></p>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="custom-file">
                                <input type="file" class="form-control" id="foto" name="foto" onchange="return validar()">
                                <label class="" for="foto">Fotografia (Con una resolucion de 400x400 pixeles)</label>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col text-center">
                              <div class="form-group">
                                <label for="">Foto actual</label><br>
                                <img src="candidatos/fotos/<?php echo $dato["foto"]; ?>" alt="" widght="55" height="66" >
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <div class="form-group">
                                <label for="">Domicilio</label>
                                <input type="text" name="domicilio" id="domicilio" class="form-control" placeholder="Domicilio del candidato" value="<?php echo $dato["domicilio"]; ?>">
                              </div>
                            </div>
                            <div class="col">
                              <div class="form group">
                                <label for="">Profesión u oficio </label>
                                <input type="text" name="profesion" id="profesion" class="form-control" placeholder="Profesión del candidato" value="<?php echo $dato["profesion"]; ?>">
                              </div>
                            </div>
                            
                          </div>
                          
                           
                        </div>
                        * Datos obligatorios
                        <div class="card-footer text-center">
                          <button type="submit" class="btn btn-primary" id="boton" name="boton" style="background-color:#131d2e; border-color: #131d2e; "><i class="far fa-save"></i> Actualizar datos</button>
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
    <?php include "footer.php"; ?>
    <script type="text/javascript">
      $(function() 
      {
        //Initialize Select2 Elements
        $('.select2').select2()
        //Initialize Select2 Elements
        $('.select2bs4').select2(
        {
          theme: 'bootstrap4'
        })
      })
    </script>
  </body>
  </html>
<?php
}