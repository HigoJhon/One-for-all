SELECT 
    us.name AS pessoa_usuaria,
    IF(MAX(YEAR(his.date_reproductions)) >= 2021,
        'Ativa',
        'Inativa') AS status_pessoa_usuaria
FROM
    user AS us
        INNER JOIN
    historic AS his ON us.id = his.user
    GROUP BY us.name
    ORDER BY us.name ASC;