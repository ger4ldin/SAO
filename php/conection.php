<?php
$host = 'localhost';
$dbname = 'integradoranorma';
$user = 'root';
$password = '';

$con = mysqli_connect($host, $user, $password, $dbname);
mysqli_set_charset($con, "utf8");
if (!$con) {
  die("No se ha podido conectar a la base de datos");
}
?>