
<div class="modal fade" id="modalEdicion">
  <div class="modal-dialog modal-xl">
    <div class="modal-content card-outline card-primary">
      <div class="modal-header bg-primary">
        <h4 class="modal-title">Actualizando datos del Usuario</h4>
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
                <input name="nomU" type="text" class="form-control" required="required" id="nomU" />
                <input hidden type="text" class="form-control" required="required" id="idU" />
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Apellido:</label>
                <input name="apeU" type="text" class="form-control" required="required" id="apeU" />
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Usuario:</label>
                <input name="usuaU" type="text" class="form-control" required="required" id="usuaU" />
              </div>
            </div>
          </div>
          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Correo Electronico:</label>

                <input type="email" name="maiU" class="form-control" id="maiU">
              </div>
            </div>
          </div>

          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Teléfono:</label>
                <input name="telU" type="text" class="form-control" required="required" id="telU" maxlength="8" />
              </div>
            </div>
          </div>
        </div>
        
        <div class="row">

          <div class="col">
            <div class="form-group">
              <div class="form-group">
                <label>Rol:</label>
                <?php $consulta = $con->consulta("SELECT * FROM adm_rol  "); ?>
                <select name="nrolU" id="nrolU" required class="form-control ">
                  <?php while ($dato = $con->arreglo($consulta)) { ?>
                    <option value="<?php echo $dato["rol"]; ?>"><?php echo $dato["con"]; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
          </div>

        </div>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="actualizadatos"><i class="far fa-save"></i> Guardar Datos</button>

      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

