<?php
include('conection_database.php');
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8
if (isset($_GET['imdbID'])) {
    $api_url = "http://www.omdbapi.com/?apikey=cf09fe5c&i=";
    $new_url = $api_url.$_GET['imdbID'];
    $api_url_request = file_get_contents($new_url);
    $array_response = json_decode($api_url_request,true);
    //print_r($b);
    //echo $b['Title'];
    
    $imdbID = $array_response['imdbID'];
    $titulo = $array_response['Title'];
    $año = $array_response['Released'];
    $duracion = $array_response['Runtime'];
    $clasificacion = $array_response['Rated'];
    $genero = $array_response['Genre'];
    $director = $array_response['Director'];
    $actores = $array_response['Actors'];
    $pais_origen = $array_response['Country'];
    $poster = $array_response['Poster'];

    $query = "INSERT INTO `Peliculas`(`imdbID`,`titulo`, `año`, `duracion`, `clasificacion`, `genero`, `director`, `actores`, `pais_origen`, `poster`) VALUES ('$imdbID','$titulo', '$año', '$duracion', '$clasificacion', '$genero', '$director', '$actores', '$pais_origen', '$poster');";
    $result = mysqli_query($enlace, $query);
    echo $query;

    if(!$result) {
        
        die("Query Failed.");
    }
    //$_SESSION['message'] = 'Task Saved Successfully';
    //$_SESSION['message_type'] = 'success';
    header('Location: ../pages/abm/modPeliculas.html');
}
?>