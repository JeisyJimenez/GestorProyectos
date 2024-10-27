<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html lang="es">
<head>
    <title>Eliminar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <% String cedula = request.getParameter("cedula"); %>

        <% if (cedula != null && !cedula.isEmpty()) { %>
            <%
                try {
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                    PreparedStatement pstmt = con.prepareStatement("DELETE FROM usuarios WHERE cedula::text = ?");
                    pstmt.setString(1, cedula);
                    int rowsDeleted = pstmt.executeUpdate();

                    if (rowsDeleted > 0) {
                        out.println("<div class='alert alert-success mt-3'>Usuario eliminado correctamente.</div>");
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>No se pudo eliminar el usuario.</div>");
                    }

                    pstmt.close();
                    con.close();
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger mt-3'>Error al eliminar el usuario: " + e.getMessage() + "</div>");
                }
            %>
        <% } else { %>
            <div class='alert alert-danger mt-3'>Falta el parámetro cédula para eliminar el usuario.</div>
        <% } %>

        <a href="administrador.jsp" class="btn btn-primary mt-3">Volver</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
