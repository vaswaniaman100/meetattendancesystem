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
		alert("Teacher added Successfully");
	}
    </script>

    <body>
        <form action="/addteacher" method="post">
            <label for="teachername">Teacher name</label>
            <input type="text" name="teachername" id="teachername"> <br><br>
            <label for="tpassword">Teacher Password</label>
            <input type="text" name="tpassword" id="tpassword">
            <br> <br>
            <input type="submit" value="Add Teacher">
        </form>
    </body>

    </html>