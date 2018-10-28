<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@include file="../properties.jsp" %>


<% //view-source:https://www.latlong.net/Show-Latitude-Longitude.html er google map key use koro
    Gson gsonObj = new Gson();
    Map<Object, Object> map = null;
    List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();

    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, user, password);
    Statement st = con.createStatement();

    ResultSet rs;
    rs = st.executeQuery("SELECT * FROM `vtrack` where uname = 'zia' order by regdate desc");
    //SELECT `vid`, `uname`, `lcode`, `lat`, `lon`, `regdate` FROM `vtrack` WHERE 1

    
        while (rs.next()) {
            out.println(Double.parseDouble(rs.getString("lat")));
            out.println(Double.parseDouble(rs.getString("lon")));
            out.println(rs.getTimestamp("regdate"));
            rs.getString("lat");
            rs.getString("lon");
            

            map = new HashMap<Object, Object>();
            //map.put("x",Long.parseLong( rs.getTimestamp("regdate").toString()));
            map.put("x", 1483209000000L);
            map.put("y", new Double[]{Double.parseDouble(rs.getString("lat")), Double.parseDouble(rs.getString("lon"))});
            list.add(map);
        }
        con.close();
    

// get lat & long from db and assign dynamically 
    /*
    map = new HashMap<Object, Object>();
    map.put("x", 1483209000000L);
    map.put("y", new Integer[]{30, 39});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1485887400000L);
    map.put("y", new Integer[]{30, 41});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1488306600000L);
    map.put("y", new Integer[]{36, 50});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1490985000000L);
    map.put("y", new Integer[]{39, 57});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1493577000000L);
    map.put("y", new Integer[]{46, 64});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1496255400000L);
    map.put("y", new Integer[]{52, 72});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1498847400000L);
    map.put("y", new Integer[]{55, 79});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1501525800000L);
    map.put("y", new Integer[]{55, 77});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1504204200000L);
    map.put("y", new Integer[]{52, 72});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1506796200000L);
    map.put("y", new Integer[]{45, 59});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1509474600000L);
    map.put("y", new Integer[]{36, 46});
    list.add(map);
    map = new HashMap<Object, Object>();
    map.put("x", 1512066600000L);
    map.put("y", new Integer[]{32, 41});
    list.add(map);
     */
    String dataPoints = gsonObj.toJson(list);
//out.println(dataPoints);
%>

<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
            window.onload = function () {

                var chart = new CanvasJS.Chart("chartContainer", {
                    animationEnabled: true,
                    exportEnabled: true,
                    title: {
                        text: "Recent History of your vehicle history"
                    },
                    axisY: {
                        includeZero: false,
                        title: "Latitude/Longitude (°)",
                        suffix: " °"
                    },
                    axisX: {
                        valueFormatString: "MMM"
                    },
                    data: [{
                            type: "rangeArea",
                            xValueFormatString: "MMMM",
                            yValueFormatString: "#,##0.## °F",
                            xValueType: "dateTime",
                            toolTipContent: " <span style=\"color:#4F81BC\">{x}</span><br><b>Lat:</b> {y[0]}<br><b>Long:</b> {y[1]}",
                            dataPoints: <%out.print(dataPoints);%>
                        }]
                });
                chart.render();

            }
        </script>
    </head>
    <body>
        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
        <!--<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>-->
        <script src="../resources/js/canvasjs.min.js" type="text/javascript"></script>
    </body>
</html>    