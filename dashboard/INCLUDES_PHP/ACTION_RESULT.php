<?php
/*Резутьтат обработки PHP скрипта
 Работает след образом, стартуем сесию, инклюдим данный скрипт в форму, вызываем нужный скрипт на выполнение 
 * при успешном выполнии ложим текст в $_SESSION['OK'], при ошибке  $_SESSION['ERR']
 *  */

switch (isset($_SESSION)) {
    //Показывает сообщение с ошибкой
    case isset($_SESSION['ERR']): //слово
        echo '<script>alert( "ОШИБКА!  ' . $_SESSION["ERR"] . '");</script>';
        unset( $_SESSION["ERR"]);
        break;
    //Показывает сообщение об успешном выполнении
    case isset($_SESSION['OK']): //слово
        echo '<script>alert("' . $_SESSION["OK"] . '");</script>';
        unset( $_SESSION["OK"]);
        break;
}
?>