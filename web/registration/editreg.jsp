<%-- 
    Document   : edit
    Created on : Aug 12, 2018, 9:25:05 PM
    Author     : mamuns
    Status  : not complete
--%>
<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@include file="../properties.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../resources/js/jquery-3.1.0.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String uname = (String) session.getAttribute("userid");
    String pwd = request.getParameter("pass");
    String geolocation = request.getParameter("geolocation");

    RegistrationModel reg = new RegistrationModel();
    reg.setFname(fname);
    reg.setLname(lname);
    reg.setEmail(email);
    reg.setUname(uname);
    reg.setPass(pwd);
    reg.setGeolocation(geolocation);
    

    RegistrationDao dao = new RegistrationDao(driver, url, user, password);
    
    if (dao.editByUname(reg) == 1) {

        response.sendRedirect("../home.jsp");  // if inserted 
    } else {
        response.sendRedirect("../editregForm.jsp"); // If failed go back
    }
    
        %>

    </body>
</html>
