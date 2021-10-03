<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <title>Attendance Management System</title>
            <script>
            var alertsystem = "<%=(String)request.getAttribute("faillogin") %>";

        	
        	if(alertsystem == "faillogin"){
        		alert("login failed please check username or password");
        	}
        	else if (alertsystem == "invalidlogin"){
        		alert("Invalid access");
            }
        	else if (alertsystem == "itd"){
        		alert("Invalid teacher username or password");
            }
        	
            </script>
        </head>

        <body>

            <form action="login" method="post">
                <label for="username">username</label>
                <input type="text" name="username" id="username"> <br><br>
                <label for="password">password</label>
                <input type="password" name="pass" id="pass">
                <br>
                <br>
                <input type="submit" value="Login">

            </form>

        </body>

        </html>