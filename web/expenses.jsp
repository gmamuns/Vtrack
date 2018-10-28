<%@include file="header.jsp" %>
<%@page import="model.VtrackModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.WeatherModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="model.RegistrationModel"%>
<%@page import="java.util.List"%> 


<% 
    String error = request.getParameter("error");
    String username = "";
    if (request.getParameter("userid") != null || request.getParameter("userid") != null) {
        username = request.getParameter("userid"); // get username from parameter first
    } else {
        username = (String) session.getAttribute("userid"); // if parameter missing get it from session
    }

    Connection con = null;
    List<VtrackModel> list = new ArrayList<VtrackModel>();
    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);
        PreparedStatement ps = con.prepareStatement("SELECT DISTINCT vid FROM `vtrack` WHERE uname = '" + username + "' ");

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            VtrackModel e = new VtrackModel();

            e.setVid(rs.getString(1));

            list.add(e);
        }
        con.close();

    } catch (Exception e) {
        System.out.println(e);
    }


%> 

<!DOCTYPE html>
<html>
    <head>
        <title> V-track Communications </title>
        <script language="javascript" type="text/javascript">
            function clearText(field)
            {
                if (field.defaultValue == field.value)
                    field.value = '';
                else if (field.value == '')
                    field.value = field.defaultValue;
            }
        </script>
        <link rel="stylesheet" href ="css/expenses_style.css">
    </head>

    <body>
         <h1><center><%=error %></center></h1>
        <div class="container templete clear" id="pdf-iframe" style="background-color: white">
            <%if (error != null && !error.isEmpty()) {%>
            <h1><center><%=error %></center></h1>
            <% }%>
            <h1><center>Daily Expenses Insertion Form</center></h1>
            <form method="post" action="expense_insert.jsp">

                <div class="form-group">
                    <label for="vid">Vehicle Name:</label>
                    <select class="form-control" name="vid">
                        <% for (VtrackModel e : list) {%>
                        <option value=<%=e.getVid()%>><%=e.getVid()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="form-group">
                    <label for="date">Date :</label>
                    <input  class="form-control" type="date" placeholder="Date" name="date">
                </div>

                <div class="form-group">
                    <label for="head">Header :</label>
                    <select id="head" name="head">
                        <option value="gas">Gas</option>
                        <option value="oil">Oil</option>
                        <option value="maintainence">Maintainence</option>
                        <option value="legal">Legal Expenses</option>
                        <option value="fitnes">Fitnes</option>
                        <option value="tax">Tax</option>
                        <option value="insurence">Insurence</option>
                        <option value="garaze">Garaze</option>

                    </select>
                </div>

                <div class="form-group">
                    <label for="amount">Expense Ammount :</label>
                    <input  class="form-control" type="text" placeholder="ex_amount" name="ex_amount">
                </div>
                
                <div class="form-group">
                    <label for="income">Daily Income :</label>
                    <input  class="form-control" type="text" placeholder="Daily Income" name="income">
                </div>

                <div class="form-group">
                    <label for="description">Description :</label>
                    <textarea class="form-control"id="subject" name="description" placeholder="Description" style="height:80px"></textarea>
                </div>


                <button type="submit" class="btn btn-default">Submit</button>
                <button type="reset" class="btn btn-default">Reset</button>

            </form>
        </div>



    </section>


</div>

<div class="footer templete clear">
    <tr>
        <td colspan="2" align="center"><table width="950" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="16" style="height: 11px"><img src="images/nex_footer11.png" width="17" height="33" border="0"></td>
                    <td align="center" background="images/nex_footer22.png" height="33" style="height: 11px"><table width="390" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td width="250" height="33"><strong>Powered By : V-track     Communications</strong></td>

                                <td width="106">
                                    <!-- <a href="http://www.nexsecure.info" target="_blank"><img src="../images/nex_logo.png" width="94" height="13" border="0" title="www.nexsecure.info"></a></td> -->
                            </tr>
                        </table></td> 
                    <td width="16" style="height: 11px"><img src="images/nex_footer33.png" width="17" height="33" border="0"></td>
                </tr> 

</div>
</body>
</html>