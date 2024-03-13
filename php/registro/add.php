<?php
$nombre = $_POST['nombre'];
$apeP = $_POST['apeP'];
$apeM = $_POST['apeM'];
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

include("../conection.php");

$insertar = "INSERT INTO usuarios (nombre, apellidopaterno, apellidomaterno, correoelectronico, contraseña) 
    VALUES ('$nombre', '$apeP', '$apeM', '$correo', '$contrasena')";
$respuesta = mysqli_query($con, $insertar);
if (!$respuesta)  die("error al insertar");
    echo "<script>
    window.location.href='http://localhost/SAO/html/login.html'
</script>";
?>
