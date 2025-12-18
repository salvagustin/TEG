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
  <title>Registro</title>
  <link rel="stylesheet" href="../plantilla/bootstrap/bootstrap.min.css" >
  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
  <script src="../plantilla/alertifyjs/alertify.js"></script>
  <link href="../plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body>
    <nav id="navbar-example2" class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="index.php">Registros de votante</a>
    </nav>
    <div class="container">
      <form action="registro.php" id="form1" name="form1" method="POST" enctype="multipart/form-data">
        <div class="row">
          <div class="col">
            <div class="card border-primary">
              <div class="card-header bg-primary text-white">
                <h3 class="card-title">Registros de empleados</h3>
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
                          <input type="text" name="primerNombre" id="primerNombre" class="form-control text-uppercase" required>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="segundoNombre">Segundo nombre</label>
                          <input type="text" name="segundoNombre" id="segundoNombre" class="form-control text-uppercase" required>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="primerApellido">Primer apellido</label>
                          <input type="text" name="primerApellido" id="primerApellido" class="form-control text-uppercase" required>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="segundoApellido">Segundo apellido</label>
                          <input type="text" name="segundoApellido" id="segundoApellido" class="form-control text-uppercase" required>
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
                          <input type="text" name="dui" id="dui" class="form-control" placeholder="00000000-0" required data-inputmask='"mask": "99999999-9"' data-mask>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="fechaNac">Fecha de nacimiento</label>
                          <input type="date" name="fechaNac" id="fechaNac" class="form-control" required>
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="sexo">Sexo</label>
                          <select name="sexo" id="sexo" class="form-control" required>
                            <option value="">Seleccione...</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                          </select>
                        </div>
                      </div>
                    </div>
                                     
                  <hr class="bg-primary">
                  <div class="row">
                    <div class="col">
                      <h4 class="text-primary">C) Información exra</h4>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="">Nombre de la plaza</label>
                        <input type="text" name="cargo" id="cargo" class="form-control">
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="correo">Correo electrónico</label>
                        <input type="email" name="correo" id="correo" class="form-control" >
                      </div>
                    </div>

                  </div>
                  
                </div>
              <div class="card-footer text-center">
                <button type="submit" class="btn btn-primary" id="boton" name="boton">
                  <i class="fas fa-save"></i>
                  Procesar datos
                </button>

                <a href="../afiliaciones.php" class="btn btn-primary"><i class="fas fa-redo"></i> Cancelar </a>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>

    <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
    <script src="../plantilla/bootstrap/popper.min.js"></script>
    <script src="../plantilla/bootstrap/bootstrap.min.js"></script>
    <script src="../plantilla/bootstrap/jquery.min.js"></script>
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