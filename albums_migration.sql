CREATE DATABASE IF NOT EXISTS codeup_test_db;
USE codeup_test_db;
CREATE USER 'codeup_test_user'@'localhost' IDENTIFIED BY 'password;';
GRANT ALL ON codeup_test_db TO 'codeup_test_user'@'localhost';
CREATE TABLE albums
(
    id           INT UNSIGNED AUTO_INCREMENT NOT NULL,
    artist       VARCHAR(50),
    name         VARCHAR(50),
    release_date INT,
    sales        FLOAT,
    genre        VARCHAR(50),
    PRIMARY KEY (id)
);
DESCRIBE albums;

