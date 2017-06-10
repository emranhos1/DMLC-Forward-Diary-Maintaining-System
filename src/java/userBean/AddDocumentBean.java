package userBean;

import dao.InsertQueryDao;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class AddDocumentBean extends HttpServlet {

    private String photo;
    private String uploaded_file;
    private File newFile;
    private String subject;
    private String description;
    private Part scanfile;
    private String requestId;
    private String depOfOrigin;
    private String endDate;
    private String status;
    private String fileName;
    private OutputStream out1;
    private InputStream fileContent;
    private InputStream inputStream;
    private SimpleDateFormat dateFormat;
    private Date date;
    private String inputDate;
    private String tableName;
    private String columnName;
    private String values;
    private boolean addDocument;
    private Part file;

//    private String getFileName(final Part part) {
//        final String partHeader = part.getHeader("content-disposition");
//
//        for (String content : part.getHeader("content-disposition").split(";")) {
//            if (content.trim().startsWith("filename")) {
//                return content.substring(
//                        content.indexOf('=') + 1).trim().replace("\"", "");
//            }
//        }
//        return null;
//    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
            date = new Date();
            
            photo = "";
            uploaded_file = "E:/project/DMLC/DMLC/web/uplopded_file";
            newFile = new File(uploaded_file);

            subject = new String(request.getParameter("subject").getBytes("ISO-8859-1"), "UTF-8");
            description = new String(request.getParameter("description").getBytes("ISO-8859-1"), "UTF-8");
            scanfile = request.getPart("scanfile");
            
            requestId = new String(request.getParameter("requestId").getBytes("ISO-8859-1"), "UTF-8");
            depOfOrigin = new String(request.getParameter("depOfOrigin").getBytes("ISO-8859-1"), "UTF-8");
            endDate = new String(request.getParameter("endDate").getBytes("ISO-8859-1"), "UTF-8");
            status = new String(request.getParameter("status").getBytes("ISO-8859-1"), "UTF-8");
            inputDate = dateFormat.format(date);
            
//            fileName = getFileName(scanfile);
//            newFile.mkdir();
//            out1 = null;
//            PrintWriter writer = response.getWriter();
//            out1 = new FileOutputStream(new File(uploaded_file + File.separator + fileName));
//            fileContent = scanfile.getInputStream();
//            int read = 0;
//            final byte[] bytes = new byte[1024];
//            while ((read = fileContent.read(bytes)) != -1) {
//                out1.write(bytes, 0, read);
//            }
//            if (scanfile != null) {
//                inputStream = scanfile.getInputStream();
//            }
            
//            tableName =" document ";
//            columnName =" date_time ";
//            values ="'"+inputDate+"'";
//            addDocument = InsertQueryDao.insertQueryWithOutWhereClause(tableName, columnName, values);
            
            
            
            System.out.println(subject);
            System.out.println(description);
            System.out.println(fileName);
            System.out.println(requestId);
            System.out.println(depOfOrigin);
            System.out.println(endDate);
            System.out.println(status);

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddDocumentBean</title>");
            out.println("</head>");
            out.println("<body>");
            out.println(subject);
            out.println(description);
            out.println(fileName);
            out.println(requestId);
            out.println(depOfOrigin);
            out.println(endDate);
            out.println(status);
            out.println("<h1>Servlet AddDocumentBean at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
//        } catch (SQLException ex) {
//            Logger.getLogger(AddDocumentBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}