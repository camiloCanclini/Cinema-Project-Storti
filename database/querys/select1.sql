INSERT INTO
    `Peliculas` (
        `imdbID`,
        `titulo`,
        `año`,
        `duracion`,
        `clasificacion`,
        `genero`,
        `director`,
        `actores`,
        `pais_origen`,
        `poster`
    )
VALUES
    (
        $imdbID,
        $titulo,
        $año,
        $duracion,
        $clasificacion,
        $genero,
        $director,
        $actores,
        $pais_origen,
        $poster
    );