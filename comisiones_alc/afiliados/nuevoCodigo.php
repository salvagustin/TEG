<?php
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
require "../seguro.php";

$con = new cnn();
$fecha = date("Y-m-d");

 $id = $_GET['id'];

$codigo = mb_strtoupper(substr(md5(time()), 0, 6));

$sql = $con->consulta("UPDATE afiliados SET codigo =  '$codigo' WHERE id = '$id'");

$detalle = "Restablecio el codigo de seguridad del afiliado";
$lugar = "afiliados";

$histo = $con->consulta("INSERT INTO historial VALUES(NULL, '$_SESSION[id]', '$fecha', '$detalle', '$lugar', '$id', 'Activo')");
?>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme style -->
<link rel="stylesheet" href="../plantilla/dist/css/adminlte.css">
</head>
<body>
  <div class="row">
    <div class="col">
      <div class="card card-primary card-outline">
        <div class="card-header bg-primary">
          <h3 class="card-title">Nuevo de codigo de acceso</h3>
      <button type="button" class="close" onclick="  window.close(); " data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
        </div>
        <div class="card-body text-center ">
          <h1 class="text-center primay">
           <?php echo $codigo; ?>
          </h1>
          <br>
          <br>
          <button class="btn btn-primary" onclick="self.close();">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
  <?php include "../footer.php"; ?>
</body>
</html>