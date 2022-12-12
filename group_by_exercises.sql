USE employees;
SELECT DISTINCT title
FROM titles;

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E'
GROUP BY last_name;

SELECT DISTINCT last_name
FROM employees
WHERE last_name LIKE '%Q%'
  AND last_name NOT LIKE '%QU%'
GROUP BY last_name
ORDER BY COUNT(last_name) ASC;

SELECT DISTINCT COUNT(last_name), last_name
FROM employees
WHERE last_name LIKE '%Q%'
  AND last_name NOT LIKE '%QU%'
GROUP BY last_name;

SELECT DISTINCT COUNT(*), gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;


