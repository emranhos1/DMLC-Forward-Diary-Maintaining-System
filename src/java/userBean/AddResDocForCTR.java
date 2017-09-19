package userBean;

import dao.InsertQueryDao;
import dao.SelectQueryDao;
import dao.UpdateQueryDao;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 169999999)
public class AddResDocForCTR extends HttpServlet {

    private String uploaded_file;
    private File newFile;
    private Part scanfile;
    private int documentId;
    private String fileName;
    private OutputStream out1;
    private InputStream fileContent;
    private String userId;
    private String tableName;
    private String columnName;
    private String values;
    private boolean addResDocTable;
    private String whereCondition;
    private ResultSet selectUserName;
    private String currentWorkingEmployee;
    private String Status;
    private File file;
    private int count;
    private File file1;
    private String newFileName;
    private int forwardingId;
    private String columnNameANDcolumnValue;
    private boolean updateRecDocTable;
    private String parentUsername;
    private ResultSet selectParentUsername;
    private SimpleDateFormat dateFormat;
    private Date date;
    private String sendingDate;
    private String comingFromEmpUserName;
    private int comingFromEmpId;

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

    private void getRandom() throws FileNotFoundException, IOException {

        Random random = new Random();
        count = random.nextInt(999999999);
        file1 = new File(uploaded_file + count + fileName);
        newFileName = count + "_" + fileName;
        if (file1.exists()) {
            getRandom();
        } else {
            newFile.mkdir();
            out1 = null;
            out1 = new FileOutputStream(new File(uploaded_file + File.separator + newFileName));
            fileContent = scanfile.getInputStream();
            int read = 0;
            final byte[] bytes = new byte[1024];
            while ((read = fileContent.read(bytes)) != -1) {
                out1.write(bytes, 0, read);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();
            userId = session.getAttribute("idUser").toString();

            dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();
            sendingDate = dateFormat.format(date);
            
            scanfile = request.getPart("file");
            documentId = Integer.parseInt(request.getParameter("documentId"));
            forwardingId = Integer.parseInt(request.getParameter("forwardingId"));

            uploaded_file = "E:/Programming/1. Office project/Project/DMLC/DMLC/web/Uplopded_file_return/";
            newFile = new File(uploaded_file);

            fileName = getFileName(scanfile);
            file = new File(uploaded_file + fileName);

            columnName = " user_name ";
            tableName = " employee ";
            whereCondition = " employee_id = '" + userId + "'";
            selectUserName = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectUserName.next()) {
                currentWorkingEmployee = selectUserName.getString("user_name");
            }
            Status = "Active";

            columnName = " acknowledged_by_employee_username, acknowledged_by_employee_id ";
            tableName = " receives_document ";
            whereCondition = " forwarding_id = '" + forwardingId + "'";
            selectParentUsername = SelectQueryDao.selectQueryWithWhereClause(columnName, tableName, whereCondition);
            while (selectParentUsername.next()) {
                comingFromEmpUserName = selectParentUsername.getString("acknowledged_by_employee_username");
                comingFromEmpId = selectParentUsername.getInt("acknowledged_by_employee_id");
            }
            
            if (file.exists()) {
                getRandom();
                tableName = " response_document ";
                columnName = " current_working_employee_id, current_working_employee_username, coming_from_employee_id, coming_from_employee_username, document_id, response_file, status, sending_date ";
                values = "'" + comingFromEmpId + "', '" + comingFromEmpUserName + "', '" + userId + "', '" + currentWorkingEmployee + "', '" + documentId + "', '" + newFileName + "', '" + Status + "', '" + sendingDate + "'";
                addResDocTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);
            } else {
                newFile.mkdir();
                out1 = null;
                out1 = new FileOutputStream(new File(uploaded_file + File.separator + fileName));
                fileContent = scanfile.getInputStream();
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = fileContent.read(bytes)) != -1) {
                    out1.write(bytes, 0, read);
                }
                tableName = " response_document ";
                columnName = " current_working_employee_id, current_working_employee_username, coming_from_employee_id, coming_from_employee_username, document_id, response_file, status, sending_date ";
                values = "'" + comingFromEmpId + "', '" + comingFromEmpUserName + "', '" + userId + "', '" + currentWorkingEmployee + "', '" + documentId + "', '" + fileName + "', '" + Status + "', '" + sendingDate + "'";
                addResDocTable = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);
            }

            columnNameANDcolumnValue = " status = 'Inactive' ";
            tableName = " receives_document ";
            whereCondition = " forwarding_id = '" + forwardingId + "'";
            updateRecDocTable = UpdateQueryDao.updateQueryWithWhereClause(tableName, columnNameANDcolumnValue, whereCondition);
            if (addResDocTable) {
                if (updateRecDocTable) {
                    String addResDocUpRecDocSuccess = "<p class='alert-info'>ফাইল আপলোড ও পাঠানো হয়েছে</p>";
                    request.getSession().setAttribute("message", addResDocUpRecDocSuccess);
                    response.sendRedirect("ctr/oldDocNewFile.jsp");
                } else {
                    String addResDocUpRecDocError = "<p class='alert-danger'>ফাইল আপলোড পাঠানো সফল হয়নি</p>";
                    request.getSession().setAttribute("message", addResDocUpRecDocError);
                    response.sendRedirect("ctr/oldDocNewFile.jsp");
                }
            } else {
                String addResDocUpRecDocError = "<p class='alert-danger'>ফাইল আপলোড পাঠানো সফল হয়নি</p>";
                request.getSession().setAttribute("message", addResDocUpRecDocError);
                response.sendRedirect("ctr/oldDocNewFile.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AddResDocForCTR.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
