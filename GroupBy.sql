-- Question 1
SELECT a.name, o.occurred_at date
FROM accounts a
JOIN orders o
ON o.account_id = a.id
ORDER BY date
LIMIT 1;

-- Question 2
SELECT a.name, SUM(total_amt_usd) total_sales
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name;

-- Question 3
SELECT w.occurred_at date, w.channel, a.name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY date DESC
LIMIT 1;

-- Question 4
SELECT w.channel, COUNT(*)
FROM web_events w
GROUP BY w.channel;

-- Question 5
SELECT primary_poc
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
ORDER BY occurred_at
LIMIT 1;


-- Question 6
SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name
ORDER BY smallest_order;

-- Question 7
SELECT r.name region, COUNT(*) sales_reps
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
GROUP BY r.name
ORDER BY sales_reps;