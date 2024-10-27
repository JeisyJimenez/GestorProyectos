<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Gestor De Proyectos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap">
    <link rel="stylesheet" href="css/styles.css">
    <link rel="icon" type="image/x-icon" href="img/img1.png">
    <style>
        /* Fondo verde pastel para el contenedor general */
        body {
            background-color: #d4edda;
        }

        /* Estilos para el botón desplegable de "Iniciar Sesión" */
        .navbar .nav-item .nav-link {
            color: white !important;
            background-color: #155724;
            padding: 8px 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .navbar .nav-item .nav-link:hover {
            background-color: #155724;
            color: white !important;
        }

        /* Estilos para el subtítulo de la institución en la barra */
        .navbar .navbar-brand {
            font-size: 18px;
            font-weight: bold;
            color: #155724;
            margin-right: auto;
        }

        /* Espacio adicional alrededor de la barra de navegación */
        header {
            margin: 30px 0;
        }

        /* Estilos para el contenedor del carrusel */
        .jumbotron .carousel {
            margin-top: 15px;
        }

        /* Estilos para la descripción bajo el slider con alineación justificada */
        .jumbotron .description {
            margin-top: 20px;
            padding: 15px;
            font-size: 16px;
            text-align: justify;
            color: #155724;
        }

        /* Estilo adicional para el título principal */
        .jumbotron .display-4 {
            font-weight: 800; /* Mayor grosor de la fuente */
            font-size: 3.5rem; /* Ajuste de tamaño */
            color: #006400; /* Verde oscuro */
            letter-spacing: -0.2px; /* Espaciado entre letras */
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar">
                <span class="navbar-brand">Unidades Tecnológicas de Santander</span>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                               Iniciar Sesión
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="login_administrador.jsp">Administrador</a>
                                <a class="dropdown-item" href="login_coordinador.jsp">Coordinador</a>
                                <a class="dropdown-item" href="login_director.jsp">Director</a>
                                <a class="dropdown-item" href="login_evaluador.jsp">Evaluador</a>
                                <a class="dropdown-item" href="login_estudiante.jsp">Estudiante</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <main role="main">
            <div class="jumbotron">
                <div class="container">
                    <h1 class="display-4">Gestor de Proyectos</h1>
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="../GestorDeProyectos/img/Slider.png" alt="Primera imagen" width="700" height="400">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="../GestorDeProyectos/img/Slider2.png" alt="Segunda imagen" width="700" height="400">
                            </div>
                        </div>
                    </div>
                    <!-- Descripción sobre la importancia de los proyectos en UTS -->
                    <div class="description">
                        <p>Los proyectos en la UTS son fundamentales para el desarrollo académico y profesional de los estudiantes, permitiéndoles aplicar conocimientos, innovar y contribuir a la solución de problemas en su entorno. Este gestor facilita la organización y seguimiento de dichos proyectos para un mayor impacto en la formación integral de los futuros profesionales.</p>
                    </div>
                    <br>
                </div>
            </div>
        </main>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
