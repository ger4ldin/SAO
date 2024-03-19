<?php
$product_name = $_POST['product_name'];
$category = $_POST['category'];
$quantity = $_POST['quantity'];
$product_details = $_POST['product_details'];
$price = $_POST['price'];

include("../conection.php");

$insertar = "INSERT INTO producto (nombreproducto, categoriaId, stock, detallesproducto, precio)
VALUES ('$product_name', '$category', '$quantity', '$product_details', '$price')";

$respuesta = mysqli_query($con, $insertar);
if (!$respuesta)  die("error al insertar");
    echo "Producto registrado correctamente";   

?>