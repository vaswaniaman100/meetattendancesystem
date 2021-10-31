<%@page import="com.attendance.model.Teachers"%>
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
		alert("Teacher added Successfully");
	}
	else if(alertsystem == "duplicate"){
		alert("teacher already exist");
	}
    </script>

    <body>
    <jsp:include page="/header"></jsp:include>
    <br>
        <form action="/addteacher" method="post">
        <div align="center" style="margin-top:20px;">
            <label for="teachername">Teacher name</label>
            <input type="text" name="teachername" id="teachername"> <br><br>
            <label for="tpassword">Teacher Password</label>
            <input type="text" name="tpassword" id="tpassword">
            <br> <br>
            <input type="submit" value="Add Teacher">
            </div>
        </form>
        
        <!-- Teachers list start -->
    <%
    	List<Teachers> listteachers = (List<Teachers>) request.getAttribute("listteachers");
    %>
    <style>
tr{text-align : center  }
</style>
<hr>
<div class="container">
    <h1 style align="center">Teachers</h1>
        <table id="teacher" class="table-hover" style="width:100%">
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
          		for(Teachers teacher:listteachers){          			
            %>
                <tr style="background-color : #DEB887">
                    <td></td>
                    <td><%=teacher.getId() %></td>
                    <td><%=teacher.getName() %></td>
                    <td><%=teacher.getPassword() %></td>

                </tr>               
           <%
          		 } 
           %>
            </tbody>
        </table>
        <script>
            $(document).ready(function () {
                $('#teacher').DataTable({
                    "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                        $("td:first", nRow).html(iDisplayIndex + 1);
                        return nRow;
                    },
                });
            });
        </script>
        </div>
        <!-- Teachers list end -->
        
        <br>
<br>
<br>
<br>
<br>
        
<jsp:include page="/footer"></jsp:include>
    </body>

    </html>