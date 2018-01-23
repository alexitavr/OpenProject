<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );


$sSQL = "select b.currency_ccd as KEY, b.currency_ccd as VALUE from reports.DTM_BANK_BALANCE b group by b.currency_ccd";
$err = '';
$items = array();
$items = sql_select_j($sSQL, "DWH", 'JSON', $err);


print_r($items);

exit;
?>

