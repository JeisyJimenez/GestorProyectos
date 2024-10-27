<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <title>Calificar Anteproyectos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron">
            <h1 class="text-center mb-3">Calificar Anteproyectos</h1>
        </div>
        <table class="table">
            <thead>
                <tr>
                    <th>Código</th>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Fecha de Creación</th>
                    <th>Fecha Límite</th>
                    <th>Estado</th>
                    <th>ID Estudiante</th>
                    <th>ID Evaluador</th>
                    <th>ID Director</th>
                    <th>Editar Estado</th>
                </tr>
            </thead>
            <tbody>
                <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/proyectos" user="root" password="" />
                <sql:query var="result" dataSource="${dataSource}">
                    SELECT * FROM anteproyectos;
                </sql:query>
                
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td>${row.codigo}</td>
                        <td>${row.titulo}</td>
                        <td>${row.descripcion}</td>
                        <td>${row.fecha_creacion}</td>
                        <td>${row.fecha_limite}</td>
                        <td>${row.estado}</td>
                        <td>${row.estudiante_id}</td>
                        <td>${row.evaluador_id}</td>
                        <td>${row.director_id}</td>
                        <td>
                            <form action="updateEstado.jsp" method="POST">
                                <input type="hidden" name="codigo" value="${row.codigo}">
                                <select name="nuevoEstado" class="form-control">
                                    <option value="Aprobado">Aprobado</option>
                                    <option value="Rechazado">Rechazado</option>
                                </select>
                                <button type="submit" class="btn btn-primary mt-2">Actualizar</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="director.jsp" class="btn btn-primary">Volver</a>
    </div>
    <br>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
