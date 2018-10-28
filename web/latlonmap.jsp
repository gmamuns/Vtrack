<%-- 
    Document   : latlonmap
    Created on : Sep 19, 2018, 12:55:57 PM
    Author     : mamuns
    Status : ok
--%>
<%@page import="model.VtrackModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.WeatherModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>

<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@page import="java.util.List"%> 

<%
    String vid = request.getParameter("vid");
    //out.println(vid);

    String username = "";
    if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
        username = request.getParameter("userid"); // get username from parameter first
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }
    //out.println(username);

    Connection con = null;
    String lat = null;
    String lon = null;
    List<VtrackModel> list = new ArrayList<VtrackModel>();
    VtrackModel e = new VtrackModel();
    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = con.prepareStatement("SELECT * FROM `vtrack` WHERE uname = '" + username + "'and vid = '" + vid + "' ORDER BY regdate limit 1 "); // get latest value of today
        //SELECT * FROM `vtrack` WHERE uname = 'zia'and vid = 'ctg-4225' GROUP BY regdate limit 1 

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {

            lat = rs.getString(5);
            lon = rs.getString(6);
            list.add(e);
        }
        con.close();

    } catch (Exception ex) {
        System.out.println(ex);
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>ReatTime Location</h1>
        <%   
            //22.355010,91.842628
            //response.sendRedirect("https://www.google.com.bd/maps/place/22.355010,91.842628");
            // response.sendRedirect("https://www.google.com.bd/maps/place/22.3586772,91.8055872");
            if (lat == null || lon == null) {
                out.println("Lat long missing, nothing to show");
            } else {
                response.sendRedirect("https://www.google.com.bd/maps/place/" + lat + "," + lon + "");
            }


        %>
    </body>
</html>
