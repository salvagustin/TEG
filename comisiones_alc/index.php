<?php
ob_start();
ini_set('default_charset', 'UTF8');
require("php/conexion.php");
$db = new cnn();
$fecha = date("Y-m-d");
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="plantilla/dist/css/adminlte.css">
  <link rel="stylesheet" href="plantilla/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <link rel="stylesheet" href="plantilla/plugins/toastr/toastr.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  <!-- jQuery -->
  <script src="plantilla/plugins/jquery/jquery.min.js"></script>
  <!-- Bootstrap 4 -->
  <script src="plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">

  <!-- AdminLTE App -->
  <script src="plantilla/dist/js/adminlte.min.js"></script>
  <script src="plantilla/plugins/sweetalert2/sweetalert2.min.js"></script>
  <script src="plantilla/plugins/toastr/toastr.min.js"></script>
  <link href="plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
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
<body class="hold-transition login-page" style="background-image: url('plantilla/dist/img/background2.jpeg');">
  
      <div class="login-box">
        <div class="login-logo">
            <img src="plantilla/dist/img/ACEAzul.png" width="300px" style="padding-top: 10px;">
          <a  style="color:#131d2e;"><b>Sistema de Elecciones</b></a>
        </div>
      <?php //} ?>
        <!-- /.login-logo -->
        
            <div class="card-body login-card-body">
                <p class="login-box-msg" style="color:#004387;">Iniciar sesión</p>
                <form action="" method="post">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Usuario" name="usu" autocomplete="off">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-user"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="Password" name="pass" autocomplete="off">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col text-center">
                            <button type="submit" name="boton" class="btn btn-primary btn-block">Iniciar sesión</button>
                        </div>
                    </div>
                </form>
                <br>
                <?php
                if (isset($_POST["boton"])) {
                    $usu = $_POST["usu"];
                    $pas = md5($_POST["pass"]);

                    $consulta = $db->consulta("SELECT adm_usuarios.id, adm_usuarios.usu, adm_usuarios.nom, adm_usuarios.ape, adm_usuarios.pas, adm_usuarios.rol, adm_rol.rol, adm_rol.con FROM adm_usuarios INNER JOIN adm_rol ON adm_usuarios.rol = adm_rol.rol HAVING adm_usuarios.usu = '$usu' and adm_usuarios.pas = '$pas'");

                    if ($db->conteo($consulta) > 0) {
                        $view = $db->arreglo($consulta);
                        $accion = "Inicio de sesion al sistema";
                        $lugar = "Administracion del Sistema";
                        $consultas = $db->consulta("INSERT INTO historial VALUES (NULL, '$view[id]', '$fecha', '$accion', '$lugar', NULL, 'Activo')");
                        echo "<script> window.location.href='iniciar.php';</script>";
                        session_start();
                        $_SESSION["seg"] = "ok";
                        $_SESSION["id"]  = $view["id"];
                        $_SESSION["nom"] = $view["nom"] . " " . $view["ape"];
                        $_SESSION["rol"] = $view["con"];
                    } else {
                ?>
                        <div class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                            <h5><i class="icon fas fa-ban"></i> Error!</h5>
                            Usuario o password incorrectos.
                        </div>
                <?php
                    }
                }
                ?>
            </div>
             
        
        
    </div>
    <!-- jQuery -->
    <script src="plantilla/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

    <!-- AdminLTE App -->
    <script src="plantilla/dist/js/adminlte.min.js"></script>
</body>
</html>
<?php
ob_end_flush();
?>