<%@include file="properties.jsp" %>

<%    String uname = (String) session.getAttribute("userid");

%>
<!DOCTYPE html>
<html>
    <head>
        <title> V-track Communications </title>

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script language="javascript" type="text/javascript">
            function clearText(field)
            {
                if (field.defaultValue == field.value)
                    field.value = '';
                else if (field.value == '')
                    field.value = field.defaultValue;
            }
        </script>
        <link rel="stylesheet" href ="css1/style.css">

    </head>

    <body>

        <div class="headersection templete clear">  

            <img src="images/header.jpg" width="950" height="130">
        </div>  




        <div class="navsection templete clear"> 

            <div class="navbar">
                <a href="<%=baseUrl%>/index.jsp">Home</a>
                <div class="dropdown">
                    <button class="dropbtn">Details 
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="<%=baseUrl%>/ownersVehicles_report.jsp">Vehicle Details</a>
                        <a href="<%=baseUrl%>/drivers_info.jsp">Driver Details</a>
                        
                    </div>
                </div> 

                <a href="<%=baseUrl%>/track_vehicle.jsp">Track Vehicle</a>
                <a href="<%=baseUrl%>/expenses.jsp">Expenses</a>
                <div class="dropdown">
                    <button class="dropbtn">Reports  
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="<%=baseUrl%>/expenses_report.jsp">Expenses Reports</a>
                        <a href="<%=baseUrl%>/ownersVehicles_report.jsp">Vehicle Reports</a>
                    </div>
                </div> 

                <div class="dropdown">
                    <button class="dropbtn">Profile  
                        <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content">
                        <a href="<%=baseUrl%>/details.jsp">Show Profile</a>
                        <a href="<%=baseUrl%>/editregForm.jsp">Edit Profile</a>
                    </div>
                </div>
                <a href="<%=baseUrl%>/contact.jsp">Contact Us</a>
                
                
                
                
                
                <%
                    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                %>

                <a href="<%=baseUrl%>/registration/reg.jsp">Sign Up</a>
                <a href="<%=baseUrl%>/home.jsp">Login</a>
                <a href="<%=baseUrl%>/logout.jsp">Log Out</a>

                <% } else {%>
                 <a href="<%=baseUrl%>/details.jsp">Welcome <%=uname%></a>
                <a href="<%=baseUrl%>/logout.jsp">Log Out</a>
                <% }%>

            </div>
        </div>

    </body>
</html>