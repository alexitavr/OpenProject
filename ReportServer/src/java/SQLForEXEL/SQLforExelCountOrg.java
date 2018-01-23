package SQLForEXEL;

public class SQLforExelCountOrg {
    
    public String SqlIncident(){
        return "select distinct \n"
                + "to_char(t.dt_task,'DD.MM.RRRR  HH24:MI') startime, (select distinct p.device from improblems p where  p.taskslink(+) = t.snum and rownum = 1), \n"
                + "SUBSTR(r.atmluno,6,9), ATMPOST,  replace(replace(t.ordercomm,chr(13),''),chr(10),''), \n"
                + "replace(replace(t.taskcomment,chr(13),''),chr(10),''), t.srv_status, s.name_short, round(t.dt_repair/60), t.dt_repair \n"
                + "from imtasks t, rondo r, srvfirm s, imincidents i \n"
                + "where s.snum = t.firmlink and t.inclink = i.snum and i.RONLINK = r.snum and ((t.SRV_STATUS in ('1') and DT_FIN is null)\n"
                + " or (t.SRV_STATUS in ('2') and DT_FIN is not null) or (t.SRV_STATUS in ('2') and DT_FIN is  null)) and trunc(t.dt_task) > '13.09.2016'  and DT_REPAIR > 480\n"
                + "order by DT_REPAIR";
    }  
  
}
