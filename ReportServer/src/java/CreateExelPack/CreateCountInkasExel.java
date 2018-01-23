package CreateExelPack;

import CreateCellForExelPack.CreateCellforExelCloseInkSch;
import java.io.*;
import SQLForEXEL.SQLforExelCountIncasC;
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

public class CreateCountInkasExel {
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");          
            private SQLforExelCountIncasC SQLEX = new SQLforExelCountIncasC();
            private CreateCellforExelCloseInkSch ccfei = new CreateCellforExelCloseInkSch();
            
    public String createExel(String datecount){
        try {         
            String datecounts = datecount;
            int data = Integer.parseInt(datecounts);
            String filename = "C:\\Users\\Public\\Отчет_по_инцидентам\\Отчетность_по_обороту_на_АТМ_"+((int)(Math.random()*1000))+".xls";
            createZaiRow(data);
            createFirstRow();
            createSecondRow(SQLEX.SqlCountInkas(datecounts));
            for(int i = 0; i < 8; i++){
                sheet.setColumnWidth(i,4500);
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
    
        private void createZaiRow(int data){
            CellRangeAddress regions = CellRangeAddress.valueOf("A1:G1");
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));
            Row zagolovok = sheet.createRow(0);  
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
            String[] Months = {"","Январь","Февраль","Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"};
            zagol1.setCellValue("Данные по обороту на АТМ в разрезе циклов инкассации за " + Months[data]);
            zagol1.setCellStyle(style);  
    }
    
    private void createFirstRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND); 
            style.setAlignment(CellStyle.ALIGN_CENTER);
            Row rowhead = sheet.createRow((short)1);
            String[] headers = new String[]{"Номер банкомата", "Начало цикла инкассации", "Конец цикла инкасации", "Вид АТМ (Банкомат/депозитор)"
                    , "Сумма загрузки, руб.", "Выдано наличности, руб.", "Принято наличности, руб."}; 
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
