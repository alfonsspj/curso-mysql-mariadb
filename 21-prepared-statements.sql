USE metro_cdmx;


-- Asegurar de que la sesión use el conjunto de caracteres correcto
SET NAMES 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

-- Devuelve todas las estaciones que pertenecen a una linea dada
DELIMITER //
CREATE PROCEDURE get_line_stations(
    IN line_name VARCHAR(15)
)

BEGIN

    -- Esta es una forma de guardar valores de una consulta dentro de una variable
    DECLARE line_id BIGINT(20);

    -- Asignarle un valor
    SELECT id
    INTO line_id
    FROM `lines`
    WHERE name = line_name
    COLLATE utf8mb4_unicode_ci;


    -- esta es otra forma de guardar valores de una consulta dentro  de una variable  
    SET @sql = CONCAT("
        SELECT
            `lines_stations`.`id` AS relation_id,
            `lines`.`name` AS line_name,
            `stations`.`name` AS station_name
        FROM `lines_stations`
        INNER JOIN `stations`
        ON `stations`.`id` = `lines_stations`.`station_id`
        INNER JOIN `lines`
        ON `lines`.`id` = `lines_stations`.`line_id`
        WHERE `lines_stations`.`line_id` = ", line_id);
    

    -- convertir a codigo sql -- usando consultas preparadas
    PREPARE stmt FROM @sql;
    EXECUTE stmt;

    -- eliminar de la memoria
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;


-- llamar al procedimiento
-- CALL get_line_stations("Línea 9");


-- Como en mi caso usé "?" en vez de concatenar 'line_id', y utilicé la declaración USING en la instrucción ++EXECUTE stmt++ para usar 'line_id' como argumento

USE metro_cdmx;

DELIMITER //
CREATE PROCEDURE stations_for_line (
    IN line_name VARCHAR(20)
)
BEGIN
    DECLARE line_id BIGINT(20);

    SELECT `id` 
    INTO line_id
    FROM `lines`
    WHERE `name` = line_name
    COLLATE utf8mb4_unicode_ci;

    SET @sql = "
        SELECT
            `l_s`.`id` AS id_relation,
            `l`.`name` AS line_name,
            `s`.`name` AS stations_name
        FROM `lines_stations` AS l_s
        INNER JOIN `stations` AS s
        ON `s`.`id` = `l_s`.`station_id`
        INNER JOIN `lines` AS l
        ON `l`.`id` = `l_s`.`line_id`
        WHERE `l_s`.`line_id`=?";

    PREPARE stmt FROM @sql;
    EXECUTE stmt USING line_id;
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;