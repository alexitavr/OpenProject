package Sinhro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import ConnectToDB.DB2Connection;
import ConnectToDB.OraConRepo;
import ConnectToDB.OraConnInfra;

public class InfraSinc {
    
    private final DB2Connection dbco = new DB2Connection(); 
    private OraConnInfra orci = new OraConnInfra();
    private ResultSet res = null;  
    private OraConRepo orc = new OraConRepo();
    private PreparedStatement preparedStatement = null;
    private PreparedStatement preparedStatementDB2 = null;
    
        public void updateInfraSinc() throws Exception{
        String bank_update_select = "select  SN, substr((CITY_NAME||','||INITCAP(USTREET)||' '||DOM), 1, 40),"
                + " X, Y, PC_REF from INFRA.ATM_M3_VW where PC_REF is not null";
        Connection orcis = orci.GetConnSession();
        Connection orcs = orc.GetConnSession();
        Connection db2 = dbco.connect();
        Statement st = orcis.createStatement();
        orcs.setAutoCommit(true);
        db2.setAutoCommit(true);
        preparedStatementDB2 = db2.prepareStatement("update MPTECH.RONDO set SERIAL_NUM = ?, "
                + "ATMPOST = ? where ATMLUNO = ?");
        preparedStatement = orcs.prepareStatement("update RONDO set SERIAL_NUM = ?, ATMPOST = ?,"
                + " X = ?, Y = ? Where substr(ATMLUNO,6,9) = ?");
        res = st.executeQuery(bank_update_select);
        while (res.next()) {  
        preparedStatement.setString(1, res.getString(1));
        preparedStatement.setString(2, res.getString(2));
        preparedStatement.setDouble(3, res.getDouble(3));
        preparedStatement.setDouble(4, res.getDouble(4));
        preparedStatement.setString(5, res.getString(5));
        preparedStatement.executeUpdate();
        preparedStatement.clearParameters();
        preparedStatementDB2.setString(1, res.getString(1));
        preparedStatementDB2.setString(2, res.getString(2));
        preparedStatementDB2.setString(3, "00000"+res.getString(5));
        preparedStatementDB2.executeUpdate();  
        preparedStatementDB2.clearParameters();
        }
        System.out.println("Update Sinhro прошел успешно");
        orcs.close();
        orcis.close();
        db2.close();
       }  
    
}
