<?php

include( "../../INCLUDES_PHP/START_SESSION.php" );
if ($_POST["DATA"] == 'MASTER') {

 //   $items = json_encode(Get_data_bal($_POST["dateStart"], $_POST["dateFinish"], $_POST["bal_type"], $_POST["cur_type"]), JSON_UNESCAPED_UNICODE);
$items = Get_data_bal($_POST["dateStart"], $_POST["dateFinish"], $_POST["bal_type"], $_POST["cur_type"]);

    
} else if ($_POST["DATA"] == 'DETAILS') {
    $items = Get_data_detail($_POST);
}

print_r($items);

exit;
?>

