<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Ideas Proyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <div class="jumbotron">
            <h1 class="text-center mb-3">Ideas Proyecto</h1>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Descripción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String url = "jdbc:postgresql://localhost:5432/proyectos";
                    String username = "postgres"; 
                    String passwordDB = "SILVER"; // Cambia esto a tu contraseña real
                    
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("org.postgresql.Driver");
                        con = DriverManager.getConnection(url, username, passwordDB);
                        stmt = con.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM ideas_anteproyecto");

                        while (rs.next()) {
                %>
                            <tr>
                                <td><%= rs.getInt("id") %></td>
                                <td><%= rs.getString("titulo") %></td>
                                <td><%= rs.getString("descripcion") %></td>
                            </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace(); // Para depuración
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </tbody>
        </table>
        <a href="estudiante.jsp" class="btn btn-primary">Volver</a>
    </div>
    <br>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
