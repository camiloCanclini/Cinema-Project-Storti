<?php
    function conectDb(){
		$user = "root";
        $pass = "admin";
        $database = "cinema_master";
        $ip = "127.0.0.1";
        $link = mysqli_connect($ip, $user, $pass, $database);
		if($link -> connect_error){
			die("No a sido posible establecer conexión con la base de datos");
		}else{
			return $link;
		}
	}
	conectDb();
	function disconectDb($link){
		$close = mysqli_close($link);
			if($close){
				echo 'La desconexion de la base de datos se ha hecho satisfactoriamente <br>';
			}else{
				echo 'Ha sucedido un error inexperado en la desconexion de la base de datos <br>';
			}   
		return $close;
	}

?>