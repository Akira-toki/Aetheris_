<?php
include 'db_config.php';

// Procesar el formulario
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id_manga = $_POST['id_manga'];
    $nombre_capitulo = $_POST['nombre_capitulo'];
    $enlace_pdf = $_POST['enlace_pdf'];
    $capitulo_inicio = $_POST['capitulo_inicio'];
    $capitulo_fin = $_POST['capitulo_fin'] ?? null;
    
    // Validar datos
    if (empty($id_manga) || empty($nombre_capitulo) || empty($enlace_pdf) || empty($capitulo_inicio)) {
        $error = "Los campos obligatorios son: Manga, Nombre del capítulo, Enlace PDF y Capítulo inicio";
    } else {
        // Validar que el enlace sea de Google Drive
        if (strpos($enlace_pdf, 'drive.google.com') === false) {
            $error = "El enlace debe ser de Google Drive";
        } else {
            // Insertar en la base de datos
            $stmt = $conn->prepare("INSERT INTO manga_capitulos (id_manga, nombre_capitulo, enlace_pdf, capitulo_inicio, capitulo_fin) VALUES (?, ?, ?, ?, ?)");
            $stmt->bind_param("issii", $id_manga, $nombre_capitulo, $enlace_pdf, $capitulo_inicio, $capitulo_fin);
            
            if ($stmt->execute()) {
                $success = "Capítulo subido correctamente";
            } else {
                $error = "Error al subir el capítulo: " . $conn->error;
            }
        }
    }
}

// Obtener lista de mangas para el select
$mangas = $conn->query("SELECT id, nombre FROM mangas ORDER BY nombre");
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Capítulo - Aetheris</title>
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
        
    /* Versión modo oscuro */
    select option {
        color: var(--text-color); /* Color claro para el texto */
        background-color: var(--card-bg); /* Fondo oscuro */
    }
    
    select option:checked {
        color: white;
        background-color: var(--primary-color);
    }
    
    /* Mejorar la legibilidad al hacer hover */
    select option:hover {
        background-color: #2a3a5a;
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
    </style>
</head>
<body>
    <div class="container">
        <h1>Subir Nuevo Capítulo</h1>
        
        <?php if (isset($success)): ?>
            <div class="alert alert-success"><?php echo $success; ?></div>
        <?php endif; ?>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        
        <form method="POST">
            <div class="form-group">
                <label for="id_manga">Manga</label>
                <select id="id_manga" name="id_manga" required>
                    <option value="">Seleccionar manga...</option>
                    <?php while ($manga = $mangas->fetch_assoc()): ?>
                        <option value="<?php echo $manga['id']; ?>"><?php echo $manga['nombre']; ?></option>
                    <?php endwhile; ?>
                </select>
            </div>
            
            <div class="form-group">
                <label for="nombre_capitulo">Nombre del Capítulo</label>
                <input type="text" id="nombre_capitulo" name="nombre_capitulo" required>
            </div>
            
            <div class="form-group">
                <label for="enlace_pdf">Enlace de Google Drive al PDF</label>
                <input type="url" id="enlace_pdf" name="enlace_pdf" required>

            </div>
            
            <div class="form-group">
                <label for="capitulo_inicio">Número de Capítulo (inicio)</label>
                <input type="number" id="capitulo_inicio" name="capitulo_inicio" min="1" required>
            </div>
            
            <div class="form-group">
                <label for="capitulo_fin">Número de Capítulo (fin, opcional - para rangos)</label>
                <input type="number" id="capitulo_fin" name="capitulo_fin" min="1">
            </div>
            
            <button type="submit" class="btn">Subir Capítulo</button>
        </form>
    </div>
</body>
</html>