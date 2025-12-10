function agregardatos(rol){

	cadena="rol=" + rol;

	$.ajax({
		type:"POST",
		url:"roles/agregarDatos.php",
		data:cadena,
		success:function(r){
			if(r==1){
				$('#tabla').load('roles/ver_rol.php');
				Swal.fire(
                    'Exito!',
                    'Datos Guardado con Exito!',
                    'success'
                    )
			}else{
				Swal.fire(
                'Error!',
                'No se pudieron guardar los datos!',
                'error'
                )
			}
		}
	});

}

function agregaform(datos){

	d=datos.split('||');

	$('#id').val(d[0]);
	$('#rolE').val(d[1]);
	
}

function actualizaDatos(){

	id=$('#id').val();
	rol=$('#rolE').val();
	
	cadena= "id=" + id +
			"&rol=" + rol;

	$.ajax({
		type:"POST",
		url:"roles/actualizaDatos.php",
		data:cadena,
		success:function(r){
			
			if(r==1){
				$('#tabla').load('roles/ver_rol.php');
				Swal.fire(
                    'Exito!',
                    'Datos Guardado con Exito!',
                    'success'
                    )
			}else{
				Swal.fire(
                'Error!',
                'No se pudieron guardar los datos!',
                'error'
                )
			}
		}
	});

}

function preguntarSiNo(id){
	alertify.confirm('Eliminar Datos', '¿Esta seguro de eliminar este registro?', 
					function(){ eliminarDatos(id) }
                , function(){ 
                Swal.fire(
                'Advertencia!',
                'Se detuvo la eliminacion!',
                'warning'
                )
                });
}

function eliminarDatos(id){

	cadena="id=" + id;

		$.ajax({
			type:"POST",
			url:"roles/eliminarDatos.php",
			data:cadena,
			success:function(r){
				if(r==1){
				$('#tabla').load('roles/ver_rol.php');
				Swal.fire(
                    'Exito!',
                    'Datos Eliminados con Exito!',
                    'success'
                    )
			}else{
				Swal.fire(
                'Error!',
                'No se pudieron eliminar los datos!',
                'error'
                )
			}
			}
		});
}
