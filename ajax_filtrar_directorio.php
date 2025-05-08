<?php
include 'db_config.php';

// Parámetros de filtrado
$type = $_GET['type'] ?? '';
$status = $_GET['status'] ?? '';
$genre = $_GET['genre'] ?? '';
$search = $_GET['search'] ?? '';
$pagina = intval($_GET['pagina'] ?? 1);
$porPagina = 20;

// Construir consultas para cada tipo de contenido
$queries = [];
$params = [];
$types = '';

if ($type) {
    switch($type) {
        case 'anime':
            $query = "SELECT a.id, a.nombre as titulo, a.estado, a.imagen, 'anime' as tipo FROM animes a WHERE 1=1";
            if ($status) {
                $query .= " AND a.estado = ?";
                $params[] = $status;
                $types .= 's';
            }
            if ($genre) {
                $query .= " AND EXISTS (SELECT 1 FROM anime_generos ag WHERE ag.anime_id = a.id AND ag.genero_id = ?)";
                $params[] = $genre;
                $types .= 'i';
            }
            break;
        case 'manga':
            $query = "SELECT m.id, m.nombre as titulo, m.estado, m.imagen, 'manga' as tipo FROM mangas m WHERE 1=1";
            if ($status) {
                $query .= " AND m.estado = ?";
                $params[] = $status;
                $types .= 's';
            }
            if ($genre) {
                $query .= " AND EXISTS (SELECT 1 FROM manga_generos mg WHERE mg.manga_id = m.id AND mg.genero_id = ?)";
                $params[] = $genre;
                $types .= 'i';
            }
            break;
        case 'novela':
            $query = "SELECT n.id, n.nombre as titulo, n.estado, n.imagen, 'novela' as tipo FROM novelas n WHERE 1=1";
            if ($status) {
                $query .= " AND n.estado = ?";
                $params[] = $status;
                $types .= 's';
            }
            if ($genre) {
                $query .= " AND EXISTS (SELECT 1 FROM novela_generos ng WHERE ng.novela_id = n.id AND ng.genero_id = ?)";
                $params[] = $genre;
                $types .= 'i';
            }
            break;
    }
    
    if ($search) {
        $query .= " AND nombre LIKE ?";
        $params[] = "%$search%";
        $types .= 's';
    }
    $queries[] = $query;
} else {
    // Consulta para todos los tipos
    $animeQuery = "SELECT a.id, a.nombre as titulo, a.estado, a.imagen, 'anime' as tipo FROM animes a WHERE 1=1";
    $mangaQuery = "SELECT m.id, m.nombre as titulo, m.estado, m.imagen, 'manga' as tipo FROM mangas m WHERE 1=1";
    $novelaQuery = "SELECT n.id, n.nombre as titulo, n.estado, n.imagen, 'novela' as tipo FROM novelas n WHERE 1=1";
    
    if ($status) {
        $animeQuery .= " AND a.estado = ?";
        $mangaQuery .= " AND m.estado = ?";
        $novelaQuery .= " AND n.estado = ?";
        $params[] = $status;
        $params[] = $status;
        $params[] = $status;
        $types .= 'sss';
    }
    
    if ($genre) {
        $animeQuery .= " AND EXISTS (SELECT 1 FROM anime_generos ag WHERE ag.anime_id = a.id AND ag.genero_id = ?)";
        $mangaQuery .= " AND EXISTS (SELECT 1 FROM manga_generos mg WHERE mg.manga_id = m.id AND mg.genero_id = ?)";
        $novelaQuery .= " AND EXISTS (SELECT 1 FROM novela_generos ng WHERE ng.novela_id = n.id AND ng.genero_id = ?)";
        $params[] = $genre;
        $params[] = $genre;
        $params[] = $genre;
        $types .= 'iii';
    }
    
    if ($search) {
        $animeQuery .= " AND a.nombre LIKE ?";
        $mangaQuery .= " AND m.nombre LIKE ?";
        $novelaQuery .= " AND n.nombre LIKE ?";
        $params[] = "%$search%";
        $params[] = "%$search%";
        $params[] = "%$search%";
        $types .= 'sss';
    }
    
    $queries = [$animeQuery, $mangaQuery, $novelaQuery];
}

$unionQuery = implode(" UNION ALL ", $queries);

// Consulta para contar total
$countQuery = "SELECT COUNT(*) as total FROM ($unionQuery) as total_query";
$stmt = $conn->prepare($countQuery);

if (!empty($types)) {
    $stmt->bind_param($types, ...$params);
}

$stmt->execute();
$totalResult = $stmt->get_result()->fetch_assoc();
$total = $totalResult['total'];
$paginas = ceil($total / $porPagina);

// Consulta principal con límites
$mainQuery = "$unionQuery ORDER BY titulo LIMIT ?, ?";
$params[] = ($pagina - 1) * $porPagina;
$params[] = $porPagina;
$types .= 'ii';

$stmt = $conn->prepare($mainQuery);
if (!empty($types)) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

// Mostrar resultados
if ($result->num_rows > 0) {
    echo '<div class="List-Animes">';
    
    while ($row = $result->fetch_assoc()) {
        echo '<div class="Anime-Card">';
        
        // Redirección específica para cada tipo de contenido
        $detalle_url = '';
        switch($row['tipo']) {
            case 'anime':
                $detalle_url = 'anime_detalle.php?id='.$row['id'];
                break;
            case 'manga':
                $detalle_url = 'manga_detalle.php?id='.$row['id'];
                break;
            case 'novela':
                $detalle_url = 'novela_detalle.php?id='.$row['id'];
                break;
        }
        
        echo '<a href="'.$detalle_url.'">';
        echo '<div class="Anime-Image">';
        echo '<img src="'.$row['imagen'].'" alt="'.$row['titulo'].'">';
        echo '<span class="Type-Badge" data-type="'.$row['tipo'].'">'.ucfirst($row['tipo']).'</span>';
        if (!empty($row['estado'])) {
            echo '<span class="Status-Badge" data-status="'.$row['estado'].'">'.$row['estado'].'</span>';
        }
        echo '</div>';
        echo '<div class="Anime-Info">';
        echo '<h3 class="Anime-Title">'.$row['titulo'].'</h3>';
        echo '</div>';
        echo '</a>';
        echo '</div>';
    }
    
    echo '</div>';
    
    // Paginación
    if ($paginas > 1) {
        echo '<div class="pagination-container">';
        echo '<div class="pagination-info">Mostrando '.(($porPagina * ($pagina - 1)) + 1).' - '.min($porPagina * $pagina, $total).' de '.$total.' resultados</div>';
        
        echo '<div class="pagination">';
        if ($pagina > 1) {
            echo '<button class="pagination-button" onclick="loadDirectoryPage('.($pagina - 1).')">«</button>';
        }
        
        $inicio = max(1, $pagina - 2);
        $fin = min($paginas, $pagina + 2);
        
        if ($inicio > 1) {
            echo '<button class="pagination-button" onclick="loadDirectoryPage(1)">1</button>';
            if ($inicio > 2) echo '<span class="pagination-dots">...</span>';
        }
        
        for ($i = $inicio; $i <= $fin; $i++) {
            $active = $i == $pagina ? ' active' : '';
            echo '<button class="pagination-button'.$active.'" onclick="loadDirectoryPage('.$i.')">'.$i.'</button>';
        }
        
        if ($fin < $paginas) {
            if ($fin < $paginas - 1) echo '<span class="pagination-dots">...</span>';
            echo '<button class="pagination-button" onclick="loadDirectoryPage('.$paginas.')">'.$paginas.'</button>';
        }
        
        if ($pagina < $paginas) {
            echo '<button class="pagination-button" onclick="loadDirectoryPage('.($pagina + 1).')">»</button>';
        }
        echo '</div></div>';
    }
} else {
    echo '<div class="no-results">No se encontraron resultados con los filtros seleccionados</div>';
}

$conn->close();
?>