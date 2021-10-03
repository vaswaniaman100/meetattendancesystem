<%@page import="com.attendance.model.LectureAttendance"%>
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
		
		
		
		<script type="text/javascript" src="//unpkg.com/xlsx/dist/shim.min.js"></script>
		<script type="text/javascript" src="//cdn.jsdelivr.net/npm/xlsx/dist/xlsx.full.min.js"></script>
		<script type="text/javascript" src="//unpkg.com/blob.js@1.0.1/Blob.js"></script>
		<script type="text/javascript" src="//unpkg.com/file-saver@1.3.3/FileSaver.js"></script>
		
		
		
		<script>
				function doit(type, fn, dl) {
					var elt = document.getElementById('lecture');
					var wb = XLSX.utils.table_to_book(elt, {sheet:"Sheet JS"});
					return dl ?
						XLSX.write(wb, {bookType:type, bookSST:true, type: 'base64'}) :
						XLSX.writeFile(wb, fn || ('Attendance.' + (type || 'xlsx')));
				}
		</script>
		
		
		
		
		
		
		
</head>
<body>





<h1>Welcome to teacher home</h1>

<%
List<LectureAttendance> listlectureattendance = (List<LectureAttendance>) request.getAttribute("listattendance");

%>
<h1>Lectures</h1>
	<table id="lecture" class="display" style="width: 100%">
		<thead>
			<tr>
				<th>Sr no.</th>
				<th>Name</th>
			
			
			</tr>
		</thead>
		<tbody>
			<%
			for (LectureAttendance lecture : listlectureattendance) {
			%>
			<tr>
			
				<td></td>
				
				<td><%=lecture.getStudentname()%></td>
		

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<input type="button" value="Download Attendance" onclick="doit('xlsx');">
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