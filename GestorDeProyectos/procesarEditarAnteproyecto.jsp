<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <title>Editar Anteproyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-4">
        <h1>Editar Anteproyecto</h1>
        <%
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String titulo = "";
            String descripcion = "";
            Date fechaLimite = null;
            String estado = "";
            int estudianteId = 0;
            int evaluadorId = 0;
            int directorId = 0;

            try {
                // Cargar el driver de PostgreSQL
                Class.forName("org.postgresql.Driver");
                // Establecer conexión a la base de datos
                conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");

                // Obtener datos del anteproyecto
                String query = "SELECT * FROM anteproyectos WHERE codigo = ?";
                stmt = conn.prepareStatement(query);
                stmt.setInt(1, codigo);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    titulo = rs.getString("titulo");
                    descripcion = rs.getString("descripcion");
                    fechaLimite = rs.getDate("fecha_limite");
                    estado = rs.getString("estado");
                    estudianteId = rs.getInt("estudiante_id");
                    evaluadorId = rs.getInt("evaluador_id");
                    directorId = rs.getInt("director_id");
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("<div class='alert alert-danger'>Error al cargar los datos: " + e.getMessage() + "</div>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
                }
            }
        %>

        <form action="actualizarAnteproyecto.jsp" method="POST">
            <input type="hidden" name="codigo" value="<%= codigo %>">
            <div class="form-group">
                <label>Título</label>
                <input type="text" name="titulo" value="<%= titulo %>" class="form-control" required>
            </div>
            <div class="form-group">
                <label>Descripción</label>
                <textarea name="descripcion" class="form-control"><%= descripcion %></textarea>
            </div>
            <div class="form-group">
                <label>Fecha Límite</label>
                <input type="date" name="fecha_limite" value="<%= fechaLimite != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(fechaLimite) : "" %>" class="form-control">
            </div>
            <div class="form-group">
                <label>Estado</label>
                <select name="estado" class="form-control" required>
                    <option value="Aprobado" <%= estado.equals("Aprobado") ? "selected" : "" %>>Aprobado</option>
                    <option value="Rechazado" <%= estado.equals("Rechazado") ? "selected" : "" %>>Rechazado</option>
                </select>
            </div>
            <input type="hidden" name="estudiante_id" value="<%= estudianteId %>">
            <input type="hidden" name="evaluador_id" value="<%= evaluadorId %>">
            <div class="form-group">
                <label>ID Director</label>
                <input type="number" name="director_id" value="<%= directorId %>" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
        <a href="anteproyectos.jsp" class="btn btn-secondary mt-3">Cancelar</a>
    </div>
</body>
</html>
