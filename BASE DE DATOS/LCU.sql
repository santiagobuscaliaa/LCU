-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-11-2025 a las 23:12:37
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `LCU`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `butaca`
--

CREATE TABLE `butaca` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `butaca` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO butaca (id, id_ticket, butaca)
VALUES
(NULL, 1, 'A5'),
(NULL, 1, 'C2'),
(NULL, 1, 'F9'),
(NULL, 2, 'J3'),
(NULL, 2, 'H11'),
(NULL, 2, 'B6'),
(NULL, 3, 'D4'),
(NULL, 3, 'A1'),
(NULL, 3, 'G7'),
(NULL, 3, 'E8'),
(NULL, 4, 'I10'),
(NULL, 4, 'C3'),
(NULL, 4, 'C4'),
(NULL, 5, 'B1'),
(NULL, 5, 'B2'),
(NULL, 5, 'B9'),
(NULL, 5, 'J12'),
(NULL, 6, 'E2'),
(NULL, 6, 'G10'),
(NULL, 6, 'H1'),
(NULL, 7, 'A12'),
(NULL, 7, 'D7'),
(NULL, 7, 'F3'),
(NULL, 8, 'I6'),
(NULL, 8, 'E11'),
(NULL, 8, 'G2'),
(NULL, 8, 'A7'),
(NULL, 9, 'J8'),
(NULL, 9, 'C10'),
(NULL, 9, 'H4'),
(NULL, 10, 'F12'),
(NULL, 10, 'D2'),
(NULL, 10, 'B7'),
(NULL, 10, 'I3'),
(NULL, 11, 'E6'),
(NULL, 11, 'A3'),
(NULL, 11, 'J1'),
(NULL, 12, 'H9'),
(NULL, 12, 'G5'),
(NULL, 12, 'D11'),
(NULL, 12, 'C7'),
(NULL, 13, 'B10'),
(NULL, 13, 'I1'),
(NULL, 13, 'F4'),
(NULL, 14, 'A9'),
(NULL, 14, 'E5'),
(NULL, 14, 'J10'),
(NULL, 15, 'C1'),
(NULL, 15, 'H2'),
(NULL, 15, 'D8'),
(NULL, 15, 'G12'),
(NULL, 16, 'I8'),
(NULL, 16, 'F7'),
(NULL, 16, 'B3'),
(NULL, 17, 'J5'),
(NULL, 17, 'A6'),
(NULL, 17, 'E1'),
(NULL, 18, 'G9'),
(NULL, 18, 'D5'),
(NULL, 18, 'I2'),
(NULL, 18, 'B11'),
(NULL, 19, 'H7'),
(NULL, 19, 'C6'),
(NULL, 19, 'F2'),
(NULL, 20, 'A10'),
(NULL, 20, 'J7'),
(NULL, 20, 'E9'),
(NULL, 21, 'D1'),
(NULL, 21, 'G3'),
(NULL, 21, 'I12'),
(NULL, 21, 'B4'),
(NULL, 22, 'H10'),
(NULL, 22, 'C12'),
(NULL, 22, 'A2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candy`
--

CREATE TABLE `candy` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio` varchar(15) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoría` enum('Pochoclos','Bebidas','Snacks','Combos','Otros') NOT NULL,
  `imagen` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO candy (id,nombre, precio, stock, categoría, imagen)
VALUES
(NULL,"pochoclos", "5000","50","Pochoclos","https://www.infobae.com/resizer/v2/ZTCBDSR5DVBNJPMMDYTSUKAGPE.jpg?auth=2c6be2b1ef7290ad225fb82323953c27e0995a03c6950e843dc3bb7f1560cd50&smart=true&width=1200&height=900&quality=85"),
(NULL,"pochoclos_dulces", "8000","50","Pochoclos","https://fedecocina.net/static/3f5109073f627e5da49ab97a22cda806/0a45a/pochoclo-1x1.jpg"),
(NULL,"Coca Cola", "5500","50","Bebidas","https://acdn-us.mitiendanube.com/stores/001/211/660/products/coca-006ef25d4b11679fa917251138441237-640-0.jpeg"),
(NULL,"Sprite", "5500","50","Bebidas","https://carrefourar.vtexassets.com/arquivos/ids/693029-800-450?v=638917474933900000&width=800&height=450&aspect=true"),
(NULL,"Nachos", "6000","50","Snacks","https://chitarroni.com.ar/images/product_image/3047/0?dpr=2.625&fit=crop&h=520&q=80&version=08b67&w=400"),
(NULL,"Lays", "4000","50","Snacks","https://i5.walmartimages.com/seo/Lay-s-Classic-Potato-Chips-8-oz-Bag_f1852517-59f2-467f-b176-3ea1f2b098ae.a06a239111071c1595ab75cf3bf2323f.jpeg");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `id` int(11) NOT NULL,
  `horario` enum('10:00','12:00','14:00','16:00','18:00','20:00','21:00','22:00') NOT NULL,
  `dia` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') NOT NULL,
  `formato` enum('2D','3D') NOT NULL,
  `id_pelicula` int(11) NOT NULL,
  `id_sala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO funcion (id, horario, dia, id_formato, id_pelicula, id_sala)
VALUES
(NULL, "14:00", "Viernes", 1, 1, 1),
(NULL, "18:00", "Sábado", 2, 1, 2),
(NULL, "21:00", "Lunes", 1, 1, 3),

(NULL, "12:00", "Miércoles", 1, 2, 2),
(NULL, "16:00", "Viernes", 2, 2, 3),
(NULL, "20:00", "Sábado", 1, 2, 4),

(NULL, "10:00", "Lunes", 2, 3, 1),
(NULL, "14:00", "Jueves", 2, 3, 2),
(NULL, "18:00", "Sábado", 1, 3, 3),

(NULL, "12:00", "Martes", 1, 4, 4),
(NULL, "16:00", "Viernes", 1, 4, 1),
(NULL, "20:00", "Sábado", 2, 4, 2),

(NULL, "10:00", "Miércoles", 1, 5, 3),
(NULL, "14:00", "Viernes", 2, 5, 4),
(NULL, "18:00", "Sábado", 1, 5, 1),

(NULL, "12:00", "Jueves", 1, 6, 2),
(NULL, "16:00", "Viernes", 2, 6, 3),
(NULL, "20:00", "Sábado", 1, 6, 4),

(NULL, "10:00", "Martes", 1, 7, 1),
(NULL, "14:00", "Viernes", 1, 7, 2),
(NULL, "18:00", "Sábado", 2, 7, 3),

(NULL, "12:00", "Miércoles", 1, 8, 4),
(NULL, "16:00", "Viernes", 2, 8, 1),
(NULL, "20:00", "Sábado", 1, 8, 2),

(NULL, "10:00", "Lunes", 1, 9, 3),
(NULL, "14:00", "Jueves", 2, 9, 4),
(NULL, "18:00", "Sábado", 1, 9, 1),

(NULL, "12:00", "Martes", 2, 10, 2),
(NULL, "16:00", "Viernes", 1, 10, 3),
(NULL, "20:00", "Sábado", 2, 10, 4),

(NULL, "10:00", "Miércoles", 1, 11, 1),
(NULL, "14:00", "Viernes", 2, 11, 2),
(NULL, "18:00", "Sábado", 1, 11, 3),

(NULL, "12:00", "Jueves", 2, 12, 4),
(NULL, "16:00", "Viernes", 1, 12, 1),
(NULL, "21:00", "Sábado", 1, 12, 2),

(NULL, "10:00", "Martes", 2, 13, 3),
(NULL, "14:00", "Viernes", 1, 13, 4),
(NULL, "18:00", "Sábado", 2, 13, 1),

(NULL, "12:00", "Miércoles", 2, 14, 2),
(NULL, "16:00", "Viernes", 1, 14, 3),
(NULL, "20:00", "Sábado", 2, 14, 4),

(NULL, "10:00", "Lunes", 1, 15, 1),
(NULL, "14:00", "Viernes", 2, 15, 2),
(NULL, "18:00", "Sábado", 1, 15, 3),

(NULL, "12:00", "Martes", 1, 16, 1),
(NULL, "16:00", "Viernes", 2, 16, 2),
(NULL, "20:00", "Sábado", 1, 16, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_compra`
--

CREATE TABLE `historial_compra` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_resumen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO historial_compra (id, id_usuario, id_resumen)
VALUES
(NULL, 3, 1),
(NULL, 6, 2),
(NULL, 1, 3),
(NULL, 8, 4),
(NULL, 2, 5),
(NULL, 9, 6),
(NULL, 5, 7),
(NULL, 4, 8),
(NULL, 10, 9),
(NULL, 7, 10),
(NULL, 2, 11),
(NULL, 1, 12),
(NULL, 3, 13),
(NULL, 8, 14),
(NULL, 9, 15),
(NULL, 10, 16),
(NULL, 5, 17),
(NULL, 6, 18),
(NULL, 7, 19),
(NULL, 4, 20),
(NULL, 1, 21),
(NULL, 9, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `id` int(11) NOT NULL,
  `titulo` varchar(40) NOT NULL,
  `sinopsis` text NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `año` int(11) NOT NULL,
  `genero` enum('Acción','Comedia','Drama','Ciencia Ficción','Terror','Animación','Documental') NOT NULL,
  `clas_edad` enum('ATP','+13','+16','+18') NOT NULL,
  `poster` varchar(150) NOT NULL,
  `imdb` varchar(150) NOT NULL,
  `rotten` varchar(150) NOT NULL,
  `trailer` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO pelicula
(id,titulo,sinopsis,duracion,año,genero,clas_edad,poster,imdb,rotten,trailer)
VALUES
(NULL, "Había una vez en Hollywood", 
"En Los Ángeles de 1969, un actor de televisión y su doble de riesgo intentan adaptarse a los cambios de la industria cinematográfica mientras se cruzan con la familia Manson.",
"2h 41min", "2019", "Comedia", "+16", "-onceuponatime.jpg", 
"https://www.imdb.com/title/tt7131622/", 
"https://www.rottentomatoes.com/m/once_upon_a_time_in_hollywood", 
"https://www.youtube.com/watch?v=ELeMaP8EPAA"),

(NULL, "El secreto de sus ojos", 
"Un empleado judicial escribe una novela basada en un brutal asesinato sin resolver que marcó su vida, mientras revive un amor imposible y una justicia pendiente.",
"2h 9min", "2009", "Drama", "+16", "-secreto.jpg", 
"https://www.imdb.com/title/tt1305806/", 
"https://www.rottentomatoes.com/m/secret_in_their_eyes", 
"https://youtu.be/hKa8U-8vsfU?si=yW7u5b4EyUAJBtiD"),

(NULL, "Avatar: Fuego y Ceniza", 
"Tercera entrega de la saga Avatar. Presenta al Pueblo de las Cenizas, un clan Na'vi no tan pacífico que utilizará la violencia si lo necesita para conseguir sus objetivos, aunque sea contra otros clanes.",
"3h 12min", "2025", "Ciencia Ficción", "+13", "-avatar.jpg", 
"https://www.imdb.com/es/title/tt1757678/", 
"https://www.rottentomatoes.com/m/avatar_fire_and_ash", 
"https://youtu.be/bf38f_JINyw?si=mmRYVsrLnwKLLLVU"),

(NULL, "Whiplash", 
"Un joven baterista de jazz busca la perfección bajo la despiadada tutela de un instructor que no se detiene ante nada para sacar lo mejor de él.",
"1h 47min", "2014", "Drama", "+16", "-whiplash.jpg", 
"https://www.imdb.com/title/tt2582802/", 
"https://www.rottentomatoes.com/m/whiplash_2014", 
"https://www.youtube.com/watch?v=7d_jQycdQGo"),

(NULL, "Argentina 1985", 
"Basada en hechos reales, narra el histórico juicio a las Juntas Militares que gobernaron Argentina, liderado por el fiscal Julio Strassera y su equipo.",
"2h 20min", "2022", "Drama", "+13", "-arg.jpg", 
"https://www.imdb.com/title/tt15301048/", 
"https://www.rottentomatoes.com/m/argentina_1985", 
"https://www.youtube.com/watch?v=2L0EekZ9QfQ"),

(NULL, "Kill Bill: Volumen 1", 
"Una asesina traicionada por su antiguo equipo busca venganza contra quienes intentaron matarla el día de su boda.",
"1h 51min", "2003", "Acción", "+18", "-kill.jpg", 
"https://www.imdb.com/title/tt0266697/", 
"https://www.rottentomatoes.com/m/kill_bill_vol_1", 
"https://www.youtube.com/watch?v=7kSuas6mRpk"),

(NULL, "Gladiador", 
"Un general romano leal es traicionado, pierde a su familia, se convierte en esclavo y luego gladiador, y busca venganza contra el emperador corrupto que lo traicionó.", 
"2h 35min", "2000", "Acción", "+16", "-gla.jpg", 
"https://www.imdb.com/title/tt0172495/", 
"https://www.rottentomatoes.com/m/gladiator", 
"https://www.youtube.com/watch?v=owK1qxDselE"),

(NULL, "Diario de una pasión", 
"En un hogar de retiro, un anciano lee a una mujer la historia de dos jóvenes amantes separados por la guerra y las diferencias sociales, que luchan por mantener vivo su amor.", 
"2h 3min", "2004", "Drama", "+13", "-diario.jpg", 
"https://www.imdb.com/title/tt0332280/", 
"https://www.rottentomatoes.com/m/notebook", 
"https://www.youtube.com/watch?v=FC6biTjEyZw"),

(NULL, "Supercool", 
"Dos adolescentes planean comprar alcohol para una fiesta y perder su virginidad antes de graduarse, pero su noche se descontrola completamente.", 
"1h 53min", "2007", "Comedia", "+16", "-superbad.jpg", 
"https://www.imdb.com/title/tt0829482/", 
"https://www.rottentomatoes.com/m/superbad", 
"https://www.youtube.com/watch?v=4eaZ_48ZYog"),

(NULL, "Coraline", 
"Una niña descubre una puerta secreta en su nueva casa que la lleva a un mundo alternativo donde todo parece mejor, hasta que se da cuenta de su oscuro propósito.", 
"1h 40min", "2009", "Animación", "ATP", "-coraline.jpg", 
"https://www.imdb.com/title/tt0327597/", 
"https://www.rottentomatoes.com/m/coraline", 
"https://www.youtube.com/watch?v=m9bOpeuvNwY"),

(NULL, "Bastardos sin gloria", 
"Durante la Segunda Guerra Mundial, un grupo de soldados judíos-americanos busca vengarse de los nazis mientras una joven trama su propia revancha en un cine de París.", 
"2h 33min", "2009", "Drama", "+18", "-bastardos.jpg", 
"https://www.imdb.com/title/tt0361748/", 
"https://www.rottentomatoes.com/m/inglourious_basterds", 
"https://www.youtube.com/watch?v=KnrRy6kSFF0"),

(NULL, "Huye", 
"Un joven afroamericano visita a la familia de su novia blanca y, tras una serie de incidentes inquietantes, descubre un terrible secreto que ocultan.", 
"1h 44min", "2017", "Terror", "+16", "-getout.jpg", 
"https://www.imdb.com/title/tt5052448/", 
"https://www.rottentomatoes.com/m/get_out", 
"https://www.youtube.com/watch?v=sRfnevzM9kQ"),

(NULL, "El lobo de Wall Street", 
"Jordan Belfort asciende como corredor de bolsa en Nueva York mediante el fraude y la corrupción, viviendo una vida de excesos, poder y desenfreno.", 
"3h", "2013", "Comedia", "+18", "-lobo.jpg", 
"https://www.imdb.com/title/tt0993846/", 
"https://www.rottentomatoes.com/m/the_wolf_of_wall_street_2013", 
"https://www.youtube.com/watch?v=iszwuX1AK6A"),

(NULL, "Interestelar", 
"Un grupo de exploradores viaja a través de un agujero de gusano en el espacio para asegurar el futuro de la humanidad, mientras el amor y el tiempo se entrelazan.", 
"2h 49min", "2014", "Ciencia Ficción", "+13", "-interestelar.jpg", 
"https://www.imdb.com/title/tt0816692/", 
"https://www.rottentomatoes.com/m/interstellar_2014", 
"https://www.youtube.com/watch?v=zSWdZVtXT7E"),

(NULL, "Spiderman: A través del Spider-Verso", 
"Miles Morales se adentra en el multiverso junto a Gwen Stacy y un equipo de Spider-Personas para enfrentar a un enemigo que amenaza todos los universos.", 
"2h 20min", "2023", "Animación", "ATP", "-spiderman.jpg", 
"https://www.imdb.com/title/tt9362722/", 
"https://www.rottentomatoes.com/m/spider_man_across_the_spider_verse", 
"https://www.youtube.com/watch?v=shW9i6k8cB0"),

(NULL, "El Faro", 
"Dos fareros quedan aislados en una remota isla de Nueva Inglaterra y poco a poco pierden la cordura en medio de tormentas, secretos y la soledad.", 
"1h 49min", "2019", "Terror", "+18", "-faro.jpg", 
"https://www.imdb.com/title/tt7984734/", 
"https://www.rottentomatoes.com/m/the_lighthouse_2019", 
"https://www.youtube.com/watch?v=Hyag7lR8CPA");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_formato`
--

CREATE TABLE `precio_formato` (
  `id` int(11) NOT NULL,
  `formato` enum('2D','3D') NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO precio_formato
(id, formato, precio) 
VALUES (NULL, '2D', "10000"), (NULL, '3D', "12500");

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resumen_compra`
--

CREATE TABLE `resumen_compra` (
  `id` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_candy` int(11) NOT NULL,
  `total` varchar(15) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO resumen_compra (id, id_ticket, id_usuario, id_candy, total, estado)
VALUES
(NULL, 1, 3, 2, 27400, 1),
(NULL, 2, 6, 5, 19800, 1),
(NULL, 3, 1, 3, 35650, 0),
(NULL, 4, 8, 1, 22500, 1),
(NULL, 5, 2, 4, 31400, 1),
(NULL, 6, 9, 6, 18300, 0),
(NULL, 7, 5, 2, 26700, 1),
(NULL, 8, 4, 1, 29200, 1),
(NULL, 9, 10, 3, 31900, 0),
(NULL, 10, 7, 6, 20450, 1),
(NULL, 11, 2, 4, 33800, 1),
(NULL, 12, 1, 5, 26100, 0),
(NULL, 13, 3, 2, 28700, 1),
(NULL, 14, 8, 6, 33000, 1),
(NULL, 15, 9, 5, 17600, 0),
(NULL, 16, 10, 3, 29550, 1),
(NULL, 17, 5, 1, 26900, 1),
(NULL, 18, 6, 4, 30800, 0),
(NULL, 19, 7, 2, 22700, 1),
(NULL, 20, 4, 5, 24300, 1),
(NULL, 21, 1, 3, 31600, 0),
(NULL, 22, 9, 6, 28950, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `asientos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO sala (id, numero, asientos) 
VALUES (NULL, '1', '106'), (NULL, '2', '106'),(NULL, '3', '106'),(NULL, '4', '106');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `cantidad` varchar(10) NOT NULL,
  `id_funcion` int(11) NOT NULL,
  `id_precio_formato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `nacimiento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO usuario
(id,nombres,apellidos,nacimiento,email,telefono,avatar)
VALUES
(NULL, "Alvaro", "Gomez", "2006-08-03", "alvarogomez@gmail.com", "2477123455", "jaja"),
(NULL, "Lucia", "Martinez", "2004-11-15", "luciamartinez@gmail.com", "2477456211", "luci"),
(NULL, "Mateo", "Fernandez", "2006-02-20", "mateofernandez@gmail.com", "2477985643", "mat"),
(NULL, "Sofia", "Lopez", "2005-09-12", "sofialopez@gmail.com", "2477231987", "sofi"),
(NULL, "Valentin", "Rodriguez", "2004-06-30", "valentinrodriguez@gmail.com", "2477564890", "val"),
(NULL, "Camila", "Perez", "2006-01-25", "camilaperez@gmail.com", "2477654321", "cami"),
(NULL, "Tomas", "Ruiz", "2005-03-18", "tomasruiz@gmail.com", "2477890123", "tom"),
(NULL, "Martina", "Sanchez", "2004-12-07", "martinasanchez@gmail.com", "2477345098", "marti"),
(NULL, "Nicolas", "Torres", "2005-05-10", "nicolastorres@gmail.com", "2477222333", "nico"),
(NULL, "Julieta", "Diaz", "2006-09-02", "julietadiaz@gmail.com", "2477555666", "juli");

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `butaca`
--
ALTER TABLE `butaca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_butaca_ticket` (`id_ticket`);

--
-- Indices de la tabla `candy`
--
ALTER TABLE `candy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_nombre_candy` (`nombre`),
  ADD UNIQUE KEY `un_imagen_candy` (`imagen`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcion_sala` (`id_sala`),
  ADD KEY `fk_funcion_formato` (`formato`),
  ADD KEY `fk_funcion_pelicula` (`id_pelicula`);

--
-- Indices de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_historial_resumen` (`id_resumen`),
  ADD KEY `fk_historial_usuario` (`id_usuario`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `precio_formato`
--
ALTER TABLE `precio_formato`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_resumen_candy` (`id_candy`),
  ADD KEY `fk_resumen_ticket` (`id_ticket`),
  ADD KEY `fk_resumen_usuario` (`id_usuario`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_funcion` (`id_funcion`),
  ADD KEY `fk_ticket_formato` (`id_precio_formato`);


INSERT INTO ticket (id, cantidad, id_funcion, id_formato) 
VALUES
(NULL, "3", 1, 1),
(NULL, "2", 5, 1),
(NULL, "5", 10, 1),
(NULL, "2", 12, 2),
(NULL, "1", 6, 1),
(NULL, "4", 15, 2),
(NULL, "7", 20, 1),
(NULL, "9", 22, 2),
(NULL, "6", 25, 1),
(NULL, "8", 28, 2),
(NULL, "10", 30, 2),
(NULL, "4", 33, 1),
(NULL, "5", 35, 2),
(NULL, "2", 38, 1),
(NULL, "3", 40, 2),
(NULL, "7", 42, 1),
(NULL, "1", 43, 2),
(NULL, "6", 44, 1),
(NULL, "9", 45, 2),
(NULL, "8", 46, 1),
(NULL, "10", 47, 2),
(NULL, "5", 48, 1);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `un_email_usuario` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `butaca`
--
ALTER TABLE `butaca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `candy`
--
ALTER TABLE `candy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `precio_formato`
--
ALTER TABLE `precio_formato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `butaca`
--
ALTER TABLE `butaca`
  ADD CONSTRAINT `fk_butaca_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `fk_funcion_pelicula` FOREIGN KEY (`id_pelicula`) REFERENCES `pelicula` (`id`),
  ADD CONSTRAINT `fk_funcion_sala` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`);

--
-- Filtros para la tabla `historial_compra`
--
ALTER TABLE `historial_compra`
  ADD CONSTRAINT `fk_historial_resumen` FOREIGN KEY (`id_resumen`) REFERENCES `resumen_compra` (`id`),
  ADD CONSTRAINT `fk_historial_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `resumen_compra`
--
ALTER TABLE `resumen_compra`
  ADD CONSTRAINT `fk_resumen_candy` FOREIGN KEY (`id_candy`) REFERENCES `candy` (`id`),
  ADD CONSTRAINT `fk_resumen_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id`),
  ADD CONSTRAINT `fk_resumen_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_formato` FOREIGN KEY (`id_precio_formato`) REFERENCES `precio_formato` (`id`),
  ADD CONSTRAINT `fk_ticket_funcion` FOREIGN KEY (`id_funcion`) REFERENCES `funcion` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
