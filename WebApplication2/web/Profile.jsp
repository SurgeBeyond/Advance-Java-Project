<%-- 
    Document   : Profile
    Created on : Jan 20, 2021, 7:39:55 PM
    Author     : X012939
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.qasurgetechnologies.blog.entities.User"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-primary bg-gradient">
            <div class="container-fluid ">
                <a class="navbar-brand text-white" href="#"><span><i class='fab fa-artstation' style='font-size:36px'></i></span></a>
                <!--button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button-->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active text-white" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-white" href="#">Link</a>
                        </li>                           
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            </span><span><i class='fas fa-certificate' style='font-size:18px'></i> Categories
                    </a>
                    <ul class="dropdown-menu bg-primary bg-gradient mt-3" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item text-white" href="#">Java</a></li>
                        <li><a class="dropdown-item text-white" href="#">.NET</a></li>
                        <li><hr class="dropdown-divider text-white"></li>
                        <li><a class="dropdown-item text-white" href="#">PHP</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#"><span><i class='fas fa-envelope' style='font-size:20px'></i> Post</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="#"><span><i class='far fa-address-card' style='font-size:20px'></i></span> Address</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled text-white" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <!-- Button trigger modal -->
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link text-white" href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        User
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="LogoutServlet" >
                        Logout
                    </a>
                </li>
            </ul>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>
