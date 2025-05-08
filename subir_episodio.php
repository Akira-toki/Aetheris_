<?php
include 'db_config.php';
include 'db_config.php';
session_start();

// Verificación doble: sesión activa + rol admin
if (!isset($_SESSION['user_id']) || ($_SESSION['role'] ?? 'user') !== 'admin') {
    header("Location: principal.php"); // O redirige a login/inicio
    exit();
}
// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_anime = $_POST['id_anime'];
    $numero_episodio = $_POST['numero_episodio'];
    $embed_code = $_POST['embed_code'];
    
    // Validar datos
    if (empty($id_anime) || empty($numero_episodio) || empty($embed_code)) {
        $error = "Todos los campos son obligatorios";
    } else {
        // Insertar en la base de datos
        $stmt = $conn->prepare("INSERT INTO episodios (id_anime, numero_episodio, embed_code) VALUES (?, ?, ?)");
        $stmt->bind_param("iis", $id_anime, $numero_episodio, $embed_code);
        
        if ($stmt->execute()) {
            $success = "Episodio subido correctamente";
        } else {
            $error = "Error al subir el episodio: " . $conn->error;
        }
    }
}

// Obtener lista de animes para el select
$animes = $conn->query("SELECT id, nombre FROM animes ORDER BY nombre");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Episodio - Aetheris</title>
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
            padding: 20px;
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
            max-width: 800px;
            margin: 0 auto;
            background-color: var(--card-bg);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        
        h1 {
            color: var(--primary-color);
            margin-top: 0;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        
        select, input, textarea {
            width: 100%;
            padding: 10px;
            background-color: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 4px;
            color: var(--text-color);
            font-family: 'Open Sans', sans-serif;
        }
        
        textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        .btn:hover {
            background-color: #3a7bef;
        }
        
        .alert {
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .alert-success {
            background-color: rgba(76, 175, 80, 0.2);
            color: #4CAF50;
        }
        
        .alert-error {
            background-color: rgba(244, 67, 54, 0.2);
            color: #F44336;
        }
        
        .example {
            background-color: rgba(0,0,0,0.3);
            padding: 15px;
            border-radius: 4px;
            margin-top: 10px;
            font-size: 14px;
        }
        select {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%234a8eff'%3e%3cpath d='M7 10l5 5 5-5z'/%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 10px center;
        background-size: 16px;
        padding-right: 30px;
    }

    select option {
        color: #e0e0e0; 
        background-color: #1a1a2a; 
        padding: 10px;
    }

    select option:hover {
        background-color: #4a8eff; 
        color: white;
    }

    select option:checked {
        background-color: #4a8eff; 
        color: white;
    }

    select:focus {
        outline: none;
        border-color: #4a8eff;
        box-shadow: 0 0 0 2px rgba(74, 142, 255, 0.3);
    }
    </style>
</head>
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
                <a href="subir_contenido.php">⬆️ Subir Contenido</a>
                <a href="directorio.php">📋 Directorio</a>
                
                <!-- Submenú de géneros -->
                <div class="submenu">
                    <a href="#" class="submenu-button">🗂️ Géneros</a>
                    <div class="submenu-content">
                        <?php
                        include 'db_config.php';
                        $generos = $conn->query("SELECT nombre FROM generos ORDER BY nombre LIMIT 10");
                        while($genero = $generos->fetch_assoc()) {
                            echo '<a href="genero.php?tipo=anime&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Anime)</a>';
                            echo '<a href="genero.php?tipo=manga&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Manga)</a>';
                            echo '<a href="genero.php?tipo=novela&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Novelas)</a>';
                        }
                        ?>
                        <a href="todos_generos.php">Ver todos...</a>
                    </div>
                </div>
                
                <!-- Acceso rápido por tipo -->
                <div class="submenu">
                    <a href="#" class="submenu-button">⚡ Acceso Rápido</a>
                    <div class="submenu-content">
                        <a href="inicio_anime.php?filter=estreno">🎉 Nuevos Estrenos</a>
                        <a href="inicio_manga.php?filter=popular">🔥 Populares</a>
                        <a href="inicio.php?filter=finalizados">🏁 Finalizados</a>
                    </div>
                </div>
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                <a href="login.php">🔑 Iniciar Sesión</a>
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
<body>
    <div class="container">
        <h1>Subir Nuevo Episodio</h1>
        
        <?php if (isset($success)): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="form-group">
                <label for="id_anime">Anime</label>
                <select id="id_anime" name="id_anime" required>
                    <option value="">Seleccionar anime...</option>
                    <?php while ($anime = $animes->fetch_assoc()): ?>
                        <option value="<?php echo $anime['id']; ?>"><?php echo $anime['nombre']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            
            <div class="form-group">
                <label for="numero_episodio">Número de Episodio</label>
                <input type="number" id="numero_episodio" name="numero_episodio" min="1" required>
            </div>
            
            <div class="form-group">
                <label for="embed_code">Código de Embed (iframe)</label>
                <textarea id="embed_code" name="embed_code" required></textarea>

            </div>
            
            <button type="submit" class="btn">Subir Episodio</button>
        </form>
    </div>
</body>
</html>