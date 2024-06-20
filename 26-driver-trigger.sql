USE metro_cdmx;


DELIMITER //
CREATE TRIGGER update_active_drivers
AFTER UPDATE
ON `drivers`
FOR EACH ROW
BEGIN 

    IF NEW.status = 1 THEN 
        INSERT INTO `active_drivers` (driver_id) VALUES (NEW.id);
    ELSE 
        DELETE FROM `active_drivers` WHERE driver_id = NEW.id;
    END IF;

END; //

DELIMITER ;



-- source 26-driver-trigger.sql;

-- cambiar el estado
-- UPDATE `drivers` SET status = 1 WHERE id = 1;
-- SELECT * FROM `drivers`;
-- SELECT * FROM `active_drivers`;   -- aqui se cambia automaticamente por el trigger



/*
Agregue in IF para que valide si el campo que fue modificado es el de status y no haga un intento fallido al actualizar otro campo.


USE metro_cdmx;

DELIMITER //
CREATE TRIGGER update_active_driverr
AFTER UPDATE
ON `drivers`
FOR EACH ROW
BEGIN

  IF NEW.status != OLD.status THEN
    IF NEW.status = 1 THEN 
      INSERT INTO `active_drivers` (driver_id) VALUES (NEW.id);
    ELSE
      DELETE FROM `active_drivers` WHERE driver_id = NEW.id;
    END IF;
  END IF;


END; //

*/