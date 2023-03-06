SELECT 
    MIN(pl.value) AS faturamento_minimo,
    MAX(pl.value) AS faturamento_maximo,
    ROUND(((SUM(pl.value)) / (COUNT(us.plan))), 2) AS faturamento_medio,
    ROUND(SUM(pl.value),2) AS faturamento_total
FROM
    plans AS pl
        INNER JOIN
    user AS us ON us.plan = pl.id;