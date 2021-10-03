<%@page import="com.attendance.model.Lectures"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<style type="text/css">

</style>
<script
	src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js">
		</script>


</head>
<body>
	<h1>Welcome to teacher home</h1>
	<h1> Teacher Name :-   &nbsp;&nbsp;&nbsp;&nbsp;	  <%=request.getAttribute("teachername") %></h1>

<%
List<Lectures> listlectures = (List<Lectures>) request.getAttribute("lectureslist");

%>
<h1>Lectures</h1>
	<table id="lecture" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr no.</th>
				<th>id</th>
				<th>Comments</th>
				<!-- <th>Name</th> -->
				<th>Date and time</th>
				<th>Class</th>
				<th>Subject</th>
			
			</tr>
		</thead>
		<tbody>
			<%
			for (Lectures lecture : listlectures) {
			%>
			<tr>
			
				<td></td>
				<td><a href = "/attendance/<%=lecture.getLectureid()%>"><%=lecture.getLectureid()%></a></td>
				<td><%=lecture.getLecturecomments()%></td>
				<!-- <td><%=lecture.getTeachername()%></td> -->
				<td><%=lecture.getDateoflec()%></td>
				<td><%=lecture.getClassname()%></td>
				<td><%=lecture.getSubject()%></td>
			

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('#lecture').DataTable({
				"fnRowCallback" : function(nRow, aData, iDisplayIndex) {
					$("td:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},
			});
		});
	</script>




</body>
</html>