<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Форма входа в систему</title>
  </head>
  <body>
  <br>
  <h1>Вход в систему</h1>
  <form action="CheckUser" method="post">
      Пользователь: <input type="text" name="user" size="10"><br>
      Пароль: <input type="password" name="password" size="10"><br>
      <p>
      <table>
          <tr>
          <th><small>
              <input type="submit" name="login" value="Войти в систему">
          </small>
      </table>
  </form>
  <br>
  </body>
</html>

