<?php
include('conection_database.php');
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8


$query = "SELECT * FROM Programacion LEFT OUTER JOIN Peliculas ON Programacion.fk_id_pelicula = Peliculas.imdbID LEFT OUTER JOIN Salas ON Programacion.fk_numero_sala = Salas.id LEFT OUTER JOIN Cines ON Salas.numero_cine = Cines.numero;";
$result = mysqli_query($enlace, $query);
//echo $query;

if(!$result){
    die("Query Failed.");
}
$rawdata = array(); //creamos un array, que se convertira a JSON
$i = 0;
while($row = mysqli_fetch_array($result))//Se recorre el resultado de la consulta
{
    $rawdata[$i] = $row;//Se guarda en forma de arbol el resultado
    $i++;
}
$convertedArray = json_encode($rawdata);//Se convierte array a json
echo $convertedArray;//Se "envia" a JS en formato JSON

?>