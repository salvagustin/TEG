<?php
ini_set('default_charset', 'UTF8');
require("../php/conexion.php");
require "../seguro.php";
$con = new cnn();
?>
<script>
  $(document).ready(function(){
   $("#botonocultamuestra").click(function(){
      $("#divocultamuestra").each(function() {
        displaying = $(this).css("display");
        if(displaying == "block") {
          $(this).fadeOut('slow',function() {
           $(this).css("display","none");
          });
        } else {
          $(this).fadeIn('slow',function() {
            $(this).css("display","block");
          });
        }
      });
	         $("#divocultamuestra2").each(function() {
        displaying = $(this).css("display");
        if(displaying == "block") {
          $(this).fadeOut('slow',function() {
           $(this).css("display","none");
          });
        } else {
          $(this).fadeIn('slow',function() {
            $(this).css("display","block");
          });
        }
      });
	 	         $("#divocultamuestra3").each(function() {
        displaying = $(this).css("display");
        if(displaying == "block") {
          $(this).fadeOut('slow',function() {
           $(this).css("display","none");
          });
        } else {
          $(this).fadeIn('slow',function() {
            $(this).css("display","block");
          });
        }
      });  
    });
  });
</script>
<div class="card" >
  <div class="card-header">
    <div class="row">
      <div class="col"><h3 class="card-title">Afiliados en el padrón</h3>
    </div>
      <div class="col">        
<a href="afiliaciones/afiliacion.php" class="btn btn-primary " style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-plus"></i> Nuevo afiliado</a>
<a href="afiliaciones/subirAfiliados.php" class="btn btn-primary text-white" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-import"></i> Importar</a>
<a href="afiliados/descargarPadron.php" target="_blank" class="btn btn-primary text-white" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-download" ></i> Reporte</a>
<button class="btn btn-success" onclick="iniciarEnvioMasivo()">
    <i class="fas fa-paper-plane"></i> Enviar a todos los afiliados
</button>      
</div>
<div class="modal fade" id="modalProgreso" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Enviando Correos...</h4>
            </div>
            <div class="modal-body">
                <p id="statusEnvio">Preparando lista...</p>
                <div class="progress progress-sm active">
                    <div id="barraProgreso" class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" style="width: 0%"></div>
                </div>
            </div>
        </div>
    </div>
</div>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
    <table id="jornadas" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>#</th>
          <th>Nombre completo</th>
          <th>DUI</th>
          <th>Fecha de Nacimiento</th>
          <th>Plaza</th>
          <th>Estado</th>
          <th>Opciones</th>
        </tr>
      </thead>
      <tbody>
        <?php

          $sql = $con->consulta("SELECT afiliados.id,  afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido,  afiliados.dui, afiliados.cargo,   afiliados.fechaNac, afiliados.eliminado FROM afiliados ");

        while ($ver = $con->arreglo($sql)) {

        ?>

          <tr>

            <td><?php echo $ver["id"]; ?></td>
            <td><?php echo $ver["primerNombre"]; ?> <?php echo $ver["segundoNombre"]; ?> <?php echo $ver["primerApellido"]; ?> <?php echo $ver["segundoApellido"]; ?></td>
            <td><?php echo $ver["dui"]; ?></td>
            <td><?php echo $ver["fechaNac"]; ?></td>
            <td><?php echo $ver["cargo"]; ?></td>
            <td><?php echo ($ver["eliminado"] == 0) ? "Activo" : "Inactivo"; ?></td>
          
            
            <?php 
              if ($ver["eliminado"] == 0) { 
              ?>
                  <td>
                      <button class="btn btn-primary" onclick="enviarCorreoAfiliado('<?php echo $ver['id']; ?>')" title="Enviar Correo">
                          <i class="fas fa-envelope"></i>
                      </button>                
                    <button class="btn btn-warning" onclick="preguntarSiNo('<?php echo $ver['id']; ?>')" title="Inactivar Afiliado"><i class="fas fa-user-times"></i></button>
                  
                    <a href="afiliaciones/ActualizacionDatos.php?id=<?php echo base64_encode($ver['id']); ?>" 
                      class="btn btn-info" title="Editar Afiliado">
                      <i class="fa fa-pen"></i>
                    </a>
                    
                  </td>
              <?php 
              } else { 
              ?> 
              <td>
              <button class="btn btn-info" onclick="ActivarAfiliado('<?php echo $ver['id']; ?>')" title="Activar Afiliado"><i class="fas fa-user-check"></i></button>
              </td>   
                  <?php 
              } 
              ?>

            

          </tr>
        <?php } ?>
        <script>
    const idsParaEnviar = <?php 
        $ids = [];
        $res = $con->consulta("SELECT id FROM afiliados WHERE eliminado = 0 AND correo IS NOT NULL AND correo != ''");
        while($r = $con->arreglo($res)) { 
            $ids[] = $r['id']; 
        }
        echo json_encode($ids); 
    ?>;
</script>
      </tbody>
    </table>
  </div>

  <!-- /.card-body -->

</div>
<script src="https://unpkg.com/sweetalert2@7.15.1/dist/sweetalert2.all.js"></script>
    
<script>

  $(document).ready(function() {

    $('#jornadas').DataTable();

  });


</script>