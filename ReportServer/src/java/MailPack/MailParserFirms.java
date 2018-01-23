package MailPack;

import ConnectToDB.OraConRepo;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MailParserFirms {
    private OraConRepo orc = new OraConRepo();
    private String request;
    
    public void SetRequest(String snum) throws SQLException{
        Connection orcs = orc.GetConnSession();
        orcs.setAutoCommit(true);
        Statement statement = orcs.createStatement();
        ResultSet ress = statement.executeQuery("Select E_MAIL from SRVFIRM where NAME_SHORT like '%"+snum+"%'");
        while(ress.next()){
        request = ress.getString(1);
        }
    }    
    
    public String[] read() throws FileNotFoundException{ 
        String delims = ";";
        String[] tokens = request.split(delims);
        return tokens;
    }
}

    

