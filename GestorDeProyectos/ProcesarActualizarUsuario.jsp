<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html lang="es">
<head>
    <title>Actualizar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <% String id = request.getParameter("id"); %>
        <% String nombre = request.getParameter("nombre"); %>
        <% String correo = request.getParameter("correo"); %>
        <% String rol = request.getParameter("rol"); %>

        <% if (id != null && nombre != null && correo != null && rol != null) { %>
            <%
                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                    
                    int rolId = Integer.parseInt(rol);
                    int cedula = Integer.parseInt(id); // Convertir 'id' a entero
                    
                    pstmt = con.prepareStatement("UPDATE usuarios SET nombre=?, email=?, rol_id=? WHERE cedula=?");
                    pstmt.setString(1, nombre);
                    pstmt.setString(2, correo);
                    pstmt.setInt(3, rolId);
                    pstmt.setInt(4, cedula); // Cambiar a setInt para 'cedula'
                    int rowsUpdated = pstmt.executeUpdate();

                    if (rowsUpdated > 0) {
                        out.println("<div class='alert alert-success mt-3'>Usuario actualizado correctamente.</div>");
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>No se pudo actualizar el usuario.</div>");
                    }
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger mt-3'>Error al actualizar el usuario: " + e.getMessage() + "</div>");
                } catch (ClassNotFoundException e) {
                    out.println("<div class='alert alert-danger mt-3'>Error de clase: " + e.getMessage() + "</div>");
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger mt-3'>El rol y la cédula deben ser números válidos.</div>");
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        out.println("<div class='alert alert-danger mt-3'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
                    }
                }
            %>
        <% } else { %>
            <div class='alert alert-danger mt-3'>Faltan parámetros para actualizar el usuario.</div>
        <% } %>

        <a href="usuarios.jsp" class="btn btn-primary">Volver</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
