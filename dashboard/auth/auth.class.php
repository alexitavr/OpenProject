<?php
ini_set('display_errors',0);


	if(!defined("EXEC_FILE")) die;


	if(!isset($ggv)){require_once __DIR__.'/ggv.php';}


s2l(" ->	".basename(__FILE__)."\n",1);


	if(session_status() == PHP_SESSION_NONE)
	{
		@session_start();
		$ggv->iSessionId = session_id();
	}





	/*
	Автоматическое подключение класса clAuth
	*/
	if(!isset($ggv->oA))
	{

		$ggv->oA	= new clAuth();
	
	}



//$AI = new clAuth();
/*
$goA->s2l();
$goA->login();
$goA->s2l();
*/


/*
Универсальный класс Аутентификации пользователя


http://www.alsigned.ru/?p=2907




www.stat.rncb.ru web:
$sRemoteAddr		$sRemoteUser								$sHostName								$sHostByAddr
10.82.238.60		EvstratovMA@CRIMEA.RNCB.RU	crm1-stat.crimea.rncb.ru	rua34906qx.crimea.rncb.ru
10.82.254.246		SubotaUV@CRIMEA.RNCB.RU			crm1-stat.crimea.rncb.ru	10.82.254.246

www.stat.rncb.ru local:
																						crm1-stat.crimea.rncb.ru

stat.rncb.ru:
127.0.0.1																		RUA34906QX								RUA34906QX.crimea.rncb.ru





*/



class clAuth
{


	public function __construct()
	{
s2l(" ->	clAuth::__construct()\n",1);

		global $ggv;


		$ggv->sHostName		= '';

		$ggv->sHostByAddr	= '';
		$ggv->sCompName			= '';


		$ggv->sUserLogin	= '';
		$ggv->iUserId			= -1;
		$ggv->iUserState	= -1;

		if(!isset($ggv->sCookieName))
		{
			throw(new Exception('Not defined variable $ggv->sCookieName !!!'));
			return FALSE;
		}


		$ggv->sHostName = gethostname();

		if($ggv->iBrowser == 1)
		{
			$ggv->sHostByAddr = ($_SERVER['REMOTE_ADDR'] == '' ) ? '' : gethostbyaddr($_SERVER['REMOTE_ADDR']);
		}

		if($ggv->sHostByAddr != '')
		{
			$ggv->sCompName = strtoupper(substr($ggv->sHostByAddr, 0, strpos($ggv->sHostByAddr, '.')));
			if($ggv->sCompName  == 'RUA34906QX') $ggv->iDvlprComp = 1;
			else $ggv->iDvlprComp = 0;
		}

		// Для тестирования через локальный Апач, типа получили данные от Kerberos 
		if($ggv->iWin == 1 && $ggv->iBrowser == 1)
		{
			$_SERVER['REMOTE_USER'] = 'EvstratovMA@CRIMEA.RNCB.RU';
		}


s2l(" <-	clAuth::__construct()\n",1);
	} // public function __construct($_aDbInfo)
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	public function __destruct()
	{


	} // public function__destruct()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	public function s2l()
	{

		global $ggv;

		s2l("clAuth::s2l():\n");
		s2l('$ggv->sHostName='.$ggv->sHostName."\n");

		s2l('$_SERVER[REMOTE_ADDR]='.(isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR']: '')."\n");
		s2l('$ggv->sHostByAddr='.$ggv->sHostByAddr."\n");
		s2l('$ggv->sCompName='.$ggv->sCompName."\n");

		s2l('$_SERVER[REMOTE_USER]='.(isset($_SERVER['REMOTE_USER']) ? $_SERVER['REMOTE_USER']: '')."\n");
		s2l('$ggv->sUserLogin='.$ggv->sUserLogin."\n");
		s2l('$ggv->iUserId='.$ggv->iUserId."\n");
		s2l('$ggv->iUserState='.$ggv->iUserState."\n");

		s2l('$ggv->iSessionId='.$ggv->iSessionId."\n");

	} // public function s2l()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Получение данных заполненных сервисом Kerberos
	*/
	function getKerbInfo()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;

		$iRetVal = -1;
		if(isset($_SERVER['REMOTE_USER']) && $_SERVER['REMOTE_USER'] != '')
		{

			$sUserLogin = mb_split('@', $_SERVER['REMOTE_USER']);
//s2l('$_SERVER[REMOTE_USER] = '.$_SERVER['REMOTE_USER']."\n");
			$ggv->sUserLogin = $sUserLogin[0];

			$iRetVal = 0; // OK

		}

s2l(' <-	clAuth::'.__FUNCTION__."()	iRetVal=".$iRetVal."\n",1);
		return $iRetVal;

	} // function getKerbInfo()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Получение данных Пользователя без попытки регистрации
	*/
	function getUserId()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;


		do
		{

			if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))
			{

				// Идентификация по КУКу
				$sCookieValue = mb_split('~', $_COOKIE[$ggv->sCookieName]);
				if($ggv->iSessionId == $sCookieValue[2])
				{

					// Успешная проверка Аутентификации
					$ggv->iUserId			= $sCookieValue[0];
					$ggv->sUserLogin	= $sCookieValue[1];
					$ggv->iUserState	= 1;
//s2l('COOKIE:	NAME='.$ggv->sCookieName.'	USER_ID='.$ggv->iUserId.'	USER_LOGIN='.$ggv->sUserLogin.'	SESION_ID='.$ggv->iSessionId."\n");
					$ggv->iErrCode = 0;
					break;
				}

			} // if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))


			$this->getKerbInfo();
			if($ggv->sUserLogin == '')
			{

				break;

			}

			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Подключаемся к БД
			// для определения ИД и СТАТУСА пользователя
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

			if($ggv->oDbC == null)
			{

				include_once $ggv->sDirComnPhp.'db_connect.class.php';

			}


			$sSql =
'SELECT ID, LOGIN, STATE, SEANS_IP,
	CASE WHEN DT_DEL IS NULL '.($ggv->oDbC->isMySql()||$ggv->oDbC->isMySqli() ? 'OR DT_DEL=0 ' : '').
'OR DT_DEL>=SYSDATE'.
($ggv->oDbC->isMySql()||$ggv->oDbC->isMySqli() ? '()' : '').' THEN 0 ELSE 1 END DELETED
FROM '.$gv->sUsersTblName.
' WHERE UPPER(LOGIN)=UPPER(\''.$ggv->sUserLogin.'\')';
s2l('$sSql = '.$sSql."\n");
			$ggv->oDbC->query($sSql);

			if($ggv->oDbC->stmt == NULL)
			{
				break;
			}

			$rv = $ggv->oDbC->fetch();
			if($rv == NULL)
			{

				break;

			}


//s2l('$rv='.print_r($rv,true)."\n");
			$ggv->iUserId		= $rv['ID'];
			$ggv->sUserLogin	= $rv['LOGIN'];
			$ggv->iUserState	= $rv['STATE'];

		} while(0);


s2l(' <-	clAuth::'.__FUNCTION__.'()	$ggv->iUserId = '.$ggv->iUserId.'	$ggv->sUserLogin = '.$ggv->sUserLogin."\n",1);
	} // function getUserId()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^




	/*
	Главная функция Аутентификации
	return:
	0 	- OK
	-1	- не определен Логин
	-2	- нет подключения к БД (isset($goDbC))
	-3	- Логин не найден в БД
	-4	- Пользователь заблокирован


index.php -> clAuth::load() -> clAuth::include FormMain.php
index.php -> clAuth::load() -> index.php::include FormMain.php

index.php (FormAuth) -> clAuth::load() -> include FormMain.php

FormMain.php -> clAuth::load() -> echo FormMain.Html


dt_list_get.php -> clAuth::load() -> gi


	*/
	function login()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;


		$iRetVal = 0;
		$iAuthType = 0; // 0 - not def; 1 - COOKEI; 2 - POST


//s2l('$_SERVER='.print_r($_SERVER,true)."\n");
		//=====================================================
		do
		{

			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Проверяем Кук		
			// При наличии правильного Кука (т.е., $ggv->iSessionId	== $sCookieValue[2]),
			// инициализируем переменные
			// $ggv->iUserId, $ggv->sUserLogin значениями из Кука и
			// продлеваем срок его действия 
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))
			{

				// Идентификация по КУКу
				$sCookieValue = mb_split('~', $_COOKIE[$ggv->sCookieName]);
				if($ggv->iSessionId == $sCookieValue[2])
				{

					// Успешная проверка Аутентификации
					$ggv->iUserId			= $sCookieValue[0];
					$ggv->sUserLogin	= $sCookieValue[1];
					$ggv->iUserState	= 1;
s2l('COOKIE:	NAME='.$ggv->sCookieName.'	USER_ID='.$ggv->iUserId.'	USER_LOGIN='.$ggv->sUserLogin.'	SESION_ID='.$ggv->iSessionId."\n");
					$ggv->iErrCode = 0;

					setcookie(
						$ggv->sCookieName,
//						$ggv->iUserId.'~'.$ggv->sUserLogin.'~'.$ggv->iSessionId,
						$_COOKIE[$ggv->sCookieName],
						time() + $ggv->iCookieExpire,
						"/" );

					$iAuthType = 1;

				if(isset($_SERVER['REQUEST_URI']) && strpos($_SERVER['REQUEST_URI'], 'index.php') !== FALSE)
				{

//					include_once $ggv->sFormMain;

				}



//s2l(" <-	clAuth::login()	giErrCode=$ggv->iErrCode\n",1);
//					return 0;
					$ggv->iErrCode = 0;
					$ggv->sErrMsg = '';
					break;

				}
				else
				{

					// Бракованый Кук
					$ggv->iUserId	= -1;
					$ggv->iUserState	= 0;
//					$ggv->iSessionId	= '';
					// Аннулируем Бракованый Кук
					setcookie(
						$ggv->sCookieName,
						$_COOKIE[$ggv->sCookieName],
						time() - 3600,
						"/" );

				}

			} // if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))




			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Получены данные от формы Аутентификации
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if(			isset($_POST)
					&&	count($_POST) == 2
					&&	strpos($_SERVER['REQUEST_URI'], 'index.php') !== FALSE
				)
			{

				$iAuthType = 2;

//s2l('$_POST='.print_r($_POST,true)."\n");
				$sLogin = '';
				$ggv->iErrCode = $ggv->iGrErr_Auth;
				$ggv->iErrCode--;
				if(isset($_POST['login']))
				{
					$sLogin = preg_replace("/(?:[^-a-zA-Zа-яА-Я0-9-_])/","",$_POST['login']);
					if(strlen($sLogin) == 0)
					{
						echo "gsErrInpElm=\"inp_auth_login\";\n";
						$ggv->sErrMsg = "Не задан Логин пользователя !!!";
						break;
					}
				}
				else
				{
					echo "gsErrInpElm=\"inp_auth_login\";\n";
					$ggv->sErrMsg = "Не задан Логин пользователя !!!";
					break;
				}


				$sPwd = '';
				$ggv->iErrCode--;
				if(isset($_POST['pwd']))
				{
					$sPwd = $_POST['pwd'];
					if(strlen($sPwd) == 0)
					{
						echo "gsErrInpElm=\"inp_auth_pwd\";\n";
						$ggv->sErrMsg = "Не задан Пароль пользователя !!!";
						break;
					}
				}
				else
				{
					echo "gsErrInpElm=\"inp_auth_pwd\";\n";
					$ggv->sErrMsg = "Не задан Пароль пользователя !!!";
					break;
				}



				//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				// Проверяем через LDAP
				//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				include_once $ggv->sDirComnPhp.'auth_ldap.php';

				$iRetVal = authLDAP($sLogin, $sPwd);

				if($iRetVal != 0)
				{
					break;
				}


				$ggv->sUserLogin	= $sLogin;
//				$ggv->iSessionId		= session_id();
				$ggv->iErrCode = 0;

			} // if(isset($_POST) && count($_POST) == 2)
			//===================================================

			//===================================================
			else
			{

				//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				// Пытаемся получить Логин через Керберос
				//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
				$this->getKerbInfo();
//$this->s2l();


				if($ggv->sUserLogin == '')
				{

					// Вызов веб-формы Аутентификации
					$this->showFormAuth();
					exit();

				}

			} // else @if(isset($_POST) && count($_POST) == 2)
			//===================================================


			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Подключаемся к БД
			// для определения ИД и СТАТУСА пользователя
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if(!isset($ggv->oDbC))
			{

				include_once $ggv->sDirComnPhp.'db_connect.class.php';

//				$goDbC	= new clDbConnect();
//				$goDbC->set($giDbType,$gsDbHost,$gsDbName,$gsDbUser,$gsDbPwd,$gsDbCharset);
//				$goDbC->connect();

			}
//s2l('$ggv='.print_r($ggv,true)."\n");

			$sSql =
'SELECT ID, LOGIN, STATE, SEANS_IP,
	CASE WHEN DT_DEL IS NULL '.($ggv->oDbC->isMySql()||$ggv->oDbC->isMySqli() ? 'OR DT_DEL=0 ' : '').
'OR DT_DEL>=SYSDATE'.
($ggv->oDbC->isMySql()||$ggv->oDbC->isMySqli() ? '()' : '').' THEN 0 ELSE 1 END DELETED
FROM '.$gv->sUsersTblName.
' WHERE UPPER(LOGIN)=UPPER(\''.$ggv->sUserLogin.'\')';
s2l('$sSql = '.$sSql."\n");
			$ggv->oDbC->query($sSql);

			$rv = $ggv->oDbC->fetch();
			if($rv == NULL)
			{

				$ggv->iErrCode--;
				//+++++++++++++++++++++++++++++++++++++++++++++++++
				// Пользователь отсутствует в списке допуска
				// Вызов веб-формы Регистрации
				//+++++++++++++++++++++++++++++++++++++++++++++++++
				$this->showFormReg();
				break;

			}


s2l('$rv='.print_r($rv,true)."\n");
			$ggv->iUserId		= $rv['ID'];
			$ggv->sUserLogin	= $rv['LOGIN'];
			$ggv->iUserState	= $rv['STATE'];


			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Анализируем Статус Пользователя
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			$ggv->iErrCode--;
			if($ggv->iUserState == 0)
			{
//$this->s2l();

				// Пользователь заблокирован Администратором
				$ggv->sErrMsg = "Ваша учетная запись заблокирована !!!\n\n".
					"Если Вы только что отправили заявку на регистрацию,\n".
					"Администратору требуется некоторое время, чтобы ее обработать.\n\n".
					"Пожалуйста, обратитесь к Администратору\n".
					"(тел:$ggv->sTelAdmin, е-майл:$ggv->sEmailAdmin)";
				$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
				$ggv->sErrMsgAdmin = $ggv->sErrMsg;
				$ggv->iErrLine = __LINE__;
				$ggv->iNeedSendEmail = 3;
				break;

			}


			$ggv->iErrCode--;
			if($ggv->iUserState != 1)
			{

				$ggv->sErrMsg = "Недопустимый статус Вашей учетной записи !!!\n\n".
					"Пожалуйста, обратитесь к Разработчику\n".
					"(тел:$ggv->sTelDvlpr, е-майл:$ggv->sEmailDvlpr)";
				$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
				$ggv->iErrLine = __LINE__;
				$ggv->iNeedSendEmail = 1;
				break;

			}
			//===================================================


			//===================================================
			// Проверяем Не удален ли Пользователь
			$ggv->iErrCode--;
			if($rv['STATE_DEL'] != 0)
			{

				$ggv->sErrMsg = "Ваша учетная запись помечена под удаление !!!\n\n".
					"Пожалуйста, обратитесь к Администратору\n".
					"(тел:$ggv->sTelAdmin, е-майл:$ggv->sEmailAdmin)";
				$ggv->sErrMsgDvlpr = $gsErrMsg;
				$ggv->sErrMsgAdmin = $gsErrMsg;
				$ggv->iErrLine = __LINE__;
				$ggv->iNeedSendEmail = 3;
				break;

			}
			//===================================================

			//=====================================================
			// Сохраняем IP с которого произошло подключение

			if($rv['SEANS_IP'] != $_SERVER['REMOTE_ADDR'])
			{

				//+++++++++++++++++++++++++++++++++++++++++++++++++
				// Отправляем письма Разработчику о попытке
				// подключения с другого IP
				//+++++++++++++++++++++++++++++++++++++++++++++++++
				$ggv->sErrMsg = "Пользователь пытается подключиться с другого IP !!!\n\n".
					'Было -> '.$rv['SEANS_IP']."\n".
					'Стало -> '.$_SERVER['REMOTE_ADDR']."\n"
					;
				$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
				$ggv->iNeedSendEmail = 1;
	
				$ggv->sErrFunc = __FUNCTION__;
				$ggv->iErrLine = __LINE__;

				$this->sendEmailErr();

				$ggv->iNeedSendEmail = 0;
				//=================================================

			} // if($rv['SEANS_IP'] != $_SERVER['REMOTE_ADDR'])


			$sSql =
'UPDATE '.$gv->sUsersTblName.
'  SET SEANS_DT_BEG=SYSDATE'.($ggv->oDbC->isMySql()||$ggv->oDbC->isMySqli() ? '()' : '').', SEANS_DT_END=NULL, SEANS_IP=\''.$_SERVER['REMOTE_ADDR'].'\'
WHERE ID='.$ggv->iUserId;
s2l('$sSql='.$sSql."\n");
			$ggv->oDbC->query($sSql);


			//===================================================
			$ggv->iErrCode = 0;
			//===================================================

		}while(0);
		//=====================================================



//s2l('$ggv='.print_r($ggv,true)."\n");
		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		// Ошибка проверка валидности Аутентификации
		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		if($ggv->iErrCode < 0)
		{

			$ggv->add2ErrStack($ggv->iErrLine,__FUNCTION__,__FILE__);
			if($ggv->iNeedSendEmail != 0)
			{

				//+++++++++++++++++++++++++++++++++++++++++++++++++
				// Отправляем письма Разработчику и Администратору
				//+++++++++++++++++++++++++++++++++++++++++++++++++
				$ggv->sErrFunc = __FUNCTION__;
				$this->sendEmailErr();
				//=================================================

			} // if($ggv->iNeedSendEmail != 0)


s2l('$iRetVal=-1  $ggv->iUserId='.$ggv->iUserId."\n");
s2l('$ggv->iErrCode='.$ggv->iErrCode.'  $ggv->sErrMsg='.$ggv->sErrMsg."\n");

//s2l('$_SERVER[REQUEST_URI]='.$_SERVER['REQUEST_URI']."\n");
//s2l('$_SERVER='.print_r($_SERVER,true)."\n");
			if(strpos($_SERVER['REQUEST_URI'], 'index.php') !== FALSE)
			{
				$this->showFormErr();
				exit();
			}
			else
			{			
				echo 'giRetVal=-1; gsRetVal="-1"; ';
				echo 'giErrCode='.$ggv->iErrCode.'; gsErrMsg="'.str_replace("\n",'<br>',$ggv->sErrMsg).'"; ';
			  echo 'giUserId='.$ggv->iUserId.'; ';
			}

		} // if($ggv->iErrCode < 0)
		//=====================================================

		//=====================================================
		else if($ggv->iErrCode == 0)
		{

			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Устанавливаем/Продлеваем Кук
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			setcookie(
				$ggv->sCookieName,
				$ggv->iUserId.'~'.$ggv->sUserLogin.'~'.$ggv->iSessionId,
				time() + $ggv->iCookieExpire,
				"/" );


			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Запрошены JAVASCRIPT данные
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//s2l('$_SERVER='.print_r($_SERVER,true)."\n");
			if(isset($_SERVER['HTTP_ACCEPT']) && strpos($_SERVER['HTTP_ACCEPT'], 'text/javascript') !== FALSE)
			{

s2l('$giRetVal=0  $ggv->iUserId='.$ggv->iUserId."\n");
s2l('$ggv->iErrCode='.$ggv->iErrCode.'  $ggv->sErrMsg='.$gsErrMsg."\n");

				echo 'giRetVal=0; gsRetVal="0"; ';
				echo 'giErrCode='.$ggv->iErrCode.'; gsErrMsg="'.str_replace("\n",'<br>',$ggv->sErrMsg).'"; ';
			  echo 'giUserId='.$ggv->iUserId.'; gsFormMain="'.$ggv->sFormMain.'"; ';

			}

			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			else
			{

				if(isset($_SERVER['REQUEST_URI']) && strpos($_SERVER['REQUEST_URI'], 'index.php') !== FALSE)
				{


//s2l('$_SERVER[REQUEST_URI]='.$_SERVER['REQUEST_URI']."\n");
s2l('$ggv->sFormMain='.$ggv->sFormMain."\n");
					header("Location: ".$ggv->sFormMain);
//					include_once $ggv->sFormMain;

				}

			}


		} // else if($ggv->iErrCode == 0)
		//=====================================================

		//=====================================================
		else
		{

s2l('$giRetVal='.$giRetVal."  Не предусмотрены действия для данного кода ошибки !!!\n");

		}
		//=====================================================





s2l(' <-	clAuth::'.__FUNCTION__."()	giErrCode=$ggv->iErrCode\n",1);
		return $ggv->iErrCode;

	} // function login()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Выходим из программы
	Предлагаем форму вызова формы-регистрации
	*/
	function logout()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;



		if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))
		{

			$sCookieValue = mb_split('~', $_COOKIE[$ggv->sCookieName]);
			$ggv->iUserId	= $sCookieValue[0];


//s2l('$ggv='.print_r($ggv,true)."\n");
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Подключаемся к БД
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			if(!isset($ggv->oDbC))
			{

				include_once $ggv->sDirComnPhp.'db_connect.class.php';

			}

			$sSql =
'UPDATE '.$gv->sUsersTblName.' SET SEANS_DT_END=SYSDATE'.($ggv->oDbC->isMySql() ? '()' : '').
' WHERE ID='.$sCookieValue[0];
s2l('$sSql='.$sSql."\n");

			$ggv->oDbC->query($sSql);
/*				$iRowCount = oci_num_rows($goDbC->stid);
s2l('$iRowCount='.$iRowCount."\n");
				if($iRowCount == 0)
				{
					include_once $gsDirComnPhp.'send_email.php';

					sendEmail($gsEmailFrom,$gsEmailDvlpr,
						'RncbWebAnalit: logout',
						'Ошибка записи в БД информации об окончании сеанса Пользователя '.$sCookieValue[0]
						);
				}
*/


			// Аннулируем Кук
			setcookie(
				$ggv->sCookieName,
				$_COOKIE[$ggv->sCookieName],
				time() - 3600,
				"/" );

			session_write_close();


			$ggv->iUserState	= 0;
			$ggv->iSessionId	= '';


			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			// Вывод формы Возврата к Аутентификации
			//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
			include 'auth.class.form_callback.inc';
			//===================================================

		} // if(isset($_COOKIE) && isset($_COOKIE[$ggv->sCookieName]))


s2l(' <-	clAuth::'.__FUNCTION__."()\n",1);
	} // function logout()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Отображение формы Аутентификации
	*/
	function showFormAuth()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;

		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		// Вывод формы Аутентификации
		//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		include 'auth.class.form_auth.inc';
		//=====================================================


s2l(' <-	clAuth::'.__FUNCTION__."()\n",1);
	} // function showFormAuth()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Вызов формы Регистрации
	Форма содержится в отдельном php-файле,
	определенном в глобальной переменной $ggv->sFormReg
	*/
	function showFormReg()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv;

		if(!isset($ggv->sFormReg) || $ggv->sFormReg == '')
		{
			s2l('Ошибка!!! Не задана ФормаРегистрации (переменная $ggv->sFormReg)'."\n");
			return;
		}

//s2l('$ggv->sFormReg='.$ggv->sFormReg."\n");

//		include_once $ggv->sFormReg;
		if(isset($_SERVER['HTTP_ACCEPT']))
		{
			if(strpos($_SERVER['HTTP_ACCEPT'], 'text/javascript') !== FALSE)
			{
				echo 'gsFormReg="'.$ggv->sFormReg."\";\n";
				if($ggv->sUserLogin != '') echo 'gsUserLogin="'.$ggv->sUserLogin."\";\n";
			}
			else
			{
				header('Location: '.$ggv->sFormReg);
			}
		}
		else
		{
			s2l('Ошибка!!! Не задана ФормаРегистрации (переменная $ggv->sFormReg)'."\n");
			return;
		}

s2l(' <-	clAuth::'.__FUNCTION__."()\n",1);
	} // function showFormReg()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Вызов формы Отображения Информации обошибке
	Форма содержится в отдельном php-файле
	*/
	function showFormErr()
	{
s2l(' ->	clAuth::'.__FUNCTION__."()\n",1);

		global $ggv, $gv;

		include 'auth.class.form_info.inc';

s2l(' <-	clAuth::'.__FUNCTION__."()\n",1);
	} // function showFormErr()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



	/*
	Отправка письма Разработчику и Администратору
	*/
	function sendEmailErr()
	{

		global $ggv, $gv;


		require_once $ggv->sDirComnPhp.'send_email.php';

		$ggv->sErrFile = basename(__FILE__);

		sendEmailErr();

	} // function sendEmailErr()
	//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


} // clAuth




s2l(" <-	".basename(__FILE__)."\n",1);

?>