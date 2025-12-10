<?php 
ob_start();
ini_set('default_charset', 'UTF8');
error_reporting(0);
require "../php/conexion.php";
require_once 'PHPExcel/Classes/PHPExcel.php';

$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:s:i");

?>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>    
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
    <script src="../plantilla/alertifyjs/alertify.js"></script>
   <link href="../plantilla/dist/img/icon.jpg" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
      <a class="navbar-brand" href="index.php">Activacíon de cuenta para poder ejercer tu voto</a>
    </nav>
    <div class="container">
    <div class="row">
      <div class="col">
      <form action="" method="post" enctype="multipart/form-data">
          <div class="card card-primary">
            <div class="card-header bg-primary text-white">
              <h3 class="card-title">Pregunta de seguridad</h3>
            </div>
         <div class="card-body">
            <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="">Pregunta de seguridad *</label>
                        <select name="pregunta" id="pregunta" class="form-control" required>
                        <option value="Tu color favorito">Tu color favorito</option>
                          <option value="Tu pelicula favorita">Tu pelicula favorita</option>
                          <option value="Nombre de tu Madre">Nombre de tu madre</option>
                          <option value="Nombre de tu Padre">Nombre de tu padre</option>
                        </select>
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="">Respuesta *</label>
                        <input type="text" name="respuesta" id="respuesta" class="form-control" required autocomplete="off">
                      </div>
                    </div>
                <div class="col" >
                    <div class="form-group">
              <label for="">Fecha de expedición de tu DUI *</label>
              <input type="date" name="fechaExpe" id="fechaExpe" class="form-control" required>
            </div>
                </div>
               
                  </div>
                   * Datos obligatorios
            </div>
            <div class="card-footer text-center">
              <button type="submit" class="btn btn-primary" onclick="location.href='../afiliaciones/index.php';" form="1" name="boton"><i class="fas fa-undo-alt"></i> Regresar</button>
				<button type="submit" class="btn btn-primary" name="pro"><i class="fas fa-user-shield"></i> Procesar</button>
            </div>
          </div>
          </div>
        </form>
      </div>
      <?php 
        if(isset($_POST["pro"]))
        {
          $id = base64_decode($_GET['id']);
          $fechaExpe = $_POST["fechaExpe"];
          $pregunta = mb_strtoupper($_POST["pregunta"]);
          $respuesta = mb_strtoupper($_POST["respuesta"]);
          $codigo = mb_strtoupper(substr(md5(time()), 0, 6));
        ?>
        
        <script>
            
        Swal.fire({
  title: 'Deseas guardar los cambios?',
  showDenyButton: true,
  showCancelButton: false, 
  confirmButtonText: `Actualizar`,
  denyButtonText: `No actualizar`,
}).then((result) => {
  /* Read more about isConfirmed, isDenied below */
  if (result.isConfirmed) {
     
        Swal.fire({
            icon: 'success',
          title: 'Se guardaron los cambios su codigo es: <?php echo $codigo;     $naaa = $con->consulta("UPDATE afiliados SET fechaExpe = '$fechaExpe', codigo = '$codigo', pregunta = '$pregunta',	respuesta = '$respuesta', horaIngreso = '$hora' , fechaIngreso = '$fecha', eliminado='0' WHERE id = '$id'"); ?>',
          confirmButtonText: `Aceptar`,

        })
        .then((result) => {
         if (result.isConfirmed) {    window.location = "index.php" }
        })

  } 
  else if (result.isDenied) {
    <?php $bussss = $con->consulta("SELECT codigo FROM afiliados WHERE id = '$id'  AND  pregunta = '$pregunta' AND respuesta = '$respuesta' AND fechaExpe = '$fechaExpe' ");
$a=$con->conteo($bussss);
    if ($a == 0) { ?>
       Swal.fire({
        icon: 'error',
        title: 'Sus datos no son correctos! ',
      confirmButtonText: `Aceptar`,

      }).then((result) => {
         if (result.isConfirmed) {    window.location = "index.php" }
      }) 
<?php } else { ?>

       
      
            Swal.fire({
        icon: 'success',
        title: 'Sus datos son corectos su codigo es: <?php echo $codigo; $n1 = $con->consulta("UPDATE afiliados SET codigo = '$codigo', horaIngreso = '$hora' , fechaIngreso = '$fecha' WHERE id = '$id'"); ?>',
  confirmButtonText: `Aceptar`,

}).then((result) => {
         if (result.isConfirmed) {    window.location = "index.php" }
        })
<?php } ?>      
  }
})
        </script>
        <?php
            
    //$bu = $con->consulta("SELECT codigo FROM afiliados WHERE id = '$id' AND fechaExpe = '$fechaExpe'");
// if ($con->conteo($bu) > 0) {
       // $bus = $con->arreglo($bu);
        //$codigo = mb_strtoupper(substr(md5(time()), 0, 6));
        //$n = $con->consulta("UPDATE afiliados SET codigo = '$codigo' WHERE id = '$id'");
        /*echo "
          <div class='alert alert-success text-center' role='alert'>
            Tu nuevo código de acceso es: <b> ".$codigo."</b>
          </div><br>
          <div class='text-center'>
          <a class='btn btn-primary' href='index.php'><i class='fas fa-undo-alt'></i> Regresar</a>
          </div>";*/
    //} else {
      /*  echo "
        <div class='row'>
          <div class='col'>
            <div class='alert alert-danger text-center' role='alert'>
              Error!, la fecha de expedición es incorrectos.<br>
              si no, ponerse en contacto con el administrador del sistema.
            </div>
          </div>
        </div>";*/
    //}
}
?>
    </div>
</body>
</html>
  <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
  <script src="../plantilla/bootstrap/popper.min.js"></script>
  <script src="../plantilla/bootstrap/bootstrap.min.js"></script>
</body>
</html> 