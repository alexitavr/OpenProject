if(typeof iCLDV === 'undefined')
{
	alert('F:/common/js/auth.class.js\nНе подключен js-файл -> /common/js/ggv.js');
	$.getScript("/common/js/ggv.js");
}


var
	gsErrInpElm = '',
	gsFormMain = '',
	gsFormReg = '',
	gsUserLogin = ''
	;



jQuery(document).ready(function(){loadedAuthClass();});


/*
Стартовая настройка элементов формы Аутентификации
*/
function loadedAuthClass()
{

	// https://developer.mozilla.org/en-US/docs/Web/API/Navigator/cookieEnabled
	var obj = document.getElementById ("div_cookie");
	if(!navigator.cookieEnabled)
	{
		document.getElementById('div_auth').style.display = 'none';

		obj.style.display = 'block';
	}
	else
	{
		obj.style.display = 'none';

		document.getElementById('div_auth').style.display = 'block';
	}




	document.getElementById('inp_auth_login').focus();

	$('#inp_auth_pwd').on('mousedown', function(){this.type='text';});
	$('#inp_auth_pwd').on('mouseup', function(){this.type='password';});
	$('#inp_auth_pwd').on('keyup',
		function(_event)
		{
			if(_event.keyCode == 13)
			{
				if($('#inp_auth_pwd').value != '')
				{
					runAuth();
				}
			}
		});

	$('#inp_auth_submit').on('click', function(){runAuth();});
	$('#div_auth_show_reg').on('click', function(){showReg();});



} // function loadedAuthClass()



/*
Передача запроса на Авторизацию серверу.
*/
function runAuth()
{
console.log('-> runAuth()');

	var i, dr;



	$("#div_auth_messenger").hide(); 



	var sLogin = document.getElementById('inp_auth_login').value;
	if(sLogin == '')
	{
		$("#inp_auth_login").parent().css('border', 'red 1px solid');// устанавливаем рамку красного цвета
		document.getElementById('inp_auth_login').focus();

		sErrorText = "Не заполнено поле Логин !!!";
		$("#div_auth_messenger").html(sErrorText); 
		$("#div_auth_messenger").fadeIn("slow"); 

		return -1;
	}
	else
	{
		$("#inp_auth_login").parent().css('border', 'gray 1px solid');
	}



	var sPwd = document.getElementById('inp_auth_pwd').value;
	if(sPwd == '')
	{
		$("#inp_auth_pwd").parent().css('border', 'red 1px solid');
		document.getElementById('inp_auth_pwd').focus();

		sErrorText = "Не заполнено поле Пароль !!!";
		$("#div_auth_messenger").html(sErrorText); 
		$("#div_auth_messenger").fadeIn("slow"); 

		return -1;
	}
	else
	{
		$("#inp_auth_pwd").parent().css('border', 'gray 1px solid');
	}



	// Заполняем список Параметр=Значение
	var sData = 'login='+sLogin+'&pwd='+encodeURIComponent(sPwd);
//alert('sStr='+sStr);


	// Вызываем PHP-скрипт формирования массива данных для карты
	$.ajax({
		type: "POST",
		url: "index.php",
		data: sData,
		dataType: "script",
		cache: false,
		async: false,
		contentType: 'application/x-www-form-urlencoded',
		success: function(_data, _textStatus, _jqXHR)
		{
//console.log('success:\n_data='+_data);
			workAuthResult(_data);
		},

		complete: function(_jqXHR, _textStatus)
		{
//console.log('complete:\n_textStatus='+_textStatus);
//alert('complete');
		},

		error: function(_jqXHR, _textStatus, _errorThrown)
		{
console.log('error:\n_jqXHR.responseText='+_jqXHR.responseText + '\n_textStatus=' + _textStatus + '\_errorThrown=' +_errorThrown);
alert('error:\n_jqXHR.responseText='+_jqXHR.responseText + '\n_textStatus=' + _textStatus + '\n_errorThrown=' +_errorThrown);
			iRetval = -1;
		}
	});


console.log('<- runAuth() = '+giUserId);

	return giUserId;

} // function runAuth()



/*
Обработка результата попытки Авторизации
*/
function workAuthResult(_data)
{
console.log('-> workAuthResult(_data)');



	$("#div_auth_messenger").hide(); 

	if(_data.length < 5)
	{
		alert("Ошибка Аутентификации Пользователя. "+gsCall2Dvlpr);
		return -1;
	}





	if(giErrCode == 0 && giUserId > 0)
	{
			// Успешная Авторизация
		document.location = gsFormMain;
		return giUserId;

	}


	if(giErrCode > 0)
	{
		// Что-то с алгоритмом работы
		alert('f:workAuthResult(_data) Что-то с алгоритмом работы !!!');
		return -2;
	}


	if(giErrCode < 0)
	{

		if(gsFormReg != '')
		{

			showReg();
			return;

		}

		if(gsErrInpElm != '')
		{

			$("#"+gsErrInpElm).parent().css('border', 'red 1px solid');// устанавливаем рамку красного цвета
			document.getElementById(gsErrInpElm).focus();

		}

		$("#div_auth_messenger").html(gsErrMsg); 
		$("#div_auth_messenger").fadeIn("slow"); 

	}







console.log('<- workAuthResult(_data)');
	return giRetVal;

} // function workAuthResult(_data)





/*
*/
function showReg()
{
s2cl('->	showReg()');

	if(gsUserLogin == '')
	{
		document.location = gsFormReg;
	}
	else
	{

		var form = document.createElement("form");
		input = document.createElement("input");

		form.action = gsFormReg;
		form.method = "post"

		input.type = "hidden";
		input.name = "login";
		input.value = gsUserLogin;
		form.appendChild(input);

		document.body.appendChild(form);
		form.submit();

	}

s2cl('<-	showReg()');
} // function showReg()
