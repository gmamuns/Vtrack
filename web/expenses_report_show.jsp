<%-- 
    Document   : expenses_report_show
    Created on : Oct 3, 2018, 9:30:32 PM
    Author     : mamuns
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.VtrackModel"%>
<%@page import="dao.VtrackDao"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp" %>
<%   //vid=ctg-1234
    String vid = request.getParameter("vid");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");

    try {
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, user, password);
        //Statement st = con.createStatement();

        out.println("Vid : " + vid);

        String username = "";
        if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
            username = request.getParameter("userid"); // get username from parameter first
        } else {
            username = (String) session.getAttribute("userid"); // if parameter missing get it from session
        }
        out.println(username);
        out.println("Username : " + username);

        //ResultSet rs;
        //rs = st.executeQuery("select * from cost where uname='" + username + "' and vid='" + vid + "'");
        //rs = st.executeQuery("select * from cost ");
        PreparedStatement ps = con.prepareStatement("select * from cost where regdate BETWEEN '" + start_date + "' AND '" + end_date + "' AND uname='"+username+"'");
        ResultSet rs = ps.executeQuery();


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 

            <br><br> <h1>DateWise Expenses List </h1> <br><br>
            <table border='1' width='100%' class="table table-bordered" >
                <tr><td>Owner Name</td><td>Vehicle ID</td><td>Head</td><td>Ex.Amount</td><td>Income</td><td>Description</td><td>RegDate</td></tr>
                <% while (rs.next()) {%>

                <tr><td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td><td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(8)%></td></tr>

                <%}
                        con.close();
                    } catch (Exception exx) {
                        out.println("DB Connectivity error ...");
                    }
                %>
            </table>
            <a href='expenses_report.jsp'><button type="button" class="btn btn-default">Search again</button></a>
            <button type="button" class="btn btn-default" onclick="window.print()">Print</button>

        </div>
    </body>
</html>
