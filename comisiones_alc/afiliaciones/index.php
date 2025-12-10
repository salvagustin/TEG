<?php
date_default_timezone_set('America/El_Salvador');
ob_start();
ini_set('default_charset', 'UTF8');
require "../php/conexion.php";
$db = new cnn();
$fecha = date("Y-m-d"); 
$hora = date("H:i:s");
 

?>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Votación</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../plantilla/dist/css/adminlte.css">
  <link rel="stylesheet" href="../plantilla/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <link rel="stylesheet" href="../plantilla/plugins/toastr/toastr.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- jQuery -->
  <script src="../plantilla/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="../plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- AdminLTE App -->
  <script src="../plantilla/dist/js/adminlte.min.js"></script>
  <script src="../plantilla/plugins/sweetalert2/sweetalert2.min.js"></script>
  <script src="../plantilla/plugins/toastr/toastr.min.js"></script>
  <link href="../plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">

  <script type="text/jscript">
    function agregar(URL, ancho, alto) {
      var posicion_x;
      var posicion_y;
      posicion_x = (screen.width / 2) - (ancho / 2);
      posicion_y = (screen.height / 2) - (ancho / 2);
      window.open(URL, "agregar", "width=" + ancho + ",height=" + alto + ",menubar=no,scrollbars=no,toolbar=no,directories=no,resizable=no,top=" + posicion_y + ",left=" + posicion_x + "");
    }
  </script>
</head>

<body class="hold-transition login-page">
  <div class="login-box">
    <?php //$pa = $db->consulta("SELECT parametros.municipalidad, municipios.municipio, parametros.logo FROM parametros INNER JOIN municipios ON parametros.muni = municipios.id_muni WHERE parametros.eliminado = 0 AND parametros.estado = 'Activo'");
    //if ($db->conteo($pa) > 0) {
      //$para = $db->arreglo($pa); ?>
      <div class="login-box">
        <div class="login-logo">
     <img src="../plantilla/dist/img/ACEAzul.png" width="300px">
           <hr style="background: #131d2e;  border-top:5px solid rgba(0, 0, 0, 0.1)">
               <a href="#" style="color:#004387;"><b>Sistema de Elecciones</b></a><br>
        <!--  <a href="#" style="color:#004387;"><b> <?php //echo $para["municipalidad"]; ?> <br><b><?php //echo $para["municipio"]; ?></b></a><br>-->
          <a href="#" style="color:#004387;">Cabina virtual de votación </a>
        </div>
                <hr style="background: #131d2e;  border-top:5px solid rgba(0, 0, 0, 0.1)"> 
      <?php //} ?>
      <!-- /.login-logo -->
      <div class="card">
        <div class="card-body login-card-body">
          <p class="login-box-msg">Iniciar sesión</p>
          <form action="" method="post">
				<div class="form-check text-center">
                	<input name="votarDUI" type="checkbox" class="form-check-input" id="votarDUI" value="si">
                    <label class="form-check-label">Votar con DUI</label>
           	</div>
            <div class="input-group mb-3">
            </div>
            <div class="input-group mb-3">
              <!--<input type="text" class="form-control" placeholder="Codigo de acceso" name="codigo" autocomplete="off" data-inputmask='"mask": "99999999-9"' data-mask>-->
              <input type="text" class="form-control" placeholder="DUI:99999999-9 ó Codigo de acceso" name="codigo" autocomplete="off" >
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-lock"></span> 
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col text-center">
                <button type="submit" name="boton" class="btn btn-primary btn-block">Iniciar votación</button>
              </div>
            </div>
          </form>
          <br>
          <?php
          if (isset($_POST["boton"])) 
          {
            $votarDUI = $_POST["votarDUI"];
            $codigo = $_POST["codigo"];
			  
			if($votarDUI == "si")
			{
				$consulta = $db->consulta("SELECT id, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui, codigo FROM afiliados WHERE  dui = '$codigo'");
			}
			else
			{
				$consulta = $db->consulta("SELECT id, primerNombre, segundoNombre, primerApellido, segundoApellido, apellidoCasada, dui, codigo FROM afiliados WHERE codigo = '$codigo'");
			}
            

            if ($db->conteo($consulta) > 0) {
              $view = $db->arreglo($consulta);

              $buj = $db->consulta("SELECT id_jornada FROM jornadas WHERE fecha = '$fecha' AND '$hora' BETWEEN horaDesde AND horaHasta AND estado = 'ACTIVO' ");

              if ($db->conteo($buj) == 0) {
                echo "
                        <script type='text/javascript'> 
                        Swal.fire('¡Advertencia!', 'No hay jornada electoral activa', 'warning');
                        ;
                        </script>";
              } else { 
                $jorna = $db->arreglo($buj);
                $busVoto = $db->consulta("SELECT id_votacion FROM votacion WHERE id_jornada = '$jorna[id_jornada]' AND id_afiliado = '$view[id]' ");
                if($db->conteo($busVoto) >= 1)
                {
                  echo "
                      <script type='text/javascript'>
                      Swal.fire('¡Advertencia!', '¡Este Dui ya emitio su voto!', 'warning');
                      ;
                      </script>";
                }
                else
                {
                echo "<script> window.location.href='votar.php';</script>";
                session_start();
                $_SESSION["seg"] = "ok";
                $_SESSION["id"] = $view["id"];
                $_SESSION["nom"] = $view["primerNombre"] . " " . $view["segundoNombre"] . " " . $view["primerApellido"] . " " . $view["segundoApellido"] . " " . $view["apellidoCasada"];
                $_SESSION["dui"] = $view["dui"];
              }
                }
            } else {
          ?>
              <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h5><i class="icon fas fa-ban"></i> Error!</h5>
                Dui o código ingresados son incorrectos.
              </div>
          <?php
            }
          }
          ?>
          <div class="social-auth-links text-center mb-3">
 <?php $jorna=$db->consulta("SELECT	id_jornada FROM	jornadas WHERE fecha = '$fecha' AND	estado = 'ACTIVO' ");
     
 if($db->conteo($jorna)<>0){  } else {
 ?> <p class="mb-1">
            <!--  <a href="afiliacion.php">Aún no puedes votar? Registrate aquí</a> -->
            </p>
              <?php } ?>

           <!-- <p class="mb-0">
              <a href="javascript:agregar('recuperar.php', 390, 670);" class="text-center">Clave olvidada ? Recupérala aquí </a>
            </p>-->
			  <p class="mb-0">
              <a href="preguntaValidarAfi.php" class="text-center">1. Activa tu cuenta para votar</a>
            </p>
            <p class="mb-0">
              <a href="verificacion.php" class="text-center">2. Verifica si ya estás afiliado </a>
            </p>
          </div>
        </div>
      </div>
      </div>
             <hr style="background: #004387; border-top:5px solid rgba(0, 0, 0, 0.1)">
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
<?php
ob_end_flush();
