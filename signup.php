<?php
session_start(); 
include 'db_config.php';

$error = '';
$success = '';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    
    // Validaciones
    if (empty($username) || empty($email) || empty($password)) {
        $error = 'Todos los campos son obligatorios';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = 'El formato del email no es válido';
    } elseif (strlen($password) < 8) {
        $error = 'La contraseña debe tener al menos 8 caracteres';
    } else {
        // Verificar si el usuario o email ya existen
        $stmt = $conn->prepare("SELECT id FROM users WHERE username = ? OR email = ?");
        $stmt->bind_param("ss", $username, $email);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $error = 'El nombre de usuario o email ya están registrados';
        } else {
            // Hash de la contraseña
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);
            
            // Insertar nuevo usuario
            $stmt = $conn->prepare("INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, 'user')");
            $stmt->bind_param("sss", $username, $email, $hashed_password);
            
            if ($stmt->execute()) {
                $_SESSION['username'] = $username;
                $_SESSION['role'] = 'user';
                $success = 'Registro exitoso! Redirigiendo...';
                header("refresh:2;url=login.php");
            } else {
                $error = 'Error al registrar el usuario. Por favor intenta nuevamente.';
            }
        }
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Aetheris</title>
    <link rel="icon" href="uploads/aetheris.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        /* Header completo */
        header {
            width: 100%;
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
        
        /* Cuerpo de la página */
        body {
            font-family: 'Open Sans', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: #f0f0f0;
            position: relative;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Manga_in_Maruzen.jpg/1024px-Manga_in_Maruzen.jpg') no-repeat center center;
            background-size: cover;
            filter: blur(5px);
            z-index: -1;
        }
        
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            width: 100%;
            max-width: 900px;
            display: flex;
            justify-content: center;
        }
        
        .form-box {
            display: flex;
            width: 100%;
            height: 400px;
            background: #fff;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            border-radius: 10px;
        }
        
        .left, .right {
            width: 50%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        
        .left {
            background: #000;
            color: #fff;
            text-align: center;
        }
        
        .left h2 {
            margin-bottom: 15px;
            font-size: 28px;
        }
        
        .left p {
            color: #ccc;
            line-height: 1.6;
        }
        
        .right {
            background: #fff;
            color: #000;
        }
        
        .right h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        
        input {
            margin: 10px 0;
            padding: 12px 15px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            outline: none;
        }
        
        input:focus {
            border-color: #4a8eff;
        }
        
        button {
            padding: 12px;
            width: 100%;
            background: #000;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
            margin-top: 10px;
        }
        
        button:hover {
            background: #333;
        }
        
        .login-link {
            text-align: center;
            margin-top: 15px;
            color: #666;
        }
        
        .login-link a {
            color: #4a8eff;
            text-decoration: none;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .message {
            padding: 10px;
            border-radius: 4px;
            margin-bottom: 15px;
            text-align: center;
            font-size: 14px;
        }
        
        .error {
            background-color: #ffeeee;
            color: #f44336;
            border: 1px solid #f44336;
        }
        
        .success {
            background-color: #eeffee;
            color: #4caf50;
            border: 1px solid #4caf50;
        }
        
        @media (max-width: 768px) {
            .form-box {
                flex-direction: column;
                height: auto;
            }
            
            .left, .right {
                width: 100%;
            }
            
            .left {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Header completo -->
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
                    <a href="login.php">🔑 Iniciar Sesión</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Contenido principal -->
    <main>
        <div class="container">
            <div class="form-box">
                <div class="left">
                    <h2>BIENVENIDO</h2>
                    <p>Lugar donde puedes leer tus lecturas favoritas!</p>
                </div>
                <div class="right">
                    <h2>Registrarse</h2>
                    
                    <?php if ($error): ?>
                        <div class="message error"><?php echo $error; ?></div>
                    <?php endif; ?>
                    
                    <?php if ($success): ?>
                        <div class="message success"><?php echo $success; ?></div>
                    <?php endif; ?>
                    
                    <form action="signup.php" method="post">
                        <input type="text" name="username" placeholder="Nombre de usuario" required>
                        <input type="email" name="email" placeholder="Correo electrónico" required>
                        <input type="password" name="password" placeholder="Contraseña (mínimo 8 caracteres)" minlength="8" required>
                        <button type="submit">Registrarse</button>
                        <p class="login-link">¿Ya tienes cuenta? <a href="login.php">Inicia sesión</a></p>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <script>
    // Función de búsqueda si es necesaria
    function buscarContenido() {
        const query = document.getElementById('global-search')?.value.trim();
        if(query && query.length > 2) {
            window.location.href = `busqueda.php?q=${encodeURIComponent(query)}`;
        }
    }
    </script>
</body>
</html>