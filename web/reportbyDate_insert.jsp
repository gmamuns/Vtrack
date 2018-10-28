<%-- 
    Document   : expense_insert
    Created on : Sep 29, 2018, 1:40:12 PM
    Author     : mamuns
    Status : used to insert expense to DB
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
// vid,date,head,amount,description

    String vid = request.getParameter("vid");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    
out.println(vid+start_date+end_date);


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
        PreparedStatement ps = con.prepareStatement("SELECT * FROM `vtrack` WHERE regdate BETWEEN '"+start_date+"' AND '"+end_date+"'");
        
        ResultSet rs = ps.executeQuery();
        
         

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="refresh" content="30" />
        <title>View Vehicle Data by Date</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 

            <h1>All Vehicle Data by Date</h1>
            <table border='1' width='100%' class="table table-bordered">
                <tr><td>Sensor ID</td><td>User Name</td><td>Humidity</td><td>Celsius</td><td>Fahrenheit</td><td>RegDate</td></tr>
                <%while (rs.next()) {%>
                <tr><td><%=rs.getString(2)%> </td><td><%= rs.getString(3)%></td><td><%=rs.getString(4)%> </td><td><%= rs.getString(5)%></td><td><%=rs.getString(6)%> </td><td><%= rs.getString(7)%></td>

                </tr>
                <%}con.close();%>
            </table>
            <a href='reportbyDate.jsp'><button type="button" class="btn btn-default">Search again</button></a>
        </div>
    </body>
</html>



<%
    } catch (Exception ex) {
        out.println(ex);
    }


%>