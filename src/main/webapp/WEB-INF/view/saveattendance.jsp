<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<form action="/saveattendance1" method="post">
		<label>Comments</label>
		
		<input type="text" name="comment" id="comment">
		<br><br>
		<label>Teacher Name</label> 
		<input type="text" name="teachername" id="teachername"><br><br>
		<label>Password</label>
		<input type="text" name="password" id="password"><br><br>
		<label>Class</label>
		<input type="text" name="classname" id="classname"><br><br>
		<label>Subject</label>
		<input type="text" name="subject" id="subject"><br><br>
		<input type="submit" value="Submit">


	</form>
</body>
</html>