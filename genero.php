<?php
// Este archivo maneja los enlaces directos a géneros
$genero_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$tipo = isset($_GET['tipo']) ? $_GET['tipo'] : '';

// Validar el tipo
if(!in_array($tipo, ['novela', 'anime', 'manga']) || $genero_id <= 0) {
    header("Location: todos_generos.php");
    exit;
}

// Redirigir a la página correspondiente con el filtro de género
switch($tipo) {
    case 'novela':
        header("Location: inicio.php?genero_id=" . $genero_id);
        break;
    case 'anime':
        header("Location: inicio_anime.php?genero_id=" . $genero_id);
        break;
    case 'manga':
        header("Location: inicio_manga.php?genero_id=" . $genero_id);
        break;
    default:
        header("Location: todos_generos.php");
}
exit;
?>