<%-- 
    Document   : userProfile
    Created on : Jun 13, 2017, 1:15:04 PM
    Author     : Softcell-4
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            if ((session.getAttribute("idUser") == null) || (session.getAttribute("idUser") == "")) {
                response.sendRedirect("../login.jsp");
            } else {%>
        <h1>Hello World!</h1>
        <%}%>
    </body>
</html>
