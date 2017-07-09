package userBean;

import dao.InsertQueryDao;
import dao.SelectQueryDao;
import dbConnection.DBConnection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 169999999)
public class AddDocumentBean extends HttpServlet {

    private InputStream inputStream;
    private long fileSize;
    private InputStream fileContent;
    private DBConnection db = new DBConnection();
    private PreparedStatement pstm;
    static Connection con;
    private int insertFile;
    private String subject;
    private String description;
    private Part scanfile;
    private String requestId;
    private String depOfOrigin;
    private String endDate;
    private String status;
    private String fileName;
    private String photo;
    private String uploaded_file;
    private File newFile;
    private OutputStream out1;
    private String tableName;
    private String columnName;
    private String whereCondition;
    private SimpleDateFormat dateFormat;
    private Date date;
    private String inputDate;
    private String values;
    private boolean addDocument;
    private ResultSet selectMaxId;
    private int documentId;
    private boolean addLetter;

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();

            photo = "";
            uploaded_file = "E:/Programming/1. Office project/Project/DMLC/DMLC/web/Uplopded_file";
            newFile = new File(uploaded_file);

            subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"), "UTF-8");
            description = new String(request.getParameter("details").getBytes("ISO-8859-1"), "UTF-8");
            scanfile = request.getPart("file");

            requestId = new String(request.getParameter("requestId").getBytes("ISO-8859-1"), "UTF-8");
            depOfOrigin = new String(request.getParameter("depOfOrigin").getBytes("ISO-8859-1"), "UTF-8");
            endDate = new String(request.getParameter("endDate").getBytes("ISO-8859-1"), "UTF-8");
            status = new String(request.getParameter("status").getBytes("ISO-8859-1"), "UTF-8");
            inputDate = dateFormat.format(date);

            fileName = getFileName(scanfile);

            tableName = " document ";
            columnName = " date_time ";
            values = "'" + inputDate + "'";
            addDocument = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            columnName = " document_id ";
            whereCondition = " document_id = (Select Max(document_id) from document) ";

            selectMaxId = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectMaxId.next()) {
                documentId = selectMaxId.getInt("document_id");
            }
            tableName = " letter ";
            columnName = " current_status, receiving_date, department_of_origin, request_id, subject_of_letter, end_date, document_id, short_desc, scan_file ";
            values = "'" + status + "', '" + inputDate + "', '" + depOfOrigin + "', '" + requestId + "', '" + subject + "', '" + endDate + "', '" + documentId + "', '" + description + "', '" + fileName + "'";
            addLetter = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);

            newFile.mkdir();
            out1 = null;
            PrintWriter writer = response.getWriter();
            out1 = new FileOutputStream(new File(uploaded_file + File.separator + fileName));
            fileContent = scanfile.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) {
                out1.write(bytes, 0, read);
            }

            if (addDocument) {
                if (addLetter) {
                    String addDocSuccess = "<p class='alert-info'>নতুন নথি সফলভাবে সংযোজিত হয়েছে</p>";
                    request.getSession().setAttribute("addDocInfo", addDocSuccess);
                    response.sendRedirect("frontDesk/addDocument.jsp");
                } else {
                    String addDocError = "<p class='alert-info'> নতুন নথিটি অন্তর্ভুক্ত করা হয়নি</p>";
                    request.getSession().setAttribute("addDocInfo", addDocError);
                    response.sendRedirect("frontDesk/addDocument.jsp");
                }
            } else {
                String addDocError = "<p class='alert-info'> নতুন নথিটি অন্তর্ভুক্ত করা হয়নি</p>";
                request.getSession().setAttribute("addDocInfo", addDocError);
                response.sendRedirect("frontDesk/addDocument.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddDocumentBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
