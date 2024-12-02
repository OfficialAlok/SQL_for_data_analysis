SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) = (
    SELECT DATE_TRUNC('month', min(occurred_at))
    FROM orders);


-- Query 2
SELECT AVG(standard_qty) average_standard,
       AVG(gloss_qty) average_gloss,
       AVG(poster_qty) average_poster,
       SUM(total_amt_usd) total_amount
FROM (
    SELECT *
    FROM orders
    WHERE DATE_TRUNC('month', occurred_at) = (
        SELECT DATE_TRUNC('month', min(occurred_at))
        FROM orders)
        ) sub; 