<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html lang="es">
<head>
    <title>Agregar Idea de Anteproyecto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="shortcut icon" href="img/img1.png" type="image/x-icon">
    <style>
        body {
            background-color: #f8f9fa; /* Fondo gris claro */
        }
        .container {
            margin-top: 50px; /* Espacio superior */
            max-width: 600px; /* Ancho máximo para la forma */
            background-color: #ffffff; /* Fondo blanco para el contenedor */
            border-radius: 8px; /* Bordes redondeados */
            padding: 30px; /* Espaciado interno */
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }
        h3 {
            color: #2e7d32; /* Color verde oscuro para el encabezado */
        }
        .btn-success {
            background-color: #66bb6a; /* Verde claro */
            border: none; /* Sin borde */
            transition: background-color 0.3s; /* Transición suave */
        }
        .btn-success:hover {
            background-color: #57a057; /* Color más oscuro al pasar el ratón */
        }
        .btn-primary {
            background-color: #4caf50; /* Verde para el botón de volver */
            border: none; /* Sin borde */
            transition: background-color 0.3s; /* Transición suave */
        }
        .btn-primary:hover {
            background-color: #388e3c; /* Color más oscuro al pasar el ratón */
        }
        label {
            font-weight: bold; /* Negrita para las etiquetas */
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h3 class="mt-3 mb-4 text-center">Agregar Idea de Anteproyecto</h3>
        <form action="procesarAgregarIdea.jsp" method="post">
            <div class="form-group">
                <label for="titulo">Titulo:</label>
                <input type="text" id="titulo" name="titulo" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="descripcion">Descripcion:</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-success btn-block">Agregar</button>
            <a href="coordinador.jsp" class="btn btn-primary btn-block">Volver</a>
        </form>
    </div>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>