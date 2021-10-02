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
<style type="text/css">
	.select2-container--open .select2-dropdown {
    	left: 8px;
	}
</style>

</head>

<body>
	<br>
	<br>
	<a href="/addteacher">Add teacher</a>
	<br>
	<a href="/addsubject">Add subject</a>
	<br>
	<a href="/addclass">Add Class Name</a>
	<br>
	<a href="/deleteteacher">Delete teacher</a>
	<br>
	<a href="/deletesubject">delete subject teacher</a>
	<br>
	<a href="/deleteclassname">delete class</a>
	<br>

	<br>
	<br>
	<!-- Teachers list start -->
	<%
	List<Teachers> listteachers = (List<Teachers>) request.getAttribute("listteachers");
	%>

	<h1>Teachers</h1>
	<table id="teacher" class="display" style="width: 100%">
		<thead>
			<tr>
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
			<tr>
			
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

	<h1>Subjects</h1>
	<table id="subject" class="display" style="width: 100%">
		<thead>
			<tr>
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
			<tr>
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

	<h1>Class</h1>
	<table id="classname" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr no.</th>
				<th>Id</th>
				<th>name</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (Classname classname : listclass) {
			%>
			<tr>
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
 
<h1>DropDown with Search using jQuery</h1>
		<div>
			<select id="country" style="width:270px;">
			<!-- Dropdown List Option -->
			 	<option value="volvo">Volvo</option>
  				<option value="saab">Saab</option>
  				<option value="mercedes">Mercedes</option>
  				<option value="audi">Audi</option>
			 	<option value="volvo">Volvo</option>
  				<option value="saab">Saab</option>
  				<option value="mercedes">Mercedes</option>
  				<option value="audi">Audi</option>
			 	<option value="volvo">Volvo</option>
  				<option value="saab">Saab</option>
  				<option value="mercedes">Mercedes</option>
  				<option value="audi">Audi</option>
			</select>
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>


</body>

</html>