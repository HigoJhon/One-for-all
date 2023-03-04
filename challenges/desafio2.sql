SELECT 
    COUNT(music) AS cancoes,
    (SELECT COUNT(artist) FROM artist) AS artistas,
    COUNT(DISTINCT album) AS albuns
FROM
    music;