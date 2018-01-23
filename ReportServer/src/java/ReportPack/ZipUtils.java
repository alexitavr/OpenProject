package ReportPack;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import TimerPackSinhro.FiveMinuteSinhro;
import java.io.EOFException;
import java.io.InputStream;
import java.sql.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import oracle.sql.BLOB;



/**
 *
 * @author Marchenkods
 */
public class ZipUtils {

  public static BLOB RepToZIP( Integer oper_id)
    throws Exception {

   // Connection con = DriverManager.getConnection("jdbc:default:connection:");

    
    BLOB result = BLOB.createTemporary(FiveMinuteSinhro.InterfaceCon, true, BLOB.DURATION_SESSION);//BLOB.createTemporary(FiveMinuteSinhro.InterfaceCon, true, BLOB.DURATION_SESSION);
    ZipOutputStream out = new ZipOutputStream(result.getBinaryOutputStream());
  //  ZipOutputStream out;
    //  out = new ZipOutputStream(result.getBinaryOutputStream()); //result.getBinaryOutputStream()

    Statement st = null;
    ResultSet rs = null;
    String zip_name = null;
    try {
      st = FiveMinuteSinhro.InterfaceCon.createStatement();
      rs = st.executeQuery("select rr.rep_blob as bdata, "
                         + " ptools.Translit_Uppper(rr.file_name) as file_name, "
                         + " REPORTS_WORK.GET_FILE_NAME("+oper_id+",'ZIP') as zip_name "
                         + " from  reports_result rr where rr.oid_pc_oper = "+ oper_id);
      Blob blob;
      String fileName;
   
      while (rs.next()) {
        blob = rs.getBlob("bdata");
        fileName = rs.getString("file_name");
        zip_name = rs.getString("zip_name");
        try (InputStream in = blob.getBinaryStream()) {
          out.putNextEntry(new ZipEntry(fileName));
          byte[] b = new byte[8192];
          int iCount;
          do {
            iCount = in.read(b);
            if (iCount != -1) {
              out.write(b, 0, iCount);
            }
          } while (iCount != -1);
        }
        //} catch (EOFException e) {
       // }
        
 
        
      } 
      // oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " выгружено-"+nextrow);
       System.out.println(oper_id);       
      System.out.println(result);      
     
    } finally {
      if (rs != null) {rs.close();}
      if (st != null) {st.close();}

    }
    

        
   
    out.close();       
    try (CallableStatement callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call delete from REPORTS_RESULT t where t.oid_pc_oper = ?}")) {
          callableStatement.setInt(1, oper_id);
        //  callableStatement.setBlob(2, result);
          // callableStatement.setString(3, "1.zip");
          callableStatement.executeQuery();
          FiveMinuteSinhro.InterfaceCon.commit();
      } 
    
    
     try (CallableStatement callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call  REPORTS_WORK.SET_REPORT_RESULT(?,?,?)}")) {
          callableStatement.setInt(1, oper_id);
          callableStatement.setBlob(2, result);
          callableStatement.setString(3, zip_name);
          callableStatement.executeQuery();
          FiveMinuteSinhro.InterfaceCon.commit();
      } 
     

     
    return result;
  }

} 

