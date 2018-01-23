package Sinhro;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;

public class RONINKAS {
    
     private final DB2Connection dbco               = new DB2Connection(); 
     private PreparedStatement preparedStatement    = null;
     private OraConRepo orc                         = new OraConRepo(); 
     private ResultSet res                          = null;  
     private PreparedStatement preparedStatementDB2 = null;
    
    private String getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      String ora_SNUM = null; 
      preparedStatement = orcs.prepareStatement("Select max(DTFINISHBEG) from RONINKAS");
      res = preparedStatement.executeQuery();     
      while (res.next()) {
      ora_SNUM = res.getString(1);
      } 
      if (ora_SNUM == null){  
          return ora_SNUM = "01.01.2016"; 
      } 
      orcs.close();
      return ora_SNUM;
    }
        
    private String selectRoninkas() throws Exception{
        String test = "0";
        Connection orcs = orc.GetConnSession(); 
        preparedStatement = orcs.prepareStatement("select RONLINK from RONINKAS where DTSTARTEND is null");
        res = preparedStatement.executeQuery();
        while (res.next()) {
            test+=","+res.getString(1);
        }
        System.out.println("select from RONINKAS прошло успешно");
        orcs.close(); 
        return test;
    }

    
    private void updateRONINKAS() throws Exception{
        String bank_update_select = "Select NTADISP1, NTAREST1,  NTADISP2, NTAREST2, NTADISP3, NTAREST3,"
              + " NTADISP4, NTAREST4,NTADIVERT1, NTAFORG1, NTADIVERT2, NTAFORG2, NTADIVERT3, NTAFORG3, NTADIVERT4, "
              + "NTAFORG4, TYPEBEG, NTESUMRUBOK, NTENUMRUBOK, TYPEEND, DTLAST, DTSTARTEND, RONLINK, DTFINISHBEG from MPTECH.RONINKAS";
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update RONINKAS set "
                + "NTADISP1 = ?, NTAREST1 = ?,  NTADISP2 = ?, NTAREST2 = ?, NTADISP3 = ?, NTAREST3 = ?,"
                + " NTADISP4 = ?, NTAREST4 = ?,NTADIVERT1 = ?, NTAFORG1 = ?, NTADIVERT2 = ?, NTAFORG2 = ?, "
                + "NTADIVERT3 = ?, NTAFORG3 = ?, NTADIVERT4 = ?, NTAFORG4 = ?, TYPEBEG = ?, NTESUMRUBOK = ?, NTENUMRUBOK = ?, TYPEEND = ? , DTLAST = ?, "
                + "DTSTARTEND = ? where RONLINK = ? and DTFINISHBEG = ? and DTSTARTEND is null");     
        while (res.next()) {
        try{
            for(int i = 1; i < 21; i++){
            preparedStatement.setInt(i, res.getInt(i)); 
        }
	preparedStatement.setDate(21, res.getDate(21));
        preparedStatement.setTimestamp(22, res.getTimestamp(22));
        preparedStatement.setInt(23, res.getInt(23));
        preparedStatement.setTimestamp(24, res.getTimestamp(24));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        System.out.println("update талицы RONINKAS прошло успешно"); 
        orcs.close(); 
        db2.close();
    }  
    
    public void take_RONINKAS() throws Exception{ 
      updateRONINKAS();  
      String bank_select = "Select RONLINK, DTFINISHBEG, NTANOM1, NTALOAD1 "
              + ", NTANOM2, NTALOAD2, NTANOM3, NTALOAD3, NTANOM4, NTALOAD4, "
              + " NTAFLINKAS, NTEFLINKAS, NTADISP1, NTAREST1,  NTADISP2, NTAREST2, NTADISP3, NTAREST3, NTADISP4, NTAREST4, "
              + "NTADIVERT1, NTAFORG1, NTADIVERT2, NTAFORG2, NTADIVERT3, NTAFORG3, NTADIVERT4, NTAFORG4, NTESUMRUBOK, NTENUMRUBOK, TYPEEND, TYPEBEG, DTLAST, TRANSEND, DTSTARTEND"
              + " from MPTECH.RONINKAS where RONLINK not in ("+selectRoninkas()+") and DTSTARTEND is null order by DTFINISHBEG";  
        Connection db2 = dbco.connect(); // RONLINK not in ("+selectRoninkas()+") and DTSTARTEND is null
        //DTFINISHBEG > '"+getMaxSelect()+"'
        preparedStatementDB2 = db2.prepareStatement(bank_select);
        res = preparedStatementDB2.executeQuery();
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true); 
        preparedStatement = orcs.prepareStatement("INSERT INTO RONINKAS (RONLINK, DTFINISHBEG, NTANOM1, NTALOAD1 "
              + ", NTANOM2, NTALOAD2, NTANOM3, NTALOAD3, NTANOM4, NTALOAD4, NTAFLINKAS, NTEFLINKAS, NTADISP1, NTAREST1,  NTADISP2, NTAREST2, NTADISP3, NTAREST3, NTADISP4, NTAREST4, "
              + "NTADIVERT1, NTAFORG1, NTADIVERT2, NTAFORG2, NTADIVERT3, NTAFORG3, NTADIVERT4, NTAFORG4, NTESUMRUBOK, NTENUMRUBOK, TYPEEND, TYPEBEG, DTLAST, TRANSEND, DTSTARTEND) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
              + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        while (res.next()) {
            try{     
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setTimestamp(2, res.getTimestamp(2));  
        for(int i = 3; i < 33; i++){
            preparedStatement.setInt(i, res.getInt(i));
        }
        preparedStatement.setTimestamp(33, res.getTimestamp(33));  
        preparedStatement.setInt(34, res.getInt(34));
        preparedStatement.setTimestamp(35, res.getTimestamp(35)); 
        preparedStatement.executeUpdate();
            }catch(Exception e){ 
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        } 
        System.out.println("insert талицы RONINKAS прошло успешно");
        orcs.close(); 
        db2.close();
        
    }
}
