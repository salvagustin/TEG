<div class="modal fade" id="modalEdicion">
  <div class="modal-dialog modal-lg">
    <div class="modal-content card-outline card-primary">
      <div class="modal-header bg-primary">
        <h4 class="modal-title">Actualizando jornada</h4>
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
                <input name="descripcionU" type="text" class="form-control" required id="descripcionU">
                <input  hidden type="text" class="form-control" required="required" id="idU">  
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Feha de la votación:</label>
                <input name="fechaU" type="date" class="form-control" required id="fechaU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Hora de duración desde:</label>
                <input name="desdeU" type="time" class="form-control" required id="desdeU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Hasta</label>
                <input name="hastaU" type="time" class="form-control" required id="hastaU">
              </div>
            </div>
          </div>
        </div>
        <div class="row">

          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>fecha de inicio de la CEG:</label>
                <input name="JdesdeU" type="date" class="form-control" required id="JdesdeU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>fecha de finalización de la CEG:</label>
                <input name="JhastaU" type="date" class="form-control" required id="JhastaU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                 <label for="Estado">Estado</label>
                 <select class="custom-select" id="estadoU"  name="estadoU">
              
               <option value="ACTIVO">ACTIVO</option>
               <option value="CERRADO" >CERRADO</option>
              </select>
              </div>
            </div>
          </div>
        </div>
    <?php if($_SESSION["rol"] == "Super"){  ?>      
<div class="row"> 
<div class="col">
<div class="form-group">
<label for="depto">Departamento</label>
<select name="deptoExpeU" id="deptoExpeU" class="form-control ">
<?php $de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");
while ($depto = $con->arreglo($de)) {       ?>
<option value="<?php echo $depto["id_depto"]; ?>" <?php if ($datos["deptoExpe"] == $depto["id_depto"]) {   echo "selected"; } ?>>  <?php echo $depto["depto"]; ?></option>
<?php }?>
</select>
</div>
</div>
<div class="col">
<div class="form-group">
<label for="">Municipio</label>
<select name="muniExpeU" id="muniExpeU" class="form-control ">
<?php $mu = $con->consulta("SELECT * FROM municipios WHERE eliminado = 0");
while ($muni = $con->arreglo($mu)) {     ?>
    <option value="<?php echo $muni["id_muni"]; ?>" <?php if ($datos["muniExpe"] == $muni["id_muni"]) {    echo "selected";    }   ?> ><?php echo $muni["municipio"]; ?></option>
<?php }?>
</select>
</div>
</div>
     </div>
    <?php } ?>      
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="actualizadatos"><i class="far fa-save"></i> Guardar datos</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
</div>
<!-- /.modal-dialog -->
</div>