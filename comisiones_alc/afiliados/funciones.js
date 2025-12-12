function agregardatos(descripcion, fecha, desde, hasta, Jdesde, Jhasta) {

    cadena = "descripcion=" + descripcion + "&fecha=" + fecha + "&desde=" + desde + "&hasta=" + hasta + "&Jdesde=" + Jdesde + "&Jhasta=" + Jhasta;

    $.ajax({
        type: "POST",
        url: "jornadas/agregarDatos.php",
        data: cadena,


        success: function(r) {
            if (r == 1) {
                $('#tabla').load('jornadas/ver_jornadas.php');
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
    alertify.confirm('Cambiar estado del afiliado', '¿Estas seguro de cambiar estado de este registro?',
        function() {
            eliminarDatos(id)
        },

        function() {
            Swal.fire(
                'Advertencia!',
                'Se detuvo el cambio',
                'warning'
            )
        });
}



function eliminarDatos(id) {

    cadena = "id=" + id;

    $.ajax({
        type: "POST",
        url: "afiliados/eliminarDatos.php",
        data: cadena,
        success: function(r) {
//alert(cadena);
            if (r == 1) {
                $('#tabla').load('afiliados/ver_afiliados.php');
                Swal.fire(
                    'Exito!',
                    'Estado cambiado con exito!',
                    'success'
                )
            } else {
                Swal.fire(
                    'Error!',
                    'No se pudieron cambiar el estado!',
                    'error'
                )
            }
        }
    });
}


function ActivarAfiliado(id) {
    alertify.confirm('Cambiar estado del afiliado', '¿Estas seguro de cambiar estado de este registro?',
        function() {
            ActivarDatos(id)
        },

        function() {
            Swal.fire(
                'Advertencia!',
                'Se detuvo el cambio',
                'warning'
            )
        });
}



function ActivarDatos(id) {

    cadena = "id=" + id;

    $.ajax({
        type: "POST",
        url: "afiliados/ActivarDatos.php",
        data: cadena,
        success: function(r) {
//alert(cadena);
            if (r == 1) {
                $('#tabla').load('afiliados/ver_afiliados.php');
                Swal.fire(
                    'Exito!',
                    'Estado cambiado con exito!',
                    'success'
                )
            } else {
                Swal.fire(
                    'Error!',
                    'No se pudieron cambiar el estado!',
                    'error'
                )
            }
        }
    });
}