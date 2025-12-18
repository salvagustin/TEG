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

function enviarCorreoAfiliado(id) {
    Swal.fire({
        title: '¿Enviar correo?',
        text: "Se enviará una notificación al afiliado",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#131d2e',
        confirmButtonText: 'Sí, enviar'
    }).then((result) => {
        if (result.value) {
            $.ajax({
                type: "POST",
                url: "afiliados/enviar_correo.php",
                data: "id_afiliado=" + id,
                success: function(r) {
                    if (r == 1) {
                        Swal.fire('Enviado', 'El correo se envió correctamente', 'success');
                    } else if (r == "error_correo_vacio") {
                        Swal.fire('Error', 'El afiliado no tiene correo registrado', 'warning');
                    } else {
                        Swal.fire('Error', 'No se pudo enviar el correo', 'error');
                    }
                }
            });
        }
    });
}

async function iniciarEnvioMasivo() {
    // Ya no usamos PHP aquí, usamos la constante que definimos en el archivo principal
    if (!idsParaEnviar || idsParaEnviar.length === 0) {
        return Swal.fire('Aviso', 'No hay afiliados con correo electrónico', 'info');
    }

    const confirmacion = await Swal.fire({
        title: '¿Confirmar envío masivo?',
        text: `Se enviarán ${idsParaEnviar.length} correos. Esto puede tardar unos minutos.`,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#28a745',
        confirmButtonText: 'Sí, iniciar envío'
    });

    if (!confirmacion.value) return;

    $('#modalProgreso').modal('show');
    let enviados = 0;
    let total = idsParaEnviar.length;

    for (let i = 0; i < total; i++) {
        let idAfi = idsParaEnviar[i];
        
        // Actualizar interfaz
        let porcentaje = Math.round(((i + 1) / total) * 100);
        $('#barraProgreso').css('width', porcentaje + '%');
        $('#statusEnvio').text(`Enviando ${i + 1} de ${total}...`);

        // Petición al servidor
        try {
            const response = await $.ajax({
                type: "POST",
                url: "afiliados/enviar_masivo.php",
                data: { id: idAfi }
            });
            if (response.trim() === "enviado") enviados++;
        } catch (error) {
            console.error("Error enviando ID: " + idAfi);
        }
        
        // Pausa de 200ms para evitar bloqueos de SMTP
        await new Promise(resolve => setTimeout(resolve, 200));
    }

    $('#modalProgreso').modal('hide');
    Swal.fire('Proceso Terminado', `Se enviaron correctamente ${enviados} correos de ${total}.`, 'success');
}