package MailPack;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class MailParser {
    
    public String[] read(String file) throws FileNotFoundException{ 
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
        String test1 = sb.toString();
        String delims = ",";
        String[] tokens = test1.split(delims);
        return tokens;
    }
}
