
function preguntarSiNo(id) {
    alertify.confirm('Eliminar Datos', '¿Estas seguro de eliminar este registro?',
        function() {
            eliminarDatos(id)
        },
        function() {
            Swal.fire(
                'Advertencia!',
                'Se detuvo la eliminacion',
                'warning'
            )
        });
}

function eliminarDatos(id) {

    cadena = "id=" + id;

    $.ajax({
        type: "POST",
        url: "candidatos/eliminar_candidato.php",
        data: cadena,
        success: function(r) {
            if (r == 1) {
                $('#tabla').load('candidatos/ver_candidatos.php');
                Swal.fire(
                    'Exito!',
                    'Datos Eliminados con Exito!',
                    'success'
                )
            } else {
                Swal.fire(
                    'Error!',
                    'No se pudieron eliminar los datos!',
                    'error'
                )
            }
        }
    });
}