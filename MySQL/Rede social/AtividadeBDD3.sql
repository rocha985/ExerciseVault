--Considerando um sistema com paginação mostrando 10 posts por página,
--como seria a consulta para ver os posts da segunda página ordenado por 
--ordem do mais recente para o mais antigo?

SELECT * FROM usuario
ORDER BY data_cadastro DESC
LIMIT 10 OFFSET 10


--Conte quantos seguidores cada usuário tem, mostrando o nome do usuário e número de seguidores

SELECT 
	u.nome,
	COUNT (s.id_seguido) AS num_seguidores
FROM usuario u
LEFT JOIN seguidores s ON s.id_seguido = u.id_usuario
GROUP BY u.nome, s.id_seguido
ORDER BY num_seguidores DESC
	

--Retorne o nome dos usuários que possuem mais de 2 seguidores

SELECT 
	u.nome,
	COUNT (s.id_seguido) AS num_seguidores
FROM usuario u
LEFT JOIN seguidores s ON s.id_seguido = u.id_usuario
GROUP BY u.nome, s.id_seguido
HAVING COUNT (s.id_seguido) > 2
ORDER BY num_seguidores DESC


--Mostre apenas os nomes dos usuários que seguem o usuário 1 do seu banco

SELECT 
    u.nome
FROM usuario u
JOIN seguidores s ON s.id_usuario = u.id_usuario
WHERE s.id_seguido = 1
GROUP BY u.nome;


--Implemente o sistema de likes da sua rede social e peça 
--para o ChatGPT adicionar 50 linhas de likes

CREATE TABLE curtidas (
    id_curtida SERIAL PRIMARY KEY,
    id_curtidor INT NOT NULL REFERENCES usuario(id_usuario),
    id_post_curtido INT NOT NULL REFERENCES usuario(id_usuario)
);


INSERT INTO curtidas (id_curtidor, id_post_curtido) VALUES
(1, 1),(1, 2),(1, 3),(2, 1),
(2, 2),(2, 3),(3, 4),(3, 5),(4, 1),(4, 2),
(5, 3),(5, 4),(6, 5),(6, 6),(7, 7),(7, 8),(8, 9),(8, 10),
(9, 1),(9, 2),(10, 3),(10, 4),(11, 5),(11, 6),(12, 7),(12, 8),
(13, 9),(13, 10),(14, 11),(14, 12),(15, 13),(15, 14),(16, 15),
(16, 16),(17, 17),(17, 18),(18, 19),(18, 20),(19, 1),(19, 2),
(20, 3),(20, 4),(21, 5),(21, 6),(22, 7),(22, 8),(23, 9),
(23, 10),(24, 11),(24, 12),(25, 13),(25, 14),(1, 15),(2, 16),
(3, 17),(4, 18),(5, 19),(6, 20),(7, 1),(8, 2),(9, 3),(10, 4);


--Retornar apenas o(s) post(s) com maior número de likes

SELECT 
    p.conteudo,
    COUNT(c.id_post_curtido) AS numero_de_likes
FROM post p
JOIN curtidas c ON c.id_post_curtido = p.id_post
GROUP BY p.conteudo
HAVING COUNT(c.id_post_curtido) = (
    SELECT MAX(like_count) 
    FROM (
        SELECT COUNT(c2.id_post_curtido) AS like_count
        FROM curtidas c2
        JOIN post p2 ON c2.id_post_curtido = p2.id_post
        GROUP BY p2.id_post
    ) AS like_counts
);


--Mostre os 5 posts mais recentes da rede social, incluindo o nome do usuário que os publicou.

-- +5 posts para teste
INSERT INTO post (id_usuario, conteudo) VALUES
(1, 'Hoje foi um ótimo dia!'),
(2, 'Aprendendo SQL, muito interessante!'),
(3, 'Aproveitei o fim de semana para relaxar.'),
(4, 'Fui ao cinema e assisti um filme incrível.'),
(5, 'Vamos fazer um churrasco no próximo sábado!');


SELECT 
    p.conteudo,
    u.nome AS nome_usuario,
    p.data_postagem
FROM post p
JOIN usuario u ON p.id_usuario = u.id_usuario
ORDER BY p.data_postagem DESC
LIMIT 5;


--Retorne todos os usuários que não possuem seguidores.

SELECT 
	u.nome,
	COUNT (s.id_seguido) AS num_seguidores
FROM usuario u
LEFT JOIN seguidores s ON s.id_seguido = u.id_usuario
GROUP BY u.nome, s.id_seguido
HAVING COUNT (s.id_seguido) = 0



--Mostre a quantidade total de posts feitos por cada usuário.

SELECT
	U.nome,
	COUNT(p.id_usuario) AS posts
FROM usuario u
LEFT JOIN post p ON p.id_usuario = u.id_usuario
GROUP BY u.nome
ORDER BY posts DESC


