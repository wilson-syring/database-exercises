USE employees;

SELECT CONCAT(last_name, ', ', first_name) AS full_name
FROM employees
LIMIT 10;

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date
FROM employees
LIMIT 10;
