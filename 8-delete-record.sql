USE metro_cdmx;


-- eliminar datos que estan duplicados
-- buscar por id
-- SELECT id FROM `stations` WHERE name = "Merced";
-- SELECT id FROM `stations` WHERE name = "Lázaro de Guerrero";
-- SELECT id FROM `stations` WHERE name = "Benito Cárdenas";

-- Eliminar por id
DELETE FROM `stations`
WHERE id = 164;

DELETE FROM `stations`
WHERE id = 165;


-- Eliminar filtrando por nombre
DELETE FROM `stations`
WHERE name = "Benito Cárdenas";