DROP TABLE IF EXISTS peliculas_actores;
DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS peliculas;
DROP TABLE IF EXISTS tematicas;

CREATE TABLE tematicas
(
	codigo SERIAL PRIMARY KEY,
	descripcion VARCHAR(50)
);

CREATE TABLE peliculas
(
	codigo SERIAL PRIMARY KEY,
	titulo VARCHAR(50),
	tematica INTEGER,
	CONSTRAINT fk_peliculas_tematicas FOREIGN KEY
	(tematica) REFERENCES tematicas(codigo)
);

CREATE TABLE actores
(
	codigo SERIAL PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE peliculas_actores
(
	pelicula INTEGER NOT NULL,
	actor INTEGER NOT NULL,
	PRIMARY KEY (pelicula,actor),
	CONSTRAINT fk_peliculas FOREIGN KEY
	(pelicula) REFERENCES peliculas(codigo),
	CONSTRAINT fk_actores FOREIGN KEY
	(actor) REFERENCES actores(codigo)
);

INSERT INTO tematicas (descripcion) values ('Terror');
INSERT INTO tematicas (descripcion) values ('Comedia');
INSERT INTO tematicas (descripcion) values ('Aventuras');
INSERT INTO peliculas (titulo,tematica) values ('ESDLA', 3);
INSERT INTO peliculas (titulo,tematica) values ('El resplandor', 1);
INSERT INTO peliculas (titulo,tematica) values ('Indiana Jones', 3);
INSERT INTO actores (nombre) values ('Harrison Ford');
INSERT INTO actores (nombre) values ('Jack Nicholson');
INSERT INTO actores (nombre) values ('Liv Tayler');
INSERT INTO actores (nombre) values ('Viggo Mortensen');
INSERT INTO peliculas_actores (pelicula,actor) values (1,3);
INSERT INTO peliculas_actores (pelicula,actor) values (1,4);
INSERT INTO peliculas_actores (pelicula,actor) values (2,2);
INSERT INTO peliculas_actores (pelicula,actor) values (3,1);