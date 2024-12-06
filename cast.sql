-- 1
SELECT *
FROM sf_crime_data
LIMIT 10;

-- 4
SELECT date orig_date, (SUBSTR(date, 7, 4) || '/' ||LEFT(date, 5))::date AS date
FROM sf_crime_data