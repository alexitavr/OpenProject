/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SQLForEXEL;

public class SQLforEXELCassa {
    
    public String SQLcreateFirst(){
        return "select substr(RONLUNO_2,6,9), to_char(DTTRANSEND_5,'DD.MM.RRRR HH24:MI'),\n" +
"CARDPAN_11, AUTHCODE_202, RETREFNUM_201, RONTRANSID_1, RECIEPTNUM_17, PAYSUM_18/100,\n" +
"DISPNUM1_81, DISPNUM2_86, DISPNUM3_91, DISPNUM4_96\n" +
"from rontrans WHERE NTASTATUS_156 in ('3','4') and SERVID_15 = 13 and SERVEND_16 = 0 \n" +
"and DTTRANSEND_5 between to_date(trunc(sysdate) - 1,'DD.MM.RRRR HH24:MI') and to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI')";
    }
    
    public String SQLcreateSecond(){
        return "select substr(RONLUNO_2,6,9), to_char(DTTRANSEND_5,'DD.MM.RRRR HH24:MI'),\n" +
"CARDPAN_11, AUTHCODE_202, RETREFNUM_201, RONTRANSID_1, RECIEPTNUM_17, PAYSUM_18/100,\n" +
"DISPNUM1_81, DISPNUM2_86, DISPNUM3_91, DISPNUM4_96\n" +
"from rontrans WHERE NTASTATUS_156 in ('5') and SERVID_15 = 13 and SERVEND_16 = 0 \n" +
"and DTTRANSEND_5 between to_date(trunc(sysdate) - 1,'DD.MM.RRRR HH24:MI') and to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI')";
    }
    
}
