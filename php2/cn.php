<?php
    $con = mysqli_connect('localhost','root','','integradoranorma5');
    mysqli_set_charset($con, "utf8");
    
    if(!$con){
        die("No se ha podido conectar a la base de datos: " . mysqli_connect_error());
    }
?>