<?php

include('conection_database.php');
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8
if  (isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "SELECT * FROM Peliculas WHERE imdbID='$id'";
    $result = mysqli_query($enlace, $query);
    if(!$result){
        die("Query Failed.");
    }
    if (mysqli_num_rows($result) == 1) {
        
        $rawdata = array(); //creamos un array, que se convertira a JSON
        $i = 0;
        while($row = mysqli_fetch_array($result))//Se recorre el resultado de la consulta
        {
            $rawdata[$i] = $row;//Se guarda en forma de arbol el resultado
            $i++;
        }
        $convertedArray = json_encode($rawdata);//Se convierte array a json
        echo $convertedArray;//Se "envia" a JS en formato JSON
    }else{
        header('Location: ../pages/abm/modPeliculas.html');
    }
}else{
    header('Location: ../pages/abm/modPeliculas.html');
}

?>