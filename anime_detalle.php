<?php
include 'db_config.php';
session_start(); 
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';
if (isset($_GET['id'])) {
    $id = $conn->real_escape_string($_GET['id']);
    
    // Consulta para obtener el anime y sus géneros
    $query = "SELECT a.*, 
              GROUP_CONCAT(g.nombre SEPARATOR ', ') AS generos
              FROM animes a
              LEFT JOIN anime_generos ag ON a.id = ag.anime_id
              LEFT JOIN generos g ON ag.genero_id = g.id
              WHERE a.id = ?
              GROUP BY a.id";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $anime = $result->fetch_assoc();
    } else {
        die("Anime no encontrado");
    }
} else {
    die("ID no especificado");
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <title><?php echo htmlspecialchars($anime['nombre']); ?> - Aetheris</title>
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a8eff;
            --dark-bg: #121212;
            --darker-bg: #0f0f1a;
            --card-bg: #1a1a2a;
            --text-color: #e0e0e0;
        }
        
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: var(--darker-bg);
            color: var(--text-color);
            margin: 0;
            padding: 0;
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
        

        .anime-container {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
        }
        
        .anime-banner {
            height: 300px;
            background-size: cover;
            background-position: center;
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .anime-banner::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100px;
            background: linear-gradient(transparent, var(--darker-bg));
        }
        
        .anime-card {
            display: flex;
            background-color: var(--card-bg);
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            margin-top: -80px;
            position: relative;
            z-index: 2;
            margin-bottom: 30px;
        }
        
        .anime-poster {
            flex: 0 0 250px;
            padding: 20px;
        }
        
        .anime-poster img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        
        .anime-info {
            flex: 1;
            padding: 30px;
        }
        
        .anime-title {
            font-size: 28px;
            margin: 0 0 10px;
            color: var(--primary-color);
        }
        
        .anime-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .meta-item {
            background-color: rgba(74, 142, 255, 0.2);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
        }
        
        .anime-synopsis {
            margin-bottom: 20px;
        }
        
        .episodes-section {
            background-color: var(--card-bg);
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 22px;
            margin-top: 0;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--primary-color);
        }
        
        .episodes-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
        }
        
        .episode-card {
            background-color: rgba(255,255,255,0.05);
            border-radius: 6px;
            padding: 15px;
            transition: all 0.3s;
        }
        
        .episode-card:hover {
            background-color: rgba(255,255,255,0.1);
        }
        
        .episode-number {
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 5px;
        }
        
        .watch-btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            margin-top: 10px;
        }
        
        @media (max-width: 768px) {
            .anime-card {
                flex-direction: column;
                margin-top: -50px;
            }
            
            .anime-poster {
                flex: 0 0 auto;
                text-align: center;
            }
            
            .anime-poster img {
                max-width: 200px;
            }
            
            .episodes-list {
                grid-template-columns: 1fr;
            }
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

    <div class="anime-container">
        <!-- Banner/Portada del anime -->
        <div class="anime-banner" style="background-image: url('<?php echo htmlspecialchars($anime['portada'] ?? ''); ?>')"></div>
        
        <!-- Tarjeta de información del anime -->
        <div class="anime-card">
            <div class="anime-poster">
                <img src="<?php echo htmlspecialchars($anime['imagen']); ?>" alt="<?php echo htmlspecialchars($anime['nombre']); ?>">
            </div>
            
            <div class="anime-info">
                <h1 class="anime-title"><?php echo htmlspecialchars($anime['nombre']); ?></h1>
                
                <div class="anime-meta">
                    <span class="meta-item"><?php echo htmlspecialchars($anime['estado']); ?></span>
                    
                    <?php if (!empty($anime['generos'])): ?>
                        <span class="meta-item"><?php echo htmlspecialchars($anime['generos']); ?></span>
                    <?php endif; ?>
                    
                    <?php if (!empty($anime['fecha_emision'])): ?>
                        <span class="meta-item"><?php echo htmlspecialchars($anime['fecha_emision']); ?></span>
                    <?php endif; ?>
                </div>
                
                <div class="anime-synopsis">
                    <h3>Sinopsis</h3>
                    <p><?php echo nl2br(htmlspecialchars($anime['descripcion'])); ?></p>
                </div>
            </div>
        </div>
        
        <!-- Lista de episodios -->
        <div class="episodes-section">
            <h2 class="section-title">Episodios</h2>
            
            <?php
            // Obtener episodios
            $episodios_query = "SELECT * FROM episodios WHERE id_anime = ? ORDER BY numero_episodio";
            $stmt_ep = $conn->prepare($episodios_query);
            $stmt_ep->bind_param("i", $id);
            $stmt_ep->execute();
            $episodios = $stmt_ep->get_result();
            
            if ($episodios->num_rows > 0): ?>
                <div class="episodes-list">
                    <?php while ($episodio = $episodios->fetch_assoc()): ?>
                        <div class="episode-card">
                            <div class="episode-number">Episodio <?php echo htmlspecialchars($episodio['numero_episodio']); ?></div>
                            <?php if (!empty($episodio['titulo'])): ?>
                                <div class="episode-title"><?php echo htmlspecialchars($episodio['titulo']); ?></div>
                            <?php endif; ?>
                            <a href="episodio.php?anime_id=<?php echo $id; ?>&ep=<?php echo $episodio['numero_episodio']; ?>" class="watch-btn">Ver ahora</a>
                        </div>
                    <?php endwhile; ?>
                </div>
            <?php else: ?>
                <p>No hay episodios disponibles todavía.</p>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>
<?php
$conn->close();
?>