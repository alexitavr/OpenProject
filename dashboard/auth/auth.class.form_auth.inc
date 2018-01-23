<!DOCTYPE HTML>
<html>
<head>

	<meta charset="utf-8">
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

	<title><?php echo $ggv->sProgName;?>: Аутентификация</title>
	<meta name='keywords' content='<?php echo $ggv->sProgKeywords;?>' />
	<meta name='description' content='<?php echo $ggv->sProgDesc;?>...: подключение' />



	<link type='image/x-icon' href='/common/img/favicon.ico' rel='icon'/>
	<link type='image/x-icon' href='/common/img/favicon.ico' rel='shortcut icon'/>



	<!-- JQUERY SECTION -->
	<script type="text/javascript" src="/common/js/jquery/jquery.js"></script>
	<!-- JQUERY SECTION END -->


	<link rel="stylesheet" href="/common/php/auth.class.css" type="text/css" />
	<script type='text/javascript' src='/common/js/ggv.js'></script>
	<script type='text/javascript' src='/common/php/auth.class.js'></script>

	<script>
		var gsFormReg = '<?php echo $ggv->sFormReg;?>';
	</script>

</head>



<body><!--BODY BODY BODY BODY BODY BODY BODY BODY BODY BODY BODY BODY BODY BODY-->



<!-- АУТЕНТИФИКАЦИЯ -->

	<div id='div_auth'>

		<div id='div_prog_label'><?php echo $ggv->sProgName;?></div>
		<div id='div_auth_caption'>АУТЕНТИФИКАЦИЯ</div>

		<div id="div_auth_messenger"></div>

		
		<fieldset>

			<table id='tbl_input'>
				<tr>
					<td class='td_auth_input'>
						<input type="text" required id="inp_auth_login" value='<?php echo (isset($ggv->sUserLogin) ? $ggv->sUserLogin : '');?>' placeholder="логин" list='dl_userlist' title='Введите псевдоним для входа в систему'> 
<datalist id='dl_userlist'>
<option>EvstratovMA</option>
<option>DanilukEI</option>
</datalist>
					</td>
				</tr>
				<tr>
					<td class='td_auth_input'>
						<input type="password" required id="inp_auth_pwd" value='' placeholder="Пароль" title='Введите пароль для входа в систему. Нажатие/отпускание левой кнопки мыши на поле изменяет режим отображения пароля'>
					</td>
				</tr>
			</table>

		</fieldset>



		<div id='div_auth_button'>
			<input type="submit" id="inp_auth_submit" value="ВОЙТИ">
		</div>

		<div id='div_auth_func'>
			<div>
				<span id='div_auth_show_reg' title='Вызов процедуры регистрации нового пользователя в системе'>Заявка на доступ к системе</span>
			</div>
		</div>
	</div> <!-- <div id='div_auth'> -->

<!-- АВТОРИЗАЦИЯ END -->





<!-- НЕ ВКЛЮЧЕНЫ КУКИ -->
	<div id='div_cookie' style="padding-top:150px;text-align:center; display: none;">
		<h2>У Вас в браузере отключены куки !!!</h2>
	</div>
<!-- НЕ ВКЛЮЧЕНЫ КУКИ END -->


</body><!--BODY END BODY END BODY END BODY END BODY END BODY END BODY END BODY END-->
</html>
