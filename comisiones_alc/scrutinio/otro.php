<?php 
                $vo = $con->consulta("SELECT MAX(totalSalary) maxSalary , id FROM( SELECT id_candidato as id , SUM(voto) AS totalSalary FROM votacion WHERE id_jornada = '$ver[id_jornada]' AND eliminado = 0 GROUP BY votacion.id_candidato) AS tempTable ");
                $conteo = $con->arreglo($vo);

                $minimo = $con->consulta("SELECT MIN(totalSalary) maxSalary, id FROM( SELECT id_candidato as id, SUM(voto) AS totalSalary FROM votacion WHERE id_jornada = '$ver[id_jornada]' AND eliminado = 0 GROUP BY votacion.id_candidato) AS tempTable "); 
                $min = $con->arreglo($minimo);                                          
                $mayor = $conteo["maxSalary"];
                $minmo = $min["maxSalary"];

                if ($mayor == $minmo)
                {                                    
                  $empate = $con->consulta("SELECT SUM(voto) AS total, id_candidato FROM	votacion WHERE id_jornada = '$ver[id_jornada]' AND eliminado = 0 GROUP BY	id_candidato HAVING SUM(voto) = '$mayor' AND SUM(voto) = '$minmo'");  
                  $conteoEm=$con->conteo($empate);   
                      
                  if ($conteoEm > 1)
                  {
              ?>
                    
              <?php 
                  }
                  else if($conteoEm = 1) 
                  {
              ?>
                    <a class="btn btn-info" href="<?php echo "scrutinio/generarActaFinal.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta de ganador de miembro propietario </a>
                    <?php                
                  }
                }                      
                else if($mayor > $minmo)
                {
                  $compara = $con->consulta("SELECT	SUM(voto) AS voto, id_candidato FROM votacion	WHERE	id_jornada = '$ver[id_jornada]' GROUP BY id_candidato HAVING COUNT( voto ) > 1");
                  $comparaCon = $con->conteo($compara);       
  
                  $compara2 = $con->consulta("SELECT SUM(voto), id_candidato FROM	votacion	WHERE	id_jornada = '$ver[id_jornada]' GROUP BY id_candidato ");
                  $comparaCon2 = $con->conteo($compara2);         

                  if ($comparaCon <> $comparaCon2)
                  {
              ?>
                    <a class="btn btn-info" href="<?php echo "scrutinio/actaFinalEmpatePropietario.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta de empate en el mie mbro propietario</a>
              <?php 
                  }
                  else if ($comparaCon == $comparaCon2)
                  { 
              ?>
                    <a class="btn btn-info" href="<?php echo "scrutinio/generarActaFinal.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta para una persona ganadora</a> 
              <?php
                  }
                }
              ?>


<!--  

<?php 
  // } } 
                                                                    
    /*
  $to=$con->consulta("	SELECT  MAX(totalSalary) maxSalary 
FROM( SELECT  SUM(voto) AS totalSalary FROM votacion WHERE id_jornada='$ver[id_jornada]' AND eliminado = 0  and id_candidato='$conteo[id_candidato]' GROUP BY 	votacion.id_candidato  ) AS tempTable ");  
    
    $da=$con->arreglo($to);
   echo  $da["maxSalary"];
$consulta=$con->consulta("SELECT  SUM(voto) AS totalSalary FROM votacion WHERE id_jornada=54 AND eliminado = 0  and id_candidato='63' GROUP BY 	votacion.id_candidato ");    
*/

    
    
    



   
                ?>
 
          <?php     ?>
              <!--<a class="btn btn-info" href="<?php //echo "scrutinio/generarActaFinal.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta para una persona ganadora</a>
              <a class="btn btn-info" href="<?php //echo "scrutinio/actaFinalEmpatePropietario.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta de empate en el miembro propietario</a>
              <a class="btn btn-info" href="<?php //echo "scrutinio/actaFinalEmpateSuplente.php?id=". base64_encode($ver["id_jornada"]);?>" target="_blank"><i class="fas fa-file-download"></i> Acta de empate en el miembro suplente</a>-->
              <?php //}  ?>
         
        <?php //} else { ?>
          
<?php //} ?> -->