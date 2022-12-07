USE codeup_test_db;
SELECT name AS 'All albums in your table'
FROM albums;
UPDATE albums set sales = sales * 10;
SELECT name AS 'All albums released before 1980'
FROM albums
WHERE release_date < 1980;
UPDATE albums SET release_date = release_date - 100 WHERE release_date < 1980;
SELECT name AS 'All albums by Michael Jackson' FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums SET artist = 'Peter Jackson' WHERE id = 3;