CREATE DATABASE aula06;

--Recrie o banco de dados da tarefa passada e insira os dados.

CREATE TABLE usuario (
   id_usuario SERIAL PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   data_cadastro DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE post (
   id_post SERIAL PRIMARY KEY,
   id_usuario INT REFERENCES usuario(id_usuario),
   conteudo VARCHAR(280) NOT NULL,
   data_postagem DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
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
   data_comentario DATE NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE seguidores (
    id_seguir SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuario(id_usuario),
    id_seguido INT NOT NULL REFERENCES usuario(id_usuario)
);

--adicione mais dados (pelo menos 20 linhas por tabela)

INSERT INTO usuario (nome, email) VALUES
('Matheus Rocha', 'cruz.rocha@aluno.ifsp.edu.br'),
('Bruno Ribeiro', 'bruno.ribeiro@example.com'),
('Carla Souza', 'carla.souza@example.com'),
('Daniel Costa', 'daniel.costa@example.com'),
('Eduarda Lima', 'eduarda.lima@example.com'),
('Felipe Rocha', 'felipe.rocha@example.com'),
('Gabriela Santos', 'gabriela.santos@example.com'),
('Hugo Pereira', 'hugo.pereira@example.com'),
('Isabela Martins', 'isabela.martins@example.com'),
('John Mendes', 'john.mendes@example.com'),
('Karina Ferreira', 'karina.ferreira@example.com'),
('Leonardo Alves', 'leonardo.alves@example.com'),
('Mariana Ribeiro', 'mariana.ribeiro@example.com'),
('Nicolas Gomes', 'nicolas.gomes@example.com'),
('Olga Dias', 'olga.dias@example.com'),
('Pedro Araújo', 'pedro.araujo@example.com'),
('Quésia Nascimento', 'quesia.nascimento@example.com'),
('Rafael Cardoso', 'rafael.cardoso@example.com'),
('Sofia Lima', 'sofia.lima@example.com'),
('Thiago Teixeira', 'thiago.teixeira@example.com'),
('Ulisses Gomes', 'ulisses.gomes@example.com'),
('Vanessa Martins', 'vanessa.martins@example.com'),
('Wellington Santos', 'wellington.santos@example.com'),
('Yasmin Alves', 'yasmin.alves@example.com'),
('Zé Carlos', 'ze.carlos@example.com');


INSERT INTO post (id_usuario, conteudo) VALUES
(1, 'Hoje foi um ótimo dia!'),
(2, 'Aprendendo SQL, muito interessante!'),
(3, 'Aproveitei o fim de semana para relaxar.'),
(4, 'Fui ao cinema e assisti um filme incrível.'),
(5, 'Vamos fazer um churrasco no próximo sábado!'),
(6, 'Estou lendo um livro fascinante.'),
(7, 'Comprei um novo gadget e estou adorando!'),
(8, 'Estou me preparando para a maratona.'),
(9, 'Descobri uma nova receita deliciosa!'),
(10, 'Hoje é dia de limpeza e organização.'),
(11, 'Fui ao parque e tirei várias fotos lindas.'),
(12, 'Participei de um workshop de programação.'),
(13, 'A primavera chegou e as flores estão lindas!'),
(14, 'Estou pensando em viajar nas férias.'),
(15, 'Foi um dia cansativo, mas produtivo.'),
(16, 'Fiz um bolo de chocolate incrível!'),
(17, 'Estou viciado em uma nova série.'),
(18, 'Hoje eu fui à academia e me senti ótimo!'),
(19, 'Quero aprender a tocar um novo instrumento.'),
(20, 'Estou planejando um encontro com amigos.');


INSERT INTO login (id_usuario, email, senha) VALUES
(1, 'cruz.rocha@aluno.ifsp.edu.br', 'senhaMatheus123'),
(2, 'bruno.ribeiro@example.com', 'senhaBruno456'),
(3, 'carla.souza@example.com', 'senhaCarla789'),
(4, 'daniel.costa@example.com', 'senhaDaniel321'),
(5, 'eduarda.lima@example.com', 'senhaEduarda654'),
(6, 'felipe.rocha@example.com', 'senhaFelipe987'),
(7, 'gabriela.santos@example.com', 'senhaGabriela111'),
(8, 'hugo.pereira@example.com', 'senhaHugo222'),
(9, 'isabela.martins@example.com', 'senhaIsabela333'),
(10, 'john.mendes@example.com', 'senhaJohn444'),
(11, 'karina.ferreira@example.com', 'senhaKarina555'),
(12, 'leonardo.alves@example.com', 'senhaLeonardo666'),
(13, 'mariana.ribeiro@example.com', 'senhaMariana777'),
(14, 'nicolas.gomes@example.com', 'senhaNicolas888'),
(15, 'olga.dias@example.com', 'senhaOlga999'),
(16, 'pedro.araujo@example.com', 'senhaPedro000'),
(17, 'quesia.nascimento@example.com', 'senhaQuesia111'),
(18, 'rafael.cardoso@example.com', 'senhaRafael222'),
(19, 'sofia.lima@example.com', 'senhaSofia333'),
(20, 'thiago.teixeira@example.com', 'senhaThiago444'),
(21, 'ulisses.gomes@example.com', 'senhaUlisses111'),
(22, 'vanessa.martins@example.com', 'senhaVanessa222'),
(23, 'wellington.santos@example.com', 'senhaWellington333'),
(24, 'yasmin.alves@example.com', 'senhaYasmin444'),
(25, 'ze.carlos@example.com', 'senhaZe555');


INSERT INTO comentarios (id_usuario, id_post, conteudo) VALUES
(1, 1, 'Que dia maravilhoso, Matheus!'),
(2, 2, 'Aprender SQL é muito divertido!'),
(3, 3, 'Relaxar é essencial, Carla!'),
(4, 4, 'Filmes bons são sempre uma ótima escolha!'),
(5, 5, 'Churrasco é sempre uma boa ideia!'),
(6, 6, 'Qual livro você está lendo, Felipe?'),
(7, 7, 'Que gadget você comprou, Gabriela?'),
(8, 8, 'Boa sorte na maratona, Hugo!'),
(9, 9, 'Qual receita? Estou curioso!'),
(10, 10, 'Organização faz maravilhas, John!'),
(11, 11, 'Adoro tirar fotos no parque, Karina!'),
(12, 12, 'Workshop de programação é incrível!'),
(13, 13, 'As flores estão lindas mesmo, Mariana!'),
(14, 14, 'Onde você quer viajar, Nicolas?'),
(15, 15, 'Cansativo, mas produtivo é o melhor!'),
(16, 16, 'Bolo de chocolate é meu favorito!'),
(17, 17, 'Qual série você está assistindo, Ulisses?'),
(18, 18, 'Academia é um ótimo jeito de se sentir bem!'),
(19, 19, 'Que instrumento você quer aprender, Vanessa?'),
(20, 20, 'Encontros com amigos são sempre bons!');


INSERT INTO seguidores (id_usuario, id_seguido) VALUES
(1, 2), (1, 3), (1, 4), (1, 5), (1, 6),
(1, 7), (1, 8), (1, 9), (1, 10), (1, 11),
(2, 3), (2, 4), (2, 5), (2, 6), (2, 7),
(2, 8), (2, 9), (2, 10), (2, 11), (2, 12),
(3, 1), (3, 2), (3, 4), (3, 5), (3, 6),
(3, 7), (3, 8), (3, 9), (3, 10), (3, 11),
(4, 5), (4, 6), (4, 7), (4, 8), (4, 9),
(4, 10), (4, 11), (4, 12), (4, 13), (4, 14),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 6),
(5, 7), (5, 8), (5, 9), (5, 10), (5, 11),
(6, 1), (6, 2), (6, 3), (6, 4), (6, 5),
(6, 7), (6, 8), (6, 9), (6, 10), (6, 11),
(7, 1), (7, 2), (7, 3), (7, 4), (7, 5),
(7, 6), (7, 8), (7, 9), (7, 10), (7, 11),
(8, 1), (8, 2), (8, 3), (8, 4), (8, 5),
(8, 6), (8, 7), (8, 9), (8, 10), (8, 11),
(9, 1), (9, 2), (9, 3), (9, 4), (9, 5),
(9, 6), (9, 7), (9, 8), (9, 10), (9, 11),
(10, 1), (10, 2), (10, 3), (10, 4), (10, 5),
(10, 6), (10, 7), (10, 8), (10, 9), (10, 12),
(11, 1), (11, 2), (11, 3), (11, 4), (11, 5),
(11, 6), (11, 7), (11, 8), (11, 9), (11, 10),
(12, 2), (12, 3), (12, 4), (12, 5), (12, 6),
(12, 7), (12, 8), (12, 9), (12, 10), (12, 11),
(13, 1), (13, 3), (13, 4), (13, 5), (13, 6),
(13, 7), (13, 8), (13, 9), (13, 10), (13, 14),
(14, 1), (14, 3), (14, 5), (14, 6), (14, 7),
(14, 8), (14, 9), (14, 10), (14, 11), (14, 15),
(15, 2), (15, 4), (15, 6), (15, 7), (15, 8),
(15, 9), (15, 10), (15, 11), (15, 12), (15, 13),
(16, 5), (16, 6), (16, 7), (16, 8), (16, 9),
(16, 10), (16, 11), (16, 12), (16, 13), (16, 14),
(17, 3), (17, 4), (17, 5), (17, 6), (17, 8),
(17, 9), (17, 10), (17, 11), (17, 12), (17, 15),
(18, 1), (18, 3), (18, 4), (18, 5), (18, 6),
(18, 7), (18, 8), (18, 9), (18, 10), (18, 11),
(19, 2), (19, 3), (19, 4), (19, 5), (19, 6),
(19, 7), (19, 8), (19, 9), (19, 10), (19, 11),
(20, 1), (20, 2), (20, 3), (20, 4), (20, 5),
(20, 6), (20, 7), (20, 8), (20, 9), (20, 10),
(21, 1), (21, 3), (21, 5), (21, 6), (21, 8),
(21, 9), (21, 10), (21, 11), (21, 12), (21, 14),
(22, 4), (22, 5), (22, 6), (22, 7), (22, 8),
(22, 9), (22, 10), (22, 11), (22, 12), (22, 15),
(23, 1), (23, 3), (23, 4), (23, 5), (23, 6),
(23, 7), (23, 8), (23, 9), (23, 10), (23, 11),
(24, 1), (24, 2), (24, 3), (24, 4), (24, 5),
(24, 6), (24, 7), (24, 8), (24, 9), (24, 10),
(25, 1), (25, 2), (25, 3), (25, 4), (25, 5),
(25, 6), (25, 7), (25, 8), (25, 9), (25, 10);

--DELETE:

DELETE FROM comentarios WHERE id_comentario = 3;

--UPDATE:

UPDATE comentarios SET id_usuario = 5 WHERE id_comentario = 10;

--Selecione todos os usuários:

SELECT * FROM usuario;

--Selecione usuários que não têm ‘a’ no nome:

SELECT * FROM usuario WHERE LOWER(nome) NOT LIKE '%a%';

--Selecione quantos seguidores cada usuário tem 

SELECT usuario.nome AS nome_usuario, COUNT(seguidores.id_usuario) AS num_seguidores
FROM usuario
LEFT JOIN seguidores ON usuario.id_usuario = seguidores.id_seguido
GROUP BY usuario.nome
ORDER BY num_seguidores DESC;







