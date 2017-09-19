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

public class AllReturnWorkForEmp extends HttpServlet {

    private int i;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int dataRow;
    private String[] responseFile;
    private String[] sendingDate;
    private int[] documentId;
    private String[] currentWorkEmp;
    private String[] status;
    private int empOrgId;
    private int parentId;
    private String department;
    private int designation;
    private int[] currentWorkEmpId;
    private String[] comingFromEmp;
    private int[] comingFromEmpId;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            i = 0;
            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();
            columnName = " * ";
//            getParentid();
            
            tableName = " response_document ";
            whereCondition = " current_working_employee_id = '" + userId + "' and status = 'Active' ";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            
            rs.last();
            dataRow = rs.getRow();
            currentWorkEmp = new String[dataRow];
            currentWorkEmpId = new int[dataRow];
            comingFromEmp = new String[dataRow];
            comingFromEmpId = new int[dataRow];
            documentId = new int[dataRow];
            responseFile = new String[dataRow];
            status = new String[dataRow];
            sendingDate = new String[dataRow];
            rs.beforeFirst();
            
            while (rs.next()) {
                currentWorkEmp[i] = rs.getString("current_working_employee_username");
                currentWorkEmpId[i] = rs.getInt("current_working_employee_id");
                comingFromEmp[i] = rs.getString("coming_from_employee_username");
                comingFromEmpId[i] = rs.getInt("coming_from_employee_id");
                documentId[i] = rs.getInt("document_id");
                responseFile[i] = rs.getString("response_file");
                status[i] = rs.getString("status");
                sendingDate[i] = rs.getString("sending_date");
                i++;
            }

            for (i = 0; i < dataRow; i++) {
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td>"
                        + "<td>" + sendingDate[i] + "</td>"
                        + "<td width ='200px'><a href= 'http://localhost:8080/DMLC/Uplopded_file_return/" + responseFile[i] + "' target ='_blank' ><img src='../Uplopded_file_return/" + responseFile[i] + "' alt='এই ফাইলটি লোড করা যাচ্ছেনা ক্লিক করুন এবং দেখুন' height='auto' width='100%'/></a>"
                        + "</td>"
                        + "<td>"
                        + "<button class='btn btn-success'>"
                        + "<a data-toggle='modal' data-documentid='" + documentId[i] + "' data-scanfile='" + responseFile[i] + "' class='open-spceDialog-send-parent' href='#addSpecToParent' >ঊর্ধ্বতন কর্মকর্তার কাছে পাঠান</a>"
                        + "</button><br/><br/>"
                        + "<button class='btn btn-success'>"
                        + "<a data-toggle='modal' data-documentid='" + documentId[i] + "' data-scanfile='" + responseFile[i] + "' class='open-spceDialog-send-ctr' href='#addSpecToCTR' >CTR এর কাছে ফেরত পাঠান</a>"
                        + "</button><br/>"
                        + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllReturnWorkForEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

//    protected void getParentid() throws SQLException {
//        
//        tableName = " employee ";
//        whereCondition = " employee_id = '" + userId + "' ";
//        rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
//
//        while (rs.next()) {
//            userName = rs.getString("user_name");
//            empOrgId = rs.getInt("employee_organogram_id");
//        }
//        
//        tableName = " employee_organogram ";
//        whereCondition = " employee_organogram_id = '" + empOrgId + "' ";
//        rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
//        
//        while(rs.next()){
//            parentId = rs.getInt("parent_id");
//            department = rs.getString("department");
//        }
//        
//        tableName = " employee_organogram ";
//        whereCondition = " employee_organogram_id = '" + parentId + "' ";
//        rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
//        
//        while(rs.next()){
//            designation = rs.getInt("designation");
//            department =rs.getString("department");
//        }
//    }
}
