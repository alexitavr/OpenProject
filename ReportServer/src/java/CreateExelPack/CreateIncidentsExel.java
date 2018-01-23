package CreateExelPack;

import java.io.*;
import SQLForEXEL.SQLforExelNetInc;
import CreateCellForExelPack.createCellforExelNetInc;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class CreateIncidentsExel {
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");          
            private SQLforExelNetInc SQLEX = new SQLforExelNetInc();
            private createCellforExelNetInc ccfei = new createCellforExelNetInc();
            
    public String createExel(String datecount){
        try {         
            String datecounts = datecount;
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчетность_поинцидентам_"+((int)(Math.random()*1000))+".xls";
            createFirstRow();
            createSecondRow(SQLEX.SqlIncident(datecounts));
            for(int i = 0; i < 21; i++){
                sheet.setColumnWidth(i,4500);
                if (i == 14 || i == 17 || i == 20){
                   sheet.setColumnWidth(i,10000); 
                }
            }
            try (FileOutputStream fileOut = new FileOutputStream(filename)) {
                workbook.write(fileOut);
            }       
            return filename;
        } catch ( Exception ex ) {
            System.out.println(ex);
        }
        return "";
    }    
    private void createFirstRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND); 
            style.setAlignment(CellStyle.ALIGN_CENTER);
            Row rowhead = sheet.createRow((short)0);
            String[] headers = new String[]{"Дата создания инцидента", "Время изменения статуса",    
            "Критичность", "Тип инц.", "Ном", "LUNO", "Модель АТМ", "Город", "Адрес", "Статус", "Отдел",
            "Исполнитель", "Инкас", "Дата инкас", "Коментарий к инкассационным работам", "Статус", "Дата-время",
            "Комментарий к ордеру", "Комментарий заявке", "Сервисная компания", "Коментарий оператора"}; 
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
