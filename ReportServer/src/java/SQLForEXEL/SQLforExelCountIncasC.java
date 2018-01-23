package SQLForEXEL;

public class SQLforExelCountIncasC {
    
    public String SqlCountInkas (String datecount){
        if (datecount == null) {
            datecount = "7";
        }
        return  "select  substr(ATMLUNO,6,9), to_char(DTFINISHBEG, 'DD.MM.RRRR'), to_char(DTSTARTEND, 'DD.MM.RRRR'),\n" +
                "case when ATMTYPE in ('1','6') then 'Депозитор' else 'Банкомат' end typesa, \n" +
                "(NTANOM1/100)*NTALOAD1+(NTANOM2/100)*NTALOAD2+(NTANOM3/100)*NTALOAD3+(NTANOM4/100)*NTALOAD4 zagr,\n" +
                "(NTANOM1/100)*NTADISP1+(NTANOM2/100)*NTADISP2+(NTANOM3/100)*NTADISP3+(NTANOM4/100)*NTADISP4 vida,\n" +
                "NTESUMRUBOK/100\n" +
                "from rondo, roninkas where roninkas.RONLINK = rondo.SNUM  and to_char(DTFINISHBEG, 'MM') = "+datecount+"\n" +
                "order by SUBSTR(ATMLUNO,6,9), trunc(DTFINISHBEG)";
    }       
}
