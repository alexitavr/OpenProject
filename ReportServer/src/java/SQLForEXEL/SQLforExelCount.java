package SQLForEXEL;

public class SQLforExelCount {
    
    public String SqlCount(){
        return "select ATMs,ATMPOST,RONCOMM,incas_date,zagr,rest,nvl(sum(SUMS),0), nvl(dept,0), nvl(sum(cont),0), nvl(const,0), tip from \n" +
"        (select distinct RONLINK,ATMPOST, substr(ATMLUNO,6,9) ATMs,RONCOMM, \n" +
"        to_char(DTFINISHBEG,'DD.MM.RRRR HH24:MI') incas_date, \n" +
"        (NTANOM1/100)*NTALOAD1+(NTANOM2/100)*NTALOAD2+(NTANOM3/100)*NTALOAD3+(NTANOM4/100)*NTALOAD4 zagr, \n" +
"        NTAREST1*(NTANOM1/100)+NTAREST2*(NTANOM2/100)+NTAREST3*(NTANOM3/100)+NTAREST4*(NTANOM4/100) rest, case when ATMTYPE in ('1','6') then 'Депозитор' else 'Банкомат' end tip \n" +
"        from RONINKAS, Rondo where RONLINK = SNUM and DTSTARTEND is null) t1 \n" +
"        full outer join \n" +
"        (select RONLINK_0, DTTRANSEND_5, sum(PAYSUM_18)/100 sums, count(DTTRANSEND_5) cont from RONTRANS \n" +
"        where SERVID_15 = 13 and SERVEND_16 = 0 and DTTRANSEND_5 between to_date(trunc(sysdate)-1,'DD.MM.RRRR HH24:MI:SS') \n" +
"        and to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI:SS') \n" +
"        group by RONLINK_0, DTTRANSEND_5) t2 on t2.RONLINK_0 = t1.RONLINK  \n" +
"        left join \n" +
"        (select RONLINK_0, sum(NTESUMRUB_145)/100 dept, count(NTESUMRUB_145) const from RONTRANS \n" +
"        where SERVID_15 = 7 and SERVEND_16 = 0 and DTTRANSEND_5 between to_date(trunc(sysdate)-1,'DD.MM.RRRR HH24:MI:SS') \n" +
"        and to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI:SS') \n" +
"        group by RONLINK_0) ts2 \n" +
"        on  t1.RONLINK = ts2.RONLINK_0\n" +
"        GROUP by ATMs,zagr,rest,incas_date,ATMPOST,RONCOMM, const, dept, tip  ";
    }   
        public String SqlCountNet(){
        return "select ATMs,ATMPOST,RONCOMM,incas_date,zagr,rest,nvl(sum(SUMS),0), nvl(dept,0), nvl(sum(cont),0), nvl(const,0), tip from \n" +
"        (select distinct RONLINK,ATMPOST, substr(ATMLUNO,6,9) ATMs,RONCOMM, \n" +
"        to_char(DTFINISHBEG,'DD.MM.RRRR HH24:MI') incas_date, \n" +
"        (NTANOM1/100)*NTALOAD1+(NTANOM2/100)*NTALOAD2+(NTANOM3/100)*NTALOAD3+(NTANOM4/100)*NTALOAD4 zagr, \n" +
"        NTAREST1*(NTANOM1/100)+NTAREST2*(NTANOM2/100)+NTAREST3*(NTANOM3/100)+NTAREST4*(NTANOM4/100) rest, case when ATMTYPE in ('1','6') then 'Депозитор' else 'Банкомат' end tip \n" +
"        from RONINKAS, Rondo where RONLINK = SNUM and DTSTARTEND is null) t1 \n" +
"        full outer join \n" +
"        (select RONLINK_0, DTTRANSEND_5, sum(PAYSUM_18)/100 sums, count(DTTRANSEND_5) cont from RONTRANS \n" +
"        where SERVID_15 = 13 and SERVEND_16 = 0 and DTTRANSEND_5 > to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI:SS')  \n" +
"        group by RONLINK_0, DTTRANSEND_5) t2 on t2.RONLINK_0 = t1.RONLINK  \n" +
"        left join \n" +
"        (select RONLINK_0, sum(NTESUMRUB_145)/100 dept, count(NTESUMRUB_145) const from RONTRANS \n" +
"        where SERVID_15 = 7 and SERVEND_16 = 0 and DTTRANSEND_5 > to_date(trunc(sysdate),'DD.MM.RRRR HH24:MI:SS')  \n" +
"        group by RONLINK_0) ts2 \n" +
"        on  t1.RONLINK = ts2.RONLINK_0\n" +
"        GROUP by ATMs,zagr,rest,incas_date,ATMPOST,RONCOMM, const, dept, tip  ";
    }  
}
