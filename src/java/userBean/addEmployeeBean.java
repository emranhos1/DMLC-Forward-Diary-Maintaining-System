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

public class addEmployeeBean extends HttpServlet {
    private String uName;
    private String password;
    private String fullName;
    private String address;
    private String cellNo;
    private String email;
    private String task;
    private String empOrgId;
    private String status;
    private String tableName;
    private String columnName;
    private String values;
    private boolean addEmployee;
    private String numCompleatedTask;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            uName = new String(request.getParameter("uName").getBytes("ISO-8859-1"), "UTF-8");
            password = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");
            fullName = new String(request.getParameter("fullName").getBytes("ISO-8859-1"), "UTF-8");
            address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
            cellNo = new String(request.getParameter("cellNo").getBytes("ISO-8859-1"), "UTF-8");
            email = new String(request.getParameter("email").getBytes("ISO-8859-1"), "UTF-8");
            task = new String(request.getParameter("task").getBytes("ISO-8859-1"), "UTF-8");
            status = new String(request.getParameter("status").getBytes("ISO-8859-1"), "UTF-8");
            empOrgId = new String(request.getParameter("empOrgId").getBytes("ISO-8859-1"), "UTF-8");
            
            tableName =" employee ";
            columnName =" user_name, password, full_name, contact_info, contact_cell, contact_email, num_compleated_task, is_active, employee_organogram_id ";
            values ="'"+uName+"', "+"'"+password+"', "+"'"+fullName+"', "+"'"+address+"', "+"'"+cellNo+"', "+"'"+email+"',"+"'"+task+"',"+"'"+status+"',"+"'"+empOrgId+"'";
            addEmployee = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);
            
            if(!addEmployee){
                String addEmpSuccess = "<p class='alert-info'>নতুন কর্মচারী তালিকায় অন্তর্ভুক্ত করা হয়েছে</p>";
                request.getSession().setAttribute("addEmpInfo", addEmpSuccess);
                response.sendRedirect("webAdmin/addEmployee.jsp");
            } else{
                String addEmpError = "<p class='alert-info'>নতুন কর্মচারী তালিকায় অন্তর্ভুক্ত করা হয়নি</p>";
                request.getSession().setAttribute("addEmpInfo", addEmpError);
                response.sendRedirect("webAdmin/addEmployee.jsp");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addEmployeeBean</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addEmployeeBean at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(addEmployeeBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
