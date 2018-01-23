package TimerPackSinhro;
import Sinhro.AccessATMDay;
import Sinhro.AccessATMMonth;
import Sinhro.RONINKAS;
import Sinhro.SRVFIRM;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.TimerTask;

public class OneDayUpdate extends TimerTask{
    @Override
    public void run() {
       /* try {
            Start();
        } catch (Exception ex) {
            Logger.getLogger(AccessATMMonth.class.getName()).log(Level.SEVERE, null, ex);
        }*/
   }   
    
    private void Start(){
        AccessATMDay aad = new AccessATMDay();
        AccessATMMonth aam = new AccessATMMonth();

        
        SRVFIRM sf = new SRVFIRM();
      /*  new Thread(() -> {
            try {
                aad.take_AccessATMDay();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();   
        new Thread(() -> {
            try {
                aam.take_AccessATMMonth();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();  
        
        
        new Thread(() -> {
            try {
                sf.take_SRVFIRM();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();*/
    }
}
