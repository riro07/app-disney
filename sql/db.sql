
-- CREACIÓN DE TABLAS
-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.genero
(
    id integer NOT NULL,
    nombre character varying,
    imagen boolean,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.peliyseri
(
    id integer NOT NULL,
    titulo character varying,
    imagen boolean,
    calificacion numeric,
    "fechaCreacion" numeric,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.personaje
(
    id integer NOT NULL,
    nombre character varying,
    edad numeric,
    peso numeric,
    historia character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.peliyseri_genero
(
    id_peliyseri integer NOT NULL,
    id_genero integer NOT NULL,
    PRIMARY KEY (id_peliyseri, id_genero)
);

CREATE TABLE IF NOT EXISTS public.personaje_peliyseri
(
    peliyseri_id integer NOT NULL,
    personaje_id integer NOT NULL,
    PRIMARY KEY (peliyseri_id, personaje_id)
);

ALTER TABLE public.personaje_peliyseri
    ADD FOREIGN KEY (peliyseri_id)
    REFERENCES public.peliyseri (id)
    NOT VALID;


ALTER TABLE public.personaje_peliyseri
    ADD FOREIGN KEY (personaje_id)
    REFERENCES public.personaje (id)
    NOT VALID;


ALTER TABLE public.peliyseri_genero
    ADD FOREIGN KEY (id_peliyseri)
    REFERENCES public.peliyseri (id)
    NOT VALID;


ALTER TABLE public.peliyseri_genero
    ADD FOREIGN KEY (id_genero)
    REFERENCES public.genero (id)
    NOT VALID;

END;

-- CREACIÓN DE PERSONAJES

-- select * from personaje
insert into personaje 
values (1,'shrek', 35, 140, 'shrek y sus amigos viven grandes aventuras'),
(2, 'fiona', 29, 100, 'fiona y sus amigos viven grandes aventuras'),
(3, 'burro', 23, 50, 'burro y sus amigos viven grandes aventuras'),
(4, 'gato con botas', 23, 5, 'el gato con botas vive grandes aventuras junto a sus amigos'),
(5,'jack sparrow', 35, 75, 'jack sparrow vive grandes aventuras'),
(6, 'elizabeth swann', 26, 60, 'elizabeth swann vive grandes aventuras');
-- CREACIÓN DE PELICULAS

-- select * from peliyseri
insert into peliyseri
values (1,'shrek 1', false, 10,'19/07/2001'),
(2, 'shrek 2', false, 9, '17/06/2004'),
(3, 'shrek 3', false, 10, '18/05/2007'),
(4,'piratas del caribe 1', false, 10,'19/07/2003'),
(5, 'piratas del caribe 2', false, 9, '19/06/2006');

-- CREACIÓN DE GENERO

-- select * from genero
insert into genero
values (1,'comedia', false),
(2, 'aventura', false);

-- PETICIONES

-- shrek en cuantas peliculas actuo?
select personaje.nombre, peliyseri.titulo from personaje cross join peliyseri
where personaje.nombre = 'shrek' and peliyseri.id <= 3;

-- En la pelicula shrek 1 quienes actuaron?
select peliyseri.titulo, personaje.nombre from personaje cross join peliyseri
where peliyseri.titulo = 'shrek 1' and personaje.id <= 4;

-- cuales son las peliculas dentro del genero comedia?
select genero.nombre, peliyseri.titulo from genero cross join peliyseri
where genero.nombre = 'comedia' AND peliyseri.id <= 3;

-- jack sparrow en cuantas peliculas actuo?
select personaje.nombre, peliyseri.titulo from personaje cross join peliyseri
where personaje.nombre = 'jack sparrow' and peliyseri.id between 4 and 5;

-- en la pelicula piratas del caribe 1 quienes actuaron?
select peliyseri.titulo, personaje.nombre from peliyseri cross join personaje
where peliyseri.titulo = 'piratas del caribe 1' and personaje.id between 5 and 6;

-- cuales son las peliculas dentro del genero aventura?
select genero.nombre, peliyseri.titulo from genero cross join peliyseri
where genero.nombre = 'aventura' and peliyseri.id between 4 and 5;