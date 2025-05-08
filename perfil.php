<?php
session_start();
include 'db_config.php';

// Verificar si el usuario está logueado
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$username = $_SESSION['username'];
$is_admin = ($_SESSION['role'] ?? '') === 'admin';

// Obtener información del usuario
$stmt = $conn->prepare("SELECT id, username, email, role, created_at, profile_image FROM users WHERE id = ?");
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

// Procesar actualización del perfil
$update_message = '';
$errors = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['update_profile'])) {
        // Actualizar información básica
        $new_username = trim($_POST['username']);
        $new_email = trim($_POST['email']);
        
        // Validaciones
        if (empty($new_username)) {
            $errors[] = "El nombre de usuario no puede estar vacío";
        }
        
        if (empty($new_email)) {
            $errors[] = "El email no puede estar vacío";
        } elseif (!filter_var($new_email, FILTER_VALIDATE_EMAIL)) {
            $errors[] = "El email no tiene un formato válido";
        }
        
        // Verificar si el username o email ya existen (excepto para el usuario actual)
        $check_stmt = $conn->prepare("SELECT id FROM users WHERE (username = ? OR email = ?) AND id != ?");
        $check_stmt->bind_param("ssi", $new_username, $new_email, $user_id);
        $check_stmt->execute();
        $check_result = $check_stmt->get_result();
        
        if ($check_result->num_rows > 0) {
            $errors[] = "El nombre de usuario o email ya están en uso";
        }
        
        // Procesar imagen de perfil
        $profile_image = $user['profile_image'];
        
        if (isset($_FILES['profile_image']) && $_FILES['profile_image']['error'] === UPLOAD_ERR_OK) {
            $allowed_types = ['image/jpeg', 'image/png', 'image/gif'];
            $file_type = $_FILES['profile_image']['type'];
            
            if (in_array($file_type, $allowed_types)) {
                $upload_dir = 'uploads/profiles/';
                if (!file_exists($upload_dir)) {
                    mkdir($upload_dir, 0755, true);
                }
                
                // Eliminar imagen anterior si no es la predeterminada
                if ($profile_image !== 'default_profile.png' && file_exists($upload_dir . $profile_image)) {
                    unlink($upload_dir . $profile_image);
                }
                
                // Generar nombre único para la imagen
                $file_ext = pathinfo($_FILES['profile_image']['name'], PATHINFO_EXTENSION);
                $new_filename = 'profile_' . $user_id . '_' . time() . '.' . $file_ext;
                $destination = $upload_dir . $new_filename;
                
                if (move_uploaded_file($_FILES['profile_image']['tmp_name'], $destination)) {
                    $profile_image = $new_filename;
                } else {
                    $errors[] = "Error al subir la imagen de perfil";
                }
            } else {
                $errors[] = "Solo se permiten imágenes JPEG, PNG o GIF";
            }
        }
        
        // Actualizar en la base de datos si no hay errores
        if (empty($errors)) {
            $update_stmt = $conn->prepare("UPDATE users SET username = ?, email = ?, profile_image = ?, updated_at = NOW() WHERE id = ?");
            $update_stmt->bind_param("sssi", $new_username, $new_email, $profile_image, $user_id);
            
            if ($update_stmt->execute()) {
                $_SESSION['username'] = $new_username;
                $update_message = "Perfil actualizado correctamente";
                // Actualizar los datos mostrados
                $user['username'] = $new_username;
                $user['email'] = $new_email;
                $user['profile_image'] = $profile_image;
            } else {
                $errors[] = "Error al actualizar el perfil: " . $conn->error;
            }
        }
    } elseif (isset($_POST['delete_account'])) {
        // Eliminar cuenta del usuario
        // Primero eliminamos la imagen de perfil si no es la predeterminada
        if ($user['profile_image'] !== 'default_profile.png') {
            $image_path = 'uploads/profiles/' . $user['profile_image'];
            if (file_exists($image_path)) {
                unlink($image_path);
            }
        }
        
        // Luego eliminamos el usuario de la base de datos
        $delete_stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
        $delete_stmt->bind_param("i", $user_id);
        
        if ($delete_stmt->execute()) {
            // Cerrar sesión y redirigir
            session_destroy();
            header("Location: index.php?account_deleted=1");
            exit();
        } else {
            $errors[] = "Error al eliminar la cuenta: " . $conn->error;
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Perfil de <?php echo htmlspecialchars($user['username']); ?> - Aetheris</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
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
        /* Estilos específicos para la página de perfil */
        .profile-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 0;
        }
        
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #4a8eff;
            margin-bottom: 15px;
        }
        
        .profile-username {
            font-size: 24px;
            margin: 0;
            color: white;
        }
        
        .profile-role {
            display: inline-block;
            background-color: <?php echo $user['role'] === 'admin' ? '#4a8eff' : '#6c757d'; ?>;
            color: white;
            padding: 3px 10px;
            border-radius: 15px;
            font-size: 12px;
            margin-top: 5px;
        }
        
        .profile-details {
            background-color: #1a1a2a;
            border-radius: 8px;
            padding: 25px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }
        
        .profile-form-group {
            margin-bottom: 20px;
        }
        
        .profile-form-group label {
            display: block;
            margin-bottom: 8px;
            color: #aaa;
            font-size: 14px;
        }
        
        .profile-form-control {
            width: 100%;
            padding: 10px;
            background-color: #252538;
            border: 1px solid #333;
            border-radius: 4px;
            color: white;
            font-family: 'Open Sans', sans-serif;
        }
        
        .profile-form-control:focus {
            outline: none;
            border-color: #4a8eff;
        }
        
        .profile-image-upload {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .profile-image-preview {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .profile-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background-color: #4a8eff;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #3a7eff;
        }
        
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c82333;
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #5a6268;
        }
        
        .account-info {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #333;
        }
        
        .account-info p {
            margin: 5px 0;
            color: #aaa;
            font-size: 14px;
        }
        
        .alert {
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        
        .alert-success {
            background-color: #28a745;
            color: white;
        }
        
        .alert-danger {
            background-color: #dc3545;
            color: white;
        }
        
        .delete-confirm {
            display: none;
            margin-top: 10px;
        }
        
        .delete-confirm.show {
            display: block;
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
                    
                    <a href="perfil.php">👤 <?php echo htmlspecialchars($username); ?></a>
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
            // Redirige a una página de búsqueda global o filtra
            window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
        }
    }
    </script>

    <div class="Container">
        <div class="profile-container">
            <!-- Mensajes de éxito/error -->
            <?php if (!empty($update_message)): ?>
                <div class="alert alert-success">
                    <?php echo $update_message; ?>
                </div>
            <?php endif; ?>
            
            <?php if (!empty($errors)): ?>
                <div class="alert alert-danger">
                    <ul>
                        <?php foreach ($errors as $error): ?>
                            <li><?php echo $error; ?></li>
                        <?php endforeach; ?>
                    </ul>
                </div>
            <?php endif; ?>
            
            <!-- Información del perfil -->
            <div class="profile-header">
                <img src="uploads/profiles/<?php echo htmlspecialchars($user['profile_image']); ?>" alt="Imagen de perfil" class="profile-image">
                <h1 class="profile-username"><?php echo htmlspecialchars($user['username']); ?></h1>
                <span class="profile-role"><?php echo $user['role'] === 'admin' ? 'Administrador' : 'Usuario'; ?></span>
            </div>
            
            <!-- Formulario de edición -->
            <form method="POST" enctype="multipart/form-data" class="profile-details">
                <div class="profile-form-group">
                    <label for="username">Nombre de usuario</label>
                    <input type="text" id="username" name="username" class="profile-form-control" value="<?php echo htmlspecialchars($user['username']); ?>" required>
                </div>
                
                <div class="profile-form-group">
                    <label for="email">Correo electrónico</label>
                    <input type="email" id="email" name="email" class="profile-form-control" value="<?php echo htmlspecialchars($user['email']); ?>" required>
                </div>
                
                <div class="profile-form-group">
                    <label for="profile_image">Imagen de perfil</label>
                    <div class="profile-image-upload">
                        <img src="uploads/profiles/<?php echo htmlspecialchars($user['profile_image']); ?>" alt="Previsualización" class="profile-image-preview" id="image-preview">
                        <input type="file" id="profile_image" name="profile_image" accept="image/jpeg, image/png, image/gif" onchange="previewImage(this)">
                    </div>
                    <small>Deja en blanco para mantener la imagen actual</small>
                </div>
                
                <div class="profile-actions">
                    <button type="submit" name="update_profile" class="btn btn-primary">Guardar cambios</button>
                    <button type="button" id="delete-btn" class="btn btn-secondary">Eliminar cuenta</button>
                </div>
                
                <div id="delete-confirm" class="delete-confirm">
                    <p>¿Estás seguro de que quieres eliminar tu cuenta? Esta acción no se puede deshacer.</p>
                    <button type="submit" name="delete_account" class="btn btn-danger">Confirmar eliminación</button>
                    <button type="button" id="cancel-delete" class="btn btn-secondary">Cancelar</button>
                </div>
                
                <div class="account-info">
                    <p>Miembro desde: <?php echo date('d/m/Y', strtotime($user['created_at'])); ?></p>
                    <p>Rol: <?php echo $user['role'] === 'admin' ? 'Administrador' : 'Usuario estándar'; ?></p>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <p>Aetheris &copy; <?php echo date('Y'); ?> - Diseño y desarrollo del sitio. Todos los derechos reservados sobre la estructura y funcionalidad de esta web.</p>
    </footer>

    <script>
    // Función para previsualizar la imagen seleccionada
    function previewImage(input) {
        const preview = document.getElementById('image-preview');
        const file = input.files[0];
        
        if (file) {
            const reader = new FileReader();
            
            reader.onload = function(e) {
                preview.src = e.target.result;
            }
            
            reader.readAsDataURL(file);
        }
    }
    
    // Función para mostrar/ocultar la confirmación de eliminación
    document.getElementById('delete-btn').addEventListener('click', function() {
        document.getElementById('delete-confirm').classList.add('show');
    });
    
    document.getElementById('cancel-delete').addEventListener('click', function() {
        document.getElementById('delete-confirm').classList.remove('show');
    });
    
    // Función para buscar contenido global (la misma que en otras páginas)
    function buscarContenido() {
        const query = document.getElementById('global-search').value.trim();
        if(query.length > 2) {
            window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
        }
    }
    </script>
</body>
</html>