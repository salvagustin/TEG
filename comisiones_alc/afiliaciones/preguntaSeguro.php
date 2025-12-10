<?php
ob_start();
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

 $id = base64_decode($_GET['id']);

$ids=  base64_encode($id);

  $da = $con->consulta("SELECT primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, pregunta FROM afiliados WHERE id = '$id' ");
  $dato = $con->arreglo($da);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>
    <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
    <script src="../plantilla/alertifyjs/alertify.js"></script>
</head>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Registros de Afiliados CEG</a>
    </nav>


    <div class="container">
      <div class="row">
    <div class="col">
      <form action="" id="form1" name="form1" method="POST" enctype="multipart/form-data">
        <div class="card border-primary">
          <div class="card-header bg-primary text-white">
            <h4 class="card-title">Verificacion de datos de seguridad</h4>
          </div>
          <div class="card-body">
            <div class="form-group text-center">
              <p>Bienvenido <b><?php echo $dato["primerNombre"] . " " . $dato["segundoNombre"] . " " . $dato["primerApellido"] . " " . $dato["segundoApellido"] . " " . $dato["apellidoCasada"];?></b></p>
              <p>Completa la siguiente información para validar tu identidad</p>
            </div>
            <div class="form-group">
              <label for="">Fecha de Expedición de tu DUI</label>
              <input type="date" name="fechaExpe" id="fechaExpe" class="form-control" required>
            </div>
            <div class="form-group">
              <label for="">Respuesta a <?php echo $dato["pregunta"]; ?></label>
              <input type="text" name="respuesta" id="respuesta" class="form-control" autocomplete="off" required>            
            </div>
          </div>
          <div class="card-footer text-center">
            <button type="submit" class="btn btn-primary" name="boton" id="boton"><i class="fas fa-undo-alt"></i> Verificar</button>
          </div>
        </div>
      </form>
    </div>
  </div>
    </div>
	  <?php
if (isset($_POST["boton"])) {
    $fechaExpe = $_POST["fechaExpe"];
    $respuesta = mb_strtoupper($_POST["respuesta"]);

    $bu = $con->consulta("SELECT codigo FROM afiliados WHERE id = '$id' AND fechaExpe = '$fechaExpe' AND respuesta = '$respuesta'");

    if ($con->conteo($bu) > 0) {

     /*  echo "

          <div class='alert alert-success text-center' role='alert'>
            Este numero de DUI ya esta afiliado 
			      <div class='card-footer text-center'>
              <a class='btn btn-primary' href='index.php'><i class='fas fa-undo-alt'></i> Regresar</a>
            </div>
          </div>"; */

     echo "<script> 
            window.location.href='ActualizacionDatos.php?id=$ids';
             </script>"; 
    } else {
        echo "
        <div class='row'>
          <div class='col'>
            <div class='alert alert-danger text-center' role='alert'>
              Error!, la fecha de expedición o las respuestas son incorrectas.<br>
              si no, ponerse en contacto con el administrador del sistema.
            </div>
          </div>
        </div>
        "; 
       
    }
}
?>
</body>
</html>
  <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js" ></script>
  <script src="../plantilla/bootstrap/popper.min.js"></script>
  <script src="../plantilla/bootstrap/bootstrap.min.js"></script>
</body>
</html>
<?php
ob_end_flush();