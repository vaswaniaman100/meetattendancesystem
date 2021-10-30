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
		
		

		<style type="text/css">
			.select2-container--open .select2-dropdown {
				left: 8px;
			}
			th, td {
			  padding: 10px;
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

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="images/mcoe.jpg" style="width :180px; height :150px; margin-right:250%;">
        </div>
        
     </div>
</div>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>

	<form action="/saveattendance1" method="post">
	<center>
		<table style="align-content: center;">
			<tr>
				<td><label>Comments</label></td>
				<td><input type="text" name="comment" id="comment"></td>
			</tr>
			<tr>
				<td><label>Teacher Name</label> </td>
				<td><select id="teachername" name="teachername" style="width: 270px;">
							<%for(String s:teacherName){       %>
								<option value="<%=s%>"><%=s %></option>
								<%} %>
							</select>
				</td>
			</tr>
			<tr>
				<td><label>Password</label></td>
				<td><input type="text" name="password" id="password"></td>
			</tr>
			<tr>
				<td><label>Class</label></td>
				<td><select id="classname" name="classname" style="width: 270px;">
		<%for(String s:className){       %>
			<option value="<%=s%>"><%=s %></option>
			<%} %>
		</select></td>
			</tr>
			<tr>
				<td><label>Subject</label></td>
				<td><select id="subject" name="subject" style="width: 270px;">
					<%for(String s:subjectName){       %>
						<option value="<%=s%>"><%=s %></option>
						<%} %>
					</select>
				</td>
			</tr>
			<tr>
			<td style="text-align: center;" colspan="2"><input type="submit" value="Submit"></td>
			</tr>
			
		</table>
	
		
		</center>
		
		

        
		
		
		
	
		
		
		
		
		
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
<jsp:include page="/footer"></jsp:include>
</html>