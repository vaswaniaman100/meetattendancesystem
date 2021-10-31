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


	if(alertsystem == "successdelete"){
		alert("Class deleted Successfully");
	}
	else if(alertsystem == "notexist"){
		alert("id is not available");
	}
    </script>

    <body>
    <jsp:include page="/header"></jsp:include>
    <br>
        <form action="/deleteclassname" method="post">
        <div align="center" style="margin-top:20px;">
			<label for="cid">Enter class id</label>
            <input type="text" name="cid" id="cid"> <br><br>
            <input type="submit" value="Delete">
            </div>
        </form>
        
        <!-- class list start -->
        <%
    	List<Classname	> listclass = (List<Classname>) request.getAttribute("listclass");
   		%>
    <style>
tr{text-align : center  }
</style>
<hr>
<div class="container">
    <h1 style align="center">Class</h1>
        <table  id="classname" class="table-hover" border =1 style="width:100% ; text-align: center;">
            <thead>
                <tr style="background-color : #9A9898 ; color : white">
					<th>Sr no.</th>
                    <th>Id</th>
                    <th>name</th>
                </tr>
            </thead>
            <tbody>
            <%
          		for(Classname classname:listclass){          			
            %>
                <tr style="background-color : #DEB887">
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
        </div>
        
        <!-- class list end -->
        <br>
<br>
<br>
<br>
<br>
<jsp:include page="/footer"></jsp:include>
    </body>

    </html>