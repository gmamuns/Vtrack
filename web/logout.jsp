<%-- 
    Document   : logout
    Created on : Aug 8, 2018, 11:16:01 AM
    Author     : mamuns
    status : ok
--%>

<%
 //Source : http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("home.jsp");
%>