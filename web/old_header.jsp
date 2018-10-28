<%@include file="properties.jsp" %>

<%    String uname = (String) session.getAttribute("userid");

%>

<!DOCTYPE html>
<html>
    <head>
        <title> Result Processing System </title>
        <link rel="shortcut icon" href="images/vv.ico">
        <link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery-3.1.0.min.js" type="text/javascript"></script>
        <link href="css/track_style.css" rel="stylesheet" type="text/css"/>
        <script language="javascript" type="text/javascript">
            function clearText(field)
            {
                if (field.defaultValue == field.value)
                    field.value = '';
                else if (field.value == '')
                    field.value = field.defaultValue;
            }
        </script>
        <!--<link href="resources/css/style.css" rel="stylesheet" type="text/css"/>-->


    </head>

    <body>

        <div class="headersection templete clear">  

           <img src="images/header.jpg" width="950" height="130">
        </div>  



        <div class="navsection templete clear"> 

            <ul>  
                <li style="float:left"><a class="active" href="<%=baseUrl%>/index.jsp">Home</a></li> 
                <li> <a href="<%=baseUrl%>/details.jsp">Details</a> </li>
                
                <li> <a href="<%=baseUrl%>/drivers_info.jsp">Driver Details</a> </li>
                <li> <a href="<%=baseUrl%>/ownersVehicles_report.jsp">Vehicle Details</a> </li>
                
                <li style="float:left"><a class="active" <a href="<%=baseUrl%>/track_vehicle.jsp">Track Vehicle</a> </li>
                <li> <a href="<%=baseUrl%>/expenses.jsp">Insert Expenses</a> </li>
                
                <li> <a href="<%=baseUrl%>/expenses_report.jsp"> Expenses Reports</a> </li>
                
                <li> <a href="<%=baseUrl%>/view.jsp">History</a> </li>

                <li> <a href="<%=baseUrl%>/reportByUname.jsp">Reports</a> </li>
                <li><a href="<%=baseUrl%>/editregForm.jsp">Edit Profile</a></li>
                <li> <a href="<%=baseUrl%>/contact.jsp">Contact Us</a> </li>
                
               

                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %>

                <li><a href="<%=baseUrl%>/registration/reg.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                <li><a href="<%=baseUrl%>/home.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                <li><a href="<%=baseUrl%>/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>

                <% } else {%>
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>Welcome <%=uname%></a></li>
                <li><a href="<%=baseUrl%>/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>

                <% }%>

            </ul>





        </div>

    </body>
</html>
