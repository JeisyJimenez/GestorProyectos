<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html lang="es">
<head>
    <title>Agregar Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <h3 class="mt-3 mb-4 text-center">Agregar Usuario</h3>

        <% 
        String mensaje = "";
        List<Map<String, String>> roles = new ArrayList<>();
        try {
            // Conexión a la base de datos
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");

            // Obtener roles
            PreparedStatement pstmt = con.prepareStatement("SELECT id, nombre FROM roles");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Map<String, String> rol = new HashMap<>();
                rol.put("id", rs.getString("id"));
                rol.put("nombre", rs.getString("nombre"));
                roles.add(rol);
            }

            // Procesar el formulario
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String cedulaStr = request.getParameter("cedula");
                int cedula = Integer.parseInt(cedulaStr); // Convertir a integer
                String nombre = request.getParameter("nombre");
                String email = request.getParameter("email");
                String contrasena = request.getParameter("contrasena");
                String rol_id = request.getParameter("rol_id");

                // Convertir rol_id a integer
                try {
                    int rolId = Integer.parseInt(rol_id);

                    // Insertar el nuevo usuario
                    PreparedStatement insertStmt = con.prepareStatement("INSERT INTO usuarios (cedula, nombre, email, contrasena, rol_id) VALUES (?, ?, ?, ?, ?)");
                    insertStmt.setInt(1, cedula); // Usar setInt para establecer el integer
                    insertStmt.setString(2, nombre);
                    insertStmt.setString(3, email);
                    insertStmt.setString(4, contrasena);
                    insertStmt.setInt(5, rolId); // Cambiar a setInt

                    int filasAfectadas = insertStmt.executeUpdate();
                    mensaje = filasAfectadas > 0 ? "Usuario agregado exitosamente." : "Error al agregar el usuario.";
                    insertStmt.close();
                } catch (NumberFormatException e) {
                    mensaje = "Error: El rol seleccionado no es válido.";
                }
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            mensaje = "Error: " + e.getMessage();
        } catch (NumberFormatException e) {
            mensaje = "Error: La cédula debe ser un número entero.";
        }
        %>

        <% if (!mensaje.isEmpty()) { %>
            <div class="alert alert-info mt-3"><%= mensaje %></div>
        <% } %>

        <form action="" method="post">
            <div class="form-group">
                <label for="cedula">Cédula:</label>
                <input type="text" id="cedula" name="cedula" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="rol_id">Rol:</label>
                <select id="rol_id" name="rol_id" class="form-control" required>
                    <% for (Map<String, String> rol : roles) { %>
                        <option value="<%= rol.get("id") %>"><%= rol.get("nombre") %></option>
                    <% } %>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Agregar</button>
            <a href="usuarios.jsp" class="btn btn-primary">Volver</a>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
