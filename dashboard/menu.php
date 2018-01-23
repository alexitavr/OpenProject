<!DOCTYPE html>
<?php
$title = "Главная | РНКБ DashBoard";
include("INCLUDES_PHP/START_SESSION.php" );
require_once ('INCLUDES_PHP/header.php');
?>
<!-- Main content -->
<section class="content">
    <div class="container-fluid py-5">   
        <div class="container-fluid">
            <!-- Example row of columns -->
            <div class="row">
                <div class="col-md-4">
                    <h3  class="font-weight-bold">Балансы</h3><hr>
                    <ul>
                        <li><h4><a href="balance.php">Витрина Балансы РНКБ</a></h4></li>
                    </ul>
                    <ul>
                        <li><h4><a href="balance_chart.php">График Балансы РНКБ</a></h4></li>
                    </ul>
                  <!--  <p><a class="btn btn-secondary" href="#" role="button">Подробнее &raquo;</a></p>-->
                </div>
                <div class="col-md-4">
                    <h3  class="font-weight-bold">Кредиты</h3><hr>
                </div>
                <div class="col-md-4">
                    <h3  class="font-weight-bold">Договора</h3><hr>
                </div>
            </div><br>
        </div>
        <!-- Small boxes (Stat box) -->
        <br><div class="row">
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h4><?php
                            $count_client = Get_count_client();
                            echo $count_client[2][0];
                            ?></h4>
                        <h4><?php echo $count_client[0][0]; ?></h4>
                      <!--  <h4><?/*php echo $count_client[1][0];?*/></h4>-->
                        <p>Количество клиентов</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="#" class="small-box-footer">Больше информации <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">
                        <h4><?php
                            $count_cont = Get_count_contract();
                            echo $count_cont[0][0];
                            ?></h4>
                        <h4><?php echo $count_cont[1][0]; ?></h4>

                        <p>Количество договоров</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="#" class="small-box-footer">Больше информации <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                       <!-- <h3>53<sup style="font-size: 20px">%</sup></h3>-->
                        <h3><?php
                            echo "711688"
                            /* $count_acc = Get_count_account();
                              echo $count_acc[0][0]; */
                            ?></h3>
                        <p>Открытых счетов</p>
                        <br>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="#" class="small-box-footer">Больше информации <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>

            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3><?php echo "702838"/* $count_client[1][0]; */ ?></h3>
                        <p>Количество ИП</p>
                        <br>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="#" class="small-box-footer">Больше информации <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>
    </div>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Добро пожаловать</h1>
            <h1 class="display-3">в систему витрин данных</h1>
            <h3 class="py-3">Система позволит получить быстрый доступ к данным хранилища DWH</h3>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Читать больше&raquo;</a></p>
        </div>
    </div>
</section>

<?php
/* --========== FOOTER LAYOUT ==============-- */
require_once ('INCLUDES_PHP/FOOTER.php');
/* --========== END FOOTER LAYOUT ==========-- */
?>