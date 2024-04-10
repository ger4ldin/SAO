<?php
include("../cn.php");
include("../cors.php");
include("../search.php");

if(!isset($_POST['id_user'])) die(json_encode(["success" => false,"error" => "Error a recibir el id del usuario"]));
if(!isset($_POST['id_product'])) die(json_encode(["success" => false,"error" => "Error a recibir el id del producto"]));

$id_user = $_POST['id_user'];
$id_product = $_POST['id_product'];

if(!Search::search_user($id_user)) die(json_encode(["success" => false,"data" => "El usuario no existe"]));
if(!Search::search_product($id_product)) die(json_encode(["success" => false,"data" => "El producto no existe"]));


$searchProduct = "SELECT COUNT(*) FROM cart WHERE id_user='$id_user' AND id_product='$id_product'";
$resSearchProduct=mysqli_query($con,$searchProduct);
if (mysqli_fetch_assoc($resSearchProduct)['COUNT(*)']>=1){
    die(json_encode(["success" => false,"data" => "El producto ya se habia agregado al carrito"]));}

$addToCart = "INSERT INTO cart (id_user, id_product) VALUES ($id_user, $id_product)";
$resAddToCart=mysqli_query($con,$addToCart);
if(!$resAddToCart) die(json_encode(["success" => false,"data" => "Hubo un error al insertar en el carrito"]));
die(json_encode(["success" => true,"data" => "Agregado al carrito"]));

?>