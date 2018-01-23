<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );


  $sSQL = "select b.balance_type as KEY,b.balance_type as VALUE from reports.DTM_BANK_BALANCE b group by b.balance_type";
$err = '';
    $items = array();
    $items = sql_select_j($sSQL, "DWH",'JSON',$err);


print_r($items);

exit;
?>

