package TimerPackSinhro;

import Sinhro.AUDITACTION;
import Sinhro.AUDITFUNC;
import Sinhro.AUDITMP;
import Sinhro.AccessATMMonth;
import Sinhro.IMINCIDENTS;
import Sinhro.IMPROBLEMS;
import Sinhro.IMTASKS;
import Sinhro.LASTSTATUS;
import Sinhro.RONINKAS;
import Sinhro.RONTRANS;
import Sinhro.Ronevent;
import java.sql.Connection;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import ReportPack.POI;
import ConnectToDB.OraConFile;
import ReportPack.ZipUtils;
import ReportPack.oper_log;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;


public class FiveMinuteSinhro extends TimerTask{   
    private int v_REP_ID = 0;       
    private  int v_PC_OPER_ID = 0; 
      
    public static Connection InterfaceCon; 
   
    @Override
    public void run() {
        try {
            Start();
        } catch (Exception ex) {
            Logger.getLogger(AccessATMMonth.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Throwable ex) {
            Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
        }
   }    
    private void Start() throws Exception, Throwable{
  
 //public OraConTST orcTST  = new OraConTST();  
// private static OraConTST orcTST  = new OraConTST();  
//public static OraConTST orcTST  = new OraConTST();  
//public static Connection InterfaceCon ;  
  
      POI poi = new POI();
     
        

       try //( InterfaceCon = orcTST.GetConnSession())
           {
        //Коннектимся к базам
         if  (InterfaceCon == null)
           { 
            //Ходим в фаил с коннектами получае параметры коннектимся к ORACLE  
             InterfaceCon = OraConFile.get_connect_from_file("INTERFACE");
            }

          
            //Работа авто шедулера, ставим отчеты в очередь по достижении определенного периода
              CallableStatement callableStatement = InterfaceCon.prepareCall("{call    REPORTS_WORK.AUTO_SHEDULER }");
              callableStatement.executeUpdate();
              callableStatement.close();

               
        
                //Коннект к базе по умолчанию 
                 v_REP_ID = 0; 
                 v_PC_OPER_ID =0 ;  
                 //
                 // System.out.println("Проверка очереди отчетов!");
                //
                Statement pst_param1 = InterfaceCon.createStatement();
                String query = "SELECT to_number(pcp.value) as REP_ID, pc.id as OPER_ID " +
                        " FROM  PC_OPER pc , Pc_Oper_Params pcp " +
                        " WHERE  pc.op_status in ('ENTRY')   " +
                        " AND pc.op_code = 'CREATE_REPORT' " +
                        " and pc.id = pcp.oid_pc_oper " +
                        " and pcp.param = 'REP_ID' " +
                        " and rownum = 1 " +
                        " and pc.id not in (select t.oid_pc_oper as ID from REPORTS_RESULT t where t.oid_pc_oper = pc.id)" ;
                
                       //Получаем заказ отчета
                       ResultSet resultSet1 = pst_param1.executeQuery(query) ;
                           //Получаем заказ отчета
                           while (resultSet1.next())
                           {
                               v_REP_ID    = resultSet1.getInt("REP_ID");
                               v_PC_OPER_ID  = resultSet1.getInt("OPER_ID");
                           }   
                         //Закрываем открытые курсоры, ORA-01000: количество открытых курсоров превысило допустимый максимум
                         pst_param1.close();
                         resultSet1.close();
               
                 
             if ( v_REP_ID  != 0 && v_PC_OPER_ID != 0)
             {
              //Создаем новый поток обработки отчета   
             new Thread(() -> {
                 try {
                     //
                     System.out.println("Обработка заказа "+v_PC_OPER_ID+ " начата");
                     //
                     oper_log.set_log(v_PC_OPER_ID,"Обработка заказа "+v_PC_OPER_ID+ " начата");
                     poi.GetblobExcel(v_REP_ID, v_PC_OPER_ID);
              
                     //
                     System.out.println("Обработка заказа "+v_PC_OPER_ID+ " завершена!!!!");
                     //
                     oper_log.set_log(v_PC_OPER_ID,"Обработка заказа "+v_PC_OPER_ID+ " завершена!!!!");
                   //  orcTST.close();      
                   v_REP_ID = 0;
                     v_PC_OPER_ID =0 ;
                 } catch (Throwable ex) {
                     System.out.println("ошибка !!!!"+ex.toString());
                     
                     Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex.toString());
                     try {
                         oper_log.set_log( v_PC_OPER_ID,"Ошибка! - " + ex.toString());
                     } catch (Throwable ex1) {
                         Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex1);
                     }

                 }
             }).start();  
             } 
         
    } catch (Exception e) {     
     System.out.println("Ошибка в методе Start с ошибкой" +e.toString()); 
     Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, e.toString());
      try( Connection InterfaceCon1 = OraConFile.get_connect_from_file("INTERFACE");)
        {
          InterfaceCon = null;
          try (CallableStatement callableStatement = InterfaceCon1.prepareCall("{call    PC_OPER_WORK.PC_OPER_ERR (?, ?) }")) {
              callableStatement.setInt(1, v_PC_OPER_ID);
              callableStatement.setString(2, e.toString());
              callableStatement.executeUpdate();
          }
        InterfaceCon1.close();
        InterfaceCon.close();
         } catch (Exception  ex) 
         {    
           InterfaceCon = null;      
           System.out.println("Ошибка в методе Start при попытке записать ошибку в базу с ошибкой"+ex.toString()); 
    
           Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex.toString());   
           
         }
    }    
        
    /*    IMINCIDENTS inc = new IMINCIDENTS();
        IMPROBLEMS imp = new IMPROBLEMS();
        IMTASKS imt = new IMTASKS();
        RONTRANS rt = new RONTRANS();
        RONINKAS ron = new RONINKAS();
        AUDITMP am = new AUDITMP();
        AUDITFUNC af = new AUDITFUNC();
        AUDITACTION aa = new AUDITACTION();
        Ronevent rone = new Ronevent();
        LASTSTATUS last = new LASTSTATUS();*/
      /*  new Thread(() -> {
            try {
                inc.take_IMINCIDENTS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();   
        new Thread(() -> {
            try {
                imp.take_IMPROBLEMS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();  
        new Thread(() -> {
            try {
                imt.take_IMTASKS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();       
        new Thread(() -> {
            try {
                rt.take_RONTRANS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();    
        new Thread(() -> {
            try {
                ron.take_RONINKAS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
        new Thread(() -> {
            try {
                am.take_AUDITMP();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
        new Thread(() -> {
            try {
                af.take_AUDITFUNC();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
        new Thread(() -> {
            try {
                aa.take_AUDITACTION();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
        new Thread(() -> {
            try {
                rone.take_Ronevent();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();
        new Thread(() -> {
            try {
                last.take_LASTSTATUS();
            } catch (Exception ex) {
                Logger.getLogger(FiveMinuteSinhro.class.getName()).log(Level.SEVERE, null, ex);
            }
        }).start();*/
    }

    public static class InterfaceCon {

        public InterfaceCon() {
        }
    }
}
