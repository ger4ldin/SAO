<?php
include("../cn.php");
include("../cors.php");

if(!isset($_POST['category'])) die("Error a recibir la categoria");

$category = intval($_POST['category'] ?? 0);
if($category <= 0 || $category >= 5 ) die("La categoria no es correcta");

$sentenciaSesion = "SELECT p.id,p.name,p.imagen,p.description,p.dimensions,p.stock,p.price,cc.category,cb.brand
    FROM product p
    INNER JOIN cat_category cc ON p.id_category=cc.id
    INNER JOIN cat_brand cb ON p.id_brand=cb.id
    WHERE p.id_category=$category";

$resUser=mysqli_query($con,$sentenciaSesion);

$json = array();
while ($row = mysqli_fetch_assoc($resUser)) {
    $json[] = $row;
}
die(json_encode([
    "success" => true,
    "data" => $json
]));






