<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html lang="es">
<head>
    <title>Gestionar Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
        <h3 class="mt-3 mb-4 text-center">Gestionar Usuarios</h3>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="thead-light">
                    <tr>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        List<Map<String, Object>> usuarios = new ArrayList<>();

                        try {
                            // Cargar el driver de PostgreSQL
                            Class.forName("org.postgresql.Driver");
                            // Establecer conexión a la base de datos
                            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");
                            // Consulta para obtener los usuarios
                            String query = "SELECT cedula, nombre, email, rol_id FROM usuarios ORDER BY nombre";
                            stmt = conn.prepareStatement(query);
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                                Map<String, Object> usuario = new HashMap<>();
                                usuario.put("cedula", rs.getString("cedula"));
                                usuario.put("nombre", rs.getString("nombre"));
                                usuario.put("email", rs.getString("email"));
                                usuario.put("rol_id", rs.getInt("rol_id"));
                                usuarios.add(usuario);
                            }
                        } catch (SQLException | ClassNotFoundException e) {
                            out.println("<div class='alert alert-danger' role='alert'>Error: " + e.getMessage() + "</div>");
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                out.println("<div class='alert alert-danger' role='alert'>Error al cerrar la conexión: " + e.getMessage() + "</div>");
                            }
                        }

                        // Si la lista de usuarios no está vacía, se muestra la tabla
                        if (!usuarios.isEmpty()) {
                            for (Map<String, Object> usuario : usuarios) {
                    %>
                                <tr>
                                    <td><%= usuario.get("cedula") %></td>
                                    <td><%= usuario.get("nombre") %></td>
                                    <td><%= usuario.get("email") %></td>
                                    <td>
                                        <%
                                            // Aquí debes implementar la lógica para obtener el nombre del rol usando el rol_id
                                            int rolId = (Integer) usuario.get("rol_id");
                                            // Simulación de un rol para el ejemplo
                                            String rolNombre = (rolId == 1) ? "Administrador" : "Usuario"; // Cambia esto según tu lógica
                                        %>
                                        <%= rolNombre %>
                                    </td>
                                    <td>
                                        <a href="actualizarUsuario.jsp?cedula=<%= usuario.get("cedula") %>" class="btn btn-info btn-sm">Actualizar</a>
                                        <a href="eliminarUsuario.jsp?cedula=<%= usuario.get("cedula") %>" class="btn btn-danger btn-sm">Eliminar</a>
                                    </td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="5" class="text-center">No hay usuarios disponibles</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="mt-4">
            <a href="agregarUsuario.jsp" class="btn btn-success">Agregar</a>
            <a href="administrador.jsp" class="btn btn-primary">Volver</a>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
