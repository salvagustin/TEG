<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require "../seguro.php";

$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:i:s");

$bus = $con->consulta("SELECT * FROM jornadas WHERE '$hora' BETWEEN horaDesde AND horaHasta AND estado = 'ACTIVO' HAVING fecha <= '$fecha'");
if($con->conteo($bus)==1)
{
	while($cam = $con->arreglo($bus))
	{
		//$cambios = $con->consulta("UPDATE jornadas SET estado = 'CERRADO' WHERE id_jornada = '$cam[id_jornada]' ");
	}
}

?>

<div class="card">
  <div class="card-header">
    <h3 class="card-title">Administracion de jornadas electorales</h3>
    <div align="right">
      <?php 
      if($_SESSION["rol"]=="Super")
      {
        $jor = $con->consulta("SELECT id_jornada FROM jornadas WHERE fecha = '$fecha' AND '$hora' BETWEEN horaDesde AND horaHasta");
      }
      else
      {
        $jor = $con->consulta("SELECT id_jornada FROM jornadas WHERE fecha = '$fecha' AND '$hora' BETWEEN horaDesde AND horaHasta AND estado = 'ACTIVO'");
if ($con->conteo($jor) == 0) {
    ?>
      <button class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo" style="background-color:#131d2e; border-color: #131d2e; ">
        <i class="ion ion-plus"></i> Nueva jornada
      </button>
      <?php

} else {

    echo "No se puede agregar Jornada porque hay una Activa";

}


      }
  
        ?>

    </div>

  </div>

  <!-- /.card-header -->

  <div class="card-body">

    <table id="jornadas" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>#</th>
          <th>Descripcion</th>
          <th>Fecha de la votación</th>
          <th>Desde</th>
          <th>Hasta</th>
          <th>fecha de inicio</th>
          <th>fecha de finalización</th>
          
          <th>Estado</th>
          <th>Opciones</th>
        </tr>
      </thead>
      <tbody>
        <?php
        if($_SESSION["rol"] == "Administrador")
        {
          $sql = $con->consulta("SELECT jornadas.* FROM jornadas ");

        }
        else
        {
          $sql = $con->consulta("SELECT jornadas.* FROM jornadas ");
        }
        $i = 0;
        while ($ver = $con->arreglo($sql)) { $i++;

          $datos = $ver["id_jornada"] . "||" . $ver["descripcion"] . "||" . $ver["fecha"] . "||" . $ver["horaDesde"] . "||" . $ver["horaHasta"] . "||" . $ver["periodoDesde"] . "||" . $ver["periodoHasta"] . "||" . $ver["estado"];

        ?>
          <tr>
            <td><?php echo $i; ?></td>
            <td><?php echo $ver["descripcion"]; ?></td>
            <td><?php echo date('d/m/Y', strtotime($ver["fecha"])); ?></td>
            <td><?php echo $ver["horaDesde"]; ?></td>
            <td><?php echo $ver["horaHasta"]; ?></td>
            <td><?php echo date('d/m/Y', strtotime($ver["periodoDesde"])); ?></td>
            <td><?php echo date('d/m/Y', strtotime($ver["periodoHasta"])); ?></td>
            
            <td  <?php if($ver["estado"]=="CERRADO"){ ?> class=" bg-gradient-secondary" <?php } else { ?> class="bg-gradient-success " <?php } ?> > <?php echo $ver["estado"]; ?></td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos; ?>')" title="Editar Jornada"><i class="far fa-edit"></i></button>
              <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id_jornada']; ?>')" title="Eliminar Jornada"><i class="fas fa-trash-alt"></i></button>
            </td>
          </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <!-- /.card-body -->
</div>
<script>
  $(document).ready(function() {
    $('#jornadas').DataTable();
  });
</script>