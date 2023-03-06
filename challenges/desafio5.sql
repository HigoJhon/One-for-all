SELECT 
	mu.music AS cancao,
    COUNT(his.id_music) AS reproducoes
FROM
	music AS mu 
INNER JOIN 
	historic AS his ON mu.id = his.id_music
GROUP BY mu.id
ORDER BY reproducoes DESC, cancao
LIMIT 2;