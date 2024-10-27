<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html lang="es">
<head>
    <title>Panel de Administrador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
     <div class="container mt-4">
        <div class="jumbotron">
            <h1 class="text-center mb-3">Panel de Administrador</h1>
        </div>
                <div class="card">
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="usuarios.jsp">Gestionar Usuarios</a></li>                      
                        </ul>
                         <a href="index.jsp" class="btn btn-primary mt-3">Volver</a>
                    </div>
                </div>
            </div>
        </div>
        <br>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-5lKLE+Q9iZK3oHakxjJ9jv1IYpDJoEujgTmx9YoRWQHTomz9flp6qFbVyBhZHpws" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk5KVYm1c+8fBhsitF0kg2rs0kPvF6Yg4fF" crossorigin="anonymous"></script>
</body>
</html>
