package SQLForEXEL;

public class SQLforExelInc {
    
    public String SqlIncident(){
        return "select distinct to_char(t.dt_task,'DD.MM.RRRR  HH24:MI') startime, (select distinct p.device from improblems p where  p.taskslink(+) = t.snum and rownum = 1), SUBSTR(r.atmluno,6,9), ATMPOST,  replace(replace(t.ordercomm,chr(13),''),chr(10),''), "
                + "replace(replace(t.taskcomment,chr(13),''),chr(10),''), t.srv_status, s.name_short, round(t.dt_repair/60), t.dt_repair "
                + "from imtasks t, rondo r, srvfirm s, imincidents i "
                + "where s.snum = t.firmlink and t.inclink = i.snum and i.RONLINK = r.snum and ((t.SRV_STATUS in ('1') and DT_FIN is null)"
                + " or (t.SRV_STATUS in ('2') and DT_FIN is not null) or (t.SRV_STATUS in ('2') and DT_FIN is  null)) "
                + " order by DT_REPAIR";
    }   
    
    public String SqlIncident1(){
        return "select distinct to_char(t.dt_task,'DD.MM.RRRR  HH24:MI') startime, (select distinct p.device from improblems p where  p.taskslink(+) = t.snum and rownum = 1), SUBSTR(r.atmluno,6,9), (select NAME from IMSTATUS where ST_CODE = i.STATUSLINK), "
                + "(select iss.NAME_SHORT from SRVDEPART iss where iss.SNUM = i.DEPLINK),"
                + "ATMPOST,  replace(replace(t.ordercomm,chr(13),''),chr(10),''), "
                + "replace(replace(t.taskcomment,chr(13),''),chr(10),''), t.srv_status, s.name_short, round(t.dt_repair/60), t.dt_repair "
                + "from imtasks t, rondo r, srvfirm s, imincidents i "
                + "where s.snum = t.firmlink and t.inclink = i.snum and i.RONLINK = r.snum and ((t.SRV_STATUS in ('1') and DT_FIN is null)"
                + " or (t.SRV_STATUS in ('2') and DT_FIN is not null) or (t.SRV_STATUS in ('2') and DT_FIN is  null)) "
                + "order by DT_REPAIR";
    } 
    
    public String SqlIncidentFirm(int sum){
        return "select distinct to_char(t.dt_task,'DD.MM.RRRR  HH24:MI') startime, p.device, SUBSTR(r.atmluno,6,9),te.MODELNAME , SERIAL_NUM, substr(ATMPOST, 1, instr(ATMPOST,',')-1), substr(ATMPOST,instr(ATMPOST,',')+1),  replace(replace(t.ordercomm,chr(13),''),chr(10),''), "
                + "replace(replace(t.taskcomment,chr(13),''),chr(10),''), s.name_short, round(t.dt_repair/60), t.dt_repair "
                + "from imtasks t, rondo r, srvfirm s, imincidents i, improblems p, ATMTYPE te  where r.ATMTYPE=te.snum and s.snum = t.firmlink "
                + "and t.inclink = i.snum and i.RONLINK = r.snum and t.snum = p.taskslink(+) and t.SRV_STATUS in ('1') and DT_FIN is null and s.SNUM = "+sum+" order by DT_REPAIR";
    }  
    
    public String SqlIncident2(){
        return "select distinct to_char(t.dt_task,'DD.MM.RRRR  HH24:MI') startime, (select distinct p.device from improblems p where  p.taskslink(+) = t.snum and rownum = 1), SUBSTR(r.atmluno,6,9), (select NAME from IMSTATUS where ST_CODE = i.STATUSLINK), "
                + "(select iss.NAME_SHORT from SRVDEPART iss where iss.SNUM = i.DEPLINK),"
                + "ATMPOST,  replace(replace(t.ordercomm,chr(13),''),chr(10),''), "
                + "replace(replace(t.taskcomment,chr(13),''),chr(10),''), t.srv_status, s.name_short, round(t.dt_repair/60), t.dt_repair "
                + "from imtasks t, rondo r, srvfirm s, imincidents i "
                + "where s.snum = t.firmlink and t.inclink = i.snum and i.RONLINK = r.snum and t.SRV_STATUS in ('1') and DT_FIN is null "
                + "order by DT_REPAIR";
    } 
    
}
