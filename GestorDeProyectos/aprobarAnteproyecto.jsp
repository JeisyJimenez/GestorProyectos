<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <title>Aprobar Anteproyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
    <style>
        body {
            background-color: #f9f9f9; /* Fondo gris claro */
        }
        .container {
            margin-top: 50px; /* Espacio superior */
        }
        .jumbotron {
            background-color: #e8f5e9; /* Verde pastel */
            border-radius: 10px; /* Bordes redondeados */
            padding: 30px; /* Espaciado interno */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }
        .jumbotron h1 {
            color: #2e7d32; /* Verde más oscuro */
        }
        table {
            background-color: #ffffff; /* Fondo blanco para la tabla */
            border-radius: 8px; /* Bordes redondeados para la tabla */
            overflow: hidden; /* Para aplicar bordes redondeados correctamente */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }
        th {
            background-color: #4caf50; /* Verde más oscuro para encabezados */
            color: white; /* Texto blanco */
        }
        .btn-primary {
            background-color: #4caf50; /* Botón verde más oscuro */
            border: none; /* Sin borde */
        }
        .btn-primary:hover {
            background-color: #388e3c; /* Botón más oscuro al pasar el ratón */
        }
        .text-danger {
            color: red; /* Color rojo para mensajes de error */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron text-center">
            <h1 class="mb-3">Aprobar Anteproyecto</h1>
        </div>
        <table class="table table-striped">
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
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Cargar el driver de PostgreSQL
                        Class.forName("org.postgresql.Driver");
                        // Establecer conexión a la base de datos
                        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");

                        // Consulta para obtener los anteproyectos
                        String query = "SELECT * FROM anteproyectos";
                        stmt = conn.prepareStatement(query);
                        rs = stmt.executeQuery();

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getInt("codigo") %></td>
                                <td><%= rs.getString("titulo") %></td>
                                <td><%= rs.getString("descripcion") %></td>
                                <td><%= rs.getDate("fecha_creacion") %></td>
                                <td><%= rs.getDate("fecha_limite") %></td>
                                <td><%= rs.getString("estado") %></td>
                                <td><%= rs.getInt("estudiante_id") %></td>
                                <td><%= rs.getInt("evaluador_id") %></td>
                                <td><%= rs.getInt("director_id") %></td>
                                <td>
                                    <form action="updateEstado.jsp" method="POST">
                                        <input type="hidden" name="codigo" value="<%= rs.getInt("codigo") %>">
                                        <select name="nuevoEstado" class="form-control">
                                            <option value="Aprobado">Aprobado</option>
                                            <option value="Rechazado">Rechazado</option>
                                        </select>
                                        <button type="submit" class="btn btn-primary mt-2">Actualizar</button>
                                    </form>
                                </td>
                            </tr>
                <%
                        }
                    } catch (SQLException | ClassNotFoundException e) {
                        out.println("<tr><td colspan='10' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            out.println("<tr><td colspan='10' class='text-danger'>Error al cerrar la conexión: " + e.getMessage() + "</td></tr>");
                        }
                    }
                %>
            </tbody>
        </table>
        <div class="text-center">
            <a href="director.jsp" class="btn btn-primary">Volver</a>
        </div>
    </div>
    <br>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
