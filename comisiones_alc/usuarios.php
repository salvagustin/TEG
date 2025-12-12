<?php
ini_set('default_charset','UTF-8');
require("seguro.php");
require("php/conexion.php");
$con = new cnn();
?>
<!DOCTYPE html>
<html>
<head>
    <?php include("head.php"); ?>
    <script src="usuarios/funciones.js"></script>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="iniciar.php" class="nav-link">Inicio</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a class="nav-link" href="salir.php">
                    <i class="far ion-log-out"></i> Salir
                </a>
            </li>
        </ul>
    </nav>
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <?php include("aside.php"); ?>
    </aside>

    <div class="content-wrapper">
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Usuarios</h1>
                    </div><div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="iniciar.php">Inicio</a></li>
                            <li class="breadcrumb-item active">Usuarios</li>
                        </ol>
                    </div><div class="container">
                        <div id="tabla">
                            </div>
                    </div>  
                </div></div></div>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <?php include("usuarios/agregarUsuario.php"); ?>
                </div>
                <div class="row">
                    <?php include("usuarios/editarUsuario.php"); ?>
                </div>
                <div class="row">
                    <?php include("usuarios/actualizapass.php"); ?>
                </div>
                </div></section>
        </div>
    <footer class="main-footer text-justify">
        <?php include "pie.php"; ?>
    </footer>
    <aside class="control-sidebar control-sidebar-dark">
        </aside>
    </div>
<?php include("footer.php"); ?>
<script type="text/javascript">
    $(document).ready(function(){
        // Carga la tabla de manera asíncrona
        $('#tabla').load('usuarios/ver_usuario.php', function() {
            // FUNCIÓN CALLBACK: Se ejecuta SÓLO después de que el contenido de ver_usuario.php
            // ha sido cargado en el DIV #tabla.

            // Inicializamos DataTables aquí, una vez que el elemento #usuarios existe en el DOM.
            $('#usuarios').DataTable({
                "responsive": true, 
                "autoWidth": false,
                "language": {
                    // Configuración de idioma de DataTables (si es necesario)
                    // "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
                }
            });
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#guardarnuevo').click(function(){
            usu = $('#usu').val();
            pass = $('#pas1').val();
            rol = $('#rol').val();
            nom = $('#nom').val();
            ape = $('#ape').val();
            tel = $('#tel').val();
            mail1 = $('#mail1').val();
            mail2 = $('#mail2').val();     
            deptoExpe = $('#deptoExpe').val();
            muniExpe = $('#muniExpe').val();      
            agregardatos(usu, pass, rol, nom, ape, tel, mail1, mail2,deptoExpe, muniExpe);
        });

        $('#actualizadatos').click(function(){
            actualizaDatos();
        });
        
        $('#actualizarPass').click(function(){
            idpass=$('#idpass').val();             
            contra1=$('#contra1').val();
            contra2=$('#contra2').val();

            actualizapass(idpass,contra1, contra2);
        });

    });
</script>
<script>
    $(function () {
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