USE metro_cdmx;

-- Seleccionar todo  -- mostrar todo de la tabla de lines
SELECT * FROM `lines`;


-- Filtrar por columnas
SELECT id, name, color FROM `lines`;


-- Operaciones matematicas con select
SELECT (2 + 2); 
SELECT (2 + 2) AS resultado; 

-- promedio de años -- average=promedio
SELECT AVG(year) FROM `trains`;
SELECT AVG(year) AS year_avg FROM `trains`;


-- Juntar tablas -- join = juntar tablas
SELECT
`lines`.`name`,
`trains`.`serial_number`
FROM `lines`
INNER JOIN `trains`
ON `lines`.`id` = `trains`.`line_id`;

-- otra forma
SET @row_num = 0;

SELECT 
    (@row_num := @row_num + 1) AS row_num,
    `lines`.`name`,
    `trains`.`serial_number`
FROM
    `lines`
INNER JOIN
    `trains`
ON
    `lines`.`id` = `trains`.`line_id`;

-- mysql 8.0
SELECT  row_number() OVER()
`lines`.`name`,
`trains`.`serial_number`
FROM `lines` -- la fuente es la tabla lineas
INNER JOIN `trains` -- acá te sumo la tabla trenes
WHERE `lines`.`id` = `trains`.`line_id`; 

SELECT
    ROW_NUMBER() OVER (ORDER BY `lines`.`id`) AS row_num,
    `lines`.`name`,
    `trains`.`serial_number`
FROM
    `lines`
INNER JOIN
    `trains`
ON
    `lines`.`id` = `trains`.`line_id`;