<%@page import="com.attendance.model.Subjects"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
         <link rel="stylesheet" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css">	
          <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
    </head>
    <script type="text/javascript">
    var alertsystem = "<%=(String)request.getAttribute("alertdata") %>";

	
	if(alertsystem == "successregister"){
		alert("subject added Successfully");
	}
	else if(alertsystem == "duplicate"){
		alert("Subject already exist");
	}
    </script>

    <body>
    <jsp:include page="/header"></jsp:include>
    <br>
        <form action="/addsubject" method="post">
        <div align="center" style="margin-top:20px;">
            <label for="sname">Subject name</label>
            <input type="text" name="sname" id="sname"> <br><br>
       
            <br> <br>
            <input type="submit" value="Add Subject">
            </div>
        </form>
        
          <!-- Subject list start -->
        <%
    	List<Subjects> listsubject = (List<Subjects>) request.getAttribute("listsubject");
   		%>
    <style>
tr{text-align : center  }
</style>
<hr>
<div class="container">
    <h1 style align="center">Subjects</h1>
        <table id="subject" class="table-hover" style="width:100%">
            <thead>
                <tr style="background-color : #9A9898 ; color : white">
                    <th>Sr no.</th>
                    <th>Id</th>
                    <th>name</th>
                </tr>
            </thead>
            <tbody>
            <%
          		for(Subjects subject:listsubject){          			
            %>
                <tr style="background-color : #DEB887">
                    <td></td>
                    <td><%=subject.getId() %></td>
                    <td><%=subject.getSubjectname() %></td>

                </tr>               
           <%
          		 } 
           %>
            </tbody>
        </table>
        <script>
            $(document).ready(function () {
                $('#subject').DataTable({
                    "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                        $("td:first", nRow).html(iDisplayIndex + 1);
                        return nRow;
                    },
                });
            });
        </script>
        </div>
        
        
        <!-- Subject list end -->
        <br>
        <br>
        <br>
        <jsp:include page="/footer"></jsp:include>
    </body>
    

    </html>