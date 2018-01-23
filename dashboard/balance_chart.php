<!DOCTYPE html>
<?php
$title = "Балансы | РНКБ DashBoard";
include("INCLUDES_PHP/START_SESSION.php" );
require_once ('INCLUDES_PHP/header.php');
?>


<!--   <div class="page-header">
       <h1>Отчеты <small> РНКБ</small></h1>
   </div>-->

<!-- Detail Grids - START -->
<br><br>
<div class="container-fluid py-5" >
    <div class="container-fluid"> 

        <div class="row">
            <div class='col-sm-2'>  
                <div class="form-group">
                    <p>Дата баланса</p>  
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
            <div  class='col-sm-2'>    
                <p>Бал счет</p> 
                <select id='form-control3'  class="selectpicker form-control" multiple data-actions-box="true" >
                </select>
            </div> 
            <div class='col-sm-2'>    
                <p>Статья</p> 
                <select id='form-control4'  class="selectpicker form-control" multiple data-actions-box="true" >
                </select>
            </div> 
        </div>  

        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <div class="row">
            <div class='col-sm-12'>  
                <div id="container" style="min-width: 310px; height: 650px; margin: 0 auto"></div>
            </div>
        </div>
    </div>
</div>   

<?php
/* --========== FOOTER LAYOUT ==============-- */
require_once ('INCLUDES_PHP/FOOTER.php');
/* --========== END FOOTER LAYOUT ==========-- */
?>