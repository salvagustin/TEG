<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require "../seguro.php";

$con = new cnn();
?>
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Afiliados en el padrón</h3>
    <div class="text-right">
      <a href="nuevoCandidato.php" class="btn btn-primary"><i class="fas fa-plus"></i> Nuevo candidato</a>
    </div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <table id="candidatos" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Foto</th>
          <th>Nombre completo</th>
          <th>Edad</th>
          
          <th>Periodo</th>
          <th>Opciones</th>
        </tr>
      </thead>
      <tbody>
        <?php
          if($_SESSION["rol"] == "Administrador")
          {
            $sql = $con->consulta("SELECT candidatos.id_candidato, candidatos.foto, afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, jornadas.periodoDesde, jornadas.periodoHasta, candidatos.estado, afiliados.cargo, candidatos.edad, candidatos.profesion, candidatos.domicilio FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id INNER JOIN jornadas ON candidatos.id_jornada = jornadas.id_jornada ");
          }
          else
          {
            $sql = $con->consulta("SELECT candidatos.id_candidato, candidatos.foto, afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, jornadas.periodoDesde, jornadas.periodoHasta, candidatos.estado, afiliados.cargo, candidatos.edad, candidatos.profesion, candidatos.domicilio FROM candidatos INNER JOIN afiliados ON candidatos.id_afiliado = afiliados.id INNER JOIN jornadas ON candidatos.id_jornada = jornadas.id_jornada ");
          }
        
        while ($ver = $con->arreglo($sql)) {
        ?>
          <tr>
            <td><img src="candidatos/fotos/<?php echo $ver["foto"]; ?>" whidth="53px" height="66px"></td>
            <td><?php echo $ver["primerNombre"]; ?> <?php echo $ver["segundoNombre"]; ?> <?php echo $ver["primerApellido"]; ?> <?php echo $ver["segundoApellido"]; ?> <?php echo $ver["apellidoCasada"]; ?></td>
            <td><?php echo $ver["edad"]; ?></td>
            <td><?php echo date('d/m/Y', strtotime($ver["periodoDesde"])); ?> al <?php echo date('d/m/Y', strtotime($ver["periodoHasta"])); ?></td>
                       
            <td>
              <a href="<?php echo "actualizarCandidatos.php?id=". base64_encode($ver["id_candidato"]);?>" class="btn btn-warning" title="Editar Datos"><i class="far fa-edit"></i></a>
              <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id_candidato']; ?>')" title="Eliminar Afiliado"><i class="fas fa-trash-alt"></i></button>
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
    $('#candidatos').DataTable();
  });
</script>