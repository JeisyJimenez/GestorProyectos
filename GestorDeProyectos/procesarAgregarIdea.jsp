<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<head>
    <title>Procesar Nuevo Usuario</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
</head>
<body>
    <div class="container mt-4">
<%
    String titulo = request.getParameter("titulo");
    String descripcion = request.getParameter("descripcion");

    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = "INSERT INTO ideas_anteproyecto (titulo, descripcion) VALUES (?, ?)";

    try {
        // Cambiar la conexión a PostgreSQL
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyectos", "postgres", "SILVER");

        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, titulo);
        pstmt.setString(2, descripcion);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            %>
            <div class='alert alert-success mt-3'>Idea agregada correctamente.</div>
            <%
        } else {
            %>
            <div class='alert alert-danger mt-3'>No se pudo agregar la idea.</div>
            <%
        }

        pstmt.close();
        con.close();
    } catch (SQLException e) {
        %>
        <div class='alert alert-danger mt-3'>Error al agregar la idea: <%= e.getMessage() %></div>
        <%
    }
%>
    <a href="agregarIdea.jsp" class="btn btn-primary mt-3">Volver</a>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
