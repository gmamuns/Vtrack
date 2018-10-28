<%-- 
    Document   : changeStatus
    Created on : Aug 17, 2018, 3:03:48 PM
    Author     : mamuns
    Status : ok (testing purpose)
--%>

<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@include file="../properties.jsp" %>
<%
    //String apikey = request.getParameter("apikey");
    
    Boolean status = true;
    String apikey = "57ad928b-014f-46a8-ac73-ac3b706de0c6";
   
    RegistrationDao dao = new RegistrationDao(driver, url, user, password);
    Boolean confirm = dao.editStatus(true, "57ad928b-014f-46a8-ac73-ac3b706de0c6");

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Data Page</title>
    </head>
    <body>
        <% if (confirm) {%>
             <p>Edited Status successfully!</p>
             <% // request.getRequestDispatcher("insert.jsp").include(request, response);%>
        <% } else {%>
             <p>Sorry! unable to edit status</p>
        <%}%>
    </body>
</html>
