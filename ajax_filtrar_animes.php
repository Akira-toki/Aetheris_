<?php
include 'db_config.php';

// Parámetros de filtrado con valores por defecto
$status = $_GET['status'] ?? '';
$genre = $_GET['genre'] ?? '';
$search = $_GET['search'] ?? '';
$pagina = max(1, (int)($_GET['pagina'] ?? 1));
$porPagina = 20;
$offset = ($pagina - 1) * $porPagina;

// Consulta base segura
$query = "SELECT a.*, GROUP_CONCAT(g.nombre SEPARATOR ', ') AS generos 
          FROM animes a
          LEFT JOIN anime_generos ag ON a.id = ag.anime_id
          LEFT JOIN generos g ON ag.genero_id = g.id
          WHERE 1=1";

$conditions = [];
$params = [];
$types = '';

if (!empty($status)) {
    $conditions[] = "a.estado = ?";
    $params[] = $status;
    $types .= 's';
}

if (!empty($genre)) {
    $conditions[] = "ag.genero_id = ?";
    $params[] = (int)$genre;
    $types .= 'i';
}

if (!empty($search)) {
    $conditions[] = "a.nombre LIKE ?";
    $params[] = "%$search%";
    $types .= 's';
}

if (!empty($conditions)) {
    $query .= " AND " . implode(" AND ", $conditions);
}

$query .= " GROUP BY a.id ORDER BY a.id DESC LIMIT ? OFFSET ?";
$params[] = $porPagina;
$params[] = $offset;
$types .= 'ii';

// Preparar y ejecutar
$stmt = $conn->prepare($query);
if ($types) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

// Consulta para contar el total de resultados (sin LIMIT)
$countQuery = "SELECT COUNT(DISTINCT a.id) as total 
               FROM animes a
               LEFT JOIN anime_generos ag ON a.id = ag.anime_id
               WHERE 1=1";

if (!empty($conditions)) {
    $countQuery .= " AND " . implode(" AND ", $conditions);
}

$countStmt = $conn->prepare($countQuery);
if (!empty($typesWithoutLimit = substr($types, 0, -2))) {
    $countStmt->bind_param($typesWithoutLimit, ...array_slice($params, 0, -2));
}
$countStmt->execute();
$totalResult = $countStmt->get_result()->fetch_assoc();
$totalAnimes = $totalResult['total'];
$totalPaginas = ceil($totalAnimes / $porPagina);

// Generar HTML de resultados
if ($result->num_rows > 0) {
    echo '<div class="List-Animes">';
    while($anime = $result->fetch_assoc()) {
        echo '
        <div class="Anime-Card">
            <a href="anime_detalle.php?id='.$anime['id'].'">
                <div class="Anime-Image">
                    <img src="'.htmlspecialchars($anime['imagen']).'" alt="'.htmlspecialchars($anime['nombre']).'" loading="lazy">
                    <span class="Status-Badge" data-status="'.htmlspecialchars($anime['estado']).'">'.htmlspecialchars($anime['estado']).'</span>
                </div>
                <div class="Anime-Info">
                    <h3 class="Anime-Title">'.htmlspecialchars($anime['nombre']).'</h3>
                    <div class="Anime-Genres">'.htmlspecialchars($anime['generos']).'</div>
                </div>
            </a>
        </div>';
    }
    echo '</div>';
    
    // Mostrar controles de paginación solo si hay más de una página
    if ($totalPaginas > 1) {
        echo '<div class="pagination-container">';
        echo '<div class="pagination-info">Página '.$pagina.' de '.$totalPaginas.'</div>';
        echo '<div class="pagination">';
        
        // Botón Anterior
        if ($pagina > 1) {
            echo '<button class="pagination-button" onclick="loadPage('.($pagina-1).')">&laquo; Anterior</button>';
        }
        
        // Rango de páginas
        $start = max(1, $pagina - 2);
        $end = min($totalPaginas, $pagina + 2);
        
        if ($start > 1) {
            echo '<button class="pagination-button" onclick="loadPage(1)">1</button>';
            if ($start > 2) echo '<span class="pagination-dots">...</span>';
        }
        
        for ($i = $start; $i <= $end; $i++) {
            $active = $i == $pagina ? ' active' : '';
            echo '<button class="pagination-button'.$active.'" onclick="loadPage('.$i.')">'.$i.'</button>';
        }
        
        if ($end < $totalPaginas) {
            if ($end < $totalPaginas - 1) echo '<span class="pagination-dots">...</span>';
            echo '<button class="pagination-button" onclick="loadPage('.$totalPaginas.')">'.$totalPaginas.'</button>';
        }
        
        // Botón Siguiente
        if ($pagina < $totalPaginas) {
            echo '<button class="pagination-button" onclick="loadPage('.($pagina+1).')">Siguiente &raquo;</button>';
        }
        
        echo '</div></div>';
    }
} else {
    echo '<div class="no-results">No se encontraron animes con estos filtros. <button onclick="loadPage(1)" class="reset-btn">Mostrar todos</button></div>';
}

$stmt->close();
$countStmt->close();
$conn->close();
?>