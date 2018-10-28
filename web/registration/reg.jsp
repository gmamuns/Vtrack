<%-- 
    Document   : reg
    Created on : Aug 8, 2018, 11:28:44 AM
    Author     : mamuns
    Source : http://www.javaknowledge.info/login-and-registration-example-in-jsp-with-session/
    Status : ok
--%>

<%@page import="java.util.UUID"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <h1><center>Registration Form</center></h1>
            <form method="post" action="registration.jsp">
                <div class="form-group">
                    <label for="fname">First Name:</label>
                    <input  class="form-control" type="text"  placeholder="First Name" name="fname">
                </div>
                <div class="form-group">
                    <label for="lname">Last Name :</label>
                    <input  class="form-control" type="text" placeholder="Last Name" name="lname">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input  class="form-control" type="email" placeholder="Email" name="email">
                </div>
                <div class="form-group">
                    <label for="uname">User Name :</label>
                    <input  class="form-control" type="text" placeholder="User Name" name="uname">
                </div>
                <div class="form-group">
                    <label for="pass">Password :</label>
                    <input  class="form-control" type="password" placeholder="Password" name="pass">
                </div>
                 <div class="form-group">
                    <label for="geolocation">Phone :</label>
                    <input  class="form-control" type="text" placeholder="88017..." name="phone">
                </div>
                <div class="form-group">
                    <label for="apikey">API Key :</label>
                    <input  class="form-control" type="text" name="apikey" value="<%= UUID.randomUUID().toString()%>">
                </div>


                <button type="submit" class="btn btn-default">Submit</button>
                Already registered!! <a href="../home.jsp">Login Here</a>


            </form>
        </div>
    </body>
</html>
