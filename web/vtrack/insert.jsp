<%-- 
    Document   : insert
    Created on : Aug 8, 2018, 11:16:01 AM
    Author     : mamuns
    status : ok
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.VtrackDao"%>
<%@page import="model.VtrackModel"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="model.WeatherModel"%>
<%@include file="../properties.jsp" %>
<%    
    String vid = request.getParameter("vid");
    String uname = request.getParameter("uname");
    String lcode = request.getParameter("lcode");

    String lat = request.getParameter("lat");
    String lon = request.getParameter("lon");
    
    // ?vid=Ctg-4215&uname=zia&lcode=1234&lat=75.75&lon=66.66
    //?vid=Ctg-4215&uname=zia&lcode=1234&lat=22.3628819&lon=91.8087453
    //@,,
    
    VtrackModel e = new VtrackModel();
    e.setVid(vid);
    e.setUname(uname);
    e.setLcode(lcode);
    e.setLat(lat);
    e.setLon(lon);

    VtrackDao dao = new VtrackDao(driver, url, user, password);
    int status = dao.save(e);

     

%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Data Page</title>
    </head>
    <body>
        <% if (status > 0) {%>
        <p>Record saved successfully!</p>
        <%// request.getRequestDispatcher("insert.jsp").include(request, response);%>
        <% } else {%>
        <p>Sorry! unable to save record</p>
        <%}%>
    </body>
</html>
