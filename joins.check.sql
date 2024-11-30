-- Question 1
SELECT w.occurred_at, a.primary_poc, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name = 'Walmart';

-- Question 2
SELECT r.name, s.name, a.name
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;

-- Question 3
SELECT r.name "region name", a.name "account name", o.total_amt_usd/(o.total+0.01) "unit price"
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id;
