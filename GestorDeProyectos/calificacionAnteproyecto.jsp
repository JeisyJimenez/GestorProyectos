<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Calificar Anteproyectos</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron">
            <h1 class="text-center mb-3">Calificar Anteproyectos</h1>
        </div>
        <form action="" method="POST">
            <div class="form-group">
                <label for="studentId">Cédula del Estudiante:</label>
                <input type="text" class="form-control" id="studentId" name="studentId" required>
            </div>
            <button type="submit" class="btn btn-primary">Cargar Información</button>
        </form>
        <br>
        <c:if test="${not empty param.studentId}">
            <%
                String url = "jdbc:postgresql://localhost:5432/proyectos"; 
                String username = "postgres"; 
                String passwordDB = "SILVER"; // Cambia esto a tu contraseña real
                
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection(url, username, passwordDB);

                    String studentIdStr = request.getParameter("studentId");
                    int studentId;

                    try {
                        studentId = Integer.parseInt(studentIdStr);
                    } catch (NumberFormatException e) {
                        out.println("<div class='alert alert-danger' role='alert'>Por favor, ingrese un ID de estudiante válido.</div>");
                        return; // Termina la ejecución si hay un error
                    }

                    String query = "SELECT c.id, c.calificacion, c.observaciones, c.fecha, " +
                                   "a.titulo AS anteproyecto, u.nombre AS evaluador " +
                                   "FROM calificaciones c " +
                                   "JOIN anteproyectos a ON c.anteproyecto_id = a.codigo " +
                                   "JOIN usuarios u ON c.evaluador_id = u.cedula " +
                                   "WHERE a.estudiante_id = ?";
                    
                    ps = con.prepareStatement(query);
                    ps.setInt(1, studentId); // Establecer el parámetro como entero
                    rs = ps.executeQuery();
            %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID Anteproyecto</th>
                        <th>Calificación</th>
                        <th>Observaciones</th>
                        <th>Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (!rs.isBeforeFirst()) { 
                            out.println("<tr><td colspan='4' class='text-center'>No se encontraron datos.</td></tr>");
                        } else {
                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><input type="text" name="calificacion-<%= rs.getInt("id") %>" value="<%= rs.getString("calificacion") %>" class="form-control" readonly></td>
                            <td><input type="text" name="observaciones-<%= rs.getInt("id") %>" value="<%= rs.getString("observaciones") %>" class="form-control" readonly></td>
                            <td><input type="text" name="fecha-<%= rs.getInt("id") %>" value="<%= rs.getString("fecha") %>" class="form-control datepicker" data-date-format="yyyy-mm-dd" readonly></td>
                        </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
            <a href="estudiante.jsp" class="btn btn-primary">Volver</a>
            <%
                } catch (Exception e) {
                    e.printStackTrace(); // Para depuración
                    out.println("<div class='alert alert-danger' role='alert'>Error al cargar los datos: " + e.getMessage() + "</div>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
                    if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                }
            %>
        </c:if>
    </div>
    <br>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script>
        $(document).ready(function(){
            $('.datepicker').datepicker();
        });
    </script>
</body>
</html>
