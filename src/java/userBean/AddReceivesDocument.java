package userBean;

import dao.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class AddReceivesDocument extends HttpServlet {
    
    private SimpleDateFormat dateFormate;
    private Date date;
    private String userId;
    private String goingToUserId;
    private String letterId;
    private String comment;
    private String status;
    private String priority;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet selectAcknowledgedUserName;
    private String acknowledgedByEmployeeUserName;
    private ResultSet selectForwardedUserName;
    private String forwardedToEmployeeUsername;
    private String forwardingDateTime;
    private String columnNameANDcolumnValue;
    private boolean updateLetterTable;
    private String values;
    private boolean insertReceivesDocumentTable;
    private ResultSet selectDocumentId;
    private int documentId;
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

            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + goingToUserId + "'";

            selectForwardedUserName = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            while (selectForwardedUserName.next()) {
                forwardedToEmployeeUsername = selectForwardedUserName.getString("user_name");
            }

            forwardingDateTime = dateFormate.format(date);

            columnNameANDcolumnValue = " current_status = 2, priority = '" + priority + "' ";
            tableName = " letter ";
            whereCondition = " letter_id = '" + letterId + "'";
            updateLetterTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

            tableName = " receives_document ";
            columnName = " forwarding_date_time, forwarded_to_employee_username, acknowledged_by_employee_username, employee_id, letter_id, status ";
            values = " '" + forwardingDateTime + "', '" + forwardedToEmployeeUsername + "', '" + acknowledgedByEmployeeUserName + "', '" + goingToUserId + "', '" + letterId + "', '" + status + "' ";
            insertReceivesDocumentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            tableName = " letter ";
            columnName = " document_id ";
            whereCondition = " letter_id = '" + letterId + "'";
            selectDocumentId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectDocumentId.next()) {
                documentId = selectDocumentId.getInt("document_id");
            }

            tableName = " comments_on ";
            columnName = " comment, employee_name, date_time, document_id, employee_id ";
            values = " '" + comment + "', '" + acknowledgedByEmployeeUserName + "', '" + forwardingDateTime + "', '" + documentId + "', '" + userId + "'";
            insertCommentTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

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
        } catch (SQLException ex) {
            Logger.getLogger(AddReceivesDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
