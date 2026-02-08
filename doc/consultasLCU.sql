show DATABASES;
use LCU;
SHOW TABLES;

--usuario--
DESCRIBE usuario;
SELECT * FROM usuario;

UPDATE usuario SET avatar="alva"
WHERE id=1;

--pelicula--
DESCRIBE pelicula;
SELECT * FROM pelicula;

DELETE FROM pelicula WHERE id BETWEEN 17 and 48;

UPDATE pelicula
SET 
  titulo = "Oppenheimer",
  sinopsis = "Película biográfica sobre el físico J. Robert Oppenheimer y su papel como director del Proyecto Manhattan, que llevó al desarrollo de la primera bomba atómica.",
  duracion = "3h",
  año = 2023,
  genero = "Drama",
  clas_edad = "+13",
  poster = "-oppenheimer.jpg",
  imdb = "https://www.imdb.com/title/tt15398776/",
  rotten = "https://www.rottentomatoes.com/m/oppenheimer_2023",
  trailer = "https://www.youtube.com/watch?v=uYPbbksJxIg"
WHERE id = 14;

--sala--
DESCRIBE sala;

SELECT * FROM sala;
UPDATE sala SET asientos=120;

--precio formato--
DESCRIBE precio_formato;
SELECT * FROM precio_formato;

--candy--
DESCRIBE candy;
SELECT * FROM candy;
UPDATE candy SET nombre='Pochoclos dulces' WHERE id=2;
UPDATE candy SET nombre='Pochoclos salados' WHERE id=1;
UPDATE candy SET precio=8000 WHERE id=1;

--funcion--
DESCRIBE funcion;
SELECT * FROM funcion;

--ticket--
DESCRIBE ticket;
SELECT * FROM ticket;

--butaca--
DESCRIBE butaca;
SELECT * FROM butaca;

--resumen compra--
DESCRIBE resumen_compra;
SELECT * FROM resumen_compra;

--historial compra--
DESCRIBE historial_compra;
SELECT * FROM historial_compra;



--------------------------------------------------------------------------
--TOTAL TICKETS--
SELECT 
  ticket.cantidad AS 'CANT TICKETS',
  precio_formato.formato AS FORMATO,
  ticket.cantidad * precio_formato.precio AS TOTAL
FROM ticket
INNER JOIN precio_formato ON ticket.id_formato = precio_formato.id
ORDER BY precio_formato.id;

--FUNCION CON PELICULA, SALA, HORARIO, ETC
SELECT 
  funcion.id AS FUNCIÓN,
  pelicula.titulo AS PELÍCULA,
  sala.numero AS SALA,
  funcion.horario AS HORARIO,
  funcion.dia AS DÍA,
  precio_formato.formato AS FORMATO
FROM funcion
INNER JOIN pelicula ON funcion.id_pelicula = pelicula.id
INNER JOIN sala ON funcion.id_sala = sala.id
INNER JOIN precio_formato ON funcion.id_formato = precio_formato.id;

--COMPRAS X USUARIO
SELECT 
  usuario.nombres AS NOMBRES,
  usuario.apellidos AS APELLIDOS,
  resumen_compra.id AS 'ID COMPRA',
  resumen_compra.total AS TOTAL,
  resumen_compra.estado AS ESTADO
FROM resumen_compra
INNER JOIN usuario ON resumen_compra.id_usuario = usuario.id;

--SALAS LOBO WALL ST
SELECT 
  pelicula.titulo AS PELÍCULA, 
  sala.numero AS 'N SALA',
  funcion.dia AS DÍA,
  funcion.horario AS HORARIO
FROM funcion
INNER JOIN sala ON funcion.id_sala = sala.id
INNER JOIN pelicula ON funcion.id_pelicula = pelicula.id
WHERE pelicula.titulo = 'El lobo de Wall Street';

--TOTAL RECAUDADO
SELECT 
  precio_formato.formato AS FORMATO,
  SUM(ticket.cantidad) AS 'TOTAL TICKETS',
  SUM(ticket.cantidad * precio_formato.precio) AS 'TOTAL RECAUDADO'
FROM ticket
JOIN precio_formato ON ticket.id_formato = precio_formato.id
GROUP BY precio_formato.formato;

SELECT COUNT(*) FROM usuario WHERE nombres LIKE '%jul%';

SELECT 
funcion.id,
precio_formato.formato
from funcion
inner join precio_formato on funcion.id_formato = precio_formato.id
WHERE precio_formato.formato = '3D';


select 
funcion.id,
precio_formato.formato
from funcion
inner join precio_formato on funcion.id_formato=precio_formato.id
where precio_formato.formato ="3D" and funcion.dia="Sabado"

SELECT*  from funcion

ALTER TABLE usuario
ADD rol VARCHAR(10) DEFAULT 'cliente'
CHECK (rol In ('cliente','admin'))