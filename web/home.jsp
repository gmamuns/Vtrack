<%@include file="properties.jsp" %>
<html>
    <head>
        <title>***V-Track Communications Service </title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <link rel="shortcut icon" href="images/vv.ico">
        <link href="css/log.style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body onLoad="test();">
        <%
            if ((session.getAttribute("uname") == null) || (session.getAttribute("uname") == "")) {
        %>
        <FORM name="login" id='login' method="POST" action="login.jsp" style="margin:0px; padding:0px;" autocomplete="off">
            <table width="900" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td height="456" align="center"><table width="697" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="20">&nbsp;</td>
                            </tr>
                            <tr>
                                <td height="456" background="images/bg1.png"><table width="546" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td height="76" align="center"><font style="font-size:30px"><b>&nbsp;&nbsp;Vehicle Tracking System</b></font></td>
                                        </tr>
                                        <tr>
                                            <td height="60" align="center">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="232" background="images/nex_car.png"><table width="250" border="0" align="center" cellpadding="3" cellspacing="0">
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td><b>Please Sign In . . .</b></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="75" align="right"><font style="font-size:12px">User Name : </font></td>
                                                        <td width="163"><input name="uname" id="user_temp" type="text" class="inputtext" title="Enter User ID" value="" style="width:140px; padding:4px;" required tabindex="1"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right"><font style="font-size:12px">Password : </font></td>
                                                        <td><input name="pass" id="password_temp" type="password" class="inputtext" title="Enter Password" style="width:140px; padding:4px;" required tabindex="2"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td><input name="user" id ="user" type="hidden" >
                                                            <input name="password" id ="password" type="hidden">
                                                            &nbsp;<input name="csrfToken" id ="csrfToken" value = "cWV3QDIwMDNibm0gMTgyLjQ4LjcwLjEyMjo1NjEyMyAxNTM3MjUyMDQ0" type="hidden"></td>
                                                        <td><input name="cmdSubmit" type="submit" id="cmdSubmit" value="Submit"  onClick="CheckLoginInfo(); return false;"; tabindex="3"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td>&nbsp;</td>
                                                        <td><a  <span class="txt1">

                                                                </span> 
                                                                <a class="txt2" href="<%=baseUrl%>/registration/reg.jsp">
                                                                    <b>Go Sing Up.. </b>
                                                                </a> </tr>
                                                </table></td>
                                        </tr>
                                        <tr>
                                            <td height="50"><div style="float:right; font-size:14px; color:#333333;"><b>Go Beyond | V-Track Communications</b></div></td>
                                        </tr>
                                    </table></td>
                            </tr>
                            <tr>
                                <td height="35" align="center"><a href="#" target="_blank"></a></td>
                            </tr>
                        </table></td>
                </tr>
            </table>
        </FORM>
    </body>
</html>


<%} else {

        response.sendRedirect("index.jsp");

    }
%>
