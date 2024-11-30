-- Question 1
SELECT a.name, AVG(standard_qty) std_qty, AVG(gloss_qty) gloss_qty, AVG(poster_qty) poster_qty
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name;

-- Question 2
SELECT a.name, AVG(standard_amt_usd) std_amt, AVG(gloss_amt_usd) gloss_amt, AVG(poster_amt_usd) poster_amt
FROM accounts a
JOIN orders o
ON o.account_id = a.id
GROUP BY a.name;

-- Question 3
SELECT s.name, w.channel, COUNT(*) num_events
FROM sales_reps s
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN web_events w
ON w.account_id = a.id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

-- Question 4
SELECT r.name, w.channel, COUNT(*) num_events
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN web_events w
ON w.account_id = a.id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;
