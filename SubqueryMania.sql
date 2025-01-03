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
SELECT region, total_count
FROM (
SELECT r.name region, SUM(o.total_amt_usd) total, COUNT(o.*) total_count
FROM sales_reps s
JOIN region r
ON r.id = s.region_id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
GROUP BY 1
ORDER BY 2 DESC) t1
LIMIT 1;

-- Question 3
SELECT COUNT(*)
FROM (
SELECT a.id, a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
HAVING SUM(total)> (
    SELECT total
    FROM (
        SELECT SUM(o.standard_qty) total_std, SUM(o.total) total
        FROM accounts a
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY a.name
        ORDER BY 1 DESC
        LIMIT 1)
    )
);

-- Question 4
SELECT a.name, w.channel, count(*)
FROM web_events w
JOIN accounts a 
ON a.id = w.account_id AND a.id = (
    SELECT id 
    FROM (
        SELECT a.id, a.name, SUM(o.total_amt_usd) spent
        FROM accounts a
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2
        ORDER BY 3 DESC
        LIMIT 1) t1)
GROUP BY 1, 2
ORDER BY 3 DESC;

-- Question 5
SELECT AVG(spent) average_total_amt
FROM (
    SELECT a.id, a.name, SUM(o.total_amt_usd) spent
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY 1, 2
    ORDER BY 3 DESC
    LIMIT 10) t1;

-- Qustion 6
SELECT AVG(avg_total) lifetime_average
FROM (
    SELECT a.id, a.name, AVG(total_amt_usd) avg_total
    FROM accounts a
    JOIN orders o
    ON o.account_id = a.id
    GROUP BY 1, 2
    HAVING AVG(total_amt_usd) > (
    SELECT AVG(total_amt_usd) avg_total
    FROM orders)) temp;