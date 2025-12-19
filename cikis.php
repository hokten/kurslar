<?php 
session_start();
unset($_SESSION["kullanici"]);
session_destroy();
header("Location: giris.php");
?>