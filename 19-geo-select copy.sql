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


SELECT
ST_Distance_Sphere(
  (
    SELECT `location`
    FROM `locations`
    WHERE `station_id` = (
      SELECT `id`
      FROM `stations`
      WHERE `name` = "Pino Suarez"
    )
  ),
  (
    SELECT `location`
    FROM `locations`
    WHERE `station_id` = (
      SELECT `id`
      FROM `stations`
      WHERE `name` = "Balderas"
    )
  )
) AS distance_by_name;

SELECT ST_Distance_Sphere(
    (SELECT `locations`.`location` 
    FROM `locations`
    WHERE `locations`.`stations_id` = (
        SELECT `id` 
        FROM `stations`
        WHERE `name` = "Santa Anita" 
    )),
    (SELECT `locations`.`location` 
    FROM `locations`
    WHERE `locations`.`stations_id` = (
        SELECT `id` 
        FROM `stations`
        WHERE `name` = "Tacuba" 
    ))
) / 1000 AS distance;


-- modificación para que solo imprima 2 decimales en los kilómetros, y adcional, para que agregue las siglas “km” al resultado
SELECT
CONCAT(ROUND(ST_Distance_Sphere(
    POINT(-75.626410, 6.152560),
    POINT(-75.605900, 6.163350)
) / 1000, 2), " km") AS distance;

SELECT ROUND(ST_Distance_Sphere (
    (
        SELECT `locations`.`location` 
        FROM `locations` 
        INNER JOIN `stations` 
        ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Talismán"
    ),
		(
        SELECT `locations`.`location` 
        FROM `locations` 
        INNER JOIN `stations` 
        ON `locations`.`station_id` = `stations`.`id`
        WHERE `stations`.`name` = "Hospital General"
    )
) / 1000, 2) AS Distance;	


