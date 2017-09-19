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

public class AddResDocForRmp extends HttpServlet {

    private String documentId;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet selectLetterId;
    private int letterId;
    private ResultSet selectParentId;
    private int currentWorkEmpId;
    private String currentWorkEmp;
    private String comingFromEmp;
    private String values;
    private String status;
    private SimpleDateFormat dateFormat;
    private Date date;
    private String sendingDate;
    private boolean addResDocTable;
    private String columnNameANDcolumnValue;
    private boolean updateResDocTable;
    private String fileName;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            documentId = request.getParameter("documentId");

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();
            sendingDate = dateFormat.format(date);

            columnName = " * ";
            tableName = " letter ";
            whereCondition = " document_id = '" + documentId + "' ";
            selectLetterId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectLetterId.next()) {
                letterId = selectLetterId.getInt("letter_id");
            }

            columnName = " * ";
            tableName = " response_document ";
            whereCondition = " current_working_employee_id = '"+userId+"' and document_id = '" + documentId + "' ";
            selectLetterId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectLetterId.next()) {
                fileName = selectLetterId.getString("response_file");
            }
            
            tableName = " receives_document ";
            whereCondition = " letter_id = '" + letterId + "' and forwarded_to_employee_id = '" + userId + "' ";
            selectParentId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectParentId.next()) {
                currentWorkEmpId = selectParentId.getInt("acknowledged_by_employee_id");
                currentWorkEmp = selectParentId.getString("acknowledged_by_employee_username");
                comingFromEmp = selectParentId.getString("forwarded_to_employee_username");
            }

            status = "Active";
            tableName = " response_document ";
            columnName = " current_working_employee_id, current_working_employee_username, coming_from_employee_id, coming_from_employee_username, document_id, response_file, status, sending_date";
            values = " '" + currentWorkEmpId + "', '" + currentWorkEmp + "', '" + userId + "', '" + comingFromEmp + "', '" + documentId + "', '" + fileName + "', '" + status + "', '" + sendingDate + "' ";
            System.out.println(userId);
            System.out.println(documentId);
            System.out.println(fileName);
            addResDocTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            tableName = "response_document ";
            columnNameANDcolumnValue = " status = 'Inactive' ";
            whereCondition = " current_working_employee_id ='" + userId + "' and document_id = '" + documentId + "' ";
            updateResDocTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);

            if (addResDocTable) {
                if (updateResDocTable) {
                    String sendDocSuccess = "<p class='alert-info'>নথি সফলভাবে পাঠানো হয়েছে</p>";
                    request.getSession().setAttribute("message", sendDocSuccess);
                    response.sendRedirect("employee/allReturnWork.jsp");
                } else {
                    String sendDocError = "<p class='alert-info'>নথিটি সফলভাবে পাঠানো হয় নি</p>";
                    request.getSession().setAttribute("message", sendDocError);
                    response.sendRedirect("employee/allReturnWork.jsp");
                }
            } else {
                String sendDocError = "<p class='alert-info'>নথিটি সফলভাবে পাঠানো হয় নি</p>";
                request.getSession().setAttribute("message", sendDocError);
                response.sendRedirect("employee/allReturnWork.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddResDocForRmp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
