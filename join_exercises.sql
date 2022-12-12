USE join_test_db;
CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id)
VALUES ('jim', 'jim@example.com', 2),
       ('james', 'james@example.com', 2),
       ('sarah', 'sarah@example.com', 2),
       ('aldanis', 'aldanis@example.com', null);

SELECT users.name as user_name, roles.name as role_name
FROM users
         JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;
# i dont now if this is correct though it does run
SELECT DISTINCT COUNT(*), users.name AS user_name, roles.name AS role_name
FROM users
         JOIN roles ON users.role_id = roles.id
GROUP BY user_name, roles.id;

USE employees;
SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON e.emp_no = dm.emp_no
         JOIN titles AS t ON dm.emp_no = t.emp_no
WHERE t.title = 'Manager'
  AND curdate() < dm.to_date
ORDER BY d.dept_name;

SELECT d.dept_name AS Department_Name, CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON e.emp_no = dm.emp_no
         JOIN titles AS t ON dm.emp_no = t.emp_no
WHERE t.title = 'Manager'
  AND curdate() < dm.to_date
  AND e.gender = 'F'
ORDER BY d.dept_name;

SELECT DISTINCT t.title, count(t.title) as Total
FROM employees AS e
         JOIN titles AS t ON e.emp_no = t.emp_no
         JOIN dept_emp AS de ON e.emp_no = de.emp_no
         JOIN departments AS d ON d.dept_no = de.dept_no
WHERE t.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
  AND d.dept_name = 'Customer Service'
GROUP BY t.title;

SELECT d.dept_name                            AS Department_Name,
       CONCAT(e.first_name, ' ', e.last_name) AS Department_Manager,
       s.salary                               AS Salary
FROM departments AS d
         JOIN dept_manager AS dm
              ON d.dept_no = dm.dept_no
         JOIN employees AS e
              ON e.emp_no = dm.emp_no
         JOIN titles AS t ON dm.emp_no = t.emp_no
         JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE t.title = 'Manager'
  AND curdate() < dm.to_date
  AND curdate() < s.to_date
ORDER BY d.dept_name;