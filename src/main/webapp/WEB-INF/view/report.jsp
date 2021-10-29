<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
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
	 <form action="/report" method="post">
	  <div align="center" style="margin-top:1px;">
            <label for="subject">Subject name</label>
            <input type="text" name="subject" id="subject"> <br><br>
            <label for="classname">Class name </label>
            <input type="text" name="classname" id="classname"> <br><br>
            <input type="submit" value="Create Report">
        </form>
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