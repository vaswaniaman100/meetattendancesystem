<%@page import="com.attendance.model.Classname"%>
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
		alert("Class added Successfully");
	}
	else if(alertsystem == "duplicate"){
		alert("Class already exist");
	}
    </script>

    <body>
        <form action="/addclass" method="post">
            <label for="cname">Class name</label>
            <input type="text" name="cname" id="cname"> <br><br>
       
            <br> <br>
            <input type="submit" value="Add Class">
        </form>
        
        <!-- class list start -->
        <%
    	List<Classname	> listclass = (List<Classname>) request.getAttribute("listclass");
   		%>
    
    <h1>Class</h1>
        <table  id="classname" class="display" border =1 style="width:100% ; text-align: center;">
            <thead>
                <tr>
					<th>Sr no.</th>
                    <th>Id</th>
                    <th>name</th>
                </tr>
            </thead>
            <tbody>
            <%
          		for(Classname classname:listclass){          			
            %>
                <tr>
                    <td></td>
                    <td><%=classname.getId()%></td>
                    <td><%=classname.getName() %></td>

                </tr>               
           <%
          		 } 
           %>
            </tbody>
        </table>
        <script>
            $(document).ready(function () {
                $('#classname').DataTable({
                    "fnRowCallback": function (nRow, aData, iDisplayIndex) {
                        $("td:first", nRow).html(iDisplayIndex + 1);
                        return nRow;
                    },
                });
            });
        </script>
        
        <!-- class list end -->
    </body>

    </html>