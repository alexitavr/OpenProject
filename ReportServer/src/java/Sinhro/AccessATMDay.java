package Sinhro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class AccessATMDay{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null; 
     
      private String getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      String ora_MONTH = null; 
      preparedStatement = orcs.prepareStatement("Select max(DATEACCESS) from AccessATMDay");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_MONTH = res.getString(1);
      if (ora_MONTH == null){
          return ora_MONTH = "01.01.2016";
        }   
      }
      orcs.close();
      return ora_MONTH;   
    }
          
    public void take_AccessATMDay() throws Exception{   
      String bank_select = "Select RONLINK,  DATEACCESS,  DELTA_0,  DELTA_3, DELTA_4,  DELTA_5,  "
              + "DELTA_6,  DELTA_7,  DELTA_8,  DELTA_9,  DELTA_10, DELTA_11,  DELTA_12,  "
              + "DELTA_13,  DELTA_14, DELTA_15,  DELTA_16,  DELTA_17, DELTA_18,  DELTA_19,  "
              + "DELTA_ALL,  PERCENT_0,  PERCENT_3,  PERCENT_4,  PERCENT_5, PERCENT_6,  PERCENT_7,  "
              + "PERCENT_8,  PERCENT_9,  PERCENT_10,  PERCENT_11,  PERCENT_12, PERCENT_13,  PERCENT_14,  "
              + "PERCENT_15,  PERCENT_16,  PERCENT_17,  PERCENT_18,  PERCENT_19, PERCENT_NO,  NUMBERSERV, "
              + "DTLAST from MPTECH.Access_ATM_Day where DATEACCESS > " +"'"+getMaxSelect()+"'";    
       Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();

      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO AccessATMDay VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
              + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setDate(2, res.getDate(2));
        for (int i = 3; i < 42;i++){
            preparedStatement.setInt(i, res.getInt(i));
        }
        preparedStatement.setTimestamp(42, res.getTimestamp(42));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы AccessATMDay прошло успешно");
      orcs.close();
      db2.close();
    }   
}
