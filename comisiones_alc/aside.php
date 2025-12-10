<a href="iniciar.php" class="brand-link text-center">
    <?php 
     if($_SESSION["rol"] == "Super" OR $_SESSION["rol"] == "Administrador" OR $_SESSION["rol"] == "Técnico")
     {
    ?>
        <img src="plantilla/dist/img/ACELogoBlanco.png" width="230">
    <?php  
     }
     else
     { 
    $pa = $con->consulta("SELECT parametros.municipalidad, municipios.municipio, parametros.logo 
                                FROM parametros INNER JOIN municipios ON parametros.id_muni = municipios.id_muni 
                                INNER JOIN departamentos ON parametros.id_depto = departamentos.id_depto 
                                AND municipios.id_depto = departamentos.id_depto WHERE parametros.eliminado = 0 
                                AND parametros.estado = 'Activo' AND municipios.id_muni = '$_SESSION[muni]' 
                                AND departamentos.id_depto = '$_SESSION[depto]'");
        $para = $con->arreglo($pa); ?>
        <img src="parametros/logos/<?php echo $para["logo"]; ?>" height="60" width="60">

    <?php 
     }
    ?>
</a>
<!-- Sidebar -->
<div class="sidebar">
    <!-- Sidebar user panel (optional) -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="info" style="font-size: 15px;">
            <a class="d-block"><?php echo $_SESSION["nom"]; ?></a>
            <a class="d-block"><?php echo $_SESSION["rol"]; ?></a>
        </div>
    </div>
    <!-- Sidebar Menu -->
    <nav class="mt-2">
        <?php include("menu.php"); ?>
    </nav>
    <!-- /.sidebar-menu -->
</div>
<!-- /.sidebar -->