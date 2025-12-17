<?php
ini_set('default_charset', 'UTF8');
require "../seguro.php";
require "../php/conexion.php";
$con = new cnn();
$fecha = date("Y-m-d");
$hora = date("H:i:s");
?>


<div class="card">
  <div class="card-header">
    <h3 class="card-title">Administración de los parámetros</h3>
    <div align="right">
      <?php
        $sql = "SELECT COUNT(id_parametro) AS total_parametros FROM parametros WHERE eliminado = 0 ";
        $par = $con->consulta($sql);
        
        $fila = mysqli_fetch_array($par);
        $total_parametros = (int)$fila[0];

        if ($total_parametros < 1) {
          ?>
          <a href="nuevoParametro.php" class="btn btn-primary"><i class="ion ion-plus"></i> Nuevo parámetro</a>
          <?php
        } else {
          echo "No se puede agregar más parámetros";
        }
      
      ?>
    </div>
  </div>
  <div class="card-body">
    <table id="parametros" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Logo</th>
          <th>Alcalde</th>
          <th>Teléfono</th>
          <th>Dirección</th>
          <th>Estado</th>
          <th>Archivado</th>
          <th>Opciones</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <?php
        
        $sql = $con->consulta("SELECT parametros.id_parametro, parametros.municipalidad, parametros.telefono, parametros.direccion, parametros.logo, parametros.nombreAlcalde, parametros.cargoAlcalde, parametros.estado, parametros.eliminado FROM parametros");
        
        while ($ver = $con->arreglo($sql)) {
          ?>
          <tr>
            <td><img src="parametros/logos/<?php echo $ver["logo"]; ?>" whidth="53px" height="66px"></td>
            <td><?php echo $ver["nombreAlcalde"]; ?>   <?php echo $ver["cargoAlcalde"]; ?></td>
            <td><?php echo $ver["telefono"]; ?></td>
            <td><?php echo $ver["direccion"]; ?></td>
            <td><?php echo $ver["estado"]; ?></td>
            <td><?php echo ($ver["eliminado"] == 0) ? "Activo" : "Archivado"; ?></td>
            <td>
              <a href="<?php echo "actualizarParametos.php?id=" . base64_encode($ver["id_parametro"]); ?>"
                class="btn btn-primary"><i class="far fa-edit"></i></a>
             
                <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id_parametro']; ?>')"><i
                    class="fas fa-lock"></i></button>
              
            </td>
          </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
  <!-- /.card-body -->
</div>

<script>
  $(document).ready(function () {
    $('#parametros').DataTable();
  });
</script>