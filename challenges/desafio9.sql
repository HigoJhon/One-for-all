SELECT 
    COUNT(fo.user) AS musicas_no_historico
FROM
    follow AS fo
INNER JOIN user AS us ON us.id = fo.user
WHERE us.name LIKE 'BARBARA %';