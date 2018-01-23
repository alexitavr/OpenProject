package javaapplication8;

import CreateExelPack.ExelZadachCountOrg;
import TimerPackSinhro.TimeToUpdate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class start extends HttpServlet {
    
    @Override
    public void init() throws ServletException {
       TimeToUpdate ttu = new TimeToUpdate();
      // ttu.Timer();
      ttu.Timers();
    }
}
