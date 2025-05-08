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
    $id_novela = $_POST['id_novela'];
    $numero_volumen = $_POST['numero_volumen'];
    $ruta_volumen = $_POST['ruta_volumen'];
    
    // Validar datos
    if (empty($id_novela) || empty($numero_volumen) || empty($ruta_volumen)) {
        $error = "Los campos obligatorios son: Novela, numero del volumen y ruta_volumen";
    } else {
        // Validar que el enlace sea de Google Drive
        if (strpos($ruta_volumen, 'drive.google.com') === false) {
            $error = "El enlace debe ser de Google Drive";
        } else {
            // Insertar en la base de datos
            $stmt = $conn->prepare("INSERT INTO volumenes (id_novela, numero_volumen, ruta_volumen) VALUES (?, ?, ?)");
            $stmt->bind_param("iis", $id_novela, $numero_volumen, $ruta_volumen);
            
            if ($stmt->execute()) {
                $success = "Volumen subido correctamente";
            } else {
                $error = "Error al subir el Volumen: " . $conn->error;
            }
        }
    }
}

// Obtener lista de novelas para el select
$novelas = $conn->query("SELECT id, nombre FROM novelas ORDER BY nombre");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Volumen - Aetheris</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <style>
        :root {
            --primary-color:  #4adeff;
            --dark-bg: #121212;
            --darker-bg: #1d2e37;
            --card-bg:  #162023;
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
            background-color:#132125;
            color: white;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 2px 10px rgba(0,0,0,0.5);
        }
        .header-left .logo {
            font-size: 24px;
            color:  #4adeff;
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
            background-color:#415b61;
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
            background:  #253038;
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
            background-color: #4adeff;
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
        background-color: #4adeff; 
        color: white;
    }

    select option:checked {
        background-color: #4adeff; 
        color: white;
    }

    select:focus {
        outline: none;
        border-color: #4adeff;
        box-shadow: 0 0 0 2px rgba(74, 183, 255, 0.3);
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
                <a href="inicio.php">🎬 Novela</a>
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
                            echo '<a href="genero.php?tipo=novela&nombre='.urlencode($genero['nombre']).'">'.$genero['nombre'].' (Novela)</a>';
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
                        <a href="inicio.php?filter=estreno">🎉 Nuevos Estrenos</a>
                        <a href="inicio_manga.php?filter=popular">🔥 Populares</a>
                        <a href="inicio.php?filter=finalizados">🏁 Finalizados</a>
                    </div>
                </div>
                <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                <a href="login.php">🔑 Iniciar Sesión</a>
            </div>
        </div>
        <div class="search-bar">
            <input type="text" id="global-search" placeholder="Buscar en Novela, Manga, Novelas...">
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
        <h1>Subir Nuevo Volumen</h1>
        
        <?php if (isset($success)): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="form-group">
                <label for="id_novela">Novela</label>
                <select id="id_novela" name="id_novela" required>
                    <option value="">Seleccionar novela...</option>
                    <?php while ($novela = $novelas->fetch_assoc()): ?>
                        <option value="<?php echo $novela['id']; ?>"><?php echo $novela['nombre']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            
            <div class="form-group">
                <label for="numero_volumen">numero del volumen</label>
                <input type="text" id="numero_volumen" name="numero_volumen" required>
            </div>
            
            <div class="form-group">
                <label for="ruta_volumen">Enlace de Google Drive al PDF</label>
                <input type="url" id="ruta_volumen" name="ruta_volumen" required>

            </div>
            
            <button type="submit" class="btn">Subir Volumen</button>
        </form>
    </div>
</body>
</html>