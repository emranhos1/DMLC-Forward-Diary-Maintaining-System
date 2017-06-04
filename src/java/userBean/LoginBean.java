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

public class LoginBean extends HttpServlet {

    ResultSet rs;
    private String userEmail;
    private String userPass;
    private String columnName;
    private String tableName;
    private int userId;
    private String email;
    private String password;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            userEmail = request.getParameter("email");
            userPass = request.getParameter("password");
            
            columnName =" * ";
            tableName =" employee ";
            
            rs = SelectQueryDao.selectQueryWithOutWhereClause(columnName, tableName);
            if (rs.next()) {
//                userType = rs.getString("type");
                userId = rs.getInt("employee_id");
                email = rs.getString("contact_email");
                password = rs.getString("password");

//                switch (userType) {
//                    case "Purchaser": {
//                        String loginSuccess = "<p><h3 class='alert-info'>Login Successful</h3></p>";
//                        request.getSession().setAttribute("loginSuccess", loginSuccess);
//                        response.sendRedirect("purchaser/purchaser.jsp");
//                        break;
//                    }
//                    case "Supplier": {
//                        String loginSuccess = "<p><h3 class='alert-info'>Login Successful</h3></p>";
//                        request.getSession().setAttribute("loginSuccess", loginSuccess);
//                        response.sendRedirect("supplier/supplier.jsp");
//                        break;
//                    }
                }
            
        } catch (SQLException ex) {
            Logger.getLogger(LoginBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
