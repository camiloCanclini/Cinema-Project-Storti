SELECT
    *
FROM
    Programacion
    LEFT OUTER JOIN Peliculas ON Programacion.fk_id_pelicula = Peliculas.imdbID
    LEFT OUTER JOIN Salas ON Programacion.fk_numero_sala = Salas.id
    LEFT OUTER JOIN Cines ON Salas.numero_cine = Cines.numero;