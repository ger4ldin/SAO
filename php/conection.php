<?php
$host = 'localhost';
$dbname = 'sao';
$user = 'root';
$password = '';

$con = mysqli_connect($host, $user, $password, $dbname);
mysqli_set_charset($con, "utf8");
if (!$con) {
  die("Could not connect to db");
}
?>