
CREATE DATABASE posts;

\c posts

CREATE TABLE post(
  id_post SERIAL PRIMARY KEY,
  name_user VARCHAR(35),
  creation_date DATE,
  content VARCHAR(50),
  descrip VARCHAR(150)
);

INSERT INTO post(name_user, creation_date, content, descrip) VALUES
('Pamela', '2021-01-19', 'foto', 'foto de mi gatito tomando sol' ),
('Pamela', '2021-01-20', 'compartiendo meme de pagina de fb', 'akajkajaj que chistoso'),
('Carlos','2021-01-20', 'compartiendo meme de Pamela', 'meme del dia')
;

ALTER TABLE post ADD COLUMN title VARCHAR(20);

UPDATE post
SET title='mi michi' 
WHERE id_post=1;

UPDATE post
SET title='chems' 
WHERE id_post=2
OR id_post=3;

INSERT INTO post(name_user, creation_date, content, descrip, title) VALUES
('Pedro', '2021-01-16', 'musica de youtube', 'como amo este remix', 'remix playero'),
('Pedro', '2021-01-20', 'me encantan estos sabados de flojera', 'es miercoles homero', 'meme de homero');

DELETE FROM post WHERE name_user='Carlos';

INSERT INTO post(name_user, creation_date, content, descrip, title) VALUES
('Carlos', '2021-01-20', 'post en el muro', 'sin querer elimine el meme del chems, alguien que me lo envie plis', 'se siente despistado');


CREATE TABLE coments(
  id_comnets SERIAL,
  creation_date TIMESTAMP,
  content VARCHAR(150),
  id_asign INTEGER REFERENCES post(id_post)
);

INSERT INTO coments(creation_date, content, id_asign) VALUES
('2021-01-19 15:33:00', 'que hermosa tu michi!',1),
('2021-01-19 15:42:00', 'que gordita <3', 1),
('2021-01-20 17:21:00', 'que pavo!', 6),
('2021-01-20 17:05:00', 'pasan que cosas', 6),
('2021-01-20 21:15:00', 'cual meme?', 6),
('2021-01-21 22:48:00', 'creo que pamela lo subio', 6);

INSERT INTO post(name_user, creation_date, content, descrip, title) VALUES
('Margarita', '2021-01-21', 'post en el muro', 'que buen capitulo de la serie!!! no puedo esperar hasta las proxima semana', 'mejor capitulo');

INSERT INTO coments(creation_date, content, id_asign) VALUES
('2021-01-21 15:33:00', 'fue brutaaaal!',7),
('2021-01-21 15:42:00', 'yo lei el manga y ahora se viene lo bueno', 7),
('2021-01-21 17:21:00', 'no te encariñes con el personaje, que se muere', 7),
('2021-01-21 17:05:00', 'como se va a morir!! si anunciaron la segunda temporada!', 7),
('2021-01-21 21:21:21', 'hoy estamos en el ciglo 21, en el a;o 21,son las 21 horas con 21 minutos y 21 segundos', 7);