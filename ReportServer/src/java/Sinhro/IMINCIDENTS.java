package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;


public class IMINCIDENTS{
   
    private final DB2Connection dbco = new DB2Connection(); 
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    private OraConRepo orc = new OraConRepo(); 
    private ResultSet res = null;  
    
    
      private int getMaxSelect()throws Exception{
      Connection orcs = orc.GetConnSession();
      int ora_SNUM = 0; 
      preparedStatement = orcs.prepareStatement("Select max(SNUM) from IMINCIDENTS");
      res = preparedStatement.executeQuery();  
      while (res.next()) {
      ora_SNUM = res.getInt(1); 
      }
      orcs.close();
      return ora_SNUM;   
    }
      
        private void updateIMINCIDENTS() throws Exception{
        String bank_update_select = "Select Priority, Dt_fin, Statuslink, Deplink, Contlink, "
                + "Dt_currdep, Prevstatlink, Prevdeplink, Prevcontlink, Dt_prevdep, "
                + "Type_inkass, Inkass_dt, Inkcomment, Fl_order, Ink_DT_FIN, "
                + "Comment, SNUM from MPTECH.IM_INCIDENTS";
        Connection orcs = orc.GetConnSession();
        Connection db2 = dbco.connect();
        preparedStatementDB2 = db2.prepareStatement(bank_update_select);
        res = preparedStatementDB2.executeQuery();
        orcs.setAutoCommit(true);
        preparedStatement = orcs.prepareStatement("update IMINCIDENTS set Priority = ?, Dt_fin = ?, Statuslink = ?, Deplink = ?, "
                + "Contlink = ?, Dt_currdep = ?, Prevstatlink = ?, Prevdeplink = ?, Prevcontlink = ?, Dt_prevdep = ?, Type_inkass = ?, "
                + "Inkass_dt = ?, Inkcomment = ?, Fl_order = ?, Ink_DT_FIN = ?, Comments = ? where SNUM = ? and Dt_fin is null");     
        while (res.next()) {
        try{
	preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setTimestamp(2, res.getTimestamp(2));
        preparedStatement.setInt(3, res.getInt(3));
        preparedStatement.setInt(4, res.getInt(4));
        preparedStatement.setInt(5, res.getInt(5)); 
        preparedStatement.setTimestamp(6, res.getTimestamp(6));
        preparedStatement.setInt(7, res.getInt(7)); 
        preparedStatement.setInt(8, res.getInt(8)); 
        preparedStatement.setInt(9, res.getInt(9)); 
        preparedStatement.setTimestamp(10, res.getTimestamp(10));
        preparedStatement.setString(11, res.getString(11));
        preparedStatement.setTimestamp(12, res.getTimestamp(12));
        preparedStatement.setString(13, res.getString(13));
        preparedStatement.setString(14, res.getString(14));
        preparedStatement.setTimestamp(15, res.getTimestamp(15));
        preparedStatement.setString(16, res.getString(16));
        preparedStatement.setInt(17, res.getInt(17));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        }catch(Exception e){
        System.out.println("Во время update возникла ошибка " + e);
          }         
        }
        db2.close();
        orcs.close();
       }  
           
    public void take_IMINCIDENTS() throws Exception{    
      String bank_select = "Select SNUM, RONLINK,  TYPE,  PRIORITY,  "
              + "RECORD,  REASON,  DT_RECORD,  DT_FIN,  STATUSLINK,  "
              + "DEPLINK ,  CONTLINK,  DT_CURRDEP,  PREVSTATLINK, "
              + " PREVDEPLINK ,  PREVCONTLINK,  DT_PREVDEP,  TYPE_INKASS ,  "
              + "INKASS_DT,  LOADLINK,  ROUTE,  INKASSATOR ,  INKCOMMENT,  "
              + "FL_ORDER,  INK_DT_FIN,  COMMENT from MPTECH.IM_INCIDENTS "
              + "where SNUM >"+getMaxSelect();    
      Connection db2 = dbco.connect();
      preparedStatementDB2 = db2.prepareStatement(bank_select);
      res = preparedStatementDB2.executeQuery(); 
      Connection orcs = orc.GetConnSession();
      orcs.setAutoCommit(true);
      preparedStatement = orcs.prepareStatement("INSERT INTO IMINCIDENTS VALUES "
              + "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
      while (res.next()) {
        try{      
        preparedStatement.setInt(1, res.getInt(1));
        preparedStatement.setInt(2, res.getInt(2));
        preparedStatement.setString(3, res.getString(3));
        preparedStatement.setInt(4, res.getInt(4));
        preparedStatement.setString(5, res.getString(5));
        preparedStatement.setInt(6, res.getInt(6));
        preparedStatement.setTimestamp(7, res.getTimestamp(7));
        preparedStatement.setTimestamp(8, res.getTimestamp(8));
        preparedStatement.setInt(9, res.getInt(9));
        preparedStatement.setInt(10, res.getInt(10));
        preparedStatement.setInt(11, res.getInt(11));
        preparedStatement.setTimestamp(12, res.getTimestamp(12));
        preparedStatement.setInt(13, res.getInt(13));
        preparedStatement.setInt(14, res.getInt(14));
        preparedStatement.setInt(15, res.getInt(15));
        preparedStatement.setTimestamp(16, res.getTimestamp(16));
        preparedStatement.setString(17, res.getString(17));
        preparedStatement.setTimestamp(18, res.getTimestamp(18));
        preparedStatement.setInt(19, res.getInt(19));
        preparedStatement.setInt(20, res.getInt(20));
        preparedStatement.setInt(21, res.getInt(21));
        preparedStatement.setString(22, res.getString(22));
        preparedStatement.setString(23, res.getString(23));
        preparedStatement.setTimestamp(24, res.getTimestamp(24));
        preparedStatement.setString(25, res.getString(25));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
          }catch(Exception e){
        System.out.println("Во время insert возникла ошибка " + e);
          }         
        }
      System.out.println("Обновление талицы IMINCIDENTS прошло успешно");
      orcs.close(); 
      db2.close();
      updateIMINCIDENTS();
    }   
}
