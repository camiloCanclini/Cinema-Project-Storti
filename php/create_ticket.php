<?php
include('conection_database.php');
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

if (isset($_POST['confirmar'])) {
    
    $fecha = date('d/m/y h:i:s');
    echo $fecha;
    $edad = $_POST['edad'];
    $cantidad_entradas = $_POST['cantidad_entradas'];
    $tipo = $_POST['jubilado'];
    if ($tipo = "true") {
        $tipo = "Jubilado";
    }else{
        $tipo = "Normal";
    }
    $precio = $_POST['precio'];
    $fk_numero_funcion = $_POST['fk_numero_funcion'];

    $query = "INSERT INTO `Peliculas`(`fecha`, `tipo`, `precio`, `fk_numero_funcion`) VALUES ('$fecha','$tipo', '$precio', '$fk_numero_funcion');";
    $result = mysqli_query($enlace, $query);

    if(!$result) {
        
        die("Query Failed.");
    }
    //$_SESSION['message'] = 'Task Saved Successfully';
    //$_SESSION['message_type'] = 'success';
    header('Location: ../pages/abm/modPeliculas.html');
}
?>