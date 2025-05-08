<?php
include 'db_config.php';

// Si el formulario se ha enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $id_novela = $_POST['id_novela'];
    $numero_volumen = $_POST['numero_volumen'];
    
    // Procesar el archivo PDF
    $pdfFileName = basename($_FILES["pdfToUpload"]["name"]);
    $pdfFilePath = "uploads/volumenes/" . $pdfFileName;

    // Procesar la imagen
    $imagenFileName = basename($_FILES["imagen_volumen"]["name"]);
    $imagenFilePath = "uploads/imagenes/" . $imagenFileName;

    // Subir el archivo PDF
    if (move_uploaded_file($_FILES["pdfToUpload"]["tmp_name"], $pdfFilePath)) {
        // Subir la imagen
        if (move_uploaded_file($_FILES["imagen_volumen"]["tmp_name"], $imagenFilePath)) {
            // Insertar el volumen en la base de datos
            $sql = "INSERT INTO volumenes (id_novela, numero_volumen, ruta_volumen, imagen_volumen) 
                    VALUES ('$id_novela', '$numero_volumen', '$pdfFilePath', '$imagenFilePath')";

            if ($conn->query($sql) === TRUE) {
                echo '<div class="message" style="color: green;">Volumen subido exitosamente.</div>';
            } else {
                echo '<div class="message" style="color: red;">Error al subir el volumen: ' . $conn->error . '</div>';
            }
        } else {
            echo '<div class="message" style="color: red;">Error al subir la imagen.</div>';
        }
    } else {
        echo '<div class="message" style="color: red;">Error al subir el archivo PDF.</div>';
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir Volumen</title>
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <style>
        /* Estilos generales */
        body {
    background-image: url('uploads/images/fondo.jpg'); /* Ruta de la imagen */
    background-size: cover; /* Esto hace que la imagen cubra toda la pantalla */
    background-position: center center; /* Esto centra la imagen */
    background-attachment: fixed; /* Esto mantiene la imagen fija cuando haces scroll */
    background-repeat: no-repeat; /* Evita que la imagen se repita */
}
        header {
    display: flex;
    justify-content: space-between;
    padding: 10px 20px;
    background-color: #000000;
    color: white;
    font-family: Arial, sans-serif;
}

.header-left .logo {
    font-size: 24px;
    color: white;
    text-decoration: none;
}

.header-right {
    display: flex;
    align-items: center;
}

.menu {
    position: relative;
    margin-right: 20px;
}

.menu-button {
    background: none;
    border: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.menu-content {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: #000000;
    min-width: 150px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1;
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
    background-color: #000000;
}

/* Submenú de Géneros */
.submenu {
    position: relative;
}

.submenu-button {
    background: none;
    border: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
}

.submenu-content {
    display: none;
    position: absolute;
    left: 100%;
    top: 0;
    background-color: #000000;
    min-width: 150px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    z-index: 1;
}

.submenu:hover .submenu-content {
    display: block;
}

.submenu-content a {
    color: white;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.submenu-content a:hover {
    background-color: #000000;
}

/* Barra de búsqueda */
.search-bar {
    display: flex;
    align-items: center;
}

.search-bar input[type="text"] {
    padding: 5px;
    font-size: 16px;
    border: none;
    border-radius: 4px;
}

.search-bar button {
    background: none;
    border: none;
    color: white;
    font-size: 18px;
    cursor: pointer;
    margin-left: 5px;
}


        /* Estilo del formulario */
        form {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input[type="number"], input[type="file"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f1f1f1;
        }

        input[type="file"] {
            padding: 8px;
        }

        input[type="submit"] {
            background-color: #4b0082; /* Morado oscuro */
            color: white;
            cursor: pointer;
            border: none;
        }

        input[type="submit"]:hover {
            background-color: #800080; /* Morado más claro */
        }

        .message {
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<!-- Encabezado -->
<header>
    <div class="header-left">
        <a href="inicio.php" class="logo">Aetheris</a>
    </div>
    <div class="header-right">
        <div class="menu">
            <button class="menu-button">Menú</button>
            <div class="menu-content">
                <a href="inicio.php">Inicio</a>
                <a href="index.php">Directorio</a>
                <a href="subir_pdf.php">Subir Novela</a>
                <div class="submenu">
                    <button class="submenu-button">Géneros</button>
                    <div class="submenu-content">
                        <a href="romance.php">Romance</a>
                        <a href="ciencia_ficcion.php">Ciencia Ficción</a>
                        <a href="comedia.php">Comedia</a>
                        <a href="isekai.php">Isekai</a>
                        <a href="fantasia.php">Fantasía</a>
                        <a href="misterio.php">Misterio</a>
                    </div>
                </div>
                <a href="login.php" class="login-icon">Iniciar Sesión</a>
            </div>
        </div>
    </div>
</header>

<h1>Subir Volumen</h1>

<form action="subir.php" method="post" enctype="multipart/form-data">
    <label for="id_novela">ID de la novela:</label>
    <input type="number" name="id_novela" id="id_novela" required>

    <label for="numero_volumen">Número de Volumen:</label>
    <input type="number" name="numero_volumen" id="numero_volumen" required>

    <label for="pdfToUpload">Seleccionar PDF del volumen:</label>
    <input type="file" name="pdfToUpload" id="pdfToUpload" required>

    <label for="imagen_volumen">Seleccionar Imagen del Volumen:</label>
    <input type="file" name="imagen_volumen" id="imagen_volumen" accept="image/*">

    <input type="submit" value="Subir Volumen">
</form>

</body>
</html>