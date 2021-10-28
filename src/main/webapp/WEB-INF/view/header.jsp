<%@page import="com.attendance.model.Classname" %>
    <%@page import="com.attendance.model.Subjects" %>
        <%@page import="com.attendance.model.Teachers" %>
            <%@page import="java.util.List" %>
                <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta http-equiv="X-UA-Compatible" content="IE=edge">

                        <title>Document</title>

                    </head>
                    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                    <style>
                        .nav-link {
                            color: white ! important;
                            margin-right: 150px;
                            margin-left: 110px;
                        }

                        .nav-link:hover {
                            color: yellow ! important;
                            font-weight: bold;
                            background-color: red;
                            border-radius: 10px;
                        }

                        .navbar-brand:hover {
                            color: yellow ! important;
                        }
                    </style>

                    <body>
                        <nav class="navbar-expand-lg navbar navbar-dark bg-secondary">
                            <a class="navbar-brand" href="/adminhome" style="">Home</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav ">

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="home.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Teacher
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="addteacher">Add Teacher</a>
                                            <a class="dropdown-item" href="deleteteacher">Delete Teacher</a>



                                        </div>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="home.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Subject
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="addsubject">Add Subject</a>
                                            <a class="dropdown-item" href="deletesubject">Delete Subject</a>



                                        </div>
                                    </li>

                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="home.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Class
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="addclass">Add Class</a>
                                            <a class="dropdown-item" href="deleteclassname">Delete Class</a>



                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="logout">Logout</a>
                                    <li>


                                </ul>
                            </div>
                        </nav>




                    </body>

                    </html>