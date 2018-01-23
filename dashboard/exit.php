<?php
   // unset($_COOKIE[session_name()]);
   // unset($_COOKIE[session_id()]);
    session_start();
    session_unset();
    session_destroy();
    header('Location:dblogin.php');
    exit;
    
?>
