<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require("../seguro.php");
$con = new cnn();
?>
<div class="card">
  <div class="card-header">
    <h3 class="card-title">Administración de usuarios</h3>
    <div align="right">
        <button class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo">
            <i class="ion ion-plus"></i> Agregar nuevo
        </button>
    </div>
  </div>
  <div class="card-body">
    <table id="usuarios_table" class="table table-bordered table-striped">
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
        // Especificamos los campos para evitar conflictos de nombres
        $sql = $con->consulta("SELECT u.*, r.con as nombre_rol 
                               FROM adm_usuarios u 
                               INNER JOIN adm_rol r ON u.rol = r.rol");
        
        while ($ver = $con->arreglo($sql)) { 
            // Limpiamos los datos para que el JS no se rompa si hay comillas o espacios raros
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
            <td><?php echo htmlspecialchars($ver["usu"]); ?></td>
            <td><?php echo htmlspecialchars($ver["nom"] . " " . $ver["ape"]); ?></td>
            <td><?php echo htmlspecialchars($ver["nombre_rol"]); ?></td>
            <td>
              <button class="btn btn-warning" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos; ?>')" title="Editar Usuario">
                  <i class="far fa-edit"></i>
              </button>
              <button class="btn btn-secondary" data-toggle="modal" data-target="#modalpass" onclick="agregaPass('<?php echo $datos; ?>')" title="Restablecer Contraseña">
                  <i class="fas fa-unlock"></i> 
              </button>
              <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id']; ?>')">
                  <i class="fas fa-trash-alt"></i>
              </button> 
            </td>
          </tr>
        <?php } ?>
      </tbody>
    </table>
  </div>
</div>

<script>
$(document).ready(function() {
    // Usamos un ID diferente al de la tabla de roles para evitar colisiones
    $('#usuarios_table').DataTable({
        "responsive": true,
        "autoWidth": false,
    });
});
</script>