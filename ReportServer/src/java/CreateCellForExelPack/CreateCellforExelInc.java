package CreateCellForExelPack;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ConnectToDB.OraConRepo;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Sheet;

public class CreateCellforExelInc {
    private String firm = null;
    private OraConRepo orc = new OraConRepo(); 
    private Statement statement = null;
    private int sizeOfrowMat;
    public Sheet createForthRow(Sheet first, String SQL, HSSFCellStyle style) throws SQLException{
        sizeOfrowMat = 1;
        Sheet firs = first;
        String firma = null;
        try (Connection orcs = orc.GetConnSession()) {
            statement = orcs.createStatement();
            ResultSet res = statement.executeQuery(SQL);
            int nextCell = 0;
            while (res.next()) {
                firs.createRow((short)sizeOfrowMat);
                for (int i = 1; i <= res.getMetaData().getColumnCount(); i++, nextCell++){
                    if (i == 10){
                        firma = res.getString(i);   
                        nextCell--;
                    }else{
                        firs.getRow(sizeOfrowMat).createCell(nextCell).setCellValue(res.getString(i));
                        firs.getRow(sizeOfrowMat).getCell(nextCell).setCellStyle(style);
                    }
                }
                sizeOfrowMat++;
                nextCell = 0;
            }
            setFirm(firma);
        }
      return firs;
    }   
    public String getFirm(){
        return firm;
    }
    private void setFirm(String set){
        this.firm = set;
    }

}
