-- Question 1
SELECT t1.sales_rep, t2.region, t2.total
FROM 
    (SELECT region, MAX(total) total
    FROM (
        SELECT s.name sales_rep, r.name region, SUM(o.total_amt_usd) total
        FROM sales_reps s
        JOIN region r
        ON r.id = s.region_id
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t1
    GROUP BY 1) t2
 JOIN (
    SELECT s.name sales_rep, r.name region, SUM(o.total_amt_usd) total
    FROM sales_reps s
    JOIN region r
    ON r.id = s.region_id
    JOIN accounts a
    ON a.sales_rep_id = s.id
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY 1, 2
    ORDER BY 3 DESC) t1
ON t2.total = t1.total;

-- Question 2
SELECT r.name region, SUM(o.total_amt_usd) total, COUNT(o.*)
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Question 3
SELECT id, name, total
FROM (
    SELECT a.id, a.name, SUM(total) total
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY 1, 2
    ) t1
WHERE total > (
    SELECT SUM(o.standard_qty) total_std
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY a.name
    ORDER BY 1 DESC
    LIMIT 1
    ); 

-- Question 4
SELECT account_id, channel, count(*)
FROM web_events
WHERE account_id = (
    SELECT id 
    FROM (
        SELECT a.id, a.name, SUM(o.total_amt_usd) spent
        FROM accounts a
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2
        ORDER BY 3 DESC) t1
    LIMIT 1)
GROUP BY 1, 2;

-- Question 5
SELECT AVG(spent) average_total_amt
FROM (
SELECT a.id, a.name, SUM(o.total_amt_usd) spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10) t1

-- Qustion 6
SELECT AVG(total) lifetime_average
FROM (
SELECT a.id, a.name, AVG(total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE total > (
SELECT AVG(total_amt_usd) avg_total
FROM orders)
GROUP BY 1, 2);