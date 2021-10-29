<%@page import="com.attendance.model.Classname"%>
<%@page import="com.attendance.model.Subjects"%>
<%@page import="com.attendance.model.Teachers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

<style>
	tr{
		text-align : center  
	}
</style>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>


	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		
<style type="text/css">
	.select2-container--open .select2-dropdown {
    	left: 8px;
	}
</style>

</head>

<body>  
<jsp:include page="/header"></jsp:include>
<script
	src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
	<br>
	<br>
	<%
	List<Teachers> listteachers = (List<Teachers>) request.getAttribute("listteachers");
	%>

<hr>
<div class="container">
	<h1 style align="center">Teachers</h1>
	<table id="teacher" class="table-hover" style="width: 100%">
		<thead>
			<tr style="background-color : #9A9898 ; color : white">
				<th>Sr no.</th>
				<th>Id</th>
				<th>name</th>
				<th>password</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Teachers teacher : listteachers) {
			%>
			<tr style="background-color : #DEB887">
			
				<td></td>
				<td><%=teacher.getId()%></td>
				<td><%=teacher.getName()%></td>
				<td><%=teacher.getPassword()%></td>

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('#teacher').DataTable({
				"fnRowCallback" : function(nRow, aData, iDisplayIndex) {
					$("td:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},
			});
		});
	</script>
	<!-- Teachers list end -->

	<!-- Subject list start -->
	<%
	List<Subjects> listsubject = (List<Subjects>) request.getAttribute("listsubject");
	%>
<style>
tr{text-align : center  }
</style>
<hr>
</div>
<div class="container">
	<h1 style align="center">Subjects</h1>
	<table id="subject" class="table-hover" style="width: 100%">
		<thead>
			<tr style="background-color : #9A9898 ; color : white">
				<th>Sr no.</th>
				<th>Id</th>
				<th>name</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (listsubject.isEmpty()) {

			} else {
				for (Subjects subject : listsubject) {
			%>
			<tr style="background-color : #DEB887">
				<td></td>
				<td><%=subject.getId()%></td>
				<td><%=subject.getSubjectname()%></td>

			</tr>
			<%
			}
			}
			%>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('#subject').DataTable({
				"fnRowCallback" : function(nRow, aData, iDisplayIndex) {
					$("td:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},
			});
		});
	</script>

	<!-- Subject list end -->


	<!-- class list start -->
	<%
	List<Classname> listclass = (List<Classname>) request.getAttribute("listclass");
	%>
<style>
tr{text-align : center  }
</style>
<hr>
</div>
<div class="container">
	<h1 style align="center">Class</h1>
	<table id="classname" class="table-hover" style="width: 100%">
		<thead>
			<tr style="background-color : #9A9898 ; color : white">
				<th>Sr no.</th>
				<th>Id</th>
				<th>name</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Classname classname : listclass) {
			%>
			<tr style="background-color : #DEB887">
				<td></td>
				<td><%=classname.getId()%></td>
				<td><%=classname.getName()%></td>

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('#classname').DataTable({
				"fnRowCallback" : function(nRow, aData, iDisplayIndex) {
					$("td:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},
			});
		});
	</script>

	<!-- class list end -->
</div>
		<script type="text/javascript">
			$(document).ready(function() {
				//var country = ["Australia", "Bangladesh", "Denmark", "Hong Kong", "Indonesia", "Netherlands", "New Zealand", "South Africa"];
				$("#country").select2({
				  
				});
			});
		</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="/footer"></jsp:include>
	
	
	<br>


</body>

</html>