/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SQLForEXEL;

public class SQLforEXELZadachCount {

    public String SQLcreateFirst() {
        return "select to_char(dt, 'DD.MM.RRRR') , nvl(count1,0), nvl(count2,0), nvl(count3,0), round(nvl(count4,0)), ns\n"
                + "from\n"
                + "(select trunc(DT_TASK) dt, count(FIRMLINK) count1 , im.FIRMLINK fr1, NAME_SHORT  ns\n"
                + "from  IMTASKS im, SRVFIRM sr  \n"
                + "where trunc(DT_TASK) between to_date('14.09.2016','DD.MM.RRRR HH24:MI') and to_date(sysdate + 1,'DD.MM.RRRR HH24:MI') and sr.SNUM = im.FIRMLINK  \n"
                + "group by trunc(DT_TASK),  FIRMLINK, NAME_SHORT) mains\n"
                + "left join\n"
                + "(select trunc(DT_TASK) dt1, count(FIRMLINK) count2 , im.FIRMLINK fr2 \n"
                + "from  IMTASKS im  \n"
                + "where trunc(DT_TASK) between to_date('14.09.2016','DD.MM.RRRR HH24:MI') and to_date(sysdate + 1,'DD.MM.RRRR HH24:MI') and\n"
                + "SRV_STATUS = 2 group by trunc(DT_TASK),  FIRMLINK)\n"
                + "con1 on  con1.dt1 = mains.dt and con1.fr2 = mains.fr1\n"
                + "left join\n"
                + "(select trunc(DT_TASK) dt2, count(FIRMLINK) count3 , im.FIRMLINK fr3 \n"
                + "from  IMTASKS im  \n"
                + "where trunc(DT_TASK) between to_date('14.09.2016','DD.MM.RRRR HH24:MI') and to_date(sysdate + 1,'DD.MM.RRRR HH24:MI')\n"
                + "and DT_REPAIR > 480\n"
                + "group by trunc(DT_TASK),  FIRMLINK)\n"
                + "con2 on  con2.dt2 = mains.dt and con2.fr3 = mains.fr1\n"
                + "left join\n"
                + "(select trunc(DT_TASK) dt3, (sum(DT_REPAIR)-(count(FIRMLINK)*480))/60 count4 , im.FIRMLINK fr4 \n"
                + "from  IMTASKS im  \n"
                + "where trunc(DT_TASK) between to_date('14.09.2016','DD.MM.RRRR HH24:MI') and to_date(sysdate + 1,'DD.MM.RRRR HH24:MI')\n"
                + "and DT_REPAIR > 480\n"
                + "group by trunc(DT_TASK),  FIRMLINK)\n"
                + "con3 on  con3.dt3 = mains.dt and con3.fr4 = mains.fr1\n"
                + "order by   dt, fr1 ASC";
    }
}
