<?php
ini_set('default_charset', 'UTF8');
setlocale(LC_ALL, 'spanish');

require "../php/conexion.php";
require "../seguro.php";
require "../php/numeroLetras.php";
$V = new EnLetras();

$id = base64_decode($_GET['id']);
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

$jor = $con->consulta("SELECT  fecha, horaDesde, horaHasta, periodoDesde, periodoHasta FROM jornadas WHERE  id_jornada = '$id'");
$jornada = $con->arreglo($jor);

$para = $con->consulta("SELECT  parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.nombreSecretario, parametros.cargoSecretario, parametros.telefono, parametros.direccion, parametros.correo, parametros.logo, parametros.miembro1, parametros.miembro2, parametros.miembro3, parametros.cargo1, parametros.cargo2, parametros.cargo3 FROM parametros");

$parametro = $con->arreglo($para);


//$newDate = date("d-m-Y", strtotime($jornada["fecha"]));
//$fechaEleccion = strftime("%d de %B del año %Y", strtotime($newDate));
$newDate = date( "d-m-Y", strtotime( $jornada[ "fecha" ] ) );
$fechaEleccion = strftime( "%B", strtotime( $newDate ) );

// $dia = date("d", $newDate);
// $diaL = trim($V->ValorEnLetras($dia, ''));

$mes = strftime("%B", strtotime($newDate));

 //$mesL = trim($V->ValorEnLetras($mes, ''));
// $ano = date("Y", $newDate);
// $anoL = trim($V->ValorEnLetras($ano, ''));
$cont = $con->consulta("SELECT COUNT(id_votacion) AS total FROM votacion WHERE id_jornada = '$id' ");
$conteo = $con->arreglo($cont);

$totalVotos = str_pad($conteo["total"], 3, "0", STR_PAD_LEFT);
$asis1 = substr($totalVotos, 0, 1);
$asis2 = substr($totalVotos, 1, 1);
$asis3 = substr($totalVotos, 2, 1);

?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Votaciones ACE</title>
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
  <link href="plantilla/dist/img/LogoESA.png" rel="shortcut icon" type="image/vnd.microsoft.icon">
</head>

<body onload="window.print()">
  <div class="row">
    <div class="col-2 text-center">
      <img src="../plantilla/dist/img/LogoAzul.png" width="81" height="91">
    </div>
    <div class="col text-center">
      <h1>ACTA DE CIERRE Y ESCRUTINIO</h1>
        <h4>ELECCIÓN DE LOS INTEGRANTES PROPIETARIO Y SUPLENTE DE LA COMISIÓN DE ÉTICA GUBERNAMENTAL, POR PARTE DE LOS EMPLEADOS Y EMPLEADAS DE LA  AGENCIA DE CIBERSEGURIDAD DEL ESTADO</h4>
    </div>
    <div class="col-2 text-center">
      <img src="../plantilla/dist/img/ACEAzul.png" width="81" height="91">
    </div>
  </div>
  <div class="row" style="border: 1px solid #007bff;">
    <div class="col text-center" style="border: 1px solid #007bff;">
      <h2>JRV N° 1</h2>
    </div>
  </div>
  <div class="row">
    <div class="col" style="border: 1px solid #007bff;">
      <?php echo strtolower(trim(@$V->ValorEnLetras(date("d", strtotime($jornada["fecha"])), ' '))); ?> de
      <?php echo $fechaEleccion; ?> de 
	    <?php echo strtolower(trim(@$V->ValorEnLetras(date("Y", strtotime($jornada["fecha"])), ' '))); ?>
      . Se da por finalizada la votación para la elección del miembro (a) propietario (a) suplente de la Comisión de Ética Gubernamental de la AGENCIA DE CIBERSEGURIDAD DEL ESTADO, por parte de las empleadas y los empleados de la misma. Se registraron en el sistema
      <?php echo strtolower( trim( $V->ValorEnLetras(  $conteo[ "total" ], '' ) ) ) . " votos. ";?> La votación se desarrolló con normalidad no suscitándose ningún inconveniente. Al realizar el escrutinio correspondiente se obtuvo el siguiente resultado:</p>
    </div>
  </div>

  <div class="row">
    <div class="col table-responsive">
        <table class="table table-borderless table-sm">
        <thead>
          <th class="text-center">VOTOS VÁLIDOS</th>
       
        </thead>
        <tr>
          <th>Nombre</th>
          <th class="text-center">Cargo</th>
          <th colspan="3" class="text-center">Cifra en números</th>
          <th colspan="3" class="text-center">Cifra en letras</th>
          <tbody>
            <?php $da = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, candidatos.id_candidato FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_jornada = '$id' ");
            while ($dato = $con->arreglo($da)) {
              $vo = $con->consulta("SELECT SUM(voto) AS votos FROM votacion WHERE id_jornada = '$id' AND id_candidato = '$dato[id_candidato]' AND votacion.voto = 1 ");
              $votos = $con->arreglo($vo);

              $totalVotoss = str_pad($votos["votos"], 3, "0", STR_PAD_LEFT);
              $votCan1 = substr($totalVotoss, 0, 1);
              $votCan2 = substr($totalVotoss, 1, 1);
              $votCan3 = substr($totalVotoss, 2, 1);
            ?>
              <tr>
                <td style="border: 1px solid #007bff;"><?php echo $dato["primerNombre"]; ?> <?php echo $dato["segundoNombre"]; ?> <?php echo $dato["primerApellido"]; ?> <?php echo $dato["segundoApellido"]; ?> <?php echo $dato["apellidoCasada"]; ?></td>
                <td align="center" style="border: 1px solid #007bff;"><?php echo $votCan1; ?></td>
                <td align="center" style="border: 1px solid #007bff;"><?php echo $votCan2; ?></td>
                <td align="center" style="border: 1px solid #007bff;"><?php echo $votCan3; ?></td>
                <td align="center" style="border: 1px solid #007bff;" class="text-center"><?php echo strtoupper(trim($V->ValorEnLetras($votCan1, ''))); ?></td>
                <td align="center" style="border: 1px solid #007bff;" class="text-center"><?php echo strtoupper(trim($V->ValorEnLetras($votCan2, ''))); ?></td>
                <td align="center" style="border: 1px solid #007bff;" class="text-center"><?php echo strtoupper(trim($V->ValorEnLetras($votCan3, ''))); ?></td>
              </tr>
            <?php } ?>
            
            <tr>
             <?php $votAb = $con->consulta("SELECT SUM(abstenciones) AS abstenciones FROM votacion ");
             $abstenciones = $con->arreglo($votAb);
             $totaAbs = str_pad($abstenciones["abstenciones"], 3, "0", STR_PAD_LEFT);
             $votAbs1 = substr($totaAbs, 0, 1);
             $votAbs2 = substr($totaAbs, 1, 1);
             $votAbs3 = substr($totaAbs, 2, 1);
             ?>       
              <td colspan="2" style="border: 1px solid #007bff;">ABSTENCIONES</td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votAbs1; ?></td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votAbs2; ?></td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votAbs3; ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votAbs1, ''))); ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votAbs2, ''))); ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votAbs3, ''))); ?></td>  
            <tr>
              <?php
              //$totalOtros = $abstenciones["abstenciones"] + $nulos["nulos"];
			  $totalOtros = $abstenciones["abstenciones"] ;
              $totaVotros = str_pad($totalOtros, 3, "0", STR_PAD_LEFT);
              $votOtros1 = substr($totaVotros, 0, 1);
              $votOtros2 = substr($totaVotros, 1, 1);
              $votOtros3 = substr($totaVotros, 2, 1);
              ?>
            
            <tr>
              <?php
              $toV = $con->consulta("SELECT SUM(voto) AS votos FROM votacion WHERE id_jornada = '$id' AND voto = 1 ");
              $totalGolbal = $con->arreglo($toV);
              $totalGrall =$abstenciones["abstenciones"] + $totalGolbal["votos"];
              $totaVotoss = str_pad($totalGrall, 3, "0", STR_PAD_LEFT);
              $votCann1 = substr($totaVotoss, 0, 1);
              $votCann2 = substr($totaVotoss, 1, 1);
              $votCann3 = substr($totaVotoss, 2, 1);
              ?>
              <td colspan="2" style="border: 1px solid #007bff;">TOTAL DE VOTOS VÁLIDOS</td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votCann1; ?></td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votCann2; ?></td>
              <td align="center" style="border: 1px solid #007bff;"><?php echo $votCann3; ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votCann1, ''))); ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votCann2, ''))); ?></td>
              <td align="center" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votCann3, ''))); ?></td>
            </tr>
            <!--<tr>
              <th align="left" scope="row">OTROS VOTOS</th>
              <td>&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
            </tr>-->
            
            
              <!-- <td colspan="2" style="border: 1px solid #007bff;">TOTAL DE OTROS VOTOS</td> -->
              <!--<td class="text-center" style="border: 1px solid #007bff;"><?php echo $votOtros1; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $votOtros2; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $votOtros3; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votOtros1, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votOtros2, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($votOtros3, ''))); ?></td> -->
            </tr>
            <tr>
              <th align="left" scope="row"></th>
              <td>&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
            </tr>
<!--            <tr>
              <td colspan="2" style="border: 1px solid #007bff;">TOTAL DE PAPELETAS ENTREGADAS A VOTANTES</td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $asis1; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $asis2; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $asis3; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis1, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis2, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis3, ''))); ?></td>
            </tr>-->
            <!-- <tr>
              <td colspan="2" style="border: 1px solid #007bff;">VOTOS INUTILIZADAS</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
            </tr>
            <tr>
              <td colspan="2" style="border: 1px solid #007bff;">VOTOS NO UTILIZADAS</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">0</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
              <td class="text-center" style="border: 1px solid #007bff;">CERO</td>
            </tr> -->
            <tr>
              <th align="left" scope="row"></th>
              <td>&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
            </tr>
            <!--            <tr>
              <td colspan="2" style="border: 1px solid #007bff;">TOTAL DE PAPELETAS RECIBIDAS POR LA JRV</td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php /*echo $asis1; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $asis2; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo $asis3; ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis1, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis2, ''))); ?></td>
              <td class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis3, '')));*/ ?></td>
            </tr>-->
            <tr>
              <th align="left" scope="row">&nbsp;</th>
              <td>&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
            </tr>
            <tr>
              <th colspan="2" style="border: 1px solid #007bff;">TOTAL DE VOTANTES REGISTRADOS EN EL SISTEMA<br>(Según datos estadisticos del sistema)</th>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo $asis1; ?></td>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo $asis2; ?></td>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo $asis3; ?></td>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis1, ''))); ?></td>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis2, ''))); ?></td>
              <td valign="middle" class="text-center" style="border: 1px solid #007bff;"><?php echo strtoupper(trim($V->ValorEnLetras($asis3, ''))); ?></td>
            </tr>
            <tr>
              <th align="left" scope="row">&nbsp;</th>
              <td>&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
              <td align="center" class="text-center">&nbsp;</td>
            </tr>
            <tr>
              <th colspan="5" rowspan="4" align="left" style="border: 1px solid #007bff;" scope="row">Observaciones:</th>
              <td colspan="3" align="center" class="text-center" style="border-left-color: #007bff; border-right-color: #007bff; border-top-color: #007bff; border-left-style: solid; border-right-style: solid; border-top-style: solid; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3" align="center" class="text-center" style="border-left-color: #007bff; border-right-color: #007bff; border-left-style: solid; border-right-style: solid; border-left-width: 1px; border-right-width: 1px;">Sello</td>
            </tr>
            <tr>
              <td colspan="3" align="center" class="text-center" style="border-left-color: #007bff; border-right-color: #007bff; border-left-style: solid; border-right-style: solid; border-left-width: 1px; border-right-width: 1px;">&nbsp;</td>
            </tr>
            <tr>
              <td colspan="3" align="center" class="text-center" style="border-left-color: #007bff; border-right-color: #007bff; border-bottom-color: #007bff; border-left-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-width: 1px; border-right-width: 1px; border-bottom-width: 1px;">&nbsp;</td>
            </tr>
            <tr>
              <th scope="row">
                <p>&nbsp;</p>
              </th>
              <td colspan="3" align="center">
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </td>
              <td align="center">
                <p>&nbsp;</p>
              </td>
              <td colspan="3" align="center" class="text-center">
                <p>&nbsp;</p>
                <p>&nbsp;</p>
              </td>
            </tr>
            <tr>
              <td scope="row">
                <br><br><br>
                <p><?php echo $parametro["miembro1"]; ?></p>
                 <p style="margin:-2.5% 0;"> <?php echo $parametro["cargo1"]; ?></p>
              </td>
              <td colspan="3" align="center">
                <p><?php echo $parametro["miembro2"]; ?></p>
                <p style="margin:-2.5% 0;"> <?php echo $parametro["cargo2"]; ?></p>
              </td>
              <td align="center">
                <p>&nbsp;</p>
              </td>
              <td colspan="3" align="center" class="text-center">
                <br><br><br>
                <p><?php echo $parametro["miembro3"]; ?></p>
                <p style="margin:-2.5% 0;"><?php echo $parametro["cargo3"]; ?></p>
              </td>
            </tr>
          </tbody>
      </table>
    </div>
  </div>
</body>
</html>