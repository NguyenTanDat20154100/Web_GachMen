package database;

import java.sql.*;

public class ConnectDB {
    static Connection con;
    public static PreparedStatement connect(String sql) throws SQLException, ClassNotFoundException {
        if (con == null || con.isClosed()) {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gachmen_shop", "root", "");
            return con.prepareStatement(sql);
        } else {
            return con.prepareStatement(sql);
        }
    }
}
