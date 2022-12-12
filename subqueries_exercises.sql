USE employees;

SELECT first_name, last_name
FROM employees
WHERE hire_date = (SELECT hire_date FROM employees WHERE emp_no = 101010);

SELECT title
FROM titles
WHERE emp_no IN (SELECT emp_no FROM employees WHERE first_name = 'Aamod');

SELECT first_name, last_name
FROM employees
WHERE gender = 'F'
  AND emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01');

SELECT dept_name AS Department
FROM departments AS d
         JOIN dept_emp AS de ON d.dept_no = de.dept_no
WHERE de.emp_no IN (SELECT emp_no
                    FROM employees
                    WHERE gender = 'F'
                      AND emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date = '9999-01-01'))
ORDER BY dept_name ASC;

SELECT first_name, last_name FROM employees
WHERE emp_no = (SELECT emp_no FROM salaries ORDER BY salary DESC LIMIT 1);