<?php 
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

// 1. Obtener ID
$id = base64_decode($_GET['id']);

// 2. Procesar la actualización si se presiona el botón
if (isset($_POST["boton"])) {
    $primerNombre    = mb_strtoupper($_POST["primerNombre"]);
    $segundoNombre   = mb_strtoupper($_POST["segundoNombre"]);
    $primerApellido  = mb_strtoupper($_POST["primerApellido"]);
    $segundoApellido = mb_strtoupper($_POST["segundoApellido"]);
    $sexo            = mb_strtoupper($_POST["sexo"]);
    $dui             = $_POST["dui"];
    $fechaNac        = $_POST["fechaNac"];
    $cargo           = mb_strtoupper($_POST["cargo"]);
    $correo          = mb_strtoupper($_POST["correo"]);

    // QUERY DE ACTUALIZACIÓN
    $actualizar = $con->consulta("UPDATE afiliados SET 
        primerNombre = '$primerNombre', 
        segundoNombre = '$segundoNombre', 
        primerApellido = '$primerApellido', 
        segundoApellido = '$segundoApellido', 
        sexo = '$sexo',
        dui = '$dui', 
        fechaNac = '$fechaNac', 
        cargo = '$cargo', 
        correo = '$correo'
        WHERE id = '$id'");

    if($actualizar) {
        echo "<div class='alert alert-success text-center'>¡Datos actualizados correctamente! 
              <br><a href='../afiliaciones.php' class='btn btn-primary'>Regresar</a></div>";
    } else {
        echo "<div class='alert alert-danger'>Error al actualizar datos.</div>";
    }
}

// 3. Consultar datos para llenar los inputs (esto ya lo tienes)
$busque = $con->consulta("SELECT * FROM afiliados WHERE id = '$id'");
$datos = $con->arreglo($busque);
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
        <a class="navbar-brand" href="index.php">Actualización de los datos del afiliado</a>
    </nav>
    <?php 
      $busque = $con->consulta("SELECT * FROM afiliados WHERE id = '$id' AND eliminado = 0");
      $datos = $con->arreglo($busque);
    ?>

    <div class="container">
      <form action="" id="form1" name="form1" method="POST" enctype="multipart/form-data">
        <div class="row">
          <div class="col">
            <div class="card border-primary">
              <div class="card-header bg-primary text-white">
                <h3 class="card-title">Actualización de los datos del afiliado</h3>
                   <h3 class="card-title text-right">Afiliación N°: <?php echo $datos["id"]; ?></h3>
              </div>

              <div class="card-body">
                    <div class="row">
                      <div class="col">
                        <h4 class="text-primary">A) Datos personales</h4>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="primerNombre">Primer nombre</label>
                          <input type="text" name="primerNombre" value="<?php echo  $datos["primerNombre"]; ?>" id="primerNombre" class="form-control text-uppercase">
                        </div>

                      </div>

                      <div class="col">
                        <div class="form-group">
                          <label for="segundoNombre">Segundo nombre</label>
                          <input type="text" name="segundoNombre" value="<?php echo  $datos["segundoNombre"]; ?>" id="segundoNombre" class="form-control text-uppercase">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="primerApellido">Primer apellido</label>
                          <input type="text" name="primerApellido" id="primerApellido" value="<?php echo  $datos["primerApellido"]; ?>" class="form-control text-uppercase" required>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="segundoApellido">Segundo apellido</label>
                          <input type="text" name="segundoApellido" id="segundoApellido" value="<?php echo  $datos["segundoApellido"]; ?>" class="form-control text-uppercase">
                        </div>
                      </div>
                    </div>                    
                    <hr class="bg-primary">
                    <div class="row">
                      <div class="col">
                        <h4 class="text-primary">B) Datos según DUI</h4>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="dui">Numero de DUI</label>
                          <input type="text" name="dui" value="<?php echo  $datos["dui"]; ?>" id="dui" class="form-control" placeholder="00000000-0" data-inputmask='"mask": "99999999-9"' data-mask >
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="fechaNac">Fecha de nacimiento</label>
                          <input type="date" name="fechaNac" value="<?php echo  $datos["fechaNac"]; ?>" id="fechaNac" class="form-control">
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="sexo">Sexo</label>
                          <select name="sexo" id="sexo" class="form-control">
                            <option value="">Seleccione...</option>
                            <option value="M" <?php if($datos["sexo"] == "M") echo "selected"; ?>>Masculino</option>
                            <option value="F" <?php if($datos["sexo"] == "F") echo "selected"; ?>>Femenino</option>
                          </select>
                          </div>
                      </div>
                    </div>
                
                  <hr class="bg-primary">
                  <div class="row">
                    <div class="col">
                      <h4 class="text-primary">E) Información del cargo</h4>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="">Cargo según planilla</label>
                        <input type="text" name="cargo" id="cargo" value="<?php echo  $datos["cargo"]; ?>" class="form-control">
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" name="correo" id="correo" value="<?php echo  $datos["correo"]; ?>" class="form-control" >
                      </div>
                    </div>
                  </div>
                
                </div>
              <div class="card-footer text-center">
                <button type="submit" class="btn btn-primary" id="boton" name="boton">
                  <i class="fas fa-save"></i>
                  Actualizar
                </button>
                <a href="../afiliaciones.php" class="btn btn-secondary">
                  <i class="fas fa-redo"></i>
                  Cancelar
                </a>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
    <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
  <script src="../plantilla/bootstrap/popper.min.js"></script>
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