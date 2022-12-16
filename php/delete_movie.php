<?php

include('conection_database.php');
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

if  (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "DELETE FROM `Peliculas` WHERE `imdbID` = '$id';";
    $result = mysqli_query($enlace, $query);
    if(!$result){
        die("Query Failed.");
    }
    header('Location: ../pages/abm/modPeliculas.html');
}

?>