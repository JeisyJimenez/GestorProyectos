<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ include file="WEB-INF/jspf/conexion.jspf" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<html lang="es">
<head>
    <title>Informe Evaluador</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron">
            <h1>Informe Evaluador</h1>
        </div>

        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Anteproyecto</th>
                        <th>Descripción</th>
                        <th>Estado</th>
                        <th>Calificación</th>
                        <th>Observaciones</th>
                        <th>Fecha de Calificación</th>
                    </tr>
                </thead>
                <tbody>
                    <sql:query var="result">
                        SELECT a.titulo, a.descripcion, a.estado, c.calificacion, c.observaciones, c.fecha
                        FROM anteproyectos a
                        INNER JOIN calificaciones c ON a.codigo = c.anteproyecto_id
                        WHERE a.estudiante_id = ?
                    </sql:query>

                    <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td>${row.titulo}</td>
                            <td>${row.descripcion}</td>
                            <td>${row.estado}</td>
                            <td>${row.calificacion}</td>
                            <td>${row.observaciones}</td>
                            <td>${row.fecha}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-5lKLE+Q9iZK3oHakxjJ9jv1IYpDJoEujgTmx9YoRWQHTomz9flp6qFbVyBhZHpws" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk5KVYm1c+8fBhsitF0kg2rs0kPvF6Yg4fF" crossorigin="anonymous"></script>
</body>
</html>
