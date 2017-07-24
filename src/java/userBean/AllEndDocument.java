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

public class AllEndDocument extends HttpServlet {

    private int i;
    private String columnName;
    private String tableName;
    private String whereCondition;
    private ResultSet rs ;
    private int dataRow;
    private String[] letterId;
    private int[] currentStatus;
    private String[] receivingDate;
    private String[] depOfOrigin;
    private String[] requestId;
    private String[] subjectOfLetter;
    private String[] endDate;
    private int[] documentId;
    private String[] shortDesc;
    private String[] scanFile;
    private String[] priority;
    private String status;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            i = 0;
            columnName = "*";
            tableName = " letter ";
            whereCondition = " current_status = 3 ";
            rs = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);

            rs.last();
            dataRow = rs.getRow();
            letterId = new String[dataRow];
            currentStatus = new int[dataRow];
            receivingDate = new String[dataRow];
            depOfOrigin = new String[dataRow];
            requestId = new String[dataRow];
            subjectOfLetter = new String[dataRow];
            endDate = new String[dataRow];
            documentId = new int[dataRow];
            shortDesc = new String[dataRow];
            scanFile = new String[dataRow];
            priority = new String[dataRow];
            rs.beforeFirst();
            while (rs.next()) {
                letterId[i] = rs.getString("letter_id");
                currentStatus[i] = rs.getInt("current_status");
                receivingDate[i] = rs.getString("receiving_date");
                depOfOrigin[i] = rs.getString("department_of_origin");
                requestId[i] = rs.getString("request_id");
                subjectOfLetter[i] = rs.getString("subject_of_letter");
                endDate[i] = rs.getString("end_date");
                documentId[i] = rs.getInt("document_id");
                shortDesc[i] = rs.getString("short_desc");
                scanFile[i] = rs.getString("scan_file");
                priority[i] = rs.getString("priority");
                i++;
            }

            for (i = 0; i < dataRow; i++) {
                if (currentStatus[i] == 1) {
                    status = "শুরু হয়েছে";
                } else if (currentStatus[i] == 2) {
                    status = "চলমান";
                } else if (currentStatus[i] == 3) {
                    status = "শেষ";
                }
                response.setContentType("text/plain");
                response.getWriter().write("<tr>"
                        + "<td>" + (i + 1) + "</td>"
                        + "<td>" + status + "</td>"
                        + "<td>" + receivingDate[i] + "</td>"
                        + "<td>" + depOfOrigin[i] + "</td>"
                        + "<td>" + requestId[i] + "</td>"
                        + "<td>" + subjectOfLetter[i] + "</td>"
                        + "<td>" + endDate[i] + "</td>"
                        + "<td>" + documentId[i] + "</td>"
                        + "<td>" + shortDesc[i] + "</td>"
                        + "<td><img src='../uplopded_file/" + scanFile[i] + "' alt='এই ফাইলটি লোড করা যাচ্ছেনা' height='40px' width='40px'/></td>"
                        + "<td><button class='btn btn-success'>"
                        + "<a data-toggle='modal' data-status=" + status + " data-receivingdate=" + receivingDate[i] + " data-depoforigin=" + depOfOrigin[i] + " data-requestid=" + requestId[i] + " data-subjectofletter=" + subjectOfLetter[i] + " data-enddate=" + endDate[i] + " data-documentid=" + documentId[i] + " data-shortdesc=" + shortDesc[i] + " data-scanfile=" + scanFile[i] + " class='open-spceDialog' href='#addSpec' >অগ্রাধিকার ঠিক করুন</a>"
                        + "</button>"
                        + "</td>"
                        + "</tr>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AllNewDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}