<div class="modal fade" id="modalNuevo">
  <div class="modal-dialog modal-lg">
    <di class="modal-content card-outline card-primary">
      <div class="modal-header bg-primary">
        <h4 class="modal-title">Nueva jornada</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Descripción:</label>
                <input name="descripcion" type="text" class="form-control" required id="descripcion">
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Feha de la votación:</label>
                <input name="fecha" type="date" onkeydown="return false" class="form-control" required id="fecha" min="<?php echo date("Y-m-d"); ?>" value="<?php echo date("Y-m-d"); ?>" max="2050-12-31">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Hora de duración Desde:</label>
                <input name="desde" type="time" class="form-control" required id="desde"  onkeydown="return false">
              </div>
            </div>
          </div>
            
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Hasta</label>
                <input name="hasta" type="time" class="form-control" required id="hasta" onkeydown="return false">
              </div>
            </div>
          </div>
        </div>
              
        <div class="row">

      <div class="col">

      <div class="form-group">

    <div class="form-group">

      <label>fecha de inicio:</label>

      <input name="Jdesde" type="date" class="form-control" required id="Jdesde" min="<?php echo date("Y-m-d"); ?>" value="<?php echo date("Y-m-d"); ?>">

    </div>

  </div>

</div>

<div class="col">

  <div class="form-group">

    <div class="form-group">

      <label>fecha de finalización:</label>

      <input name="Jhasta" type="date" class="form-control" required id="Jhasta" min="<?php echo date("Y-m-d"); ?>" value="<?php echo date("Y-m-d"); ?>">

    </div>

  </div>

</div>

    <script src="../plantilla/bootstrap/jquery-3.5.1.slim.min.js"></script>
    <script src="../plantilla/bootstrap/popper.min.js"></script>
    <script src="../plantilla/bootstrap/bootstrap.min.js"></script>
    <script src="../plantilla/bootstrap/jquery.min.js"></script>              
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
			  url:"jornadas/deptoExpe.php",
			  data:"continente=" + $('#deptoExpe').val(),
			  success:function(r)
        {
				  $('#muniExpe').html(r);
			  }
	  	  });
	    }
    </script>
      </div>
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