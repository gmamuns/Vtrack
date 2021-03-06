<%-- 
    Document   : edit
    Created on : Aug 12, 2018, 8:49:49 PM
    Author     : mamuns
    Status : not Complete
--%>
<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@include file="header.jsp" %>
<%  //get username from session/parameter 
    String username = "";
    if (!(request.getParameter("userid") == null) || !(request.getParameter("userid") == null)) {
        username = request.getParameter("userid"); // get username from parameter first
        session.setAttribute("userid", username);
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }

    RegistrationModel e = new RegistrationModel();
    RegistrationDao dao = new RegistrationDao(driver, url, user, password);
    e = dao.getDataByUname(username);
    //dao.edit(e);
    // response.sendRedirect("view.jsp");


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Registration Page</title>
    </head>
    <body>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white"> 
            <br><br><h1>Edit Registration Data</h1><br><br>

            <form action="registration/editreg.jsp">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input  class="form-control" type="text"  value="<%=e.getFname()%>" name="fname">
                </div>
                <div class="form-group">
                    <label for="lname">Last Name :</label>
                    <input  class="form-control" type="text" value="<%=e.getLname()%>" name="lname">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input  class="form-control" type="email" value="<%=e.getEmail()%>" name="email">
                </div>

                <div class="form-group">
                    <label for="pass">Password :</label>
                    <input  class="form-control" type="password" value="<%=e.getPass()%>" name="pass">
                </div>
                <div class="form-group">
                    <label for="geolocation">Phone :</label>
                    <input  class="form-control" type="text" value="<%=e.getGeolocation()%>" name="geolocation">
                </div>



                <button type="submit" class="btn btn-default">Submit</button>
                Already registered!! <a href="home.jsp">Login Here</a>


            </form>
        </div>
    </body> 
</html>
