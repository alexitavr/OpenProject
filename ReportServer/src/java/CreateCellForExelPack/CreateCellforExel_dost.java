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

public class CreateCellforExel_dost {
    
    private OraConRepo orc = new OraConRepo(); 
    private Statement statement = null;
    private Cell cell;
    public Sheet createTreeRow(Sheet first, String SQL, HSSFCellStyle style, int row) throws SQLException{
        Sheet firs = first; 
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.createStatement();
            ResultSet res = statement.executeQuery(SQL);
            Row rowhead = firs.createRow(row);    
            int nextCell = 0;
            
            while (res.next()) {
                cell =  rowhead.createCell(nextCell++);
                cell.setCellValue("");
                cell.setCellStyle(style);
                cell =  rowhead.createCell(nextCell++);
                cell.setCellValue("Итого: ");
                cell.setCellStyle(style);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    if (i == 1){
                        firs.getRow(row).createCell(nextCell).setCellValue((res.getDouble(i))/100);
                        firs.getRow(row).getCell(nextCell).setCellStyle(style);
                    }else{
                        firs.getRow(row).createCell(nextCell).setCellValue((res.getDouble(i))/1000);
                        firs.getRow(row).getCell(nextCell).setCellStyle(style);
                    }
                } 
            }
        }
        return firs;               
     }   
}
