/**
 *
 * @author Md. Emran Hossain
 */
package dao;

import dbConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteQueryDao {

    static DBConnection db = new DBConnection();
    static Connection con;
    static ResultSet rs;
    static PreparedStatement pstm;

    public static boolean deleteQueryWithWhereClause(String tableName, String whereCondition) throws SQLException {

        con = db.myConn();
        pstm = con.prepareStatement("Delete from " + tableName + " where " + whereCondition);
        pstm.executeUpdate();
        pstm.close();
        return true;
    }
}
