<?php
include 'db_config.php';
session_start();

// Verificar autenticación y permisos
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

// Procesar el formulario cuando se envía
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Validar y sanitizar datos
    $nombre = $conn->real_escape_string(trim($_POST['nombre']));
    $descripcion = $conn->real_escape_string(trim($_POST['descripcion']));
    $estado = $conn->real_escape_string($_POST['estado'] ?? 'En emisión');
    $fecha_publicacion = date('Y-m-d'); // Fecha actual
    
    // Validar archivo subido
    if (isset($_FILES['portada']) && $_FILES['portada']['error'] === UPLOAD_ERR_OK) {
        $file = $_FILES['portada'];
        $allowed_types = ['image/jpeg', 'image/png', 'image/webp'];
        $max_size = 2 * 1024 * 1024; // 2MB
        
        // Verificar tipo y tamaño
        if (in_array($file['type'], $allowed_types) && $file['size'] <= $max_size) {
            // Crear directorio si no existe
            $upload_dir = 'uploads/mangas/';
            if (!file_exists($upload_dir)) {
                mkdir($upload_dir, 0755, true);
            }
            
            // Generar nombre único para la imagen
            $ext = pathinfo($file['name'], PATHINFO_EXTENSION);
            $filename = uniqid('manga_') . '.' . $ext;
            $destination = $upload_dir . $filename;
            
            // Mover archivo subido
            if (move_uploaded_file($file['tmp_name'], $destination)) {
                // Insertar manga en la base de datos
                $conn->begin_transaction();
                
                try {
                    // Insertar datos del manga
                    $stmt = $conn->prepare("INSERT INTO mangas (nombre, descripcion, imagen, estado, fecha_publicacion) VALUES (?, ?, ?, ?, ?)");
                    $stmt->bind_param("sssss", $nombre, $descripcion, $destination, $estado, $fecha_publicacion);
                    $stmt->execute();
                    $manga_id = $stmt->insert_id;
                    
                    // Insertar géneros (relación muchos a muchos)
                    if (!empty($_POST['generos']) && is_array($_POST['generos'])) {
                        $stmt = $conn->prepare("INSERT INTO manga_generos (manga_id, genero_id) VALUES (?, ?)");
                        
                        foreach ($_POST['generos'] as $genero_id) {
                            $genero_id = (int)$genero_id;
                            $stmt->bind_param("ii", $manga_id, $genero_id);
                            $stmt->execute();
                        }
                    }
                    
                    $conn->commit();
                    $success = "Manga subido correctamente!";
                } catch (Exception $e) {
                    $conn->rollback();
                    $error = "Error al subir el manga: " . $e->getMessage();
                    // Eliminar imagen si hubo error
                    if (file_exists($destination)) {
                        unlink($destination);
                    }
                }
            } else {
                $error = "Error al mover el archivo subido";
            }
        } else {
            $error = "Tipo de archivo no permitido o tamaño excede el límite (2MB)";
        }
    } else {
        $error = "Debes subir una imagen de portada válida";
    }
}

// Obtener lista de géneros para el select
$generos = $conn->query("SELECT id, nombre FROM generos ORDER BY nombre");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Subir Manga</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        :root {
            --primary-color: #4a8eff;
            --dark-bg: #121212;
            --card-bg: #1a1a2a;
            --text-color: #e0e0e0;
            --text-muted: #a0a0a0;
            --error-color: #ff4a4a;
            --success-color: #4aff4a;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            background-color: var(--dark-bg);
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
        
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .logo {
            color: var(--primary-color);
            font-size: 24px;
            font-weight: bold;
            text-decoration: none;
        }

        .navigation ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        .navigation a {
            color: var(--text-color);
            text-decoration: none;
            font-weight: 600;
            padding: 8px 12px;
            transition: background-color 0.3s;
        }

        .navigation a:hover {
            background-color: rgba(74, 142, 255, 0.1);
            border-radius: 6px;
        }

        .dropdown-toggle {
            cursor: pointer;
        }

        .dropdown-menu {
            display: none;
            position: absolute;
            background-color: var(--card-bg);
            padding: 10px;
            border-radius: 6px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            margin-top: 8px;
        }

        .dropdown-menu li {
            padding: 8px;
        }

        .dropdown-menu li a {
            color: var(--text-color);
        }

        .dropdown-menu li a:hover {
            background-color: var(--primary-color);
            color: white;
            border-radius: 4px;
        }

        .navigation li {
            position: relative;
        }

        .navigation li:hover .dropdown-menu {
            display: block;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            background-color: var(--card-bg);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        h1 {
            color: var(--primary-color);
            margin-top: 0;
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 10px;
        }

        label {
            display: block;
            margin-top: 20px;
            margin-bottom: 8px;
            font-weight: 600;
        }

        input[type="text"],
        textarea,
        select,
        input[type="file"] {
            width: 100%;
            padding: 12px;
            background-color: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 6px;
            color: var(--text-color);
            font-size: 15px;
            box-sizing: border-box;
        }

        textarea {
            min-height: 150px;
            resize: vertical;
        }

        input[type="submit"] {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 14px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            margin-top: 20px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #3a7bef;
            transform: translateY(-2px);
        }

        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            .header-container {
                flex-direction: column;
                align-items: flex-start;
            }

            .navigation ul {
                flex-direction: column;
                gap: 10px;
            }
        }
        .message {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-weight: 600;
        }

        .error {
            background-color: rgba(255, 74, 74, 0.1);
            color: var(--error-color);
            border: 1px solid var(--error-color);
        }

        .success {
            background-color: rgba(74, 255, 74, 0.1);
            color: var(--success-color);
            border: 1px solid var(--success-color);
        }

        .checkbox-group {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 10px;
            margin-top: 10px;
        }

        .checkbox-label {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px;
            background-color: rgba(255, 255, 255, 0.05);
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .checkbox-label:hover {
            background-color: rgba(74, 142, 255, 0.2);
        }

        .checkbox-input {
            margin: 0;
        }
    </style>
</head>
<body>

<!-- HEADER -->
<header>
    <div class="header-container">
        <a href="inicio.php" class="logo">Aetheris</a>
        <div class="header-right">
    </div>
        <div class="menu">
            <button class="menu-button">Menú</button>
            <div class="menu-content">
                <a href="inicio.php">📖 Novelas</a>
                <a href="inicio_anime.php">🎬 Anime</a>
                <a href="inicio_manga.php">📘 Manga</a>
                <div class="submenu">
                    <a href="#">⬆️ Subir Contenido</a>
                    <div class="submenu-content">
                        <a href="subir_anime.php?filter=estreno">⬆🌸Subir anime</a>
                        <a href="subir_manga.php?filter=popular">⬆⛩️Subir manga</a>
                    </div>
                </div>
                <a href="directorio.php">📋 Directorio</a>
                <div class="submenu">
                    <a href="#">🗂️ Géneros</a>
                    <div class="submenu-content">
                        <?php 
                        $generos_menu = $conn->query("SELECT nombre FROM generos ORDER BY nombre LIMIT 10"); 
                        while($genero = $generos_menu->fetch_assoc()) {
                            echo '<a href="genero.php?tipo=manga&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Manga)</a>';
                        } 
                        ?>
                        <a href="todos_generos.php">Ver todos...</a>
                    </div>
                </div>
                <div class="submenu">
                    <a href="#">⚡ Acceso Rápido</a>
                    <div class="submenu-content">
                        <a href="inicio_manga.php?filter=popular">🔥 Populares</a>
                        <a href="inicio_manga.php?filter=finalizados">🏁 Finalizados</a>
                    </div>
                </div>
                <?php if(isset($_SESSION['user_id'])): ?>
                    <a href="logout.php">🔒 Cerrar sesión</a>
                <?php else: ?>
                    <a href="login.php">🔑 Iniciar Sesión</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>

<!-- FORMULARIO -->
<div class="container">
    <h1>Subir Manga</h1>
    
    <?php if(isset($error)): ?>
        <div class="message error"><?php echo htmlspecialchars($error); ?></div>
    <?php elseif(isset($success)): ?>
        <div class="message success"><?php echo htmlspecialchars($success); ?></div>
    <?php endif; ?>
    
    <form action="subir_manga.php" method="POST" enctype="multipart/form-data">
        <label for="nombre">Nombre del Manga:</label>
        <input type="text" name="nombre" required>
        
        <label for="descripcion">Descripción:</label>
        <textarea name="descripcion" rows="4" required></textarea>
        
        <label for="portada">Portada (JPEG/PNG/WEBP, max 2MB):</label>
        <input type="file" name="portada" accept="image/jpeg,image/png,image/webp" required>
        
        <label for="estado">Estado:</label>
        <select name="estado" required>
            <option value="En emisión">En emisión</option>
            <option value="Finalizado">Finalizado</option>
            <option value="Próximamente">Próximamente</option>
        </select>
        
        <label>Géneros:</label>
        <div class="checkbox-group">
            <?php while($genero = $generos->fetch_assoc()): ?>
                <label class="checkbox-label">
                    <input type="checkbox" name="generos[]" value="<?php echo $genero['id']; ?>" class="checkbox-input">
                    <?php echo htmlspecialchars($genero['nombre']); ?>
                </label>
            <?php endwhile; ?>
        </div>
        
        <input type="submit" value="Subir Manga">
    </form>
</div>

<script>
// Validación del formulario antes de enviar
document.querySelector('form').addEventListener('submit', function(e) {
    const generos = document.querySelectorAll('input[name="generos[]"]:checked');
    if (generos.length === 0) {
        alert('Selecciona al menos un género');
        e.preventDefault();
    }
    
    const fileInput = document.querySelector('input[name="portada"]');
    if (fileInput.files.length > 0) {
        const file = fileInput.files[0];
        const validTypes = ['image/jpeg', 'image/png', 'image/webp'];
        const maxSize = 2 * 1024 * 1024; // 2MB
        
        if (!validTypes.includes(file.type)) {
            alert('Solo se permiten imágenes JPEG, PNG o WEBP');
            e.preventDefault();
        }
        
        if (file.size > maxSize) {
            alert('La imagen no debe superar los 2MB');
            e.preventDefault();
        }
    }
});
</script>

</body>
</html>