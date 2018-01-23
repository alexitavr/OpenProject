package TimerPackSinhro;

import CreateExelPack.CreateExelZakrInkasYes;
import CreateExelPack.ExelProstZai;
import CreateExelPack.ExelDostCreate;
import CreateExelPack.EXELinceMAIN;
import CreateExelPack.ExelMidnightCount;
import CreateExelPack.ExelRetractKacca;
import CreateExelPack.ExelZadachCountOrg;
import Sinhro.AccessATMMonth;
import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TimeToUpdate extends TimerTask{
    
    private Timer timer = new Timer();
    private Date currentDate = new Date();
    private Calendar cal = Calendar.getInstance();
        
    @Override
    public void run() { 
       /* try {
            Start();
        } catch (Exception ex) {
            Logger.getLogger(TimeToUpdate.class.getName()).log(Level.SEVERE, null, ex);
        }*/
   }  
    public void Timers(){
            Timer timer = new Timer();
            TimerTask taskExel = new FiveMinuteSinhro();  
            timer.schedule(taskExel, 1000, 10000);
        } 
     
    public void Timer(){
          /*  TimerTask taskStartRun = new TimeToUpdate();
            FiveMinuteSinhro fms = new FiveMinuteSinhro();
            TenMinuteSinhro tms = new TenMinuteSinhro();
            Date StartTime = new Date();
            timer.schedule(taskStartRun, StartTime, 60000); 
            timer.schedule(fms, StartTime, 290000);
            timer.schedule(tms, StartTime, 590000);*/
        }

    private void Start(){
      /*  Date StartTime = new Date();
        if (StartTime.getHours() == 8 && StartTime.getMinutes() == 30) {OneDayUpdate();
        }else if ((StartTime.getHours() == 8 && StartTime.getMinutes() == 35)){StartExelProstMain();
        }else if ((StartTime.getHours() == 8 && StartTime.getMinutes() == 58) ){ExelDostCreate();  
        }else if ((StartTime.getHours() == 9 && StartTime.getMinutes() == 30) ){ExelZadachCountOrg();
        }else if ((StartTime.getHours() == 17 && StartTime.getMinutes() == 25)){StartExelProstMain();
        }else if ((StartTime.getHours() == 19 && StartTime.getMinutes() == 55) ){StartExelProst();
        }else if ((StartTime.getHours() == 00 && StartTime.getMinutes() == 05) ){ExelZakrInkasYes();
        }else if ((StartTime.getHours() == 00 && StartTime.getMinutes() == 55) ){ExelCassaRetract();
        }else if ((StartTime.getHours() == 00 && StartTime.getMinutes() == 02) ){ExelMidnightCounts();}*/
    }  
    private void StartExelProst(){
      /*  TimerTask taskExel = new ExelProstZai();  
        timer.schedule(taskExel, TimeAdd());*/
    }   
    private void StartExelProstMain(){
       /* TimerTask taskExel = new EXELinceMAIN();  
        timer.schedule(taskExel, TimeAdd());*/
    }   
    private void ExelDostCreate(){       
       /* TimerTask taskexelDostCreate = new ExelDostCreate();
        timer.schedule(taskexelDostCreate, TimeAdd());*/
    }
    private void ExelZadachCountOrg(){       
      /*  TimerTask taskExelZadachCountOrg = new ExelZadachCountOrg();
        timer.schedule(taskExelZadachCountOrg, TimeAdd());*/
    }
    private void OneDayUpdate(){
      /*  TimerTask taskOneDayUpdate = new OneDayUpdate();
        timer.schedule(taskOneDayUpdate, TimeAdd());*/
    }
    private void ExelMidnightCounts(){
       /* TimerTask taskOneDayUpdate = new ExelMidnightCount();
        timer.schedule(taskOneDayUpdate, TimeAdd());*/
    }
    private void ExelCassaRetract(){
       /* TimerTask taskOneCassaRetract = new ExelRetractKacca();
        timer.schedule(taskOneCassaRetract, TimeAdd());*/
    }
    private void ExelZakrInkasYes(){
     /*   TimerTask taskExelZakrInkasYes = new CreateExelZakrInkasYes();
        timer.schedule(taskExelZakrInkasYes, TimeAdd());*/
    }
        
        private Date TimeAdd(){
        cal.setTime(currentDate);
        cal.add(Calendar.MINUTE, +1);
        Date oneHournext = cal.getTime(); 
        return oneHournext;
    }
}
