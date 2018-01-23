package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class Ronevent {
      
   private final DB2Connection dbco = new DB2Connection(); 
   private PreparedStatement preparedStatement = null;
   private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
   private ResultSet res = null;  
   
    
    private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from Ronevent");
      res = preparedStatement.executeQuery();     
      while (res.next()) {
      ora_SNUM = res.getInt(1);
      }
      orcs.close();
      return ora_SNUM;
    }
         
    public void take_Ronevent() throws Exception{       
      String bank_select = "Select SNUM, MSGCODE, RONLINK, DTEVENT, DTJOURNAL, TRANSID from MPTECH.RONEVENT where SNUM > " + getMaxSelect();  
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();  
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("INSERT INTO Ronevent (SNUM, MSGCODE, RONLINK, DTEVENT, DTJOURNAL, TRANSID) VALUES (?, ?, ?, ?, ?, ?)");
        while (res.next()) {
            try{
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setString(2, res.getString(2));  
        preparedStatement.setInt(3, res.getInt(3));  
        preparedStatement.setTimestamp(4, res.getTimestamp(4)); 
        preparedStatement.setTimestamp(5, res.getTimestamp(5));
        preparedStatement.setInt(6, res.getInt(6));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
        System.out.println("insert талицы Ronevent прошло успешно");
        orcs.close();
        db2.close();
    }  
}