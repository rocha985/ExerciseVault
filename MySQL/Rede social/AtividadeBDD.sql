CREATE DATABASE aula05;

CREATE TABLE usuario (
   id_usuario SERIAL PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   data_cadastro DATE NOT NULL,
);

CREATE TABLE post (
   id_post SERIAL PRIMARY KEY,
   id_usuario INT REFERENCES usuario(id_usuario),
   conteudo VARCHAR(280) NOT NULL,
   data_postagem DATE NOT NULL
);

CREATE TABLE login (
   id_usuario INT PRIMARY KEY REFERENCES usuario(id_usuario),
   email VARCHAR(320) NOT NULL,
   senha VARCHAR(60) NOT NULL
);

CREATE TABLE comentarios (
   id_comentario SERIAL PRIMARY KEY,
   id_usuario INT NOT NULL REFERENCES usuario(id_usuario),
   id_post INT NOT NULL REFERENCES post(id_post),
   conteudo TEXT NOT NULL,
   data_comentario DATE NOT NULL
);

CREATE TABLE seguidores (
    id_seguir SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuario(id_usuario),
    id_seguido INT NOT NULL REFERENCES usuario(id_usuario)
);

INSERT INTO usuario (nome, email) VALUES ('matheus', 'cruz.rocha@aluno.ifsp.edu.br');





