<?php
include 'db_config.php';

// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $descripcion = $_POST['descripcion'];
    $generos_seleccionados = $_POST['generos'] ?? [];
    $estado = $_POST['estado'];

    // Procesar imágenes
    $imagen = '';
    
    if (isset($_FILES['imagen']) && $_FILES['imagen']['error'] === UPLOAD_ERR_OK) {
        $imagen = 'uploads/images/' . uniqid() . '_' . basename($_FILES['imagen']['name']);
        move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen);
    }
    
    // Validar datos
    if (empty($nombre) || empty($descripcion) || empty($generos_seleccionados)) {
        $error = "Los campos marcados con * son obligatorios";
    } else {
        // Iniciar transacción
        $conn->begin_transaction();
        
        try {
            // 1. Insertar la novela
            $stmt = $conn->prepare("INSERT INTO novelas (nombre, descripcion, imagen ) VALUES (?, ?, ?)");
            $stmt->bind_param("sss", $nombre, $descripcion, $imagen);
            $stmt->execute();
            $anime_id = $conn->insert_id;
            
            // 2. Insertar géneros seleccionados
            $stmt_generos = $conn->prepare("INSERT INTO novela_generos (novela_id, genero_id) VALUES (?, ?)");
            
            foreach ($generos_seleccionados as $genero_id) {
                $stmt_generos->bind_param("ii", $novela_id, $genero_id);
                $stmt_generos->execute();
            }
            
            // Confirmar transacción
            $conn->commit();
            $success = "¡novela subida correctamente!";
            $_POST = array(); // Limpiar el formulario
            
        } catch (Exception $e) {
            // Revertir en caso de error
            $conn->rollback();
            $error = "Error al subir la novela: " . $e->getMessage();
            
            // Eliminar imágenes subidas si hubo error
            if (!empty($imagen) && file_exists($imagen)) unlink($imagen);
        }
    }
}

// Obtener lista de géneros disponibles
$generos = $conn->query("SELECT * FROM generos ORDER BY nombre");
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir novela - Aetheris</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4adeff;
            --dark-bg: #1d2e37;
            --card-bg: #162023;
            --text-color: #e0e0e0;
            --text-muted: #a0a0a0;
        }
        
        
        body {
            font-family: 'Open Sans', sans-serif;
            background-color: var(--dark-bg);
            color: var(--text-color);
            padding: 20px;
            line-height: 1.6;
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
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
        }
        
        .required:after {
            content: " *";
            color: #f44336;
        }
        
        input[type="text"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            background-color: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.2);
            border-radius: 6px;
            color: var(--text-color);
            font-family: 'Open Sans', sans-serif;
            font-size: 15px;
        }
        
        textarea {
            min-height: 150px;
            resize: vertical;
        }
        
        .generos-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 10px;
        }
        
        .genero-option {
            position: relative;
        }
        
        .genero-option input {
            position: absolute;
            opacity: 0;
        }
        
        .genero-option label {
            display: block;
            padding: 10px 15px;
            background-color:rgba(74, 201, 255, 0.21);
            border: 1px solid rgba(74, 171, 255, 0.3);
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: normal;
            margin-bottom: 0;
        }
        
        .genero-option input:checked + label {
            background-color: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        .file-upload {
            margin-top: 10px;
        }
        
        .file-upload-label {
            display: inline-block;
            padding: 12px 20px;
            background-color: rgba(74, 142, 255, 0.1);
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s;
            border: 1px dashed rgba(74, 171, 255, 0.5);
            text-align: center;
            width: 100%;
        }
        
        .file-upload-label:hover {
            background-color: rgba(74, 142, 255, 0.2);
        }
        
        .file-name {
            margin-top: 8px;
            font-size: 14px;
            color: var(--text-muted);
        }
        
        .btn {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 14px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            transition: all 0.3s;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn:hover {
            background-color: #4adeff;
            transform: translateY(-2px);
        }
        
        .alert {
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 25px;
            border-left: 4px solid;
        }
        
        .alert-success {
            background-color: rgba(76, 175, 80, 0.15);
            color: #4CAF50;
            border-color: #4CAF50;
        }
        
        .alert-error {
            background-color: rgba(244, 67, 54, 0.15);
            color: #F44336;
            border-color: #F44336;
        }
        
        .preview-container {
            display: flex;
            gap: 20px;
            margin-top: 15px;
        }
        
        .preview-box {
            flex: 1;
            text-align: center;
        }
        
        .preview-img {
            max-width: 100%;
            max-height: 150px;
            border-radius: 6px;
            border: 1px dashed rgba(255,255,255,0.3);
            display: none;
        }
        
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
            
            .preview-container {
                flex-direction: column;
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
                    <a href="inicio.php">📖 Novelas</a>
                    <a href="inicio_anime.php">🎬 Anime</a>
                    <a href="inicio_manga.php">📘 Manga</a>
                    <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                    <a href="subir_contenido.php">⬆️ Subir Contenido</a>
                    <a href="directorio.php">📋 Directorio</a>
                    <div class="divider" style="border-top: 1px solid #333; margin: 8px 0;"></div>
                    <a href="logout.php">🚪 Cerrar Sesión</a>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <h1>Subir Nueva novela</h1>
        
        <?php if (isset($success)): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <form method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="nombre" class="required">Nombre de la novela</label>
                <input type="text" id="nombre" name="nombre" value="<?php echo htmlspecialchars($_POST['nombre'] ?? ''); ?>" required>
            </div>
            
            <div class="form-group">
                <label for="descripcion" class="required">Descripción</label>
                <textarea id="descripcion" name="descripcion" required><?php echo htmlspecialchars($_POST['descripcion'] ?? ''); ?></textarea>
            </div>
            
            <div class="form-group">
                <label class="required">Géneros</label>
                <div class="generos-container">
                    <?php while ($genero = $generos->fetch_assoc()): ?>
                        <div class="genero-option">
                            <input type="checkbox" id="genero_<?php echo $genero['id']; ?>" name="generos[]" value="<?php echo $genero['id']; ?>"
                                <?php echo (in_array($genero['id'], $_POST['generos'] ?? [])) ? 'checked' : ''; ?>>
                            <label for="genero_<?php echo $genero['id']; ?>"><?php echo htmlspecialchars($genero['nombre']); ?></label>
                        </div>
                    <?php endwhile; ?>
                </div>
            </div>
            <div class="form-group">
                <label for="estado">Estado</label>
                <select id="estado" name="estado">
                    <option value="En emisión" <?php echo ($_POST['estado'] ?? '') == 'En emisión' ? 'selected' : ''; ?>>En emisión</option>
                    <option value="Finalizado" <?php echo ($_POST['estado'] ?? '') == 'Finalizado' ? 'selected' : ''; ?>>Finalizado</option>
                    <option value="Próximamente" <?php echo ($_POST['estado'] ?? '') == 'Próximamente' ? 'selected' : ''; ?>>Próximamente</option>
                </select>
            </div>
            <div class="form-group">
                <label for="imagen">Imagen portada</label>
                <div class="file-upload">
                    <label for="imagen" class="file-upload-label">Seleccionar imagen (JPEG/PNG, max 2MB)</label>
                    <input type="file" id="imagen" name="imagen" accept="image/jpeg, image/png" style="display: none;">
                    <div class="file-name" id="imagen-name">No se ha seleccionado archivo</div>
                </div>
                <div class="preview-container">
                    <div class="preview-box">
                        <img id="imagen-preview" class="preview-img" alt="Vista previa imagen">
                    </div>
                </div>
            </div>
            
            <button type="submit" class="btn">Subir novela</button>
        </form>
    </div>

    <script>
        // Mostrar nombre de archivo y vista previa
        document.getElementById('imagen').addEventListener('change', function(e) {
            const fileName = e.target.files[0] ? e.target.files[0].name : 'No se ha seleccionado archivo';
            document.getElementById('imagen-name').textContent = fileName;
            
            if (e.target.files[0]) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    const previewImg = document.getElementById('imagen-preview');
                    previewImg.src = event.target.result;
                    previewImg.style.display = 'block';
                };
                reader.readAsDataURL(e.target.files[0]);
            } else {
                document.getElementById('imagen-preview').style.display = 'none';
            }
        });
        
    </script>
</body>
</html>