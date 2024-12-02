SELECT *
FROM 
(SELECT DATE_TRUNC('day', occurred_at) AS day,
       channel,
       COUNT(*) AS events
FROM web_events
GROUP BY 1, 2
ORDER BY 3 DESC) sub;


-- Explored further
SELECT channel,
       AVG(events) AS average_events
FROM 
(SELECT DATE_TRUNC('day', occurred_at) AS day,
       channel, COUNT(*) events
FROM web_events
GROUP BY 1, 2) sub
GROUP BY 1
ORDER BY 2 DESC;