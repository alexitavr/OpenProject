package CreateExelPack;

import CreateCellForExelPack.CreateCellforExelCloseInkas;
import MailPack.Mail;
import MailPack.MailParser;
import SQLForEXEL.SQLforExelCloseInkasYes;
import java.io.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;

public class CreateExelZakrInkasYes extends TimerTask {
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");          
            private SQLforExelCloseInkasYes SQLEX = new SQLforExelCloseInkasYes();
            private CreateCellforExelCloseInkas ccfei = new CreateCellforExelCloseInkas();
            private Mail ml = new Mail();
            private MailParser mailParser = new MailParser();
            
    @Override
    public void run() {
        try {
            createExel();
        } catch (Exception ex) {
            Logger.getLogger(CreateExelZakrInkasYes.class.getName()).log(Level.SEVERE, null, ex);
        }
   } 
            
    private void createExel() throws Exception{     
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat ("s");
            int a= currentDate.getDate()-1;
            formatter.applyPattern("MM."+a);
            String datetime = formatter.format(currentDate);
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчет_по_счетчикам_выдачи_"+datetime+".xls";
            createZaiRow();
            ml.mailSend("Отчет по счетчикам выдачи","Выгрузка счетчиков выдачи за вчера");
            createFirstRow();
            createSecondRow(SQLEX.SqlCount());
            for(int i = 0; i < 14; i++){
                sheet.setColumnWidth(i,4600);
            }
            FileOutputStream fileOut = new FileOutputStream(filename);
            workbook.write(fileOut);
            fileOut.close();              
            ml.setString(mailParser.read("C:\\mailList\\ZakrInkasYes.txt"));
            ml.SetTo();
            ml.AddFile(filename); 
            ml.send();
    }    
    
    
    private void createZaiRow(){
            CellRangeAddress regions = CellRangeAddress.valueOf("B1:E1");
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 4));
            Row zagolovok = sheet.createRow(0);  
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            firstCellstyle.setBold(true);
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();                                   
            style.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_CENTER_SELECTION);
            style.setFont(firstCellstyle); 
            style.setBorderRight(CellStyle.BORDER_THIN);
            style.setBorderBottom(CellStyle.BORDER_THIN);
            short borderMediumDashed  = CellStyle.BORDER_THIN;      
            RegionUtil.setBorderBottom(borderMediumDashed, regions, sheet, workbook);
            RegionUtil.setBorderRight(borderMediumDashed, regions, sheet, workbook);
            RegionUtil.setBorderLeft(borderMediumDashed, regions, sheet, workbook);
            Cell zagol1 = zagolovok.createCell(0);
            zagol1.setCellValue(" ");
            zagol1.setCellStyle(style);
            Cell zagol = zagolovok.createCell(1);
            zagol.setCellValue("Осталось");
            zagol.setCellStyle(style);
            CellRangeAddress regions1 = CellRangeAddress.valueOf("F1:I1");
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 5, 8));
            RegionUtil.setBorderBottom(borderMediumDashed, regions1, sheet, workbook);
            RegionUtil.setBorderRight(borderMediumDashed, regions1, sheet, workbook);
            RegionUtil.setBorderLeft(borderMediumDashed, regions1, sheet, workbook);
            Cell zagol2 = zagolovok.createCell(5);
            zagol2.setCellValue("Сброшено");
            zagol2.setCellStyle(style);
            CellRangeAddress regions2 = CellRangeAddress.valueOf("J1:M1");
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 9, 12));
            RegionUtil.setBorderBottom(borderMediumDashed, regions2, sheet, workbook);
            RegionUtil.setBorderRight(borderMediumDashed, regions2, sheet, workbook);
            RegionUtil.setBorderLeft(borderMediumDashed, regions2, sheet, workbook);
            Cell zagol3 = zagolovok.createCell(9);
            zagol3.setCellValue("Забыто");
            zagol3.setCellStyle(style);
            Cell zagol4 = zagolovok.createCell(13);
            zagol4.setCellValue(" ");
            zagol4.setCellStyle(style);
            
    }
          
    private void createFirstRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND); 
            style.setAlignment(CellStyle.ALIGN_CENTER);
            Row rowhead = sheet.createRow((short)1);
            String[] headers = new String[]{"Номер УС","номинал 5000/количество","номинал 1000/количество","номинал 500/количество","номинал 100/количество","номинал 5000/количество",
                "номинал 1000/количество","номинал 500/количество","номинал 100/количество","номинал 5000/количество",
                "номинал 1000/количество","номинал 500/количество","номинал 100/количество","Сумма"}; 
            for(int i = 0; i < headers.length; i++){
                Cell zagol =  rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);
            }         
    } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }   
    private void createSecondRow(String SQL) throws Exception{
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
        SimpleStyle(style);
        sheet = ccfei.createForthRow(sheet, SQL, style);      
    }     
        private HSSFCellStyle SimpleStyle(HSSFCellStyle style){
        HSSFCellStyle styles = style;
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            styles.setAlignment(CellStyle.ALIGN_LEFT);
            styles.setVerticalAlignment(CellStyle.VERTICAL_TOP);
            styles.setFont(firstCellstyle);  
            styles.setWrapText(true);
            styles.setBorderBottom(CellStyle.BORDER_THIN);
            styles.setBorderTop(CellStyle.BORDER_THIN);
            styles.setBorderRight(CellStyle.BORDER_THIN);
            styles.setBorderLeft(CellStyle.BORDER_THIN);
        return styles;
    }
}
