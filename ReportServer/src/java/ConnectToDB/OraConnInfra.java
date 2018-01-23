package ConnectToDB;

public class OraConnInfra extends OracleDBConnection {
            private static String setURL = "jdbc:oracle:thin:@";
            private static String setUser = "";
            private static String setPassword = "";

    public OraConnInfra() {
        super(setURL, setUser, setPassword);
    }
}
