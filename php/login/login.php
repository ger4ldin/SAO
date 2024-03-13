<?php
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

include("../conection.php");
$contrasena = password_hash($contrasena, PASSWORD_DEFAULT);

$entrar = "SELECT correoelectronico, contraseña FROM usuarios WHERE correoelectronico='$correo' AND contraseña='$contrasena'";
$respuesta = mysqli_query($con, $entrar);
if (!$respuesta) {
    die("error al iniciar sesión");
} else {
    echo "<script>window.location.href='http://localhost/SAO/html/index.html'</script>";
    exit;
}
?>