package ReportPack;
import TimerPackSinhro.FiveMinuteSinhro;
import java.sql.CallableStatement;
import java.sql.Connection;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Marchenkods
 */
public class oper_log {
  public static void set_log(Integer v_PC_OPER_ID, String v_text ) throws Throwable/*throws Exception*/ {
      
      //  OraConTST orcTST = new OraConTST();  
        // try( Connection InterfaceCon = orcTST.GetConnSession())
         // {
    CallableStatement callableStatement;
    callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call    PC_OPER_WORK.SET_OPER_LOG (?, ? ,?) }");
    callableStatement.setInt(1, v_PC_OPER_ID);
    callableStatement.setString(2, v_text);
    callableStatement.setString(3, "Java shed 1");
    callableStatement.executeUpdate();
    callableStatement.close();
  
   //  System.out.println("ERR !!!!!" +e.toString() );   
     //   JDBCTutorialUtilities.printSQLException(e);
     } 
   public static void set_log_to_file(String v_text ) throws Throwable/*throws Exception*/ {
       
   
       
   
   } 
  
  }

