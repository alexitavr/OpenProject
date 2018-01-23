<?php
session_start();
include( "INCLUDES_PHP/dbORA.php" );
  //include( "START_SESSION.php" );
require_once $_SERVER['DOCUMENT_ROOT'] . "/cota/F0409303/F0409303_dbORA.php";
?>
<!doctype html>
<html>
    <head>

        <meta charset="utf-8">
        <title>Авторизация в базе:</title>


        <!-- THEME STYLES -->
        <link href="css/layout.min.css" rel="stylesheet" type="text/css"/>        
        <style>
            body {
                background:url(img/1920x1080/01.jpg); 
                color: #fff; 
            }
        </style>
    </head>
    <body> 
        <div class="content-lg container" align="center">
            <div class="row">
                <h1  class="color-white">  Вход в систему отчетности COTA</h1>
                <form action="dblogin.php" method="post">
                    <br><br><input type="text" name="login" value="" class="form-control" placeholder="Имя пользователя*" style="text-transform:uppercase;" >
                    <br><br><input type="password" name="password" value="" class="form-control " placeholder="Пароль* ">
                    <br><br><input type="text" name="server" value="COTA_TEST.world" class="form-control margin-b-20"placeholder="Сервер Oracle*">

                    <!--  <div class="checkbox color-white">
                        <label>
                             <input type="checkbox" value="remember-me"> Запомнить меня
                         </label>
                     </div>-->
                    <br><input type="submit" name="submit" value="Войти" class="btn-theme btn-theme-sm btn-base-bg text-uppercase">
                </form>
            </div>
        </div>
    </div>
</html>      


<?php 
//$connection = mysqli_connect('localhost', 'root', '12345', 'cota') or die(mysqli_error()); // Соединение с базой данных 
?>

<?php
if (isset($_POST['submit'])) { // Отлавливаем нажатие кнопки "Отправить"
    if (empty($_POST['login'])) { // Если поле логин пустое
        echo '<script>alert("Поле логин не заполненно");</script>'; // То выводим сообщение об ошибке
    } elseif (empty($_POST['password'])) { // Если поле пароль пустое
        echo '<script>alert("Поле пароль не заполненно");</script>'; // То выводим сообщение об ошибке
    } elseif (empty($_POST['server'])) { // Если поле пароль пустое
        echo '<script>alert("Поле сервер не заполненно");</script>'; // То выводим сообщение об ошибке
    } else {  // Иначе если все поля заполненны
        $_SESSION['login'] = $_POST['login']; // Заносим в сессию  логин 
        $_SESSION['password'] = $_POST['password']; // Заносим в сессию  пароль
        $_SESSION['server'] = $_POST['server']; // Заносим в сессию сервер

        $dbORAconnect = getOracleSesion();
        //Проверяем коннект если ок переадресуем 
        if ($dbORAconnect) {

            $_SESSION['authorized'] = 1;
            OCILogoff($dbORAconnect); //Закрываем коннект, нечего ему висеть, переоткроем по потребности
            //  ini_set('display_errors',1);
            //  error_reporting(E_ALL);
            //   echo(sid);
            header('Location:MENU.php');
            exit;
        }


        /* $login = $_POST['login']; // Записываем логин в переменную 
          $password = $_POST['password']; // Записываем пароль в переменную
          $query = mysqli_query($connection, "SELECT `id` FROM `users` WHERE `login` = '$login' AND `password` = '$password'"); // Формируем переменную с запросом к базе данных с проверкой пользователя
          $result = mysqli_fetch_array($query); // Формируем переменную с исполнением запроса к БД

          /*if (empty($result['id'])) // Если запрос к бд не возвразяет id пользователя
          {
          echo '<script>alert("Неверные Логин или Пароль");</script>'; // Значит такой пользователь не существует или не верен пароль
          }
          else // Если возвращяем id пользователя, выполняем вход под ним
          { */
        /* $_SESSION['password'] = $password; // Заносим в сессию  пароль
          $_SESSION['login'] = $login; // Заносим в сессию  логин
          $_SESSION['id'] = $result['id']; // Заносим в сессию  id
          echo '<div align="center">Вы успешно вощли в систему: '.$_SESSION['login'].'</div>'; // Выводим сообщение что пользователь авторизирован

          //header('Location:cota_menu.php');
          //exit;
          // } */
    }
}
?>

<?php
/* if (isset($_GET['exit'])) { // если вызвали переменную "exit"
  unset($_SESSION['password']); // Чистим сессию пароля
  unset($_SESSION['login']); // Чистим сессию логина
  unset($_SESSION['id']); // Чистим сессию id
  } */
?>

<?php
/* if (isset($_SESSION['login']) && isset($_SESSION['id'])) { // если в сессии загружены логин и id
  echo '<div align="center"><a href="dblogin.php?exit">Выход</a></div>'; // Выводим нашу ссылку выхода
  } */
?>

<?php
/* if (!isset($_SESSION['login']) || !isset($_SESSION['id'])) { // если в сессии не загружены логин и id

  } */
?>
