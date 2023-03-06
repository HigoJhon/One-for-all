SELECT 
    ar.artist AS artista, al.album AS album
FROM
    artist AS ar
        INNER JOIN
    album AS al ON ar.id = al.artist
WHERE
    ar.artist LIKE 'ELIS%'
ORDER BY ar.artist;