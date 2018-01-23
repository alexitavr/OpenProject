<?php
//if(session_status() == PHP_SESSION_NONE) {session_start();}
	if(!defined("EXEC_FILE")) die;

	if(isset($ggv)) return;


	date_default_timezone_set('Europe/Moscow');


	define('DEF_DB_TYPE_NULL',		0);
	define('DEF_DB_TYPE_ORACLE',	1);
	define('DEF_DB_TYPE_MYSQL',		2);
	define('DEF_DB_TYPE_MYSQLI',	3);
	define('DEF_DB_TYPE_MSSQL',		4);

	define('DEF_DB_RSLT_ASSOC',	1);
	define('DEF_DB_RSLT_NUM',		2);
	define('DEF_DB_RSLT_BOTH',	3);


	$ggv = new clGGV();
	include_once $ggv->sS2lPhp; //Подключаем функцию логирования
//s2l('$GLOBALS='.print_r($GLOBALS,true)."\n");
//echo '$ggv->sDirComnPhp='.$ggv->sDirComnPhp."\n".'$ggv->sS2lPhp='.$ggv->sS2lPhp."\n";


class clGGV
{

	public
	$iBrowser	= -1,
	$iWin			= -1,
	$iHome		= -1,

	$sProgName			= 'ProgrammName not defined !!!',
	$sProgDesc			= 'ProgDescription not defined !!!',
	$sProgKeywords	= 'ProgKeywords not defined !!!',

	$sHostName		= '',
	$sHostByAddr	= '',
	$sCompName		= '',
	$iDvlprComp		= -1,

	$sCookieName		= '???',
	$iCookieExpire	= 3600,

	$sUserLogin	= '',
	$iUserId		= -1,
	$iUserState	= -1,
	$iSessionId	= -1,

	$sFormReg		= '???',
	$sFormMain	= '???',


	$iGrErr_CheckAuth	= 0,
	$iGrErr_Auth			= -9000,
	$iGrErr_AuthKerb	= -9050,
	$iGrErr_AuthAd		= -9100,
	$iGrErr_AuthDb		= -9150,
	$iGrErr_Reg				= -9200,
	$iGrErr_RegAd			= -9250,
	$iGrErr_RegDb			= -9280,

	$iGrErr_Db			= -9300,

	$iRetVal				= 0,
	$iErrCode				= 0,
	$sErrMsg				= '',

	$sErrFile				= '',
	$sErrFunc				= '',
	$iErrLine				= 0,
	$sErrStack			= '',
	$iErrCount			= 0,

	$sErrMsgDvlpr		= '',
	$sErrMsgAdmin		= '',
	$sEmailSubjErr	= 'ошибка->???',

	$sTelDvlpr		= '45124',
	$sEmailDvlpr	= 'EvstratovMA@rncb.ru',
	$sTelAdmin		= '45124',
	$sEmailAdmin	= 'EvstratovMA@rncb.ru',

	$sEmailFrom	= 'smtp_10_10_3_5@rncb.ru', // !!!!! Работает только с таким адресом
	$sEmailTo		= '',
	$sEmailSubj	= '???',
	$sEmailBody	= '',

	$iNeedSendEmail	= 0, // 0 - нет; 1 - Разработчику; 2 - Администратору; 3 - Разработчику и Администратору

	$sCall2Dvlpr	= '',
	$sMail2Dvlpr	= '',
	$sMail2Admin	= '',

	$sBr = '',
	$sZW = 'зашифровано',

	$sDirPhp = '',
	$sDirComnPhp = '',
	$oA		= null,
	$oDbC	= null
	;





	public function __construct()
	{

		global $gsFnS2l;

		if( file_exists('/etc') )
		{

		 	$this->iWin = 0;

			$this->iHome = 0;// ???

		}
		else
		{

		 	$this->iWin = 1;

	  	if( file_exists('C:\\Users\\EvstratovMA') )
 			{
				$this->iHome = 0;
			}
			else
			{
				$this->iHome = 1;
			}

		}


		if('cli' ==  php_sapi_name()) $this->iBrowser = 0;
		else $this->iBrowser = 1;


		if($this->iWin == 0)
		{
			$this->sDirPhp			= __DIR__.'/../../analit/php/';
			$this->sDirComnPhp	= __DIR__.'/';

			$this->sS2lPhp			= __DIR__.'/s2l.php';
//		$gsFnS2l = '/tmp/s2l.log';

			if(!isset($gsFnS2l))
			{
				if($this->iBrowser == 0)
				{
					$gsFnS2l = __DIR__.'/s2l_l.~log';
				}
				else
				{
					$gsFnS2l = __DIR__.'/s2l_w.~log';
				}
			}

			$this->sBr = '<br>';

		} // if($this->iWin == 0)
		else
		{
			$this->sDirPhp			= __DIR__.'/../../analit/php/';
			$this->sDirComnPhp	= __DIR__.'/';

			$this->sS2lPhp			= __DIR__.'/s2l.php';

			if(!isset($gsFnS2l))
				$gsFnS2l					= __DIR__.'/s2l.~log';

			if($this->iHome == 1)
			{
				$this->sEmailFrom		= 'ema67@mail.ru';
				$this->sEmailTo			= 'ema67@mail.ru';
				$this->sEmailDvlpr	= 'ema67@mail.ru';
				$this->sEmailAdmin	= 'ema67@mail.ru';
			}

			$this->sBr = '<br>';

		} // else @if($this->iWin == 0)

	} // public function __construct()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


/*
	public function __destruct()
	{
		global $gsFnS2l;
s2l('ggv: $this->iErrCount = '.$this->iErrCount."\n");
	}*/
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	function updComnMsg()
	{

		$this->sCall2Dvlpr	= 'Пожалуйста, сообщите об ошибке Разработчику (тел:'.$this->sTelDvlpr.', е-майл:'.$this->sEmailDvlpr.').';
		$this->sMail2Dvlpr	= "Письмо с сообщением об ошибке отправлено разработчику (тел:$this->sTelDvlpr, е-майл:$this->sEmailDvlpr).";
		$this->sMail2Admin	= "Письмо с сообщением об ошибке отправлено администратору (тел:$this->sTelAdmin, е-майл:$this->sEmailAdmin).";

	} // function updComnMsg()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Список значений параметров Аутентификации
	*/
	function getAuthParsList()
	{

		return
			"RemoteAddr = ".( isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '').
			"\nRemoteUser = ".( isset($_SERVER['REMOTE_USER']) ? $_SERVER['REMOTE_USER'] : '').
			"\nHostName = ".( isset($ggv->sHostName) ? $ggv->sHostName : '').
			"\nHostByAddr = ".( isset($ggv->sHostByAddr) ? $ggv->sHostByAddr : '').
			"\nCompName = ".( isset($ggv->sCompName) ? $ggv->sCompName : '').
			"\nUserId = ".( isset($ggv->iUserId) ? $ggv->iUserId : '').
			"\nUserLogin = ".( isset($ggv->sUserLogin) ? $ggv->sUserLogin : '').
			"\nUserState = ".( isset($ggv->iUserState) ? $ggv->iUserState : '')
			;

	} // function getAuthParsList()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Добавление элемента в СтекОшибок
	*/
	function add2ErrStack($_line,$_func,$_file)
	{

		$this->iErrCount++;
		$this->sErrStack .= $this->iErrCount.') line:'.$_line.'	func:'.$_func.'	file:'.$_file."\n";

	}
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


} // class clGGV
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


?>