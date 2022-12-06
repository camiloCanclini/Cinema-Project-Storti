<?php
    
    include('conection_database.php');
    $enlace = connectDb();
    mysqli_set_charset($enlace, "utf8"); //formato de datos utf8
    
    if (isset($_POST['login'])){
        
        $email = $_POST['email'];
        $contraseña = $_POST['contraseña'];

        $query = "SELECT * FROM `usuarios` WHERE `id`=1 AND `email`='$email' AND `password`='$contraseña'";
        $result = mysqli_query($enlace, $query);
        
        if (mysqli_num_rows($result)==1) {
            header('Location: ../pages/abm.html');
        }else{
            header('Location: ../pages/login.html');
            
        }
        
    } 
    
?>