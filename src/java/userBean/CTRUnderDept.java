package userBean;

import dao.SelectQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CTRUnderDept extends HttpServlet {

    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int empOrgId;
    private String designation;
    private String department;
    private int parent;
    private int CTRempOrgId;
    private int CTRemployeeId;
    private String CTRuserName;
    private String CTRfullName;
    private String CTRdesignation;
    private String CTRdepartment;

    protected void getCTR() throws SQLException {

        columnName = " * ";
        tableName = " employee_organogram ";
        whereCondition = " employee_organogram_id = '" + empOrgId + "'";
        rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

        System.out.println(empOrgId + "  2");
        while (rs.next()) {
            designation = rs.getString("designation");
            department = rs.getString("department");
            parent = rs.getInt("parent_id");
        }
        switch (designation) {
            case "পরিচালক": {

                break;
            }
            default: {
                empOrgId = parent;
                System.out.println(empOrgId + " 3");
                getCTR();
                break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            columnName = " * ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (rs.next()) {
                empOrgId = rs.getInt("employee_organogram_id");
            }
            System.out.println(empOrgId + " 1");
            getCTR();

            System.out.println(designation);
            System.out.println(department);

            columnName = " * ";
            tableName = " employee_emp_org ";
            whereCondition = " department = '" + department + "' and designation = 'কম্পিউটার অপারেটর'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (rs.next()) {
                CTRemployeeId = rs.getInt("employee_id");
                CTRempOrgId = rs.getInt("employee_organogram_id");
                CTRuserName = rs.getString("user_name");
                CTRfullName = rs.getString("full_name");
                CTRdesignation = rs.getString("designation");
                CTRdepartment = rs.getString("department");
            }

            response.setContentType("text/plain");
            response.getWriter().write("<option value='" + CTRemployeeId + "'>'" + CTRuserName + "' : '" + CTRdesignation + "' ('" + CTRdepartment + "')</option>");      
        } catch (SQLException ex) {
            Logger.getLogger(CTRUnderDept.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
