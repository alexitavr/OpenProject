package MailPack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectToDB.OraConRepo;

public class Content {
    private Statement statement = null;
    private OraConRepo orc = new OraConRepo(); 
    
    public String CreateContent(String SQL, String SQL1, String SQL2) throws SQLException{
        double PERCENT_0 = 0;            
        double PERCENT_3 = 0;
        double PERCENT_4 = 0;            
        double PERCENT_7 = 0;           
        double PERCENT_11 = 0;               
        double PERCENT_12 = 0;              
        double PERCENT_19 = 0;                
        double PERCENT_14 = 0;               
        double PERCENT_15 = 0;   
            String DATEACCESS = null;
            int count_DATEACCESS = 0;
            int Count_NotWorkATM;
            try (Connection orcs = orc.GetConnSession()) {
                statement = orcs.createStatement();
                ResultSet res = statement.executeQuery(SQL);
                while (res.next()) {
                    DATEACCESS = res.getString(1);
                    count_DATEACCESS = res.getInt(2);
                }   Count_NotWorkATM = 0;
                res = statement.executeQuery(SQL1);
                while (res.next()) {
                    Count_NotWorkATM = res.getInt(1);
                }
            }
            Connection orcs = orc.GetConnSession();
            statement = orcs.createStatement();
            ResultSet res = statement.executeQuery(SQL2);    
            
        while (res.next()) {             
        PERCENT_0 = res.getDouble(1)/100;            
        PERCENT_3 = res.getDouble(2)/1000;
        PERCENT_4 = res.getDouble(3)/1000;            
        PERCENT_7 = res.getDouble(4)/1000;           
        PERCENT_11 = res.getDouble(5)/1000;               
        PERCENT_12 = res.getDouble(6)/1000;              
        PERCENT_19 = res.getDouble(7)/1000;                
        PERCENT_14 = res.getDouble(8)/1000;               
        PERCENT_15 = res.getDouble(9)/1000;      
        }
        orcs.close();
          
        return "</head><body lang=RU link=blue vlink=purple>"
            + "<div class=WordSection1><table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=1359 style='width:1019.0pt;margin-left:-.75pt;border-collapse:collapse'><tr style='height:15.0pt'>"
            + "<td width=1048 nowrap colspan=10 valign=bottom style='width:786.0pt;border:solid windowtext 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>"
            + "<b>"+"Статистика за " + DATEACCESS+". Всего УС - "+(count_DATEACCESS+Count_NotWorkATM)+". "
                    + "В отчете - "+count_DATEACCESS+". Ожидают получения данных после отключения(220 Вт/Связи/Введенные в эксплуатацию) "
                    + "- "+Count_NotWorkATM+"."+"<o:p></o:p></b></p></td></tr>"
            + "<tr style='height:90.0pt'>"
            + "<td width=64 style='width:48.0pt;border:solid windowtext 1.0pt;border-top:none;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>&nbsp;<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Выполнимость услуг<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Выключение устройства по 220 В<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Неисправность узлов УС<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Недостаток или отсутствие наличности в УС<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Переполнение кассеты депозитора УС<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Отсутствие связи с сервером MobilPay<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Разрыв связи с HOST<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Персональное отключение услуги по команде сервера MobilPay<o:p></o:p></p></td>"
            + "<td width=109 style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:silver;padding:0cm 5.4pt 0cm 5.4pt;height:90.0pt'>"
            + "<p class=MsoNormal align=center style='text-align:center'>Общее отключение услуг по команде сервера MobilPay<o:p></o:p></p></td></tr>"
            + "<tr style='height:15.0pt'><td width=64 nowrap valign=top style='width:48.0pt;border:solid black 1.0pt;border-top:none;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>Итого: <o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_0+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_3+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_4+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_7+"<o:p></o:p></p>"
            + "</td><td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_11+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_12+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_19+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_14+"<o:p></o:p></p></td>"
            + "<td width=109 nowrap valign=top style='width:82.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;background:#FFFF99;padding:0cm 5.4pt 0cm 5.4pt;height:15.0pt'>"
            + "<p class=MsoNormal>"+PERCENT_15+"<o:p></o:p></p></td></tr></table>"
            + "<p class=MsoNormal><o:p>&nbsp;</o:p></p></div></body></html>"
            + "<p class=MsoNormal><o:p>&nbsp;</o:p></p>";
    }
}