<?php
ini_set('default_charset', 'UTF8');
require "seguro.php";
require "php/conexion.php";
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';
$con = new cnn();
$id = base64_decode($_GET['id']);
$para = $con->consulta("SELECT * FROM parametros WHERE id_parametro = '$id'");
$dato = $con->arreglo($para);

if (isset($_POST["boton"])) 
{

    $municipalidad = $_POST['municipalidad'];
    $nombreAlcalde = $_POST['alcalde'];
    $cargoAlcalde = $_POST['cargoAlcalde'];
    $nombreSecretario = $_POST['nombreSecretario'];
    $cargoSecretario = $_POST['cargoSecretario'];
    $telefono = $_POST['telefono'];
    $direc = $_POST['direc'];
    $correo = $_POST['correo'];
    $paginaW = $_POST['paginaW'];
    $miembro1W = $_POST['miembro1W'];
    $miembro2W = $_POST['miembro2W'];
    $miembro3W = $_POST['miembro3W'];
    $cargo1W = $_POST['cargo1W'];
    $cargo2W = $_POST['cargo2W'];
    $cargo3W = $_POST['cargo3W'];
    $observador = $_POST['observador'];
    $observador2 = $_POST['observador2'];
    $observador3 = $_POST['observador3'];

    $cargoobservador = $_POST['cargoobservador'];
    $cargoobservador2 = $_POST['cargoobservador2'];
    $cargoobservador3 = $_POST['cargoobservador3'];

    $logo = $_FILES['logo']['name'];
    $ruta = "parametros/logos/";

    if (empty($logo)) {

        $sql = $con->consulta("UPDATE parametros SET  nombreAlcalde = '$nombreAlcalde', cargoAlcalde = '$cargoAlcalde', nombreSecretario = '$nombreSecretario', cargoSecretario = '$cargoSecretario', telefono = '$telefono', direccion = '$direc', correo = '$correo', paginaweb = '$paginaW', miembro1 = '$miembro1W', miembro2 = '$miembro2W', miembro3 = '$miembro3W', cargo1 = '$cargo1W', cargo2 = '$cargo2W', cargo3 = '$cargo3W', observador = '$observador', observador2 = '$observador2', observador3 = '$observador3', cargo_observador = '$cargoobservador', cargo_observador2 = '$cargoobservador2', cargo_observador3 = '$cargoobservador3' WHERE id_parametro = '$id' ");
        ///son img
    } 
    else 
    {
        $sql = $con->consulta("UPDATE parametros SET  nombreAlcalde = '$nombreAlcalde', cargoAlcalde = '$cargoAlcalde', nombreSecretario = '$nombreSecretario', cargoSecretario = '$cargoSecretario', telefono = '$telefono', direccion = '$direc', correo = '$correo', paginaweb = '$paginaW', logo = '$logo', miembro1 = '$miembro1W', miembro2 = '$miembro2W', miembro3 = '$miembro3W', cargo1 = '$cargo1W', cargo2 = '$cargo2W', cargo3 = '$cargo3W', observador = '$observador', observador2 = '$observador2', observador3 = '$observador3', cargo_observador = '$cargoobservador', cargo_observador2 = '$cargoobservador2', cargo_observador3 = '$cargoobservador3' WHERE id_parametro = '$id'");

        move_uploaded_file($_FILES['logo']['tmp_name'], $ruta . $logo);

    }
    $accion = "Actualizo los datos del parametros";
    $lugar = "parametros";
   // $consultas = $con->consulta("INSERT INTO historial VALUES (NULL, '$_SESSION[id]', '$fecha', '$accion', '$lugar', '$id', 'Activo')");
    echo "<script> window.location.href='parametros.php'; </script>";

} 
else 
{

?>

<!DOCTYPE html>
<html>
<head>
    <?php include "head.php";?>
    <script>
		function fileValidation() 
		{
			var fileInput = document.getElementById('logo');
			var filePath = fileInput.value;
			var allowedExtensions = /(.jpg|.jpeg|.png)$/i;
			if (!allowedExtensions.exec(filePath)) 
			{
				alert('Cargue un archivo con extensión .jpeg /.jpg /.png');
				fileInput.value = '';
				return false;
			}
		}
	</script>
</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>
                <li class="nav-item d-none d-sm-inline-block">
                    <a href="iniciar.php" class="nav-link">Inicio</a>
                </li>
            </ul>
            <!-- SEARCH FORM -->
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Messages Dropdown Menu -->
                <li class="nav-item dropdown">
                    <a class="nav-link" href="salir.php">
                        <i class="far ion-log-out"></i> Salir
                    </a>
                </li>
                <!-- Notifications Dropdown Menu -->
            </ul>
        </nav>
        <!-- /.navbar -->
        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <?php include "aside.php";?>
        </aside>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Parámetros</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
                                <li class="breadcrumb-item active">Jornadas</li>
                            </ol>
                        </div><!-- /.col -->
                        <div class="container">
                            <div class="row">
		                        <div class="col">
			                        <form  action="" method="post" enctype="multipart/form-data" id="form1" name="form1">
				                        <div class="card card-primary card-outline">
					                        <div class="card-header bg-primary">
						                        <h3 class="card-title">Actualizando los datos del parámetro</h3>
					                        </div>
					                    <div class="card-body">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Nombre de la municipalidad</label>
                                                        <input type="text" id="municipalidad" name="municipalidad" class="form-control" value="<?php echo $dato["municipalidad"]; ?>">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Nombre del encargado</label>
                                                        <input type="text" class="form-control" id="alcalde" name="alcalde" value="<?php echo $dato["nombreAlcalde"]; ?>">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Cargo</label>
                                                        <input type="text" class="form-control" id="cargoAlcalde" name="cargoAlcalde" value="<?php echo $dato["cargoAlcalde"]; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Nombre del secretario</label>
                                                        <input type="text" class="form-control" id="nombreSecretario" name="nombreSecretario" value="<?php echo $dato["nombreSecretario"]; ?>">
                                                    </div>
                                                </div>

                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Cargo</label>
                                                        <input type="text" class="form-control" id="cargoSecretario" name="cargoSecretario" value="<?php echo $dato["cargoSecretario"]; ?>">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Teléfono</label>
                                                        <input type="text" class="form-control" id="telefono" name="telefono" value="<?php echo $dato["telefono"]; ?>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Dirección</label>
                                                        <input type="text" class="form-control" id="direc" name="direc" value="<?php echo $dato["direccion"]; ?>">
                                                    </div>
                                                </div>
						                    </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Correo</label>
                                                        <input type="text" class="form-control" id="correo" name="correo" value="<?php echo $dato["correo"]; ?>">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="form-group">
                                                        <label>Página web</label>
                                                        <input type="text" class="form-control" id="paginaW" name="paginaW" value="<?php echo $dato["paginaweb"]; ?>">
                                                    </div>
                                                </div>
                                                <div class="col">
                                                    <div class="custom-file">
                                                        <input type="file" class="custom-file-input" id="logo" name="logo" onchange="return fileValidation()">
                                                        <label class="custom-file-label" for="logo">logo</label>
                                                    </div>
            	                                </div>
          	                                </div>
                                            <div class="row">
                                                <div class="col text-center">
                                                    <div class="form-group">
                                                        <label for="">Logo actual</label><br>
                                                        <img src="parametros/logos/<?php echo $dato["logo"]; ?>" alt="" widght="55" height="66" >
                                                    </div>
                                                </div>
                                                </div>
                                            <div class="row">
                                                <div class="col text-center">
                                                    <div class="form-group">
                                                        <label>Miembro de la comisión transitoria de elección</label>
                                                        <input type="text" class="form-control" id="miembro1W" name="miembro1W" value="<?php echo $dato["miembro1"]; ?>">
                                                        <input type="text" class="form-control" id="miembro2W" name="miembro2W" value="<?php echo $dato["miembro2"]; ?>">
                                                        <input type="text" class="form-control" id="miembro3W" name="miembro3W" value="<?php echo $dato["miembro3"]; ?>">
	                                                </div>
	                    	                    </div> 
                                                <div class="col text-center">
                                                    <div class="form-group">
                                                        <label>Cargos </label>
                                                        <input type="text" class="form-control" id="cargo1W" name="cargo1W" value="<?php echo $dato["cargo1"]; ?>">
                                                        <input type="text" class="form-control" id="cargo2W" name="cargo2W" value="<?php echo $dato["cargo2"]; ?>">
                                                        <input type="text" class="form-control" id="cargo3W" name="cargo3W" value="<?php echo $dato["cargo3"]; ?>">
			            		                    </div>
		            		                    </div> 
                                            </div>
                                            <div class="row">
                                                <div class="col text-center">
                                                    <div class="form-group">
                                                        <label>Nombre de los observadores </label>
                                                        <input type="text" class="form-control" id="observador" name="observador" value="<?php echo $dato["observador"]; ?>" >
                                                        <input type="text" class="form-control" id="observador2" name="observador2" value="<?php echo $dato["observador2"]; ?>" >
                                                        <input type="text" class="form-control" id="observador3" name="observador3" value="<?php echo $dato["observador3"]; ?>" >
	                                                </div>
	                    	                    </div> 
                                                <div class="col text-center">
                                                    <div class="form-group">
                                                        <label>Cargo de los observadores </label>
                                                        <input type="text" class="form-control" value="<?php echo $dato["cargo_observador"]; ?>" id="cargoobservador" name="cargoobservador" >
                                                        <input type="text" class="form-control" name="cargoobservador2" id="cargoobservador2" value="<?php echo $dato["cargo_observador2"]; ?>">
                                                        <input type="text" class="form-control" name="cargoobservador3" id="cargoobservador3" value="<?php echo $dato["cargo_observador3"]; ?>">
                                                    </div>
                                                </div> 
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <button type="submit" class="btn btn-primary" id="boton" name="boton"><i class="far fa-save"></i> Actualizar datos</button>
                                        </div>
                                    </form>
				                </div>
		                    </div>
	                    </div>
                    </div>
                </div><!-- /.row -->

            </div><!-- /.container-fluid -->

        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer text-justify">
            <?php include "pie.php";?>
        </footer>
    </div>
    <!-- ./wrapper -->
    <!-- jQuery -->
    <?php include "footer.php";?>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#tabla').load('parametros/editarParametro.php');
        });
        $(function() {
            //Initialize Select2 Elements
            $('.select2').select2()
            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
        })
    </script>
</body>
</html>
<?php
}