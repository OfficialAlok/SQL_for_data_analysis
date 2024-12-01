-- Question 1
SELECT DATE_TRUNC('year', occurred_at), SUM(total_amt_usd) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

-- Question 2
SELECT DATE_PART('month', occurred_at), SUM(total_amt_usd) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC

-- Question 3
SELECT DATE_PART('year', occurred_at), COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

-- Question 4
SELECT DATE_PART('month', occurred_at), COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

-- Question 5
SELECT DATE_TRUNC('month', occurred_at), SUM(gloss_amt_usd) total_gloss_amt
FROM orders o
JOIN accounts a
ON o.account_id = a.id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC;