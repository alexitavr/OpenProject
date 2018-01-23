<!DOCTYPE html>
<?php
$title = "Балансы | РНКБ DashBoard";
include("INCLUDES_PHP/START_SESSION.php" );
require_once ('INCLUDES_PHP/header.php');
?>

<br><br>
<div class="container-fluid py-5" id="main-content">
    <div class="container-fluid"> 

        <div class="row">
            <div class='col-sm-2'>  
                <p>Дата баланса</p>  
                <div class="form-group">
                    <div class='input-group date' id='datetimepicker1'>   
                        <input type='text' id='start_date' class="form-control" placeholder="дата с"/>
                        <span class="input-group-addon">
                            <span class="fa fa-calendar"></span>
                        </span>
                    </div>
                </div>
            </div>
            <div class='col-sm-2'>  
                <p>Тип баланса</p>    
                <select id='form-control1' class="selectpicker form-control" data-actions-box="true">
                </select>
            </div>  
            <div class='col-sm-2'>    
                <p>Валюта</p> 
                <select id='form-control2'  class="selectpicker form-control" multiple data-actions-box="true" >
                </select>
            </div> 
        </div> 

        <div class="row">
            <div class="col-lg-12 col-md-12">
                <h4>Балансы</h4>
                <div id="grid1"></div>
            </div>
        </div>
        <button id="exportButton" class="btn btn-success clearfix btnup"></span>Получить детализацию</button>
        <hr/>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <h4>Балансы детализация</h4>

                <img id ='WAITIMG' class="IMG" src="ShieldUI/grid/img/loading-light-bootstrap.gif">
                <div id="grid2"></div>
                <span id="hint" class="label label-warning">Выберите данные для детализации</span>
            </div>
        </div>
    </div>
</div>   

<?php
/* --========== FOOTER LAYOUT ==============-- */
require_once ('INCLUDES_PHP/FOOTER.php');
/* --========== END FOOTER LAYOUT ==========-- */
?>