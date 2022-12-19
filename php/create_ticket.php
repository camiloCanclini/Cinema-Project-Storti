<?php
include('conection_database.php');
$precio_ticket = 500;
$enlace = conectDb();
mysqli_set_charset($enlace, "utf8"); //formato de datos utf8

$data = json_decode(file_get_contents("php://input"));

   $funcion = $data->funcion;
   $precio = $data->precio;
   $tipo = $data->tipo;
   $cantidad = $data->cantidad;
   $confirmar = $data->confirmar;

if (isset($confirmar)) {
    $fecha = date('d/m/y h:i:s');
    if ($tipo == "true") {
        $tipo = "Jubilado";
    }else{
        $tipo = "Normal";
    }

    try {
        $query = "INSERT INTO `Entradas`(`fecha`, `tipo`, `precio`, `cantidad_tickets`, `fk_numero_funcion`) VALUES ('$fecha','$tipo', '$precio', '$cantidad', '$funcion');";
        $result = mysqli_query($enlace, $query);
        echo "true";
    } catch (\Throwable $th) {
        echo "false";
    }
    
    
}
?>