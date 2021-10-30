<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="com.attendance.model.Classname"%>
<%@page import="com.attendance.model.Subjects"%>
<%@page import="com.attendance.model.Teachers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script src="//code.jquery.com/jquery.min.js"></script>
		
		
		
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
		<style type="text/css">
			.select2-container--open .select2-dropdown {
				left: 8px;
			}
		</style>
	
</head>
<body>
<jsp:include page="/teacherheader"></jsp:include>
<br>
	<%
	List<Teachers> listteachers = (List<Teachers>) request.getAttribute("listteachers");
	List<String> teacherName = listteachers.stream().map(m->m.getName()).collect(Collectors.toList());
	
	List<Subjects> listsubject = (List<Subjects>) request.getAttribute("listsubject");
	List<String> subjectName = listsubject.stream().map(m->m.getSubjectname()).collect(Collectors.toList());
	List<Classname> listclass = (List<Classname>) request.getAttribute("listclass");
	List<String> className = listclass.stream().map(m->m.getName()).collect(Collectors.toList());
	%>



	<form action="/saveattendance1" method="post">
	
		<label>Comments</label>
		
		<input type="text" name="comment" id="comment">
		<br><br>
	
		<label>Teacher Name</label> 
	
		<select id="teachername" name="teachername" style="width: 270px;">
		<%for(String s:teacherName){       %>
			<option value="<%=s%>"><%=s %></option>
			<%} %>
		</select>
		
		<br><br>
        
		<label>Password</label>
		<input type="text" name="password" id="password"><br><br>
		<label>Class</label>
	<select id="classname" name="classname" style="width: 270px;">
		<%for(String s:className){       %>
			<option value="<%=s%>"><%=s %></option>
			<%} %>
		</select><br><br>
		<label>Subject</label>
		
		<select id="subject" name="subject" style="width: 270px;">
		<%for(String s:subjectName){       %>
			<option value="<%=s%>"><%=s %></option>
			<%} %>
		</select><br><br>
		<input type="submit" value="Submit">
		
		
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#teachername").select2({

			});
			$("#classname").select2({

			});
			$("#subject").select2({

			});
		});
	</script>
</body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="/footer"></jsp:include>
</html>