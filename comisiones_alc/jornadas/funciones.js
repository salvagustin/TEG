function agregardatos(descripcion, fecha, desde, hasta, Jdesde, Jhasta) {

cadena = "descripcion=" + descripcion + "&fecha=" + fecha + "&desde=" + desde + "&hasta=" + hasta + "&Jdesde=" + Jdesde + "&Jhasta=" + Jhasta;


    $.ajax({
        type: "POST",
        url: "jornadas/agregarDatos.php",
        data: cadena,


        success: function(r) {

            if (r == 1) {
                $('#tabla').load('jornadas/ver_jornadas.php');
                document.getElementById("#descripcion").value = "";
                Swal.fire(
                    'Exito!',
                    'Datos Guardado con Exito',
                    'success'
                )

            } else {

                Swal.fire(
                    'Error!',
                    'No se pudiern guardar los datos!',
                    'error'
                )
            }
        }
    });
}



function agregaform(datos) {


    d = datos.split('||');


    $('#idU').val(d[0]);
    $('#descripcionU').val(d[1]);
    $('#fechaU').val(d[2]);
    $('#desdeU').val(d[3]);
    $('#hastaU').val(d[4]);
    $('#JdesdeU').val(d[5]);
    $('#JhastaU').val(d[6]);
    $('#estadoU').val(d[7]);
    

}


function actualizaDatos() {


    id = $('#idU').val();
    descripcion = $('#descripcionU').val();
    fecha = $('#fechaU').val();
    desde = $('#desdeU').val();
    hasta = $('#hastaU').val();
    Jdesde = $('#JdesdeU').val();
    Jhasta = $('#JhastaU').val(); 
    estado = $('#estadoU').val();


    cadena = "id=" + id +
        "&descripcion=" + descripcion +
        "&fecha=" + fecha +
        "&desde=" + desde +
        "&hasta=" + hasta +
        "&Jdesde=" + Jdesde +
        "&Jhasta=" + Jhasta +
        "&estado=" + estado;

    $.ajax({
        type: "POST",
        url: "jornadas/actualizaDatos.php",
        data: cadena,

        success: function(r) {
            if (r == 1) {

                $('#tabla').load('jornadas/ver_jornadas.php');
                Swal.fire(
                    'Exito!',
                    'Datos Guardado con Exito!',
                    'success'
                )

            } else {
                Swal.fire(
                    'Error!',
                    'No se pudieron guardar los datos!',
                    'error'
                )
            }
        }
    });
}



function preguntarSiNo(id) {

    alertify.confirm('Inactivar Jornada', '¿Estas seguro de inactivar la jornada?',
        function() {
            eliminarDatos(id)
        },
        function() {
            Swal.fire(
                'Advertencia!',
                'Se detuvo la inactivación',
                'warning'
            )
        });
}



function eliminarDatos(id) {

    cadena = "id=" + id;

    $.ajax({
        type: "POST",
        url: "jornadas/eliminarDatos.php",
        data: cadena,
        success: function(r) {
            if (r == 1) {
                $('#tabla').load('jornadas/ver_jornadas.php');
                //$('#nuevo').load('jornadas/agregarJornada.php');
                Swal.fire(
                    'Exito!',
                    'Datos inactivador con Exito!',
                    'success'
                )
            } else {
                Swal.fire(
                    'Error!',
                    'No se pudieron inactivar los datos!',
                    'error'
                )
            }
        }
    });

}