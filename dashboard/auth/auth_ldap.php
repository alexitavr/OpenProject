<?php
s2l(' ->	'.basename(__FILE__)."\n",1);

/*
Функция подключения к AD
Если подключение производиться с компьютера Разработчика,
проверяется только наличие пользователя.
При наличии параметров $_sDataList и $_aDataVal - читает
указанные данные Пользователя($_sDataList) в указанный массив($_aDataVal).
Для чтения данных при отсутствии переданного пароля используется
фейховый Пользователь (smtp_10_10_3_5)
*/


function authLDAP($_sLogin, $_sPassword, $_sDataList='', &$_aDataVal=null)
{
s2l("	-> ".basename(__FILE__).': '.__FUNCTION__."( $_sLogin )\n",1);

	global $ggv;



	$ldap_conn	= false;
	$bind_rslt	= false;
	$src_rslt		= false;
	$iRetVal		= 0;

	//=======================================================
	//ip адрес или название сервера ldap(AD)
	$ldap_host = 'crimea.rncb.ru';//"10.10.0.10";
	//Порт подключения
	$ldap_port = '389';
	//Полный путь к группе которой должен принадлежать человек, что бы пройти аутентификацию. 
	//"cn=allow_ppl,ou=users_IT,ou=IT,ou=Kyiv,ou=corp,dc=eddnet,dc=org" - это
	$ldap_memberof = 'ou=RNCB,dc=crimea,dc=rncb,dc=ru';
	//Откуда начинаем искать 
	$ldap_base = 'ou=RNCB,dc=crimea,dc=rncb,dc=ru';
	//Собственно говоря фильтр по которому будем аутентифицировать пользователя
	$ldap_filter = 'sAMAccountName=';
	//Ваш домен, обязательно с собакой впереди. Необходим этот параметр 
	//для авторизации через AD, по другому к сожалению работать не будет.
	$ldap_domain = '@crimea.rncb.ru';

	$ldap_login = 'smtp_10_10_3_5'; // Технологический Пользователь
	$ldap_pass = '1Qaz_2Wsx_3Edc';
	//=======================================================

	//=======================================================
//	include_once __DIR__.'/is_dvlpr_comp.php';
	//=======================================================


	//=======================================================
	do
	{
		$ggv->iErrCode = $ggv->iGrErr_AuthAd;
		//=====================================================
		//Подсоединяемся к LDAP серверу
//s2l('$ldap_host='.$ldap_host.'  $ldap_port='.$ldap_port."\n");
		$ldap_conn = ldap_connect($ldap_host,$ldap_port);
 
		$ggv->iErrCode--;
		if(!$ldap_conn)
		{

			$iRetVal = $giErrCode;
			$ggv->sErrMsg = 'Ошибка подключения к серверу DirectActive !!!';
			$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
			$ggv->iErrLine = __LINE__;
			$ggv->iNeedSendEmail = 1;
			break;

		}


		//Включаем LDAP протокол версии 3
		ldap_set_option($ldap_conn, LDAP_OPT_PROTOCOL_VERSION, 3);


		// Подключемся ТехнологическимПользователем
		$bind_rslt = ldap_bind($ldap_conn,$ldap_login.$ldap_domain,$ldap_pass);

		$ggv->iErrCode--;
		if(!$bind_rslt )
		{

			$iRetVal = $ggv->iErrCode;
			$ggv->sErrMsg = "Ошибка подключения ТехнологическимПользователем !!!\n";
			$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
			$ggv->iErrLine = __LINE__;
			$ggv->iNeedSendEmail = 1;
			break;

		}

		// Поиск пользователя в АД
		$src_rslt = ldap_search(
				$ldap_conn,
				$ldap_base,
				'samaccountname='.$_sLogin,
				array('samaccountname')
			);

s2l('$src_rslt='.$src_rslt."\n");
		$ggv->iErrCode--;
		if(!$src_rslt)
		{
//s2l('$src_rslt='.$src_rslt."\n");

			$iRetVal = $ggv->iErrCode;
			$ggv->sErrMsg = "Пользователь '$_sLogin' не найден на сервере DirectActive !!!";
			$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
			$ggv->iErrLine = __LINE__;
			$ggv->iNeedSendEmail = 1;
			break;

		}


s2l('$ggv->iDvlprComp='.$ggv->iDvlprComp."\n");
		// Проверяем пароль (при его наличии и отсутствии прав разработчика
		// переподключаемся под указанным пользователем)
		if($ggv->iDvlprComp == 0 && isset($_sPassword) && $_sPassword != '')
		{
			$sLdapLogin = $_sLogin.$ldap_domain;
s2l('$sLdapLogin='.$sLdapLogin."\n");
//s2l('$sLdapLogin='.$sLdapLogin.'  $sPassword='.$sPassword."\n");

			// Пытаемся войти в LDAP при помощи введенных логина и пароля
			$bind_rslt = ldap_bind($ldap_conn,$sLdapLogin,$_sPassword);

s2l('$bind_rslt='.$bind_rslt."\n");

			$ggv->iErrCode--;
			if(!$bind_rslt )
			{

				$iRetVal = $ggv->iErrCode;

				$extended_error = '';

				$ggv->sErrMsg = "Неверно указан Логин или Пароль пользователя !!!\n";
				$ggv->iErrLine = __LINE__;
				if(ldap_get_option($ldap_conn, LDAP_OPT_DIAGNOSTIC_MESSAGE, $extended_error))
				{
					$ggv->sErrMsg .= $extended_error;
				}
				else
				{
					$ggv->sErrMsg .= ldap_error($ldap_conn);
				}

				break;

			} // if(!$bind_rslt )
			//===================================================

		} // if(isset($_sPassword) && $_sPassword != '' && $ggv->iDvlprComp == 0)
		//=====================================================



		//=====================================================
		// Извлекаем запрошенные ПерсональныеДанные
		$ggv->iErrCode--;
		if(isset($_sDataList) && $_sDataList != null && count($_sDataList) > 0)
		{
//s2l('$_sDataList='.print_r($_sDataList,true)."\n");

			//===================================================
			$src_rslt = ldap_search(
					$ldap_conn,
					$ldap_base,
					'samaccountname='.$_sLogin,
					$_sDataList);

s2l('$src_rslt='.$src_rslt."\n");
			if(!$src_rslt)
			{

				$iRetVal = $ggv->iErrCode;
				$ggv->sErrMsg = "Пользователь '$_sLogin' не найден на сервере DirectActive !!!";
				$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
				$ggv->iErrLine = __LINE__;
				$ggv->iNeedSendEmail = 1;
				break;

			}
			//===================================================
			$ggv->iErrCode--;
			if(isset($_aDataVal))
			{
				$_aDataVal = ldap_get_entries($ldap_conn, $src_rslt);
//s2l('$_aDataVal='.print_r($_aDataVal,true)."\n");

				if($_aDataVal['count'] == 0)
				{

					$iRetVal = $ggv->iErrCode;
					$ggv->sErrMsg = "Ошибка получения информации по Пользователю '$_sLogin' сервера DirectActive !!!\n";
					$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
					$ggv->iErrLine = __LINE__;
					$ggv->iNeedSendEmail = 1;
					break;

				}


				$ggv->iErrCode--;
				if($_aDataVal['count'] > 1)
				{

					$iRetVal = $ggv->iErrCode;
					$ggv->sErrMsg = $_aDataVal['count']." пользователя/ей с Логином='$_sLogin' найдено на сервере DirectActive !!!";
					$ggv->sErrMsgDvlpr = $ggv->sErrMsg;
					$ggv->iErrLine = __LINE__;
					$ggv->iNeedSendEmail = 1;
					break;

				}


			} // if(isset($_aDataVal))
			//===================================================
		} // if(isset($_sDataList))
		//=====================================================


		//=====================================================
		$iRetVal = 0;
		$ggv->iErrCode = 0;
		//=====================================================

		//=====================================================
	} while(0);
	//=======================================================

	if($ggv->iErrCode < 0)
	{

		$ggv->add2ErrStack($ggv->iErrLine,__FUNCTION__,__FILE__);

	}


	//=======================================================
	if($bind_rslt) ldap_unbind($ldap_conn);
	if($ldap_conn) ldap_close($ldap_conn);
	//=======================================================


	//=======================================================
s2l("	<- ".basename(__FILE__).': '.__FUNCTION__."( $_sLogin )		$iRetVal\n",1);
	return $iRetVal;
	//=======================================================
} // function authLDAP($_sLogin, $_sPassword)
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

s2l(' <-	'.basename(__FILE__)."\n",1);
?>