package SQLForEXEL;

public class SQLforExelNetInc {
    
    public String SqlIncident(String datecount){
        if (datecount == null) {
            datecount = "7";
        }
        return "select TO_CHAR(i.DT_RECORD, 'DD.MM.RRRR HH24:MI')," +
"               TO_CHAR(i.DT_CURRDEP, 'DD.MM.RRRR HH24:MI')," +
"               decode(i.PRIORITY, 1,'Высокая', 2,'Средняя', 3,'Низкая')," +
"               i.record," +
"               i.SNUM," +
"               SUBSTR(r.atmluno, 6, 9)," +
"               te.MODELNAME," +
"               substr(ATMPOST, 1, instr(ATMPOST, ',') - 1)," +
"               substr(ATMPOST, instr(ATMPOST, ',') + 1)," +
"               ims.NAME," +
"               srv.NAME_SHORT," +
"               i.contlink," +
"               TYPE_INKASS," +
"               TO_CHAR(INKASS_DT, 'DD.MM.RRRR HH24:MI')," +
"               INKCOMMENT," +
"               decode(t.SRV_STATUS, 1,'Открыта', 2, 'Закрыта', 5,'Отменена')," +
"               to_char(t.dt_task, 'DD.MM.RRRR  HH24:MI')," +
"               replace(replace(t.ordercomm, chr(13), ''), chr(10), '')," +
"               replace(replace(t.taskcomment, chr(13), ''), chr(10), '')," +
"               (select name_short from srvfirm where snum = t.firmlink), i.COMMENTS" +
"          from imincidents i" +
"          LEFT JOIN imtasks t" +
"            ON i.snum = t.inclink, rondo r, ATMTYPE te, SRVDEPART srv, IMSTATUS ims" +
"         where r.ATMTYPE = te.snum" +
"           and i.RONLINK = r.snum" +
"           and i.STATUSLINK = ims.ST_CODE" +
"           and i.DEPLINK = srv.SNUM" +
"           and i.DT_RECORD >= sysdate - "+ datecount +
"           and i.DT_RECORD <  sysdate+1" +
"         order by 1";
    }   
    
}
