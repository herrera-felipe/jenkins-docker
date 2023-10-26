CREATE TABLE usuarios (
	id serial PRIMARY KEY,
	nombre VARCHAR (100),
	email VARCHAR (100)
);

INSERT INTO usuarios (nombre, email) VALUES ('Felipe', 'random@mail.com');
INSERT INTO usuarios (nombre, email) VALUES ('Andres', 'test@mail.com');
