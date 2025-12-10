<div class="modal fade" id="modalNuevo">
      <link rel="stylesheet" href="plantilla/bootstrap/bootstrap.min.css" >
  <link rel="stylesheet" href="plantilla/plugins/fontawesome-free/css/all.min.css">
  <script src="plantilla/alertifyjs/alertify.js"></script>
  <link href="plantilla/dist/img/icon.jpg" rel="shortcut icon" type="image/vnd.microsoft.icon">
        <div class="modal-dialog modal-xl">
          <div class="modal-content card-outline card-primary"> 
            <div class="modal-header bg-primary">
              <h4 class="modal-title">Nueva usuario</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
    <div class="row">
        <div class="col">
          <div class="form-group">
<div class="form-group">
<label>Nombre:</label>    
<input name="nom" type="text" class="form-control" required="required" id="nom"   />
</div>                 
</div>       
</div>
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Apellido:</label>    
<input name="ape" type="text" class="form-control" required="required" id="ape"   />
</div>                 
</div>         
</div>
</div>
<div class="row">
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Usuario:</label>    
<input name="usu" type="text" class="form-control" required="required" id="usu">
</div>                 
</div>       
</div>
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Contrase&ntilde;a:</label>    
<input name="pas1" type="password" class="form-control" required="required" id="pas1">
</div>                 
</div>         
</div>
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Confirme contrase&ntilde;a:</label>    
<input name="pas2" type="password" class="form-control" required="required" id="pas2">&nbsp;<?php echo @$_GET["msj"];?>
</div>                 
</div>         
</div>    
</div>  
<div class="row">
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Correo electronico:</label>    

 <input type="email" name="mail1" class="form-control" id="mail1" placeholder="Ej.: usuario@servidor.com">    
</div>                 
</div>       
</div>
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Confirme correo:</label>    
 <input type="email" name="mail2" class="form-control" id="mail2" placeholder="Ej.: usuario@servidor.com"> 
</div>                 
</div>         
</div>
<div class="col">
<div class="form-group">
<div class="form-group">
<label>Teléfono:</label>    
<input name="tel" type="text" class="form-control" required="required" id="tel" maxlength="8"  />
</div>                 
</div>         
</div>    
</div>
<div class="row">
<div class="col">
</div>
</div>
<div class="row">
<div class="col">
<div class="form-group">
<label for="">Departamento</label>
<select name="deptoExpe" id="deptoExpe" class="form-control select2">
<?php 
$de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
while($depto = $con->arreglo($de)){ 
?>
<option value="<?php echo $depto["id_depto"]; ?>"><?php echo $depto["depto"];?></option>
<?php } ?>
</select>
</div> 
</div>
<div class="col">
<div class="form-group">
<label for="">Municipio</label>
<select name="muniExpe" id="muniExpe" class="form-control select2">
</select>
</div> 
</div>

</div>

<div class="row">

   <div class="col">        
<label>Rol</label>
<?php 
       $ro = $con->consulta("SELECT * FROM adm_rol where rol <> '1'");  ?>
<select id="rol" class="form-control select2" style="width: 100%;">
<?php while($rol = $con->arreglo($ro)){ ?>
                <option value="<?php echo $rol["rol"]; ?>"><?php echo $rol["con"]; ?> </option>
                  <?php } ?>
                    </select></div>
</div>

    
</div>     
    <script src="plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
    <script src="plantilla/bootstrap/popper.min.js"></script>
    <script src="plantilla/bootstrap/bootstrap.min.js"></script>
    <script src="plantilla/bootstrap/jquery.min.js"></script>              
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
			  url:"usuarios/deptoExpe.php",
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
			  url:"usuarios/muni.php",
			  data:"continente=" + $('#depto').val(),
			  success:function(r)
        {
				  $('#muni').html(r);
			  }
	  	  });
	    }
    </script>
              
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <button type="button" class="btn btn-primary" data-dismiss="modal" id="guardarnuevo"><i class="far fa-save"></i> Guardar Datos</button>
            </div>
          </div>
          <!-- /.modal-content -->
            </div> 
        </div>
        <!-- /.modal-dialog -->
      </div>