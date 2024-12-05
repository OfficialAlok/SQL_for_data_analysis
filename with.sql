-- Question 1
WITH overall AS (
        SELECT s.name sales_rep, r.name region, SUM(total_amt_usd) total_amt
        FROM sales_reps s
        JOIN region r
        ON s.region_id = r.id
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1, 2),

    filtered AS (
        SELECT region, MAX(total_amt) maximum
        FROM overall
        GROUP BY 1)

SELECT o.sales_rep, o.region, maximum
FROM overall o
JOIN filtered f
ON f.maximum = o.total_amt
ORDER BY maximum DESC;

-- Question 2
WITH table1 AS (
        SELECT r.name region, SUM(total_amt_usd) total_amt,
        COUNT(*) total_count
        FROM sales_reps s
        JOIN region r
        ON s.region_id = r.id
        JOIN accounts a
        ON a.sales_rep_id = s.id
        JOIN orders o
        ON o.account_id = a.id
        GROUP BY 1
        ORDER BY 2 DESC)

SELECT region, total_count
FROM table1
LIMIT 1;

-- Question 3
WITH table1 AS (SELECT a.name, SUM(o.standard_qty) std, SUM(o.total) total
                FROM accounts a
                JOIN orders o
                ON o.account_id = a.id
                GROUP BY 1
               ORDER BY 2 DESC
               LIMIT 1)

SELECT COUNT(*)
FROM (
  SELECT a.name
  FROM accounts a
  JOIN orders o
  ON a.id = o.account_id
  GROUP BY 1
  HAVING SUM(total) > (SELECT total 
                       FROM table1))

-- Question 4
WITH table1 AS (SELECT a.id, a.name, SUM(o.total_amt_usd)
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1)

SELECT channel, COUNT(*)
FROM web_events
WHERE account_id = (SELECT id FROM table1)
GROUP BY 1
ORDER BY 2;

-- Question 5
WITH table1 AS (SELECT a.id, a.name, SUM(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 10)

SELECT AVG(total)
FROM table1

-- Question 6
WITH table1 AS (SELECT a.id, a.name, AVG(o.total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY 1, 2
HAVING AVG(o.total_amt_usd) > 
                (SELECT AVG(total_amt_usd)
                                FROM orders))


SELECT AVG(total)
FROM table1;