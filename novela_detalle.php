<?php
include 'db_config.php';
session_start(); 
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';
if (isset($_GET['id'])) {
    $id = $conn->real_escape_string($_GET['id']);
    
    // Consulta para obtener el novela y sus géneros
    $query = "SELECT a.*, 
              GROUP_CONCAT(g.nombre SEPARATOR ', ') AS generos
              FROM novelas a
              LEFT JOIN novela_generos ag ON a.id = ag.novela_id
              LEFT JOIN generos g ON ag.genero_id = g.id
              WHERE a.id = ?
              GROUP BY a.id";
    
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $novela = $result->fetch_assoc();
    } else {
        die("Novela no encontrado");
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
    <title><?php echo htmlspecialchars($novela['nombre']); ?> - Aetheris</title>
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4adeff;
            --dark-bg: #121212;
            --darker-bg:  #1d2e37;
            --card-bg: #162023;
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
            background-color: #132125;
            color: white;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }
        
        .header-left .logo {
            font-size: 24px;
            color: #4adeff;
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
            background-color: #253038;
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
            background-color: #415b61;
        }
        
        .submenu {
            position: relative;
        }
        
        .submenu-content {
            display: none;
            position: absolute;
            left: 100%;
            top: 0;
            background-color: #253038;
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
            background:#253038;
            color: white;
            width: 200px;
        }
        
        .search-bar button {
            background: #4adeff;
            border: none;
            color: white;
            padding: 8px 12px;
            border-radius: 0 4px 4px 0;
            cursor: pointer;
        }
        

        .novela-container {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
        }
        
        .novela-banner {
            height: 100px;
            background-size: cover;
            background-position: center;
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .novela-banner::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100px;
            background: linear-gradient(transparent, var(--darker-bg));
        }
        
        .novela-card {
            display: flex;
            background-color: var(--card-bg);
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            margin-top: -80px;
            position: relative;
            z-index: 2;
            margin-bottom: 30px;
        }
        
        .novela-poster {
            flex: 0 0 250px;
            padding: 20px;
        }
        
        .novela-poster img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        
        .novela-info {
            flex: 1;
            padding: 30px;
        }
        
        .novela-title {
            font-size: 28px;
            margin: 0 0 10px;
            color: var(--primary-color);
        }
        
        .novela-meta {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .meta-item {
            background-color: rgba(74, 210, 255, 0.2);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 14px;
        }
        
        .novela-synopsis {
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
            .novela-card {
                flex-direction: column;
                margin-top: -50px;
            }
            
            .novela-poster {
                flex: 0 0 auto;
                text-align: center;
            }
            
            .novela-poster img {
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

    <div class="novela-container">
        <!-- Banner/Portada del novela -->
        <div class="novela-banner" style="background-image: url('<?php echo htmlspecialchars($novela['portada'] ?? ''); ?>')"></div>
        
        <!-- Tarjeta de información del novela -->
        <div class="novela-card">
            <div class="novela-poster">
                <img src="<?php echo htmlspecialchars($novela['imagen']); ?>" alt="<?php echo htmlspecialchars($novela['nombre']); ?>">
            </div>
            
            <div class="novela-info">
                <h1 class="novela-title"><?php echo htmlspecialchars($novela['nombre']); ?></h1>
                
                <div class="novela-meta">
                    <span class="meta-item"><?php echo htmlspecialchars($novela['estado']); ?></span>
                    
                    <?php if (!empty($novela['generos'])): ?>
                        <span class="meta-item"><?php echo htmlspecialchars($novela['generos']); ?></span>
                    <?php endif; ?>
          
                </div>
                
                <div class="novela-synopsis">
                    <h3>Sinopsis</h3>
                    <p><?php echo nl2br(htmlspecialchars($novela['descripcion'])); ?></p>
                </div>
            </div>
        </div>
        
        <!-- Lista de volumenes -->
        <div class="episodes-section">
            <h2 class="section-title">Volumenes</h2>
            
            <?php
            // Obtener volumenes
            $volumenes_query = "SELECT * FROM volumenes WHERE id_novela = ? ORDER BY numero_volumen";
            $stmt_ep = $conn->prepare($volumenes_query);
            $stmt_ep->bind_param("i", $id);
            $stmt_ep->execute();
            $volumenes = $stmt_ep->get_result();
            
            if ($volumenes->num_rows > 0): ?>
                <div class="episodes-list">
                    <?php while ($volumen = $volumenes->fetch_assoc()): ?>
                        <div class="episode-card">
                            <div class="episode-number">volumen <?php echo htmlspecialchars($volumen['numero_volumen']); ?></div>
                            <?php if (!empty($volumen['titulo'])): ?>
                                <div class="episode-title"><?php echo htmlspecialchars($volumen['titulo']); ?></div>
                            <?php endif; ?>
                            <a href="<?php echo htmlspecialchars($volumen['ruta_volumen']); ?>" target="_blank" class="watch-btn">Leer ahora</a>
                        </div>
                    <?php endwhile; ?>
                </div>
            <?php else: ?>
                <p>No hay volumenes disponibles todavía.</p>
            <?php endif; ?>
    </div>
</div>
    </div>
</body>
</html>
<?php
$conn->close();
?>