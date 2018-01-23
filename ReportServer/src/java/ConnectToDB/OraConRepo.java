package ConnectToDB;
 
public class OraConRepo extends OracleDBConnection {
            private static String setURL = "jdbc:oracle:";
            private static String setUser = "";
            private static String setPassword = "";

    public OraConRepo() {
        super(setURL, setUser, setPassword);
    } 
}
