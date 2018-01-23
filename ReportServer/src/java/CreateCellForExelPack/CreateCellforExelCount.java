package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;

public class CreateCellforExelCount {
    private OraConRepo orc = new OraConRepo(); 
    private PreparedStatement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style) throws SQLException{
        sizeOfrowMat = 1;
        Sheet firs = first; 
        long summ1 = 0;
        long summ2 = 0;
        long summ3 = 0;
        long summ4 = 0;
        long summ5 = 0;
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.prepareStatement(SQL);
            ResultSet res = statement.executeQuery();
            int nextCell = 0;
            while (res.next()) {
                if (", ".equals(res.getString(2))){}else{
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    
                    if (i > 4 && i < 11){
                            firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getInt(i));
                            firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style); 
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                        }
                    }
                
                summ1 += res.getInt(6);
                summ2 += res.getInt(7);
                summ3 += res.getInt(8);
                summ4 += res.getInt(9);
                summ5 += res.getInt(10);
                sizeOfrowMat++;
                nextCell = 0;
                }
            }
            firs.createRow((short)sizeOfrowMat);
            firs.getRow(sizeOfrowMat).createCell(0).setCellValue("Итого");
            firs.getRow(sizeOfrowMat).getCell(0).setCellStyle(style);
            firs.getRow(sizeOfrowMat).createCell(5).setCellValue(summ1);
            firs.getRow(sizeOfrowMat).getCell(5).setCellStyle(style);
            firs.getRow(sizeOfrowMat).createCell(6).setCellValue(summ2);
            firs.getRow(sizeOfrowMat).getCell(6).setCellStyle(style);
            firs.getRow(sizeOfrowMat).createCell(7).setCellValue(summ3);
            firs.getRow(sizeOfrowMat).getCell(7).setCellStyle(style);
            firs.getRow(sizeOfrowMat).createCell(8).setCellValue(summ4);
            firs.getRow(sizeOfrowMat).getCell(8).setCellStyle(style);
            firs.getRow(sizeOfrowMat).createCell(9).setCellValue(summ5);
            firs.getRow(sizeOfrowMat).getCell(9).setCellStyle(style);
        }
    return firs;
    }   
}
