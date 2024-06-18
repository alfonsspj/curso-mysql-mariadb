USE metro_cdmx;


-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) AS distance;


-- Calculamos en kilometros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;


-- Calculamos ene kilometros con consultas anidadas
SELECT 
  ST_Distance_Sphere(  -- Unir dos tablas y poder filtrarlas por el nombre y nos retorne su punto
    ( 
      SELECT `locations`.`location` 
      FROM `locations` -- No tengo la tabla de la estación se debe hacer inner join
      INNER JOIN `stations`
      ON `stations`.`id` = `locations`.`station_id`
      WHERE `stations`.`name` = "Balderas"   
    ),
    (
      SELECT `locations`.`location` 
      FROM `locations`
      INNER JOIN `stations`
      ON `stations`.`id` = `locations`.`station_id`
      WHERE `stations`.`name` = "Pino Suarez"  
    )
) / 1000 AS distance;


SELECT 
  ST_Distance_Sphere(  -- Unir dos tablas y poder filtrarlas por el nombre y nos retorne su punto
    ( 
      SELECT `locations`.`location` 
      FROM `locations` -- No tengo la tabla de la estación se debe hacer inner join
      INNER JOIN `stations`
      ON `stations`.`id` = `locations`.`station_id`
      WHERE `stations`.`name` = "Lázaro Cárdenas"
    ),
    (
      SELECT `locations`.`location` 
      FROM `locations`
      INNER JOIN `stations`
      ON `stations`.`id` = `locations`.`station_id`
      WHERE `stations`.`name` = "Chilpancingo"
    )
) / 1000 AS distance;


--otra forma usando sòlo select
SELECT `locations`.`location` FROM `locations`
WHERE `locations`.`station_id`=(
    SELECT id FROM `stations` WHERE `name`="colegio militar"
);
SELECT ROUND(ST_Distance_Sphere (
    (
        SELECT `locations`.`location` 
        FROM `locations` 
        WHERE `locations`.`station_id` = (
            SELECT `stations`.`id`
            FROM `stations`
            WHERE `stations`.`name` = "Talismán"
        )
    ),
	(
        SELECT `locations`.`location` 
        FROM `locations` 
        WHERE `locations`.`station_id` = (
            SELECT `stations`.`id`
            FROM `stations`
            WHERE `stations`.`name` = "Hospital General"
        )
    )
) / 1000, 2) AS Distance;



-- con funciòn
USE metro_project;
DELIMITER //
CREATE FUNCTION getDistanceInKm (station1 VARCHAR(60), station2 VARCHAR(60)) RETURNS INT
BEGIN
RETURN(
	SELECT
	ST_Distance_Sphere(
    (SELECT location FROM locations WHERE station_id = (SELECT id FROM stations WHERE name = station1)),
    (SELECT location FROM locations WHERE station_id = (SELECT id FROM stations WHERE name = station2))
    )/ 1000 AS distance_in_kms
    ) ;
END //
DELIMITER ;



--  aporte para calcular la distancia entre una estación que se repite en dos líneas y otra estación de otra línea. El ejemplo corresponde a la estación Juárez de la Línea 1 y la estación Cucei de la Línea 3 del tren ligero de la ciudad de Guadalajara. Para resolverlo usé la pivot table lines_stations que ya habíamos creado con anterioridad.
SELECT
    ST_Distance_Sphere(
        (
            SELECT `location`
            FROM `locations`
            INNER JOIN `stations` ON `stations`.`id` = `locations`.`station_id`
            INNER JOIN `lines_stations` ON `stations`.`id` = `lines_stations`.`station_id`
            INNER JOIN `lines` ON `lines_stations`.`line_id` = `lines`.`id`
            WHERE `stations`.`name` = "Juarez" AND `lines`.`id` = 1
        ),
        (
            SELECT `location`
            FROM `locations`
            INNER JOIN `stations` ON `stations`.`id` = `locations`.`station_id`
            WHERE `stations`.`name` = "Cucei"
        )
    ) / 1000 AS distance;





---Como dato les comparto, no pongan el SELECT al inicio de la función ST_Distance_Sphere, ni los POINT  al inicio de las consultas anidada por que les dará un error de sintaxis jejeje. También como pueden observar pueden envolver toda su sentencia de operación con la función ROUND, esto para declarar cuantos decimales quieren en el resultado y que el redondeo sea automático.

SELECT ROUND(
        ST_Distance_Sphere(
            (
                SELECT `locations`.`location`
                FROM `locations`
                WHERE
                    `locations`.`station_id` = (
                        SELECT `station`.`id`
                        FROM `station`
                        WHERE
                            `station`.`name` = "Barranca del Muerto"
                    )
            ), (
                SELECT `locations`.`location`
                FROM `locations`
                WHERE
                    `locations`.`station_id` = (
                        SELECT `station`.`id`
                        FROM `station`
                        WHERE
                            `station`.`name` = "Viveros"
                    )
            )
        ) / 1000, 2
    ) AS distance;

