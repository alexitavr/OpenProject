package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class AUDITMP{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
 
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from AUDITMP");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
       
      private void updateAUDITMP() throws Exception{
        String bank_update_select = "Select DTOFFMP, SNUM from MPTECH.AUDITMP";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update AUDITMP set DTOFFMP = ? where SNUM = ? and DTOFFMP is null");     
        while (res.next()) {
        try{
        preparedStatement.setTimestamp(1, res.getTimestamp(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.execute();        
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        System.out.println("update талицы AUDITMP прошло успешно");
        orcs.close();
        db2.close();
    }  
      
      
          
    public void take_AUDITMP() throws Exception{   
      String bank_select = "Select SNUM, WSID, WSNAME, USERID, "
              + "USERNAME, USERTYPE, FLON, NUMPW, DTONMP, DTOFFMP, "
              + "BANKLINK from MPTECH.AUDITMP where SNUM >" +getMaxSelect();    
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO AUDITMP VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1)); 
        preparedStatement.setString(2, res.getString(2));   
        preparedStatement.setString(3, res.getString(3));   
        preparedStatement.setString(4, res.getString(4));   
        preparedStatement.setString(5, res.getString(5));  
        preparedStatement.setInt(6, res.getInt(6)); 
        preparedStatement.setString(7, res.getString(7));
        preparedStatement.setInt(8, res.getInt(8)); 
        preparedStatement.setTimestamp(9, res.getTimestamp(9));
        preparedStatement.setTimestamp(10, res.getTimestamp(10));
        preparedStatement.setInt(11, res.getInt(11));
        preparedStatement.execute();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы AUDITMP прошло успешно");
      orcs.close();
     updateAUDITMP();
     db2.close();
    }   
}
