<?php
include("../php/cn.php");
include("../php/cors.php");
include("../php/getAll.php");
include("../php/utils.php");


$getCategories = "SELECT * FROM cat_category";
$resCategories=mysqli_query($con,$getCategories);
$json = array();
while ($row = mysqli_fetch_assoc($resCategories)) {
    $json[] = $row;
}
die(json_encode(["success" => false,"data" => $json]));


