<?php
include 'db_config.php';
session_start();
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';

// Verificar ID válido
if (!isset($_GET['id']) || !is_numeric($_GET['id'])) {
    header("Location: inicio_manga.php");
    exit();
}

$id = (int)$_GET['id'];

// Consulta para obtener el manga con sus géneros
$query = "SELECT m.*, GROUP_CONCAT(g.nombre SEPARATOR ', ') AS generos 
          FROM mangas m
          LEFT JOIN manga_generos mg ON m.id = mg.manga_id
          LEFT JOIN generos g ON mg.genero_id = g.id
          WHERE m.id = ?
          GROUP BY m.id";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    header("Location: inicio_manga.php?error=manga_no_encontrado");
    exit();
}

$manga = $result->fetch_assoc();

// Consulta para los capítulos del manga
$capitulos_query = "SELECT id, id_manga, nombre_capitulo, enlace_pdf, capitulo_inicio, capitulo_fin
                   FROM manga_capitulos 
                   WHERE id_manga = ? 
                   ORDER BY capitulo_inicio ASC";

$stmt_cp = $conn->prepare($capitulos_query);
$stmt_cp->bind_param("i", $id);
$stmt_cp->execute();
$capitulos = $stmt_cp->get_result();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($manga['nombre']); ?> - Aetheris</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
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
        
        /* Contenedor principal */
        .manga-container {
            max-width: 1200px;
            margin: 0 auto;
            position: relative;
            padding: 20px;
        }
        
        /* Banner del manga */
        .manga-banner {
            height: 300px;
            background-size: cover;
            background-position: center;
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        
        .manga-banner::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 100px;
            background: linear-gradient(transparent, var(--darker-bg));
        }
        
        /* Tarjeta de información del manga */
        .manga-card {
            display: flex;
            background-color: var(--card-bg);
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            margin-top: -80px;
            position: relative;
            z-index: 2;
            margin-bottom: 30px;
        }
        
        .manga-poster {
            flex: 0 0 250px;
            padding: 20px;
        }
        
        .manga-poster img {
            width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
        }
        
        .manga-info {
            flex: 1;
            padding: 30px;
        }
        
        .manga-title {
            font-size: 28px;
            margin: 0 0 10px;
            color: var(--primary-color);
        }
        
        .manga-meta {
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
        
        .manga-description {
            line-height: 1.6;
            margin-bottom: 20px;
        }
        
        .manga-genres {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 20px;
        }
        
        .genre-tag {
            background-color: rgba(255,255,255,0.1);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
        }
        
        /* Sección de capítulos */
        .chapters-section {
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
        
        .chapters-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 15px;
        }
        
        .chapter-card {
            background-color: rgba(255,255,255,0.05);
            border-radius: 6px;
            padding: 15px;
            transition: all 0.3s;
        }
        
        .chapter-card:hover {
            background-color: rgba(255,255,255,0.1);
            transform: translateY(-3px);
        }
        
        .chapter-number {
            font-weight: bold;
            color: var(--primary-color);
            margin-bottom: 5px;
        }
        
        .read-btn {
            display: inline-block;
            background-color: var(--primary-color);
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            margin-top: 10px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .read-btn:hover {
            background-color: #3a7bef;
        }
        
        /* Status badges */
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        .status-en-emision { background-color: #4CAF50; }
        .status-finalizado { background-color: #F44336; }
        .status-proximamente { background-color: #FF9800; }
        
        /* Responsive */
        @media (max-width: 768px) {
            .manga-card {
                flex-direction: column;
                margin-top: -50px;
            }
            
            .manga-poster {
                flex: 0 0 auto;
                text-align: center;
            }
            
            .manga-poster img {
                max-width: 200px;
            }
            
            .chapters-list {
                grid-template-columns: 1fr;
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

<div class="manga-container">
    <?php if (!empty($manga['portada'])): ?>
        <div class="manga-banner" style="background-image: url('<?php echo htmlspecialchars($manga['portada']); ?>')"></div>
    <?php endif; ?>

    <div class="manga-card">
        <div class="manga-poster">
            <?php if (!empty($manga['imagen'])): ?>
                <img src="<?php echo htmlspecialchars($manga['imagen']); ?>" alt="<?php echo htmlspecialchars($manga['nombre']); ?>">
            <?php endif; ?>
        </div>
        <div class="manga-info">
            <h1 class="manga-title"><?php echo htmlspecialchars($manga['nombre']); ?></h1>

            <div class="manga-meta">
                <?php if (!empty($manga['estado'])): ?>
                    <span class="status-badge status-<?php echo strtolower(str_replace(' ', '-', $manga['estado'])); ?>">
                        <?php echo htmlspecialchars($manga['estado']); ?>
                    </span>
                <?php endif; ?>

                <?php if (!empty($manga['fecha_publicacion'])): ?>
                    <span class="meta-item"><?php echo htmlspecialchars($manga['fecha_publicacion']); ?></span>
                <?php endif; ?>
            </div>

            <?php if (!empty($manga['generos'])): ?>
                <div class="manga-genres">
                    <?php 
                    $generos = explode(', ', $manga['generos']);
                    foreach ($generos as $genero): 
                        if (!empty(trim($genero))):
                    ?>
                        <span class="genre-tag"><?php echo htmlspecialchars(trim($genero)); ?></span>
                    <?php 
                        endif;
                    endforeach; 
                    ?>
                </div>
            <?php endif; ?>

            <?php if (!empty($manga['descripcion'])): ?>
                <div class="manga-description">
                    <h3>Sinopsis</h3>
                    <p><?php echo nl2br(htmlspecialchars($manga['descripcion'])); ?></p>
                </div>
            <?php endif; ?>
        </div>
    </div>

    <div class="chapters-section">
        <h2 class="section-title">Capítulos</h2>

        <?php if ($capitulos->num_rows > 0): ?>
            <div class="chapters-list">
                <?php while ($capitulo = $capitulos->fetch_assoc()): ?>
                    <div class="chapter-card">
                        <div class="chapter-number">
                            <?php 
                            if ($capitulo['capitulo_inicio'] == $capitulo['capitulo_fin']) {
                                echo "Capítulo ".htmlspecialchars($capitulo['capitulo_inicio']);
                            } else {
                                echo "Capítulos ".htmlspecialchars($capitulo['capitulo_inicio'])." - ".htmlspecialchars($capitulo['capitulo_fin']);
                            }
                            ?>
                        </div>
                        <?php if (!empty($capitulo['nombre_capitulo'])): ?>
                            <div class="chapter-title"><?php echo htmlspecialchars($capitulo['nombre_capitulo']); ?></div>
                        <?php endif; ?>
                        <?php if (!empty($capitulo['enlace_pdf'])): ?>
                            <a href="<?php echo htmlspecialchars($capitulo['enlace_pdf']); ?>" target="_blank" class="read-btn">Leer ahora</a>
                        <?php endif; ?>
                    </div>
                <?php endwhile; ?>
            </div>
        <?php else: ?>
            <p>No hay capítulos disponibles todavía.</p>
            <?php if($logged_in): ?>
                <a href="subir_capitulo.php?manga_id=<?php echo $id; ?>" class="read-btn">Subir primer capítulo</a>
            <?php endif; ?>
        <?php endif; ?>
    </div>
</div>

<script>
function buscarContenido() {
    const query = document.getElementById('global-search').value.trim();
    if(query.length > 2) {
        window.location.href = `busqueda.php?q=${encodeURIComponent(query)}&tipo=manga`;
    } else {
        alert('Por favor ingresa al menos 3 caracteres para buscar');
    }
}
</script>

</body>
</html>

<?php
$stmt->close();
if (isset($stmt_cp)) $stmt_cp->close();
$conn->close();
?>