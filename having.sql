-- Question 1
SELECT s.id
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY s.id
HAVING COUNT(*) > 5

-- Question 2
SELECT a.id
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id
HAVING COUNT(*) > 20;

-- Question 3
SELECT a.id, a.name, COUNT(o.*) total_orders
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER BY total_orders DESC
LIMIT 1;

-- Question 4
SELECT a.id, a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) > 30000;

-- Question 5
SELECT a.id, a.name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) < 1000;

-- Question 6 
SELECT a.id, a.name, SUM(total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER by total DESC
LIMIT 1;

-- Question 7
SELECT a.id, a.name, SUM(total_amt_usd) total
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER by total
LIMIT 1;

-- Question 8
SELECT a.id, a.name
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE channel = 'facebook'
GROUP BY a.id, a.name
HAVING COUNT(*) > 6;

-- Question 9
SELECT a.id, a.name, COUNT(*)
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE channel = 'facebook'
GROUP BY a.id, a.name
ORDER BY count DESC
LIMIT 1;

-- Question 10
SELECT channel, COUNT(*)
FROM web_events
GROUP BY channel
ORDER BY count DESC
LIMIT 5;