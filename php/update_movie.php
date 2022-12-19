<?php
   include('conection_database.php');

    $enlace = conectDb();
    
    mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

    if (isset($_POST['actualizar'])) {
        
        $id = $_GET['id'];
        $titulo = $_POST['titulo'];
        $año = $_POST['año'];
        $duracion = $_POST['duracion'];
        $clasificacion = $_POST['clasificacion'];
        $genero = $_POST['genero'];
        $poster = $_POST['poster'];

        $query = "UPDATE `Peliculas` SET `titulo` = '$titulo', `año` = '$año', `duracion` = '$duracion', `clasificacion` = '$clasificacion', `genero` = '$genero', `poster` = '$poster' WHERE `imdbID` = '$id';";

        //echo $query;
        $result = mysqli_query($enlace, $query);

        if(!$result) {
           
            die("Query Failed.");
        }
        //$_SESSION['message'] = 'Task Saved Successfully';
        //$_SESSION['message_type'] = 'success';
        header('Location: ../pages/abm/modPeliculas.html');

    }
    
?>