<?php
    
    
    function connectDb(){
		$user = "root";
        $pass = "";
        $database = "cinema_master";
        $ip = "localhost";
        $link = mysqli_connect($ip, $user, $pass, $database);
		if($link -> connect_error){
			die("No a sido posible establecer conexión con la base de datos");
		}else{
			//echo "conexion exitosa";
			return $link;
		}
	}
	function disconnectDb($link){
		$close = mysqli_close($link);
			if($close){
				echo 'La desconexion de la base de datos se ha hecho satisfactoriamente <br>';
			}else{
				echo 'Ha sucedido un error inexperado en la desconexion de la base de datos <br>';
			}   
		return $close;
	}

?>