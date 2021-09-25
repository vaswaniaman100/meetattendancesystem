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
        <form action="/addteacher" method="post">
            <label for="teachername">Teacher name</label>
            <input type="text" name="teachername" id="teachername"> <br><br>
            <label for="tpassword">Teacher Password</label>
            <input type="text" name="tpassword" id="tpassword">
            <br> <br>
            <input type="submit" value="Add Teacher">
        </form>
        
        <!-- Teachers list start -->
    <%
    	List<Teachers> listteachers = (List<Teachers>) request.getAttribute("listteachers");
    %>
    
    <h1>Teachers</h1>
        <table id="teacher" class="display" style="width:100%">
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
          		for(Teachers teacher:listteachers){          			
            %>
                <tr>
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
        <!-- Teachers list end -->
    </body>

    </html>