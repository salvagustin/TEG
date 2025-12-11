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
                     <script> 
     function showAlert(){
    Swal.fire({
        icon: 'success',
        title: 'Hay afiliados activos, porfavor eliminarlos para poder subir',
  confirmButtonText: `Aceptar`,

}).then((result) => {
         if (result.isConfirmed) {    window.opener.location.reload('afiliaciones.php');  window.close(); }
        }) } 
          
               function showAlert2(){
    Swal.fire({
        icon: 'success',
        title: 'No hay afiliados para mostrar',
  confirmButtonText: `Aceptar`,

}).then((result) => {
         if (result.isConfirmed) {    window.opener.location.reload('afiliaciones.php');  window.close(); }
        }) }
          </script>
          
              
<a href="afiliaciones/afiliacion.php" class="btn btn-primary " style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-download text-white"></i> Nuevo afiliado</a>
              
       

      </div>

      <div class="col">
         <?php 
          $cont=$con->consulta("SELECT	afiliados.id FROM	afiliados ");
$conte2=$con->conteo($cont);
          if ($conte2<>0){       
          
          ?>
           <a href="afiliados/descargarPadron.php" target="_blank" class="btn btn-primary text-white" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-download" ></i> Reporte padrón electoral</a>
    
<?php } else  { ?>
               
   <a  onclick="showAlert2()" target="_blank" class="btn btn-primary text-white" style="background-color:#131d2e; border-color: #131d2e; "><i class="fas fa-file-download"></i> Reporte padrón electoral</a>         
        <?php  }  ?>
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
          <th>Cargo</th>
          <th>Estado</th>
          <th>Opciones</th>
        </tr>

      </thead>

      <tbody>

        <?php

        if($_SESSION["rol"] == "Administrador")

        {

          $sql = $con->consulta("SELECT afiliados.id,  afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.dui, afiliados.cargo,   afiliados.fechaNac, afiliados.eliminado FROM afiliados ");

        }

        else

        {

          $sql = $con->consulta("SELECT afiliados.id,  afiliados.primerNombre, afiliados.segundoNombre, afiliados.primerApellido, afiliados.segundoApellido, afiliados.apellidoCasada, afiliados.dui, afiliados.cargo, afiliados.fechaNac, afiliados.eliminado FROM afiliados ");

        }

        

        while ($ver = $con->arreglo($sql)) {

        ?>

          <tr>

            <td><?php echo $ver["id"]; ?></td>

            <td><?php echo $ver["primerNombre"]; ?> <?php echo $ver["segundoNombre"]; ?> <?php echo $ver["primerApellido"]; ?> <?php echo $ver["segundoApellido"]; ?> <?php echo $ver["apellidoCasada"]; ?></td>

            <td><?php echo $ver["dui"]; ?></td>

            <td><?php echo $ver["fechaNac"]; ?></td>

            <td><?php echo $ver["cargo"]; ?></td>

            <td><?php echo ($ver["eliminado"] == 0) ? "Activo" : "Inactivo"; ?></td>
            

            <td>

            <script src="https://unpkg.com/sweetalert2@7.15.1/dist/sweetalert2.all.js"></script>

              <a onclick="confirmar(event)" href="<?php echo "javascript:editar('afiliados/nuevoCodigo.php?id=$ver[id]',600,362)"; ?>" class="btn btn-secondary" title="Restablecer Codigo"><i class="fas fa-sync"></i></a>

    

              <?php //if ($_SESSION["rol"] == "Super" AND $_SESSION["rol"] == "Administrador") { ?>

                <button class="btn btn-danger" onclick="preguntarSiNo('<?php echo $ver['id']; ?>')" title="Eliminar Afiliado"><i class="fas fa-trash-alt"></i></button>

              <?php //} ?>

            </td>

          </tr>

        <?php } ?>

      </tbody>

    </table>

  </div>

  <!-- /.card-body -->

</div>

    <script type="text/javascript">
	    $(document).ready(function()
      {
		    $('#deptoExpe').val(0);
		    recargardeptoExpe();
		    $('#deptoExpe').change(function()
        {
			    recargardeptoExpe();
		    });
	    })

	    function recargardeptoExpe()
      {
		    $.ajax({
			  type:"POST",
			  url:"afiliados/deptoExpe.php",
			  data:"continente=" + $('#deptoExpe').val(),
			  success:function(r)
        {
				  $('#muniExpe').html(r);
			  }
	  	  });
	    }

	    $(document).ready(function()
      {
		    $('#depto').val(0);
		    recargardepto();
		    $('#depto').change(function()
        {
			    recargardepto();
		    });
	    })

	    function recargardepto()
      {
		    $.ajax({
			  type:"POST",
			  url:"afiliados/muni.php",
			  data:"continente=" + $('#depto').val(),
			  success:function(r)
        {
				  $('#muni').html(r);
			  }
	  	  });
	    }
         $(document).ready(function()
      {
		    $('#depto2').val(0);
		    recargardepto();
		    $('#depto2').change(function()
        {
			    recargardepto();
		    });
	    })

	    function recargardepto()
      {
		    $.ajax({
			  type:"POST",
			  url:"afiliados/muni2.php",
			  data:"continente=" + $('#depto2').val(),
			  success:function(r)
        {
				  $('#muni2').html(r);
			  }
	  	  });
	    }
    </script>
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