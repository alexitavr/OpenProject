<!DOCTYPE html>
<?php
session_start();
//include( "INCLUDES_PHP/dbORA.php" );
?>

<html>
    <head>
        <meta charset="utf-8" />
        <title>RncbDashBoard login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />

    </head>
    <body>
<div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
  <div class="modal-content">
      <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
          <h1 class="text-center">Login</h1>
      </div>
      <div class="modal-body">
          <form class="form col-md-12 center-block">
            <div class="form-group">
              <input type="text" class="form-control input-lg" placeholder="Email">
            </div>
            <div class="form-group">
              <input type="password" class="form-control input-lg" placeholder="Password">
            </div>
            <div class="form-group">
              <button class="btn btn-primary btn-lg btn-block">Sign In</button>
              <span class="pull-right"><a href="#">Register</a></span><span><a href="#">Need help?</a></span>
            </div>
          </form>
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
		  </div>	
      </div>
  </div>
  </div>
</div>
        <div class="container py-5">
            <div class="row">
                <div class="col-md-12">
                    <h2 class="text-center mb-4">Витрины РНКБ</h2>
                    <div class="row">
                        <div class="col-md-6 mx-auto">
                            <span class="anchor" id="formLogin"></span>

                            <!-- form card login -->
                            <div class="card rounded-0">
                                <div class="card-header">
                                    <h3 class="mb-0">Вход</h3>
                                </div>
                                <div class="container">
                                    <form  action="dblogin.php" method="post" class="form" role="form" autocomplete="off" id="formLogin">
                                        <div class="form-group">
                                            <label for="uname1">Пользователь</label>
                                            <input type="text" class="form-control form-control-lg rounded-0" name="login" value='test' required="">
                                        </div>
                                        <div class="form-group">
                                            <label>Пароль</label>
                                            <input type="password" class="form-control form-control-lg rounded-0" name="password"  value='test' required="" autocomplete="new-password">
                                        </div>
                                        <div>
                                            <label class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input">
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description small">Запомнить</span>
                                            </label>
                                        </div>
                                        <input type="submit" name="submit" value="Войти" class="btn btn-success btn-lg form-control ">

                                    </form>
                                </div>
                                <!--/card-block-->
                            </div>
                            <!-- /form card login -->

                        </div>


                    </div>
                    <!--/row-->

                </div>
                <!--/col-->
            </div>
            <!--/row-->
        </div>
        <!--/container-->
    </body>
    <?php
    if (isset($_POST['submit'])) { // Отлавливаем нажатие кнопки "Отправить"
        /*  if (empty($_POST['login'])) { // Если поле логин пустое
          echo '<script>alert("Поле логин не заполненно");</script>'; // То выводим сообщение об ошибке
          } elseif (empty($_POST['password'])) { // Если поле пароль пустое
          echo '<script>alert("Поле пароль не заполненно");</script>'; // То выводим сообщение об ошибке
          } elseif (empty($_POST['server'])) { // Если поле пароль пустое
          echo '<script>alert("Поле сервер не заполненно");</script>'; // То выводим сообщение об ошибке
          } else {  // Иначе если все поля заполненны */


        $_SESSION['login'] = $_POST['login']; // Заносим в сессию  логин 
        $_SESSION['password'] = $_POST['password']; // Заносим в сессию  пароль
        
        if ($_POST['login'] == "test" and $_POST['password'] == "test") {
          //  $dbORAconnect = getOracleSesion();
            //   OCILogoff($dbORAconnect); 
            echo 'ssfs';
            $_SESSION['authorized'] = 1;
            header('Location:MENU.php');
          //  exit;
        }
    }
        ?>
</html>