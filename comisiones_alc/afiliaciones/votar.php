<?php

ob_start();

// CORRECCIÓN: Cambiado 'UTF8' (sin guion) a 'UTF-8' (con guion) para compatibilidad con PHP.
ini_set('default_charset', 'UTF-8');

require "seguro.php";

require "../php/conexion.php";

$con = new cnn();

$fecha = date("Y-m-d");

$hora = date("H:i:s");



// 2. OBTENER DATOS DEL VOTANTE USANDO EL ID DE SESIÓN
$votante = [
    "primerNombre" => "",
    "primerApellido" => "",
    "dui" => ""
];

if (isset($_SESSION["id"])) {
    $id_afiliado = $_SESSION["id"];
    // Consulta para obtener solo los campos necesarios de la persona que inició sesión
    $qu = $con->consulta("SELECT primerNombre, primerApellido, dui FROM afiliados WHERE id = '$id_afiliado'");
    if ($con->conteo($qu) > 0) {
        $votante = $con->arreglo($qu);
    }
}
// Fin de la lógica de obtención de datos del votante


$pe = $con->consulta("SELECT id_jornada, periodoDesde, periodoHasta, descripcion FROM jornadas WHERE estado = 'Activo'");

$periodo = $con->arreglo($pe);

$can = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.sexo, afiliados.segundoApellido, afiliados.apellidoCasada, candidatos.foto, candidatos.id_candidato, candidatos.id_jornada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.estado = 'Activo' AND candidatos.id_jornada = '$periodo[id_jornada]' ORDER BY RAND() LIMIT 50");

?>

<!DOCTYPE html>

<html lang="es">

<head>

    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>Votaciones ACE</title>

    <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">

    <link rel="stylesheet" href="../plantilla/dist/css/adminlte.min.css">

    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <link href="../plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>



<body class="hold-transition layout-top-nav">

    <div class="wrapper">

        <nav class="main-header navbar navbar-expand-md navbar-light navbar-white" style="background-color:#131d2e; ">

            <div class="container">

                <a href="#" class="navbar-brand">

                    <img src="../plantilla/dist/img/ACELogoBlanco.png" width="230">

                </a>

            </div>

        </nav>

        <div class="content-wrapper">

            <div class="content-header">

                <div class="container">

                    <div class="row">

                        <div class="col text-center">

                            <h1 class="m-0 text-dark"> ELECCION INTERNA PARA EL PUESTO DE  <?php echo ($periodo["descripcion"]) ; ?>
                                DE LA AGENCIA DE CIBERSEGURIDAD DEL ESTADO, POR PARTE DE LAS Y LOS EMPLEADOS DE LA AGENCIA, 
                                PARA EL PERIODO <?php echo date('m/Y', strtotime($periodo["periodoDesde"])); ?> - <?php echo date('m/Y', strtotime($periodo["periodoHasta"])); ?></h1>

                        </div><div class="col-12 text-center mt-3"> <div class="card-body" style="padding: 10px 5px; background-color: #f8f9fa; border-radius: 5px;">
                                <P class="text-center" style="font-size:1.2em; margin-bottom: 0;">
                                    <b>Votante: <?php echo ($votante["primerNombre"]) . " " . ($votante["primerApellido"]); ?> (DUI: <?php echo ($votante["dui"]); ?>)</b>
                                </P>
                            </div>
                        </div>
                        </div></div></div>

            <div class="content">

                <div class="container">

                    <form action="registrarVoto.php" method="post" id="form1" name="form1" onsubmit="return confirm('¿Está seguro de finalizar la votación? ');">

                        <div class="row d-flex justify-content-center">

                            <?php
                            // Suponiendo que $con y $can están definidos antes
                            while ($candidato = $con->arreglo($can)) {
                            ?>

                                <div class="col-6 text-center" style="max-width:33.33%; padding: 10px 10px;">

                                    <div class="card border-primary card-primary card-outline text-center h-100 candidate-card" id="card_<?php echo $candidato["id_candidato"]; ?>" style="border: 1px solid #131d2e; display: flex; flex-direction: column; cursor: pointer;">

                                        <div class="pt-3" style="text-align: center;">
                                            <img <?php if ($candidato["foto"] <> "") { ?> src="../candidatos/fotos/<?php echo $candidato["foto"]; ?>" <?php } else {
                                                                                                                                                            if ($candidato["sexo"] == "MASCULINO") { ?> src="../candidatos/fotos/hombre.png" <?php } elseif ($candidato["sexo"] == "FEMENINO") { ?> src="../candidatos/fotos/mujer.png" <?php }
                                                                                                                                                                                                                                                        } ?> style="width: 50%; max-width: 150px; height: auto; display: block; margin: 0 auto;">
                                        </div>

                                        <div class="card-body text-center" style="padding: 10px 5px; flex-grow: 1;">
                                            <P class="text-center" style="font-size:1.1em; margin-bottom: 2px;">
                                                <b><?php if ($candidato["primerNombre"] == "") {
                                                        echo "&nbsp;";
                                                    } else {
                                                        echo $candidato["primerNombre"] . " " . $candidato["segundoNombre"];
                                                    } ?></b>
                                            </P>
                                            <P class="text-center" style="font-size:1.1em; margin-bottom: 5px;">
                                                <b><?php if ($candidato["primerApellido"] == "") {
                                                        echo "&nbsp;";
                                                    } else {
                                                        echo $candidato["primerApellido"] . " " . $candidato["segundoApellido"];
                                                    } ?></b>
                                            </P>
                                        </div>

                                        <ul class="list-group list-group-flush text-center" style="flex-grow: 0;">
                                            <input type="hidden" name="candidato" id="cantidato" value="<?php echo $candidato["id_candidato"]; ?>">
                                        </ul>

                                        <div class="card-body" style="padding: 10px; flex-grow: 0;">
                                            <div class="form-group mb-0">
                                                <input class="form-control voto-radio" type="radio" id="voto_<?php echo $candidato["id_candidato"]; ?>" name="voto" value="<?php echo $candidato["id_candidato"]; ?>" style="display: none;">
                                                <input type="hidden" name="jornada" id="jornada" value="<?php echo $periodo["id_jornada"]; ?>">

                                                <span class="btn btn-sm btn-outline-primary select-btn" data-candidate-id="<?php echo $candidato["id_candidato"]; ?>">Marcar / Seleccionado</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <?php
                            }
                            ?>

                            <div class="col-6 text-center" style="max-width:33.33%; padding: 10px 10px;">
                                <div class="card border-primary card-primary card-outline text-center h-100 candidate-card" id="card_abstencion" style="border: 1px solid #131d2e; display: flex; flex-direction: column; cursor: pointer;">

                                    <div class="pt-3" style="text-align: center;">
                                        <img src="abstencion.png" style="width: 50%; max-width: 150px; height: auto; display: block; margin: 0 auto;">
                                    </div>

                                    <div class="card-body text-center" style="padding: 10px 5px; flex-grow: 1; display: flex; align-items: center; justify-content: center;">
                                        <p class="text-center" style="font-size:1.1em; margin: 0;">
                                            <b>VOTO ABSTENCIÓN</b>
                                        </p>
                                    </div>

                                    <ul class="list-group list-group-flush text-center" style="flex-grow: 0;">
                                    </ul>

                                    <div class="card-body" style="padding: 10px; flex-grow: 0;">
                                        <div class="form-group mb-0">
                                            <input class="form-control voto-radio" type="radio" id="voto_abstencion" name="voto" value="abstencion" style="display: none;">
                                            <input type="hidden" name="jornada" id="jornada" value="<?php echo $periodo["id_jornada"]; ?>">

                                            <span class="btn btn-sm btn-outline-primary select-btn" data-candidate-id="abstencion">Marcar / Seleccionado</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row mt-4 mb-5">
                            <div class="col text-center">
                                <button type="submit" id="boton" name="boton" class="btn btn-primary btn-lg" style="width: 100%; max-width: 300px; background-color:#131d2e; border-color: #131d2e; "" >
                                    <i class="fas fa-vote-yea"></i> Votar
                                </button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
            <style>
                /* Estilo para el borde de la tarjeta seleccionada */
                .card.selected {
                    border: 4px solid #28a745 !important;
                    /* Borde verde más grueso al seleccionar */
                    box-shadow: 0 0 10px rgba(40, 167, 69, 0.5);
                    /* Sombra para resaltar */
                }
            </style>

            <script>
                // Esperar a que el documento esté completamente cargado
                document.addEventListener('DOMContentLoaded', function() {
                    const selectBtns = document.querySelectorAll('.select-btn');
                    const candidateCards = document.querySelectorAll('.candidate-card');

                    // Función para limpiar la selección visual de todas las tarjetas
                    function clearSelection() {
                        candidateCards.forEach(card => {
                            card.classList.remove('selected');
                            card.style.border = '1px solid #131d2e'; // Restaurar borde original
                        });
                    }

                    // 1. Manejar la selección por el botón "Marcar / Seleccionado"
                    selectBtns.forEach(btn => {
                        btn.addEventListener('click', function() {
                            const candidateId = this.getAttribute('data-candidate-id');
                            const radioInput = document.getElementById('voto_' + candidateId);
                            const card = document.getElementById('card_' + candidateId);

                            if (radioInput) {
                                // Desmarcar todos los radios visualmente y lógicamente
                                document.querySelectorAll('.voto-radio').forEach(radio => {
                                    radio.checked = false;
                                });

                                clearSelection(); // Limpiar visualmente todas las tarjetas

                                // Marcar el radio button
                                radioInput.checked = true;

                                // Aplicar estilo visual a la tarjeta seleccionada
                                card.classList.add('selected');
                            }
                        });
                    });

                    // 2. Manejar la selección si hacen clic en cualquier parte de la tarjeta
                    candidateCards.forEach(card => {
                        card.addEventListener('click', function(event) {
                            // Evitar que el clic en el botón se procese dos veces
                            if (event.target.closest('.select-btn')) return;

                            const candidateId = this.id.replace('card_', '');
                            const radioInput = document.getElementById('voto_' + candidateId);

                            if (radioInput) {
                                // Desmarcar todos los radios visualmente y lógicamente
                                document.querySelectorAll('.voto-radio').forEach(radio => {
                                    radio.checked = false;
                                });

                                clearSelection(); // Limpiar visualmente todas las tarjetas

                                // Marcar el radio button
                                radioInput.checked = true;

                                // Aplicar estilo visual a la tarjeta seleccionada
                                this.classList.add('selected');
                            }
                        });
                    });

                    // 3. Inicializar la selección si el usuario vuelve a la página y hay un voto marcado
                    const initialSelectedRadio = document.querySelector('.voto-radio:checked');
                    if (initialSelectedRadio) {
                        const candidateId = initialSelectedRadio.value;
                        const card = document.getElementById('card_' + candidateId);
                        if (card) {
                            card.classList.add('selected');
                        }
                    }
                });
            </script>


        </div>

        <script src="../plantilla/plugins/jquery/jquery.min.js"></script>

        <script src="../plantilla/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="../plantilla/dist/js/adminlte.min.js"></script>

</body>

</html>