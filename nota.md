# Curso de Bases de Datos con MySQL y MariaDB


1. Diagramas de bd [drawio](https://www.drawio.com/) o [bddiagram.io](https://dbdiagram.io/d)
2. Alternativas para hacer diagramas con código simple y rápido de hacer revisen las documentaciones de [mermaid](https://mermaid.live/) y [plantuml](https://plantuml.com/es/). Otra [drawsql](https://drawsql.app/), [lucidchart](https://www.lucidchart.com/)

3. Comando para iniciar sesión en el servidor de la Base de Datos:
```
mysql -u root -p
-- nos pedira la contraseña de mysql:


Para entrar directamente a la base de datos:
mysql -u root -p <nombre de bd>
```
4. para crear una bd usando un archivo externo(abriendo una ventana cmd "no tiene que ser integrada a vsc):
```
mysql -u root -p < 1-create-database.sql
--nos pedira la contraseña de mysql:
```
5. otra forma de crear una bd mediante un archivo externo:
```sql
Get-Content 1-create-database.sql | mysql -u root -p 
-- nos pedira el password de mysql:
```
6. crear db desde archivo sin salir de mysql:
```sql
source 1-create-database.sql
```


7. Crear usuario en una base de datos: GRANT: para dar permisos a ciertos usuarios. (base de datos local)
```sql
CREATE USER 'alfons'@'localhost' IDENTIFIED BY 'tu-password';
```
8. Asignar privilegios en todas las bases de datos creadas por mi
```sql
GRANT ALL PRIVILEGES ON *.* TO 'alfons'@'localhost';
```
9. Activar los privilegios asignados:
```sql
FLUSH PRIVILEGES;
```

10. eliminar usuario
```sql
DROP USER 'alfons'@'localhost';
```
11. Comando para iniciar sesion con usuario especifico:
```sql
mysql -u alfons -p
-- Ingresar la contraseña
```

12. Mostrar las bd
```sql
SHOW DATABASES;
```
13. Para mostrar todas las tablas dentro de una base de datos específica 
```sql
SHOW TABLES;
```

15. Ver la descripción de una tabla 
```sql
DESCRIBE stations;
```
16. Alter table
```sql
-- Activar la bd
USE metro_cdmx;

-- Agregar llave primaria, tipo y restricciones
ALTER TABLE nombre_table
MODIFY columna BIGINT(20) UNSIGNED AUTO_INCREMENT,
ADD PRIMARY KEY(columna);

-- Cambiar nombre de una tabla
ALTER TABLE nombre_table
RENAME COLUMN nombre_table TO nombre_nuevo;

-- Agregar columna
ALTER TABLE nombre_table
ADD nombre_columna TIPO RESTRINCIONES;,

-- Eliminar columna
ALTER TABLE nombre_table
DROP COLUNB nombre_columna

-- Modificar tipo de dato
ALTER TABLE nombre_table
MODIFY COLUMN nombre_columna TIPO RESTRICCIONES;
```


17. Verificar si se insertaron los registros
```sql
SELECT * FROM `lines`;
```

18. Eliminar el contenido de una tabla
```sql
-- en caso de que algun campo este siendo referenciada por una clave foranea. No se puede eliminar por restricciones de integridad referencial 

--Solución: Desactivar y Activar la Verificación de Claves Foráneas
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `lines`;
SET FOREIGN_KEY_CHECKS = 1;
```
19. Actualización de información: actualizar registro
```sql
UPDATE table_name
SET column_name = "New value"
WHERE column_condition = "value_condition";
```

20. Eliminar un registro de una tabla 
```sql
DELETE FROM `table_name`
WHERE colum_condition = "value_condition";
```
21. Eliminar una tabla - los registros que hay en la tabla
```sql
DELETE FROM `table_name`;
```
22. Eliminar una tabla, reiniciando los ids
```sql
TRUNNCATE TABLE `table_name`;
```
23. PUEDES HACER PARA CREAR UNA TABLA IGUAL A stations APLICANDO ESTE COMANDO:
```sql
CREATE TABLE stations_delete SELECT * FROM stations;
```

24. Para eliminar una vez identificado todos los id también podríamos utilizar el siguiente query:
DELETE FROM `stations` WHERE id IN (164,165,166)
25. Una manera de saber los IDs de más de un record en SQL es usando IN


SELECT name, id FROM stations WHERE name IN("Merced", "Lázaro de Guerrero")
. Tambien otro tip es que cuando estamos estamos haciendo un DELETE, hay que ponerle un LIMIT 1, ya que para ciertas condiciones, se pueden borrar más de uno.


DELETE FROM stations
WHERE id = 164
LIMIT 1;


26. Listando datos
```sql
SELECT field_name1, field_name
FROM `table_name`
WHERE column_condition = "value_condition";
```







```sql

```
```sql

```
```sql

```