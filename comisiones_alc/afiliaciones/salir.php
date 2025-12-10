<?php
ini_set('default_charset', 'UTF8');
require "seguro.php";

session_start();
session_destroy();
header("location: index.php");
