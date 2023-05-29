-- README !!

-- This sql code is to be executed in the hasura SQL section, it must be copied and pasted and then only make the relationships between the movie and genre tables in Hasura.

CREATE TABLE genre (
  id int NOT NULL PRIMARY KEY,
  name varchar(150) NOT NULL
);

INSERT INTO genre VALUES(0, 'None');
INSERT INTO genre VALUES(12, 'Adventure');
INSERT INTO genre VALUES(14, 'Fantasy');
INSERT INTO genre VALUES(16, 'Animation');
INSERT INTO genre VALUES(18, 'Drama');
INSERT INTO genre VALUES(27, 'Horror');
INSERT INTO genre VALUES(28, 'Action');
INSERT INTO genre VALUES(35, 'Comedy');
INSERT INTO genre VALUES(36, 'History');
INSERT INTO genre VALUES(37, 'Western');
INSERT INTO genre VALUES(53, 'Thriller');
INSERT INTO genre VALUES(80, 'Crime');
INSERT INTO genre VALUES(99, 'Documentary');
INSERT INTO genre VALUES(878, 'Science Fiction');
INSERT INTO genre VALUES(9648, 'Mystery');
INSERT INTO genre VALUES(10402, 'Music');
INSERT INTO genre VALUES(10749, 'Romance');
INSERT INTO genre VALUES(10751, 'Family');
INSERT INTO genre VALUES(10752, 'War');
INSERT INTO genre VALUES(10759, 'Action & Adventure');
INSERT INTO genre VALUES(10762, 'Kids');
INSERT INTO genre VALUES(10763, 'News');
INSERT INTO genre VALUES(10764, 'Reality');
INSERT INTO genre VALUES(10765, 'Sci-Fi & Fantasy');
INSERT INTO genre VALUES(10766, 'Soap');
INSERT INTO genre VALUES(10767, 'Talk');
INSERT INTO genre VALUES(10768, 'War & Politics');
INSERT INTO genre VALUES(10769, 'Foreign');
INSERT INTO genre VALUES(10770, 'TV movie');

CREATE TABLE movie (
  id int NOT NULL PRIMARY KEY,
  title varchar(256) NOT NULL ,
  original_title varchar(256) NOT NULL ,
  original_language varchar(10) NOT NULL,
  poster_path varchar(200) NOT NULL,
  genre INTEGER NOT NULL REFERENCES genre(id),
  imdb_id varchar(40) NOT NULL ,
  budget bigint NOT NULL ,
  release_date varchar(20) NOT NULL,
  runtime int NOT NULL,
  homepage varchar(256) NOT NULL ,
  vote_count int NOT NULL,
  vote_avg varchar(10) NOT NULL
);

INSERT INTO movie VALUES
(5, 'Four Rooms', 'Four Rooms', 'en', '/iE3WStGxsy1flS3CI8lB6NJbGBo.jpg', 35, '', 0, '1995-12-25', 0, '', 249, '6.47'),
(6, 'Los jueces de la noche', 'Judgment Night', 'en', '/oMjuWHyumyA7MMcSUzOS2ROJBvB.jpg', 28, '', 0, '1993-10-15', 0, '', 30, '6.27'),
(8, 'Life in Loops (A Megacities RMX)', 'Life in Loops (A Megacities RMX)', 'en', '/8YyIjOAxwzD3fZMdmJrfiApod4l.jpg', 99, '', 0, '2006-01-01', 0, '', 3, '5.17'),
(9, 'Sonntag im August', 'Sonntag im August', 'de', 'null', 18, '', 0, '2004-09-02', 0, '', 1, '1.0'),
(12, 'Buscando a Nemo', 'Finding Nemo', 'en', '/xV53cRJDjJEyLVDDcumxx3O6CTB.jpg', 16, '', 0, '2003-11-29', 0, '', 3218, '7.35'),
(13, 'Forrest Gump', 'Forrest Gump', 'en', '/o8WWkWjC11I2NxwlMXqSxdBzZWd.jpg', 35, '', 0, '1994-06-22', 0, '', 4003, '8.0'),
(14, 'American Beauty', 'American Beauty', 'en', '/fbkevWYfyNZrT46ROmw0DyHC0RA.jpg', 18, '', 0, '1999-09-15', 0, '', 1424, '7.63'),
(16, 'Bailar en la oscuridad', 'Dancer in the Dark', 'en', '/vJ48P9eKzD30Tr3zhhmNQWSyghi.jpg', 18, '', 0, '2000-05-17', 0, '', 150, '7.34'),
(17, 'La Oscuridad', 'The Dark', 'en', '/8fzjzQhLXl1afshhsE5Y3MGuco4.jpg', 27, '', 0, '2006-01-26', 0, '', 27, '5.17'),
(18, 'El quinto elemento', 'The Fifth Element', 'en', '/scrQRvQ4bxwJuGuyl8QESNdB1OB.jpg', 12, '', 0, '1997-05-07', 0, '', 2322, '7.03'),
(20, 'Mi vida sin mi', 'My Life Without Me', 'en', '/eJhHBrpQPyA6k9uEng8t3oEcFqN.jpg', 18, '', 0, '2003-03-07', 0, '', 33, '6.77'),
(22, 'Piratas del Caribe. La maldicion de la Perla Negra', 'Pirates of the Caribbean: The Curse of the Black Pearl', 'en', '/ypa2C14aaTuYK5WBKMoZNZVGcnP.jpg', 12, '', 0, '2003-07-03', 0, '', 3640, '7.24'),
(24, 'Kill Bill. Volume 1', 'Kill Bill: Vol. 1', 'en', '/vXwqJHlPZA44CVSYwbN9hiOFiJ0.jpg', 28, '', 0, '2003-10-10', 0, '', 2406, '7.48');
INSERT INTO movie VALUES
(25, 'Jarhead, el infierno espera', 'Jarhead', 'en', '/cIBrR54liskX0iYWYyubTiXu5SW.jpg', 18, '', 0, '2005-11-04', 0, '', 375, '6.39'),
(26, 'Caminar sobre las aguas', 'LaLehet Al HaMayim', 'en', '/5BH0k5pauAqywpr4NL9nKYcKC6O.jpg', 18, '', 0, '2004-02-05', 0, '', 9, '6.22'),
(27, '9 Canciones', '9 Songs', 'en', '/maoRCqQcirG5NOnWdA4cAsugGQ1.jpg', 18, '', 0, '2004-07-16', 0, '', 42, '4.94'),
(30, 'Rosa Magnetica', '彼女の想いで', 'ja', '/1A59xquD5rZeQRgjMfI4qu1ZvcQ.jpg', 16, '', 0, '1995-12-23', 0, '', 5, '7.4'),
(31, 'Bomba Fetida', '最臭兵器', 'ja', '/5LRT8RxXsEg7Ni0YCa2p6R9Ogn.jpg', 28, '', 0, '1995-12-23', 0, '', 2, '5.0'),
(32, 'Carne de Canon', '大砲の街', 'ja', '/oJdlkTtDvvpgagO2JWBBxGq5mMN.jpg', 16, '', 0, '1995-12-23', 0, '', 2, '4.5'),
(33, 'Sin perdon', 'Unforgiven', 'en', '/ol37nSSpopoWmqoWaCNmcshcaHu.jpg', 37, '', 0, '1992-08-07', 0, '', 498, '7.43'),
(35, 'Los Simpson: La pelicula', 'The Simpsons movie', 'en', '/h751e74g1482ahH2Qc6WwLHGKLo.jpg', 16, '', 0, '2007-07-25', 0, '', 1031, '6.85'),
(38, '¡Olvidate de mi!', 'Eternal Sunshine of the Spotless Mind', 'en', '/fprojHGBkecOc6PRNpQhAzmvt7N.jpg', 878, '', 0, '2004-03-19', 0, '', 1534, '7.71'),
(55, 'Amores perros', 'Amores perros', 'es', '/y0bFixL7kjX93o910PO60sCFBwN.jpg', 18, '', 0, '2000-03-14', 0, '', 224, '7.31'),
(58, 'Piratas del Caribe: El cofre del hombre muerto', 'Pirates of the Caribbean: Dead Man´s Chest', 'en', '/oukMfgvEtWUHSJFFwC6jLMmsJeH.jpg', 12, '', 0, '2006-06-20', 0, '', 2782, '6.77'),
(59, 'Una historia de violencia', 'A History of Violence', 'en', '/fxnEGojFDkULYGH0T0vuVHLpBCa.jpg', 18, '', 0, '2005-09-23', 0, '', 315, '6.57'),
(63, 'Doce monos', 'Twelve Monkeys', 'en', '/t86BlXJX0E9jaufdSHddn4UngDp.jpg', 878, '', 0, '1995-12-29', 0, '', 1211, '7.14');
INSERT INTO movie VALUES
(64, 'Hable con ella', 'Hable con ella', 'es', '/9ski8wV9afto07zorx4y8YpKVjW.jpg', 18, '', 0, '2002-03-14', 0, '', 97, '7.16'),
(65, '8 millas', '8 Mile', 'en', '/kTXZzONO4orwLsPss0NoFpEteT8.jpg', 18, '', 0, '2002-11-08', 0, '', 704, '6.71'),
(66, 'Poder absoluto', 'Absolute Power', 'en', '/9fKJfnypqGVpPuZrUE5fzlQywAk.jpg', 80, '', 0, '1997-02-14', 0, '', 70, '6.11'),
(67, 'Paradise Now', 'Paradise Now', 'en', '/ztEEni4ISi8Mv279pFbTg9F9xPX.jpg', 53, '', 0, '2005-02-14', 0, '', 22, '6.25'),
(69, 'En la cuerda floja', 'Walk the Line', 'en', '/iykX90p5drUaJGr7hahmmOSFyHt.jpg', 18, '', 0, '2005-02-17', 0, '', 341, '6.98'),
(70, 'Million Dollar Baby', 'Million Dollar Baby', 'en', '/tNaJoGaZAWarAsyYJNqKYWO8C3e.jpg', 18, '', 0, '2004-12-14', 0, '', 1076, '7.5'),
(71, 'Billy Elliot (Quiero bailar)', 'Billy Elliot', 'en', '/baU1sQWIgmzn7pB7nu88OWPYNiT.jpg', 18, '', 0, '2000-05-18', 0, '', 289, '7.13'),
(73, 'American History X', 'American History X', 'en', '/fXepRAYOx1qC3wju7XdDGx60775.jpg', 18, '', 0, '1998-10-30', 0, '', 1281, '7.92'),
(74, 'La guerra de los mundos', 'War of the Worlds', 'en', '/q6Xzimbek6NW8rhp8tQNDKbe2QB.jpg', 12, '', 0, '2005-06-28', 0, '', 1040, '5.86'),
(75, 'Mars Attacks!', 'Mars Attacks!', 'en', '/xAvETfosu1htnsYYMo3ERj6g9rS.jpg', 35, '', 0, '1996-12-12', 0, '', 614, '6.0'),
(76, 'Antes de amanecer', 'Before Sunrise', 'en', '/pWts2rBxLUg44NExmaKz8FUgkWP.jpg', 18, '', 0, '1995-01-27', 0, '', 437, '7.5'),
(77, 'Memento', 'Memento', 'en', '/rbmYNGwpfT0DiACP7LoMEgGHp3S.jpg', 9648, '', 0, '2000-10-11', 0, '', 1712, '7.82'),
(79, 'Hero', '英雄', 'zh', '/PUSAz3KFayWIThjdgKiOoSQoP0.jpg', 18, '', 0, '2002-12-19', 0, '', 288, '6.9'),
(80, 'Antes del atardecer', 'Before Sunset', 'en', '/4ZRHEbwdzUZUFi2PVk0JGMPDzId.jpg', 18, '', 0, '2004-02-10', 0, '', 352, '7.36');
INSERT INTO movie VALUES
(82, 'Corrupcion en Miami', 'Miami Vice', 'en', '/aOMdjXwFDyLoGtoZGnz8C8UVSLJ.jpg', 28, '', 0, '2006-07-27', 0, '', 239, '5.68'),
(83, 'Open Water', 'Open Water', 'en', '/hua2eluUhiLvKqwHFPV2aTiY8pp.jpg', 18, '', 0, '2004-08-06', 0, '', 114, '5.16'),
(86, 'Las particulas elementales', 'Elementarteilchen', 'de', '/myP4cLnnDhn1l3XRUHEAxcFVTNY.jpg', 10749, '', 0, '2006-02-10', 0, '', 18, '7.08'),
(92, 'Megacities', 'Megacities', 'en', '/yN80Se4PXSLf2xpJPue0D2vhxBr.jpg', 99, '', 0, '1998-08-12', 0, '', 0, '0.0'),
(94, 'Kunstgriff', 'Kunstgriff', 'en', 'null', 35, '', 0, '2002-01-01', 0, '', 0, '0.0'),
(95, 'Armageddon', 'Armageddon', 'en', '/coINnuCzcw5FMHBty8hcudMOBnO.jpg', 28, '', 0, '1998-07-01', 0, '', 1372, '6.36'),
(98, 'Gladiator', 'Gladiator', 'en', '/iEzmvwybdubElRG0MkqHNS5o92.jpg', 28, '', 0, '2000-05-01', 0, '', 3113, '7.62'),
(99, 'Todo sobre mi madre', 'Todo sobre mi madre', 'es', '/8iEC6dpgdzzjEiyv2812eYTHwgB.jpg', 35, '', 0, '1999-04-19', 0, '', 116, '7.16'),
(100, 'Lock & Stock', 'Lock, Stock and Two Smoking Barrels', 'en', '/bB9uquX3Y8eRJL0JtRMBrPkRA4G.jpg', 35, '', 0, '1998-03-05', 0, '', 1052, '7.28'),
(101, 'El profesional (Leon)', 'Leon', 'fr', '/h1Gahx1jbkOSzRzlY7D5JmmO2nK.jpg', 53, '', 0, '1994-09-14', 0, '', 2113, '7.94'),
(102, 'Te quiero para siempre', 'Elsker dig for evigt', 'da', '/oCs6eP76KDA42CAh1aSTta243NV.jpg', 18, '', 0, '2002-09-06', 0, '', 12, '5.42'),
(104, 'Corre, Lola, corre', 'Lola rennt', 'de', '/d7xFHyuLHoNYfMB34kSPtXEfE4P.jpg', 28, '', 0, '1998-08-20', 0, '', 332, '7.08'),
(107, 'Snatch: Cerdos y diamantes', 'Snatch', 'en', '/jbz17PXtjwI9csPlLdnKi3sA7W5.jpg', 53, '', 0, '2000-09-01', 0, '', 1727, '7.52'),
(108, 'Tres colores: Azul', 'Trois couleurs : Bleu', 'en', '/4vDvXLZpn8wIzzBOv7L9pOiV9cF.jpg', 18, '', 0, '1993-01-10', 0, '', 105, '7.51');
INSERT INTO movie VALUES
(109, 'Tres colores: Blanco', 'Trois couleurs : Blanc', 'pl', '/skfmZv31DgqwkBo8ZIODSLfmyPk.jpg', 35, '', 0, '1994-01-26', 0, '', 81, '7.17'),
(110, 'Tres colores: Rojo', 'Trois couleurs : Rouge', 'fr', '/621NpOPzUQleQq4MrgwX7vMZmol.jpg', 18, '', 0, '1994-05-27', 0, '', 89, '7.56'),
(112, 'Italiano para principiantes', 'Italiensk for begyndere', 'da', '/asBxCaQCiqayymEPdWqQULBxUDF.jpg', 35, '', 0, '2000-12-07', 0, '', 13, '6.69'),
(113, 'Primavera, verano, otono, invierno... y primavera', '봄 여름 가을 겨울 그리고 봄', 'en', '/qTLV7wH6CaLCyNeIDjnYDYMgWQs.jpg', 18, '', 0, '2003-09-19', 0, '', 72, '6.91'),
(115, 'El gran Lebowski', 'The Big Lebowski', 'en', '/yLkPGJDPgunINZDxBdQX9lpLmkO.jpg', 35, '', 0, '1998-02-15', 0, '', 1430, '7.56'),
(116, 'Match Point', 'Match Point', 'en', '/iwqeAZm8XCW4bczxlko0TmFMgY5.jpg', 18, '', 0, '2005-05-12', 0, '', 497, '7.07'),
(118, 'Charlie y la fabrica de chocolate', 'Charlie and the Chocolate Factory', 'en', '/tVcI8dqa9Lh7sLuDbWtS2x9GiJk.jpg', 12, '', 0, '2005-07-09', 0, '', 1413, '6.43'),
(120, 'El senor de los anillos: La comunidad del anillo', 'The Lord of the Rings: The Fellowship of the Ring', 'en', '/z99yU71wH7JBHZX4tQ3XzPG521M.jpg', 12, '', 0, '2001-12-18', 0, '', 5381, '7.75'),
(121, 'El senor de los anillos: Las dos torres', 'The Lord of the Rings: The Two Towers', 'en', '/eorEzOVAU2QXbDqh2vAixxVNcfo.jpg', 12, '', 0, '2002-12-18', 0, '', 4476, '7.73'),
(122, 'El senor de los anillos: El retorno del Rey', 'The Lord of the Rings: The Return of the King', 'en', '/yeZ4nYwVmd69EGCn8E2R5uLZ0c6.jpg', 12, '', 0, '2003-12-01', 0, '', 4978, '7.85'),
(128, 'La princesa Mononoke', 'もののけ姫', 'ja', '/8u6LbGES2Y6BgWgcD3AgRDrpy4E.jpg', 12, '', 0, '1997-07-12', 0, '', 871, '8.04');
INSERT INTO movie VALUES
(129, 'El viaje de Chihiro', '千と千尋の神隠し', 'ja', '/nBXNE6w2SakXvOwnZYUOqzV2lP5.jpg', 14, '', 0, '2001-07-20', 0, '', 1850, '8.14'),
(134, 'O Brother!', 'O Brother, Where Art Thou?', 'en', '/sWjC9HaInOg8PhwWDG5OK7U5JKh.jpg', 28, '', 0, '2000-08-30', 0, '', 555, '7.16'),
(137, 'Atrapado en el tiempo', 'Groundhog Day', 'en', '/zgvKavg11JmPkN5J75eFGq8g4Y8.jpg', 10749, '', 0, '1993-02-11', 0, '', 1027, '7.12'),
(139, 'Mifune', 'Mifunes sidste sang', 'da', '/o8LzDhNQZqDewrm4Ky53zRFf7fb.jpg', 10749, '', 0, '1999-03-12', 0, '', 5, '6.2'),
(140, 'La mala educacion', 'La mala educacion', 'es', '/cd2BQxeH5NJXKwnQFhKdFRqd7sI.jpg', 18, '', 0, '2004-03-19', 0, '', 78, '6.76'),
(141, 'Donnie Darko', 'Donnie Darko', 'en', '/elpao58kzfyfuDNZ0YlqMLBQNp2.jpg', 14, '', 0, '2001-01-18', 0, '', 1339, '7.46'),
(142, 'Brokeback Mountain', 'Brokeback Mountain', 'en', '/fSbnl4PENRChBUsl7VDU5HQqD9y.jpg', 18, '', 0, '2005-09-02', 0, '', 621, '7.13'),
(145, 'Rompiendo las olas', 'Breaking the Waves', 'en', '/1OVrzjufHogk3fo4uiGDo2SDZd2.jpg', 18, '', 0, '1996-01-01', 0, '', 65, '6.98'),
(146, 'Tigre y Dragon', '卧虎藏龙', 'zh', '/pqRUEk4piNv73W0ePeffne7XbfX.jpg', 12, '', 0, '2000-10-01', 0, '', 494, '6.91'),
(148, 'La vida secreta de las palabras', 'The Secret Life of Words', 'en', '/kHbeSGfCYO0Sky1zqZPFhTVtO60.jpg', 18, '', 0, '2005-12-15', 0, '', 19, '6.5'),
(153, 'Lost in Translation', 'Lost in Translation', 'en', '/5T8VvuFTdaawKLJk34i69Utaw7o.jpg', 18, '', 0, '2003-08-31', 0, '', 916, '7.29'),
(155, 'El caballero oscuro', 'The Dark Knight', 'en', '/ri63imW8hLi8tP9sZOc1sP1Yk2T.jpg', 18, '', 0, '2008-07-16', 0, '', 7344, '8.02'),
(156, 'Wilbur se quiere suicidar', 'Wilbur begar selvmord', 'da', '/naC1ANPfaKw89kGalme2BrxRCA2.jpg', 35, '', 0, '2002-11-08', 0, '', 10, '6.65');
INSERT INTO movie VALUES
(158, 'Llamando a las puertas', 'Knockin´ On Heaven´s Door', 'de', '/r2geZ6lB01VskHUmrmzGosb0O94.jpg', 35, '', 0, '1997-02-20', 0, '', 56, '7.82'),
(159, 'El hombre deseado', 'Der Bewegte Mann', 'de', '/7UEzKYus31qTtyGDftRhao7kxbb.jpg', 35, '', 0, '1994-10-05', 0, '', 13, '5.96'),
(161, 'Ocean´s Eleven. Hagan juego', 'Ocean´s Eleven', 'en', '/uYzMiksGqFlw3UpajJi0KeADGAH.jpg', 53, '', 0, '2001-12-07', 0, '', 2401, '6.99'),
(163, 'Ocean´s Twelve', 'Ocean´s Twelve', 'en', '/6wM5AftjajrEEiNHLQIsym09wbp.jpg', 53, '', 0, '2004-12-09', 0, '', 1185, '6.36'),
(167, 'K-PAX. Un universo aparte', 'K-PAX', 'en', '/iokED64Us1wtT7ZZnoDVsxEHSHk.jpg', 18, '', 0, '2001-10-22', 0, '', 271, '6.86'),
(170, '28 dias despues...', '28 Days Later...', 'en', '/j7R0KoogQNpM8Ph5sdMIOrps1fi.jpg', 27, '', 0, '2002-10-31', 0, '', 856, '6.88'),
(174, 'Star Trek VI: Aquel pais desconocido', 'Star Trek VI: The Undiscovered Country', 'en', '/ql4KP7lanqvNzn65WU572WqnqrN.jpg', 878, '', 0, '1991-12-05', 0, '', 195, '6.49'),
(176, 'Saw', 'Saw', 'en', '/pyDWSdsZPQlss3SO3W1DYmEm6ZK.jpg', 27, '', 0, '2004-10-01', 0, '', 955, '7.07'),
(177, 'El rey pescador', 'The Fisher King', 'en', '/bb6Nq8EnZ9ulhwyEdyj0kELd5J9.jpg', 18, '', 0, '1991-09-09', 0, '', 129, '6.81'),
(178, 'Volar por los aires', 'Blown Away', 'en', '/x5iijOKmgnA2IjYUewbsBdQohcP.jpg', 18, '', 0, '1994-07-01', 0, '', 39, '5.5'),
(179, 'La interprete', 'The Interpreter', 'en', '/mZfbPqBg7bq4yQo7bCLUnPQrAle.jpg', 28, '', 0, '2005-04-04', 0, '', 161, '6.16'),
(180, 'Minority Report', 'Minority Report', 'en', '/h3lpltSn7Rj1eYTPQO1lYGdw4Bz.jpg', 28, '', 0, '2002-06-20', 0, '', 1364, '6.84'),
(182, 'El buen aleman', 'The Good German', 'en', '/hBUg2h1r4JBYjLp025lRANSwpm2.jpg', 80, '', 0, '2006-12-08', 0, '', 35, '5.63');
INSERT INTO movie VALUES
(184, 'Jackie Brown', 'Jackie Brown', 'en', '/zepEJLgbuFZXVcKFwamQMBIheNL.jpg', 28, '', 0, '1997-12-24', 0, '', 617, '7.1'),
(186, 'El caso Slevin', 'Lucky Number Slevin', 'en', '/wczHNR8ok4qjfunub6fbFpSPK5I.jpg', 18, '', 0, '2006-02-24', 0, '', 680, '7.31'),
(187, 'Sin City', 'Sin City', 'en', '/1sCP6x6MdJ6Tod8f7ZXVFzMlmx9.jpg', 28, '', 0, '2005-03-31', 0, '', 1457, '7.09'),
(189, 'Sin City 2: Una dama por la que matar', 'Sin City: A Dame to Kill For', 'en', '/k80qKrJ0qQ6ocVo5N932stNSg6j.jpg', 80, '', 0, '2014-08-20', 0, '', 747, '6.21'),
(190, 'Das Dorf der Freundschaft', 'Das Dorf der Freundschaft', 'de', 'null', 99, '', 0, '2001-08-25', 0, '', 0, '0.0'),
(191, 'Die innere Sicherheit', 'Die innere Sicherheit', 'de', '/46kjqKENNZTxghcqlHPLDGIpqzt.jpg', 18, '', 0, '2000-09-01', 0, '', 1, '7.0'),
(193, 'Star Trek VII: La proxima generacion', 'Star Trek: Generations', 'en', '/7jEE8HrXrpzT9QV3sJLVL96UF0k.jpg', 878, '', 0, '1994-11-17', 0, '', 228, '6.28'),
(194, 'Amelie', 'Le fabuleux destin d´Amelie Poulain', 'fr', '/3LjyCAILwb2yJeLjWacohgo1lH5.jpg', 35, '', 0, '2001-11-16', 0, '', 1566, '7.72'),
(197, 'Braveheart', 'Braveheart', 'en', '/hWh24dXqtDlHma3m5wOWVpl7GgF.jpg', 28, '', 0, '1995-05-24', 0, '', 1950, '7.48'),
(199, 'Star Trek VIII: Primer contacto', 'Star Trek: First Contact', 'en', '/kCjBIWvoCncBIAepTSHxSXcGGoC.jpg', 878, '', 0, '1996-11-21', 0, '', 372, '6.77'),
(200, 'Star Trek IX: Insurreccion', 'Star Trek: Insurrection', 'en', '/ep2jM3OjXPUzWhGPrrUcCG5mOKx.jpg', 878, '', 0, '1998-12-10', 0, '', 196, '6.16'),
(201, 'Star Trek X: Nemesis', 'Star Trek: Nemesis', 'en', '/7CmKa4wtHtuaa5l2kolHHGC2czH.jpg', 878, '', 0, '2002-12-12', 0, '', 251, '6.03'),
(205, 'Hotel Rwanda', 'Hotel Rwanda', 'en', '/ux6TRpqIOv6h8VJAiDVQBy2LBBH.jpg', 18, '', 0, '2004-09-11', 0, '', 380, '7.19');
INSERT INTO movie VALUES
(206, 'Paradise Found', 'Paradise Found', 'en', '/yyEpqB4yfqHkWerCbeD9UD6ZqRc.jpg', 18, '', 0, '2003-01-01', 0, '', 1, '8.0'),
(211, 'Berlin esta en Alemania', 'Berlin is in Germany', 'de', '/4n8wwJ5ta3FWou0HGwwAKv577RN.jpg', 35, '', 0, '2001-11-01', 0, '', 0, '0.0'),
(214, 'Saw III', 'Saw III', 'en', '/xrGxrhRGa8t45aWo0uAUpsbuici.jpg', 27, '', 0, '2006-10-27', 0, '', 450, '6.04'),
(215, 'Saw II', 'Saw II', 'en', '/iNSKTIFOGdBJGUhg7T7snJQ8ab2.jpg', 27, '', 0, '2005-10-28', 0, '', 506, '6.22'),
(217, 'Indiana Jones y el reino de la calavera de cristal', 'Indiana Jones and the Kingdom of the Crystal Skull', 'en', '/o8EdBfC7tJOPfzMzPNb5Q9fp9lD.jpg', 12, '', 0, '2008-05-21', 0, '', 1312, '5.64'),
(219, 'Volver', 'Volver', 'es', '/hu1ULvA8VLTyLc9NSRzVxoXBilZ.jpg', 35, '', 0, '2006-03-16', 0, '', 175, '7.14'),
(226, 'Boys Don´t Cry', 'Boys Don´t Cry', 'en', '/6bqIZTEuJnUrgnxcymciszvOz8J.jpg', 18, '', 0, '1999-09-02', 0, '', 139, '6.96'),
(231, 'Syriana', 'Syriana', 'en', '/ampsvktUbc8Fu22Aiy31TCfuo1E.jpg', 18, '', 0, '2005-11-23', 0, '', 212, '5.92'),
(236, 'La boda de Muriel', 'Muriel´s Wedding', 'en', '/qToWQ0esOhGE9vfmrL4ULTLGBdl.jpg', 18, '', 0, '1994-09-29', 0, '', 39, '6.19'),
(237, 'Young Adam', 'Young Adam', 'en', '/j5AElm05tPLuSNOeSQQOc3JXA1V.jpg', 18, '', 0, '2003-09-26', 0, '', 12, '5.83'),
(241, 'Asesinos natos', 'Natural Born Killers', 'en', '/61bTbEQkbs0PI3chccVnOSChcwJ.jpg', 80, '', 0, '1994-08-25', 0, '', 406, '6.76'),
(243, 'Alta fidelidad', 'High Fidelity', 'en', '/ptFYSyF3V4fzpDhJNXeCMbIDyvV.jpg', 35, '', 0, '2000-03-17', 0, '', 313, '6.88'),
(245, 'Un nino grande', 'About a Boy', 'en', '/qCeQyQ2fNwj586bb3UBbuxFPUja.jpg', 18, '', 0, '2002-04-26', 0, '', 302, '6.38'),
(246, 'Zatoichi', '座頭市', 'ja', '/xNBsqGjv1hiyelLQdou4G4iVEJj.jpg', 12, '', 0, '2003-09-06', 0, '', 105, '7.15');
INSERT INTO movie VALUES
(250, 'I Kina spiser de hunde', 'I Kina spiser de hunde', 'da', '/3od5xhPu6uwkImEZhHcIwSQQZgk.jpg', 80, '', 0, '1999-09-10', 0, '', 37, '7.43'),
(254, 'King Kong', 'King Kong', 'en', '/d3XdasJUlpdvP3beTaj6nf4jx63.jpg', 12, '', 0, '2005-12-14', 0, '', 1093, '6.32'),
(257, 'Oliver Twist', 'Oliver Twist', 'en', '/4rLv2qrrjD98inSlSz5PEtJpoSK.jpg', 80, '', 0, '2005-09-23', 0, '', 101, '6.63'),
(267, 'Carne Tremula', 'Carne Tremula', 'es', '/5dHXhxAJCD9chOajIQbe6964iWw.jpg', 18, '', 0, '1997-10-28', 0, '', 25, '7.1'),
(270, 'Wir sagen Du! Schatz.', 'Wir sagen Du! Schatz.', 'de', '/9HpZNAs23BHJ37KFy2V65SgWVbh.jpg', 35, '', 0, '2007-11-01', 0, '', 2, '3.75'),
(272, 'Batman Begins', 'Batman Begins', 'en', '/5m3Qqvnbib0wa319nZnpovlUA9e.jpg', 28, '', 0, '2005-06-14', 0, '', 4194, '7.29'),
(273, 'Das weisse Rauschen', 'Das weisse Rauschen', 'en', '/kPY3OULwq3RbubFCMJ3aPyj82uW.jpg', 18, '', 0, '2001-12-31', 0, '', 6, '6.17'),
(274, 'El silencio de los corderos', 'The Silence of the Lambs', 'en', '/gHp2DP7AUdtcXu0ISQ4LnQwzecc.jpg', 80, '', 0, '1991-02-14', 0, '', 2109, '7.76'),
(275, 'Fargo', 'Fargo', 'en', '/75VHq0KMBIU76dmtSWst4wa2Gg7.jpg', 80, '', 0, '1996-04-05', 0, '', 914, '7.54'),
(276, 'Los edukadores', 'Die fetten Jahre sind vorbei', 'de', '/jmjX2tV91uU6GBKUAx3otsYgMBG.jpg', 18, '', 0, '2004-10-25', 0, '', 40, '7.29'),
(277, 'Underworld', 'Underworld', 'en', '/vfuUt7UyIZUiU59FDmAYl7hoDDo.jpg', 14, '', 0, '2003-09-18', 0, '', 1475, '6.45'),
(278, 'Cadena perpetua', 'The Shawshank Redemption', 'en', '/aS2vB15f8Kk1sFqeHRHKyT8GVsQ.jpg', 18, '', 0, '1994-09-10', 0, '', 4953, '8.3'),
(280, 'Terminator 2: El juicio final', 'Terminator 2: Judgment Day', 'en', '/8NdbgRQSUfWZJ8alyY9RWH3j3EH.jpg', 28, '', 0, '1991-07-01', 0, '', 2487, '7.43');
INSERT INTO movie VALUES
(281, 'Dias extranos', 'Strange Days', 'en', '/b8ZXwMqfodUJAxpDMH26lcHr2ct.jpg', 80, '', 0, '1995-10-13', 0, '', 122, '6.52'),
(285, 'Piratas del Caribe: En el fin del mundo', 'Pirates of the Caribbean: At World´s End', 'en', '/2HUVUXFNzvDsXbfFo5SOeE3gNUW.jpg', 12, '', 0, '2007-05-19', 0, '', 2245, '6.72'),
(286, 'Deutschland. Ein Sommermarchen', 'Deutschland. Ein Sommermarchen', 'en', '/4i5GtbhhRbGkvOXrK5ZdFPaHs3F.jpg', 99, '', 0, '2006-10-03', 0, '', 10, '7.25'),
(290, 'Barton Fink', 'Barton Fink', 'en', '/wZYW5nXBvN3j3cPxkZq2Ak5UO4P.jpg', 35, '', 0, '1991-08-01', 0, '', 148, '7.07'),
(291, 'Riding Giants', 'Riding Giants', 'en', '/wjCemDaa3wl1loSMtiWWRURGYc8.jpg', 99, '', 0, '2004-07-09', 0, '', 11, '6.91'),
(292, 'Block Party', 'Dave Chappelle´s Block Party', 'en', '/hemHNgWePU3sYwI9LD7INOJWWBQ.jpg', 35, '', 0, '2005-09-12', 0, '', 14, '6.89'),
(293, 'El rio de la vida', 'A River Runs Through It', 'en', '/lZNKVSuCfwt4PlijD5HuqTgpcjo.jpg', 18, '', 0, '1992-10-09', 0, '', 113, '6.73'),
(296, 'Terminator 3: La rebelion de las maquinas', 'Terminator 3: Rise of the Machines', 'en', '/jQkRboZWeTxGd3EWF6GAfDCKhxe.jpg', 28, '', 0, '2003-07-02', 0, '', 1144, '5.8'),
(297, '¿Conoces a Joe Black?', 'Meet Joe Black', 'en', '/ykpUbG0aYCKn0jTYvnSeI8KptLz.jpg', 14, '', 0, '1998-11-12', 0, '', 547, '6.7'),
(298, 'Ocean´s Thirteen', 'Ocean´s Thirteen', 'en', '/aCoEEeSzxA3R5lwup49lPhzetqn.jpg', 80, '', 0, '2007-06-07', 0, '', 1211, '6.43'),
(300, 'La ciencia del sueno', 'La science des reves', 'fr', '/a4sgAQvZzBgROt2WHT2G7SPOvF1.jpg', 35, '', 0, '2006-02-11', 0, '', 93, '7.01'),
(302, 'Swimming Pool', 'Swimming Pool', 'en', '/mwR0gE6nsxuk8T2Pw2rxQNIRnuc.jpg', 53, '', 0, '2003-05-18', 0, '', 54, '6.25');
INSERT INTO movie VALUES
(306, 'Superdetective en Hollywood 3', 'Beverly Hills Cop III', 'en', '/dvcpitnbEb78noCOVuVfTZMmw1e.jpg', 28, '', 0, '1994-05-24', 0, '', 201, '5.6'),
(308, 'Flores rotas', 'Broken Flowers', 'en', '/hbaM2WExnC8pqRuhz0eh2lDhpFF.jpg', 18, '', 0, '2005-05-17', 0, '', 147, '6.69'),
(309, 'Celebracion', 'Festen', 'da', '/obKCGPGrJhBJPRTbpzvplZPnV1J.jpg', 18, '', 0, '1998-05-20', 0, '', 66, '7.51'),
(310, 'Como Dios', 'Bruce Almighty', 'en', '/uSobFjT1p5FJkfUdly2M1eIXmjC.jpg', 14, '', 0, '2003-05-23', 0, '', 1438, '6.27'),
(312, 'Jenseits der Stille', 'Jenseits der Stille', 'en', '/cWXaGjslNpbyMNinDmDfAVbyrQI.jpg', 18, '', 0, '1996-12-18', 0, '', 5, '5.6'),
(313, 'Snow Cake', 'Snow Cake', 'en', '/2jd8daNxgHAX9rOdxyrnm6yK8py.jpg', 10749, '', 0, '2006-02-09', 0, '', 14, '7.32'),
(314, 'Catwoman', 'Catwoman', 'en', '/3E1XPZ2lZmL4lJV1KSUi1jaSx3w.jpg', 28, '', 0, '2004-07-22', 0, '', 347, '4.32'),
(316, 'Halbe Treppe', 'Halbe Treppe', 'en', '/lmEVpT6sqx5QKrdF206K3CTsEqx.jpg', 35, '', 0, '2002-02-12', 0, '', 3, '6.0'),
(317, 'Grbavica', 'Grbavica', 'en', '/4DbZmFnc4vWAkhoqW0jAOr1zjOn.jpg', 18, '', 0, '2006-01-01', 0, '', 7, '5.21'),
(318, 'El hotel del millon de dolares', 'The Million Dollar Hotel', 'en', '/wiLLKWQjQavXY8ga4kOuiZFbTVa.jpg', 18, '', 0, '2000-02-09', 0, '', 32, '5.5'),
(319, 'Amor a quemarropa', 'True Romance', 'en', '/5tV7cEQ0LIpWBs8nL1zO4xU6YHV.jpg', 28, '', 0, '1993-09-09', 0, '', 323, '7.22'),
(320, 'Insomnio', 'Insomnia', 'en', '/kadwhkdKQKe4ETVdp1eXtQA5Epq.jpg', 80, '', 0, '2002-05-24', 0, '', 464, '6.62'),
(321, 'Mambo italiano', 'Mambo Italiano', 'en', '/owcl2TumuJkeBuXDeKR9QFHiZCv.jpg', 35, '', 0, '2003-06-06', 0, '', 12, '5.33'),
(322, 'Mystic River', 'Mystic River', 'en', '/dZfbIjmrICVwIyyflxGaQ6hvVMu.jpg', 53, '', 0, '2003-10-07', 0, '', 596, '7.35');
INSERT INTO movie VALUES
(326, 'Serpientes en el avion', 'Snakes on a Plane', 'en', '/eQOQr5EUFj4ACh4rhnZR5rEcqV.jpg', 28, '', 0, '2006-08-06', 0, '', 192, '5.05'),
(327, 'Brother', 'Brother', 'ja', '/zcnznSvHqAcLJ9Cm6XM202gS7yO.jpg', 80, '', 0, '2000-09-09', 0, '', 38, '6.39'),
(329, 'Parque Jurasico', 'Jurassic Park', 'en', '/tX5nE2Ch6eSNxuUnN3XfDBLncZu.jpg', 12, '', 0, '1993-06-11', 0, '', 2656, '7.3'),
(330, 'El mundo perdido (Jurassic Park)', 'The Lost World: Jurassic Park', 'en', '/7mKLzGL3GRYwMlaolWGJVnYAE3b.jpg', 12, '', 0, '1997-05-23', 0, '', 1461, '6.05'),
(331, 'Parque Jurasico III', 'Jurassic Park III', 'en', '/rRV2MR6o9aRxJg8gIDA7AbZEjZN.jpg', 12, '', 0, '2001-07-18', 0, '', 1191, '5.62'),
(332, 'Inspector Gadget', 'Inspector Gadget', 'en', '/rT2HSz3yKaiDgwCMl8J96HQ9mXM.jpg', 28, '', 0, '1999-07-23', 0, '', 129, '4.3'),
(333, 'Bollywood/Hollywood', 'Bollywood/Hollywood', 'en', '/n8J2PfCcgErDWSMhjdmJBBmQIDY.jpg', 18, '', 0, '2002-01-01', 0, '', 2, '5.25'),
(334, 'Magnolia', 'Magnolia', 'en', '/jryc26shEkkDJbPx1SrEOWvSgRg.jpg', 18, '', 0, '1999-12-08', 0, '', 348, '7.23'),
(337, 'El senor Ibrahim y las flores del Coran', 'Monsieur Ibrahim et les fleurs du Coran', 'en', '/dS14phdtxIeW1J3Uebq8B02OYqN.jpg', 18, '', 0, '2003-12-03', 0, '', 15, '6.63'),
(338, 'Good bye, Lenin!', 'Good bye, Lenin!', 'de', '/yrfwsb74bvlWztjibADw7SoAvoN.jpg', 35, '', 0, '2003-02-09', 0, '', 274, '7.22'),
(339, 'Noche en la tierra', 'Night on Earth', 'en', '/jX8hZB8uYbZgm2VHKYlXPtmc1Tc.jpg', 18, '', 0, '1991-10-03', 0, '', 56, '7.5'),
(340, 'Todo esta iluminado', 'Everything is Illuminated', 'en', '/yz22ehLYFmZemRnnDNbJWKWabh1.jpg', 18, '', 0, '2005-09-16', 0, '', 97, '7.49'),
(341, 'A Crime', 'A Crime', 'en', '/fD5GpnUYZ7jYSUHLAWnlo3Mu8mF.jpg', 80, '', 0, '2006-09-11', 0, '', 2, '7.5');
INSERT INTO movie VALUES
(342, 'Tormenta de verano', 'Sommersturm', 'en', '/icfGUZBHBe83eMVay7mMZcFOjnP.jpg', 35, '', 0, '2004-09-02', 0, '', 26, '6.52'),
(344, 'Bang Boom Bang - Ein todsicheres Ding', 'Bang Boom Bang - Ein todsicheres Ding', 'de', '/kygnsfdP8wnMa2DBp9gloNSk69L.jpg', 80, '', 0, '1999-08-26', 0, '', 30, '7.28'),
(345, 'Eyes Wide Shut', 'Eyes Wide Shut', 'en', '/vZ3YJI7gNWY777vLtdeIDUJlqHG.jpg', 18, '', 0, '1999-07-14', 0, '', 488, '6.74'),
(349, 'Crustaces et coquillages', 'Crustaces et coquillages', 'fr', '/fiEeFoPRgXLhcynO1bvDuScOszT.jpg', 35, '', 0, '2005-03-30', 0, '', 6, '4.33'),
(350, 'El diablo viste de Prada', 'The Devil Wears Prada', 'en', '/vXCPppbIkg7yyEsSksdhwCx3vf6.jpg', 35, '', 0, '2006-06-30', 0, '', 1374, '6.9'),
(351, 'Sehnsucht', 'Sehnsucht', 'en', '/A9bkDs8e6c2sQdnHYJL4EU1VWyS.jpg', 18, '', 0, '2006-02-15', 0, '', 0, '0.0'),
(363, 'Contra la pared', 'Gegen die Wand', 'de', '/pWtiFfRGADUv9s4bqgKWSqdVxk9.jpg', 18, '', 0, '2004-03-11', 0, '', 42, '6.74'),
(364, 'Batman vuelve', 'Batman Returns', 'en', '/XVx0MIZq9rVWZHstxqTJwoFj00.jpg', 28, '', 0, '1992-06-19', 0, '', 755, '6.49'),
(388, 'Plan oculto', 'Inside Man', 'en', '/iHg21PgtCQyRCNQFnyLPNmHi51A.jpg', 80, '', 0, '2006-03-23', 0, '', 790, '7.13'),
(390, 'Lisboa Story', 'Lisbon Story', 'pt', '/hX1q1FrNAKzTBTjmxz6PEWPxpZd.jpg', 18, '', 0, '1994-12-16', 0, '', 5, '7.8'),
(392, 'Chocolat', 'Chocolat', 'en', '/8ngQoMWcDLQwtYB5nqAz8R1lK0F.jpg', 35, '', 0, '2000-12-14', 0, '', 433, '6.6'),
(393, 'Kill Bill. Volume 2', 'Kill Bill: Vol. 2', 'en', '/rt0XVPyPxu3Zh7dsd58cliyvdjN.jpg', 28, '', 0, '2004-04-16', 0, '', 1918, '7.46'),
(395, 'Alien vs Predator', 'AVP: Alien vs. Predator', 'en', '/h7dh0iXRkcmhRLWuiYz4t55bA9f.jpg', 12, '', 0, '2004-08-13', 0, '', 600, '5.52');
INSERT INTO movie VALUES
(397, 'French Kiss', 'French Kiss', 'en', '/bZqvonwVru1XtnniQZgZRa3Znyk.jpg', 35, '', 0, '1995-05-05', 0, '', 74, '6.01'),
(398, 'Truman Capote', 'Capote', 'en', '/klbnGQ9OlFRzuLDtP9FSGkwepGp.jpg', 80, '', 0, '2005-09-30', 0, '', 156, '6.54'),
(400, 'Cosas que hacer en Denver cuando estas muerto', 'Things to Do in Denver When You´re Dead', 'en', '/3Q3h5TWlyVInl8MA0bzG5cU40or.jpg', 18, '', 0, '1995-12-01', 0, '', 23, '6.72'),
(401, 'Algo en comun', 'Garden State', 'en', '/uACHgh7F7PfH0wabdN6hGX7lalj.jpg', 18, '', 0, '2004-01-16', 0, '', 294, '7.07'),
(402, 'Instinto basico', 'Basic Instinct', 'en', '/lqGwwRlTK6xKn7x5NdfMJsnTh1F.jpg', 53, '', 0, '1992-03-20', 0, '', 363, '6.3'),
(404, 'Una historia verdadera', 'The Straight Story', 'en', '/vl1JiGjf5TqEkG0BJSJ0cgzfRpl.jpg', 18, '', 0, '1999-10-15', 0, '', 84, '7.33'),
(406, 'El odio', 'La Haine', 'fr', '/4RPVJm8as2XBnBytcysPprV96bb.jpg', 18, '', 0, '1995-05-31', 0, '', 269, '7.74'),
(407, 'Corto y con filo', 'Kurz und schmerzlos', 'de', '/onVAfvszXtUtMM68BtWGAiKZtBa.jpg', 18, '', 0, '1998-10-15', 0, '', 4, '6.13'),
(409, 'El paciente ingles', 'The English Patient', 'en', '/agQjt1jj89pqeRgSvGZzEeljC1P.jpg', 18, '', 0, '1996-11-14', 0, '', 231, '6.89'),
(410, 'Verano en el balcon', 'Sommer vorm Balkon', 'de', '/hJR2yhAMywVwguGr9JJqZDNGMgH.jpg', 18, '', 0, '2005-09-09', 0, '', 4, '6.5'),
(411, 'Las cronicas de Narnia: El leon, la bruja y el armario', 'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe', 'en', '/n5A5jAMBAaiV1gzp458IBjQuyQH.jpg', 12, '', 0, '2005-12-07', 0, '', 1149, '6.43'),
(414, 'Batman Forever', 'Batman Forever', 'en', '/eTMrHEhlFPHNxpqGwpGGTdAa0xV.jpg', 14, '', 0, '1995-05-31', 0, '', 733, '5.24'),
(415, 'Batman y Robin', 'Batman & Robin', 'en', '/79AYCcxw3kSKbhGpx1LiqaCAbwo.jpg', 14, '', 0, '1997-06-20', 0, '', 682, '4.4');
INSERT INTO movie VALUES
(419, 'Vom Suchen und Finden der Liebe', 'Vom Suchen und Finden der Liebe', 'de', '/mD2WOSxCe1kDSFpelSc2riJz5JC.jpg', 35, '', 0, '2005-01-27', 0, '', 3, '6.5'),
(421, 'Life Aquatic', 'The Life Aquatic With Steve Zissou', 'en', '/kKwNRePEqTfC6DnNlJzz1yX44iR.jpg', 12, '', 0, '2004-12-10', 0, '', 356, '7.08'),
(423, 'El pianista', 'The Pianist', 'en', '/xbU9iOX7EmrgmB1doVPZUlrEqxv.jpg', 18, '', 0, '2002-09-24', 0, '', 740, '7.86'),
(424, 'La lista de Schindler', 'Schindler´s List', 'en', '/f1faQoRj4bhoseJBkHqjrVxn7kC.jpg', 18, '', 0, '1993-11-29', 0, '', 2142, '8.03'),
(425, 'Ice Age. La edad de hielo', 'Ice Age', 'en', '/pns6bje2LaRyH0deXs7LeJtLh6P.jpg', 16, '', 0, '2002-03-26', 0, '', 1926, '6.84'),
(428, 'Sommer ´04', 'Sommer ´04', 'de', '/isEfW9iwhyfmL7gXAVvyymSNl9Z.jpg', 18, '', 0, '2006-10-11', 0, '', 1, '5.0'),
(431, 'Cube', 'Cube', 'en', '/9k5prSz00Xaek0pwcqelOx52PFZ.jpg', 53, '', 0, '1997-09-09', 0, '', 432, '6.69'),
(434, 'Knallhart', 'Knallhart', 'de', '/ubHBjbsA00zXmVpFewZE8ftJ9u7.jpg', 18, '', 0, '2006-03-09', 0, '', 6, '7.17'),
(435, 'El dia de manana', 'The Day After Tomorrow', 'en', '/4dCh5tTu241jylxFMVvT940TGd2.jpg', 28, '', 0, '2004-05-26', 0, '', 1197, '6.08'),
(436, 'Maria, llena eres de gracia', 'Maria, llena eres de gracia', 'es', '/s9xK1tr8e6nFv8mxNpqZcOHEOnh.jpg', 18, '', 0, '2004-01-18', 0, '', 45, '6.49'),
(437, 'Cube 2: Hypercube', 'Cube 2: Hypercube', 'en', '/6tPa2kvzsvOQTXK1JNO2JN9quBV.jpg', 53, '', 0, '2002-04-15', 0, '', 149, '5.38'),
(438, 'Cube Zero', 'Cube Zero', 'en', '/tdWhhfFe5taRCUlUvdbLqpSMfDj.jpg', 9648, '', 0, '2004-10-15', 0, '', 97, '5.52'),
(440, 'Aliens vs. Predator 2', 'Aliens vs Predator: Requiem', 'en', '/jjPqORyHyzKKc2vDJsGceyZwLDS.jpg', 14, '', 0, '2007-12-25', 0, '', 365, '4.93');