<%-- 
    Document   : reportByUname
    Created on : Aug 8, 2018, 11:16:01 AM
    Author     : mamuns
    status : ok
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.VtrackModel"%>
<%@page import="dao.VtrackDao"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp" %>
<%
    String username = "";
    if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
        username = request.getParameter("userid"); // get username from parameter first
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }

    VtrackDao dao = new VtrackDao(driver, url, user, password);
    List<VtrackModel> list = dao.getAllDataByUname(username);

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <title>View Weather Report</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../resources/js/jquery-3.1.0.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 
            
            <h1>All Weather List</h1> 
            <table border='1' width='100%' class="table table-bordered" >
                <tr><td>Vehicle ID</td><td>Owner Name</td><td>Location Code</td><td>Latitude</td><td>Longitude</td><td>RegDate</td></tr>
                <%for (VtrackModel e : list) {%>
                <tr><td><%=e.getVid()%> </td><td><%= e.getUname()%></td><td><%=e.getLcode()%> </td><td><%= e.getLat()%></td><td><%=e.getLon()%> </td><td><%= e.getRegdate()%></td>

                </tr>
                <%}%>
            </table>

        </div>
      
            <script>window.print()</script>

    </body>
</html>
