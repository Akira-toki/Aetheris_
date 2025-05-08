<?php
session_start();
include 'db_config.php';

// Verificar si hay un tipo específico seleccionado
$tipo_seleccionado = isset($_GET['tipo']) ? $_GET['tipo'] : 'todos';
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Aetheris - Todos los Géneros</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Estilos generales */
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: #455b64;
            color: rgb(255, 255, 255);
            margin: 0;
            padding: 0;
        }
        
        .Container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
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
        
        /* Estilos específicos para la página de géneros */
        .genre-filter {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        
        .genre-filter button {
            background: #3a4a52;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        
        .genre-filter button.active {
            background: #43aec9;
            font-weight: bold;
        }
        
        .genre-filter button:hover {
            background: #4d5e67;
        }
        
        .genre-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .genre-card {
            background: rgb(36, 54, 61);
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .genre-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            background: #43aec9;
        }
        
        .genre-card h3 {
            margin: 0;
            font-size: 18px;
        }
        
        .genre-stats {
            font-size: 12px;
            color: #aaa;
            margin-top: 8px;
        }
        
        .genre-type {
            display: inline-block;
            margin: 5px;
            padding: 3px 8px;
            background: rgba(0,0,0,0.2);
            border-radius: 4px;
            font-size: 12px;
        }

        .genre-type-btn {
            display: inline-block;
            margin: 5px;
            padding: 3px 8px;
            background: rgba(0,0,0,0.2);
            border-radius: 4px;
            font-size: 12px;
            cursor: pointer;
            transition: all 0.2s;
        }
        
        .genre-type-btn:hover {
            background: rgba(0,0,0,0.4);
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <!-- Header  -->
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
            <div class="Title-Section">
                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M10 4H4C2.9 4 2 4.9 2 6V18C2 19.1 2.9 20 4 20H20C21.1 20 22 19.1 22 18V8C22 6.9 21.1 6 20 6H12L10 4Z" fill="#4a8eff"/>
                </svg>
                Todos los Géneros
            </div>
            
            <!-- Filtro por tipo de contenido -->
            <div class="genre-filter">
                <button onclick="filterGenres('todos')" <?= $tipo_seleccionado == 'todos' ? 'class="active"' : '' ?>>Todos</button>
                <button onclick="filterGenres('novela')" <?= $tipo_seleccionado == 'novela' ? 'class="active"' : '' ?>>Novelas</button>
                <button onclick="filterGenres('anime')" <?= $tipo_seleccionado == 'anime' ? 'class="active"' : '' ?>>Anime</button>
                <button onclick="filterGenres('manga')" <?= $tipo_seleccionado == 'manga' ? 'class="active"' : '' ?>>Manga</button>
            </div>
            
            <!-- Listado de géneros -->
            <div class="genre-grid">
                <?php
                // Consulta base para obtener géneros
                $query = "SELECT g.id, g.nombre FROM generos g";
                
                // Filtrado por tipo si es necesario
                if($tipo_seleccionado != 'todos') {
                    $query .= " WHERE EXISTS (SELECT 1 FROM ";
                    switch($tipo_seleccionado) {
                        case 'novela': 
                            $query .= "novela_generos WHERE genero_id = g.id)";
                            break;
                        case 'anime':
                            $query .= "anime_generos WHERE genero_id = g.id)";
                            break;
                        case 'manga':
                            $query .= "manga_generos WHERE genero_id = g.id)";
                            break;
                    }
                }
                
                $query .= " ORDER BY g.nombre ASC";
                $generos_result = $conn->query($query);
                
                if ($generos_result->num_rows > 0) {
                    while($genero = $generos_result->fetch_assoc()) {
                        // Consultas para contar contenidos por tipo
                        $counts = [
                            'novela' => 0,
                            'anime' => 0,
                            'manga' => 0
                        ];
                        
                        // Consulta para novelas
                        $novelas_query = $conn->prepare("SELECT COUNT(*) as count FROM novela_generos WHERE genero_id = ?");
                        $novelas_query->bind_param("i", $genero['id']);
                        $novelas_query->execute();
                        $counts['novela'] = $novelas_query->get_result()->fetch_assoc()['count'];
                        
                        // Consulta para anime
                        $anime_query = $conn->prepare("SELECT COUNT(*) as count FROM anime_generos WHERE genero_id = ?");
                        $anime_query->bind_param("i", $genero['id']);
                        $anime_query->execute();
                        $counts['anime'] = $anime_query->get_result()->fetch_assoc()['count'];
                        
                        // Consulta para manga
                        $manga_query = $conn->prepare("SELECT COUNT(*) as count FROM manga_generos WHERE genero_id = ?");
                        $manga_query->bind_param("i", $genero['id']);
                        $manga_query->execute();
                        $counts['manga'] = $manga_query->get_result()->fetch_assoc()['count'];
                        
                        $total_contenidos = $counts['novela'] + $counts['anime'] + $counts['manga'];
                        
                        if($total_contenidos > 0) {
                            echo '<div class="genre-card">
                                    <h3>' . htmlspecialchars($genero['nombre']) . '</h3>
                                    <div class="genre-stats">' . $total_contenidos . ' contenidos</div>';
                            
                            // Botones para cada tipo disponible
                            if($counts['novela'] > 0) {
                                echo '<span class="genre-type-btn" onclick="navigateToGenre('.$genero['id'].', \'novela\')">📖 ' . $counts['novela'] . '</span>';
                            }
                            if($counts['anime'] > 0) {
                                echo '<span class="genre-type-btn" onclick="navigateToGenre('.$genero['id'].', \'anime\')">🎬 ' . $counts['anime'] . '</span>';
                            }
                            if($counts['manga'] > 0) {
                                echo '<span class="genre-type-btn" onclick="navigateToGenre('.$genero['id'].', \'manga\')">📘 ' . $counts['manga'] . '</span>';
                            }
                            
                            echo '</div>';
                        }
                    }
                } else {
                    echo '<p style="grid-column: 1 / -1; text-align: center; color: #aaa;">No se encontraron géneros.</p>';
                }
                ?>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?></p>
    </footer>

    <script>
    // Filtrar géneros por tipo de contenido
    function filterGenres(tipo) {
        window.location.href = 'todos_generos.php?tipo=' + tipo;
    }
// Navegar al género seleccionado en el tipo especificado
function navigateToGenre(id, tipo) {
    let url = '';
    switch(tipo) {
        case 'novela':
            url = `inicio.php?id=${id}&tipo=novela`;
            break;
        case 'anime':
            url = `inicio_anime.php?id=${id}&tipo=anime`;
            break;
        case 'manga':
            url = `inicio_manga.php?id=${id}&tipo=manga`;
            break;
    }
    
    if(url) {
        window.location.href = url;
    }
}
    </script>
</body>
</html>