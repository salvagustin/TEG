function agregardatos(usu, pass, rol, nom, ape, tel, mail1, mail2,deptoExpe, muniExpe){

	cadena="usu=" + usu + "&pass=" + pass + "&rol=" + rol + "&nom=" + nom + "&ape=" + ape + "&tel=" + tel + "&deptoExpe=" + deptoExpe + "&muniExpe=" + muniExpe + "&mail1=" + mail1 + "&mail2=" + mail2;

	$.ajax({
		type:"POST",
		url:"usuarios/agregarDatos.php",
        
		data:cadena,
		success:function(r){
			if(r==1){
				
				
$('#tabla').load('usuarios.php');

    Swal.fire(

    'Agregado!',

    'Datos Agregados con exito.',

    'success'
    ).then(function(isConfirm) {
  if (isConfirm) {
 window.location = 'usuarios.php';
  } else {

  }
});
				
		
			}else{
		
		        Swal.fire(
          'Error!',
          'No se pudieron guardar los dato!',
          'error'
        )
			}
		}
	});

}

function agregaform(datos){

	d=datos.split('||');

  $('#idU').val(d[0]);
  $('#usuaU').val(d[1]);
  $('#pasU').val(d[2]);
  $('#nrolU').val(d[3]);
  $('#nomU').val(d[4]);
  $('#apeU').val(d[5]);
  $('#telU').val(d[6]);
$('#deptoExpeU').val(d[7]);
$('#muniExpeU').val(d[8]);    
 $('#maiU').val(d[9]);

	
}

function actualizaDatos(){


id = $('#idU').val();
usua = $('#usuaU').val();    
  nom = $('#nomU').val();
  ape = $('#apeU').val();
  mai = $('#maiU').val();
  tel = $('#telU').val();
  nrol = $('#nrolU').val();
  deptoExpe = $('#deptoExpeU').val();
  muniExpe = $('#muniExpeU').val();    

  cadena = "id="+ id +
           "&usua=" + usua +
           "&nom=" + nom +
           "&ape=" + ape +
           "&mai=" + mai +
           "&tel=" + tel +
           "&deptoExpe=" + deptoExpe +
           "&muniExpe=" + muniExpe +
           "&nrol=" + nrol;

	$.ajax({
		type:"POST",
		url:"usuarios/actualizaDatos.php",
		data:cadena,
		success:function(r){
		
			if(r==1){
				$('#tabla').load('usuarios/ver_usuario.php');
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


function agregaPass(datos){

	d=datos.split('||');

  $('#idPass').val(d[0]);


	
}



function actualizapass(idPass,contra1, contra2){

idPass = $('#idPass').val();
contra1 = $('#contra1').val();    
  contra2 = $('#contra2').val();

  cadena = "idPass="+ idPass +
           "&contra1=" + contra1 +
           "&contra2=" + contra2 ;

	$.ajax({
		type:"POST",
		url:"usuarios/Pass.php",
        
		data:cadena,
		success:function(r){
            

			if(r==1){
                	$('#tabla').load('usuarios/ver_usuario.php');
                      Swal.fire(
          'Exito!',
          'Contraseña Actualizada',
          'success'
        )
		
			}else{
		
		        Swal.fire(
          'Error!',
          'No se pudo Actualizar la contraseña!',
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
			url:"usuarios/eliminarDatos.php",
			data:cadena,
			success:function(r){
				if(r==1){
				$('#tabla').load('usuarios/ver_usuario.php');
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