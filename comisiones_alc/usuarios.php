<?php
ini_set('default_charset','UTF8');
require("seguro.php");
require("php/conexion.php");

// 1. Verificación de Rol al inicio del archivo
// Asumiendo que el rol se guarda en $_SESSION["rol"]
if ($_SESSION["rol"] !== "Super") {
    // Si no es Super, redirigir al inicio o mostrar error
    header("Location: iniciar.php");
    exit(); 
}

$con = new cnn();
?>
<!DOCTYPE html>
<html>
<head>
    <?php include("head.php"); ?>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
            </li>
        </ul>
    </nav>

    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <?php include("aside.php"); ?>
    </aside>

    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6"><h1>Usuarios</h1></div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div id="tabla_usuarios">
                            <p class="text-center"><i class="fas fa-sync fa-spin"></i> Cargando información...</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="content">
            <?php include("usuarios/agregarUsuario.php"); ?>
            <?php include("usuarios/editarUsuario.php"); ?>
            <?php include("usuarios/actualizapass.php"); ?>
        </section>
    </div>

    <footer class="main-footer"><?php include "pie.php"; ?></footer>
</div>

<?php include("footer.php"); ?>
<script src="usuarios/funciones.js"></script>

<script type="text/javascript">
    // Esperar a que jQuery esté totalmente disponible
    window.addEventListener('load', function() {
        if (window.jQuery) {
            console.log("jQuery detectado. Cargando tabla...");
            
            // Intentar cargar la tabla
            $('#tabla_usuarios').load('usuarios/ver_usuario.php', function(response, status, xhr) {
                if (status == "error") {
                    console.error("Error al cargar ver_usuario.php: " + xhr.status + " " + xhr.statusText);
                    $('#tabla_usuarios').html('<div class="alert alert-danger">Error de carga: ' + xhr.status + '</div>');
                } else {
                    console.log("Tabla cargada correctamente.");
                }
            });

            // Vincular botones
            $('#guardarnuevo').off('click').on('click', function() {
                var datos = {
                    usu: $('#usu').val(),
                    pass: $('#pas1').val(),
                    rol: $('#rol').val(),
                    nom: $('#nom').val(),
                    ape: $('#ape').val(),
                    tel: $('#tel').val(),
                    m1: $('#mail1').val(),
                    m2: $('#mail2').val()
                };
                agregardatos(datos.usu, datos.pass, datos.rol, datos.nom, datos.ape, datos.tel, datos.m1, datos.m2);
            });
        } else {
            console.error("Error: jQuery no se cargó. Revisa footer.php");
        }
    });
</script>
</body>
</html>