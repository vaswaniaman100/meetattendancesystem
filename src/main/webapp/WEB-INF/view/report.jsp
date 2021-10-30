<%@page import="com.attendance.model.Classname"%>
<%@page import="com.attendance.model.Subjects"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

		<style type="text/css">
			.select2-container--open .select2-dropdown {
				left: 8px;
			}
		</style>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="/teacherheader"></jsp:include>
<br>
<%
List<Subjects> listsub = (List<Subjects>)request.getAttribute("listsub");
List<Classname> listclass = (List <Classname>) request.getAttribute("listclass");

%>


		<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>

<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="images/mcoe.jpg" style="width :180px; height :150px; margin-right:250%;">
        </div>
        
           </div>
           </div>
	 <form action="/report" method="post">
	  <div align="center" style="margin-top:1px;">
            <label for="subject">Subject name</label>&nbsp;&nbsp;&nbsp;
            <select id="subject" name="subject" style="width: 270px;">
		<%for(Subjects s:listsub){       %>
			<option value="<%=s.getSubjectname()%>"><%=s.getSubjectname() %></option>
			<%} %>
		</select>
          <br><br>
            <label for="classname">Class name </label>
            &nbsp;&nbsp;
            
            <select id="classname" name="classname" style="width: 270px;">
		<%for(Classname s:listclass){       %>
			<option value="<%=s.getName()%>"><%=s.getName() %></option>
			<%} %>
		</select>
            <br><br>
            <input type="submit" value="Create Report">
            </div>
        </form>
        <script type="text/javascript">
		$(document).ready(function() {
			
			$("#subject").select2({

			});
			$("#classname").select2({

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
<br>
<jsp:include page="/footer"></jsp:include>
</html>