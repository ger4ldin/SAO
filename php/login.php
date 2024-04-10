<?php
include("./cn.php");
include("./cors.php");

if(!isset($_POST['correo'])) die("Error a recibir email");
if(!isset($_POST['contrasena'])) die("Error a recibir password");

$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

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
                localStorage.setItem('sesion', 1)
                localStorage.setItem('iduser', $id)
                localStorage.setItem('is_user', false)
                window.location.href='../html/principalAdmin.html'
            </script>";
            exit;
        } else {
            echo "<script> 
            localStorage.setItem('sesion', 1)
            localStorage.setItem('iduser', $id)
            localStorage.setItem('is_user', true)
                window.location.href='../html/principalUser.html'
            </script>";
            exit;
        }
    }
}

?>