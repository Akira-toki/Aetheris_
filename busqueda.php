<?php
session_start();
include 'db_config.php';

// Verificar si el usuario está logueado
$logged_in = isset($_SESSION['user_id']);
$username = $logged_in ? $_SESSION['username'] : '';
$is_admin = $logged_in && ($_SESSION['role'] ?? '') === 'admin';

// Obtener el término de búsqueda
$query = isset($_GET['q']) ? trim($_GET['q']) : '';

// Verificar si la consulta tiene al menos 3 caracteres
if(strlen($query) < 3) {
    header("Location: principal.php?error=query_too_short");
    exit();
}

// Preparar la consulta para buscar en múltiples tablas
$search_results = [];
$search_term = "%$query%";

// Buscar en animes
$stmt = $conn->prepare("SELECT id, nombre as titulo, 'anime' as tipo, portada as imagen_portada 
                       FROM animes 
                       WHERE nombre LIKE ? OR descripcion LIKE ? 
                       LIMIT 5");
$stmt->bind_param("ss", $search_term, $search_term);
$stmt->execute();
$anime_results = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// Buscar en mangas
$stmt = $conn->prepare("SELECT id, nombre as titulo, 'manga' as tipo, portada as imagen_portada 
                       FROM mangas 
                       WHERE nombre LIKE ? OR descripcion LIKE ? 
                       LIMIT 5");
$stmt->bind_param("ss", $search_term, $search_term);
$stmt->execute();
$manga_results = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// Buscar en novelas (documentos)
$stmt = $conn->prepare("SELECT id, nombre as titulo, 'novela' as tipo, imagen as imagen_portada 
                       FROM documentos 
                       WHERE nombre LIKE ? OR descripcion LIKE ? 
                       LIMIT 5");
$stmt->bind_param("ss", $search_term, $search_term);
$stmt->execute();
$novela_results = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

// Combinar todos los resultados
$search_results = array_merge($anime_results, $manga_results, $novela_results);

// Verificar si hay resultados
$has_results = !empty($search_results);
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Resultados de búsqueda - Aetheris</title>
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
        .Container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            min-height: 80vh;
        }
        
        /* Resultados de búsqueda */
        .search-header {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #252538;
        }
        
        .search-results {
            margin-top: 30px;
        }
        
        .result-item {
            background: #1a1a2a;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
            text-decoration: none;
            color: inherit;
        }
        
        .result-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
            border-left: 4px solid #4a8eff;
        }
        
        .result-image {
            width: 80px;
            height: 120px;
            object-fit: cover;
            border-radius: 4px;
            margin-right: 20px;
        }
        
        .image-placeholder {
            width: 80px;
            height: 120px;
            background: #252538;
            border-radius: 4px;
            margin-right: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #777;
            font-size: 12px;
            text-align: center;
        }
        
        .result-info {
            flex: 1;
        }
        
        .result-title {
            font-size: 18px;
            color: #4a8eff;
            margin-bottom: 5px;
        }
        
        .result-type {
            display: inline-block;
            padding: 3px 8px;
            background: #252538;
            border-radius: 4px;
            font-size: 12px;
            margin-bottom: 10px;
            text-transform: capitalize;
        }
        
        .no-results {
            text-align: center;
            padding: 50px;
            font-size: 18px;
            color: #777;
        }
        
        .search-query {
            color: #4a8eff;
            font-weight: bold;
        }
        
        .filter-buttons {
            display: flex;
            gap: 10px;
            margin-bottom: 20px;
        }
        
        .filter-button {
            background: #252538;
            border: none;
            color: #e0e0e0;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
        }
        
        .filter-button.active {
            background: #4a8eff;
            color: white;
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
            <div class="search-bar">
                <input type="text" id="global-search" placeholder="Buscar..." value="<?php echo htmlspecialchars($query); ?>">
                <button onclick="buscarContenido()">🔍</button>
            </div>
        </div>
    </header>
    
    <div class="Container">
        <div class="search-header">
            <h1>Resultados de búsqueda para: <span class="search-query"><?php echo htmlspecialchars($query); ?></span></h1>
            
            <div class="filter-buttons">
                <button class="filter-button active" data-type="all">Todos</button>
                <button class="filter-button" data-type="anime">Anime</button>
                <button class="filter-button" data-type="manga">Manga</button>
                <button class="filter-button" data-type="novela">Novelas</button>
            </div>
        </div>
        
        <div class="search-results">
            <?php if($has_results): ?>
                <?php foreach($search_results as $result): ?>
                    <a href="<?php echo $result['tipo']; ?>_detalle.php?id=<?php echo $result['id']; ?>" class="result-item" data-type="<?php echo $result['tipo']; ?>">
                        <?php if(!empty($result['imagen_portada'])): ?>
                            <img src="<?php echo htmlspecialchars($result['imagen_portada']); ?>" alt="<?php echo htmlspecialchars($result['titulo']); ?>" class="result-image">
                        <?php else: ?>
                            <div class="image-placeholder">
                                Sin imagen
                            </div>
                        <?php endif; ?>
                        <div class="result-info">
                            <h3 class="result-title"><?php echo htmlspecialchars($result['titulo']); ?></h3>
                            <span class="result-type"><?php echo ucfirst($result['tipo']); ?></span>
                        </div>
                    </a>
                <?php endforeach; ?>
            <?php else: ?>
                <div class="no-results">
                    <p>No se encontraron resultados para tu búsqueda.</p>
                    <p>Intenta con términos diferentes o más específicos.</p>
                </div>
            <?php endif; ?>
        </div>
    </div>
    
    <!-- Footer integrado -->
    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
    </footer>
    
    <script>
        // Función para buscar contenido
        function buscarContenido() {
            const query = document.getElementById('global-search').value.trim();
            if(query.length > 2) {
                window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
            } else {
                alert('Por favor ingresa al menos 3 caracteres para buscar.');
            }
        }
        
        // Manejar la tecla Enter en el campo de búsqueda
        document.getElementById('global-search').addEventListener('keypress', function(e) {
            if(e.key === 'Enter') {
                buscarContenido();
            }
        });
        
        // Filtrado de resultados por tipo
        document.querySelectorAll('.filter-button').forEach(button => {
            button.addEventListener('click', function() {
                // Actualizar botones activos
                document.querySelectorAll('.filter-button').forEach(btn => {
                    btn.classList.remove('active');
                });
                this.classList.add('active');
                
                const type = this.dataset.type;
                const allResults = document.querySelectorAll('.result-item');
                
                allResults.forEach(result => {
                    if(type === 'all' || result.dataset.type === type) {
                        result.style.display = 'flex';
                    } else {
                        result.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>