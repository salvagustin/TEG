<?php
ini_set('default_charset', 'UTF8');
require("seguro.php");
require("php/conexion.php");
require __DIR__ . '/config.php';
require PHP_PATH . 'session_timeout.php';

$con = new cnn();

// --- LÓGICA DEL FILTRO ---
$id_jornada_filtro = isset($_GET['id_jornada']) ? $_GET['id_jornada'] : '';

// 1. Obtener todas las jornadas para el select del filtro
$sql_jornadas = "SELECT id_jornada, descripcion FROM jornadas WHERE eliminado IS NULL OR eliminado != 'si' ORDER BY fecha DESC";
$res_jornadas = $con->consulta($sql_jornadas);

// 2. Construir la condición SQL según el filtro
$where_votos = "";
$where_jornada = "";
if ($id_jornada_filtro != '') {
    $where_votos = " WHERE v.id_jornada = '$id_jornada_filtro' ";
    $where_jornada = " WHERE id_jornada = '$id_jornada_filtro' ";
}

// --- CONSULTAS PARA TARJETAS ---
// Total Afiliados
$q_af = $con->consulta("SELECT COUNT(*) as total FROM afiliados WHERE eliminado IS NULL OR eliminado != 'si'");
$d_af = $con->arreglo($q_af);
$totalAfiliados = $d_af['total'];

// Total Votos (Filtrado)
$q_vo = $con->consulta("SELECT SUM(voto) as total FROM votacion v $where_votos");
$d_vo = $con->arreglo($q_vo);
$totalVotos = $d_vo['total'] ?? 0;

// Total Candidatos (Filtrado por jornada si aplica)
$sql_cand = "SELECT COUNT(*) as total FROM candidatos $where_jornada";
$q_ca = $con->consulta($sql_cand);
$d_ca = $con->arreglo($q_ca);
$totalCandidatos = $d_ca['total'];

// --- DATOS PARA GRÁFICO Y TABLA ---
$sql_ranking = "SELECT 
                    SUM(v.voto) as votos, 
                    CONCAT(a.primerNombre, ' ', a.primerApellido) as nombre_completo
                FROM votacion v
                INNER JOIN candidatos c ON v.id_candidato = c.id_candidato
                INNER JOIN afiliados a ON c.id_afiliado = a.id
                $where_votos
                GROUP BY v.id_candidato
                ORDER BY votos DESC";

$res_ranking = $con->consulta($sql_ranking);

$labels = [];
$dataVotos = [];
$ranking_tabla = [];

while ($row = $con->arreglo($res_ranking)) {
    $labels[] = $row['nombre_completo'];
    $dataVotos[] = (int)$row['votos'];
    $ranking_tabla[] = $row;
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <?php include("head.php"); ?>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .small-box { transition: transform .3s; }
        .small-box:hover { transform: scale(1.03); }
    </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="salir.php"><i class="fas fa-sign-out-alt"></i> Salir</a></li>
            </ul>
        </nav>

        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <?php include("aside.php"); ?>
        </aside>

        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2 align-items-center">
                        <div class="col-sm-6">
                            <h1 class="m-0 text-dark">Dashboard Estadístico</h1>
                        </div>
                        <div class="col-sm-6 text-right">
                            <form method="GET" action="" class="form-inline float-right">
                                <label class="mr-2">Filtrar Jornada:</label>
                                <select name="id_jornada" class="form-control form-control-sm" onchange="this.form.submit()">
                                    <option value="">-- Todas las Jornadas --</option>
                                    <?php 
                                    // Reiniciar puntero de jornadas para el select
                                    mysqli_data_seek($res_jornadas, 0);
                                    while($jor = $con->arreglo($res_jornadas)): ?>
                                        <option value="<?php echo $jor['id_jornada']; ?>" <?php echo ($id_jornada_filtro == $jor['id_jornada']) ? 'selected' : ''; ?>>
                                            <?php echo $jor['descripcion']; ?>
                                        </option>
                                    <?php endwhile; ?>
                                </select>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <section class="content">
                <div class="container-fluid">
                    
                    <div class="row">
                        <div class="col-lg-4 col-6">
                            <div class="small-box bg-info shadow">
                                <div class="inner"><h3><?php echo $totalAfiliados; ?></h3><p>Afiliados Totales</p></div>
                                <div class="icon"><i class="fas fa-users"></i></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-6">
                            <div class="small-box bg-success shadow">
                                <div class="inner"><h3><?php echo $totalVotos; ?></h3><p>Votos Contabilizados</p></div>
                                <div class="icon"><i class="fas fa-check-double"></i></div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-12">
                            <div class="small-box bg-warning shadow">
                                <div class="inner"><h3><?php echo $totalCandidatos; ?></h3><p>Candidatos Jornada</p></div>
                                <div class="icon"><i class="fas fa-user-tie"></i></div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="card card-primary card-outline shadow">
                                <div class="card-header border-0">
                                    <h3 class="card-title text-bold">Visualización de Votos</h3>
                                </div>
                                <div class="card-body">
                                    <canvas id="canvasVotos" style="min-height: 350px; height: 350px; max-height: 350px;"></canvas>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card shadow">
                                <div class="card-header bg-dark">
                                    <h3 class="card-title text-bold">Ranking</h3>
                                </div>
                                <div class="card-body p-0">
                                    <table class="table table-striped table-valign-middle">
                                        <thead>
                                            <tr>
                                                <th>Candidato</th>
                                                <th>Votos</th>
                                                <th>%</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php 
                                            foreach($ranking_tabla as $r): 
                                                $perc = ($totalVotos > 0) ? ($r['votos'] / $totalVotos) * 100 : 0;
                                            ?>
                                            <tr>
                                                <td><?php echo $r['nombre_completo']; ?></td>
                                                <td><span class="badge bg-primary px-2"><?php echo $r['votos']; ?></span></td>
                                                <td><?php echo round($perc, 1); ?>%</td>
                                            </tr>
                                            <?php endforeach; ?>
                                            <?php if(count($ranking_tabla) == 0) echo "<tr><td colspan='3' class='text-center'>No hay datos</td></tr>"; ?>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>

        <footer class="main-footer"><?php include "pie.php"; ?></footer>
    </div>

    <?php include("footer.php"); ?>

    <script>
    $(function () {
        var ctx = document.getElementById('canvasVotos').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: <?php echo json_encode($labels); ?>,
                datasets: [{
                    label: 'Votos',
                    data: <?php echo json_encode($dataVotos); ?>,
                    backgroundColor: 'rgba(54, 162, 235, 0.6)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 2,
                    borderRadius: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                indexAxis: 'y', 
                plugins: { legend: { display: false } },
                scales: {
                    x: { 
                        beginAtZero: true, 
                        grid: { display: false },
                        // --- CONFIGURACIÓN PARA NÚMEROS ENTEROS ---
                        ticks: {
                            stepSize: 1,      // Fuerza a que los saltos sean de 1 en 1
                            precision: 0,     // Elimina los decimales del formato
                            callback: function(value) {
                                if (value % 1 === 0) { return value; } // Solo muestra si es entero
                            }
                        }
                    },
                    y: { 
                        grid: { display: false } 
                    }
                }
            }
        });
    });
    </script>
</body>
</html>