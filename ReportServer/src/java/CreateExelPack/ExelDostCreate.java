package CreateExelPack;

import ConnectToDB.OraConRepo;
import Sinhro.Rondo;
import SQLForEXEL.SQLforEXEL;
import CreateCellForExelPack.CreateCellforExelDost;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import CreateCellForExelPack.CreateCellforExel_dost;
import MailPack.Content;
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
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.RegionUtil;

public class ExelDostCreate extends TimerTask{
            private final Workbook workbook = new HSSFWorkbook();
            public  Sheet sheet = workbook.createSheet("FirstSheet");       
            private OraConRepo orc = new OraConRepo(); 
            private Statement statement = null;
            private SQLforEXEL SQLEX = new SQLforEXEL();
            private CellRangeAddress region = CellRangeAddress.valueOf("A1:K1");
            private CreateCellforExel_dost ccfed = new CreateCellforExel_dost();
            private CreateCellforExelDost ccfe = new CreateCellforExelDost();
            private MailParser mailParser = new MailParser(); 
            private Mail ml = new Mail();
            private Content cn = new Content();
             
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
            Rondo hrono = new Rondo();  
            hrono.take_Rondo();
            String firsts = "Отчет о доступности банкоматов общий";
            String firstss = "Отчет о доступности депозитарных банкоматов";
            String Text = "Письмо сформировано автоматически.";
            String content = firsts+"\n"
                    +cn.CreateContent(SQLEX.SQLcreateFirstRow(), SQLEX.SQLcreateFiveRownoDayDepCount(), SQLEX.SQLcreateThirdRow())
                    +"\n"+
                    firstss+"\n"+
                    cn.CreateContent(SQLEX.SQLcreateFirstRowDep(), SQLEX.SQLcreateFiveRownoDayDepCountDep(),SQLEX.SQLcreateThirdRowDep())
                    +Text;
            ml.mailSend(content, "Отчет о доступности банкоматов.");
            DateFormat df = new SimpleDateFormat("MM.dd");
            String requiredDate = df.format(new Date());
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 10)); 
            String filename = "C:\\Users\\Public\\Отчет_о_доступности\\Отчет_о_доступности_"+requiredDate+".xls";
            createFirstRow(SQLEX.SQLcreateFirstRow(), SQLEX.SQLcreateFiveRownoDayDepCount());
            createSecondRow();
            createThirdRow(SQLEX.SQLcreateThirdRow(), 2);
            createForthRow(SQLEX.SQLcreateForthRow(), 3);
            createForthRow(SQLEX.SQLcreateFiveRownoDay(), ccfe.getsizeOfrowMat());
            sheet.autoSizeColumn((short)1);
            for (int i = 2; i < 11; i++){
                sheet.setColumnWidth(i,4000);
            }
            try (FileOutputStream fileOut = new FileOutputStream(filename)) {
                workbook.write(fileOut);
            }
            System.out.println("Your excel_1 file has been generated!");
            ml.setString(mailParser.read("C:\\mailList\\Withbis.txt"));
            ml.SetTo();
            ml.AddFile(filename); 
            clear();
            String filename_dep = "C:\\Users\\Public\\Отчет_о_доступности_депозитные\\Отчет_о_доступности_депозитные_"+requiredDate+".xls";
            createFirstRow(SQLEX.SQLcreateFirstRowDep(), SQLEX.SQLcreateFiveRownoDayDepCountDep());
            createThirdRow(SQLEX.SQLcreateThirdRowDep(), 2);
            createForthRow(SQLEX.SQLcreateForthRowDep(), 3);
            createForthRow(SQLEX.SQLcreateFiveRownoDayDep(), ccfe.getsizeOfrowMat());
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
    
    private void createFirstRow(String SQL, String SQL1){
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
            String DATEACCESS = null;
            int count_DATEACCESS = 0;
            int Count_NotWorkATM;
            try (Connection orcs = orc.GetConnSession()) {
                statement = orcs.createStatement();
                ResultSet res = statement.executeQuery(SQL);
                while (res.next()) {
                    DATEACCESS = res.getString(1);
                    count_DATEACCESS = res.getInt(2);
                }   Count_NotWorkATM = 0;
                res = statement.executeQuery(SQL1);
                while (res.next()) {
                    Count_NotWorkATM = res.getInt(1);
                }
            }
            Cell zagol = zagolovok.createCell(0);
            zagol.setCellValue("Статистика за " + DATEACCESS+". Всего УС - "+(count_DATEACCESS+Count_NotWorkATM)+". "
                    + "В отчете - "+count_DATEACCESS+". Ожидают получения данных после отключения(220 Вт/Связи/Введенные в эксплуатацию) "
                    + "- "+Count_NotWorkATM+".");
            zagol.setCellStyle(style);
            } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }
      
    private void createSecondRow(){
        try{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            style.setWrapText(true);    
            Row rowhead = sheet.createRow((short)1);
            String[] headers = new String[]{"Luno","Адрес АТМ","Выполнимость услуг","Выключение устройства по 220 В",
            "Неисправность узлов УС", "Недостаток или отсутствие наличности в УС", "Переполнение кассеты депозитора УС",
            "Отсутствие связи с сервером MobilPay", "Разрыв связи с HOST", "Персональное отключение услуги по команде сервера MobilPay",
            "Общее отключение услуг по команде сервера MobilPay"}; 
            for(int i = 0; i < headers.length; i++){
                Cell zagol =  rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);
            }            
    } catch ( Exception ex ) {
            System.out.println(ex);
        }
    }
    
    private void createForthRow(String SQL, int row) throws Exception{
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
              SimpleStyle(style);
            if (row > 4){
            style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            }
            sheet = ccfe.createForthRow(sheet, SQL, style, row);      
    }   
    
    public void clear(){
      int sizeOfrowMat_deb = 3; 
      while (sizeOfrowMat_deb < 1000) {  
      Row rowhead = sheet.createRow((short)sizeOfrowMat_deb++); 
      sheet.removeRow(rowhead);
      }
    }

    private void createThirdRow(String SQL, int row) throws Exception{
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_LEFT);   
            sheet = ccfed.createTreeRow(sheet, SQL, style, row);
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
