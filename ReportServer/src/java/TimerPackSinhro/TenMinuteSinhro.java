package TimerPackSinhro;

import Sinhro.AccessATMMonth;
import Sinhro.InfraSinc;
import Sinhro.Rondo;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TenMinuteSinhro extends TimerTask{
    Rondo rn = new Rondo();
    @Override
    public void run() {
     /*   try {
            Start();
        } catch (Exception ex) {
            Logger.getLogger(AccessATMMonth.class.getName()).log(Level.SEVERE, null, ex);
        }*/
   }    
    private void Start(){
        InfraSinc is = new InfraSinc();
     /*   new Thread(() -> {
            try {
                is.updateInfraSinc();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();  
        new Thread(() -> {
            try {
                rn.take_Rondo();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();*/
    }
}
