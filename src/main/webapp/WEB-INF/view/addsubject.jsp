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
		alert("subject added Successfully");
	}
    </script>

    <body>
        <form action="/addsubject" method="post">
            <label for="sname">Subject name</label>
            <input type="text" name="sname" id="sname"> <br><br>
       
            <br> <br>
            <input type="submit" value="Add Subject">
        </form>
    </body>

    </html>