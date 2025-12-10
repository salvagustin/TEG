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

          $bu = $con->consulta("SELECT id_parametro FROM parametros WHERE id_depto = '$_SESSION[depto]' AND id_muni = '$_SESSION[muni]'");

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

          <th>Municipalidad</th>

          <th>Alcalde</th>

          <th>Lugar</th>

          <th>Teléfono</th>

          <th>Dirección</th>

					<th></th>

          </tr>

      </thead>

      <tbody>

        <?php

          if($_SESSION["rol"] == "Super")

          {

            $sql = $con->consulta("SELECT municipios.municipio, departamentos.depto, parametros.id_parametro, parametros.municipalidad, parametros.telefono, parametros.direccion, parametros.logo, parametros.nombreAlcalde, parametros.cargoAlcalde FROM parametros INNER JOIN departamentos ON parametros.id_depto = departamentos.id_depto INNER JOIN municipios ON departamentos.id_depto = municipios.id_depto AND parametros.id_muni = municipios.id_muni WHERE parametros.eliminado = 0");

          }

          else

          {

            $sql = $con->consulta("SELECT municipios.municipio, departamentos.depto, parametros.id_parametro, parametros.municipalidad, parametros.telefono, parametros.direccion, parametros.logo, parametros.nombreAlcalde, parametros.cargoAlcalde FROM parametros INNER JOIN departamentos ON parametros.id_depto = departamentos.id_depto INNER JOIN municipios ON departamentos.id_depto = municipios.id_depto AND parametros.id_muni = municipios.id_muni WHERE parametros.eliminado = 0 AND parametros.id_depto = '$_SESSION[depto]' AND parametros.id_muni = '$_SESSION[muni]'");

          }

          

          while ($ver = $con->arreglo($sql)) 

          { 

        ?>

        <tr>

          <td><img src="parametros/logos/<?php echo $ver["logo"];?>" whidth="53px" height="66px"></td>

				  <td><?php echo $ver["municipalidad"]; ?> <?php echo $ver["municipio"];?></td>

          <td><?php echo $ver["nombreAlcalde"]; ?> <?php echo $ver["cargoAlcalde"]; ?></td>

				  <td><?php echo $ver["depto"]; ?>, <?php echo $ver["municipio"]; ?></td>

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