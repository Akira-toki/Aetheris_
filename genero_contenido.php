<?php
// Activar reporte de errores para desarrollo (quitar en producción)
error_reporting(E_ALL);
ini_set('display_errors', 1);

session_start();
include 'db_config.php';

// Verificar conexión a la base de datos
if (!$conn) {
    die("Error de conexión: " . mysqli_connect_error());
}

// Función segura para obtener imágenes
function getContentImage($path) {
    if (empty($path)) return false;
    
    $cleanPath = 'uploads/' . basename($path);
    $fullPath = $_SERVER['DOCUMENT_ROOT'] . '/' . $cleanPath;
    
    return (file_exists($fullPath)) ? $cleanPath : false;
}

try {
    // Obtener parámetros con validación
    $genero_id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT, ['options' => ['min_range' => 1]]);
    $tipo_contenido = in_array($_GET['tipo'] ?? '', ['novela', 'anime', 'manga', 'todos']) 
        ? $_GET['tipo'] 
        : 'todos';

    if (!$genero_id) {
        header("Location: todos_generos.php");
        exit();
    }

    // Obtener nombre del género
    $stmt = $conn->prepare("SELECT nombre FROM generos WHERE id = ?");
    if (!$stmt) throw new Exception("Error preparando consulta: " . $conn->error);
    
    $stmt->bind_param("i", $genero_id);
    if (!$stmt->execute()) throw new Exception("Error ejecutando consulta: " . $stmt->error);
    
    $result = $stmt->get_result();
    if ($result->num_rows === 0) {
        header("Location: todos_generos.php");
        exit();
    }
    
    $genero = $result->fetch_assoc();
    $genero_nombre = htmlspecialchars($genero['nombre']);
    $stmt->close();

    // Consultas para cada tipo de contenido
    $contenidos = ['novelas' => [], 'animes' => [], 'mangas' => []];
    
    $queries = [
        'novela' => "SELECT d.id, d.nombre, d.imagen FROM documentos d 
                    JOIN novela_generos ng ON d.id = ng.novela_id 
                    WHERE ng.genero_id = ? 
                    ORDER BY d.id DESC LIMIT 6",
        'anime' => "SELECT a.id, a.nombre, a.imagen FROM animes a 
                   JOIN anime_generos ag ON a.id = ag.anime_id 
                   WHERE ag.genero_id = ? 
                   ORDER BY a.id DESC LIMIT 6",
        'manga' => "SELECT m.id, m.nombre, m.imagen FROM mangas m 
                   JOIN manga_generos mg ON m.id = mg.manga_id 
                   WHERE mg.genero_id = ? 
                   ORDER BY m.id DESC LIMIT 6"
    ];
    
    foreach ($queries as $tipo => $sql) {
        if ($tipo_contenido == 'todos' || $tipo_contenido == $tipo) {
            $stmt = $conn->prepare($sql);
            if (!$stmt) throw new Exception("Error preparando consulta de $tipo: " . $conn->error);
            
            $stmt->bind_param("i", $genero_id);
            if (!$stmt->execute()) throw new Exception("Error ejecutando consulta de $tipo: " . $stmt->error);
            
            $contenidos[$tipo . 's'] = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            $stmt->close();
        }
    }

    // Verificar sesión
    $logged_in = isset($_SESSION['user_id']);
    $username = $logged_in ? htmlspecialchars($_SESSION['username']) : '';
    $is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';

} catch (Exception $e) {
    // Registrar error y mostrar mensaje amigable
    error_log($e->getMessage());
    die("Ocurrió un error al cargar la página. Por favor intenta nuevamente.");
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Aetheris - <?php echo htmlspecialchars($genero_nombre); ?></title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="<?php echo getSafeImagePath('uploads/aetheris.png', 'uploads/default.png'); ?>" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        /* Estilos base */
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
        
        
        /* Sección de género */
        .genre-header {
            margin: 30px 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .genre-title {
            font-size: 28px;
            color: #4a8eff;
        }
        
        .genre-filter {
            display: flex;
            gap: 10px;
        }
        
        .genre-filter-btn {
            background: #252538;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .genre-filter-btn.active {
            background: #4a8eff;
        }
        
        /* Listados de contenido */
        .content-section {
            margin: 40px 0;
        }
        
        .section-title {
            font-size: 22px;
            color: #4a8eff;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .section-title i {
            font-size: 20px;
        }

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
            padding: 20px;
        }
        .content-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            gap: 20px;
            margin: 20px 0;
        }
        .content-card {
            background: #1a1a2a;
            border-radius: 8px;
            overflow: hidden;
        }
        .content-image {
            height: 250px;
            overflow: hidden;
        }
        .content-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        
        .content-card:hover .content-image img {
            transform: scale(1.05);
        }
        
        .content-info {
            padding: 15px;
        }
        
        .content-name {
            font-size: 16px;
            margin: 0 0 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .view-all {
            text-align: right;
            margin-top: 15px;
        }
        
        .view-all a {
            color: #4a8eff;
            text-decoration: none;
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
<header>
    <div class="header-left">
        <a href="principal.php" class="logo">Aetheris</a>
    </div>
    <div class="header-right">
        <div class="menu">
            <button class="menu-button">Menú</button>
            <div class="menu-content">
                <a href="inicio.php">📖 Novelas</a>
                <a href="inicio_anime.php">🎬 Anime</a>
                <a href="inicio_manga.php">📘 Manga</a>
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                
                <?php if($is_admin): ?>
                    <a href="subir_contenido.php">⬆️ Subir Contenido</a>
                <?php endif; ?>
                <a href="directorio.php">📋 Directorio</a>
                
                <div class="submenu">
                    <a href="#" class="submenu-button">🗂️ Géneros</a>
                    <div class="submenu-content">
                        <?php
                        $stmt = $conn->prepare("SELECT id, nombre FROM generos ORDER BY nombre");
                        if ($stmt && $stmt->execute()) {
                            $generos = $stmt->get_result();
                            while($genero = $generos->fetch_assoc()) {
                                echo '<a href="genero_contenido.php?id='.$genero['id'].'&tipo=anime">'.htmlspecialchars($genero['nombre']).' (Anime)</a>';
                                echo '<a href="genero_contenido.php?id='.$genero['id'].'&tipo=manga">'.htmlspecialchars($genero['nombre']).' (Manga)</a>';
                                echo '<a href="genero_contenido.php?id='.$genero['id'].'&tipo=novela">'.htmlspecialchars($genero['nombre']).' (Novelas)</a>';
                            }
                            $stmt->close();
                        }
                        ?>
                        <a href="todos_generos.php">Ver todos...</a>
                    </div>
                </div>
                
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                
                <?php if($logged_in): ?>
                    <a href="perfil.php">👤 <?php echo $username; ?></a>
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
        window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
    } else {
        alert('Por favor ingresa al menos 3 caracteres para buscar');
    }
}
</script>

<div class="Container">
        <h1><?= $genero_nombre ?></h1>
        
        <!-- Filtros -->
        <div style="margin: 20px 0;">
            <a href="genero_contenido.php?id=<?= $genero_id ?>&tipo=todos" 
               style="padding: 8px 16px; background: <?= $tipo_contenido == 'todos' ? '#4a8eff' : '#252538' ?>; color: white; text-decoration: none; border-radius: 4px; margin-right: 10px;">
                Todos
            </a>
            <a href="genero_contenido.php?id=<?= $genero_id ?>&tipo=novela" 
               style="padding: 8px 16px; background: <?= $tipo_contenido == 'novela' ? '#4a8eff' : '#252538' ?>; color: white; text-decoration: none; border-radius: 4px; margin-right: 10px;">
                Novelas
            </a>
            <a href="genero_contenido.php?id=<?= $genero_id ?>&tipo=anime" 
               style="padding: 8px 16px; background: <?= $tipo_contenido == 'anime' ? '#4a8eff' : '#252538' ?>; color: white; text-decoration: none; border-radius: 4px; margin-right: 10px;">
                Anime
            </a>
            <a href="genero_contenido.php?id=<?= $genero_id ?>&tipo=manga" 
               style="padding: 8px 16px; background: <?= $tipo_contenido == 'manga' ? '#4a8eff' : '#252538' ?>; color: white; text-decoration: none; border-radius: 4px;">
                Manga
            </a>
        </div>

        <!-- Contenido -->
        <?php foreach (['novelas', 'animes', 'mangas'] as $tipo): ?>
            <?php if (($tipo_contenido == 'todos' || $tipo_contenido == substr($tipo, 0, -1)) && !empty($contenidos[$tipo])): ?>
                <h2><?= ucfirst($tipo) ?> de <?= $genero_nombre ?></h2>
                <div class="content-grid">
                    <?php foreach ($contenidos[$tipo] as $item): ?>
                        <?php if ($imagen = getContentImage($item['imagen'])): ?>
                            <div class="content-card">
                                <a href="<?= substr($tipo, 0, -1) ?>_detalle.php?id=<?= $item['id'] ?>">
                                    <div class="content-image">
                                        <img src="<?= $imagen ?>" alt="<?= htmlspecialchars($item['nombre']) ?>">
                                    </div>
                                    <div style="padding: 15px;">
                                        <h3 style="margin: 0; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                            <?= htmlspecialchars($item['nombre']) ?>
                                        </h3>
                                    </div>
                                </a>
                            </div>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>

        <?php if (empty(array_filter($contenidos))): ?>
            <p style="text-align: center; color: #aaa;">No se encontró contenido para este género.</p>
        <?php endif; ?>
    </div>
<footer>
    <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
</footer>
</body>
</html>