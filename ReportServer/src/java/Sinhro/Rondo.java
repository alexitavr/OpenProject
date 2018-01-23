package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class Rondo {
      
   private final DB2Connection dbco = new DB2Connection(); 
   private PreparedStatement preparedStatement = null;
   private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
   private ResultSet res = null;  
   
    
    private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from Rondo");
      res = preparedStatement.executeQuery();     
      while (res.next()) {
      ora_SNUM = res.getInt(1);
      }
      orcs.close();
      return ora_SNUM;
    }
   
    private void updateRondo() throws Exception{
        String bank_update_select = "Select SNUM, SERIAL_NUM, SIGNWORK from MPTECH.RONDO";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update RONDO set SIGNWORK = ?, SERIAL_NUM = ? where SNUM = ?");     
        while (res.next()) {
        try{
	preparedStatement.setInt(3, res.getInt(1));
        preparedStatement.setString(2, res.getString(2)); 
        preparedStatement.setInt(1, res.getInt(3));  
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        System.out.println("update талицы RONDO прошло успешно");
        orcs.close();
        db2.close();
    }       
    public void take_Rondo() throws Exception{       
      String bank_select = "Select SNUM, ATMLUNO, ATMPOST, RONCOMM, SIGNWORK, "
              + "ATMTYPE, SERIAL_NUM from MPTECH.RONDO where SNUM > " + getMaxSelect();  
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();  
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("INSERT INTO RONDO (SNUM, ATMLUNO, ATMPOST, RONCOMM, SIGNWORK, "
              + "ATMTYPE, SERIAL_NUM) VALUES (?, ?, ?, ?, ?, ?, ?)");
        while (res.next()) {
            try{
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setString(2, res.getString(2));  
        preparedStatement.setString(3, res.getString(3));  
        preparedStatement.setString(4, res.getString(4)); 
        preparedStatement.setInt(5, res.getInt(5));
        preparedStatement.setInt(6, res.getInt(6));
        preparedStatement.setString(7, res.getString(7));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
            }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("insert талицы RONDO прошло успешно");
      orcs.close();
      db2.close();
      updateRondo();
    }  
}