<?php
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    $_SESSION['redirect_to'] = 'subir_contenido.php';
    header("Location: login.php");
    exit();
}

// Verificar si es administrador
if ($_SESSION['role'] !== 'admin') {
    $_SESSION['error'] = "Acceso restringido a administradores";
    header("Location: principal.php"); 
    exit();
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Aetheris - Subir Contenido</title>
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
        
        /* Contenido principal */
        .Body {
            padding: 20px 0;
            min-height: 70vh;
        }
        
        .Title-Section {
            color: #4a8eff;
            font-size: 24px;
            margin: 20px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        /* Panel de administración */
        .admin-panel {
            background: linear-gradient(135deg, #1a1a2a 0%, #252538 100%);
            border-radius: 8px;
            padding: 30px;
            margin-bottom: 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.3);
        }
        
        .admin-title {
            font-size: 28px;
            color: #4a8eff;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .admin-subtitle {
            font-size: 18px;
            color: #aaa;
            margin-bottom: 30px;
            text-align: center;
        }
        
        /* Opciones de subida */
        .upload-options {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 40px;
        }
        
        .upload-option {
            background: #1a1a2a;
            border-radius: 8px;
            padding: 30px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 2px solid transparent;
        }
        
        .upload-option:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
            border-color: #4a8eff;
        }
        
        .upload-icon {
            font-size: 48px;
            margin-bottom: 15px;
        }
        
        .upload-title {
            font-size: 22px;
            color: #4a8eff;
            margin-bottom: 10px;
        }
        
        .upload-description {
            font-size: 15px;
            color: #aaa;
            margin-bottom: 20px;
        }
        
        .upload-button {
            background: #4a8eff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 600;
            transition: background 0.3s;
            text-decoration: none;
            display: inline-block;
        }
        
        .upload-button:hover {
            background: #3a7bef;
        }
        
        /* Mensajes de alerta */
        .alert {
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            text-align: center;
        }
        
        .alert-success {
            background-color: #1a3a1a;
            color: #4caf50;
        }
        
        .alert-error {
            background-color: #3a1a1a;
            color: #f44336;
        }
        .upload-actions {
    display: flex;
    justify-content: center;
    margin-top: 15px;
}

.upload-actions .upload-button {
    margin: 0;
    padding: 8px 15px;
    flex-grow: 1;
    max-width: 120px;
    text-align: center;
}

@media (max-width: 400px) {
    .upload-actions {
        flex-direction: column;
    }
    .upload-actions .upload-button {
        max-width: 100%;
        margin-bottom: 8px !important;
    }
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
    <!-- Header -->
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
                    
                    <?php if(($_SESSION['rol'] ?? '') === 'admin'): ?>
                        <a href="subir_contenido.php">⬆️ Subir Contenido</a>
                    <?php endif; ?>
                    
                    <a href="directorio.php">📋 Directorio</a>
                    <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                    <a href="perfil.php">👤 <?php echo htmlspecialchars($_SESSION['usuario_nombre'] ?? 'Usuario'); ?></a>
                    <a href="logout.php">🚪 Cerrar Sesión</a>
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
        }
    }
    </script>

    <!-- Contenido principal -->
    <div class="Body">
        <div class="Container">
            <!-- Panel de administración -->
            <div class="admin-panel">
                <h1 class="admin-title">Panel de Administración</h1>
                <p class="admin-subtitle">Bienvenido, <?php echo htmlspecialchars($_SESSION['usuario_nombre'] ?? 'Administrador'); ?></p>
                
                <?php if(isset($_SESSION['exito'])): ?>
                    <div class="alert alert-success">
                        <?php echo htmlspecialchars($_SESSION['exito']); 
                        unset($_SESSION['exito']); ?>
                    </div>
                <?php endif; ?>
                
                <?php if(isset($_SESSION['error'])): ?>
                    <div class="alert alert-error">
                        <?php echo htmlspecialchars($_SESSION['error']); 
                        unset($_SESSION['error']); ?>
                    </div>
                <?php endif; ?>
                
                <div class="Title-Section">
                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M19 3H5C3.9 3 3 3.9 3 5V19C3 20.1 3.9 21 5 21H19C20.1 21 21 20.1 21 19V5C21 3.9 20.1 3 19 3ZM19 19H5V5H19V19Z" fill="#4a8eff"/>
                        <path d="M11.25 7.72H6.25V9.22H11.25V7.72Z" fill="#4a8eff"/>
                        <path d="M18 15.75H13V17.25H18V15.75Z" fill="#4a8eff"/>
                        <path d="M18 13.25H13V14.75H18V13.25Z" fill="#4a8eff"/>
                        <path d="M8 18H9.5V16H11.5V14.5H9.5V12.5H8V14.5H6V16H8V18Z" fill="#4a8eff"/>
                        <path d="M14.09 10.95L15.5 9.54L16.91 10.95L17.97 9.89L16.56 8.47L17.97 7.06L16.91 6L15.5 7.41L14.09 6L13.03 7.06L14.44 8.47L13.03 9.89L14.09 10.95Z" fill="#4a8eff"/>
                    </svg>
                    Selecciona el tipo de contenido a subir
                </div>
                
                <div class="upload-options">
                    <!-- Opción para subir Anime -->
                    <div class="upload-option">
    <div class="upload-icon">🎬</div>
    <h3 class="upload-title">Gestión de Anime</h3>
    <p class="upload-description">
        Administra series y episodios de anime
    </p>
    <div class="upload-actions">
        <a href="subir_anime.php" class="upload-button" style="margin-right: 10px;">
            Nueva Serie
        </a>
        <a href="subir_episodio.php" class="upload-button" style="background: #3a7bef;">
            Nuevo Episodio
        </a>
    </div>
</div>
                    <!-- Opción para subir Manga -->
                    <div class="upload-option">
                        <div class="upload-icon">📘</div>
                        <h3 class="upload-title">Gestión de Manga</h3>
                        <p class="upload-description">
                            Administra series y capítulos de manga
                        </p>
                        <div class="upload-actions">
                            <a href="subir_manga.php" class="upload-button" style="margin-right: 10px;">
                                Nueva Serie
                            </a>
                            <a href="subir_capitulo.php" class="upload-button" style="background: #3a7bef;">
                                Nuevo Capítulo
                            </a>
                        </div>
                    </div>
                    
                    <!-- Opción para subir Novelas -->
                    <div class="upload-option">
                        <div class="upload-icon">📖</div>
                        <h3 class="upload-title">Gestión de Novelas</h3>
                        <p class="upload-description">
                            Administra series y volúmenes de novelas
                        </p>
                        <div class="upload-actions">
                            <a href="subir_novela.php" class="upload-button" style="margin-right: 10px;">
                                Nueva Serie
                            </a>
                            <a href="subir_volumen.php" class="upload-button" style="background: #3a7bef;">
                                Nuevo Volumen
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
    </footer>
</body>
</html>