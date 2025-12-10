<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
?>
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Administración de usuarios</h3>
    <div align="right"><button class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo">
        <i class="ion ion-plus"></i> Agregar nuevo
      </button></div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <table id="usuarios" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>Usuario</th>
          <th>Nombre</th>
          <th>Rol</th>
          <th>Opciones</th>
        </tr>
      </thead>
      <tbody>
        <?php
        
        $sql = $con->consulta("SELECT * FROM adm_usuarios INNER JOIN adm_rol ON adm_usuarios.rol = adm_rol.rol AND adm_usuarios.rol = adm_rol.rol WHERE adm_usuarios.estado = 'Activo' ");
        
        while ($ver = $con->arreglo($sql)) { 

          $datos = $ver["id"] . "||" .
            $ver["usu"] . "||" .
            $ver["pas"] . "||" .
            $ver["rol"] . "||" .
            $ver["nom"] . "||" .
            $ver["ape"] . "||" .
            $ver["tel"] . "||" .    
            $ver["mai"];
        ?>
          <tr>
            <td><?php echo $ver["usu"]; ?></td>
            <td><?php echo $ver["nom"]; ?> <?php echo $ver["ape"]; ?></td>
            <td><?php echo $ver["con"]; ?></td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos; ?>')" title="Editar Usuario"><i class="far fa-edit"></i></button>

              <button class="btn btn-secondary" data-toggle="modal" data-target="#modalpass" onclick="agregaPass('<?php echo $datos; ?>')" title="Restablecer Contraseña"><i class="fas fa-unlock"></i> </button>
              <?php if ($_SESSION["rol"] == "Super") {  ?> <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id']; ?>')"><i class="fas fa-trash-alt"></i> Eliminar</button> <?php } ?>
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
    $('#usuarios').DataTable();
  });
</script>