<?php

$email = $_POST['email'];
$contra = $_POST['contra'];

if ($email == 'admin@admin' and $contra == 'admin') {
    header('Location: ../pages/abm_menu.html');
    exit;
} else {
    header('Location: ../index.html');
    exit;
}

?>