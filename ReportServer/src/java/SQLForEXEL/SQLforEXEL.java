/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SQLForEXEL;

public class SQLforEXEL {
    
    public String SQLcreateFirstRow(){
        return "select to_char(max(DATEACCESS),'DD.MM.RRRR'), count(DATEACCESS) from ACCESSATMDAY, RONDO where RONLINK=SNUM and SIGNWORK = 1 and DATEACCESS = (Select max(DATEACCESS) from AccessATMDay)";
    }
    
    public String SQLcreateForthRow(){
        return "select substr(ATMLUNO,6,9), ATMPOST, SUBSTR(PERCENT_0, 1, LENGTH(PERCENT_0)-1) PERCENT_0, PERCENT_3, PERCENT_4, PERCENT_7,"
              + "PERCENT_11, PERCENT_12, PERCENT_19, PERCENT_14, PERCENT_15 from ACCESSATMDAY, RONDO "
              + "where RONLINK=SNUM and  SIGNWORK = 1 and DATEACCESS = (Select max(DATEACCESS) from AccessATMDay) order by substr(ATMLUNO,6,9) ASC";
    }
    
    public String SQLcreateThirdRow(){
        return "select substr(round(avg(PERCENT_0)),0,4) PERCENT_0, "
              + "round(avg(PERCENT_3)) PERCENT_3, round(avg(PERCENT_4)) PERCENT_4, "
              + "round(avg(PERCENT_7)) PERCENT_7, round(avg(PERCENT_11)) PERCENT_11, "
              + "round(avg(PERCENT_12)) PERCENT_12, round(avg(PERCENT_19)) PERCENT_19, "
              + "round(avg(PERCENT_14)) PERCENT_14, round(avg(PERCENT_15)) PERCENT_15 "
              + "from ACCESSATMDAY, RONDO where RONLINK=SNUM and SIGNWORK = 1 and "
              + "DATEACCESS = (Select max(DATEACCESS) from AccessATMDay)";
    }
    
    
     public String SQLcreateFirstRowDep(){
        return "select to_char(max(DATEACCESS),'DD.MM.RRRR'), count(DATEACCESS) from ACCESSATMDAY, RONDO where RONLINK=SNUM and SIGNWORK = 1 and DATEACCESS = (Select max(DATEACCESS) from AccessATMDay)"
                + " and ATMTYPE in ('1','6')";
    }
    
    public String SQLcreateForthRowDep(){
        return "select substr(ATMLUNO,6,9), ATMPOST, SUBSTR(PERCENT_0, 1, LENGTH(PERCENT_0)-1) PERCENT_0, PERCENT_3, PERCENT_4, PERCENT_7,"
              + "PERCENT_11, PERCENT_12, PERCENT_19, PERCENT_14, PERCENT_15 from ACCESSATMDAY, RONDO "
              + "where RONLINK=SNUM and  SIGNWORK = 1 and DATEACCESS = (Select max(DATEACCESS) from AccessATMDay) and ATMTYPE in ('1','6') order by substr(ATMLUNO,6,9) ASC";
    }
    
    public String SQLcreateThirdRowDep(){
        return "select substr(round(avg(PERCENT_0)),0,4) PERCENT_0, "
              + "round(avg(PERCENT_3)) PERCENT_3, round(avg(PERCENT_4)) PERCENT_4, "
              + "round(avg(PERCENT_7)) PERCENT_7, round(avg(PERCENT_11)) PERCENT_11, "
              + "round(avg(PERCENT_12)) PERCENT_12, round(avg(PERCENT_19)) PERCENT_19, "
              + "round(avg(PERCENT_14)) PERCENT_14, round(avg(PERCENT_15)) PERCENT_15 "
              + "from ACCESSATMDAY, RONDO where RONLINK=SNUM and SIGNWORK = 1 and "
              + "DATEACCESS = (Select max(DATEACCESS) from AccessATMDay) and ATMTYPE in ('1','6')";
    }
    public String SQLcreateFiveRownoDay(){
        return "select substr(ATMLUNO,6,9), ATMPOST, null, null, null, null, null, null, null, null, null "
                + "from RONDO where  SIGNWORK = 1 and SNUM not in (Select RONLINK "
                + "from AccessATMDay where DATEACCESS = (Select max(DATEACCESS) from AccessATMDay)) "
                + "order by substr(ATMLUNO,6,9) ASC";
    }
    
    public String SQLcreateFiveRownoDayDep(){
        return "select substr(ATMLUNO,6,9), ATMPOST, null, null, null, null, null, null, null, null, null "
                + "from RONDO where  SIGNWORK = 1 and  ATMTYPE in ('1','6') and SNUM not in (Select RONLINK "
                + "from AccessATMDay where DATEACCESS = (Select max(DATEACCESS) from AccessATMDay)) "
                + "order by substr(ATMLUNO,6,9) ASC";
    }
    
    public String SQLcreateFiveRownoDayDepCount(){
        return "select count(*) from RONDO where  "
                + "SIGNWORK = 1 and SNUM not in (Select RONLINK from AccessATMDay "
                + "where DATEACCESS = (Select max(DATEACCESS) from AccessATMDay))";
    }
    
    public String SQLcreateFiveRownoDayDepCountDep(){
        return "select count(*) from RONDO where  "
                + "SIGNWORK = 1 and ATMTYPE in ('1','6') and SNUM not in (Select RONLINK from AccessATMDay "
                + "where DATEACCESS = (Select max(DATEACCESS) from AccessATMDay))";
    }
    
}
