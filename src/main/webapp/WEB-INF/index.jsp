<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <html>

        <head>
            <title>Attendance Management System</title>
            <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .nav-link{
    color : white ! important;
    margin-right : 4px;
 
    }

    .nav-link:hover{
    color : yellow ! important;
    font-weight : bold;
    background-color : maroon;
    border-radius : 10px;
    }
    .navbar-brand:hover{
    color : yellow ! important;
    }


</style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-3">
            <img src="images/mcoe.jpg" style="width :100px; height :100px; margin-top:10%;">
        </div>

        <div class="col-sm-6 mt-5 text-center">
            <span style= "font-weight : bold ; font-size : 30px">
                <span style="color: #C70039"> Meet Attendance System </span>
             
                
            </span>
        </div>

        <div class="col-sm-3 mt-5" style="padding-left : 10%">
<span style="font-weight : bold ; font-size: 30px">
    <span><i class="fa fa-twitter pl-1"> </i></span>
    <span><i class="fa fa-linkedin pl-1"> </i></span>
    <span><i class="fa fa-instagram pl-1"> </i></span>
    <span><i class="fa fa-telegram pl-1"> </i></span>

</span>
        </div>
    </div>

</div>
<br>
<nav class="navbar navbar-expand-sm" style="background-color :#581845  ">
    <a href = "/"class="navbar-brand text-white pl-5 font-weight-bold" style="font-family :'Monotype Corsiva'">Meet Attendance System</a>
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="/" style="margin-left:280px"><i class="fa fa-home mr-1"></i>Home</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/adminhome" style="margin-left:50px"><i class="fa fa-users mr-1"></i>Admin</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="/adminhome" style="margin-left:50px" ><i class="fa fa-user-plus mr-1"></i>Teacher</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="https://moderncoe.edu.in/about-institute.php" style="margin-left:50px"><i class="fa fa-sign-language mr-1"></i>About Us</a>
        </li>


        <li class="nav-item">
            <a class="nav-link" href="https://moderncoe.edu.in/contact-us.php"style="margin-left:50px" ><i class="fa fa-sign-in mr-1"></i>Contact Us</a>
        </li>

    </ul>

</nav>
</body>
</html>
            
            
            
            
            <script>
            var alertsystem = "<%=(String)request.getAttribute("faillogin") %>";

        	
        	if(alertsystem == "faillogin"){
        		alert("login failed please check username or password");
        	}
        	else if (alertsystem == "invalidlogin"){
        		alert("Invalid access");
            }
        	else if (alertsystem == "itd"){
        		alert("Invalid teacher username or password");
            }
        	
            </script>
        </head>

        <body>
         <form action="login" method="post">
        <div align="center" style="margin-top:20px;">
            <form action="login" method="post" >
                <label for="username">username</label>
                <input type="text" name="username" id="username"> <br><br>
                <label for="password">password</label>
                <input type="password" name="pass" id="pass">
                <br>
                <br>
                <input type="submit" value="Login">
</form>
</div>
</form> 
<br>
        <br>
        <br>
        <br>
        <br>
        <br>     
<jsp:include page="/footer"></jsp:include>
        </body>
        </html>
