package userBean;

import dao.DeleteQueryDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteDocument extends HttpServlet {

    private String forwardingId;
    private String letterId;
    private String documentId;
    private String tableName;
    private String whereCondition;
    private boolean deleteDocumentTable;
    private boolean deleteLetterTable;
    private boolean deleteRecDocTable;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            forwardingId = new String(request.getParameter("forwardingId").getBytes("ISO-8859-1"), "UTF-8");
            letterId = new String(request.getParameter("letterId").getBytes("ISO-8859-1"), "UTF-8");
            documentId = new String(request.getParameter("documentId").getBytes("ISO-8859-1"), "UTF-8");

            tableName = " receives_document ";
            whereCondition = " letter_id = '" + letterId + "'";
            deleteRecDocTable = DeleteQueryDao.deleteQueryWithWhereClause(tableName, whereCondition);

            tableName = " letter ";
            whereCondition = " letter_id = '" + letterId + "'";
            deleteLetterTable = DeleteQueryDao.deleteQueryWithWhereClause(tableName, whereCondition);

            tableName = " comments_on ";
            whereCondition = " document_id = '" + documentId + "'";
            deleteDocumentTable = DeleteQueryDao.deleteQueryWithWhereClause(tableName, whereCondition);
            
            tableName = " document ";
            whereCondition = " document_id = '" + documentId + "'";
            deleteDocumentTable = DeleteQueryDao.deleteQueryWithWhereClause(tableName, whereCondition);

            if (deleteRecDocTable) {
                if (deleteLetterTable) {
                    if (deleteDocumentTable) {
                        String deleteDocSuccess = "<p class='alert-info'>নথিটি সফলভাবে মোছা হয়েছে</p>";
                        request.getSession().setAttribute("message", deleteDocSuccess);
                        response.sendRedirect("director_general/runningReturnDocument.jsp");
                    } else {
                        String deleteDocError = "<p class='alert-danger'>নথি সফলভাবে মোছা হয়নি</p>";
                        request.getSession().setAttribute("message", deleteDocError);
                        response.sendRedirect("director_general/runningReturnDocument.jsp");
                    }
                } else {
                    String deleteDocError = "<p class='alert-danger'>নথি সফলভাবে মোছা হয়নি</p>";
                    request.getSession().setAttribute("message", deleteDocError);
                    response.sendRedirect("director_general/runningReturnDocument.jsp");
                }
            } else {
                String deleteDocError = "<p class='alert-danger'>নথি সফলভাবে মোছা হয়নি</p>";
                request.getSession().setAttribute("message", deleteDocError);
                response.sendRedirect("director_general/runningReturnDocument.jsp");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DeleteDocument.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
