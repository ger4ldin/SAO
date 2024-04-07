<?php
include("./cn.php");
include("./cors.php");

if(!isset($_POST['email'])) die("Error a recibir email");
if(!isset($_POST['password'])) die("Error a recibir password");

$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];
// $contrasena = password_hash($contrasena, PASSWORD_DEFAULT);

$entrar = "SELECT id,email FROM user WHERE email='$correo' AND password='$contrasena'";
$respuesta = mysqli_query($con, $entrar);
if (!$respuesta) {
    die("Error: " . mysqli_error($con));
} else {
    if (mysqli_num_rows($respuesta) == 0) {
        echo "<script>alert('Error al iniciar sesión: El correo electrónico y/o la contraseña son incorrectos.');</script>";
        exit;
    } else {
        $fila = mysqli_fetch_assoc($respuesta);
        var_dump($fila);
        $id=$fila['id'];
        if ($fila['email'] === 'admin@admin.com' && $contrasena === 'admin1234') {
            echo "<script>
                sessionStorage.setItem('sesion', 1)
                sessionStorage.setItem('iduser', $id)
                sessionStorage.setItem('is_user', false)
                window.location.href='http://localhost/SAO/html/principalAdmin.html'
            </script>";
            exit;
        } else {
            echo "<script> 
            sessionStorage.setItem('sesion', 1)
            sessionStorage.setItem('iduser', $id)
            sessionStorage.setItem('is_user', true)
                window.location.href='http://localhost/SAO/html/principalUser.html'
            </script>";
            exit;
        }
    }
}

?>