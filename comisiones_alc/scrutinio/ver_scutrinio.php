<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require "../seguro.php";
$fecha = date('Y-m-d');
$hora = date('H:i:s');
$con = new cnn();
?>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script> 
<script type="application/javascript">

function showAlert(){
Swal.fire({
  icon: 'error',
  title: '¡No existe votos a favor de ninguno candidato en la jornada de votación!',

})
}

</script>
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Jornadas de votación</h3>
    <div class="text-right">
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <table id="candidatos" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Periodo</th>
          <th>Cantidad de candidatos</th>
          <th>Fecha de elección</th>
          <th>Resultados</th>
        </tr>
      </thead>
      <tbody>
        <?php
          if($_SESSION["rol"] == "Super")
          {
            $sql = $con->consulta("SELECT jornadas.periodoDesde, jornadas.periodoHasta, jornadas.fecha, jornadas.id_jornada FROM jornadas  ORDER BY jornadas.id_jornada DESC");
          }
          else
          {
            $sql = $con->consulta("SELECT jornadas.periodoDesde, jornadas.periodoHasta, jornadas.fecha, jornadas.id_jornada FROM jornadas  ORDER BY jornadas.id_jornada DESC");
          }
        
          while ($ver = $con->arreglo($sql)) 
          { $id = base64_encode($ver["id_jornada"]);
        ?>
          <tr>
            <td>
              <?php echo date('m/Y', strtotime($ver["periodoDesde"])); ?> al <?php echo date('m/Y', strtotime($ver["periodoHasta"])); ?>
            </td>
            <td class="text-center">
              <?php $candi = $con->consulta("SELECT	id_candidato FROM	candidatos WHERE id_jornada = '$ver[id_jornada]'");  $conte=$con->conteo($candi); ?>
              <?php echo $conte; ?> </td>
            <td><?php echo date('d/m/Y', strtotime($ver["fecha"]));?></td>
            <td>
              <?php 
                $conte = $con->consulta("SELECT COUNT(id_votacion) AS total FROM votacion WHERE id_jornada = '$ver[id_jornada]' ");
                $conteo = $con->arreglo($conte);                 
                if($conteo["total"] == 0)
                { 
              ?>
              <div class="container mt-2">
                <button type="button" class="btn btn-primary" >No existe votos a favor de ninguno candidato en la jornada de votación</button>
              </div>
              <?php 
                }
                else
                {
                  $jorn = $con->consulta("SELECT id_jornada FROM jornadas WHERE id_jornada = '$ver[id_jornada]' AND estado = 'Activo' AND fecha = '$fecha' AND '$hora' BETWEEN horaDesde AND horaHasta");
                  if($con->conteo($jorn) == 1)
                  { 
              ?>
                <a href="<?php echo "resultados.php?id=$id";?>" class="btn btn-success"><i class="fas fa-eye "></i> Ver resultados</a>
              <?php      
                  }
                  else
                  {
              ?>
                <a href="<?php echo "resultados.php?id=$id";?>" class="btn btn-success"><i class="fas fa-eye "></i> Ver resultados</a>
                <a href="<?php echo "scrutinio/generarActa.php?id=$id";?>" class="btn btn-primary" target="_blank"><i class="fas fa-file-download"></i> Acta de escrutinio</a>
              
              <!--- Validacion de ganadores---->
              <?php 
                $vo = $con->consulta("SELECT MAX(totalSalary) maxSalary , id FROM( SELECT id_candidato as id , SUM(voto) AS totalSalary FROM votacion WHERE id_jornada = '$ver[id_jornada]' GROUP BY votacion.id_candidato) AS tempTable ");
                $conteo = $con->arreglo($vo);
                $mayor = $conteo["maxSalary"];

                $bus1 = $con->consulta("SELECT count(DISTINCT votos) as votos FROM vista_votos WHERE id_jornada = '$ver[id_jornada]'");
                $ver2 = $con->arreglo($bus1);
                if($ver2['votos'] <> 1)
                {
                  echo "<a class='btn btn-info' href='scrutinio/generarActaFinal.php?id=$id' target='_blank'><i class='fas fa-file-download'></i> Acta de ganador de miembro propietario </a>";
                }
                else
                {
                  echo "<a class='btn btn-info' href='scrutinio/actaFinalEmpatePropietario.php?id=$id'target='_blank'><i class='fas fa-file-download'></i> Acta de empate en el miembro propietario</a>";
                }

              ?>
              <?php
                //////////////finalinal de los primeros if //////////////////
                  }
                }
              ?>
            </td>
          </tr>                          
       <?php } ?>
      </tbody>
    </table>
  </div>
  <!-- /.card-body -->
</div>