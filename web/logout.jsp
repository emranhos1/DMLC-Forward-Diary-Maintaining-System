<%-- 
    Document   : logout
    Created on : Jun 07, 2017, 3:53:59 PM
    Author     : Md. Emran Hossain
--%>
<%
    session.setAttribute("idUser", null);
    session.invalidate();
    response.sendRedirect("login.jsp");
%>