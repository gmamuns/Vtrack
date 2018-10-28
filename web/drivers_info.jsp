<%-- 
    Document   : drivers_info
    Created on : Oct 3, 2018, 9:36:02 AM
    Author     : mamuns
--%>


<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>

<%@page import="java.util.List"%> 

<%

String username = "";
    if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
        username = request.getParameter("userid"); // get username from parameter first
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }
    out.println(username);

    Connection con = null;
    int status=0;
    
    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = con.prepareStatement("SELECT `id`, `name`, `vtype`, `licenseno`,  `salary`,  `regdate` FROM `driver_info`");
        ResultSet rs = ps.executeQuery();
        
         

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>View All Drivers</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 

            <br><br><h1>List of All Drivers</h1> <br><br>
            <table border='1' width='100%' class="table table-bordered">
                <tr><th>Serial ID</th><th> Name</th><th>Vehicle Type</th><th>License No.</th><th>Salary</th><th>Entry Date</th></tr>
                <%while (rs.next()) {%>
                <tr><td><%=rs.getString(1)%> </td><td><%=rs.getString(2)%> </td><td><%= rs.getString(3)%></td><td><%=rs.getString(4)%> </td><td><%= rs.getString(5)%></td><td><%=rs.getString(6)%> </td></tr>
                <%}con.close();%>
            </table>
            
        </div>
    </body>
</html>



<%
    } catch (Exception ex) {
        out.println(ex);
    }


%>