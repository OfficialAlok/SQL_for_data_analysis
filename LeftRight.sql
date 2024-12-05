-- Question 1
SELECT RIGHT(website,3) extension, COUNT(*)
FROM accounts
GROUP BY 1;

-- Question 2
SELECT LEFT(UPPER(name),1) first_letter, COUNT(*) total_count
FROM accounts
GROUP BY 1
ORDER BY 1;

-- Question 3
WITH t1 AS (SELECT LEFT(UPPER(name),1) first_letter,
       CASE WHEN LEFT(UPPER(name),1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') THEN 1 ELSE 0 END as number,
       CASE WHEN LEFT(UPPER(name),1) IN ('1', '2', '3', '4', '5', '6', '7', '8', '9') THEN 0 ELSE 1 END as letter
FROM accounts)

SELECT SUM(number) number, SUM(letter) letter
FROM t1;

-- Question 4
WITH t1 AS (SELECT LEFT(UPPER(name),1) first_letter,
       CASE WHEN LEFT(UPPER(name),1) IN ('A', 'E', 'I', 'O', 'U') THEN 1 ELSE 0 END as vowel,
       CASE WHEN LEFT(UPPER(name),1) IN ('A', 'E', 'I', 'O', 'U') THEN 0 ELSE 1 END as non_vowel
FROM accounts)

SELECT SUM(vowel) vowel, SUM(non_vowel) non_vowel
FROM t1;