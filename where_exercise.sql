USE employees;
SELECT first_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%q%';

SELECT emp_no, first_name, gender
FROM employees
WHERE (first_name IN ('Irena') OR first_name IN ('Vidya') OR first_name IN ('Maya'))
  AND gender = 'M';

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE 'E%';

SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

