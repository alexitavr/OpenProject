<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	<link type='image/x-icon' href='/common/img/favicon.ico' rel='icon'/>
	<link type='image/x-icon' href='/common/img/favicon.ico' rel='shortcut icon'/>
</head>
<body>
	<div style='padding-top:150px;text-align:center;'>
		<div>
			<h4>
				<?php echo str_replace("\n",'<br>',$ggv->sErrMsg);?>
			</h4>
		</div>
		<h3>
			<a href='index.php'>Вернуться в <?php echo $ggv->sProgName;?></a>
		</h3>
	</div>
</body>
</html>
