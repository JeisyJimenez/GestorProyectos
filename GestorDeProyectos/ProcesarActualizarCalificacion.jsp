<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<html lang="es">
<head>
    <title>Actualizar Calificación</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <% 
        // Obtener todos los parámetros
        String idStr = request.getParameter("id");
        String calificacionStr = request.getParameter("calificacion-" + idStr);
        String observaciones = request.getParameter("observaciones-" + idStr);
        String fechaStr = request.getParameter("fecha-" + idStr);
        
        if (idStr != null && calificacionStr != null && observaciones != null && fechaStr != null) { 
            try {
                int id = Integer.parseInt(idStr); // Convertir id a entero
                double calificacion = Double.parseDouble(calificacionStr); // Convertir calificacion a double

                // Convertir la fecha de string a java.sql.Date
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date parsedDate = format.parse(fechaStr);
                java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());

                // Cambiar la cadena de conexión a PostgreSQL
                Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                PreparedStatement pstmt = con.prepareStatement("UPDATE calificaciones SET calificacion=?, observaciones=?, fecha=? WHERE id=?");
                pstmt.setDouble(1, calificacion); // Asegúrate de usar setDouble para calificacion
                pstmt.setString(2, observaciones);
                pstmt.setDate(3, sqlDate); // Usar setDate para la fecha
                pstmt.setInt(4, id); // Asegúrate de usar setInt para el ID
                int rowsUpdated = pstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    out.println("<div class='alert alert-success mt-3'>Calificación actualizada correctamente.</div>");
                } else {
                    out.println("<div class='alert alert-danger mt-3'>No se pudo actualizar la calificación.</div>");
                }

                pstmt.close();
                con.close();
            } catch (SQLException e) {
                out.println("<div class='alert alert-danger mt-3'>Error al actualizar la calificación: " + e.getMessage() + "</div>");
            } catch (NumberFormatException e) {
                out.println("<div class='alert alert-danger mt-3'>El ID o la calificación proporcionados no son válidos.</div>");
            } catch (ParseException e) {
                out.println("<div class='alert alert-danger mt-3'>Error al parsear la fecha: " + e.getMessage() + "</div>");
            }
        } else { %>
            <div class="alert alert-danger mt-3">Faltan parámetros para actualizar la calificación.</div>
            <a href="calificarAnteproyecto2.jsp" class="btn btn-primary mt-3">Volver</a>
        <% } %>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
