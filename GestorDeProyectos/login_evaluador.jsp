<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Evaluador</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/x-icon" href="img/img1.png">
    <style>
        body {
            background-color: #d4edda; /* Fondo verde pastel claro para todo el cuerpo */
        }

        .container {
            max-width: 600px; /* Aumentar el tamaño máximo del contenedor */
            margin: 100px auto; /* Centrar el contenedor vertical y horizontalmente con más espacio arriba */
            padding: 30px; /* Mayor espacio interno */
            background-color: #ffffff; /* Fondo blanco para el contenedor del login */
            border-radius: 8px; /* Bordes redondeados */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }

        .form-group {
            margin-bottom: 15px;
        }

        .btn-block {
            width: 100%;
            background-color: #4caf50; /* Verde más oscuro para el botón */
            border: none; /* Sin borde */
        }

        .btn-block:hover {
            background-color: #388e3c; /* Color más oscuro al pasar el ratón */
        }

        /* Estilo para eliminar el color azul al hacer clic */
        .btn-block:focus {
            outline: none; /* Eliminar el borde azul al hacer clic */
            box-shadow: none; /* Sin sombra azul al hacer clic */
        }

        h2 {
            color: #2e7d32; /* Verde más oscuro para el título */
        }

        .text-danger {
            color: red; /* Color rojo para mensajes de error */
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <h2 class="text-center">Bienvenido</h2>
        <% 
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            String url = "jdbc:postgresql://localhost:5432/proyectos"; 
            String username = "postgres"; 
            String passwordDB = "SILVER"; // Cambia esto a tu contraseña real
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                // Cargar el driver JDBC de PostgreSQL
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection(url, username, passwordDB);
                
                ps = con.prepareStatement("SELECT * FROM usuarios WHERE email = ? AND contrasena = ?");
                ps.setString(1, email);
                ps.setString(2, password);
                
                rs = ps.executeQuery();
                
                if (rs.next()) {
                    session.setAttribute("email", email);
                    response.sendRedirect("evaluador.jsp");
                } else {
        %>
                    <div id="error-message" class="text-center mb-3">
                        <p class="text-danger">Credenciales inválidas. Inténtelo de nuevo.</p>
                    </div>
                    <script>
                        setTimeout(function() {
                            var errorMessage = document.getElementById('error-message');
                            if (errorMessage) {
                                errorMessage.style.display = 'none';
                            }
                        }, 5000);
                    </script>
        <%
                }
            } catch (Exception e) {
                out.println("<p class='text-danger'>Error: " + e.getMessage() + "</p>");
            } finally {
                // Cierre de recursos
                if (rs != null) try { rs.close(); } catch (SQLException e) { /* Manejar error */ }
                if (ps != null) try { ps.close(); } catch (SQLException e) { /* Manejar error */ }
                if (con != null) try { con.close(); } catch (SQLException e) { /* Manejar error */ }
            }
        %>
        <div class="text-center mb-3">
            <form action="login_evaluador.jsp" method="post">
                <div class="form-group">
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </form>
        </div>

        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary btn-block mt-3">Regresar</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
