package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;
import Sinhro.ParserData.ParseData;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class IMTASKS{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private ParseData pd = new ParseData();
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementup = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
    private ResultSet ress = null;
    private Statement statement = null;
 
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from IMTASKS");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
      }
      
      private int getDT_REPAIR_FLAGSelect(int num)throws Exception{
      int ora_SNUM = 0; 
      Connection orcs = orc.GetConnSession();
      Statement statements = orcs.createStatement();//("Select DT_REPAIR_FLAG from IMTASKS where SNUM = "+num);
      ResultSet rest = statements.executeQuery("Select DT_REPAIR_FLAG from IMTASKS where SNUM = "+num);  
      while (rest.next()) {
      ora_SNUM = rest.getInt(1); 
      }
      rest.close();
      statements.close();
      orcs.close();
      return ora_SNUM;   
      }
      
      private void timeUpdate(ArrayList<Integer> snum, ArrayList<Integer> status) throws SQLException, Exception{
        LocalDate date = LocalDate.now();
        if (pd.read("C:\\mailList\\Holiday.txt") == true && date.getDayOfWeek().getValue() <= 5) { 
        LocalTime time = LocalTime.now();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        statement = orcs.createStatement();
        for (int i = 0; i < snum.size(); i++) { 
        if (status.get(i) == 2){
            if (time.getHour() >= 9 && time.getHour() <= 17 && getDT_REPAIR_FLAGSelect(snum.get(i)) == 1){ 
                ress = statement.executeQuery("Select DT_REPAIR from IMTASKS where SNUM = "+snum.get(i));
                preparedStatementup = orcs.prepareStatement("update IMTASKS set DT_REPAIR = ?, DT_REPAIR_FLAG = ? where SNUM = "+snum.get(i));
                System.out.println(snum.get(i));
                while (ress.next()) {
                preparedStatementup.setInt(1, ress.getInt(1) + (((time.getHour() - 9)*60) + time.getMinute()));
                preparedStatementup.setInt(2,2);
                preparedStatementup.executeUpdate();
                preparedStatementup.clearParameters();
                }
            }
        }
        else if(time.getHour() > 17 && getDT_REPAIR_FLAGSelect(snum.get(i)) == 1){
                ress = statement.executeQuery("Select DT_REPAIR, extract(MINUTE from (sysdate  - DT_TASK)) + "
                + "extract(HOUR from (sysdate  - DT_TASK))*60 + extract(DAY from (sysdate  - DT_TASK))*60*24 from IMTASKS where SNUM = "+snum.get(i));
                preparedStatementup = orcs.prepareStatement("update IMTASKS set DT_REPAIR = ?, DT_REPAIR_FLAG = ? where SNUM = "+snum.get(i));
                while (ress.next()) {
                if (ress.getInt(2) < 540) {
                    preparedStatementup.setInt(1, ress.getInt(2));
                }
                else {
                preparedStatementup.setInt(1, ress.getInt(1) + (8*60));
                }
                preparedStatementup.setInt(2,2);
                preparedStatementup.executeUpdate();
                preparedStatementup.clearParameters();
                }
        }
        else if(time.getHour() >= 9 && time.getHour() <= 17 && getDT_REPAIR_FLAGSelect(snum.get(i)) == 2){
                preparedStatementup = orcs.prepareStatement("update IMTASKS set DT_REPAIR_FLAG = ? where SNUM = "+snum.get(i)+" and Srv_status = 1");
                preparedStatementup.setInt(1,1);
                preparedStatementup.executeUpdate();
                preparedStatementup.clearParameters();
            }
        }
        orcs.close();
        System.out.println("Time update ok");
        }
        else {System.out.println("This is Holiday");}
      }
       
      private void updateIMTASKS() throws Exception{
        ArrayList<Integer> snum = new ArrayList<Integer>();
        ArrayList<Integer> status = new ArrayList<Integer>();
        String bank_update_select = "Select TYPE, DEPART, TASKCOMMENT, DEPARTLINK,  EXPERTLINK,  "
              + "DT_NEED, SRV_STATUS, RESULT,  DT_RESULT,  FIO_RESULT,  PAN_RESULT, "
              + "  SNUM from MPTECH.IM_TASKS";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update IMTASKS set Type = ?, "
                + "Depart = ?, Taskcomment = ?, Departlink = ?,"
                + " Expertlink = ?, Dt_need = ?, Srv_status = ?, Result = ?, Dt_result = ?, Fio_result = ?, Pan_result = ? "
                + "where SNUM = ? and Srv_status = 1");     
        while (res.next()) {
        try{
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.setString(3, res.getString(3));
        preparedStatement.setInt(4, res.getInt(4));
        preparedStatement.setInt(5, res.getInt(5));
        preparedStatement.setTimestamp(6, res.getTimestamp(6));
        preparedStatement.setInt(7, res.getInt(7));
        status.add(res.getInt(7));
        preparedStatement.setInt(8, res.getInt(8));
        preparedStatement.setTimestamp(9, res.getTimestamp(9));
        preparedStatement.setString(10, res.getString(10));  
        preparedStatement.setString(11, res.getString(11));  
        snum.add(res.getInt(12));
        preparedStatement.setInt(12, res.getInt(12)); 
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters(); 
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          } 
        }           
        System.out.println("update талицы IMTASKS прошло успешно");
        orcs.close();
        db2.close();
        timeUpdate(snum, status);
    }  
      
    public void take_IMTASKS() throws Exception{   
      String bank_select = "Select SNUM,  INCLINK,  TYPE,  "
              + "DT_TASK,  DEPART,  ADMIN,  ORDERCOMM,  "
              + "TASKCOMMENT,  FIRMLINK,  DEPARTLINK,  EXPERTLINK,  "
              + "DT_NEED,  FILE_ORDER,  KEYLINK,  SRV_STATUS,  "
              + "RESULT,  DT_RESULT,  FIO_RESULT,  PAN_RESULT, "
              + " DT_REPAIR from MPTECH.IM_TASKS where SNUM >" +getMaxSelect();    
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO IMTASKS (SNUM,  INCLINK,  TYPE,  "
              + "DT_TASK,  DEPART,  ADMIN,  ORDERCOMM,  "
              + "TASKCOMMENT,  FIRMLINK,  DEPARTLINK,  EXPERTLINK,  "
              + "DT_NEED,  FILE_ORDER,  KEYLINK,  SRV_STATUS,  "
              + "RESULT,  DT_RESULT,  FIO_RESULT,  PAN_RESULT, "
              + " DT_REPAIR) VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.setInt(3, res.getInt(3));
        preparedStatement.setTimestamp(4, res.getTimestamp(4));
        preparedStatement.setInt(5, res.getInt(5));
        preparedStatement.setInt(6, res.getInt(6));    
        preparedStatement.setString(7, res.getString(7));   
        preparedStatement.setString(8, res.getString(8));     
        preparedStatement.setInt(9, res.getInt(9));
        preparedStatement.setInt(10, res.getInt(10));
        preparedStatement.setInt(11, res.getInt(11));       
        preparedStatement.setTimestamp(12, res.getTimestamp(12));
        preparedStatement.setString(13, res.getString(13));      
        preparedStatement.setInt(14, res.getInt(14));
        preparedStatement.setInt(15, res.getInt(15));
        preparedStatement.setInt(16, res.getInt(16));
        preparedStatement.setTimestamp(17, res.getTimestamp(17));
        preparedStatement.setString(18, res.getString(18));
        preparedStatement.setString(19, res.getString(19));
        preparedStatement.setInt(20, res.getInt(20));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы IMTASKS прошло успешно");
      orcs.close();
      updateIMTASKS();
      db2.close();
    }   
}
