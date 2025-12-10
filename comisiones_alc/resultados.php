<?php
ini_set('default_charset', 'UTF8');
require("seguro.php");
require("php/conexion.php");
$con = new cnn();

$id = base64_decode($_GET['id']);

$jo = $con->consulta("SELECT id_jornada, periodoDesde, periodoHasta FROM jornadas WHERE id_jornada = '$id' AND eliminado = 0");
$jornada = $con->arreglo($jo);

?>
<!DOCTYPE html>
<html lang="en">

<head>
  <?php include("head.php"); ?>
  <style type="text/css">
    .highcharts-figure,
    .highcharts-data-table table {
      min-width: 310px;
      max-width: 800px;
      margin: 1em auto;
    }

    #container {
      height: 400px;
    }

    .highcharts-data-table table {
      font-family: Verdana, sans-serif;
      border-collapse: collapse;
      border: 1px solid #f7f7f7;
      margin: 10px auto;
      text-align: center;
      width: 100%;
      max-width: 500px;
    }

    .highcharts-data-table caption {
      padding: 1em 0;
      font-size: 1.2em;
      color: #f7f7f7;
    }

    .highcharts-data-table th {
      font-weight: 600;
      padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
      padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
      background: #f7f7f7;
    }

    .highcharts-data-table tr:hover {
      background: #f7f7f7;
    }
  </style>
  <script src="plantilla/highcharts/code/highcharts.js"></script>
  <script src="plantilla/highcharts/code/modules/data.js"></script>
  <script src="plantilla/highcharts/code/modules/drilldown.js"></script>
  <script src="plantilla/highcharts/code/modules/exporting.js"></script>
  <script src="plantilla/highcharts/code/modules/export-data.js"></script>
  <script src="plantilla/highcharts/code/modules/accessibility.js"></script>
</head>
<section class="content">
      <div class="container-fluid">
        <!-- Small boxes (Stat box) -->
        <div class="row">
          <?php include("roles/agregarRol.php"); ?>
        </div>
        <!-- /.row --> 
        <!-- Main row -->
   
        <!-- /.row (main row) -->
      </div><!-- /.container-fluid -->
    </section>
<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <!-- Navbar -->
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
    <!-- /.navbar -->
    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
      <?php include("aside.php"); ?>
    </aside>
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">Resultado de las elecciones</h1>
            </div><!-- /.col -->
            <div class="col-sm-6">
              <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                <li class="breadcrumb-item active">Resultados</li>
              </ol>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-lg-6">
              <figure class="highcharts-figure">
                <div id="containers"></div>
              </figure>
            </div>
            <div class="col-lg-6">
              <figure class="highcharts-figure">
                <div id="container"></div>
              </figure>
            </div>
          </div>
        </div>
      </div>
      <div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Resultado de la elección</h3>
                </div>
                <div class="card-body p-0">
                  <table class="table table-striped projects table-hover">
                    <thead>
                      <tr>
                        <th>
                          Imagen
                        </th>
                        <th>
                          Candidato
                        </th>
                        <th class="text-center">
                          Total de votos
                        </th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $da = $con->consulta("SELECT SUM(votacion.voto) AS total, votacion.id_candidato, candidatos.foto FROM votacion INNER JOIN candidatos ON votacion.id_candidato = candidatos.id_candidato WHERE votacion.id_jornada = '$id' GROUP BY votacion.id_candidato ORDER BY total DESC, votacion.id_candidato ASC");
                      while ($dato = $con->arreglo($da)) {
                      ?>
                        <tr>
                          <td>
                            <ul class="list-inline">
                              <li class="list-inline-item">
                                <img alt="Avatar" class="table-avatar" src="candidatos/fotos/<?php echo $dato["foto"]; ?>">
                              </li>
                            </ul>
                          </td>
                          <td>
                            <?php $can = $con->consulta("SELECT afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.id_candidato = '$dato[id_candidato]' AND candidatos.eliminado = 0 AND candidatos.estado = 'Activo'");
                            $datos = $con->arreglo($can); ?>
                            <?php echo $datos["primerNombre"]; ?> <?php echo $datos["segundoNombre"]; ?> <?php echo $datos["primerApellido"]; ?> <?php echo $datos["segundoApellido"]; ?> <?php echo $datos["apellidoCasada"]; ?>
                          </td>
                          <td class="project-state">
                            <a class="btn  btn-lg" href="#">
                              <?php echo $dato["total"]; ?>
                            </a>
                          </td>
                          <td class="project-state">
                         <!-- <a href="<?php // echo "javascript:editar('scrutinio/ver_votantes.php?id=$dato[id_candidato]',870,450)";?>" class="btn btn-success" title="Editar Datos"><i class="fas fa-eye "></i> </a> -->
                          </td>
                        </tr>
                      <?php
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Main Footer -->
    <footer class="main-footer text-justify">
      <?php include "pie.php"; ?>
    </footer>
  </div>
  <?php include("footer.php"); ?>
  <script type="text/javascript">
    // Create the chart
    Highcharts.chart('container', {
      chart: {
        type: 'column'
      },
      title: {
        text: 'Elecciones de CEG Período <?php echo date('Y', strtotime($jornada['periodoDesde']));  ?> - <?php echo date('Y', strtotime($jornada['periodoHasta']));  ?> '
      },
      accessibility: {
        announceNewData: {
          enabled: true
        }
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        title: {
          text: 'Total de votos'
        }

      },
      legend: {
        enabled: false
      },
      plotOptions: {
        series: {
          borderWidth: 0,
          dataLabels: {
            enabled: true,
            format: '{point.y:.0f}'
          }
        }
      },

      tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.0f}</b> votos en total<br/>'
      },

      series: [{
        name: "Candidato",
        colorByPoint: true,
        data: [
          <?php
          $can = $con->consulta("SELECT afiliados.primerNombre, afiliados.primerApellido, candidatos.id_candidato FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.estado = 'Activo' AND candidatos.eliminado = 0 AND candidatos.id_jornada = '$id'");
          while ($candi = $con->arreglo($can)) {
          ?> {
              name: "<?php echo $candi['primerNombre']; ?> <?php echo $candi['primerApellido']; ?>",
              <?php
              $vo = $con->consulta("SELECT SUM(voto) AS total FROM votacion WHERE id_jornada = '$id' AND id_candidato = '$candi[id_candidato]' AND eliminado = 0");
              $voto = $con->arreglo($vo);
              ?>
              y: <?php if($voto['total'] != '' ){ echo $voto['total']; } else { echo 0; } ?>,
              drilldown: "<?php echo $candi['primerNombre']; ?> <?php echo $candi['primerApellido']; ?>"
            },
          <?php
          }
          ?>
          {
            name: "Abstenciones",
            y: <?php $abs = $con->consulta("SELECT SUM(abstenciones) AS total FROM votacion WHERE id_jornada = '$id' AND eliminado = 0"); $asten = $con->arreglo($abs); echo $asten['total']; ?>,
            drilldown: "Abstenciones"
          },
        ]
      }],
    });
  </script>
  <script type="text/javascript">
    Highcharts.chart('containers', {
      chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
      },
      title: {
        text: 'Elecciones de CEG Período <?php echo date('Y', strtotime($jornada['periodoDesde']));  ?> - <?php echo date('Y', strtotime($jornada['periodoHasta']));  ?>'
      },
      tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
      },
      accessibility: {
        point: {
          valueSuffix: '%'
        }
      },
      plotOptions: {
        pie: {
          allowPointSelect: true,
          cursor: 'pointer',
          dataLabels: {
            enabled: true,
            format: '<b>{point.name}</b>: {point.percentage:.1f} %'
          }
        }
      },
      series: [{ 
        name: 'Votos',
        colorByPoint: true,
        data: [
          <?php
          $can = $con->consulta("SELECT afiliados.primerNombre, afiliados.primerApellido, candidatos.id_candidato FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id WHERE candidatos.estado = 'Activo' AND candidatos.eliminado = 0 AND candidatos.id_jornada = '$id'");
          while ($candi = $con->arreglo($can)) {
          ?> {
              name: '<?php echo $candi['primerNombre']; ?> <?php echo $candi['primerApellido']; ?>',
              <?php
              $vo = $con->consulta("SELECT SUM(voto) AS total FROM votacion WHERE id_jornada = '$id' AND id_candidato = '$candi[id_candidato]' AND eliminado = 0");
              $voto = $con->arreglo($vo);
              ?>
              y: <?php if ($voto['total'] != '') {echo $voto['total'];} else {echo 0;}?>
            },
          <?php
          }
          ?>
          {
            name: 'Abstenciones',
            y: <?php $abs = $con->consulta("SELECT SUM(abstenciones) AS total FROM votacion WHERE id_jornada = '$id' AND eliminado = 0"); $asten = $con->arreglo($abs); echo $asten['total']; ?>
        },
        ]   
      }]
    });
  </script>
</body>

</html>