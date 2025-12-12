<?php
// Asegúrate de que las rutas relativas son correctas desde la carpeta 'usuarios/'
ini_set('default_charset', 'UTF-8'); 
require("../php/conexion.php");
require("../seguro.php"); // Se asume que aquí se llama a session_start()
$con = new cnn();

// --- Obtener datos de usuarios ---
$sql_query = "
    SELECT 
        u.*, 
        r.con AS nombre_rol 
    FROM 
        adm_usuarios u 
    INNER JOIN 
        adm_rol r ON u.rol = r.rol 
    WHERE 
        u.estado = 'Activo'";



$sql = $con->consulta($sql_query);
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
                // Se itera sobre los resultados de la consulta
                if ($sql) {
                    while ($ver = $con->arreglo($sql)) { 
                        // Construcción de la cadena de datos (d[0] a d[9])
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
                                <button class="btn btn-warning" data-toggle="modal" data-target="#modalEdicion" onclick="agregaform('<?php echo $datos; ?>')" title="Editar Usuario"><i class="far fa-edit"></i></button>

                                <button class="btn btn-secondary" data-toggle="modal" data-target="#modalpass" onclick="agregaPass('<?php echo $datos; ?>')" title="Restablecer Contraseña"><i class="fas fa-unlock"></i> </button>
                                
                                <?php if (isset($_SESSION["rol"]) && $_SESSION["rol"] == "Super") { ?> 
                                    <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id']; ?>')"><i class="fas fa-trash-alt"></i> Eliminar</button> 
                                <?php } ?>
                            </td>
                        </tr>
                        <?php 
                    }
                }
                ?>
            </tbody>
        </table>
    </div>
    </div>