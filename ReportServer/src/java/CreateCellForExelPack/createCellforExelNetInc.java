package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;

public class createCellforExelNetInc {
    private OraConRepo orc = new OraConRepo(); 
    private Statement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style) throws SQLException{
        sizeOfrowMat = 1;
        Sheet firs = first;
        Connection orcs = orc.GetConnSession();
        statement = orcs.createStatement();
        ResultSet res = statement.executeQuery(SQL);           
        int nextCell = 0; 
      while (res.next()) {
      Row rowhead = firs.createRow((short)sizeOfrowMat++);  
      for(int i = 1; i < 22; i++){
      String date = res.getString(i);
      Cell с_date =  rowhead.createCell(nextCell++);
                с_date.setCellValue(date);
                с_date.setCellStyle(style);             
      }
      nextCell = 0;
            }  
      orcs.close();
      return firs;
    }   

}
