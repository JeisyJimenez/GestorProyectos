<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<html lang="es">
<head>
    <title>Actualizar Estado de Anteproyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <% String codigoParam = request.getParameter("codigo"); %>

        <% if (codigoParam != null && !codigoParam.isEmpty()) { %>
            <%
                String nuevoEstado = request.getParameter("nuevoEstado");
                if (nuevoEstado != null && !nuevoEstado.isEmpty()) {
                    try {
                        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                        
                        // Convertir codigoParam a integer
                        int codigo = Integer.parseInt(codigoParam);
                        
                        String sql = "UPDATE anteproyectos SET estado = ? WHERE codigo = ?";
                        PreparedStatement pstmt = con.prepareStatement(sql);
                        pstmt.setString(1, nuevoEstado);
                        pstmt.setInt(2, codigo); // Cambiado a setInt
                        int rowsAffected = pstmt.executeUpdate();

                        if (rowsAffected > 0) {
            %>
                            <div class="alert alert-success mt-3">Estado actualizado correctamente.</div>
            <%
                        } else {
            %>
                            <div class="alert alert-danger mt-3">No se pudo actualizar el estado del anteproyecto.</div>
            <%
                        }

                        pstmt.close();
                        con.close();
                    } catch (SQLException e) {
            %>
                        <div class="alert alert-danger mt-3">Error al actualizar el estado: <%= e.getMessage() %></div>
            <%
                    } catch (NumberFormatException e) {
            %>
                        <div class="alert alert-danger mt-3">Error: Código no válido.</div>
            <%
                    }
                } else {
            %>
                    <div class="alert alert-danger mt-3">No se proporcionó el nuevo estado.</div>
            <%
                }
            %>
        <% } else { %>
            <div class="alert alert-danger mt-3">No se especificó el código del anteproyecto.</div>
        <% } %>
        
        <a href="aprobarAnteproyecto.jsp" class="btn btn-primary">Volver</a>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
