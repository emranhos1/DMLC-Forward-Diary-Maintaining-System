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

public class AllNewWorkEmp extends HttpServlet {
    
    private int i;
    private String userId;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs;
    private int dataRow;
    private int[] currentStatus;
    private String[] depOfOrigin;
    private String[] requestId;
    private String[] subjectOfLetter;
    private String[] endDate;
    private String[] shortDesc;
    private String[] scanFile;
    private int[] priority;
    private int[] comTemployeeId;
    private String[] comment;
    private String[] employeeName;
    private String[] dateTime;
    private String prioritys;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            i = 0;
            
            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();
            
            columnName = "*";
            tableName = " letter_comments_on_receives_document ";
            whereCondition = " recdocTemployee_id = '"+userId+"'";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            rs.last();
            dataRow = rs.getRow();
            currentStatus = new int[dataRow];
            depOfOrigin = new String[dataRow];
            requestId = new String[dataRow];
            subjectOfLetter = new String[dataRow];
            endDate = new String[dataRow];
            shortDesc = new String[dataRow];
            scanFile = new String[dataRow];
            priority = new int[dataRow];
            comTemployeeId = new int[dataRow];
            comment = new String[dataRow];
            employeeName = new String[dataRow];
            dateTime = new String[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                currentStatus[i] = rs.getInt("current_status");
                depOfOrigin[i] = rs.getString("department_of_origin");
                requestId[i] = rs.getString("request_id");
                subjectOfLetter[i] = rs.getString("subject_of_letter");
                endDate[i] = rs.getString("end_date");
                shortDesc[i] = rs.getString("short_desc");
                scanFile[i] = rs.getString("scan_file");
                priority[i] = rs.getInt("priority");
                comTemployeeId[i] = rs.getInt("comTemployee_id");
                comment[i] = rs.getString("comment");
                employeeName[i] = rs.getString("employee_name");
                dateTime[i] = rs.getString("date_time");
                i++;
            }

            for(i = 0; i < dataRow; i++){
                if(priority[i] ==1){
                    prioritys = "উচ্চ";
                }
                else if(priority[i] ==2){
                    prioritys = "মাঝারি";
                }
                else if(priority[i] ==3){
                    prioritys = "নিন্ম";
                }
            
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td>"
                        + "<td>" + depOfOrigin[i] + "</td>"
                        + "<td>" + subjectOfLetter[i] + "</td>"
                        + "<td>" + endDate[i] + "</td>"
                        + "<td>" + shortDesc[i] + "</td>"
                        + "<td>" + prioritys + "</td>"
                        + "<td><img src='../Uplopded_file/" + scanFile[i] + "' alt='এই ফাইলটি লোড করা যাচ্ছেনা' height='500px' width='500px'/></td>"
                        + "<td><button class='btn btn-success'>"
                        + "<a data-toggle='modal' data-currentstatus='"+currentStatus[i]+"' data-depoforigin='" + depOfOrigin[i] + "' data-requestid='"+requestId[i]+"' data-subjectofletter='" + subjectOfLetter[i] + "' data-enddate='" + endDate[i] + "' data-shortdesc='" + shortDesc[i] + "' data-prioritys='" + prioritys + "' data-scanfile='" + scanFile[i] + "' data-comtemployeeid='"+comTemployeeId[i]+"' data-comment='"+comment[i]+"' class='open-spceDialog' href='#addSpec' >মন্তব্য করুন ও পাঠান</a>"
                        + "</button>"
                        + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllNewWorkEmp.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
