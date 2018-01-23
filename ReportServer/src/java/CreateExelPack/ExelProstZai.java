package CreateExelPack;

import SQLForEXEL.SQLforExelInc;
import CreateCellForExelPack.CreateCellforExelInc;
import java.io.*;
import java.util.Calendar;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import MailPack.MailParserFirms;
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

public class ExelProstZai extends TimerTask{
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");
            private final Calendar calendar = Calendar.getInstance();           
            private SQLforExelInc SQLEX = new SQLforExelInc();
            private CreateCellforExelInc ccfei = new CreateCellforExelInc();
            private MailParserFirms mailParser = new MailParserFirms(); 
            private Mail ml = new Mail();
            
    @Override
    public void run() {
        try {
            createExel();
        } catch (Exception ex) {
            Logger.getLogger(ExelDostCreate.class.getName()).log(Level.SEVERE, null, ex);
        }
   } 
    
    private void createExel(){
        try {         
            DateFormat df = new SimpleDateFormat("MM.dd");
            String requiredDate = df.format(new Date());
            String Hour = calendar.get(Calendar.HOUR_OF_DAY) < 10 ? "0" + calendar.get(Calendar.HOUR_OF_DAY): "" + calendar.get(Calendar.HOUR_OF_DAY);
            String Minyte = calendar.get(Calendar.MINUTE) < 10 ? "0" + calendar.get(Calendar.MINUTE): "" + calendar.get(Calendar.MINUTE);
            createFirstRow();
            sheet.setColumnWidth(0,3000);
            sheet.setColumnWidth(1,4000);
            sheet.setColumnWidth(2,4000);
            sheet.setColumnWidth(3,7000);
            sheet.setColumnWidth(4,4000);
            sheet.setColumnWidth(5,4000);
            sheet.setColumnWidth(6,4000);
            sheet.setColumnWidth(7,10000);
            sheet.setColumnWidth(8,5000);
            sheet.setColumnWidth(9,4000);
            sheet.setColumnWidth(10,4000);
            for(int i = 0; i < 6; i++){      
                createSecondRow(SQLEX.SqlIncidentFirm(i));
                if(ccfei.getFirm() != null){
                ml.mailSend("Выгрузка не закрытых заявок " + requiredDate+" "+Hour+":"+Minyte, "Отчет по направленным заявкам");
                String filename_dep = "C:\\Users\\Public\\Отчет_по_инцидентам\\Выгрузка_по_заявкам_"+requiredDate+"H"+Hour+ccfei.getFirm()+".xls";
                FileOutputStream fileOut = new FileOutputStream(filename_dep);
                workbook.write(fileOut);
                fileOut.close();
                mailParser.SetRequest(ccfei.getFirm());
                ml.setString(mailParser.read());
                ml.SetTo();
                ml.AddFile(filename_dep); 
                ml.send();
                clear();
                }   
            }       
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
            String[] headers = new String[]{"Дата /время направления заявки","Ошибка устройства", "Номер банкомата", "Модель", "Серийный номер", "Город", "Улица" ,"Комментарий к ордеру", "Комментарий заявке"
            , "Время от направления заявки в часах", "Время от направления заявки в минутах"}; 
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
            sheet = ccfei.createForthRow(sheet, SQL, style);  
    }   
    
       private void clear(){
      int sizeOfrowMat_deb = 1; 
      while (sizeOfrowMat_deb < 1000) {  
      Row rowhead = sheet.createRow((short)sizeOfrowMat_deb++); 
      sheet.removeRow(rowhead);
      }
    }

}
