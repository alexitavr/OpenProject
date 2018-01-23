<?php
/*
Центровой инклюд для всех форм 
*/
session_start();
if ($_SESSION['authorized'] <> 1) {
    header('Location:exit.php');
    exit;
}
   //Создание переменной пути к корню
        if (!isset($_SESSION['DBOARDWAY'])){
                $str = $_SERVER['REQUEST_URI2'];
            if(isset($_SERVER['HTTPS'])){
                $DBOARDWAY = 'https://';
            }else{
                $DBOARDWAY = 'http://';
            };
            $DBOARDWAY = $DBOARDWAY.$_SERVER['SERVER_NAME'].substr($str, 0, strrpos($str, '/'));
            $_SESSION['DBOARDWAY'] = $DBOARDWAY;
        }
        else
        {
            $DBOARDWAY = $_SESSION['DBOARDWAY'];
        }

include( "dbORA.php" );
include( "ACTION_RESULT.php" );
//include( "FILE_WORK.php" );
?>