USE metro_cdmx;

-- configuración para que ingrese los caracteres en utf8mb
SET NAMES 'utf8mb4';
SET CHARACTER SET 'utf8mb4';

-- conductores para la tabla de drivers
INSERT INTO `drivers` (name) VALUES
("Pedro"),
("Pablo"),
("José"),
("María"),
("Amanda");


-- source 25-fill-drivers-table.sql;