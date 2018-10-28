<%-- 
    Document   : login
    Created on : Aug 8, 2018, 11:16:01 AM
    Author     : mamuns
    status : ok
--%>
<%@ page import ="java.sql.*" %>
<%@include file="properties.jsp" %>
<%    //Source : http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
   try{
    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, user, password);
    Statement st = con.createStatement();

    String userid = request.getParameter("uname");
    out.println("Username : "+userid);
    String pwd = request.getParameter("pass");
    out.println("Pass : "+pwd);
    session.setAttribute("uname", userid);

    ResultSet rs;
    rs = st.executeQuery("select * from users where uname='" + userid + "' and pass='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index.jsp");
    } else {
        out.println("Invalid password <a href='home.jsp'>try again</a>");
    }
   }
   catch(Exception exx){
       out.println("DB Connectivity error ...");
   }
%>