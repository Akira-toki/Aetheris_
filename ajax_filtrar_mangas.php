<?php
session_start();
include 'db_config.php';

// Parámetros de filtrado
$status = $_GET['status'] ?? '';
$genre = $_GET['genre'] ?? '';
$search = $_GET['search'] ?? '';
$pagina = $_GET['pagina'] ?? 1;

// Validar página
$pagina = max(1, intval($pagina));
$porPagina = 12; // Mangas por página
$offset = ($pagina - 1) * $porPagina;

// Construir consulta SQL
$sql = "SELECT SQL_CALC_FOUND_ROWS m.*, GROUP_CONCAT(g.nombre SEPARATOR ', ') AS generos
        FROM mangas m
        LEFT JOIN manga_generos mg ON m.id = mg.manga_id
        LEFT JOIN generos g ON mg.genero_id = g.id
        WHERE 1=1";

// Aplicar filtros
if ($status) {
    $sql .= " AND m.estado = '" . $conn->real_escape_string($status) . "'";
}
if ($genre) {
    $sql .= " AND mg.genero_id = " . intval($genre);
}
if ($search) {
    $sql .= " AND m.nombre LIKE '%" . $conn->real_escape_string($search) . "%'";
}

// Completar consulta
$sql .= " GROUP BY m.id ORDER BY m.id DESC LIMIT $offset, $porPagina";

$result = $conn->query($sql);
$totalMangas = $conn->query("SELECT FOUND_ROWS()")->fetch_row()[0];
$totalPaginas = ceil($totalMangas / $porPagina);

// Mostrar resultados
if ($result->num_rows > 0) {
    echo '<div class="List-Animes">';
    while($manga = $result->fetch_assoc()) {
        $status_class = strtolower(str_replace(' ', '-', $manga['estado']));
        echo '<div class="Anime-Card">
                <a href="manga_detalle.php?id='.$manga['id'].'">
                    <div class="Anime-Image">
                        <img src="'.$manga['imagen'].'" alt="'.$manga['nombre'].'">
                        <span class="Status-Badge" data-status="'.$manga['estado'].'">'.$manga['estado'].'</span>
                    </div>
                    <div class="Anime-Info">
                        <div class="Anime-Title">'.$manga['nombre'].'</div>
                        <div class="Anime-Genres">'.$manga['generos'].'</div>
                    </div>
                </a>
            </div>';
    }
    echo '</div>';
    
    // Mostrar paginación
    if ($totalPaginas > 1) {
        echo '<div class="pagination-container">
                <div class="pagination-info">
                    Mostrando página '.$pagina.' de '.$totalPaginas.' ('.$totalMangas.' mangas)
                </div>
                <div class="pagination">';
        
        // Botón "Anterior"
        if ($pagina > 1) {
            echo '<button class="pagination-button" onclick="loadPage('.($pagina-1).')">&laquo;</button>';
        }
        
        // Mostrar números de página
        $maxPaginasVisibles = 5;
        $inicio = max(1, $pagina - floor($maxPaginasVisibles/2));
        $fin = min($totalPaginas, $inicio + $maxPaginasVisibles - 1);
        
        if ($inicio > 1) {
            echo '<button class="pagination-button" onclick="loadPage(1)">1</button>';
            if ($inicio > 2) echo '<span class="pagination-dots">...</span>';
        }
        
        for ($i = $inicio; $i <= $fin; $i++) {
            $clase = $i == $pagina ? 'active' : '';
            echo '<button class="pagination-button '.$clase.'" onclick="loadPage('.$i.')">'.$i.'</button>';
        }
        
        if ($fin < $totalPaginas) {
            if ($fin < $totalPaginas - 1) echo '<span class="pagination-dots">...</span>';
            echo '<button class="pagination-button" onclick="loadPage('.$totalPaginas.')">'.$totalPaginas.'</button>';
        }
        
        // Botón "Siguiente"
        if ($pagina < $totalPaginas) {
            echo '<button class="pagination-button" onclick="loadPage('.($pagina+1).')">&raquo;</button>';
        }
        
        echo '</div></div>';
    }
} else {
    echo '<div class="no-results">No se encontraron mangas con los filtros seleccionados.</div>';
}

$conn->close();
?>