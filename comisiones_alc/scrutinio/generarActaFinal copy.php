<?php

ini_set('default_charset', 'UTF8');

setlocale(LC_ALL, 'spanish');

require "../php/conexion.php";

require "../seguro.php";

require "../php/numeroLetras.php";

$V = new EnLetras();



$id = base64_decode($_GET['id']);

$con = new cnn();



function calculaedad($fechanacimiento)

{

  list($ano, $mes, $dia) = explode("-", $fechanacimiento);

  $ano_diferencia = date("Y") - $ano;

  $mes_diferencia = date("m") - $mes;

  $dia_diferencia = date("d") - $dia;

  if ($dia_diferencia < 0 || $mes_diferencia < 0) {

    $ano_diferencia--;

  }

  return $ano_diferencia;

}



$jor = $con->consulta("SELECT fecha, id_depa, id_muni, horaDesde, horaHasta, periodoDesde, periodoHasta FROM jornadas WHERE eliminado = 0 AND id_jornada = '$id'");

$jornada = $con->arreglo($jor);



$para = $con->consulta("SELECT departamentos.depto, municipios.municipio, parametros.municipalidad, parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.nombreSecretario, parametros.cargoSecretario, parametros.telefono, parametros.direccion, parametros.correo, parametros.logo, parametros.miembro1, parametros.miembro2, parametros.miembro3, parametros.cargo1, parametros.cargo2, parametros.cargo3, parametros.observador, parametros.cargo_observador FROM parametros INNER JOIN departamentos ON parametros.id_depto = departamentos.id_depto INNER JOIN municipios ON departamentos.id_depto = municipios.id_depto AND parametros.id_muni = municipios.id_muni WHERE parametros.eliminado = 0 and  parametros.id_depto = '$jornada[id_depa]' AND parametros.id_muni = '$jornada[id_muni]'");

$parametro = $con->arreglo($para);



$newDate = date("d-m-Y", strtotime($jornada["fecha"]));

$fechaEleccion = strftime("%B", strtotime($newDate));



$cont = $con->consulta("SELECT COUNT(id_votacion) AS total FROM votacion WHERE id_jornada = '$id' AND eliminado = 0 AND id_depto = '$jornada[depa]' AND id_muni = '$jornada[id_muni]'");

$conteo = $con->arreglo($cont);



$totalVotos = str_pad($conteo["total"], 3, "0", STR_PAD_LEFT);

$asis1 = substr($totalVotos, 0, 1);

$asis2 = substr($totalVotos, 1, 1);

$asis3 = substr($totalVotos, 2, 1);



$coo = $con->consulta("SELECT COUNT(id) AS conteo FROM afiliados WHERE eliminado = 0 AND id_depaPertenece = '$jornada[id_depa]' AND

	id_muniPertenece = '$jornada[id_muni]'" );

$toAfi = $con->arreglo($coo);



$can = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.dui, afiliados.nit, afiliados.cargo, afiliados.fechaNac, afiliados.sexo, candidatos.id_candidato FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_jornada = '$id' AND afiliados.id_depaPertenece = '$jornada[id_depa]' AND afiliados.id_muniPertenece = '$jornada[id_muni]'");



$votNu = $con->consulta("SELECT SUM(nulos) AS nulos FROM votacion WHERE id_jornada = '$id' AND votacion.id_depto = '$jornada[id_depa]' AND votacion.id_muni = '$jornada[id_muni]' ");

$nulos = $con->arreglo($votNu);



$votAb = $con->consulta("SELECT SUM(abstenciones) AS abstenciones FROM votacion WHERE id_jornada = '$id' AND id_depto = '$jornada[id_depa]' AND id_muni = '$jornada[id_muni]'");

$abstenciones = $con->arreglo($votAb);



$toV = $con->consulta("SELECT SUM(voto) AS votos FROM votacion WHERE id_jornada = '$id' AND voto = 1 AND id_depto = '$jornada[id_depa]' AND id_muni = '$jornada[id_muni]'");

$totalGolbal = $con->arreglo($toV);

?>



<!DOCTYPE html>

<html lang="en">



<head>

  <meta charset="utf-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Admin Registros | CEGM</title>

  <!-- Tell the browser to be responsive to screen width -->

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->

  <link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">

  <!-- Ionicons -->

  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

  <!-- Tempusdominus Bbootstrap 4 -->

  <link rel="stylesheet" href="../plantilla/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

  <!-- iCheck -->

  <link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

  <!-- JQVMap -->

  <!-- Theme style -->

  <link rel="stylesheet" href="../plantilla/dist/css/adminlte.min.css">

  <!-- overlayScrollbars -->

  <link rel="stylesheet" href="../plantilla/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">

  <!-- Daterange picker -->

  <link rel="stylesheet" href="../plantilla/plugins/daterangepicker/daterangepicker.css">

  <!-- summernote -->

  <link rel="stylesheet" href="../plantilla/plugins/summernote/summernote-bs4.css">

  <link rel="stylesheet" href="../plantilla/plugins/datatables-bs4/css/dataTables.bootstrap4.css">

  <!-- Google Font: Source Sans Pro -->

  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

  <!-- Bootstrap Color Picker -->

  <link rel="stylesheet" href="../plantilla/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">

  <!-- Select2 -->

  <link rel="stylesheet" href="../plantilla/plugins/select2/css/select2.min.css">

  <link rel="stylesheet" href="../plantilla/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">

  <!-- Bootstrap4 Duallistbox -->

  <link rel="stylesheet" href="../plantilla/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">

  <link rel="stylesheet" type="text/css" href="../plantilla/alertifyjs/css/alertify.css">

  <link rel="stylesheet" type="text/css" href="../plantilla/alertifyjs/css/themes/default.css">

  <!-- SweetAlert2 -->

  <link rel="stylesheet" href="../plantilla/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

  <!-- Toastr -->

  <link rel="stylesheet" href="../plantilla/plugins/toastr/toastr.min.css">

</head>





<body onload="window.print()">

  <div class="row">

    <div class="col-2 text-center">

      <img src="../parametros/logos/<?php echo $parametro["logo"]; ?>" width="81" height="91">

    </div>



    <div class="col text-center">

      <h1>MUNICIPALIDAD DE <?php echo strtoupper($parametro["municipio"]); ?>, DEPARTAMENTO DE <?php echo strtoupper($parametro["depto"]); ?> </h1>

      <h2>ACTA DE RESULTADOS FINALES</h2>

    </div>

    <div class="col-2 text-center">

      <img src="../plantilla/dist/img/Escudo.fw.png" width="81" height="91">

    </div>

  </div>

  <div class="row">

    <div class="col"> 

      <p class="text-justify" style="font-size:24px">En la <?php echo $parametro["municipalidad"]; ?> <?php echo $parametro["municipio"]; ?>, Departamento de <?php echo $parametro["depto"]; ?>. A las <?php echo strtolower($V->ValorEnLetras(date("H", strtotime($jornada["horaHasta"])), '')); ?> horas <?php if (date("i", strtotime($jornada["horaHasta"])) <> 00) { echo "con " . strtolower($V->ValorEnLetras(date("i", strtotime($jornada["horaHasta"])), '')) . " minutos";} ?>, del día <?php echo strtolower(trim($V->ValorEnLetras(date("d", strtotime($jornada["fecha"])), ''))); ?> <?php echo $fechaEleccion; ?> <?php echo strtolower(trim($V->ValorEnLetras(date("Y", strtotime($jornada["fecha"])), ''))); ?>, el evento electoral se realizó por medio del sistema para elección de miembros de comisiones de Ética Gubernamental y conforme a lo prescrito en el artículo treinta y cuatro del Reglamento de la Ley de Ética Gubernamental; el Sr. (a) <?php echo $parametro["cargoAlcalde"]; ?> <?php echo $parametro["nombreAlcalde"]; ?> y <?php echo $parametro["cargoSecretario"]; ?> <?php echo $parametro["nombreSecretario"]; ?>, observador delegado del Tribunal de Ética Gubernamental <?php if($parametro["miembro1"] == "" AND $parametro["miembro3

      2"] == "" AND $parametro["miembro3"] == ""){}else{ ?> y en presencia de los miembros que conforman la Comisión Electoral Transitoria de la Municipalidad los Sres. <?php echo $parametro["miembro1"]; ?>, <?php echo $parametro["miembro2"]; ?> y <?php echo $parametro["miembro3"]; ?> <?php } ?>, para dar fe del proceso de elección del miembro(a) propietario(a) y su respectivo suplente, por parte de las empleadas y empleados de esta Municipalidad, los cuales son <?php echo strtolower($V->ValorEnLetras($toAfi["conteo"], '')); ?> de acuerdo al padrón electoral registrado. Y después de contabilizar los votos proporcionadas por el sistema para elección de miembros de comisiones de Ética Gubernamental, para las personas siguientes:

        <?php while ($candidatos = $con->arreglo($can)) {  ?>

          <b><?php echo $candidatos["primerNombre"]; ?> <?php echo $candidatos["segundoNombre"]; ?> <?php echo $candidatos["primerApellido"]; ?> <?php echo $candidatos["segundoApellido"]; ?> <?php echo $candidatos["apellidoCasada"]; ?></b>, de <?php echo strtolower(trim($V->ValorEnLetras(calculaedad($candidatos["fechaNac"]), ''))); ?> años de edad,<?php if ($candidatos["sexo"] == "MASCULINO") { echo " empleado"; } else if ($candidatos["sexo"] == "FEMENINO") { echo " Empleada"; } ?> con el cargo de <?php echo $candidatos["cargo"]; ?>, de este domicilio, de nacionalidad salvadoreña, con Documento Único de Identidad número



          <?php $dui1 = substr($candidatos["dui"], 0, 8);

          $dui2 = substr($candidatos["dui"], 9, 1);

          echo "cero " . strtolower(trim($V->ValorEnLetras($dui1, ''))) . " guión " . strtolower(trim($V->ValorEnLetras($dui2, ''))) . " (" . $candidatos["dui"] . ")";

          if ($candidatos["nit"] == "") { 

            echo "; "; 

          }  

          else 

          { 

            $nit1 = substr($candidatos["nit"], 0, 4);

            $nit2 = substr($candidatos["nit"], 5, 6);

            $nit3 = substr($candidatos["nit"], 12, 3);

            $nit4 = substr($candidatos["nit"], 16, 1);



            echo ", Número de Identificación Tributaria, " .  strtolower(trim($V->ValorEnLetras($nit1, ''))) . " guión " . strtolower(trim($V->ValorEnLetras($nit2, ''))) . " guión " . strtolower(trim($V->ValorEnLetras($nit3, ''))) . " guión " . strtolower(trim($V->ValorEnLetras($nit4, ''))) . " (" . $candidatos["nit"] . ");"; 

          }

           } ?>

        Da como resultado el siguiente: Votantes asistentes <?php echo strtolower(trim($V->ValorEnLetras($conteo["total"], ''))) ?> (<?php echo $conteo["total"]; ?>); abstenciones <?php echo strtolower(trim($V->ValorEnLetras($abstenciones["abstenciones"], ''))); ?> (<?php echo $abstenciones["abstenciones"]; ?>) y votos válidos <?php echo strtolower(trim($V->ValorEnLetras($totalGolbal["votos"], ''))); ?> (<?php echo $totalGolbal["votos"]; ?>); distribuidos así:



        <?php

        $da = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato, candidatos.foto FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id' AND votacion.id_depto = '$jornada[id_depa]' AND votacion.id_muni = '$jornada[id_muni]' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC");

        while ($dato = $con->arreglo($da)) {



          $can = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$dato[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.id_depa = '$jornada[id_depa]' AND candidatos.id_muni = '$jornada[id_muni]'");

          $datos = $con->arreglo($can);

          

          echo  "<b>". $datos["primerNombre"] . " " . $datos["segundoNombre"] . " " . $datos["primerApellido"] . " " . $datos["segundoApellido"] . " " . $datos["apellidoCasada"] . "</b>, " . strtolower(trim($V->ValorEnLetras($dato["total"], ''))) . " (" . $dato["total"] . ") votos; ";

        }



        ?> Por lo antes detallado y atendiendo al mayor número de votos a favor de cada candidata o candidato, se concluye: El miembro propietario electo por las empleadas y empleados de la Municipalidad de <?php echo $parametro["municipio"]; ?> para ser parte de la Comisión de Ética Gubernamental de la Municipalidad (CEG), es



        <?php $daa1 = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id' AND votacion.id_depto = '$jornada[id_depa]' AND votacion.id_muni = '$jornada[id_muni]' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC LIMIT 1");

        $datoss1 = $con->arreglo($daa1);



        $cann1 = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$datoss1[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.estado = 'Activo' AND candidatos.id_depa = '$jornada[id_depa]' AND candidatos.id_muni = '$jornada[id_muni]' ");

        $datosSS1 = $con->arreglo($cann1);



        echo "<b>" . $datosSS1["primerNombre"] . " " . $datosSS1["segundoNombre"] . " " . $datosSS1["primerApellido"] . " " . $datosSS1["segundoApellido"] . " " . $datosSS1["apellidoCasada"] . "</b>, quien obtuvo " . strtolower(trim($V->ValorEnLetras($datoss1["total"], ''))) . " (" . $datoss1["total"] . ") votos;"; ?> y como suplente para conformar dicha Comisión es



        <?php $daa2 = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id'  and 	votacion.id_depto='$jornada[id_depa]' and	votacion.id_muni='$jornada[id_muni]' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC LIMIT 1,1");

        $datoss2 = $con->arreglo($daa2);



        $cann2 = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$datoss2[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.estado = 'Activo' AND candidatos.id_depa = '$jornada[id_depa]' AND candidatos.id_muni = '$jornada[id_muni]' ");



        $datosSS2 = $con->arreglo($cann2);



        echo "<b>" . $datosSS2["primerNombre"] . " " . $datosSS2["segundoNombre"] . " " . $datosSS2["primerApellido"] . " " . $datosSS2["segundoApellido"] . " " . $datosSS2["apellidoCasada"] . "</b>, quien obtuvo " . strtolower(trim($V->ValorEnLetras($datoss2["total"], ''))) . " (" . $datoss2["total"] . ") votos."; ?> Quedando habilitados para una eventual sustitución, en su orden



        <?php $daa3 = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC LIMIT 2,1");

        $datoss3 = $con->arreglo($daa3);



        $cann3 = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.sexo FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$datoss3[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.estado = 'Activo' AND candidatos.id_depa = '$jornada[id_depa]' ANd candidatos.id_muni='$jornada[id_muni]'");

        $datosSS3 = $con->arreglo($cann3);



        echo "<b>" . $datosSS3["primerNombre"] . " " . $datosSS3["segundoNombre"] . " " . $datosSS3["primerApellido"] . " " . $datosSS3["segundoApellido"] . " " . $datosSS3["apellidoCasada"] . "</b>, quien obtuvo " . strtolower(trim($V->ValorEnLetras($datoss3["total"], ''))) . " (" . $datoss3["total"] . ") votos, "; ?> como primer <?php if ($datosSS3["sexo"] == "MASCULINO") { ?> sustituto; <?php } else { ?> sustituta;<?php } ?> y



          <?php $daa4 = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC LIMIT 3,1");

          $datoss4 = $con->arreglo($daa4);



          $cann4 = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.sexo FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$datoss4[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.estado = 'Activo' AND candidatos.id_depa = '$jornada[id_depa]' AND candidatos.id_muni = '$jornada[id_muni]'");

          $datosSS4 = $con->arreglo($cann4);



          echo "<b>" . $datosSS4["primerNombre"] . " " . $datosSS4["segundoNombre"] . " " . $datosSS4["primerApellido"] . " " . $datosSS4["segundoApellido"] . " " . $datosSS4["apellidoCasada"] . "</b>, quien obtuvo " . strtolower(trim($V->ValorEnLetras($datoss4["total"], ''))) . " (" . $datoss4["total"] . ") votos, "; ?> como segunda <?php if ($datosSS4["sexo"] == "MASCULINO") { ?> sustituto. <?php } else { ?> sustituta.<?php } ?> Y habiendo cumplido con lo establecido en el artículo treinta y cuatro del Reglamento de la Ley de Ética Gubernamental y no habiendo más que hacer constar, damos por finalizada la presente acta, que firmamos.

      </p>

    </div>

  </div>



  <div class="row">

    <div class="col text-center">

      <table cellpadding="0" cellspacing="0" class="table table-borderless">

        <tr class="text-center">

          <td colspan="2" class="text-center">&nbsp;</td>

          <td class="text-center">&nbsp;</td>

        </tr>

        <tr class="text-center">

          <td colspan="2" class="text-center">&nbsp;</td>

          <td class="text-center">&nbsp;</td>

        </tr>

        <tr class="text-center">

          <td colspan="2" class="text-center"><?php echo $parametro["nombreAlcalde"]; ?></td>

          <td class="text-center"><?php echo $parametro["observador"]; ?></td>

        </tr>

        <tr class="text-center">

          <td colspan="2" class="text-center"><?php echo $parametro["cargoAlcalde"]; ?></td>

          <td class="text-center"><?php echo $parametro["cargo_observador"]; ?></td>

        </tr>

        <tr class="text-center">

          <td colspan="2" class="text-center">&nbsp;</td>

          <td>&nbsp;</td>

        </tr>

        <tr class="text-center">

          <td colspan="2" class="text-center">&nbsp;</td>

          <td>&nbsp;</td>

        </tr>

        <tr class="text-center">

          <td class="text-center"><?php echo $parametro["miembro1"]; ?></td>

          <td class="text-center"><?php echo $parametro["miembro2"]; ?></td>

          <td class="text-center"><?php echo $parametro["miembro3"]; ?></td>

        </tr>

        <tr class="text-center">

          <td class="text-center"><?php echo $parametro["cargo1"]; ?></td>

          <td class="text-center"><?php echo $parametro["cargo2"]; ?></td>

          <td class="text-center"><?php echo $parametro["cargo3"]; ?></td>

        </tr>

      </table>

    </div>

  </div>

</body>

</html>