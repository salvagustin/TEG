<?php
ob_start();
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

$jornada = $_POST["jornada"];
$voto = $_POST["voto"];
$afiliado = $_SESSION["id"];
$votos = 1;
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
  <script src="../plantilla/alertifyjs/alertify.js"></script>
  <link href="../plantilla/dist/img/icon.jpg" rel="shortcut icon" type="image/vnd.microsoft.icon">
  <title>verificar</title>
</head>
<body>
  <div class="row">
    <div class="col">
      <form action="" id="form1" name="form1" method="POST" enctype="multipart/form-data">
        <div class="card border-primary">
          <div class="card-header bg-primary text-white">
            <h4 class="card-title">¿Esta seguo/a?</h4>
          </div>
          <div class="card-body">
            <div class="form-group">
              <label for=""><h3>¿Estas seguro de finalizr tu votacion? </h3></label>
           
            </div>
          </div>
          <div class="card-footer text-center">
            <button type="submit" class="btn btn-block btn-danger" name="boton" id="boton"></i> Si</button>
            <button type="submit" class="btn btn-block btn-danger" name="boton" id="boton"></i> No</button>
          </div>
         >
        </div>
      </form>
    </div>
  </div>
  <br>
 
  <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
  <script src="../plantilla/bootstrap/popper.min.js"></script>
  <script src="../plantilla/bootstrap/bootstrap.min.js"></script>
</body>
</html>
<?php
ob_end_flush();