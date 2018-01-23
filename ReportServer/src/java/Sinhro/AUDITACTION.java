package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class AUDITACTION{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
 
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from AUDITACTION");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
       
      private void updateAUDITACTION() throws Exception{
        String bank_update_select = "Select ACTIONRESULT, DTACTIONEND, SNUM from MPTECH.AUDITACTION";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update AUDITACTION set ACTIONRESULT = ?, DTACTIONEND = ? "
                + "where SNUM = ? and DTACTIONEND is null");     
        while (res.next()) {
        try{
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setTimestamp(2, res.getTimestamp(2));
        preparedStatement.setInt(3, res.getInt(3));
        preparedStatement.execute();        
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        System.out.println("update талицы AUDITACTION прошло успешно");
        orcs.close();
        db2.close();
    }  
                      
    public void take_AUDITACTION() throws Exception{   
      String bank_select = "Select SNUM, FUNCLINK, TYPEACTION, ACTIONRESULT, "
              + "DTACTIONBEG, DTACTIONEND, TEXTAUDIT, AREAL, BANKLINK, OBJID"
              + " from MPTECH.AUDITACTION where SNUM >" +getMaxSelect();    
      Connection db2 = dbco.connect();
      preparedStatementDB2 = db2.prepareStatement(bank_select);
      res = preparedStatementDB2.executeQuery();
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO AUDITACTION VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1)); 
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.setInt(3, res.getInt(3)); 
        preparedStatement.setInt(4, res.getInt(4));
        preparedStatement.setTimestamp(5, res.getTimestamp(5));
        preparedStatement.setTimestamp(6, res.getTimestamp(6));
        preparedStatement.setString(7, res.getString(7));
        preparedStatement.setInt(8, res.getInt(8)); 
        preparedStatement.setInt(9, res.getInt(9));
        preparedStatement.setInt(10, res.getInt(10));
        preparedStatement.execute();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы AUDITACTION прошло успешно");
      orcs.close();
      updateAUDITACTION();
      db2.close();
    }   
}
