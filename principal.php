<?php
session_start();
include 'db_config.php';

// Verificar si el usuario está logueado
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Aetheris - Anime, Manga y Novelas</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #0f0f1a;
            color: #e0e0e0;
            margin: 0;
            padding: 0;
        }
        
        .Container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* Header */
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #121212;
            color: white;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }
        
        .header-left .logo {
            font-size: 24px;
            color: #4a8eff;
            text-decoration: none;
            font-weight: bold;
        }
        
        .header-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .menu {
            position: relative;
        }
        
        .menu-button {
            background: none;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            padding: 8px 12px;
        }
        
        .menu-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #1a1a2a;
            min-width: 200px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 4px;
        }
        
        .menu:hover .menu-content {
            display: block;
        }
        
        .menu-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        
        .menu-content a:hover {
            background-color: #252538;
        }
        
        .submenu {
            position: relative;
        }
        
        .submenu-content {
            display: none;
            position: absolute;
            left: 100%;
            top: 0;
            background-color: #1a1a2a;
            min-width: 160px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            z-index: 1;
            border-radius: 0 4px 4px 0;
        }
        
        .submenu:hover .submenu-content {
            display: block;
        }
        
        .search-bar {
            display: flex;
            align-items: center;
        }
        
        .search-bar input {
            padding: 8px 12px;
            border: none;
            border-radius: 4px 0 0 4px;
            background: #252538;
            color: white;
            width: 200px;
        }
        
        .search-bar button {
            background: #4a8eff;
            border: none;
            color: white;
            padding: 8px 12px;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        
        /* Contenido principal */
        .Body {
            padding: 20px 0;
        }
        
        .Title-Section {
            color: #4a8eff;
            font-size: 24px;
            margin: 20px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        /* Mensaje de bienvenida */
        .welcome-section {
            background: linear-gradient(135deg, #1a1a2a 0%, #252538 100%);
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 40px;
            text-align: center;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
        }
        
        .welcome-title {
            font-size: 32px;
            color: #4a8eff;
            margin-bottom: 15px;
        }
        
        .welcome-message {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 25px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        
        /* Secciones de navegación */
        .section-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }
        
        .section-card {
            background: #1a1a2a;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 2px solid transparent;
        }
        
        .section-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-color: #4a8eff;
        }
        
        .section-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .section-title {
            font-size: 22px;
            color: #4a8eff;
            margin-bottom: 10px;
        }
        
        .section-description {
            font-size: 15px;
            color: #aaa;
            margin-bottom: 20px;
        }
        
        .section-button {
            background: #4a8eff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s;
        }
        
        .section-button:hover {
            background: #3a7bef;
        }
        
        /* Footer */
        footer {
            background-color: #121212;
            padding: 20px;
            text-align: center;
            margin-top: 40px;
            color: #777;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
    <div class="header-left">
        <a href="principal.php" class="logo">Aetheris</a>
    </div>
    <div class="header-right">
        <div class="menu">
            <button class="menu-button">Menú</button>
            <div class="menu-content">
                <!-- Sección principal -->
                <a href="inicio.php">📖 Novelas</a>
                <a href="inicio_anime.php">🎬 Anime</a>
                <a href="inicio_manga.php">📘 Manga</a>
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                
                <!-- Submenú común -->
                <?php if($is_admin): ?>
                    <a href="subir_contenido.php">⬆️ Subir Contenido</a>
                <?php endif; ?>
                <a href="directorio.php">📋 Directorio</a>
                
                <!-- Submenú de géneros -->
                <div class="submenu">
                    <a href="#" class="submenu-button">🗂️ Géneros</a>
                    <div class="submenu-content">
                        <?php
                        $generos = $conn->query("SELECT nombre FROM generos ORDER BY nombre LIMIT 1");
                        while($genero = $generos->fetch_assoc()) {
                            echo '<a href="genero.php?tipo=anime&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Anime)</a>';
                            echo '<a href="genero.php?tipo=manga&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Manga)</a>';
                            echo '<a href="genero.php?tipo=novela&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Novelas)</a>';
                        }
                        ?>
                        <a href="todos_generos.php">Ver todos...</a>
                    </div>
                </div>
                

                
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                
                <?php if($logged_in): ?>
                    <a href="perfil.php">👤 <?php echo htmlspecialchars($username); ?></a>

                    <a href="logout.php">🚪 Cerrar Sesión</a>
                <?php else: ?>
                    <a href="login.php">🔑 Iniciar Sesión</a>
                    <a href="signup.php">📝 Registrarse</a>
                <?php endif; ?>
            </div>
        </div>
        <div class="search-bar">
            <input type="text" id="global-search" placeholder="Buscar en Anime, Manga, Novelas...">
            <button onclick="buscarContenido()">🔍</button>
        </div>
    </div>
</header>

    <script>
    function buscarContenido() {
        const query = document.getElementById('global-search').value.trim();
        if(query.length > 2) {
            // Redirige a una página de búsqueda global o filtra
            window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
        }
    }
    </script>

    <!-- Contenido principal -->
    <div class="Body">
        <div class="Container">
            <!-- Sección de bienvenida -->
            <div class="welcome-section">
                <h1 class="welcome-title">Bienvenido a Aetheris</h1>
                <p class="welcome-message">
                    Explora un universo de historias fascinantes. En Aetheris encontrarás una amplia colección 
                    de anime, manga y novelas ligeras para disfrutar. Sumérgete en mundos increíbles, 
                    conoce personajes memorables y vive aventuras inolvidables.
                </p>
            </div>

            <!-- Secciones de navegación -->
            <div class="Title-Section">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19Z" fill="#4a8eff"/>
                    <path d="M11.25 7.72H6.25V9.22H11.25V7.72Z" fill="#4a8eff"/>
                    <path d="M18 15.75H13V17.25H18V15.75Z" fill="#4a8eff"/>
                    <path d="M18 13.25H13V14.75H18V13.25Z" fill="#4a8eff"/>
                    <path d="M8 18H9.5V16H11.5V14.5H9.5V12.5H8V14.5H6V16H8V18Z" fill="#4a8eff"/>
                    <path d="M14.09 10.95L15.5 9.54L16.91 10.95L17.97 9.89L16.56 8.47L17.97 7.06L16.91 6L15.5 7.41L14.09 6L13.03 7.06L14.44 8.47L13.03 9.89L14.09 10.95Z" fill="#4a8eff"/>
                </svg>
                Explora nuestras secciones
            </div>

            <div class="section-cards">
                <!-- Tarjeta de Anime -->
                <div class="section-card" onclick="window.location.href='inicio_anime.php'">
                    <div class="section-icon">🎬</div>
                    <h3 class="section-title">Anime</h3>
                    <p class="section-description">
                        Descubre los últimos estrenos y clásicos del anime japonés. Series completas, OVAs y películas.
                    </p>
                    <button class="section-button">Ver Anime</button>
                </div>

                <!-- Tarjeta de Manga -->
                <div class="section-card" onclick="window.location.href='inicio_manga.php'">
                    <div class="section-icon">📘</div>
                    <h3 class="section-title">Manga</h3>
                    <p class="section-description">
                        Explora nuestra colección de mangas, desde shonen hasta seinen, con los títulos más populares.
                    </p>
                    <button class="section-button">Ver Manga</button>
                </div>

                <!-- Tarjeta de Novelas -->
                <div class="section-card" onclick="window.location.href='inicio.php'">
                    <div class="section-icon">📖</div>
                    <h3 class="section-title">Novelas Ligeras</h3>
                    <p class="section-description">
                        Sumérgete en historias profundas con nuestras novelas ligeras, incluyendo isekai, fantasía y más.
                    </p>
                    <button class="section-button">Ver Novelas</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
    </footer>
</body>
</html>