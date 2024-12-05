-- Question 1
With t1 AS (SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) first_name,
                RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) last_name,
                name
            FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name,'@',name)
FROM t1;

-- Question 2
With t1 AS (SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) first_name,
                RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) last_name,
                name
            FROM accounts)
SELECT first_name, last_name, CONCAT(first_name, '.', last_name,'@',REPLACE(name,' ',''))
FROM t1;

-- Question 3
SELECT primary_poc,
       LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1) ||
       '.' ||
       RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')) || '@' || REPLACE(name,' ','') || '.com' AS email,
        LOWER(LEFT(primary_poc, 1)) || RIGHT(LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1), 1) ||  LOWER(LEFT(RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' ')), 1)) || RIGHT(primary_poc, 1) || LENGTH(LEFT(primary_poc, STRPOS(primary_poc, ' ') - 1)) || LENGTH(RIGHT(primary_poc, LENGTH(primary_poc) -  STRPOS(primary_poc, ' '))) || UPPER(REPLACE(name, ' ', '')) AS password
FROM accounts;