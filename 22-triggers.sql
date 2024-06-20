USE metro_cdmx;


-- actualizar updated_at
CREATE TRIGGER update_updated_at_field   -- Asignar un nombre
BEFORE UPDATE                            -- se ejecuta antes de que se actualize
ON `lines`                               -- en la tabla
FOR EACH ROW                             -- por cada linea
SET NEW.updated_at = NOW();              -- se estable valor actual en updated_at


-- SELECT * FROM `lines` WHERE id = 1;
-- UPDATE `lines` SET name = "Línea 20" WHERE id = 1;