<ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
    <li class="nav-item has-treeview menu-open">
        <a href="iniciar.php" class="nav-link active">
            <i class="nav-icon fas fa-home"></i>
            <p>Inicio</p>
        </a>
    </li>
    <?php
    switch ($_SESSION["rol"]) {
        case "Administrador":
    ?>

            <li class="nav-item has-treeview">
                <a href="afiliaciones/" class="nav-link" target="_blank">
                    <i class="nav-icon fas fa-user-check"></i>
                    <p>Iniciar votación</p>
                </a>
            </li>
            <li class="nav-item has-treeview">
                <a href="afiliaciones.php" class="nav-link">
                    <i class="nav-icon fas fa-users"></i>
                    <p>Afiliaciones</p>
                </a>
            </li>
            <li class="nav-item has-treeview">
                <a href="jornadas.php" class="nav-link">
                    <i class="fas fa-tasks nav-icon"></i>
                    <p>Jornadas electorales</p>
                </a>
            </li>
            <li class="nav-item has-treeview">
                <a href="candidatos.php" class="nav-link">
                    <i class="nav-icon fas fa-user-friends"></i>
                    <p>Candidatos</p>
                </a>
            </li>
            <li class="nav-item has-treeview">
                <a href="escrutinio.php" class=" nav-link">
                    <i class="nav-icon fas fa-poll-h"></i>
                    <p>Escrutinio</p>
                </a>
            </li>
            <li class="nav-item">
                        <a href="parametros.php" class="nav-link">
                            <i class="fas fa-cogs nav-icon"></i>
                            <p>Parámetros</p>
                        </a>
                    </li>
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-clipboard-list"></i>
                    <p> Reporte
                        <i class="fas fa-angle-left nav-icon"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">

                    <li class="nav-item">
                        <a href="ReporteJornadas.php" class="nav-link">
                            <i class="far fa-calendar-alt nav-icon"></i>
                            <p>Reporte de las jornadas</p>
                        </a>
                    </li>
                    

                </ul>
            </li>
            
            <li class="nav-item has-treeview">
                <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-tools"></i>
                    <p> Opciones del sistema
                        <i class="fas fa-angle-left nav-icon"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="usuarios.php" class="nav-link">
                            <i class="fas fa-users nav-icon"></i>
                            <p>Admin usuarios</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="roles.php" class="nav-link">
                            <i class="fas fa-user-tag nav-icon">
                            </i>
                            <p>Admin roles</p>
                        </a>
                    </li>
                    

                </ul>
            </li>

        <?php
            break;
        case "Super":
        ?>
            
            
    <?php
            break;
    }
    ?>
    <li class="nav-header"></li>
    <li class="nav-item has-treeview ">
        <a href="salir.php" class="nav-link">
            <i class="fas ion-log-out nav-icon"></i>
            <p>Cerrar sesión </p>
        </a>
    </li>

</ul>