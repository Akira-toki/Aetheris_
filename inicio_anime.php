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
    <title>Aetheris - Anime</title>
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
        
        .Body {
            padding: 20px 0;
        }
        
        /* Listado de animes */
        .List-Animes {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 25px;
            width: 100%;
        }
        
        .Anime-Card {
            background: #1a1a2a;
            border-radius: 8px;
            overflow: hidden;
            transition: all 0.3s ease;
        }
        
        .Anime-Card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }
        
        .Anime-Image {
            position: relative;
            height: 280px;
            overflow: hidden;
        }
        
        .Anime-Image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .Anime-Card:hover .Anime-Image img {
            transform: scale(1.05);
        }
        
        /* ESTILOS CORREGIDOS PARA LOS BADGES */
        .Status-Badge {
            position: absolute;
            top: 10px;
            right: 10px;
            color: white;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        /* Usando atributos data-status para mejor precisión */
        .Status-Badge[data-status="En emisión"] { background: #4CAF50; }
        .Status-Badge[data-status="Finalizado"] { background: #F44336; }
        .Status-Badge[data-status="Próximamente"] { background: #FF9800; }
        
        .Anime-Info {
            padding: 15px;
        }
        
        .Anime-Title {
            font-size: 16px;
            margin: 0 0 8px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            color: white;
        }
        
        .Anime-Genres {
            font-size: 13px;
            color: #aaa;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            min-height: 36px;
        }
        
        /* Filtros */
        .Filters {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .Filter-Group {
            flex: 1;
            min-width: 200px;
        }
        
        .Filter-Select, .Filter-Input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            background-color: #252538;
            color: white;
        }
        
        /* Paginación */
        .pagination-container {
            grid-column: 1 / -1;
            margin-top: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .pagination-info {
            color: #aaa;
            margin-bottom: 10px;
            font-size: 14px;
        }
        
        .pagination {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
            justify-content: center;
        }
        
        .pagination-button {
            background-color: #252538;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
            min-width: 40px;
            text-align: center;
        }
        
        .pagination-button:hover {
            background-color: #3a7eff;
        }
        
        .pagination-button.active {
            background-color: #4a8eff;
            font-weight: bold;
        }
        
        .pagination-dots {
            display: flex;
            align-items: center;
            padding: 0 5px;
            color: #aaa;
        }
        
        /* Mensajes */
        .loading, .error, .no-results {
            grid-column: 1 / -1;
            text-align: center;
            padding: 40px;
            color: #aaa;
            font-size: 18px;
        }
        
        .reset-btn {
            background: #4a8eff;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            margin-top: 10px;
            cursor: pointer;
            font-size: 14px;
        }
        
        .reset-btn:hover {
            background: #3a7eff;
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


    <div class="Body">
        <div class="Container">
            <!-- Filtros -->
            <div class="Filters">
                <div class="Filter-Group">
                    <select id="filter-status" class="Filter-Select">
                        <option value="">Todos los estados</option>
                        <option value="En emisión">En emisión</option>
                        <option value="Finalizado">Finalizado</option>
                        <option value="Próximamente">Próximamente</option>
                    </select>
                </div>
                
                <div class="Filter-Group">
                    <select id="filter-genre" class="Filter-Select">
                        <option value="">Todos los géneros</option>
                        <?php
                        $generos = $conn->query("SELECT id, nombre FROM generos ORDER BY nombre");
                        while($genero = $generos->fetch_assoc()) {
                            echo '<option value="'.$genero['id'].'">'.htmlspecialchars($genero['nombre']).'</option>';
                        }
                        ?>
                    </select>
                </div>
                
                <div class="Filter-Group">
                    <input type="text" id="filter-search" class="Filter-Input" placeholder="Buscar por nombre...">
                </div>
            </div>

            <!-- Contenedor para resultados -->
            <div id="anime-results">
                <!-- Los resultados se cargarán aquí mediante AJAX -->
                <div class="loading">Cargando animes...</div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
    </footer>

    <!-- JavaScript -->
    <script>
    // Función para cargar una página específica con los filtros actuales
    function loadPage(pagina = 1) {
        const filterStatus = document.getElementById('filter-status').value;
        const filterGenre = document.getElementById('filter-genre').value;
        const filterSearch = document.getElementById('filter-search').value;
        
        // Mostrar loader
        document.getElementById('anime-results').innerHTML = '<div class="loading">Cargando animes...</div>';
        
        // Construir URL con parámetros
        const params = new URLSearchParams();
        if (filterStatus) params.append('status', filterStatus);
        if (filterGenre) params.append('genre', filterGenre);
        if (filterSearch) params.append('search', filterSearch);
        params.append('pagina', pagina);
        
        // Realizar petición AJAX
        fetch(`ajax_filtrar_animes.php?${params.toString()}`)
            .then(response => response.text())
            .then(html => {
                document.getElementById('anime-results').innerHTML = html;
                // Desplazarse suavemente al inicio de los resultados
                window.scrollTo({
                    top: document.getElementById('anime-results').offsetTop - 20,
                    behavior: 'smooth'
                });
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('anime-results').innerHTML = '<div class="error">Error al cargar los animes</div>';
            });
    }
    
    // Función para aplicar filtros (reinicia a página 1)
    function applyFilters() {
        loadPage(1);
    }
    
    // Event listeners para los filtros
    document.getElementById('filter-status').addEventListener('change', applyFilters);
    document.getElementById('filter-genre').addEventListener('change', applyFilters);
    
    // Debounce para la búsqueda
    let searchTimeout;
    document.getElementById('filter-search').addEventListener('input', () => {
        clearTimeout(searchTimeout);
        searchTimeout = setTimeout(applyFilters, 350);
    });
    
    // Cargar primera página al inicio
    document.addEventListener('DOMContentLoaded', () => {
        loadPage(1);
    });
    </script>
</body>
</html>