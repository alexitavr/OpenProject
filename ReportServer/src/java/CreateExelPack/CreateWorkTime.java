package CreateExelPack;

import CreateCellForExelPack.CreateCellforExelWorkLoad;
import java.io.*;
import SQLForEXEL.SQLforExelNetWorkLoad;
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

public class CreateWorkTime {
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");          
            private SQLforExelNetWorkLoad SQLEX = new SQLforExelNetWorkLoad();
            private CreateCellforExelWorkLoad ccfei = new CreateCellforExelWorkLoad();
            private CellRangeAddress region = CellRangeAddress.valueOf("A1:AD1");
            
    public String createExel(String date1, String date2){
        try {         
            date1 = date1.replace('-', '.');
            String dates1 = date1.substring(8, date1.length()) + 
                    date1.substring(4, date1.length()-2) + date1.substring(0, date1.length()-6);
            date2 = date2.replace('-', '.');
            String dates2 = date2.substring(8, date2.length()) 
                    + date2.substring(4, date2.length()-2) + date2.substring(0, date2.length()-6);
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчетность_времени_"+((int)(Math.random()*1000))+".xls";
            createHeaderRow(date1,date2);
            createZaiRow();
            createFirstRow();
            createSecondRow(SQLEX.SqlIncident(dates1,dates2), dates1, dates2);
            for(int i = 0; i < 30; i++){
                sheet.setColumnWidth(i,4600);
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
    
    
    private void createZaiRow(){
            CellRangeAddress regions = CellRangeAddress.valueOf("B2:H2");
            sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 7));
            Row zagolovok = sheet.createRow(1);  
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short)11);
            firstCellstyle.setFontName("Calibri");
            firstCellstyle.setBold(true);
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();                                   
            style.setFillForegroundColor(HSSFColor.LIGHT_CORNFLOWER_BLUE.index);
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
            zagol.setCellValue("Заявки");
            zagol.setCellStyle(style);
            CellRangeAddress regions1 = CellRangeAddress.valueOf("I2:AD2");
            sheet.addMergedRegion(new CellRangeAddress(1, 1, 8, 29));
            RegionUtil.setBorderBottom(borderMediumDashed, regions1, sheet, workbook);
            RegionUtil.setBorderRight(borderMediumDashed, regions1, sheet, workbook);
            RegionUtil.setBorderLeft(borderMediumDashed, regions1, sheet, workbook);
            Cell zagol2 = zagolovok.createCell(8);
            zagol2.setCellValue("Инциденты");
            zagol2.setCellStyle(style);
      
    }
    
      private void createHeaderRow(String date1, String date2){
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 29));
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
            zagol.setCellValue("Отчет с " + date1+" по " +date2);
            zagol.setCellStyle(style);
    }
    
    
    private void createFirstRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND); 
            style.setAlignment(CellStyle.ALIGN_CENTER);
            Row rowhead = sheet.createRow((short)2);
            String[] headers = new String[]{"Фамилия сотрудника","Заявка создана.", "Заявка изменена на \"Заявка выполнена\"",    
            "Заявка изменена на \"Заявка не выполнена\"", "Заявка изменена на \"Заявка частично выполнена\"", 
            "Заявка изменена на \"Заявка отменена\"", "Заявка изменена на \"Заявка отложена\"","Итого по Заявкам", "Новый Инцидент", 
            "Статус инцидента изменен на \"Открыт\"", "Статус инцидента изменен на \"Закрыт\"", "Статус инцидента изменен на \"Отменён\"", 
            "Статус инцидента изменен на \"Прочее\"", "Статус инцидента изменен на \"Временно не работает\"", 
            "Статус инцидента изменен на \"FLM\"", "Статус инцидента изменен на \"SLM\"", "Статус инцидента изменен на \"Техвыезд\"", 
            "Статус инцидента изменен на \"Техническая переинкассация\"", "Статус инцидента изменен на \"Переинкассация\"",
            "Статус инцидента изменен на \"Разгрузка\"", "Статус инцидента изменен на \"Загрузка\"", "Статус инцидента изменен на \"Электропитание\"",
            "Статус инцидента изменен на \"Доступ\"", "Статус инцидента изменен на \"Перемещение/демонтаж\"", "Статус инцидента изменен на \"Связь\"",
            "Статус инцидента изменен на \"Сигнализация\"", "Итого по Инцидентам", "Отдел Инцидента изменен", "Исполнитель Инцидента изменен", 
            "Инкассационные параметры Инцидента изменены"
            }; 
            for(int i = 0; i < headers.length; i++){
                Cell zagol =  rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);
            }         
    } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }   
    private void createSecondRow(String SQL, String datasa1, String datasa2) throws Exception{
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
        SimpleStyle(style);
        sheet = ccfei.createForthRow(sheet, SQL, style, datasa1, datasa2);      
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
