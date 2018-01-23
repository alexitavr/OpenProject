package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class AUDITFUNC{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
 
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from AUDITFUNC");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
       
      private void updateAUDITFUNC() throws Exception{
        String bank_update_select = "Select DTOFFFUNC, SNUM from MPTECH.AUDITFUNC";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update AUDITFUNC set DTOFFFUNC = ? where SNUM = ? and DTOFFFUNC is null");     
        while (res.next()) {
        try{
        preparedStatement.setTimestamp(1, res.getTimestamp(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.execute();        
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        System.out.println("update талицы AUDITFUNC прошло успешно");
        orcs.close();
        db2.close();
    }  
              
    public void take_AUDITFUNC() throws Exception{   
      String bank_select = "Select SNUM, MPLINK, IDFUNC, DTONFUNC, DTOFFFUNC "
              + "from MPTECH.AUDITFUNC where SNUM >" +getMaxSelect();    
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO AUDITFUNC VALUES (?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1)); 
        preparedStatement.setInt(2, res.getInt(2)); 
        preparedStatement.setInt(3, res.getInt(3)); 
        preparedStatement.setTimestamp(4, res.getTimestamp(4));
        preparedStatement.setTimestamp(5, res.getTimestamp(5));
        preparedStatement.execute();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы AUDITFUNC прошло успешно");
      orcs.close();
      updateAUDITFUNC();
      db2.close();
    }   
}
