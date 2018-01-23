package ConnectToDB;

import TimerPackSinhro.FiveMinuteSinhro;
import java.io.*;

//import static FiveMinuteSinhro.InterfaceCon;
import java.io.File;
import java.io.FileInputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.internal.runners.TestClass;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Marchenkods
 */

public class OraConFile {

       
public static Connection get_connect_from_file(String con_name) throws Throwable/*throws Exception*/ {
       
        Class.forName("oracle.jdbc.driver.OracleDriver"); 
       
       String AliasInfo = null;
       String con = null;
       String user = null;
       String pass = null;
        
     AliasInfo = getFileAliasInfo(con_name);
        
        
              String[] words1 = AliasInfo.split("/");
                 con = words1[0];
                 user = words1[1];
                 pass = words1[2];
                 
            Connection connection = null;
        try {
            //jdbc:oracle:thin:@10.82.252.31:1521:WEBS
            connection = DriverManager.getConnection("jdbc:oracle:thin:@".concat(con),user,pass );
        } catch (SQLException e) {
            System.out.println("Connection error!"+e);
      /*      CallableStatement callableStatement = FiveMinuteSinhro.InterfaceCon.prepareCall("{call  PC_OPER_WORK.PC_OPER_ERR (?, ?) }");
            callableStatement.setInt(1, v_PC_OPER_ID);
            callableStatement.setString(2, e.toString());
            callableStatement.executeUpdate();
            callableStatement.close();*/
        }
 
        if (connection != null) {
            System.out.println("Алиас из файла "+(con_name)+" Получен новый коннект к базе ORACLE ".concat(connection.toString()));
        } else {
            System.out.println("Connection error! Название коннекта либо параметры не верны ".concat(con_name));
        } 
        
      return  connection ;
   }
   
public static  String getFileAliasInfo(String con_name ) throws Throwable/*throws Exception*/ 
{
  String dirPath =   getIniFilePath();          
//try {
        String searchWord = con_name; // искомый коннект 
      //  String[] Con_par = null;
      //  String con = null;
     //   String user = null;
     //   String pass = null;
        byte[] content;
       try (FileInputStream fis = new FileInputStream(new File(dirPath+ "REPORTSERVER.INI")) // путь заменить на нужный
       ) {
           content = new byte[fis.available()];
           fis.read(content) ;
        }
        String[] lines = new String(content, "Cp1251").split("\n"); 
      //  int i = 1;
        for (String line : lines) {
            String[] words = line.split("=");

             if (words[0].equalsIgnoreCase(searchWord)) {  
                 
                  return words[1];
               /*  String[] words1 = words[1].split("/");
                 i_con = words1[0];
                 i_user = words1[1];
                 i_pass = words1[2];*/
                }
        } 
    return null;
}

public static  String getIniFilePath() throws Throwable/*throws Exception*/ 
{
      //Получаем абсолютный путь запущенного приложения 
      String myJarPath = TestClass.class.getProtectionDomain().getCodeSource().getLocation().getPath();
      String dirPath = new File(myJarPath).getParent();
      dirPath = dirPath.replaceAll("lib","");
      System.out.println("Путь запущенного приложения " +dirPath);
   
      return dirPath;
          
}
}
   
