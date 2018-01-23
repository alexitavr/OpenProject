package CreateExelPack;

import CreateCellForExelPack.CreateCellforExelCassa;
import java.io.*;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import MailPack.MailParser;
import MailPack.Mail;
import SQLForEXEL.SQLforEXELCassa;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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

public class ExelRetractKacca extends TimerTask{
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");        
            private SQLforEXELCassa SQLEX = new SQLforEXELCassa();
            private CellRangeAddress region = CellRangeAddress.valueOf("A1:L1");
            private CreateCellforExelCassa ccfe = new CreateCellforExelCassa();
            private MailParser mailParser = new MailParser(); 
            private Mail ml = new Mail();
             
    @Override
    public void run() {
        try {
            createExel();
        } catch (Exception ex) {
            Logger.getLogger(ExelRetractKacca.class.getName()).log(Level.SEVERE, null, ex);
        }
   } 
            
    private void createExel(){
        try {         
            ml.mailSend("Отчет сформирован автоматически", "Отчет по ретрактам.");
            DateFormat df = new SimpleDateFormat("dd.MM");
            String requiredDate = df.format(new Date());
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 11)); 
            String filename = "C:\\Users\\Public\\Отчет_о_доступности\\Ретракты_Отчет_"+requiredDate+".xls";
            createFirstRow("(Ретракты)");
            createSecondRow();
            createForthRow(SQLEX.SQLcreateFirst());
            sheet.autoSizeColumn((short)1);
            for (int i = 2; i < 12; i++){
                sheet.setColumnWidth(i,5000);
            }
            try (FileOutputStream fileOut = new FileOutputStream(filename)) {
                workbook.write(fileOut);
            }
            System.out.println("Your excel_1 file has been generated!");
            ml.setString(mailParser.read("C:\\mailList\\WithKassa.txt"));
            ml.SetTo();
            ml.AddFile(filename); 
            clear();
            String filename_dep = "C:\\Users\\Public\\Отчет_о_доступности_депозитные\\Сбой_презентера_Отчет_"+requiredDate+".xls";
            createFirstRow("(Сбой презентера)");
            createForthRow(SQLEX.SQLcreateSecond());
            try (FileOutputStream fileOutDep = new FileOutputStream(filename_dep)) {
                workbook.write(fileOutDep);
            }
            System.out.println("Your excel_2 file has been generated!");   
            ml.AddFile(filename_dep); 
            ml.send();
        } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }
    
    private void createFirstRow(String zag){
        try{
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
            style.setBorderBottom(CellStyle.BORDER_THIN);
            short borderMediumDashed  = CellStyle.BORDER_THIN;
            RegionUtil.setBorderBottom(borderMediumDashed, region, sheet, workbook);
            RegionUtil.setBorderRight(borderMediumDashed, region, sheet, workbook);
            RegionUtil.setBorderLeft(borderMediumDashed, region, sheet, workbook);
            Cell zagol = zagolovok.createCell(0);           
            Date currentDate = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat ("s");
            int a= currentDate.getDate()-1;
            formatter.applyPattern(a+".MM.yyyy");
            String datetime = formatter.format(currentDate);
            zagol.setCellValue("Статистика за "+datetime+"г. " + zag);
            zagol.setCellStyle(style);
            } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }
      
    private void createSecondRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.LIGHT_TURQUOISE.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            style.setWrapText(true);    
            Row rowhead = sheet.createRow((short)1);
            String[] headers = new String[]{"Номер АТМ","Дата проведения транзакции","Номер карты","Код авторизации",    
            "RRN", "Номер операции", "Номер чека","Сумма, RUR ", "5000 RUR", "1000 RUR","500 RUR","100 RUR"}; 
            for(int i = 0; i < headers.length; i++){
                Cell zagol =  rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);
            }            
    } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }
    
    private void createForthRow(String SQL) throws Exception{
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            sheet = ccfe.createForthRow(sheet, SQL, style);      
    }   
    
    public void clear(){
      int sizeOfrowMat_deb = 3; 
      while (sizeOfrowMat_deb < 1000) {  
      Row rowhead = sheet.createRow((short)sizeOfrowMat_deb++); 
      sheet.removeRow(rowhead);
      }
    }
    
    private HSSFCellStyle SimpleStyle(HSSFCellStyle style){
        HSSFCellStyle styles = style;
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            styles.setAlignment(CellStyle.ALIGN_LEFT);
            styles.setVerticalAlignment(CellStyle.VERTICAL_TOP);
            styles.setFont(firstCellstyle);  
            styles.setBorderBottom(CellStyle.BORDER_THIN);
            styles.setBorderTop(CellStyle.BORDER_THIN);
            styles.setBorderRight(CellStyle.BORDER_THIN);
            styles.setBorderLeft(CellStyle.BORDER_THIN);
        return styles;
    }
}
