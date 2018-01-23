<?php
ini_set('display_errors',0);


	if(!defined("EXEC_FILE")) define("EXEC_FILE", TRUE);


	include_once 'gv.php';


s2l("\n\n\n",0);
s2l(" ->	".basename(__FILE__)."\n",1);


//s2l('$ggv='.print_r($ggv,true)."\n");
	//=======================================================
	$ggv->sEmailSubj		= $ggv->sProgName.': аутентификация';
	$ggv->sEmailSubjErr	=	$ggv->sProgName.': ошибка аутентификации';
	//=======================================================



	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	// Запрос данных Пользователя
	// В случае необходимости, предлогается регистрация через форму
	//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	require_once $ggv->sDirComnPhp.'auth.class.php';

	$iRetVal = $ggv->oA->login();


s2l(" <-	".basename(__FILE__)."\n",1);
?>
