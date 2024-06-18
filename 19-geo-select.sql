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