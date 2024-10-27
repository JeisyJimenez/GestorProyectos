<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <title>Actualizar Anteproyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Actualizar Anteproyecto</h1>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            String mensaje = "";

            try {
                // Cargar el driver de PostgreSQL
                Class.forName("org.postgresql.Driver");
                // Establecer conexión a la base de datos
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");

                // Obtener parámetros
                int codigo = Integer.parseInt(request.getParameter("codigo"));
                String titulo = request.getParameter("titulo");
                String descripcion = request.getParameter("descripcion");
                Date fechaLimite = Date.valueOf(request.getParameter("fecha_limite"));
                String estado = request.getParameter("estado");
                int estudianteId = Integer.parseInt(request.getParameter("estudiante_id"));
                int evaluadorId = Integer.parseInt(request.getParameter("evaluador_id"));
                int directorId = Integer.parseInt(request.getParameter("director_id"));

                // Consulta para actualizar el anteproyecto
                String updateQuery = "UPDATE anteproyectos SET titulo = ?, descripcion = ?, fecha_limite = ?, estado = ?, estudiante_id = ?, evaluador_id = ?, director_id = ? WHERE codigo = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setString(1, titulo);
                stmt.setString(2, descripcion);
                stmt.setDate(3, fechaLimite);
                stmt.setString(4, estado);
                stmt.setInt(5, estudianteId);
                stmt.setInt(6, evaluadorId);
                stmt.setInt(7, directorId);
                stmt.setInt(8, codigo);

                int filasActualizadas = stmt.executeUpdate();

                if (filasActualizadas > 0) {
                    mensaje = "Actualización exitosa.";
                } else {
                    mensaje = "No se encontró el anteproyecto para actualizar.";
                }
            } catch (SQLException | ClassNotFoundException e) {
                mensaje = "Error al actualizar el anteproyecto: " + e.getMessage();
            } catch (NumberFormatException e) {
                mensaje = "Error en la conversión de tipos: " + e.getMessage();
            } finally {
                try {
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    mensaje = "Error al cerrar la conexión: " + e.getMessage();
                }
            }
        %>
        <div class="alert alert-info">
            <%= mensaje %>
        </div>
        <a href="anteproyectos2.jsp" class="btn btn-primary">Volver</a>
    </div>
</body>
</html>
