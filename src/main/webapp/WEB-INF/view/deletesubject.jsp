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

	

	if(alertsystem == "successdelete"){
		alert("Subject deleted Successfully");
	}
	else if(alertsystem == "notexist"){
		alert("id is not available");
	}
    </script>

    <body>
        <form action="/deletesubject" method="post">
             <label for="sid">Enter Teacher id</label>
            <input type="text" name="sid" id="sid"> <br><br>
            <input type="submit" value="Delete">
        </form>
        
          <!-- Subject list start -->
        <%
    	List<Subjects> listsubject = (List<Subjects>) request.getAttribute("listsubject");
   		%>
    
    <h1>Subjects</h1>
        <table id="subject" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>Sr no.</th>
                    <th>Id</th>
                    <th>name</th>
                </tr>
            </thead>
            <tbody>
            <%
          		for(Subjects subject:listsubject){          			
            %>
                <tr>
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
        
        <!-- Subject list end -->
    </body>

    </html>