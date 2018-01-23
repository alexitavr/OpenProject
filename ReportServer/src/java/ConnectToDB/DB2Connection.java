
package ConnectToDB;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import com.ibm.db2.jcc.DB2Driver;

public class DB2Connection {
	public Connection connection = null;
	public ResultSet  resultset  = null;
        public Statement  statement  = null;
        
public Connection connect() throws Exception {
	Driver driver = new DB2Driver();
        DriverManager.registerDriver(driver);
	System.out.println("Driver Loaded Successfully ...");
	connection = DriverManager.getConnection("jdbc:db2://", );
		if (connection == null)	{
                    System.out.println("connection failed");
		}
		connection.setAutoCommit(true);
		System.out.println("Successfully Connected to DB2...");
                return connection;
	}
	
        public void close () throws Exception {
            if (connection != null)	{
                try {
                connection.close();
                }catch (Exception e) {
                System.out.println("Problem in closing DB2 connection: " + e.getMessage());
            }
	connection = null;
	}
    }
}
