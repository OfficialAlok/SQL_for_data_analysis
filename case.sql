
-- using case
SELECT CASE WHEN total > 500 THEN 'Over 500'
            ELSE '500 or under' END AS total_group,
        COUNT(*) AS order_count
    FROM demo.orders
GROUP BY 1;

--using where
SELECT COUNT(*) AS orders_over_500_units
FROM orders
WHERE total > 500;