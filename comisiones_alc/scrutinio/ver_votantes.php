<?php
ob_start();
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

 $id = base64_decode($_GET['id']);

$ids=  base64_encode($id);


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Votos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
    <script src="../plantilla/alertifyjs/alertify.js"></script>
</head>
<?php  $candi = $con->consulta("SELECT	afiliados.primerNombre, 	afiliados.segundoNombre, 	afiliados.primerApellido, 	afiliados.segundoApellido, 	afiliados.apellidoCasada FROM	candidatos	INNER JOIN	afiliados	ON 	candidatos.id_afiliado = afiliados.id
WHERE	candidatos.eliminado = 0 AND	candidatos.id_candidato =  '$_GET[id]'"); 
$ca = $con->arreglo($candi);

?>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Afiliados que votaron por: <?php echo $ca["primerNombre"]; ?> <?php echo $ca["segundoNombre"]; ?> <?php echo $ca["primerApellido"]; ?> <?php echo $ca["segundoApellido"]; ?> <?php echo $ca["apellidoCasada"]; ?> <?php ?></a>
    </nav>


    <div class="container">
      <div class="row">
    <div class="col">
    <table id="candidatos" class="table table-bordered table-striped">
      <thead>
        <tr>
        <th>#</th>
          <th>DUI</th>
          <th>Nombre completo</th>
        </tr>
      </thead>
      <tbody>
        <?php
        $i=0;
        $sql = $con->consulta("SELECT afiliados.afiliacion, afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.dui FROM afiliados INNER JOIN votacion  ON  afiliados.id = votacion.id_afiliado WHERE afiliados.eliminado = 0 AND votacion.id_candidato = '$_GET[id]' AND votacion.voto = 1");
        while ($ver = $con->arreglo($sql)) {
         $i++; 
        ?>
          <tr>
            <td><?php echo $i; ?></td>
            <td>     <?php echo $ver["dui"]; ?> </td>
            <td><?php echo $ver["primerNombre"]; ?> <?php echo $ver["segundoNombre"]; ?> <?php echo $ver["primerApellido"]; ?> <?php echo $ver["segundoApellido"]; ?> <?php echo $ver["apellidoCasada"]; ?></td>
          </tr>
        <?php } ?>
      </tbody>
    </table>
    </div>
  </div>
    </div>
</body>
</html>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
<?php
ob_end_flush();