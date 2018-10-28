<%-- 
    Document   : affectedarea
    Created on : Aug 9, 2018, 7:00:34 PM
    Author     : mamuns
    Source : google map>locations > share > get html> save to DB> retreive src value
    Status : ok (testing purpose)
--%>
<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@page import="java.util.List"%> 
<%@include file="../properties.jsp" %>

<%    RegistrationDao dao = new RegistrationDao(driver, url, user, password);
      List<RegistrationModel> list = dao.getAllAfectedAreaData(); // This query will be change
%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show Affected Area</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="container">
            <h1>Fire effected Locations</h1>
            <% for (RegistrationModel src : list) { %>
            <iframe 
                src= <% out.print(src.getGeolocation()); %>
                
                width="49%" height="300" frameborder="0" style="border:0" allowfullscreen>

            </iframe>
            <%}%>
           
            </div> 
    </body>
</html>
