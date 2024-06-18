Existe una mejor manera de llenar la tabla lines_stations con solo un Query. . Pero para lograr esto, hay que hacer cambios en la tabla de stations. Se tendría que agregar la columna line_id dentro de esta tabla de stations. . Yo lo hice de esa forma porque siempre cada estación va a pertenecer a una línea del metro. Y en caso de las estaciones con más de una línea, para eso nos va a ayudar la tabla pivot. . Despues de agregar este campo, hay que agregarle un valor a cada estación. Ese código lo tengo ya hecho en este archivo sql: https://github.com/irvingvjuarez/mariadb-course/blob/main/update/update-line-id.sql . Una vez que ya todas las estaciones tienen un valor en line_id, entonces ahora si podemos llenar de manera sencilla la tabla lines_stations con el siguiente query


USE cdmx_subway;

INSERT INTO lines_stations (station_id, line_id)
SELECT id, line_id
FROM stations;
Y listo, la tabla pivot se habrá llenado de valores de manera rápida y sencilla