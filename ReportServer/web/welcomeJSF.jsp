<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Сервер отчетности</title>
        
    </head>
    <body>
        <style type="text/css">
            tr td {
                border: 0px solid;
                border-bottom: 1px solid #274c34;
                border-top: 1px solid #274c34;
                vertical-align: top;
                text-align: justify;
                background: white !important;
                width: 50%;
            }
            tr th {
                padding: 0;
                border: 0px solid;
                border-bottom: 1px solid #274c34;
                border-top: 1px solid #274c34;
                background: white !important;
                color: black !important;
                text-align: center;
            }
            .tds{
                vertical-align: middle;
                text-align: center;
            }
        </style>
        <form action="HelloServlet">
            <br><input type="hidden" name="time" min="0" max="90" value="0" size="2">                       
            <input type="hidden" value="Сформировать">						
        </form>	
        <table border="0" cellspacing="0" cellpadding="15" width="100%" height="130">
            
           <form action="HelloServlet" data-LDAP="EPEC_WebReport_ITM">
                <tr> 
                    <th colspan="6">ВАС ПРИВЕТСТВУЕТ СЕРВЕР ОТЧЕТНОСТИ</th></tr><tr>
                        
                <td>Путь к логам серевера \glassfish\glassfish\domains\domain1\logs\ <br> <br>
                     Путь к ini файлу  \ReportServer\build\web\WEB-INF\REPORTSERVER.INI<br> <br>
                </td>
            </form>	       
        </table>
    </body>
</html>