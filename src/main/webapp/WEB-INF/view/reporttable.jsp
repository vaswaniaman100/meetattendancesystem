<%@page import="java.util.stream.Collectors"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.attendance.model.LectureAttendanceR"%>
<%@page import="com.attendance.model.LectureAttendance"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css">	
          <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
</head>
<body>
<jsp:include page="/teacherheader"></jsp:include>
<br>
<style>
tr{text-align : center  }
</style>
<hr>
<div class="container">
<h1 style align="center">Report Table</h1>

<%
List<Integer> listoflecid=(List<Integer>)request.getAttribute("listoflecid");
List<Timestamp> datelist=(List<Timestamp>)request.getAttribute("datelist");
List<LectureAttendance> attendance1=(List<LectureAttendance>)request.getAttribute("attendance");
System.out.println(attendance1);
List<LectureAttendanceR> attendance = new ArrayList<>();
for(LectureAttendance las :attendance1){
	attendance.add( new LectureAttendanceR(las.getLectureid(),las.getStudentname()));
}
List<String> studentsname=attendance.stream().map(LectureAttendanceR::getStudentname).distinct().toList();
System.out.println(listoflecid);
System.out.println(attendance);
System.out.println(studentsname);


%>
<table id="teacher" class="display" style="width:100%">
            <thead>
                <tr style="background-color : #9A9898 ; color : white">
                 
                    <th>Student name</th>
                
                   <%for(Timestamp time:datelist){ %>
                   		 <th><%=time %></th>
                   		  
                  <% }%>
                 
                </tr>
            </thead>
            <tbody>
            <%
            int pos = 0;
            int tmp=0;
            for(String sname:studentsname){ %>
            <tr style="background-color : #DEB887">
                 
                    <td><%=sname %></td>
           <%
        	   for(Integer id:listoflecid){
        		  if(attendance.contains(new LectureAttendanceR(id,sname))){
        			  
                    out.write("<td>present </td>");
        		  }
        		  else{
        			  out.write("<td>absent </td>");
        		  }
          
  				}
           
           %>
             </tr> 
           <%
           }%>
        
            </tbody>
        </table>
        
        
         <script>
            $(document).ready(function () {
                $('#teacher').DataTable({
                   // "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                   //     $("td:first", nRow).html(iDisplayIndex + 1);
                    //    return nRow;
                   // },
                	 "scrollX": true,
                });
            });
        </script>
        
       </div>
       
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