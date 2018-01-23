<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );


$sSQL = "select b.RK as KEY, substr(b.balance_account_number,1,35) as VALUE from reports.DTM_BANK_BALANCE b where b.balance_type = '".$_POST['BAL_TYPE']."' group by b.RK, b.balance_account_number order by  b.balance_account_number";
$err = '';
$items = array();
$items = sql_select_j($sSQL, "DWH", 'JSON', $err);


print_r($items);

exit;
?>

