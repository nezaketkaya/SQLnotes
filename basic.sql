CREATE TABLE friends (
id INTEGER,
names TEXT,
birthday DATE);

INSERT INTO friends (id, names, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

SELECT * FROM friends;

INSERT INTO friends (id, names, birthday)
VALUES (2, 'Seher Yavuz', '1998-08-19'),
       (3, 'Meryem Algan', '2002-01-10');

UPDATE friends
SET names = 'Storm' WHERE id = 1;

ALTER TABLE friends
ADD COLUMN email;

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

UPDATE friends
SET email = 'seheryavuz@gmail.com'
WHERE id = 2;

UPDATE friends
SET email = 'meryemalgan@gmail.com'
WHERE id = 3;

DELETE FROM friends
WHERE id = 1;

SELECT * FROM friends;
