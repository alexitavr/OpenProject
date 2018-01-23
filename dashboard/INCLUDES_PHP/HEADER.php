<html>
    <head>
        <?php
        require_once ('START_SESSION.php');
        ?>
        <meta charset="utf-8" />
        <title><?php echo $title; ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" type="text/css" href="bootstrap4/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="bootstrap4/bootstrap-datepicker/css/bootstrap-datepicker.min.css" />


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


        <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
        <script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
        <script type="text/javascript" src="bootstrap4/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="bootstrap4/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script type="text/javascript" src="bootstrap4/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js"></script>

        <!-- Подключение стиля для формы случай когда нужно сделать отличный от основного стиль -->  
        <link rel="stylesheet" href="<?php echo($DBOARDWAY); ?>/dashboardrncb/css/<?php echo(str_replace(".php", "", array_shift(explode('?',array_pop(explode('/', $_SERVER['REQUEST_URI'])))))); ?>.css" type="text/css" />

        <link rel="stylesheet" type="text/css" href="bootstrap4/bootstrap-select/dist/css/bootstrap-select.css" />
        <script src="bootstrap4/bootstrap-select/dist/js/bootstrap-select.js"></script>

        <!-- (Optional) Latest compiled and minified JavaScript translation files -->

        <!-- Font Awesome -->
        <!--    <link rel="stylesheet" href="AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
        <!-- Ionicons -->
        <link rel="stylesheet" href="AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
        <!-- Theme style -->
        <link rel="stylesheet" href="AdminLTE/dist/css/AdminLTE.min.css">
        <!-- AdminLTE Skins. Choose a skin from the css/skins
             folder instead of downloading all of them to reduce the load. -->
        <!--     <link rel="stylesheet" href="AdminLTE/dist/css/skins/_all-skins.min.css">
        <!-- Morris chart -->
        <!--     <link rel="stylesheet" href="AdminLTE/bower_components/morris.js/morris.css">
        <!-- jvectormap -->
        <!--     <link rel="stylesheet" href="AdminLTE/bower_components/jvectormap/jquery-jvectormap.css">
        <!-- Date Picker -->
        <!--   <link rel="stylesheet" href="AdminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
        <!-- Daterange picker -->
        <!--    <link rel="stylesheet" href="AdminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
        <!-- bootstrap wysihtml5 - text editor -->
        <!--   <link rel="stylesheet" href="AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">-->
    </head>
    <body>
        <!--========== HEADER ==========-->
        <header class="header navbar-fixed-top">
            <nav class="navbar navbar-toggleable-md navbar-inverse fixed-top bg-inverse">
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand" href="menu.php">РНКБ DashBoard</a>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Панели данных</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown01">
                                <a class="dropdown-item" href="balance.php">Балансы</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Графики</a>
                            <div class="dropdown-menu" aria-labelledby="dropdown01">
                                <a class="dropdown-item" href="balance_chart.php">Графики по Балансам РНКБ</a>
                            </div>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="http://<?PHP echo($_SERVER['HTTP_HOST']); ?>/cota/">Главная<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="dblogin.php">Выход<span class="sr-only">(current)</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!--========== END HEADER ==========-->

        <!--========== BLOCK PAGE ==========-->  
        <div id="topLayer" style="display:none;">
            <h3>Пожалуйста, подождите...</h3>
        </div> 
        <!--========== END BLOCK PAGE  ==========-->