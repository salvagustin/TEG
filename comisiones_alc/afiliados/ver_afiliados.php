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
<a href="" target="_blank" class="btn btn-primary text-white" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-share" ></i> Enviar</a>      
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
                    <a onclick="confirmar(event)" href="<?php echo "javascript:editar('afiliados/nuevoCodigo.php?id=$ver[id]',600,362)"; ?>" class="btn btn-secondary" title="Restablecer Codigo"><i class="fas fa-sync"></i></a>
                
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



  function confirmar(e) {

  e.preventDefault()

  swal({

    title: 'Cambiar codigo',

    text: "¿Estás seguro?",

    type: 'warning',

    showCancelButton: true,

    confirmButtonColor: '#3085d6',

    cancelButtonColor: '#d33',

    confirmButtonText: 'Sí, cambiar'

  }).then((result) => {

    if (result.value) {

      let linkElement = e.target

      while (!linkElement.href) {

        linkElement = linkElement.parentElement

      }     

      window.location.href = linkElement.href

    }

  })

}

</script>