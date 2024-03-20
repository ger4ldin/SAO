<?php
$nombre = $_POST['nombre'];
$apeP = $_POST['apeP'];
$apeM = $_POST['apeM'];
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

include("../conection.php");

$insertar = "INSERT INTO user (name, lastnameF, lastnameM, email, password, id_address, id_user, status) 
    VALUES ('$nombre', '$apeP', '$apeM', '$correo', '$contrasena',1,1,3)";
$respuesta = mysqli_query($con, $insertar);

$sentenciaSesion = "SELECT id,id_user FROM user WHERE email='$correo' and password='$contrasena'";
$resUser=mysqli_query($con,$sentenciaSesion);
if($resUser){
    while ($row = mysqli_fetch_assoc($resUser)) {
        $id = $row['id'];
        $id_user = $row['id_user'];
    }
        // die(json_encode([
        //     "success" => true,
        //     "data" => "Usuario Registrado",
        //     "id" => $id,
        //     "is_user" => ($id_user==="3")
        // ]));
}



if (!$respuesta)  die("error al insertar");
    echo "<script>
        sessionStorage.setItem('sesion', 1)
        sessionStorage.setItem('iduser', $id)
        sessionStorage.setItem('is_user', true)
        window.location.href='http://localhost/SAO/html/productos.html'
        
        </script>";
?>
