<?php
include("./cn.php");
include("./cors.php");
include("./utils.php");

if(!isset($_POST['nombre'])) json_encode(["success" => false,"error" => "Error a recibir name"]);
if(!isset($_POST['apeP'])) json_encode(["success" => false,"error" => "Error a recibir spelitF"]);
if(!isset($_POST['apeM'])) json_encode(["success" => false,"error" => "Error a recibir spelitM"]);
if(!isset($_POST['correo'])) json_encode(["success" => false,"error" => "Error a recibir email"]);
if(!isset($_POST['contrasena'])) json_encode(["success" => false,"error" => "Error a recibir password"]);

$nombre = $_POST['nombre'];
$apeP = $_POST['apeP'];
$apeM = $_POST['apeM'];
$correo = $_POST['correo'];
$contrasena = $_POST['contrasena'];

$sentenciaEmail = "SELECT * FROM user WHERE email='$contrasena'";
$resUser=mysqli_query($con,$sentenciaEmail);
if($resUser){
    if(mysqli_num_rows($resUser)>0){
        die(json_encode(["success" => false,"data" => "El correo ya esta registrado"]));
    }
}

$insertar = "INSERT INTO user (name, lastnameF, lastnameM, email, password, id_address, id_user, status) 
    VALUES ('$nombre', '$apeP', '$apeM', '$correo', '$contrasena',1,3,3)";
$respuesta = mysqli_query($con, $insertar);

$sentenciaSesion = "SELECT id,id_user FROM user WHERE email='$correo' and password='$contrasena'";
$resUser=mysqli_query($con,$sentenciaSesion);

$id=1;
if($resUser){
    while ($row = mysqli_fetch_assoc($resUser)) {
        $id = $row['id'];
    }
}

if (!$respuesta)  die("error al insertar");
    echo "<script>
        localStorage.setItem('sesion', 1)
        localStorage.setItem('iduser', $id)
        localStorage.setItem('is_user', true)
        window.location.href='../html/principalUser.html'
        </script>";
?>
