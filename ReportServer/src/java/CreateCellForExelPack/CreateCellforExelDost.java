package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;

public class CreateCellforExelDost {
    
    private OraConRepo orc = new OraConRepo(); 
    private Statement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style, int row) throws SQLException{
        sizeOfrowMat = row;
        Sheet firs = first; 
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.createStatement();
            ResultSet res = statement.executeQuery(SQL);
            int nextCell = 0;
            while (res.next()) {
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                if (i < 3){
                    firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                    firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }else if (i == 3){
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue((res.getDouble(i))/100);
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue((res.getDouble(i))/1000);
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }
                }
                sizeOfrowMat++;
                nextCell = 0;
            } }
      return firs;
    }   
    
    public int getsizeOfrowMat(){
        return sizeOfrowMat;
    }  
}
