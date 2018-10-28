<%-- 
    Document   : leafletjsTest
    Created on : Sep 20, 2018, 4:55:44 PM
    Author     : mamuns

    https://www.latlong.net/ er example ta https://leafletjs.com/examples/quick-start/ ke use kore 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
              integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
              crossorigin=""/>
        <!-- Make sure you put this AFTER Leaflet's CSS -->
        <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
                integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
        crossorigin=""></script>



    </head>
    <body>
        <h1>Welcome to LeafletJS Map</h1>

        <div id="mapid" style="width: 600px; height: 400px;"></div>
        <script>

            var marker = L.marker([51.5, -0.09]).addTo(mymap);
        </script>

    </body>
</html>
