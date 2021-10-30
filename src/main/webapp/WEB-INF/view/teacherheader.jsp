<%@page import="com.attendance.model.Classname"%>
<%@page import="com.attendance.model.Subjects"%>
<%@page import="com.attendance.model.Teachers"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
    .nav-link{
    color : maroon ! important;
    
    margin-left :100px;
    }

    .nav-link:hover{
    color : maroon ! important;
    font-weight : bold;
    background-color : maroon;
    border-radius : 20px;
    }
    .navbar-brand:hover{
    color : maroon ! important;
    }

</style>
<body>
    <nav class="navbar-expand-lg navbar navbar-dark bg-secondary">
        <a class="navbar-brand" href="/teacherhome" style="margin-left:700px;"><i class="fa fa-home mr-1"></i>Home</a>
        <a class="navbar-brand" href="/report" style="margin-left:150px;"><i class="fa fa-list-ol mr-1"></i>Report</a>
        <a class="navbar-brand" href="/logout" style="margin-left:150px;"><i class="fa fa-sign-out mr-1"></i>Logout</a>
       
    </nav>
</body>
</html>
        