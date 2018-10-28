<%-- 
    Document   : ownersVehicles_report
    Created on : Oct 3, 2018, 9:58:07 PM
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
       // PreparedStatement ps = con.prepareStatement("INSERT INTO `cost`(`uname`,`vid`, `head`, `ex_amount`,`income`, `description`, `regdate`) VALUES ('"+username+"','"+vid+"','"+head+"','"+ex_amount+"','"+description+"','"+date +"')"); 
        //PreparedStatement ps = con.prepareStatement("SELECT * FROM `vtrack` WHERE regdate BETWEEN '2018-08-26' AND '2018-09-05'");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM `vehicle_details`");
        
        ResultSet rs = ps.executeQuery();
        
         

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="30" />
        <title>View Vehicle Data by Date</title>
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 

           <br><br> <h1>All Vehicle List</h1> <br><br>
            <table border='1' width='100%' class="table table-bordered">
                <tr><td>Serial No.</td><td>Vehicle No.</td><td>Vehicle Type</td><td>Reg. No.</td><td>Username</td><td>RegDate</td></tr>
                <%while (rs.next()) {%>
                <tr><td><%=rs.getString(1)%> </td><td><%=rs.getString(2)%> </td><td><%= rs.getString(3)%></td><td><%=rs.getString(4)%> </td><td><%= rs.getString(5)%></td><td><%=rs.getString(8)%> </td></td>

                </tr>
                <%}con.close();%>
            </table>
            <a href='reportbyDate.jsp'><button type="button" class="btn btn-default">Search again</button></a>
            <button type="button" class="btn btn-default" onclick="window.print()">Print</button>

        </div> 
   </body>
</html>



<%
    } catch (Exception ex) {
        out.println(ex);
    }


%>