package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class SRVFIRM {
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
    
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from SRVFIRM");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
          
    public void take_SRVFIRM() throws Exception{   
      String bank_select = "Select SNUM , NAME_SHORT,  NAME_FULL,  POST_ADDRESS,  COMM_PHONE,  ORDER_CODE,  FIO,"
              + "  WORK_PHONE, MOBIL_PHONE, E_MAIL, COMMENT, DTLAST, OPERLAST, CONTRACT,"
              + " FLM_TIME, SLM_TIME, GROUPLINK,  SUBLINK from MPTECH.SRV_FIRM where SNUM ="+getMaxSelect();    
      Connection db2 = dbco.connect();
      preparedStatementDB2 = db2.prepareStatement(bank_select);
      res = preparedStatementDB2.executeQuery();
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO SRVFIRM VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setString(2, res.getString(2));
        preparedStatement.setString(3, res.getString(3));
        preparedStatement.setString(4, res.getString(4));
        preparedStatement.setString(5, res.getString(5));
        preparedStatement.setInt(6, res.getInt(6));
        preparedStatement.setString(7, res.getString(7));
        preparedStatement.setString(8, res.getString(8));
        preparedStatement.setString(9, res.getString(9));
        preparedStatement.setString(10, res.getString(10));
        preparedStatement.setString(11, res.getString(11));
        preparedStatement.setTimestamp(12, res.getTimestamp(12));
        preparedStatement.setString(13, res.getString(13));
        preparedStatement.setString(14, res.getString(14));
        preparedStatement.setInt(15, res.getInt(15));
        preparedStatement.setInt(16, res.getInt(16));
        preparedStatement.setInt(17, res.getInt(17));
        preparedStatement.setInt(18, res.getInt(18));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы SRVFIRM прошло успешно");
      orcs.close();
      db2.close();    
    }
}
