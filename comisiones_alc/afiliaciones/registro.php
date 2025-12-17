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
    <title>Votaciones ACE</title>
    <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
    <script src="../plantilla/alertifyjs/alertify.js"></script>
    <link href="../plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Registros de votante</a>
    </nav>

    <?php 

    if (isset($_POST["boton"])) 
    {
        $primerNombre       = mb_strtoupper($_POST["primerNombre"]);
        $segundoNombre      = mb_strtoupper($_POST["segundoNombre"]);
        $primerApellido     = mb_strtoupper($_POST["primerApellido"]);
        $segundoApellido    = mb_strtoupper($_POST["segundoApellido"]);
        $dui                = $_POST["dui"];
        $fechaNac           = $_POST["fechaNac"];
        $cargo              = mb_strtoupper($_POST["cargo"]);
        $correo             = mb_strtoupper($_POST["correo"]);
        $codigo             = mb_strtoupper(substr(md5(time()), 0, 6));
        

       

        $bus = $con->consulta("SELECT id FROM afiliados WHERE dui = '$dui'");
        $bus=$con->conteo($bus);
  
        if($bus==0) 
        {
        // Código CORREGIDO (23 valores, especificando las 23 columnas de la tabla visible)
        $insert = $con->consulta("INSERT INTO afiliados (id, primerNombre, segundoNombre, primerApellido, segundoApellido,  dui, fechaNac, cargo, correo,  codigo, eliminado) 
                                            VALUES(NULL,'$primerNombre', '$segundoNombre', '$primerApellido', '$segundoApellido', '$dui', '$fechaNac',  '$cargo',  '$correo',  '$codigo',  0)");  
        }
      }
    ?>
    <div class="container">
      <form <?php if($bus<>0){  ?> action="index.php" <?php } else { ?>  action="registro.php" <?php } ?> id="form1" name="form1" method="POST" enctype="multipart/form-data">
        <div class="row">
          <div class="col">
            <div class="card border-primary">
              <div class="card-header bg-primary text-white">
                <h3 class="card-title">Registro de votante</h3>
              </div>
                <?php if($bus==0){ ?>
              <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <h4 class="text-primary">Su código de acceso para la votación es : </h4>
                      </div>
                    </div>
                     <h3 class="text-center"><?php echo $codigo; ?></h3>
                  
                </div>
                          <div class="card-footer text-center">
                          <a href="../afiliaciones.php" class="btn btn-primary"><i class="fas fa-redo"></i> Volver al inicio </a>
              </div>
                <?php } else {?>
                              <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <h4 class="text-primary">El empleado ya esta registrado : </h4>
                      </div>
                    </div>
                     <h3 class="text-center"><?php echo $primerNombre." ".$segundoNombre." ".$primerApellido." ".$segundoApellido;  ?></h3>
                  
                </div>
                          <div class="card-footer text-center">
                <a href="../afiliaciones.php" class="btn btn-primary"><i class="fas fa-redo"></i> Volver al inicio </a>
              </div>
                <?php } ?>
    
            </div>
          </div>
        </div>
      </form>
    </div>
</body>
</html>