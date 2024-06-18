Existe una mejor manera de llenar la tabla lines_stations con solo un Query. . Pero para lograr esto, hay que hacer cambios en la tabla de stations. Se tendría que agregar la columna line_id dentro de esta tabla de stations. . Yo lo hice de esa forma porque siempre cada estación va a pertenecer a una línea del metro. Y en caso de las estaciones con más de una línea, para eso nos va a ayudar la tabla pivot. . Despues de agregar este campo, hay que agregarle un valor a cada estación. Ese código lo tengo ya hecho en este archivo sql: https://github.com/irvingvjuarez/mariadb-course/blob/main/update/update-line-id.sql . Una vez que ya todas las estaciones tienen un valor en line_id, entonces ahora si podemos llenar de manera sencilla la tabla lines_stations con el siguiente query


USE cdmx_subway;

INSERT INTO lines_stations (station_id, line_id)
SELECT id, line_id
FROM stations;
Y listo, la tabla pivot se habrá llenado de valores de manera rápida y sencilla


### aporte con repo
Elkin David Jaramillo Flórez
Despues de este maravilloso reto de hacerlo con el sistema de transmilenio de la ciudad de bogota lo he logrado 😁👌 Aca les comparto mi repo: https://github.com/elkin-dev/bd_transmilenio_cdbog


USE TRANSMILENIO_CDBOG;
SELECT
    ST_DISTANCE_SPHERE( (
    SELECT
        UBICACION
    FROM
        UBICACION AS U
        INNER JOIN ESTACIONES AS E
        ON E.ID = U.ESTACIONES_ID
    WHERE
        E.NOMBRE = 'San Mateo'),
        (
            SELECT
                UBICACION
            FROM
                UBICACION AS U
                INNER JOIN ESTACIONES AS E
                ON E.ID = U.ESTACIONES_ID
            WHERE
                E.NOMBRE = 'Portal El Dorado'
        ) )/1000 AS DISTANCIA_KM;

### aporte
Les tengo una solucion un poco mas eficiente para el tema de la optimizacion. Si vieron la clase de consultas anidadas ( https://platzi.com/new-home/clases/1566-bd/19825-el-interminable-agujero-de-conejo-nested-queries/ ) en el curso de fundamentos de bases de datos sabran el coste algoritmico que reprecenta abusar de estas consultas. . Para esto les sugiero realizar algo llamado "tablas tamporales", estas son tablas que se crean para consultas muy frecuentes y estas se borran luego de que la sesion se cierra, en el codigo les muestro mejor. .


USE metro_cdmx;

SELECT   ST_Distance_Sphere (
        ( 
			SELECT `location`
            FROM `location`
            WHERE `stations_id` =
				( SELECT `id`
					FROM `stations`
                    WHERE `name` = "Lázaro Cárdenas"
			)
        ),
		( 
			SELECT `location`
            FROM `location`
            WHERE `stations_id` =
				( SELECT `id`
					FROM `stations`
                    WHERE `name` = "Ferrería"
				)
			)
-- dividimos entre 1000 para convertirlo en km
	) / 1000 AS distance_by_name;
    
Aqui pueden ver la distancia en km entre lazaro Cardenas y Ferreria, pregunto ahora, si necesitara crear una vista para que el usuario pueda medir la distancia cada que desee, necesito hacer siempre este codigo? ademas de que mi cliente tendra acceso a tablas vitales para el funcionamiento de mi aplicacion . Entran las tablas teporales al juego


USE metro_cdmx;

-- Creamos la tabla temporal donde se alojara una copia de location, haciendo una sentencia IF NOT EXISTS para no crear una tabla repetida

CREATE TEMPORARY TABLE IF NOT EXISTS distance_by_name_temporary AS (SELECT * FROM location);   

-- procedemos a hacer el calculo normal
SELECT   ST_Distance_Sphere (
        ( 
			SELECT `location`
            FROM `distance_by_name_temporary`
            WHERE `stations_id` =
				( SELECT `id`
					FROM `stations`
                    WHERE `name` = "Lázaro Cárdenas"
			)
        ),
		( 
			SELECT `location`
            FROM `distance_by_name_temporary`
            WHERE `stations_id` =
				( SELECT `id`
					FROM `stations`
                    WHERE `name` = "Ferrería"
				)
			)
-- dividimos entre 1000 para convertirlo en km
	) / 1000 AS distance_by_name;
    
como pueden ver ahora tenemos una tabla temporal creada que le dara su peticion al usuario sin tocar partes vitales de nuestra base de datos. ESPERA, notaste que no use una tabla temporal para la tabla stations? . ese sera tu reto