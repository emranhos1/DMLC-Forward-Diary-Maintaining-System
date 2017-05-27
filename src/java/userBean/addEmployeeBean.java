package userBean;

import java.io.IOException;
import java.io.PrintWriter;
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
    private int empOrgId;
    private int status;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            uName = request.getParameter("uName");
            password = request.getParameter("password");
            fullName = request.getParameter("fullName");
            address = request.getParameter("address");
            cellNo = request.getParameter("cellNo");
            email = request.getParameter("email");
            task = request.getParameter("task");
            empOrgId = Integer.parseInt(request.getParameter("empOrgId"));
            status = Integer.parseInt(request.getParameter("status"));
            
            System.out.println(uName+"<br/>"+password+"<br/>"+fullName+"<br/>"+address+"<br/>"+cellNo+"<br/>"+email+"<br/>"+task+"<br/>"+empOrgId+"<br/>"+status);
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
        }
    }
}
