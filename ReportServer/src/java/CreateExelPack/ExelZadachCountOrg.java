package CreateExelPack;
//Времени не хватало все красиво сделать так что тут расположен по колено в коде (ГОВНОКОД)

import CreateCellForExelPack.CreateCellforExelIncs;
import CreateCellForExelPack.CreateCellforExelZadachCount;
import java.io.*;
import java.util.TimerTask;
import java.util.logging.Level;
import java.util.logging.Logger;
import MailPack.MailParser;
import MailPack.Mail;
import SQLForEXEL.SQLforEXELZadachCount;
import SQLForEXEL.SQLforExelCountOrg;
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

public class ExelZadachCountOrg extends TimerTask {

    private final Workbook workbook = new HSSFWorkbook();
    public Sheet sheet = workbook.createSheet("FirstSheet");
    public Sheet sheet2 = workbook.createSheet("SecondSheet");
    private SQLforEXELZadachCount SQLEX = new SQLforEXELZadachCount();
    private SQLforExelCountOrg SQLEXE = new SQLforExelCountOrg();
    private CreateCellforExelZadachCount ccfe = new CreateCellforExelZadachCount();
    private CreateCellforExelIncs ccfei = new CreateCellforExelIncs();
    private MailParser mailParser = new MailParser();
    private Mail ml = new Mail();

    @Override
    public void run() {
        try {
            createExel();
        } catch (Exception ex) {
            Logger.getLogger(ExelZadachCountOrg.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void createExel() {
        try {
            ml.mailSend("Отчет сформирован автоматически", "Отчет по задачам.");
            DateFormat df = new SimpleDateFormat("dd.MM");
            String requiredDate = df.format(new Date());
            String filename = "C:\\Users\\Public\\Отчет_о_доступности\\Отчет_по_задачам_по_фирмам_" + requiredDate + ".xls";
            createFirstRow();
            createSecondRow(SQLEX.SQLcreateFirst());
            createNextFirstRow();
            createNextSecondRow(SQLEXE.SqlIncident());
            sheet.autoSizeColumn((short) 0);
            for (int i = 0; i < 6; i++) {
                sheet.setColumnWidth(i, 5000);
            }
            sheet2.setColumnWidth(0, 4500);
            sheet2.setColumnWidth(1, 4000);
            sheet2.setColumnWidth(2, 4000);
            sheet2.setColumnWidth(3, 4500);
            sheet2.setColumnWidth(4, 10000);
            sheet2.setColumnWidth(5, 4000);
            sheet2.setColumnWidth(6, 8000);
            sheet2.setColumnWidth(7, 4000);
            sheet2.setColumnWidth(8, 4000);
            sheet2.setColumnWidth(9, 4000);
            sheet2.setColumnWidth(10, 4000);
            try (FileOutputStream fileOut = new FileOutputStream(filename)) {
                workbook.write(fileOut);
            }
            System.out.println("Your excel_1 file has been generated!");
            ml.setString(mailParser.read("C:\\mailList\\ZadachCountOrg.txt"));
            ml.SetTo();
            ml.AddFile(filename);
            ml.send();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    private void createFirstRow() {
        try {
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            SimpleStyle(style);
            style.setFillForegroundColor(HSSFColor.LIGHT_YELLOW.index);
            style.setFillPattern(CellStyle.SOLID_FOREGROUND);
            style.setAlignment(CellStyle.ALIGN_CENTER);
            style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
            style.setWrapText(true);
            Row rowhead = sheet.createRow((short) 0);
            String[] headers = new String[]{"Дата", "Кол-во отправленных заявок", "Кол-во закрытых заявок", "Кол-во просроченных заявок",
                "Общее время просрочки (в часах)", "Фирма"};
            for (int i = 0; i < headers.length; i++) {
                Cell zagol = rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    private void createSecondRow(String SQL) throws Exception {
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
        SimpleStyle(style);
        sheet = ccfe.createForthRow(sheet, SQL, style);
    }

    private void createNextFirstRow() {
        try {
            HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
            Font firstCellstyle = workbook.createFont();
            firstCellstyle.setFontHeightInPoints((short) 11);
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
            Row rowhead = sheet2.createRow((short) 0);
            String[] headers = new String[]{"Дата /время направления заявки", "Ошибка устройства", "Номер банкомата", "Адрес", "Комментарий к ордеру", "Комментарий заявке", "Статус заявки",
                "Сервисная компания", "Время от направления заявки в часах", "Время от направления заявки в минутах"};
            for (int i = 0; i < headers.length; i++) {
                Cell zagol = rowhead.createCell(i);
                zagol.setCellValue(headers[i]);
                zagol.setCellStyle(style);

            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    private void createNextSecondRow(String SQL) throws Exception {
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();
        Font firstCellstyle = workbook.createFont();
        firstCellstyle.setFontHeightInPoints((short) 11);
        firstCellstyle.setFontName("Calibri");
        style.setAlignment(CellStyle.ALIGN_LEFT);
        style.setVerticalAlignment(CellStyle.VERTICAL_TOP);
        style.setFont(firstCellstyle);
        style.setWrapText(true);
        style.setBorderBottom(CellStyle.BORDER_THIN);
        style.setBorderTop(CellStyle.BORDER_THIN);
        style.setBorderRight(CellStyle.BORDER_THIN);
        style.setBorderLeft(CellStyle.BORDER_THIN);
        sheet2 = ccfei.createForthRow(sheet2, SQL, style, 7);
    }

    private HSSFCellStyle SimpleStyle(HSSFCellStyle style) {
        HSSFCellStyle styles = style;
        Font firstCellstyle = workbook.createFont();
        firstCellstyle.setFontHeightInPoints((short) 11);
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
