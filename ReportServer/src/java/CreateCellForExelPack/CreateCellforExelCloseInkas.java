package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;

public class CreateCellforExelCloseInkas {
    private OraConRepo orc = new OraConRepo(); 
    private PreparedStatement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style) throws SQLException{
        sizeOfrowMat = 2;
        Sheet firs = first; 
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.prepareStatement(SQL);
            ResultSet res = statement.executeQuery();
            int nextCell = 0;
            while (res.next()) {
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    if (i > 1){
                            firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getInt(i));
                            firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style); 
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }
                }
                sizeOfrowMat++;
                nextCell = 0;
            }
        }
    return firs;
    }   
}
