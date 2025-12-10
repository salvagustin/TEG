<?php
    session_start();
    if(!isset($_SESSION["seg"]) or $_SESSION["seg"] != "ok")
    {
        //header("location: ../index.php");
        echo "<script> window.location.href='index.php'; </script>";
    }
