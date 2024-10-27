<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<html lang="es">
<head>
    <title>Panel de Estudiante</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Reset básico */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start; /* Cambiado a flex-start para alinear hacia arriba */
            min-height: 100vh;
            background-color: #f0f0f0;
        }

        /* Estilo de la Cabecera */
        .header {
            width: 100%;
            padding: 20px;
            background-color: #4CAF50; /* Color verde */
            color: white;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px; /* Añadido margen inferior */
        }

        /* Estilo de las Cards */
        .cards {
            display: grid;
            gap: 20px;
            width: 100%;
            max-width: 1200px;
            padding: 20px;
            margin: 0; /* Eliminado margen superior */
            grid-template-columns: repeat(2, 1fr); /* Dos tarjetas por fila */
        }

        .card {
            background-color: white;
            padding: 20px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card a {
            text-decoration: none;
            color: #4CAF50; /* Color verde */
            font-weight: bold;
            font-size: 1.2em;
            display: block;
            margin: 10px 0;
        }

        .card p {
            color: #666;
            font-size: 0.9em;
        }

        /* Estilo específico para la tarjeta centrada */
        .card-center {
            grid-column: 1 / -1; /* Hace que la tarjeta ocupe toda la fila */
            display: flex;
            justify-content: center; /* Centra la tarjeta */
            align-items: center; /* Centra el contenido */
        }

        /* Estilo del botón volver */
        .btn-volver {
            background-color: #4CAF50; /* Color verde */
            color: white; /* Texto blanco */
            border: none; /* Sin borde */
            padding: 10px 20px; /* Espaciado */
            border-radius: 5px; /* Bordes redondeados */
            font-size: 1.2em; /* Tamaño de fuente */
            text-decoration: none; /* Sin subrayado */
            display: inline-block; /* Para que se comporte como un botón */
            margin-top: 20px; /* Espacio superior */
            transition: background-color 0.3s; /* Transición para el hover */
        }

        .btn-volver:hover {
            background-color: #45a049; /* Color verde más oscuro al pasar el ratón */
        }

        /* Diseño Responsivo */
        @media (max-width: 600px) {
            .cards {
                grid-template-columns: repeat(1, 1fr);
            }
        }

        @media (min-width: 601px) and (max-width: 1024px) {
            .cards {
                grid-template-columns: repeat(2, 1fr); /* Cambiado para que sean 2 tarjetas por fila */
            }
        }

        @media (min-width: 1025px) {
            .cards {
                grid-template-columns: repeat(2, 1fr); /* Cambiado para que sean 2 tarjetas por fila */
            }
        }
    </style>
</head>
<body>
    <!-- Cabecera -->
    <header class="header">
        <h1>Panel de Estudiante</h1>
    </header>

    <!-- Cuerpo con Cards -->
    <section class="cards">
        <!-- Tarjeta 1: Ideas de Proyecto -->
        <div class="card">
            <div class="card-body">
                <a href="ideasProyecto.jsp">Ideas de Proyecto</a>
                <p>Consulta las ideas de proyecto disponibles.</p>
            </div>
        </div>

        <!-- Tarjeta 2: Ver estado del Anteproyecto -->
        <div class="card">
            <div class="card-body">
                <a href="anteproyectos3.jsp">Ver estado del Anteproyecto</a>
                <p>Accede para ver el estado de tu anteproyecto.</p>
            </div>
        </div>

        <!-- Tarjeta 3: Calificación Anteproyecto -->
        <div class="card">
            <div class="card-body">
                <a href="calificacionAnteproyecto.jsp">Calificación Anteproyecto</a>
                <p>Revisa la calificación de tu anteproyecto.</p>
            </div>
        </div>

        <!-- Tarjeta 4: Calendario Académico -->
        <div class="card">
            <div class="card-body">
                <a href="https://www.uts.edu.co/sitio/wp-content/uploads/2019/10/ACUERDO-No.-03-023-modificacion-calendario-academico-semetre-2.pdf" target="_blank">Calendario Académico</a>
                <p>Consulta el calendario académico actualizado.</p>
            </div>
        </div>

        <!-- Tarjeta 5: Formatos de Grado (centrada) -->
        <div class="card card-center">
            <div class="card-body">
                <a href="https://www.dropbox.com/sh/2937zx708zgncsw/AAA0pUsWY74w6GHJ4DksaTa1a/DOCUMENTOS%20DE%20GRADO?dl=0&subfolder_nav_tracking=1" target="_blank">Formatos de Grado</a>
                <p>Accede a los formatos requeridos para el grado.</p>
            </div>
        </div>
    </section>

    <!-- Botón Volver -->
    <a href="index.jsp" class="btn-volver">Volver</a>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-5lKLE+Q9iZK3oHakxjJ9jv1IYpDJoEujgTmx9YoRWQHTomz9flp6qFbVyBhZHpws" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk5KVYm1c+8fBhsitF0kg2rs0kPvF6Yg4fF" crossorigin="anonymous"></script>
</body>
</html>
