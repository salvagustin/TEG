<?php
ini_set( 'default_charset', 'UTF8' );
setlocale( LC_ALL, 'spanish' );
require "../php/conexion.php";
require "../seguro.php";
require "../php/numeroLetras.php";
$V = new EnLetras();

$id = base64_decode( $_GET[ 'id' ] );
$con = new cnn();

function calculaedad( $fechanacimiento ) 
{
  list( $ano, $mes, $dia ) = explode( "-", $fechanacimiento );
  $ano_diferencia = date( "Y" ) - $ano;
  $mes_diferencia = date( "m" ) - $mes;
  $dia_diferencia = date( "d" ) - $dia;
	
  if ( $dia_diferencia < 0 || $mes_diferencia < 0 ) 
  {
    $ano_diferencia--;
  }
  return $ano_diferencia;
}

$jor = $con->consulta( "SELECT fecha, horaDesde, horaHasta, periodoDesde, periodoHasta FROM jornadas  AND id_jornada = '$id'" );

$jornada = $con->arreglo( $jor );

$para = $con->consulta( "SELECT parametros.municipalidad, parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.nombreSecretario, parametros.cargoSecretario, parametros.telefono, parametros.direccion, parametros.correo, parametros.logo, parametros.miembro1, parametros.miembro2, parametros.miembro3, parametros.cargo1, parametros.cargo2, parametros.cargo3, parametros.observador, parametros.cargo_observador FROM parametros  WHERE parametros.eliminado = 0 " );

$parametro = $con->arreglo( $para );

$newDate = date( "d-m-Y", strtotime( $jornada[ "fecha" ] ) );
$fechaEleccion = strftime( "%B", strtotime( $newDate ) );

$cont = $con->consulta( "SELECT COUNT(id_votacion) AS total FROM votacion WHERE id_jornada = '$id' AND eliminado = 0 " );

$conteo = $con->arreglo( $cont );
$totalVotos = str_pad( $conteo[ "total" ], 3, "0", STR_PAD_LEFT );
$asis1 = substr( $totalVotos, 0, 1 );
$asis2 = substr( $totalVotos, 1, 1 );
$asis3 = substr( $totalVotos, 2, 1 );

$coo = $con->consulta( "SELECT COUNT(id) AS conteo FROM afiliados WHERE eliminado = 0 " );

$toAfi = $con->arreglo( $coo );


$can = $con->consulta( "SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.dui,   afiliados.sexo, candidatos.id_candidato, candidatos.edad, candidatos.domicilio FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_jornada = '$id' " );


$votNu = $con->consulta( "SELECT SUM(nulos) AS nulos FROM votacion WHERE id_jornada = '$id' " );

$nulos = $con->arreglo( $votNu );


$votAb = $con->consulta( "SELECT SUM(abstenciones) AS abstenciones FROM votacion WHERE id_jornada = '$id'" );

$abstenciones = $con->arreglo( $votAb );


$toV = $con->consulta( "SELECT SUM(voto) AS votos FROM votacion WHERE id_jornada = '$id'" );

$totalGolbal = $con->arreglo( $toV );

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
  <div class="col-2 text-center"> <img src="../parametros/logos/<?php echo $parametro["logo"]; ?>" width="81" height="91"> </div>
  <div class="col text-center">
    <h1>MUNICIPALIDAD DE ############ DEPARTAMENTO DE ######## </h1>
    <h2>ACTA DE ESCRUTINIO FINAL DE ELECCIÓN DE MIEMBROS PROPIETARIO Y SUPLENTE EN REPRESENTACIÓN DE LOS SERVIDORES PUBLICOS DE ########, ANTE LA COMISIÓN DE ÉTICA GUBERNAMENTAL.</h2>
  </div>
  <div class="col-2 text-center"> <img src="../plantilla/dist/img/Escudo.fw.png" width="81" height="91"> </div>
</div>
<div class="row">
  <div class="col">
    <p class="text-justify" style="font-size:24px">En las instalaciones de la Alcaldia Municipal de  ######### , departamento de ######## .a las <?php echo strtolower(@$V->ValorEnLetras(date("H", strtotime($jornada["horaHasta"])), '')); ?> horas
      <?php if (date("i", strtotime($jornada["horaHasta"])) <> 00) { echo "con " . strtolower(@$V->ValorEnLetras(date("i", strtotime($jornada["horaHasta"])), '')) . " minutos";} ?>
       del día <?php echo strtolower(trim(@$V->ValorEnLetras(date("d", strtotime($jornada["fecha"])), ''))); ?> <?php echo $fechaEleccion; ?> <?php echo strtolower(trim(@$V->ValorEnLetras(date("Y", strtotime($jornada["fecha"])), ''))); ?>, conforme a lo prescripto en el artículo 34 del Reglamento de la Ley de Ética Gubernamental, se procede a dejar constancia del escrutinio final del procedimiento de elección de los miembros propietario y suplente en representación de los empleados de la alcaldía municipal de ########### ante la Comisión de Ética Gubernamental. El evento electoral se realizó por medio del sistema para elección de miembros de comisiones de Ética Gubernamental Desarrollándose de la siguiente manera: I) Participaron como candidatos los servidores públicos siguientes: 
      <?php while ($candidatos = $con->arreglo($can)) {  ?>
      <b><?php echo $candidatos["primerNombre"]; ?> <?php echo $candidatos["segundoNombre"]; ?> <?php echo $candidatos["primerApellido"]; ?> <?php echo $candidatos["segundoApellido"]; ?> <?php echo $candidatos["apellidoCasada"]; ?></b>, de <?php echo @$V->ValorEnLetras($candidatos["edad"],''); ?> años de edad,
      <?php if ($candidatos["sexo"] == "MASCULINO") { echo " empleado"; } else if ($candidatos["sexo"] == "FEMENINO") { echo " Empleada"; } ?>
      con el cargo de ###########, del domicilio de <?php echo $candidatos["domicilio"]; ?>, de nacionalidad salvadoreña, con Documento Único de Identidad número
      <?php
      $dui1 = substr( $candidatos[ "dui" ], 0, 8 );
      $dui2 = substr( $candidatos[ "dui" ], 9, 1 );

      echo "cero " . strtolower( trim( @$V->ValorEnLetras( $dui1, '' ) ) ) . " guión " . strtolower( trim( @$V->ValorEnLetras( $dui2, '' ) ) );

    

      }
      ?>
      II) El dato del escrutinio final refleja que concurrieron a emitir su voto <?php echo strtolower(trim(@$V->ValorEnLetras($conteo["total"], ''))) ?> servidores públicos de la municipalidad. Una vez cerrada la elección y contabilizados los votos por medio del sistema mencionado, se obtuvieron los resultados siguientes: Número de abstenciones <?php echo strtolower(trim(@$V->ValorEnLetras($abstenciones["abstenciones"], ''))); ?>, mientras que los votos por persona determinada fueron distribuidos de la siguiente manera:
      
      <?php

      $da = $con->consulta( "SELECT SUM(votacion.voto) AS total, votacion.id_candidato, candidatos.foto FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id'  GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC" );

      while ( $dato = $con->arreglo( $da ) ) {


        $can = $con->consulta( "SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$dato[id_candidato]' AND candidatos.eliminado = 0 " );

        $datos = $con->arreglo( $can );


        echo "<b>" . $datos[ "primerNombre" ] . " " . $datos[ "segundoNombre" ] . " " . $datos[ "primerApellido" ] . " " . $datos[ "segundoApellido" ] . " " . $datos[ "apellidoCasada" ] . "</b>, obtuvo " . strtolower( trim( @$V->ValorEnLetras( $dato[ "total" ], '' ) ) ) . " votos. ";

      }
      ?>
      Por lo antes detallado se concluye que ha existido empate en la elección, es decir, dos personas obtuvieron la misma cantidad de votos para el cargo de miembro suplente ante la Comisión de Ética Gubernamental en representación de los servidores públicos, debiendo proceder conforme a lo establecido en el art. 33 número 4 del Reglamento de la Ley de Ética Gubernamental que literalmente expone “en caso de empate se realizará un nuevo procedimiento de elección en el que únicamente participarán los candidatos que hayan obtenido el mayor número de votos, con el fin de definir el propietario y el suplente; observando en lo pertinente las reglas del numeral anterior. Si existiere empate en el segundo número mayor de votos, se determinará el segundo y el tercer lugar en la forma indicada”, quedando a discreción la persona delegada para coordinar el proceso eleccionario la manera en realizar el procedimiento anteriormente descrito. La presente acta será firmada por <?php echo $parametro["nombreAlcalde"]; ?> <?php echo $parametro["cargoAlcalde"]; ?>, por ser la persona que ha sido delegada para que se encargue de coordinar el proceso eleccionario anteriormente descrito y por <?php echo $parametro["observador"]; ?> por ser el observador designado por parte del Tribunal de Ética Gubernamental. No habiendo nada más que hacer constar damos por cerrada la presente acta y firmamos. </p>
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