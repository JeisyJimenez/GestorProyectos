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
        <div class="jumbotron">
            <h1 class="text-center mb-3">Actualizar Usuario</h1>
        </div>
        <% String cedulaParam = request.getParameter("cedula"); %>

        <% if (cedulaParam != null && !cedulaParam.isEmpty()) { %>
            <%
                try {
                    // Convertir cedulaParam a Integer
                    int cedulaInt = Integer.parseInt(cedulaParam);
                    
                    Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                    PreparedStatement pstmt = con.prepareStatement("SELECT nombre, email, rol_id FROM usuarios WHERE cedula = ?");
                    pstmt.setInt(1, cedulaInt); // Usar setInt para establecer un integer
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String nombre = rs.getString("nombre");
                        String correo = rs.getString("email");
                        int rolId = rs.getInt("rol_id");

                        String rol = "";
                        switch (rolId) {
                            case 1:
                                rol = "Administrador";
                                break;
                            case 2:
                                rol = "Coordinador";
                                break;
                            case 3:
                                rol = "Director";
                                break;
                            case 4:
                                rol = "Estudiante";
                                break;
                            case 5:
                                rol = "Evaluador";
                                break;
                            default:
                                rol = "Desconocido";
                        }
            %>
                        <form action="ProcesarActualizarUsuario.jsp" method="post">
                            <input type="hidden" name="id" value="<%= cedulaParam %>">
                            <div class="form-group">
                                <label for="cedula">Cédula:</label>
                                <input type="text" id="cedula" name="cedula" value="<%= cedulaParam %>" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label for="nombre">Nombre:</label>
                                <input type="text" id="nombre" name="nombre" value="<%= nombre %>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="correo">Email:</label>
                                <input type="email" id="correo" name="correo" value="<%= correo %>" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="rol">Rol:</label>
                                <select id="rol" name="rol" class="form-control" required>
                                    <option value="1" <%= rol.equals("Administrador") ? "selected" : "" %>>Administrador</option>
                                    <option value="2" <%= rol.equals("Coordinador") ? "selected" : "" %>>Coordinador</option>
                                    <option value="3" <%= rol.equals("Director") ? "selected" : "" %>>Director</option>
                                    <option value="4" <%= rol.equals("Estudiante") ? "selected" : "" %>>Estudiante</option>
                                    <option value="5" <%= rol.equals("Evaluador") ? "selected" : "" %>>Evaluador</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-success">Actualizar</button>
                            <a href="usuarios.jsp" class="btn btn-primary">Volver</a>
                        </form>
            <%      
                    } else {
                        out.println("<div class='alert alert-danger mt-3'>No se encontró el usuario con la cédula especificada.</div>");
                    }

                    rs.close();
                    pstmt.close();
                    con.close();
                } catch (NumberFormatException e) {
                    out.println("<div class='alert alert-danger mt-3'>Cédula no válida.</div>");
                } catch (SQLException e) {
                    out.println("<div class='alert alert-danger mt-3'>Error al obtener los datos del usuario: " + e.getMessage() + "</div>");
                }
            %>
        <% } else { %>
            <div class="alert alert-danger mt-3">No se especificó la cédula del usuario.</div>
        <% } %>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
