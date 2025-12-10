	$('#btnPromt').click(function(){
    swal({
        title: "Seguro que quieres hacer esto?",
          text: "Esta acción ya no se podrá deshacer, Así que piénsalo bien.",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, estoy seguro',
          cancelButtonText: "Cancelar"
        });
});