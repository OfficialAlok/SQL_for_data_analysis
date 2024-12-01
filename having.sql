-- Question 1
SELECT s.id, s.name, COUNT(*) count
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY count

-- Question 2
SELECT a.id, a.name, COUNT(*)
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY count;

-- Question 3
SELECT a.id, a.name, COUNT(o.*) total_orders
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
ORDER BY total_orders DESC
LIMIT 1;

-- Question 4
SELECT a.id, a.name, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) > 30000
ORDER BY total_spent;

-- Question 5
SELECT a.id, a.name, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) < 1000
ORDER BY total_spent;

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
SELECT a.id, a.name, w.channel, COUNT(*)
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY count;

-- Question 9
SELECT a.id, a.name, w.channel, COUNT(*) use_count
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_count DESC
LIMIT 1;

-- Question 10
SELECT a.id, a.name, w.channel, COUNT(*) num_count
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY num_count DESC
LIMIT 5;