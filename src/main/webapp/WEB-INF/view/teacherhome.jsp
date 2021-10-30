<%@page import="java.util.Collections"%>
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


	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js">
		</script>

<style type="text/css">
    .nav-link{
    color : white ! important;
    margin-right : 4px;
    }


</style>
</head>
<body>
<body>
<jsp:include page="/teacherheader"></jsp:include>
<br>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="images/mcoe.jpg" style="width :180px; height :150px; margin-right:250%;">
        </div>
        
     </div>
</div>
          
<marquee style="font-family : 'Monotype Corsiva'; font-size : 25px; color : white; background-color :maroon; font-weight : bold; margin-top:1%">
Teacher Name :-   &nbsp;&nbsp;&nbsp;&nbsp;	  <%=request.getAttribute("teachername") %>    
   </marquee>
<%
List<Lectures> listlectures = (List<Lectures>) request.getAttribute("lectureslist");
Collections.reverse(listlectures);
%>
<h1 style align="center">Lectures</h1>
<script
	src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
	<table id="lecture" class="table-hover" style="width: 100%">
		<thead>
			<tr style="background-color : #9A9898 ; color : white">
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
			<tr style="background-color : #DEB887">
			
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