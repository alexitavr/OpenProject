package SQLForEXEL;

public class SQLforExelNetWorkLoad {
    
    public String SqlIncident(String date1, String date2){
        if (date1 == null || date2 == null){return "Wrong";}
        else{
        return "select mains.USERNAME, count1, count2, count3, count4, count5, count6, \n" +
"(nvl(count1,0) + nvl(count2,0) + nvl(count3,0) + nvl(count4,0) + nvl(count5,0) + nvl(count6,0)) zadachi\n" +
", count7, count8, count9, count10, count11, count12, count13, count14, count15, count16, count17, count18, count19, count20, count21, count22, count23, count24,\n" +
"(nvl(count7,0)+nvl(count8,0)+nvl(count9,0)+nvl(count10,0)+nvl(count11,0)+nvl(count12,0)+nvl(count13,0)\n" +
"+nvl(count14,0)+nvl(count15,0)+nvl(count16,0)+nvl(count17,0)+nvl(count18,0)+nvl(count19,0)+nvl(count20,0)\n" +
"+nvl(count21,0)+nvl(count22,0)+nvl(count23,0)+nvl(count24,0)) incidents, count25, count26, count27\n" +
"from\n" +
"(select USERNAME from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TYPEACTION = 13 \n" +
"and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI') group by USERNAME) mains\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count1 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('%Заявка%создана.%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con1 on mains.USERNAME = con1.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count2 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Заявка%изменена:% - Статус: %->2%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con2 on con2.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count3 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Заявка%изменена:% - Статус: %->3%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con3 on con3.USERNAME = mains.USERNAME\n" +
"left join \n" +
"(select USERNAME, count(USERNAME) count4 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Заявка%изменена:% - Статус:%->4%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con4 on con4.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count5 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Заявка%изменена:% - Статус: %->5%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con5 on con5.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count6 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Заявка%изменена:% - Статус: %->6%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con6 on con6.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count7 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Новый Инцидент%создан для АТМ:%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con7 on mains.USERNAME = con7.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count8 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Открыт%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con8 on con8.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count9 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Закрыт%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con9 on con9.USERNAME = mains.USERNAME\n" +
"left join \n" +
"(select USERNAME, count(USERNAME) count10 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Отменён%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con10 on con10.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count11 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Прочее%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con11 on con11.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count12 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Временно не работает%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con12 on con12.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count13 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> FLM%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con13 on mains.USERNAME = con13.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count14 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> SLM%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con14 on con14.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count15 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Техвыезд%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con15 on con15.USERNAME = mains.USERNAME\n" +
"left join \n" +
"(select USERNAME, count(USERNAME) count16 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Техническая переинкассация%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con16 on con16.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count17 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Переинкассация%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con17 on con17.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count18 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Разгрузка%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con18 on con18.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count19 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Загрузка%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con19 on con19.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count20 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Электропитание%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con20 on con20.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count21 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Доступ%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con21 on con21.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count22 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Перемещение/демонтаж%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con22 on con22.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count23 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Связь%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con23 on con23.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count24 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент%изменен:% - Статус % -> Сигнализация%') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con24 on con24.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count25 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент % изменен:__ - Отдел % -> %') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con25 on con25.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count26 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент % изменен: _ - Исполнитель  -> %') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con26 on con26.USERNAME = mains.USERNAME\n" +
"left join\n" +
"(select USERNAME, count(USERNAME) count27 \n" +
"from AUDITMP am, AUDITACTION aa, AUDITFUNC af \n" +
"where aa.FUNCLINK = af.SNUM and af.MPLINK = am.SNUM and TEXTAUDIT like ('Инцидент % изменен (инкассационные параметры): %') and DTONMP between to_date('"+date1+"','DD.MM.RRRR HH24:MI') and to_date('"+date2+"','DD.MM.RRRR HH24:MI')\n" +
"group by USERNAME) con27 on con27.USERNAME = mains.USERNAME";
        }
    }
    public String CountAutoInc(String date1, String date2){
        if (date1 == null || date2 == null){return "Wrong";}
        else{
       return "select count(*) from IMINCIDENTS where DT_RECORD between to_date('"+date1+"','DD.MM.RRRR HH24:MI') "
               + "and to_date('"+date2+"','DD.MM.RRRR HH24:MI') and RECORD = 'A'";
        }
    }
    
}
