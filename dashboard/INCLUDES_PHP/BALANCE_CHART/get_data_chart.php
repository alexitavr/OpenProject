<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );



    $bal_type = str_replace(",", "','", $_POST["bal"]);
    $curr = str_replace(",", "','", $_POST["CUR"]);
   

    
    $sSQL = "select b.BALANCE_ACCOUNT_NUMBER||' | '||B.CURRENCY_CCD as key,
               B.SALDO_PREV,
               b.RSALDO_PREV,
               b.DEBIT,
               b.RDEBIT,
               b.CREDIT,
               b.RCREDIT,
               b.SALDO,
               b.RSALDO
             from reports.DTM_BANK_BALANCE b
             where BALANCE_DATE = to_date('".$_POST["date"]."','dd.mm.yyyy')
               and BALANCE_TYPE in ('".$bal_type."')
               and CURRENCY_CCD in ( '".$curr."') ";
    
    
    if ($_POST["BAL_RK"] != ''){
      $filterRK = "and RK in (".$_POST["BAL_RK"].") " ;
      $sSQL = $sSQL . $filterRK;
    }
    
    if ($_POST["BAL_ACC"] != ''){
      $filterRK = "and RK in  (".$_POST["BAL_ACC"].") " ;
      $sSQL = $sSQL . $filterRK;
    } 
 
    
    $items = array();
    $r ='';
    $items = sql_select_j($sSQL, "DWH", 'JSON', $r);

    
    print_r($items);

exit;
?>

