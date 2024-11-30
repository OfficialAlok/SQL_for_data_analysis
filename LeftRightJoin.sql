-- Question 1
SELECT r.name region_name, s.name rep_name, a.name name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

-- Question 2
SELECT r.name region_name, s.name sales_rep_name, a.name account_name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE s.name LIKE 'S%' AND r.name = 'Midwest'
ORDER BY a.name;

-- Question 3
SELECT r.name region_name, s.name sales_rep_name, a.name account_name
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE s.name LIKE '% K%' AND r.name = 'Midwest'
ORDER BY a.name;

-- Question 4
SELECT r.name "region name", a.name "account name", o.total_amt_usd/(o.total + 0.01) "unit price"
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100;

-- Question 5
SELECT r.name "region name", a.name "account name", o.total_amt_usd/(o.total + 0.01) "unit price"
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY "unit price";

-- Question 6
SELECT r.name "region name", a.name "account name", o.total_amt_usd/(o.total + 0.01) "unit price"
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY "unit price" DESC;

-- Question 7
SELECT DISTINCT(a.name) , w.channel
FROM accounts a
JOIN web_events w
ON w.account_id = a.id
WHERE a.id = 1001;

-- Question 8
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE occurred_at BETWEEN '2015-01-01' AND '2016-01-01';
