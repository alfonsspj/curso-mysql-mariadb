USE metro_cdmx;

INSERT INTO `lines_stations` (line_id, station_id) VALUES
(
    (
        SELECT `lines`.`id`
        FROM `lines`
        WHERE `lines`.`name` = "Línea 9"
    ),
    (
        SELECT `stations`.`id`
        FROM `stations`
        WHERE `stations`.`name` = "Lázaro Cárdenas"
    )
);


--- alternativa usando Nested Queries.
--Sin importar el ID de los registros, puedes usar el nombre de la linea y el nombre de la estacion como datos claves para formar las relaciones:
INSERT INTO `lines_stations` (line_id, station_id) VALUES 
(
    (SELECT id FROM `lines` WHERE name = "Linea 1"),
    (SELECT id FROM `stations` WHERE name = "Pantitlan")
),
(
    (SELECT id FROM `lines` WHERE name = "Linea 5"),
    (SELECT id FROM `stations` WHERE name = "Pantitlan")
),
(
    (SELECT id FROM `lines` WHERE name = "Linea 9"),
    (SELECT id FROM `stations` WHERE name = "Pantitlan")
),
(
    (SELECT id FROM `lines` WHERE name = "Linea A"),
    (SELECT id FROM `stations` WHERE name = "Pantitlan")
);