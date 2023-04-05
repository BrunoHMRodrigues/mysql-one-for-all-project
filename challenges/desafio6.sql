SELECT
    ROUND(MIN(pv.plan_value), 2) AS faturamento_minimo,
    ROUND(MAX(pv.plan_value), 2) AS faturamento_maximo,
    ROUND(AVG(pv.plan_value), 2) AS faturamento_medio,
    ROUND(SUM(pv.plan_value), 2) AS faturamento_total
FROM users AS u
INNER JOIN plans AS p ON p.plan_id = u.plan_id
INNER JOIN plan_values AS pv ON p.plan_value_id = pv.plan_value_id;
