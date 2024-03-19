<?php
$product_name = $_POST['product_name'];
$category = $_POST['category'];
$quantity = $_POST['quantity'];
$product_details = $_POST['product_details'];
$price = $_POST['price'];

include("../conection.php");

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["image"]["name"]);

if(isset($_POST["submit"])) {
  $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

  if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
  && $imageFileType != "gif" ) {
    echo "Lo siento, solo JPG, JPEG, PNG & GIF.";
    exit;
  }

$insertar = "INSERT INTO producto (nombreproducto, categoriaId, stock, detallesproducto, precio)
VALUES ('$product_name', '$category', '$quantity', '$product_details', '$price')";

if (!file_exists($target_file)) {
    $stmt = $conn->prepare("INSERT INTO imagenes (nombre, tipo) VALUES (?, ?)");
    $stmt->bind_param("ss", $nombre, $tipo);
    $nombre = basename($_FILES["image"]["name"]);
    $tipo = $imageFileType;
    $stmt->execute();

    echo "El registro se ha insertado correctamente.";

    
if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
      echo "La imagen ha sido subida correctamente.";
    } else {
      echo "Lo sentimos, hubo un error al subir la imagen.";
    }
  } else {
    echo "Lo sentimos, el archivo ya existe.";
  }
}


$respuesta = mysqli_query($con, $insertar);
if (!$respuesta)  die("error al insertar");
    echo "Producto registrado correctamente";   


?>