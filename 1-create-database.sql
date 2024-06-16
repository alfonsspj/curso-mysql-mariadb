
-- Crear la bd --
CREATE DATABASE metro_cdmx;


-- Crear bd desde un archivo en mysql --
source 1-create-database.sql
-- desde cmd sin ejecutar mysql, luego nos pedirar el password de mysql
mysql -u root -p < 1-create-database.sql
Get-Content 1-create-database.sql | mysql -u root -p 


-- Eliminar bd --
DROP DATABASE metro_cdmx;

-- Mostrar todas las bd creadas --
SHOW DATABASES;

 
