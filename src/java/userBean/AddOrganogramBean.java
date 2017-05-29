package userBean;

import dao.InsertQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddOrganogramBean extends HttpServlet {

    private String designation;
    private String depertment;
    private String tableName;
    private String columnName;
    private String values;
    private boolean addOrganogram;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            designation = new String(request.getParameter("designation").getBytes("ISO-8859-1"), "UTF-8");
            depertment = new String(request.getParameter("depertment").getBytes("ISO-8859-1"), "UTF-8");

            System.out.println("designation : " + designation);
            System.out.println("depertment : " + depertment);

            tableName = " employee_organogram ";
            columnName = " designation, department ";
            values = "'" + designation + "'," + "'" + depertment + "'";
            addOrganogram = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            if(addOrganogram){
                String addOrgSuccess = "<p class='alert-info'>org insert</p>";
                request.getSession().setAttribute("addOrgInfo", addOrgSuccess);
                response.sendRedirect("webAdmin/addOrganogram.jsp");
            } else {
                String addOrgError = "<p class='alert-info'>error to org insert</p>";
                request.getSession().setAttribute("addOrgInfo", addOrgError);
                response.sendRedirect("webAdmin/addOrganogram.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddOrganogramBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
