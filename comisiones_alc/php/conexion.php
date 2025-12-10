<?php 

ini_set('default_charset','UTF8');

class cnn {

private $conexion;

  public function __construct()

  {

   if(!isset($this->conexion))

   {
      
   $this->conexion = (mysqli_connect("localhost","root","",'comisiones')) or die(mysqli_error($this->conexion)); 
    //$this->conexion = (mysqli_connect("localhost","teg","teg2020$$**","comi")) or
   //$this->conexion = (mysqli_connect("localhost","root","","comi")) or die(mysqli_error($this->conexion));
   //$connection = mysqli_connect($host,$usuario,$password, $basedatos);
   //mysqli_query("SET NAMES 'utf8'");

    //mysqli_select_db($this->conexion,"alc4arw3_comisiones") or die(mysqli_error($this->conexion));
    mysqli_select_db($this->conexion,"comisiones") or die(mysqli_error($this->conexion));

    mysqli_set_charset($this->conexion,"UTF8");

   }

  }

public function consulta($consulta)

 {

  //$this->conexion++;

  $resultado = mysqli_query($this->conexion,$consulta);

  if(!$resultado)

  {

   echo 'MySQL Error: ' . mysqli_error($this->conexion);

   exit;

  }

  return $resultado;

 }

// Metodo fetch array 

public function arreglo($consulta)

{

return mysqli_fetch_array($consulta);

}

// Metodo conteo de registros

public function conteo($consulta)

{

return mysqli_num_rows($consulta);

}

// Metodo conteo de registros

public function totalregis()

{

return $this->total_consultas;

}

}

