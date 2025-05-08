<?php
include 'db_config.php';
include 'db_config.php';
session_start(); 
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';
// Obtener parámetros
$anime_id = isset($_GET['anime_id']) ? intval($_GET['anime_id']) : null;
$episodio_num = isset($_GET['ep']) ? intval($_GET['ep']) : null;

if (!$anime_id || !$episodio_num) {
    die("Parámetros incorrectos");
}

// Obtener información del anime
$stmt_anime = $conn->prepare("SELECT id, nombre, imagen FROM animes WHERE id = ?");
$stmt_anime->bind_param("i", $anime_id);
$stmt_anime->execute();
$anime = $stmt_anime->get_result()->fetch_assoc();

if (!$anime) {
    die("Anime no encontrado");
}

// Obtener información del episodio actual
$stmt_ep = $conn->prepare("SELECT * FROM episodios WHERE id_anime = ? AND numero_episodio = ?");
$stmt_ep->bind_param("ii", $anime_id, $episodio_num);
$stmt_ep->execute();
$episodio = $stmt_ep->get_result()->fetch_assoc();

if (!$episodio) {
    die("Episodio no encontrado");
}

// Obtener episodios adyacentes
$prev_ep = $conn->query("SELECT MAX(numero_episodio) FROM episodios WHERE id_anime = $anime_id AND numero_episodio < $episodio_num")->fetch_row()[0];
$next_ep = $conn->query("SELECT MIN(numero_episodio) FROM episodios WHERE id_anime = $anime_id AND numero_episodio > $episodio_num")->fetch_row()[0];

// Obtener lista de todos los episodios para el dropdown
$all_episodes = $conn->query("SELECT numero_episodio, titulo FROM episodios WHERE id_anime = $anime_id ORDER BY numero_episodio");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($anime['nombre']); ?> - Ep. <?php echo $episodio_num; ?> | Aetheris</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
   <style>
        :root {
            --primary-color: #4a8eff;
            --dark-bg: #121212;
            --darker-bg: #0f0f1a;
            --card-bg: #1a1a2a;
            --text-color: #e0e0e0;
            --text-muted: #a0a0a0;
        }
        
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: var(--darker-bg);
            color: var(--text-color);
            margin: 0;
            padding: 0;
            line-height: 1.6;
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
        

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .player-header {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 25px;
            background-color: var(--card-bg);
            padding: 15px;
            border-radius: 8px;
        }
        
        .anime-thumb {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
        }
        
        .player-container {
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 */
            height: 0;
            overflow: hidden;
            background: #000;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: none;
        }
        
        .episode-selector {
            margin-bottom: 20px;
        }
        
        .episode-selector select {
            width: 100%;
            padding: 10px;
            background-color: var(--dark-bg);
            color: var(--text-color);
            border: 1px solid var(--primary-color);
            border-radius: 4px;
        }
        
        .episode-nav {
            display: flex;
            justify-content: space-between;
            gap: 15px;
        }
        
        .nav-btn {
            flex: 1;
            background-color: var(--primary-color);
            color: white;
            padding: 12px;
            border-radius: 6px;
            text-align: center;
            text-decoration: none;
            transition: all 0.3s;
        }
        
        .nav-btn:hover {
            background-color: #3a7bef;
            transform: translateY(-2px);
        }
        
        .nav-btn.disabled {
            background-color: var(--text-muted);
            pointer-events: none;
            opacity: 0.6;
        }
        
        .episode-info {
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
        }
        
        .episode-title {
            font-size: 22px;
            margin-top: 0;
            color: var(--primary-color);
        }
        
        .back-btn {
            display: inline-block;
            background-color: var(--card-bg);
            color: var(--text-color);
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            margin-top: 20px;
            transition: all 0.3s;
        }
        
        .back-btn:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        @media (max-width: 768px) {
            .player-header {
                flex-direction: column;
                text-align: center;
            }
            
            .episode-nav {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
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

    <div class="container">
        <div class="player-header">
            <img src="<?php echo htmlspecialchars($anime['imagen']); ?>" alt="<?php echo htmlspecialchars($anime['nombre']); ?>" class="anime-thumb">
            <div>
                <h1><?php echo htmlspecialchars($anime['nombre']); ?></h1>
                <h2>Episodio <?php echo $episodio_num; ?></h2>
            </div>
        </div>
        
        <div class="player-container">
            <!-- Selector de episodios -->
            <div class="episode-selector">
                <select onchange="location = this.value;">
                    <option value="">Seleccionar episodio...</option>
                    <?php while ($ep = $all_episodes->fetch_assoc()): ?>
                        <option value="episodio.php?anime_id=<?php echo $anime_id; ?>&ep=<?php echo $ep['numero_episodio']; ?>"
                            <?php echo ($ep['numero_episodio'] == $episodio_num) ? 'selected' : ''; ?>>
                            Ep. <?php echo $ep['numero_episodio']; ?> - <?php echo htmlspecialchars($ep['titulo'] ?? ''); ?>
                        </option>
                    <?php endwhile; ?>
                </select>
            </div>
            
            <!-- Reproductor de video -->
            <div class="video-container">
                <?php echo htmlspecialchars_decode($episodio['embed_code']); ?>
            </div>
            
            <!-- Navegación entre episodios -->
            <div class="episode-nav">
                <?php if ($prev_ep): ?>
                    <a href="episodio.php?anime_id=<?php echo $anime_id; ?>&ep=<?php echo $prev_ep; ?>" class="nav-btn">
                        ← Episodio <?php echo $prev_ep; ?>
                    </a>
                <?php else: ?>
                    <span class="nav-btn disabled">← No hay anterior</span>
                <?php endif; ?>
                
                <?php if ($next_ep): ?>
                    <a href="episodio.php?anime_id=<?php echo $anime_id; ?>&ep=<?php echo $next_ep; ?>" class="nav-btn">
                        Episodio <?php echo $next_ep; ?> →
                    </a>
                <?php else: ?>
                    <span class="nav-btn disabled">No hay siguiente →</span>
                <?php endif; ?>
            </div>
        </div>
        
        <!-- Información del episodio -->
        <div class="episode-info">
            <h2 class="episode-title">
                <?php echo !empty($episodio['titulo']) ? htmlspecialchars($episodio['titulo']) : "Episodio ".$episodio_num; ?>
            </h2>
        </div>
        
        <a href="anime_detalle.php?id=<?php echo $anime_id; ?>" class="back-btn">
            ← Volver al listado de episodios
        </a>
    </div>
</body>
</html>
<?php
$conn->close();
?>