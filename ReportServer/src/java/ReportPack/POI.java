package ReportPack;

import ConnectToDB.OraConFile;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
//import org.apache.poi.xssf.usermodel.*;
//import org.apache.poi.ss.usermodel.*;
import oracle.sql.*;
//import java.io.EOFException;
import java.sql.*;
import java.io.*;
//import org.apache.poi.hssf.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import TimerPackSinhro.FiveMinuteSinhro;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
//import java.util.zip.ZipEntry;
//import java.util.zip.ZipOutputStream;
//import java.util.Iterator;
import ConnectToDB.OraConFile;
//C:\Users\Marchenkods\AppData\Local\Temp\poifiles
public class POI {

//private static XSSFWorkbook wb = null;
//private static Blob in_blob =  null;  
//private static ResultSet resultSet = null;
//private static PreparedStatement pst_param = null;
//private static String SQL_TEXT = null; 
//private static String v_PC_OPER_ID = null; 
//private static String REP_ID = null; 
//private static int FIRST_ROW = 0; 
//private static int TEMPTE_SHEET = 1;
//private static int COUNT_PAGE = 0;
//private OraConTST orcTST = new OraConTST();

//private CallableStatement callableStatement = null;
//public OraConTST orcTST;
 

  public void GetblobExcel(Integer v_REP_ID, Integer v_PC_OPER_ID ) throws Throwable/*throws Exception*/ {

  // System.setProperty("java.io.tmpdir", "c:\POI_TEMP");
      
 //Пока все в одном методе для читабельности, потом по хорошему нужно будет все разбить по get/set

 // OraConTST  orcTST = new OraConTST();
//  OraConRepo orcRepo = new OraConRepo();
  
 // OraConRepo orcRepo = new OraConRepo();
   //Коннект к базе по умолчанию 
 //try   (Connection Data_dase = orcRepo.GetConnSession())
 // {

   /* pst_param1 = InterfaceCon.createStatement();
    
    String query = "SELECT pc.id as oper_id, pcp.value as REP_ID " +
                                      " FROM  PC_OPER pc , Pc_Oper_Params pcp " +
                                      " WHERE  pc.op_status in ('ENTRY')   " +
                                      " AND pc.op_code = 'CREATE_REPORT' " +
                                      " and pc.id = pcp.oid_pc_oper " +
                                      " and pcp.param = 'REP_ID'" ;
            
   //-- pst_param1 = InterfaceCon.prepareStatement(query);

   resultSet1 = pst_param1.executeQuery(query);
  // resultSet1 = pst_param1.executeUpdate(query);
   
   
  
   //Получаем заказ отчета
    while (resultSet1.next()) 
     {
    //  transactionList.add(new Transaction(resultSet1));
      v_PC_OPER_ID = resultSet1.getString("oper_id");  
      REP_ID = resultSet1.getString("REP_ID");  
     */
      
    Blob in_blob = BLOB.createTemporary(FiveMinuteSinhro.InterfaceCon, true, BLOB.DURATION_SESSION);
   
    CallableStatement callableStatement;  
    //Поднимаем блоб с шаблоном отчета по ID отчета    
    //Инициируем переменку
    callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call  REPORTS_WORK.PC_OPER_INIT_REP(?)}");
    callableStatement.setInt(1, v_PC_OPER_ID);
    callableStatement.executeUpdate();
    FiveMinuteSinhro.InterfaceCon.commit();
    callableStatement.close();
    
    //Пишем статус  START
    callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call   PC_OPER_WORK.PC_OPER_START (?)}");
    callableStatement.setInt(1, v_PC_OPER_ID);
    callableStatement.executeUpdate();
    FiveMinuteSinhro.InterfaceCon.commit();
    callableStatement.close();
    
    ResultSet resultSet;
    PreparedStatement pst_param ;
    pst_param = FiveMinuteSinhro.InterfaceCon.prepareStatement("select REPORTS_WORK.GET_REPORT_TEMPLATE(a.id) as repblob, " + 
                                     "       REPORTS_WORK.GET_REPORT_NAME(a.id)     as REPORT_NAME, " +
                                     "       (select max(substr(rp.param,-1)) " +
                                     "         from  reports_params rp " +
                                     "        where rp.oid_REP_ID =  a.id " +
                                     "         and rp.param like 'PAGE%'  and rp.state = 'A')  as COUNT_PAGE,  " +
                                     "        (select min(substr(rp.param,-1)) " +
                                     "           from  reports_params rp " +
                                     "         where rp.oid_REP_ID =  a.id " +
                                     "         and rp.param like 'PAGE%'  and rp.state = 'A')  as First_PAGE,  " +
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'REPORT_PROGRAM','REPORT_PARAM') as REPORT_PROGRAM,   " +
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'PROGRAM','PAGE_1') as PROGRAM_TEXT,    " +
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'ZIP','REPORT_PARAM') as PAR_ZIP,   " +
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'XML_DATA','REPORT_PARAM') as XML_DATA,"+
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'DATABASE_CONNECTION','REPORT_PARAM') as DATABASE_CON, "+
                                     "        REPORTS_WORK.GET_REPORT_PARAM(a.id,'SAVE_BLOB','REPORT_PARAM') as SAVE_BLOB, "+
                                     "        REPORTS_WORK.GET_FILE_NAME(b.PC_OPER_ID) as FileName "+
                                     " from dual, (select ? as id from dual)a,  (select ? as PC_OPER_ID from dual)b");
  pst_param.setInt(1, v_REP_ID);
   pst_param.setInt(2, v_PC_OPER_ID);
  resultSet = pst_param.executeQuery();
 
  int COUNT_PAGE = 0;
  int First_PAGE  = 0;
  int REPORT_PROGRAM = 0;
  String  PROGRAM_TEXT  = null;
  String  FileName = null;
  int PAR_ZIP   = 0;
  int XML_DATA  = 0;
  String  DATABASE_CON = null;
  int v_SAVE_BLOB   = 0;
    //Получаем шаблон
    while (resultSet.next()) 
     {in_blob          = resultSet.getBlob("REPBLOB");
      COUNT_PAGE       = resultSet.getInt("COUNT_PAGE") ;
      First_PAGE       = resultSet.getInt("First_PAGE") ;
      REPORT_PROGRAM   = resultSet.getInt("REPORT_PROGRAM") ;
      PROGRAM_TEXT     = resultSet.getString("PROGRAM_TEXT") ;
      PAR_ZIP          = resultSet.getInt("PAR_ZIP") ;
      XML_DATA         = resultSet.getInt("XML_DATA") ;
      DATABASE_CON     = resultSet.getString("DATABASE_CON") ;
      v_SAVE_BLOB      =  resultSet.getInt("SAVE_BLOB") ;
      FileName         =  resultSet.getString("FileName") ;
     }
      
      System.out.println("База для получения данных ".concat(DATABASE_CON));
     
      try   (Connection Data_dase = OraConFile.get_connect_from_file(DATABASE_CON))
    { 
    // Connection Data_dase =  OraConFile.get_connect_from_file("DATABASE_CON");
      
      pst_param.close();
      resultSet.close();
      
   
      //Если REPORT_PROGRAM = 1 то строим отчет програмно в оракле.
      if  (REPORT_PROGRAM == 1)
      { 
        oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", Выполняется програма подготовки данных ");
        System.out.println("Заказ "+v_PC_OPER_ID+ ", Выполняется програма подготовки данных ");
        callableStatement = Data_dase.prepareCall("{call "+ PROGRAM_TEXT +" }");
        callableStatement.setInt(1, v_PC_OPER_ID);
        callableStatement.executeUpdate();
        Data_dase.commit();
        callableStatement.close();  
      }
      else
      {
          
        if (PROGRAM_TEXT  != null)  
        {
        //Выполняем подготовку данных скриптом  
        oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", Выполняется програма подготовки данных ");
        System.out.println("Заказ "+v_PC_OPER_ID+ ", Выполняется програма подготовки данных ");
        callableStatement = Data_dase.prepareCall("{call "+ PROGRAM_TEXT +" }");
        callableStatement.setInt(1, v_PC_OPER_ID);
        callableStatement.executeUpdate();
        Data_dase.commit();
        callableStatement.close();  
        }
        
      //Input поток с шаблоном
      InputStream in = in_blob.getBinaryStream();
       
      //Создаем книгу с потоком шаблона
      XSSFWorkbook workbook = new XSSFWorkbook(in);  
      SXSSFWorkbook wb = new SXSSFWorkbook(workbook,100);  
      in.close();

   //Получаем текст запроса и параметры его выгрузки в отчет (номер страницы и конец шапки)
   
   // int page = 1;
   for(int page = First_PAGE; page <= COUNT_PAGE ; page++)
       { 
       //Считаем колличество запросов для выгрузки на страницу     
        pst_param = FiveMinuteSinhro.InterfaceCon.prepareStatement("select (select max(to_number(REGEXP_REPLACE (rp.param, '[^0-9]'))) " +
                                     "         from  reports_params rp " +
                                     "         where rp.oid_REP_ID = a.id " +
                                     "         and rp.param like 'SQL%' " +
                                     "         and rp.subparam like 'PAGE_"+page +"'  " + 
                                     "         and rp.state = 'A' )            as COUNT_SQL  " + 
                                     " from dual, (select ? as id from dual)a");
        pst_param.setInt(1, v_REP_ID);
        resultSet = pst_param.executeQuery();
 

       int COUNT_SQL = 0;
      //Получаем шаблон
       while (resultSet.next()) 
        { 
           COUNT_SQL    = resultSet.getInt("COUNT_SQL") ;
        }
    
         pst_param.close();
         resultSet.close();     
           
    // System.out.println(COUNT_SQL);      
           
        int FIRST_ROW ;
        
         //открываем лист с шаблона
        XSSFSheet sheet1 = workbook.getSheetAt(page - 1);        
       //Пропускаем шапку
        FIRST_ROW = sheet1.getPhysicalNumberOfRows() - 1;
        // получаем строку листа excel файла
        XSSFRow row1 = sheet1.getRow(FIRST_ROW);
        // проходим по всем ячейкам этой строки
        // создаем массив стилей для ячейки
        XSSFCellStyle[] StyleArr = new XSSFCellStyle[row1.getPhysicalNumberOfCells()];
        
        for (int q = 0; q < row1.getPhysicalNumberOfCells(); q++) 
        {
            try
            {
             StyleArr[q] = row1.getCell(q).getCellStyle();
            }
           catch
              (Exception e) {
               StyleArr[q] = null;
               oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " Ошибка получения стиля ячейки ");
               System.out.println("Заказ "+v_PC_OPER_ID+ ", страница -"+page+  "Ошибка получения стиля ячейки  ");
             // e.printStackTrace();
             }
            
        } 
        

       	//Удаляем эту строку
	 sheet1.removeRow(row1);   // this only deletes all the cell values   
        //открываем лист с шаблона в потоке
         Sheet sheet = wb.getSheetAt(page - 1);
         
      //пишем название отчета
      /* XSSFRow row1 = sheet.createRow(0); 
       XSSFCell cell1 =  row1.createCell(0);
       cell1.setCellValue(REPORT_NAME); */
     
           // int nextCell = 0; //Номер поля
      int nextrow = FIRST_ROW ;// С какой строчки начать писать данные
      
    //Ходим в цикле по всем запросам поочереди и вынрибаем данные на страницу
      for(int SQL_next = 1; SQL_next <= COUNT_SQL ; SQL_next++)
       { 
     
           
    pst_param = FiveMinuteSinhro.InterfaceCon.prepareStatement( "select REPORTS_WORK.REPLACE_PARAM_BY_PC_OPER_ID( "+v_PC_OPER_ID+",REPORTS_WORK.GET_REPORT_PARAM(a.id,'SQL_"+SQL_next+"' ,'PAGE_"+page +"'),'SQL_PARAM') as SQL_TEXT " +
                                                          " from dual, (select ? as id from dual)a ");
    
    pst_param.setInt(1, v_REP_ID);
    resultSet = pst_param.executeQuery();
     
    String SQL_TEXT = null;
    String header_ = null;
    String FOOTER_ = null;
   //Получаем запрос
    while (resultSet.next()) 
     {
      SQL_TEXT     = resultSet.getString("SQL_TEXT");
       //  header_ = resultSet.getString("header_");
       //  FOOTER_= resultSet.getString("FOOTER_");
     }
    
      pst_param.close();
      resultSet.close();
 
      //ДОСТУП К ДАННЫМ ОТКРЫТИЕ ЗАПРОСА
      pst_param = Data_dase.prepareStatement(SQL_TEXT);
      oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " Открытие запроса, начало получения данных.");
      System.out.println("Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " Открытие запроса- "+SQL_next+", начало получения данных.");
      resultSet = pst_param.executeQuery();
    
      //определяем колличество полей в запросе
     long  ColumnCount = resultSet.getMetaData().getColumnCount();
     
     //Вставляем хедер 
   /*  if (header_ != null)
     {
      Row row = sheet.createRow(nextrow);  
      Cell cell =  row.createCell(1 );
      cell.setCellValue(header_);
      sheet.addMergedRegion(new CellRangeAddress(nextrow,nextrow,1,5));
      nextrow++;
      header_ = null;
     }*/
     
      
      //цикл по запросу данным для вывода в XLS
      while (resultSet.next())
       {
         
          String date;
          double date1;
          Timestamp date2;
          Row row;
      //-- Row row = sheet.createRow(nextrow);   
          // try
           // {
              row = sheet.createRow(nextrow); 
           // }
          // catch
            // (Exception e) {
          //     row = sheet.getRow(nextrow); 
           //  }
           
      
       //Перебираем поля запроса
        for(int column = 1; column < ColumnCount+1; column++)
         {
          // -- Cell cell =  row.createCell(column - 1 );
          
           Cell cell ;  
        //  try
         //   {
                cell =  row.createCell(column - 1 );
           /* }
           catch
             (Exception e) {
                 cell =  row.getCell(column - 1 );
             }  */
             
      
         
         //  System.out.println(resultSet.getMetaData().getColumnType(column));     
        
      //   System.out.println(resultSet.getMetaData().getScale(column));     
         
       //https://docs.oracle.com/javase/6/docs/api/InterfaceConstant-values.html#java.sql.Types.BIT
       //http://www.javaportal.ru/java/tutorial/tutorialJDBC/resultset.html
       //http://poi.apache.org/apidocs/org/apache/poi/xssf/usermodel/XSSFSheet.html
       //http://poi.apache.org/spreadsheet/quick-guide
       
       
       switch(resultSet.getMetaData().getColumnType(column)) {
             case 12: //varchar
               date = resultSet.getString(column);
               cell.setCellValue(date);
               cell.setCellStyle(StyleArr[column  - 1]);
               break;  
             case 2: //number
               date1 = resultSet.getDouble(column); 
               cell.setCellValue(date1);
               cell.setCellStyle(StyleArr[column  - 1]);
               break;    
             case 93: //TIMESTAMP
               date2 = resultSet.getTimestamp(column); 
               if (date2 != null)
                {
                 cell.setCellValue(date2);
                 cell.setCellStyle(StyleArr[column  - 1]);
                }
               break;  
             default:
               date = resultSet.getString(column);
               cell.setCellValue(date);
               cell.setCellStyle(StyleArr[column  - 1]);
               break; 

            }
       
         // System.out.println(nextrow++);
         // System.out.println(column);
          // System.out.println(resultSet.getMetaData().getColumnType(column));
          }
          nextrow++;
          

         if(nextrow%1000==0) {
            oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " выгружено-"+nextrow);
            System.out.println("Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " выгружено-"+nextrow);
          }    
       } 
       }
      pst_param.close();
      resultSet.close();
      oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " выгружена");
      System.out.println("Заказ "+v_PC_OPER_ID+ ", страница -"+page+  " выгружена");
     }
            
    in_blob = BLOB.createTemporary(FiveMinuteSinhro.InterfaceCon, true, BLOB.DURATION_SESSION);
     
    //Выходной Поток с блобом
    OutputStream out = in_blob.setBinaryStream(1);
     
   
    if (v_SAVE_BLOB == 0 )
     {
       //Получим путь сохранения отчета из файла CoNNECTIONS.TXT
       String FileSeveDir = null;
       FileSeveDir = OraConFile.getFileAliasInfo("FILESAVEDIR");
      
       // записываем созданный в памяти Excel документ в файл
        try (FileOutputStream out1 = new FileOutputStream(new File( FileSeveDir+FileName))) {
             wb.write(out1);
        } catch (IOException e1) {
          System.out.println("Ошибка создания файла!"+e1);   
        }
        System.out.println("Excel файл успешно создан!");
      }
     else
     {
      System.out.println(in_blob);
      //книгу пишем в выходной поток
       wb.write(out);
      }
      
    
        callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call  REPORTS_WORK.SET_REPORT_RESULT(?,?)}");
        callableStatement.setInt(1, v_PC_OPER_ID);
        callableStatement.setBlob(2, in_blob);
        callableStatement.executeQuery();
        FiveMinuteSinhro.InterfaceCon.commit();
        callableStatement.close();
        
          //Закрываем потоки и коннект
    in.close();
    out.close();
// } 
    
 //   pst_param1.close();
   // resultSet1.close();
    //InterfaceCon.close();
     Data_dase.close();
     Data_dase.close();
     oper_log.set_log(v_PC_OPER_ID,"Заказ "+v_PC_OPER_ID+ " - Отчет построен!");
     wb.dispose();
     
      System.out.println("Заказ "+v_PC_OPER_ID+ " - Отчет построен!"); 
      }
      
        //Сжимаем результат в ZIP файл
      if  (PAR_ZIP == 1)
      {
        ZipUtils.RepToZIP(v_PC_OPER_ID);  
      }
      
          
//  }
  //}

  } catch (Exception e) {     //Пишем статус  START
   
  //Перехватываем ошибки пишем в таблицу операций!!!!
 // try( Connection InterfaceCon = orcTST.GetConnSession())
  //   {
   // CallableStatement callableStatement;
    callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call  PC_OPER_WORK.PC_OPER_ERR (?, ?) }");
    callableStatement.setInt(1, v_PC_OPER_ID);
    callableStatement.setString(2, e.toString());
    callableStatement.executeUpdate();
    callableStatement.close();
    
    
  
    System.out.println("ERR !!!!!" +e.toString() );   
     //   JDBCTutorialUtilities.printSQLException(e);

    // }
  }
  finally 
  {
     // out.close();
      
   /*  if (pst_param1 != null) {
         pst_param1.close();
     }
     
     if (resultSet1 != null) {
         resultSet1.close();
     }*/     
   System.out.println("finaly");   
  }
}
}
 

