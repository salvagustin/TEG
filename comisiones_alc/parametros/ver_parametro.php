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

        if($_SESSION["rol"] == "Super")

        {



        }

        else

        {

          $bu = $con->consulta("SELECT id_parametro FROM parametros ");

          if($con->conteo($bu) == 0)

          {

          ?>

            <a href="nuevoParametro.php"  class="btn btn-primary"><i class="ion ion-plus"></i> Nuevo parámetro</a>

          <?php

          }

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

          <th>Lugar</th>

          <th>Teléfono</th>

          <th>Dirección</th>

					<th></th>

          </tr>

      </thead>

      <tbody>

        <?php

          if($_SESSION["rol"] == "Administrador")

          {

            $sql = $con->consulta("SELECT  parametros.id_parametro, parametros.municipalidad, parametros.telefono, parametros.direccion, parametros.logo, parametros.nombreAlcalde, parametros.cargoAlcalde FROM parametros   WHERE parametros.eliminado = 0");

          }

          else

          {

            $sql = $con->consulta("SELECT parametros.id_parametro, parametros.municipalidad, parametros.telefono, parametros.direccion, parametros.logo, parametros.nombreAlcalde, parametros.cargoAlcalde FROM parametros  WHERE parametros.eliminado = 0");

          }

          

          while ($ver = $con->arreglo($sql)) 

          { 

        ?>

        <tr>

          <td><img src="parametros/logos/<?php echo $ver["logo"];?>" whidth="53px" height="66px"></td>

				  

          <td><?php echo $ver["nombreAlcalde"]; ?> <?php echo $ver["cargoAlcalde"]; ?></td>


          <td><?php echo $ver["telefono"]; ?></td>

          <td><?php echo $ver["direccion"]; ?></td>

				  <td>

            <a href="<?php echo "actualizarParametos.php?id=". base64_encode($ver["id_parametro"]);?>" class="btn btn-warning"><i class="far fa-edit"></i></a>

            <?php if($_SESSION["rol"] == "Super"){ ?>

            <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id_parametro']; ?>')"><i class="fas fa-trash-alt"></i></button>

            <?php } ?>

          </td>

        </tr>

        <?php }?>

      </tbody>

    </table>

  </div>

  <!-- /.card-body -->

</div>

<script>

  $(document).ready(function() {

    $('#parametros').DataTable();

  });

</script>