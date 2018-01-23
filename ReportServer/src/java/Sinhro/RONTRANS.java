package Sinhro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class RONTRANS {
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatementDB2 = null;
    private PreparedStatement preparedStatement = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
     
    
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUMLINK_301) from RONTRANS");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
             
    public void take_RONTRANS() throws Exception{   
      String bank_select = "Select RONLINK_0, RONTRANSID_1, RONLUNO_2, DTTRANSEND_5, CARDPAN_11, "
              + "SERVID_15, SERVEND_16, RECIEPTNUM_17, PAYSUM_18, PAYCURR_19, NTESUM_20, NTECURR_21, "
              + "NTEREJLAST_74, NTEUNIDENT_75, DISPNUM1_81, DIVERTNUM1_82, DISPNUM2_86, DIVERTNUM2_87, "
              + "DISPNUM3_91, DIVERTNUM3_92, DISPNUM4_96, DIVERTNUM4_97, NTESUMRUB_145, NTENUMRUB_146, "
              + "CARDRETAIN_151, NTESTATUS_155, NTASTATUS_156, MKSSTATUS_157, KDRSTATUS_158, JRNSTATUS_159, "
              + "MPNUMREP_174, RETREFNUM_201, AUTHCODE_202, FINCODE_251, CLNCODE_261, NUMROLL_284, "
              + "SNUMLINK_301 from MPTECH.RONTRANS where SNUMLINK_301 >"+getMaxSelect();    
      Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO RONTRANS VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
              + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{  
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2));   
        preparedStatement.setString(3, res.getString(3));   
        preparedStatement.setTimestamp(4, res.getTimestamp(4));  
        preparedStatement.setString(5, res.getString(5));
        for(int i = 6; i < 32; i++){
          preparedStatement.setInt(i, res.getInt(i));  
        }
        preparedStatement.setString(32, res.getString(32));    
        for(int i = 33; i < 38; i++){
          preparedStatement.setInt(i, res.getInt(i));  
        }
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы RONTRANS прошло успешно");
      orcs.close();
      db2.close();  
     
    }
}
