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

public class FindMainDepartment extends HttpServlet {
    
    ResultSet rs;
    private String keyword;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private String designation;
    private String department;
    private String employee_organogram_id;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UFT-8");
            keyword = new String(request.getParameter("keyword").getBytes("ISO-8859-1"), "UTF-8");
            System.out.println(keyword);
            columnName = "*";
            tableName = "employee_organogram";
            whereCondition =" designation like '%"+keyword+"%' or department like '%"+keyword+"%' ";
            
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while(rs.next()){
                employee_organogram_id = rs.getString("employee_organogram_id");
                designation = rs.getString("designation");
                department = rs.getString("department");
                response.setContentType("text/plain");
                response.getWriter().write("<p onClick='selectGroup(this)' empOrgId='"+employee_organogram_id+"' data-val='"+ designation +"'>" + designation + "('"+department+"')</p>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FindMainDepartment.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
