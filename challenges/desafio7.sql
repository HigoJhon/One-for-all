SELECT 
    ar.artist AS artista,
    al.album AS album,
    COUNT(fo.artist) AS pessoas_seguidoras
FROM
    artist AS ar
        INNER JOIN
    album AS al ON al.artist = ar.id
        INNER JOIN
    follow AS fo ON fo.artist = ar.id
GROUP BY al.id
ORDER BY pessoas_seguidoras DESC,artista,album;