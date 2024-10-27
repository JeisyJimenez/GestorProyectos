<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="WEB-INF/jspf/conexion.jspf" %>
<html lang="es">
<head>
    <title>Error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom-styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron">
                <h1 class="text-center mb-3">Oops! Algo salió mal.</h2>
                <p class="error-message">
                <center>
                <c:out value="${pageContext.exception.message}" />
                </center>
                </p>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-5lKLE+Q9iZK3oHakxjJ9jv1IYpDJoEujgTmx9YoRWQHTomz9flp6qFbVyBhZHpws" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk5KVYm1c+8fBhsitF0kg2rs0kPvF6Yg4fF" crossorigin="anonymous"></script>
</body>
</html>