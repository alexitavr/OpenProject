package ReportPack;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.pool.OracleDataSource;

public class OracleDBConnection {
    public static String CACHE_NAME                  = "OraCacheWebCQ";
    public OracleDataSource ods                      = null;
    public Connection dbConnection                   = null;
    public ResultSet rs                              = null;
    public PreparedStatement preparedStatement       = null; 
    private String setURL;
    private String setUser;
    private String setPassword;

    public OracleDBConnection(String setURL, String setUser, String setPassword){
            this.setURL = setURL;
            this.setUser = setUser;
            this.setPassword = setPassword;
    } 
    
    private void getDBConnection() {
        try {
            ods = new OracleDataSource();
            ods.setURL(setURL);
            ods.setUser(setUser);
            ods.setPassword(setPassword);
            ods.setConnectionCacheName(CACHE_NAME);
        } catch (SQLException ex) {
            Logger.getLogger(OracleDBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection GetConnSession() throws SQLException{
        if(dbConnection == null) {
            getDBConnection();
        }
        System.out.println("Connect to oracle is sucsess");
        return ods.getConnection();
    }
          
    public void close() throws Exception {
        
	if (dbConnection != null) {
            try {
            rs.close(); 
            dbConnection.close(); 
            }catch (Exception e) {
            System.out.println("Problem in closing oracle connection: " + e.getMessage());
            }
        ods = null;
        }
        System.out.println("Connect close");
    }
}
