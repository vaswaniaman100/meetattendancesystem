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

<body>
<jsp:include page="/teacherheader"></jsp:include>
<br>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="/images/mcoe.jpg" style="width :180px; height :150px">
        </div>
        </div>
        </div>
<%
List<LectureAttendance> listlectureattendance = (List<LectureAttendance>) request.getAttribute("listattendance");

%>
<style>
tr{text-align : center  }
</style>
<hr>
<div class="container">  
<h1 style align="center">Lectures</h1>
<script
	src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
	
	<table id="lecture" class="table-hover" style="width: 100%">
		<thead>
			<tr style="background-color : #9A9898 ; color : "white">
				<th>Sr no.</th>
				<th>Name</th>
			
			
			</tr>
		</thead>
		<tbody>
			<%
			for (LectureAttendance lecture : listlectureattendance) {
			%>
			<tr style="background-color : #DEB887">
			
				<td></td>
				
				<td><%=lecture.getStudentname()%></td>
		

			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	</div>

	<br>
	<br>
	<input type="button" value="Download Attendance" style="margin-left: 650px;"onclick="doit('xlsx');">
	<script>
		$(document).ready(function() {
			$('#lecture').DataTable({
				"fnRowCallback" : function(nRow, aData, iDisplayIndex) {
					$("td:first", nRow).html(iDisplayIndex + 1);
					return nRow;
				},
				  "paging": false,
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


<jsp:include page="/footer"></jsp:include>
</body>

</html>