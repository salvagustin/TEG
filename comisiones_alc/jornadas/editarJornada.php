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
                <label>fecha de inicio:</label>
                <input name="JdesdeU" type="date" class="form-control" required id="JdesdeU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>fecha de finalización:</label>
                <input name="JhastaU" type="date" class="form-control" required id="JhastaU">
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label for="Estado">Estado</label>
                <select class="custom-select" id="estadoU" name="estadoU">
                    <option value="ACTIVO">ACTIVO</option> 
                    <option value="CERRADO">CERRADO</option>
                </select>
              </div>
            </div>
          </div>
        </div>
          
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="actualizadatos"><i class="far fa-save"></i> Guardar datos</button>
      </div>
    </div>
    </div>
</div>