<?php 
ini_set('default_charset','UTF8');
require("../php/conexion.php");
require "../seguro.php";

$con = new cnn();
 ?>
<div class="card">
            <div class="card-header">
              <h3 class="card-title">Administracion de roles</h3>
<div align="right"><button class="btn btn-primary" data-toggle="modal" data-target="#modalNuevo">
				<i class="ion ion-plus"></i> Nuevo rol 
			</button></div>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="roles" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>#</th>
                  <th>Rol</th>
                  <th>Opciones</th>
                </tr>
                </thead>
                <tbody>
<?php 
$sql= $con->consulta("SELECT * FROM adm_rol");
while($ver=$con->arreglo($sql)){ 

					$datos=$ver["rol"]."||". $ver["con"];
			 ?>
                <tr>
                <td><?php echo $ver["rol"]; ?></td>
				<td><?php echo $ver["con"]; ?></td>
				<td>
                    <button class="btn btn-warning" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos; ?>')"><i class="far fa-edit"></i> Editar</button>
                    
                    <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['rol']; ?>')"><i class="fas fa-trash-alt"></i> Eliminar</button>
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
    $('#roles').DataTable();
} );
</script>