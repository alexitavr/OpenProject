package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;

public class CreateCellforExelIncs {
    private OraConRepo orc = new OraConRepo(); 
    private PreparedStatement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style, int n) throws SQLException{
        sizeOfrowMat = 1;
        Sheet firs = first; 
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.prepareStatement(SQL);
            ResultSet res = statement.executeQuery();
            int nextCell = 0;
            while (res.next()) {
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    if (i == n){
                        if (res.getInt(n) == 1){
                            firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue("Открыта");
                            firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                        }else{
                            firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue("Закрыта");
                            firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);    
                        }
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }
                }
                sizeOfrowMat++;
                nextCell = 0;
            } }
    return firs;
    }   
}
