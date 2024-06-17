  USE metro_cdmx;

-- TRUNCATE -- Vaciar toda la tabla
TRUNCATE TABLE `stations_delete`;



-- Esto es para que vean cómo un truncate table SI reestablece los id -- reinicia las llaves primarias
INSERT INTO `stations_delete` (name) VALUES
("Lázaro Cárdens"), -- Lázaro Cárdenas
("Ferería"), -- Ferrería 
("Pnttlán"), -- Pantitlán
("Tauga"), -- Tacuba
("MartínCrrera"); -- Martín Carrera