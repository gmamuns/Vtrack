<%-- 
    Document   : registration
    Created on : Aug 8, 2018, 11:29:25 AM
    Author     : mamuns
    Source : http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
    status : ok
--%>

<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@ page import ="java.sql.*" %>
<%@include file="../properties.jsp" %>
<%    //Source : http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
    
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String uname = request.getParameter("uname");
    String pwd = request.getParameter("pass");
    String geolocation = request.getParameter("phone");
    String apikey = request.getParameter("apikey");

    RegistrationModel reg = new RegistrationModel();
    reg.setFname(fname);
    reg.setLname(lname);
    reg.setEmail(email);
    reg.setUname(uname);
    reg.setPass(pwd);
    reg.setGeolocation(geolocation);
    reg.setApikey(apikey);

    RegistrationDao dao = new RegistrationDao(driver, url, user, password);

    if (dao.save(reg) == 1) {

        response.sendRedirect("welcome.jsp");  // if inserted go to welcome.jsp
    } else {
        response.sendRedirect("regfailed.jsp"); // If failed go to home.jsp
    }

    
%>
