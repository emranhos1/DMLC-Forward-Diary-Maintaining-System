package userBean;

import dao.InsertQueryDao;
import dao.SelectQueryDao;
import dao.UpdateQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddReceivesDocument extends HttpServlet {

    private SimpleDateFormat dateFormate;
    private Date date;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet selectAcknowledgedUserName;
    private String acknowledgedByEmployeeUserName;
    private String forwardedToEmployeeUsername;
    private ResultSet selectForwardedUserName;
    private String goingToUserId;
    private String forwardingDateTime;
    private String letterId;
    private String status;
    private String priority;
    private boolean updateLetterTable;
    private String values;
    private boolean insertReceivesDocumentTable;
    private String columnName1;
    private String tableName1;
    private String whereCondition1;
    private String tableName2;
    private String whereCondition2;
    private String tableName3;
    private String columnName3;
    private String columnNameANDcolumnValue;
    private String acknowledgementDateTime;
    private String tableName4;
    private String columnName4;
    private ResultSet selectDocumentId;
    private int documentId;
    private String tableName5;
    private String columnName5;
    private String comment;
    private boolean insertCommentTable;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            goingToUserId = new String(request.getParameter("goingTo").getBytes("ISO-8859-1"), "UTF-8");
            letterId = new String(request.getParameter("letterId").getBytes("ISO-8859-1"), "UTF-8");
            comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
            status = "Active";
            priority = new String(request.getParameter("priority").getBytes("ISO-8859-1"), "UTF-8");

            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";

            selectAcknowledgedUserName = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (selectAcknowledgedUserName.next()) {
                acknowledgedByEmployeeUserName = selectAcknowledgedUserName.getString("user_name");
            }

            columnName1 = " user_name ";
            tableName1 = " employee ";
            whereCondition1 = " employee_id = '" + goingToUserId + "'";

            selectForwardedUserName = SelectQueryDao.selectQueryWithWhereClause(columnName1, tableName1, whereCondition1);

            while (selectForwardedUserName.next()) {
                forwardedToEmployeeUsername = selectForwardedUserName.getString("user_name");
            }

            forwardingDateTime = dateFormate.format(date);

            columnNameANDcolumnValue = " current_status = 2, priority = '" + priority + "' ";
            tableName2 = " letter ";
            whereCondition2 = " letter_id = '" + letterId + "'";
            updateLetterTable = UpdateQueryDao.updateQueryWithWhereClause(tableName2, columnNameANDcolumnValue, whereCondition2);

            tableName3 = " receives_document ";
            columnName3 = " forwarding_date_time, forwarded_to_employee_username, acknowledged_by_employee_username, employee_id, letter_id, status ";
            values = " '" + forwardingDateTime + "', '" + forwardedToEmployeeUsername + "', '" + acknowledgedByEmployeeUserName + "', '" + goingToUserId + "', '" + letterId + "', '" + status + "' ";
            insertReceivesDocumentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName3, columnName3, values);

            tableName4 = " letter ";
            columnName4 = " document_id ";
            whereCondition = " letter_id = '" + letterId + "'";
            selectDocumentId = SelectQueryDao.selectQueryWithWhereClause(columnName4, tableName4, whereCondition);
            while (selectDocumentId.next()) {
                documentId = selectDocumentId.getInt("document_id");
            }

            tableName5 = " comments_on ";
            columnName5 = " comment, employee_name, date_time, document_id, employee_id ";
            values = " '" + comment + "', '" + acknowledgedByEmployeeUserName + "', '" + forwardingDateTime + "', '" + documentId + "', '" + userId + "'";
            insertCommentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName5, columnName5, values);

            if (updateLetterTable) {
                if (insertReceivesDocumentTable) {
                    if (insertCommentTable) {
                        String sendDocSuccess = "<p class='alert-info'>নথি সফলভাবে পাঠানো হয়</p>";
                        request.getSession().setAttribute("sendDocInfo", sendDocSuccess);
                        response.sendRedirect("director_general/allNewDocument.jsp");
                    } else {
                        String sendDocError = "<p class='alert-info'>নথি পাঠানো হয় না</p>";
                        request.getSession().setAttribute("sendDocInfo", sendDocError);
                        response.sendRedirect("director_general/allNewDocument.jsp");
                    }
                } else {
                    String sendDocError = "<p class='alert-info'>নথি পাঠানো হয় না</p>";
                    request.getSession().setAttribute("sendDocInfo", sendDocError);
                    response.sendRedirect("director_general/allNewDocument.jsp");
                }
            } else {
                String sendDocError = "<p class='alert-info'>নথি পাঠানো হয় না</p>";
                request.getSession().setAttribute("sendDocInfo", sendDocError);
                response.sendRedirect("director_general/allNewDocument.jsp");
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddReceivesDocument</title>");
            out.println("</head>");
            out.println("<body>");
            out.println(userId + "</br>");
            out.println(goingToUserId + "</br>");
            out.println(letterId + "</br>");
            out.println(priority + "</br>");
            out.println(acknowledgedByEmployeeUserName + "</br>");
            out.println(forwardedToEmployeeUsername + "</br>");
            out.println(forwardingDateTime + "</br>");
            out.println(comment + "</br>");
            out.println(documentId + "</br>");

            out.println("<h1>Servlet AddReceivesDocument at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException ex) {
            Logger.getLogger(AddReceivesDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
