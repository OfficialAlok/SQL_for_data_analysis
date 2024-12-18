-- Question 
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.long, a.primary_poc, a.sales_rep_id, o.*
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL; 

-- Question 3
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, o.standard_qty, o.gloss_qty, o.total, o.standard_amt_usd, o.gloss_amt_usd, o.poster_amt_usd, o.total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL; 

-- Question 4
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty,0) standard_qty,   COALESCE(o.gloss_qty, 0) gloss_qty, COALESCE(o.total, 0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd, 0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id
WHERE o.total IS NULL; 

-- Question 5
SELECT COUNT(*)
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id;

-- Question 6
SELECT COALESCE(o.id, a.id) filled_id, a.name, a.website, a.long, a.primary_poc, a.sales_rep_id, COALESCE(o.account_id, a.id) account_id, o.occurred_at, COALESCE(o.standard_qty,0) standard_qty,   COALESCE(o.gloss_qty, 0) gloss_qty, COALESCE(o.total, 0) total, COALESCE(o.standard_amt_usd,0) standard_amt_usd, COALESCE(o.gloss_amt_usd,0) gloss_amt_usd, COALESCE(o.poster_amt_usd,0) poster_amt_usd, COALESCE(o.total_amt_usd, 0) total_amt_usd
FROM accounts a
LEFT JOIN orders o
ON a.id = o.account_id; 