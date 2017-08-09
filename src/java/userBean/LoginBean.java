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

public class LoginBean extends HttpServlet {

    ResultSet rs;
    private String userName;
    private String userPass;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private int userId;
    private String email;
    private String password;
    private int emplOrgId;
    private String designation;
    private String department;
    private String role;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            userName = new String(request.getParameter("username").getBytes("ISO-8859-1"), "UTF-8");
            userPass = new String(request.getParameter("password").getBytes("ISO-8859-1"), "UTF-8");

            columnName = " * ";
            tableName = " employee_emp_org ";
            whereCondition = " user_name = '" + userName + "' and password = '" + userPass + "' ";;

            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            if (rs.next()) {
                userId = rs.getInt("employee_id");
                email = rs.getString("contact_email");
                password = rs.getString("password");
                emplOrgId = rs.getInt("employee_organogram_id");
                designation = rs.getString("designation");
                department = rs.getString("department");
                                
                if (department.equals("webadmin") && designation.equals("webadmin")) {
                    role = "webadmin";
                } else if (department.equals("frontdesk") && designation.equals("frontdesk")) {
                    role = "frontdesk";
                } else if (designation.equals("মহাপরিচালক") && department.equals("সকল")) {
                    role = "DG";
                } else if (designation.equals("কম্পিউটার অপারেটর")) {
                    role = "CTR";
                } else {
                    role = "employee";
                }
                switch(role){
                    case "webadmin" :{
                        response.sendRedirect("webAdmin/dashboard.jsp");
                        break;
                    }
                    case "frontdesk": {
                        response.sendRedirect("frontDesk/dashboard.jsp");
                        break;
                    }
                    case "DG": {
                        response.sendRedirect("director_general/dashboard.jsp");
                        break;
                    }
                    case "CTR": {
                        response.sendRedirect("ctr/dashboard.jsp");
                        break;
                    }
                    case "employee": {
                        response.sendRedirect("employee/dashboard.jsp");
                        break;
                    }
                }
            } else {
                String loginError = "<p class='alert-danger'>User Email or Password Incorrect</p>";
                request.getSession().setAttribute("message", loginError);
                response.sendRedirect("login.jsp");
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("idUser", userId);
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}