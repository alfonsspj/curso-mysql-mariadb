 USE metro_cdmx;

-- DELETE FROM -- Vaciar toda la tabla
-- DELETE FROM `stations_delete`;

-- mensaje todos los registros fueron elinados
-- Empty set


-- Esto es para que vean cómo un delete from no reestablece los id -- continuan incrementando
INSERT INTO `stations_delete` (name) VALUES
("Lázaro Cárdens"), -- Lázaro Cárdenas
("Ferería"), -- Ferrería 
("Pnttlán"), -- Pantitlán
("Tauga"), -- Tacuba
("MartínCrrera"); -- Martín Carrera