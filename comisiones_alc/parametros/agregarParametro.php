<?php 

ini_set('default_charset', 'UTF8');



require "../php/conexion.php";



require "../seguro.php";



$con = new cnn();



$fecha = date("Y-m-d");



?>



<!DOCTYPE html>



<html lang="en">



<head>

	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>Admin Registros | CEGM</title>

	<!-- Tell the browser to be responsive to screen width -->

	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Font Awesome -->

	<link rel="stylesheet" href="../plantilla/plugins/fontawesome-free/css/all.min.css">

	<!-- Ionicons -->

	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

	<!-- Tempusdominus Bbootstrap 4 -->

	<link rel="stylesheet" href="../plantilla/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">

	<!-- iCheck -->

	<link rel="stylesheet" href="../plantilla/plugins/icheck-bootstrap/icheck-bootstrap.min.css">

	<!-- JQVMap -->

	<!-- Theme style -->

	<link rel="stylesheet" href="../plantilla/dist/css/adminlte.css">

	<!-- SweetAlert2 -->

	<link rel="stylesheet" href="../plantilla/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">

	<!-- Toastr -->

	<link rel="stylesheet" href="../plantilla/plugins/toastr/toastr.min.css">

	<script>

		function fileValidation() 



		{



			var fileInput = document.getElementById('logo');



			var filePath = fileInput.value;



			var allowedExtensions = /(.jpg|.jpeg|.png)$/i;



			



			if (!allowedExtensions.exec(filePath)) 



			{



				alert('Cargue un archivo con extensión .jpeg /.jpg /.png');



				fileInput.value = '';



				return false;



			}



		}



	</script>



</head>



<body>



	<div class="row">



		<div class="col">



			<form action="parametros/agregarDatos.php" method="post" enctype="multipart/form-data" id="form1" name="form1">



				<div class="card card-primary card-outline">



					<div class="card-header bg-primary">



						<h3 class="card-title">Nuevo parámetro</h3>



					</div>



					<div class="card-body">



						<div class="row">



							<div class="col">



								<div class="form-group">



									<label>Nombre de la municipalidad</label>



									<input type="text" id="municipalidad" name="municipalidad" class="form-control" placeholder="Nombre de la alcaldía...">



								</div>



							</div>



							<div class="col">



								<div class="form-group">



									<label>Nombre del encargado</label>



									<input type="text" class="form-control" id="alcalde" name="alcalde" placeholder="Nombre del encargado de...">



								</div>



							</div>



							<div class="col">



								<div class="form-group">



									<label>Cargo</label>



									<input type="text" class="form-control" id="cargoAlcalde" name="cargoAlcalde" placeholder="Cargo...">



								</div>



							</div>



						</div>



						<div class="row">



							<div class="col">



								<div class="form-group">



									<label>Nombre del secretario</label>



									<input type="text" class="form-control" id="nombreSecretario" name="nombreSecretario" placeholder="Nombre del secretario...">



								</div>



							</div>



							<div class="col">



								<div class="form-group">



									<label>Cargo</label>



									<input type="text" class="form-control" id="cargoSecretario" name="cargoSecretario" placeholder="Cargo del secretario...">



								</div>



							</div>



							<div class="col">



								<div class="form-group">



									<label>Teléfono</label>



									<input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono...">



								</div>



							</div>



						</div>



						<div class="row">



							<div class="col">



								<div class="form-group">



             			<label for="depto">Departamento</label>



									<select name="depa" id="depa" class="form-control select2">



										<?php



											$de = $con->consulta("SELECT * FROM departamentos WHERE eliminado = 0");



											while($depto = $con->arreglo($de)){ 



										?>



										<option value="<?php echo $depto["id_depto"]; ?>"><?php echo $depto["depto"];?></option>



										<?php } ?>



                	</select>



								</div>



							</div>



							<div class="col">



            		<div class="form-group">



                	<label for="">Municipio</label>



                	<select name="muni" id="muni" class="form-control select2">



                	</select>



              	</div> 



							</div>



							<div class="col">



								<div class="form-group">



									<label>Dirección</label>



									<input type="text" class="form-control" id="direc" name="direc" placeholder="Dirección...">



								</div>



							</div>



						</div>



						<div class="row">



							<div class="col">



								<div class="form-group">



									<label>Correo</label>



									<input type="text" class="form-control" id="correo" name="correo" placeholder="Correo...">       



								</div>



							</div>



							<div class="col">



								<div class="form-group">



									<label>Página Web</label>



									<input type="text" class="form-control" id="paginaW" name="paginaW" placeholder="URL...">



								</div>



							</div>



		        	<div class="col">



         				<div class="custom-file">



									<input type="file" class="custom-file-input" id="logo" name="logo" onchange="return fileValidation()">



									<label class="custom-file-label" for="logo">logo</label>



              	</div>                



            	</div>



						</div>

						<div class="row">

					<div class="col text-center">

				 <div class="form-group">

          <label>Miembro de la comisión transitoria de elección</label>



                <input type="text" class="form-control" id="miembro1" name="miembro1" >

                <input type="text" class="form-control" id="miembro2" name="miembro2">

                <input type="text" class="form-control" id="miembro3" name="miembro3" >

	                     </div>

	                    	</div> 

				         <div class="col text-center">

				        	<div class="form-group">

			    			 <label>Cargos </label>

			    		

             <input type="text" class="form-control" id="cargo1" name="cargo1" >

             <input type="text" class="form-control" id="cargo2" name="cargo2" >

            <input type="text" class="form-control" id="cargo3" name="cargo3" >

			            		</div>

		            		</div> 

                            </div>

 <div class="row">

 <div class="col text-center">



<div class="form-group">



<label>Nombre de los observadores</label>



<input type="text" class="form-control" id="observador" name="observador" >
<input type="text" class="form-control" id="observador2" name="observador2" >
<input type="text" class="form-control" id="observador3" name="observador3" >

	 </div>

		</div> 

				 <div class="col text-center">

					<div class="form-group">

						 <label>Cargo de los observadores </label>

						 <input type="text" class="form-control" name="cargoobservador" id="cargoobservador">
                        <input type="text" class="form-control" name="cargoobservador2" id="cargoobservador2">
                        <input type="text" class="form-control" name="cargoobservador3" id="cargoobservador3">

					</div>

				</div> 

		</div>

					</div>

					<div class="card-footer text-center">



						<button type="submit" class="btn btn-primary" id="boton" name="boton"><i class="far fa-save"></i> Guardar datos</button>



					</div>



				</div>



			</form>



		</div>



	</div>







	<script src="plantilla/plugins/jquery/jquery.min.js"></script>



	<!-- jQuery UI 1.11.4 -->



	<script src="plantilla/plugins/jquery-ui/jquery-ui.min.js"></script>



	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->



	<script>



		$.widget.bridge('uibutton', $.ui.button)



	</script>



	<script src="plantilla/dist/js/adminlte.js"></script>



	<!-- SweetAlert2 -->



	<script src="plantilla/plugins/sweetalert2/sweetalert2.min.js"></script>



	<!-- Toastr -->



	<script src="plantilla/plugins/toastr/toastr.min.js"></script>



	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>



	<script type="text/javascript">



		$(function() 



		{



			const Toast = Swal.mixin



			({



				toast: true,



				position: 'top-end',



				showConfirmButton: false,



				timer: 3000



			});  



		});







		$(document).ready(function()



    {



			$('#depa').val(0);



		  recargardeptoExpe();



		  $('#depa').change(function()



      {



			  recargardeptoExpe();



		  });



		})



		



	  function recargardeptoExpe()



    {



		  $.ajax({



				type:"POST",



				url:"parametros/deptoExpe.php",



				data:"continente=" + $('#depa').val(),



				success:function(r)



      	{



					$('#muni').html(r);



				}



	  	});



	  }



	  $(document).ready(function()



    {



		  $('#depto').val(0);



		  recargardepto();



		  $('#depto').change(function()



      {



			  recargardepto();



		  });



	  })







	  function recargardepto()



    {



		  $.ajax({



			type:"POST",



			url:"parametros/muni.php",



			data:"continente=" + $('#depto').val(),



			success:function(r)



      {



			  $('#muni').html(r);



			}



	  	});



	  }



  </script>



</body>



</html>