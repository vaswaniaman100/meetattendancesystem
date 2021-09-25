<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <script type="text/javascript">
    var alertsystem = "<%=(String)request.getAttribute("alertdata") %>";

	
	if(alertsystem == "successregister"){
		alert("Class added Successfully");
	}
    </script>

    <body>
        <form action="/addclass" method="post">
            <label for="cname">Class name</label>
            <input type="text" name="cname" id="cname"> <br><br>
       
            <br> <br>
            <input type="submit" value="Add Class">
        </form>
    </body>

    </html>