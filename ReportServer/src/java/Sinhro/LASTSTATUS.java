package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;


public class LASTSTATUS{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
    
    
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(RONLINK) from LASTSTATUS");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
      
        private void updateLASTSTATUS() throws Exception{
        String bank_update_select = "Select DATENOTWORK, SERVSTATUS, DTSTATUS, NUMEVENT, FLENDDAY, FLSHUTDOWN, SIGNWORK, DATESIGN, "
                + "DELTA_0, DELTA_3, DELTA_4, DELTA_5, DELTA_6, DELTA_7, DELTA_8, DELTA_9, DELTA_10, DELTA_11, DELTA_12, DELTA_13, DELTA_14, DELTA_15, DELTA_16, DELTA_17, "
                + "DELTA_18, DELTA_19, DELTA_ALL, NUMBERSERV, RONLINK from MPTECH.LASTSTATUS";
        Connection orcs = orc.GetConnSession();
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update LASTSTATUS set DATENOTWORK = ?, SERVSTATUS = ?, DTSTATUS = ?, "
                + "NUMEVENT = ?, FLENDDAY = ?, FLSHUTDOWN = ?, SIGNWORK = ?, DATESIGN = ?, "
                + "DELTA_0 = ?, DELTA_3 = ?, DELTA_4 = ?, DELTA_5 = ?, DELTA_6 = ?, DELTA_7 = ?, DELTA_8 = ?, "
                + "DELTA_9 = ?, DELTA_10 = ?, DELTA_11 = ?, DELTA_12 = ?, DELTA_13 = ?, DELTA_14 = ?, DELTA_15 = ?, DELTA_16 = ?, DELTA_17 = ?, "
                + "DELTA_18 = ?, DELTA_19 = ?, DELTA_ALL = ?, NUMBERSERV = ? where RONLINK = ?");     
        while (res.next()) {
        try{
        preparedStatement.setDate(1, res.getDate(1));
        preparedStatement.setString(2, res.getString(2));
        preparedStatement.setTimestamp(3, res.getTimestamp(3));       
        preparedStatement.setInt(4, res.getInt(4));
        preparedStatement.setInt(5, res.getInt(5)); 
        preparedStatement.setInt(6, res.getInt(6)); 
        preparedStatement.setInt(7, res.getInt(7)); 
        preparedStatement.setDate(8, res.getDate(8));
        for (int i = 9; i < 30; i++){
            preparedStatement.setInt(i, res.getInt(i));
        }
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        db2.close();
        orcs.close();
       }  
           
    public void take_LASTSTATUS() throws Exception{    
      String bank_select = "Select RONLINK,DATENOTWORK, SERVSTATUS, DTSTATUS, NUMEVENT, FLENDDAY, FLSHUTDOWN, SIGNWORK, DATESIGN, "
                + "DELTA_0, DELTA_3, DELTA_4, DELTA_5, DELTA_6, DELTA_7, DELTA_8, DELTA_9, DELTA_10, DELTA_11, DELTA_12, DELTA_13, DELTA_14, DELTA_15, DELTA_16, DELTA_17, "
                + "DELTA_18, DELTA_19, DELTA_ALL, NUMBERSERV from MPTECH.LASTSTATUS "
                + "where RONLINK >"+getMaxSelect();    
      Connection db2 = dbco.connect();
      preparedStatementDB2 = db2.prepareStatement(bank_select);
      res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO LASTSTATUS VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setDate(2, res.getDate(2));
        preparedStatement.setString(3, res.getString(3));
        preparedStatement.setTimestamp(4, res.getTimestamp(4));       
        preparedStatement.setInt(5, res.getInt(5));
        preparedStatement.setInt(6, res.getInt(6)); 
        preparedStatement.setInt(7, res.getInt(7)); 
        preparedStatement.setInt(8, res.getInt(8)); 
        preparedStatement.setDate(9, res.getDate(9));
        for (int i = 10; i < 30; i++){
            preparedStatement.setInt(i, res.getInt(i));
        }
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
        System.out.println("Обновление талицы LASTSTATUS прошло успешно");
        orcs.close(); 
        db2.close();
        updateLASTSTATUS();
    }   
}
