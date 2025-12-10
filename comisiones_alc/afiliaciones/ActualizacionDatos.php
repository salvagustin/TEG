<?php 
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$con = new cnn();

$fecha = date("Y-m-d");
$hora = date("H:s:i");

 $id = base64_decode($_GET['id']);

  if (isset($_POST["boton"])) 
  {

    $primerNombre       = mb_strtoupper($_POST["primerNombre"]);
    $segundoNombre      = mb_strtoupper($_POST["segundoNombre"]);
    $primerApellido     = mb_strtoupper($_POST["primerApellido"]);
    $segundoApellido    = mb_strtoupper($_POST["segundoApellido"]);
    $apellidoCasada     = mb_strtoupper($_POST["apellidoCasada"]);
    $sexo               = mb_strtoupper($_POST["sexo"]);
    $dui                = $_POST["dui"];
    $nit                = $_POST["nit"];
    $fechaNac           = $_POST["fechaNac"];
    $deptoExpe          = mb_strtoupper($_POST["deptoExpe"]);
     $muniExpe           = mb_strtoupper($_POST["muniExpe"]);
    $fechaExpe          = mb_strtoupper($_POST["fechaExpe"]);
    $depto              = mb_strtoupper($_POST["depto"]);
    $muni               = mb_strtoupper($_POST["muni"]);
    $direccion          = mb_strtoupper($_POST["direccion"]);
    $telefonoResi       = $_POST["telefonoResi"];
    $celularResi        = $_POST["celularResi"];
    $trabajoResi        = $_POST["trabajoResi"];
    $cargo              = mb_strtoupper($_POST["cargo"]);
	 $pregunta           = mb_strtoupper($_POST["pregunta"]);
    $respuesta          = mb_strtoupper($_POST["respuesta"]);
    $depto2              = mb_strtoupper($_POST["depto2"]);
    $muni2               = mb_strtoupper($_POST["muni"]);
	 
    $sql = $con->consulta("UPDATE afiliados SET fechaExpe = '$fechaExpe', pregunta = '$pregunta', respuesta = '$respuesta' WHERE id = '$id'");
 

	echo "<div class='alert alert-success text-center' role='alert'> Sr/a <b> ".$primerNombre." ".$segundoNombre." ".$primerApellido." ".$segundoApellido."</b>, registro encontrado <div class='card-footer text-center'><a class='btn btn-primary' href='index.php'><i class='fas fa-undo-alt'></i> Regresar</a></div></div>"; 
  }

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
        <a class="navbar-brand" href="index.php">Actualización de los datos del afiliados CEG</a>
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
                   <h3 class="card-title text-right">Afiliación N°: <?php echo $datos["afiliacion"]; ?></h3>
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
                    <div class="row">
                      <div class="col-8">
                        <div class="form-group">
                          <label for="apellidoCasada">Apellido de casada</label>
                          <input type="text" value="<?php echo  $datos["segundoApellido"]; ?>" name="apellidoCasada" id="apellidoCasada" class="form-control text-uppercase">
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="sexo">Sexo</label>
                          <select class="custom-select" id="sexo"  name="sexo">
                            <option value=""></option>
                            <option value="FEMENINO" <?php if($datos["sexo"]=="FEMENINO"){echo "selected='selected'";} ?>>FEMENINO</option>
                            <option value="MASCULINO" <?php if($datos["sexo"]=="MASCULINO"){echo "selected='selected'";} ?> >MASCULINO</option>
                          </select>
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
                          <label for="dui">Numero de NIT</label>
                          <input type="text" name="nit" value="<?php echo  $datos["nit"]; ?>" id="nit" class="form-control" placeholder="0000-000000-0000-0" data-inputmask='"mask": "9999-999999-999-9"' data-mask >
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="fechaNac">Fecha de nacimiento</label>
                          <input type="date" name="fechaNac" value="<?php echo  $datos["fechaNac"]; ?>" id="fechaNac" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <p>Lugar y fecha de expedición</p>
                      </div>
                    </div>
                    <div class="row"> 
                       <div class="col">
                       <div class="form-group">
             			      <label for="depto">Departamento</label>
									        <select name="deptoExpe" id="deptoExpe" class="form-control select2">
							        <?php $de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
                                 while ($depto = $con->arreglo($de)) {       ?>
                        <option value="<?php echo $depto["id_depto"]; ?>" <?php if ($datos["deptoExpe"] == $depto["id_depto"]) {   echo "selected"; } ?>>  <?php echo $depto["depto"]; ?></option>
										                <?php }?>
                	          </select>
			          				 </div>
			            			</div>

                       <div class="col">
                       <div class="form-group">
                      <label for="">Municipio</label>
                   <select name="muniExpe" id="muniExpe" class="form-control select2">
                   <?php $mu = $con->consulta("SELECT * FROM municipios WHERE eliminado = 0");
                    while ($muni = $con->arreglo($mu)) {     ?>
                  <option value="<?php echo $muni["id_muni"]; ?>" <?php if ($datos["muniExpe"] == $muni["id_muni"]) {    echo "selected";    }   ?> ><?php echo $muni["municipio"]; ?></option>
                  <?php } ?>
                    </select>
                     </div>
                      </div>
                  <div class="col">
                        <div class="form-group">
                          <label for="">Fecha expedición</label>
                          <input type="date" name="fechaExpe" id="fechaExpe" value="<?php echo  $datos["fechaExpe"]; ?>" class="form-control" >
                        </div>
                      </div>
                    </div>
                    <hr class="bg-primary">
                    <div class="row">
                      <div class="col">
                        <h4 class="text-primary">C) Dirección y teléfono</h4>
                        <p class="text-muted">Dirección según DUI</p>
                      </div>
                    </div>
                    <div class="row">
                              <div class="col">
                       <div class="form-group">
             			      <label for="depto">Departamento</label>
									        <select name="depto" id="depto" class="form-control select2">
							        <?php $de2 = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
                                 while ($depto2 = $con->arreglo($de2)) {       ?>
                        <option value="<?php echo $depto2["id_depto"]; ?>" <?php if ($datos["depto"] == $depto2["id_depto"]) {   echo "selected"; } ?>>  <?php echo $depto2["depto"]; ?></option>
									                <?php }?>
                	          </select>
			          				 </div>
			            			</div>
                     <div class="col">
                       <div class="form-group">
                      <label for="muni">Municipio</label>
                   <select name="muni" id="muni" class="form-control select2">
                   <?php $mu2 = $con->consulta("SELECT * FROM municipios WHERE eliminado = 0");
                    while ($muni2 = $con->arreglo($mu2)) {     ?>
                  <option value="<?php echo $muni2["id_muni"]; ?>" <?php if ($datos["muni"] == $muni2["id_muni"]) {    echo "selected";    }   ?> ><?php echo $muni2["municipio"]; ?></option>
                  <?php }?>
                    </select>
                     </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="">Dirección</label>
                          <input type="text" name="direccion" id="direccion" value="<?php echo  $datos["direccion"]; ?>"  class="form-control text-uppercase" placeholder="Direccion según DUI">
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <div class="form-group">
                          <label for="telefonoResi">Teléfono - Residencia</label>
                          <input type="text" name="telefonoResi" id="telefonoResi" value="<?php echo  $datos["telefonoResi"]; ?>"  placeholder="0000-0000" class="form-control">
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="celularResi">Teléfono - Celular</label>
                          <input type="text" name="celularResi" id="celularResi" placeholder="0000-0000" value="<?php echo  $datos["celularResi"]; ?>"  class="form-control">
                        </div>
                      </div>
                      <div class="col">
                        <div class="form-group">
                          <label for="trabajoResi">Teléfono - Trabajo</label>
                          <input type="tel" name="trabajoResi" value="<?php echo  $datos["trabajoResi"]; ?>" id="trabajoResi" placeholder="0000-0000" class="form-control">
                        </div>
                      </div>
                    </div>
                   <hr class="bg-primary">
                  <div class="row">
                    <div class="col">
                      <h4 class="text-primary">D) Pertenece a</h4>
                    </div>
                  </div>
                  <div class="row"> 
                       <div class="col">
                       <div class="form-group">
             			      <label for="depto">Departamento</label>
									        <select name="depto2" id="depto2" class="form-control select2">
							        <?php $de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
                                 while ($depto = $con->arreglo($de)) {       ?>
                        <option value="<?php echo $depto["id_depto"]; ?>" <?php if ($datos["id_depaPertenece"] == $depto["id_depto"]) {   echo "selected"; } ?>>  <?php echo $depto["depto"]; ?></option>
										                <?php }?>
                	          </select>
			          				 </div>
			            			</div>
                       <div class="col">
                       <div class="form-group">
                      <label for="">Municipio</label>
                   <select name="muni2" id="muni2" class="form-control select2">
                   <?php $mu = $con->consulta("SELECT * FROM municipios WHERE eliminado = 0");
                    while ($muni = $con->arreglo($mu)) {     ?>
                  <option value="<?php echo $muni["id_muni"]; ?>" <?php if ($datos["id_muniPertenece"] == $muni["id_muni"]) {    echo "selected";    }   ?> ><?php echo $muni["municipio"]; ?></option>
                  <?php }?>
                    </select>
                     </div>
                      </div>
                  <div class="col">
                        <div class="form-group">
                          <label for="">Fecha</label>
                          <input type="date" name="fechaExpe" id="fechaExpe" value="<?php echo  $datos["fechaExpe"]; ?>" class="form-control">
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
                  </div>
                  <div class="row">
                    <div class="col">
                      <div class="form-group">
                        <label for="">Pregunta de seguridad</label>
                        <select name="pregunta" id="pregunta" class="form-control">
							<option value="Tu pelicula favorita" <?php if($datos["pregunta"] == "Tu pelicula favorita"){ echo "selected = 'selected'";} ?>>Tu pelicula favorita</option>
                          <option value="Tu color favorito" <?php if($datos["pregunta"] == "Tu color favorito"){ echo "selected = 'selected'";} ?>>Tu color favorito</option>
                          
                          <option value="Nombre de tu Madre" <?php if($datos["pregunta"] == "Nombre de tu Madre"){ echo "selected = 'selected'";} ?>>Nombre de tu madre</option>
                          <option value="Nombre de tu Padre" <?php if($datos["pregunta"] == "Nombre de tu Padre"){ echo "selected = 'selected'";} ?>>Nombre de tu padre</option>
                        </select>
                      </div>
                    </div>
                    <div class="col">
                      <div class="form-group">
                        <label for="">Respuesta</label>
                        <input type="text" name="respuesta" id="respuesta" value="<?php echo  $datos["respuesta"]; ?>" class="form-control">
                      </div>
                    </div>
                  </div>
                </div>
              <div class="card-footer text-center">
                <button type="submit" class="btn btn-primary" id="boton" name="boton">
                  <i class="fas fa-save"></i>
                  Volver al inicio
                </button>
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