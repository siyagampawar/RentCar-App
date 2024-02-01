<%-- 
    Document   : fare
    Created on : 12 Feb, 2023, 3:20:43 PM
    Author     : Siyag
--%>
<%@page import = "java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="favicon.png">
       <title >Rent in Nagpur - Rentcar</title>
    </head>
    <body>
        <%! String veh;String drop;String pickup;String dropl;String km;String seater;String tfare;%>
    <center>
        <div>
               <a href="loginpage.html">
                   <img src="rentcars.png" width="300" height="90" style=" padding-left: 10px; padding-top: 10px">
               </a>
               <h3 style="color:#e88504; font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif">Rentcar services from Nagpur</h3>
               <h4 style="color:#e88504; font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif">Now travel by road and worry no more for your car. Our partners will take care of them.</h4>
        </div><hr><br></center>
        <% 
            PreparedStatement ps = null;
            PreparedStatement ps1 = null;
            drop = request.getParameter("Department");
            veh = request.getParameter("ride");
            String sql = "select * from Details where dropp=? and vehicle=?";
            String sql2 = "update Details set aval='Booked' where dropp=? and vehicle=?";
            if(drop != null && veh !=null)
            {
                try{
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/logincred2","cred","cred");
                    ps = con.prepareStatement(sql);
                    ps.setString(1, drop);
                    ps.setString(2, veh);
                    ResultSet rs = ps.executeQuery();
                    if(rs.next())
                    {
                        pickup = rs.getString("pick");
                        dropl = rs.getString("dropp");
                        km = rs.getString("kilo");
                        seater = rs.getString("vehicle");
                        tfare = rs.getString("total");
                        out.println("<center>Pickup Location: "+pickup+"</center>");
                        out.println("<center>Drop Location: "+dropl+"</center>");
                        out.println("<center>Total Kilometers: "+km+"</center>");
                        out.println("<center>Ride: "+seater+"</center>");
                        out.println("<center>Total Fare: "+tfare+"</center>");
                        
                    }
                    ps1 = con.prepareStatement(sql2);
                    ps1.setString(1, drop);
                    ps1.setString(2, veh);
                    ps1.execute();
                    ps1.close();
                    con.close();
                    %>
                    <br><center>Scan QR to pay:<br><img src ="QR.png" width="300" height="300"/></center>
    <center>Upload AADHAR card:
           <input type="file" name="File Upload" accept = ".pdf"/><br><br>
       <a href="page3.html">
           <img src="confirm.png" style="width: 150px; padding-left: 10px; padding-top: 10px">
       </a>
    </center>
                    <%
//                    out.println("<img src="QR.png" width="300" height="300"/>");
//                    RequestDispatcher rd = request.getRequestDispatcher("page2.html");
//                     rd.include(request, response);
                }
                catch(SQLException e)
                {
                    out.println(e);
                }
            }
            
        %>
<!--        <center>
           <div>
               <a href="loginpage.html">
                   <img src="rentcars.png" width="300" height="90" style=" padding-left: 10px; padding-top: 10px">
               </a>
               <h3 style="color:#e88504; font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif">Rentcar services from Nagpur</h3>
               <h4 style="color:#e88504; font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif">Now travel by road and worry no more for your car. Our partners will take care of them.</h4>
           </div><hr><br>
       <form method="Post" style=" size: 30; color: #212016; color:#5c5e60; font-family: Haettenschweiler, 'Arial', sans-serif;">
           Scan QR to pay:<br>
           <img src="QR.png" width="300" height="300" style="padding-left: 10px; padding-top: 10px"><br>
           Upload AADHAR card:
           <input type="file" name="File Upload" accept = ".pdf"/><br><br>
       <a href="page3.html">
           <img src="confirm.png" style="width: 150px; padding-left: 10px; padding-top: 10px">
       </a>
   </form>
       </center>-->
    </body>
</html>
