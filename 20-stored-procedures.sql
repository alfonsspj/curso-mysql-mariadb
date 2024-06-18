USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE calculate_distance_between_lines(
    IN station_one POINT,
    IN station_two POINT,
    IN meters BOOLEAN
)
BEGIN

    IF meters THEN

        SELECT
        ST_Distance_Sphere(station_one, station_two) AS distances;
    ELSE
        SELECT
        ST_Distance_Sphere(station_one, station_two) / 1000 AS distances;

    END IF;

END //

DELIMITER ;


-- eliminar un procedimiento almacenado
-- DROP PROCEDURE calculate_distance_between_lines;


-- llamar al procedimiento
-- CALL calculate_distance_between_lines(POINT(-99.14433718, 19.40702104), POINT(-99.173702, 19.49039233));

-- devolver en kilometros
-- CALL calculate_distance_between_lines(POINT(-99.14433718, 19.40702104), POINT(-99.173702, 19.49039233), false);


-- otra forma de aplicar el if
SELECT
	ST_Distance_Sphere(station_one, station_two) / IF(meters, 1, 1000) AS distance;