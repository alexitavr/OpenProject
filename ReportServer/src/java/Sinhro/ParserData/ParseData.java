package Sinhro.ParserData;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDate;

public class ParseData {
    
        public boolean read(String file) throws FileNotFoundException{ 
        LocalDate date = LocalDate.now();
        StringBuilder sb = new StringBuilder();
        File reader = new File(file);
        try {
            BufferedReader in = new BufferedReader(new FileReader(reader.getAbsoluteFile()));
            try {
                String s;
                while ((s = in.readLine()) != null) {
                sb.append(s);
                }
            } finally {
                in.close();
            }
        } catch (IOException e) {
            System.out.println(e);
       }
        String dta = Integer.toString(date.getMonthValue())+"."+ Integer.toString(date.getDayOfMonth());
        String test1 = sb.toString();
        String delims = ",";
        String[] tokens = test1.split(delims);
        for (int i = 0; i < tokens.length; i++){
        if (dta.equals(tokens[i])){return false;}
        }
        return true;
    }  
}
