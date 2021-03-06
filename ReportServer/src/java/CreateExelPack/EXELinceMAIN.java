package CreateExelPack;

import java.io.*;
import java.util.Calendar;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import SQLForEXEL.SQLforExelInc;
import CreateCellForExelPack.CreateCellforExelIncs;
import MailPack.MailParser;
import MailPack.Mail;
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

public class EXELinceMAIN extends TimerTask{
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");
            private final Calendar calendar = Calendar.getInstance();           
            private SQLforExelInc SQLEX = new SQLforExelInc();
            private CreateCellforExelIncs ccfei = new CreateCellforExelIncs();
            private Mail ml = new Mail();
            private MailParser mailParser = new MailParser();
                    
                    
    @Override
    public void run() {
        try {
            createExel();
        } catch (Exception ex) {
            Logger.getLogger(ExelDostCreate.class.getName()).log(Level.SEVERE, null, ex);
        }
   }  
    
    public String createExelNet(){
        try {         
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчет_по_Задачам_"+((int)(Math.random()*1000))+".xls";
            createFirstRow();
            createSecondRow(SQLEX.SqlIncident2());
            sheet.setColumnWidth(0,3000);
            sheet.setColumnWidth(1,4000);
            sheet.setColumnWidth(2,4000);
            sheet.setColumnWidth(3,4000);
            sheet.setColumnWidth(4,4000);
            sheet.autoSizeColumn((short)5);
            sheet.setColumnWidth(6,10000);
            sheet.setColumnWidth(7,8000);
            sheet.setColumnWidth(8,4000);
            sheet.setColumnWidth(9,4000);
            sheet.setColumnWidth(10,4000);
            sheet.setColumnWidth(11,4000);
            FileOutputStream fileOut = new FileOutputStream(filename);
            workbook.write(fileOut);
            fileOut.close();  
            return filename;            
        } catch ( Exception ex ) {
            System.out.println(ex);
        }
        return "";
    }
    
     
    private void createExel(){
        try {         
            DateFormat df = new SimpleDateFormat("MM.dd");
            String requiredDate = df.format(new Date());
            String Hour = calendar.get(Calendar.HOUR_OF_DAY) < 10 ? "0" + calendar.get(Calendar.HOUR_OF_DAY): "" + calendar.get(Calendar.HOUR_OF_DAY);
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчет_по_Задачам_"+requiredDate+"H"+Hour+".xls";
            createFirstRow();
            ml.mailSend("Главный отчет","Выгрузка инцидентов на дату");
            createSecondRow(SQLEX.SqlIncident1());
            sheet.setColumnWidth(0,3000);
            sheet.setColumnWidth(1,4000);
            sheet.setColumnWidth(2,4000);
            sheet.setColumnWidth(3,4000);
            sheet.setColumnWidth(4,4000);
            sheet.autoSizeColumn((short)5);
            sheet.setColumnWidth(6,10000);
            sheet.setColumnWidth(7,8000);
            sheet.setColumnWidth(8,4000);
            sheet.setColumnWidth(9,4000);
            sheet.setColumnWidth(10,4000);
            sheet.setColumnWidth(11,4000);
            FileOutputStream fileOut = new FileOutputStream(filename);
            workbook.write(fileOut);
            fileOut.close();              
            ml.setString(mailParser.read("C:\\mailList\\MailList.txt"));
            ml.SetTo();
            ml.AddFile(filename); 
            ml.send();
        } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }    
    private void createFirstRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            firstCellstyle.setBold(true); 
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            style.setFont(firstCellstyle);  
            style.setWrapText(true);
            style.setBorderBottom(CellStyle.BORDER_THIN);
            style.setBorderTop(CellStyle.BORDER_THIN);
            style.setBorderRight(CellStyle.BORDER_THIN);
            style.setBorderLeft(CellStyle.BORDER_THIN);          
            Row rowhead = sheet.createRow((short)0);
            String[] headers = new String[]{"Дата /время направления заявки","Ошибка устройства", "Номер банкомата","Статус","Отдел", "Адрес" ,"Комментарий к ордеру", "Комментарий заявке", "Статус заявки",
            "Сервисная компания", "Время от направления заявки в часах", "Время от направления заявки в минутах"}; 
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
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            style.setAlignment(CellStyle.ALIGN_LEFT);
            style.setVerticalAlignment(CellStyle.VERTICAL_TOP);
            style.setFont(firstCellstyle);  
            style.setWrapText(true);
            style.setBorderBottom(CellStyle.BORDER_THIN);
            style.setBorderTop(CellStyle.BORDER_THIN);
            style.setBorderRight(CellStyle.BORDER_THIN);
            style.setBorderLeft(CellStyle.BORDER_THIN);
            sheet = ccfei.createForthRow(sheet, SQL, style, 9);      
    }   
    
}
