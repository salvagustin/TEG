<?php 
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:s:i");

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
    <link href="../plantilla/dist/img/icon.jpg" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Activacíon de cuenta para poder ejercer tu voto</a>
    </nav>

    <?php 


    if(isset($_POST["boton"]))

    {
      $dui = $_POST["dui"];
      $bu = $con->consulta("SELECT id FROM afiliados WHERE dui = '$dui' AND eliminado <> 1 ");


      if($con->conteo($bu) > 0)

      {

        $bus = $con->arreglo($bu);
 $id= base64_encode($bus['id']);
        echo "<script> 

          window.location.href='validarAfi.php?id=$id';

        </script>";

      }

      else

      {

        echo "

        <div class='row'>

          <div class='col'>

            <div class='alert alert-danger' role='alert'>

              Este numero de Dui no se encuentra afiliado.

            </div>

          </div>

        </div>

        ";

      }

    }

    ?>
    <div class="container">
      <div class="row">
        <div class="col-3"></div>
        <div class="col">
          <form action="" id="form1" name="form1" method="POST" enctype="multipart/form-data">
            <div class="card border-primary">
              <div class="card-header bg-primary text-white">
                <h4 class="card-title">Verificación de afiliados</h4>
              </div>
              <div class="card-body">
                <div class="form-group">
                  <label for="">DUI</label>
                  <input type="text" name="dui" id="dui" class="form-control" placeholder="00000000-0" autocomplete="off" data-inputmask='"mask": "99999999-9"' data-mask required>* Datos obligatorios
                </div>
              </div>
              <div class="card-footer text-center">
                <button type="submit" class="btn btn-primary" name="boton" id="boton"><i class="fas fa-search"></i> Buscar</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-3"></div> 
      </div>
    </div>
    <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js" ></script>
    <script src="../plantilla/bootstrap/popper.min.js" ></script>
    <script src="../plantilla/plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
    <script>
  $(function () {
    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()
    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });
  })
</script>
</body>
</html>