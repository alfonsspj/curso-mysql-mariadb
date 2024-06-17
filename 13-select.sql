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