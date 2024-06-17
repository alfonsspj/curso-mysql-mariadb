USE metro_cdmx;

--  ALTER table en su columna updated_at ya que no se actualiza en la edición automáticamente
ALTER TABLE `stations`
MODIFY COLUMN `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

UPDATE `stations`
SET name = "Lázaro Cárdenas"
WHERE id = 1;

UPDATE `stations`
SET name = "Ferrería"
WHERE id = 2;

UPDATE `stations`
SET name = "Pantitlán" WHERE id = 3;

UPDATE `stations`
SET name = "Tacuba" WHERE id = 4;

UPDATE `stations`
SET name = "Martín Carrera" WHERE id = 5;