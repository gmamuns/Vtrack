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
<%@include file="properties.jsp" %>

<%@page import="java.util.List"%> 

<%
// vid,date,head,amount,description

    String vid = request.getParameter("vid");
    String date = request.getParameter("date");
    String head = request.getParameter("head");
    String ex_amount = request.getParameter("ex_amount");
    String income = request.getParameter("income");;
    String description = request.getParameter("description");
    
out.println(vid+date+head+ex_amount+income+description);


String username = "";
    if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
        username = request.getParameter("userid"); // get username from parameter first
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }
    //out.println(username);

    Connection con = null;
    int status=0;
    
    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);
       // PreparedStatement ps = con.prepareStatement("INSERT INTO `cost`(`uname`,`vid`, `head`, `ex_amount`,`income`, `description`, `regdate`) VALUES ('"+username+"','"+vid+"','"+head+"','"+ex_amount+"','"+description+"','"+date +"')"); 
PreparedStatement ps = con.prepareStatement("INSERT INTO `cost`(`uname`, `vid`, `head`, `ex_amount`, `income`, `description`, `regdate`) "
        + "VALUES ('"+username+"','"+vid+"','"+head+"','"+ex_amount+"','"+income+"','"+description+"','"+date +"')"); 
// VALUES ([value-1],[value-2],[value-3],[value-4],[value-5],[value-6],[value-7],[value-8]) 
        status = ps.executeUpdate();
        con.close();
        out.println("Data Inserted ,<a href='expenses.jsp'>Back to insert page</a> ");
        //response.sendRedirect("expenses.jsp?error = \"Data Inserted\"");

    } catch (Exception ex) {
        out.println(ex);
    }



%>
