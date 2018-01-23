<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );


$sSQL = "select b.rk as KEY,b.rk as VALUE from reports.DTM_BANK_BALANCE b where b.balance_type = '".$_POST['BAL_TYPE']."' group by b.rk order by rk";
$err = '';
$items = array();
$items = sql_select_j($sSQL, "DWH", 'JSON', $err);


print_r($items);

exit;
?>

