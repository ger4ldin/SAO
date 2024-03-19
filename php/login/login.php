<?php
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

include("../conection.php");
// $contrasena = password_hash($contrasena, PASSWORD_DEFAULT);

$entrar = "SELECT email, password FROM user WHERE email='$correo' AND password='$contrasena'";
$respuesta = mysqli_query($con, $entrar);
if (!$respuesta) {
    die("Error: " . mysqli_error($con));
} else {
    if (mysqli_num_rows($respuesta) == 0) {
        echo "<script>alert('Error al iniciar sesión: El correo electrónico y/o la contraseña son incorrectos.');</script>";
        exit;
    } else {
        $fila = mysqli_fetch_assoc($respuesta);
        if ($fila['email'] === 'admin@gmail.com' && $contrasena === 'admin1234') {
            echo "<script>window.location.href='http://localhost/SAO/html/indexAdmin.html'</script>";
            exit;
        } else {
            echo "<script> window.location.href='http://localhost/SAO/html/index.html'</script>";
            exit;
        }
    }
}

?>