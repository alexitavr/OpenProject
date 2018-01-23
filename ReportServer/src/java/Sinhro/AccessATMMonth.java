package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.OraConRepo;
import ConnectToDB.DB2Connection;


public class AccessATMMonth {
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;   
    
    private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_MONTH = 0; 
      preparedStatement = orcs.prepareStatement("Select max(MONTH) from AccessATMMonth");
      res = preparedStatement.executeQuery();    
      while (res.next()) {
      ora_MONTH = res.getInt(1);
      }
      orcs.close();
      return ora_MONTH;
    }

    
    public void take_AccessATMMonth() throws Exception{       
      String bank_select = "Select RONLINK, YEAR, MONTH, PERCENT_0, PERCENT_3, PERCENT_4,"
                + "PERCENT_5, PERCENT_6, PERCENT_7, PERCENT_8, PERCENT_9, PERCENT_10, PERCENT_11,"
                + "PERCENT_12, PERCENT_13, PERCENT_14, PERCENT_15, PERCENT_16, PERCENT_17, PERCENT_18,"
                + "PERCENT_19, PERCENT_NO, MINNUMSERV, MAXNUMSERV, DTLAST "
                + "from MPTECH.Access_ATM_Month where MONTH > " + getMaxSelect();  
      Connection db2 = dbco.connect();
      preparedStatementDB2 = db2.prepareStatement(bank_select);
      res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO AccessATMMonth VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{
        for (int i = 1; i < 25;i++){
            preparedStatement.setInt(i, res.getInt(i));
        }
        preparedStatement.setTimestamp(25, res.getTimestamp(25));   
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы AccessATMMonth прошло успешно");
      orcs.close();
      db2.close();      
    }
}
