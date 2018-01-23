package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectToDB.OraConRepo;
import SQLForEXEL.SQLforExelNetWorkLoad;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;
//916 9334554
public class CreateCellforExelWorkLoad {
    private OraConRepo orc = new OraConRepo(); 
    private PreparedStatement statement = null;
    private SQLforExelNetWorkLoad senwl =  new SQLforExelNetWorkLoad();
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style, String datasa1, String datasa2) throws SQLException{
        sizeOfrowMat = 3;
        Sheet firs = first; 
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.prepareStatement(SQL);
            ResultSet res = statement.executeQuery();
            int nextCell = 0;
            while (res.next()) {
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    if (i == 1){
                            firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                            firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style); 
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getInt(i));
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }
                }
                sizeOfrowMat++;
                nextCell = 0;
            }
            firs.createRow((short)sizeOfrowMat);
            firs.getRow(sizeOfrowMat).createCell(0).setCellValue("Робот");
            firs.getRow(sizeOfrowMat).getCell(0).setCellStyle(style); 
            statement = orcs.prepareStatement(senwl.CountAutoInc(datasa1,datasa2));
            ResultSet ress = statement.executeQuery();
            while (ress.next()) {
                firs.getRow(sizeOfrowMat).createCell(8).setCellValue(ress.getInt(1));
                firs.getRow(sizeOfrowMat).getCell(8).setCellStyle(style);
            }
            orcs.close();
        }
        
    return firs;
    }   
}
