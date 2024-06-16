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
