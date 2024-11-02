-- Mostrar amigos/pessoas seguidas em comum entre mim e outro usuário usando `JOIN`
SELECT u.id_usuario, u.nome
FROM seguidores AS s1
JOIN seguidores AS s2 ON s1.id_seguido = s2.id_seguido
JOIN usuario AS u ON s1.id_seguido = u.id_usuario
WHERE s1.id_usuario = 1 AND s2.id_usuario = 2;


-- Mostrar amigos/pessoas seguidas em comum entre mim e outro usuário usando operador de conjunto
SELECT u.id_usuario, u.nome
FROM seguidores AS s
JOIN usuario AS u ON s.id_seguido = u.id_usuario
WHERE s.id_usuario = 1
INTERSECT
SELECT u.id_usuario, u.nome
FROM seguidores AS s
JOIN usuario AS u ON s.id_seguido = u.id_usuario
WHERE s.id_usuario = 2;


-- Sugestão de amigos/quem seguir usando `JOIN`
SELECT DISTINCT u.id_usuario, u.nome
FROM seguidores AS s1
JOIN seguidores AS s2 ON s1.id_seguido = s2.id_usuario
JOIN usuario AS u ON s2.id_seguido = u.id_usuario
WHERE s1.id_usuario = 1
  AND s2.id_seguido NOT IN (
    SELECT id_seguido FROM seguidores WHERE id_usuario = 1
  )
  AND s2.id_seguido != 1;



-- Sugestão de amigos/quem seguir usando operador de conjunto
SELECT u.id_usuario, u.nome
FROM seguidores AS s
JOIN usuario AS u ON s.id_seguido = u.id_usuario
WHERE s.id_usuario IN (
    SELECT id_seguido FROM seguidores WHERE id_usuario = 1
)
AND s.id_seguido NOT IN (
    SELECT id_seguido FROM seguidores WHERE id_usuario = 1
);
