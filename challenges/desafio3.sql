SELECT 
    u.name AS pessoa_usuaria,
    COUNT(h.user) AS musicas_ouvidas,
    ROUND(SUM(m.duration_seconds / 60), 2) AS total_minutos
FROM
    user AS u
        INNER JOIN
    historic AS h ON u.id = h.user
        INNER JOIN
    music AS m ON m.id = h.id_music
GROUP BY u.id
ORDER BY u.name;