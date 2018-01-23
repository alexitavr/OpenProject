package Sinhro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class IMPROBLEMS {
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
     
    
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from IMPROBLEMS");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
  
       private void updateIMPROBLEMS() throws Exception{
        String bank_update_select = "Select Taskslink, SNUM from MPTECH.IM_PROBLEMS where Taskslink is not null";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update IMPROBLEMS set Taskslink = ? where SNUM = ? and Taskslink is null");     
        while (res.next()) {
        try{
	preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2)); 
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        orcs.close();
        db2.close();
       }
             
    public void take_IMPROBLEMS() throws Exception{   
      String bank_select = "Select SNUM, INCSLINK, TASKSLINK,  "
              + "MSGCODE, DT_MSG, INITIAL_CODE, SERVICE_CODE, "
              + "FILTER_CODE, DEVICE, DEFECT_SHORT, DETAIL_XFS "
              + "from MPTECH.IM_PROBLEMS where SNUM >"+getMaxSelect();    
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO IMPROBLEMS VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{  
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.setInt(3, res.getInt(3));
        preparedStatement.setString(4, res.getString(4));
        preparedStatement.setTimestamp(5, res.getTimestamp(5));
        preparedStatement.setInt(6, res.getInt(6));
        preparedStatement.setInt(7, res.getInt(7));
        preparedStatement.setInt(8, res.getInt(8));
        preparedStatement.setString(9, res.getString(9));
        preparedStatement.setString(10, res.getString(10));
        preparedStatement.setString(11, res.getString(11));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы IMPROBLEMS прошло успешно");
      orcs.close();
      db2.close();  
      updateIMPROBLEMS();
    }
}
