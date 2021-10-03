<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <form action="/report" method="post">
            <label for="subject">Subject name</label>
            <input type="text" name="subject" id="subject"> <br><br>
            <label for="classname">Class name</label>
            <input type="text" name="classname" id="classname"> <br><br>
            <input type="submit" value="Create report">
        </form>
</body>
</html>