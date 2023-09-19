### CREATE TABLE is a clause that tells SQL you want to create a new table.
CREATE TABLE table_name (
   column_1 data_type, 
   column_2 data_type, 
   column_3 data_type   );

CREATE TABLE celebs (id INTEGER, name TEXT, age INTEGER);

### INSERT statement inserts a new row into a table.
### VALUES is a clause that indicates the data being inserted.

INSERT INTO celebs (id, name, age) VALUES (1, 'Dan Reynolds', 36);

### Instead of inserting each row in a separate INSERT statement, you can actually insert multiple rows in a single statement.

INSERT INTO table_name (col1, col2, col3)
VALUES (row1_val1, row1_val2, row1_val3), (row2_val1, row2_val2, row2_val3), (row3_val1, row3_val2, row3_val3);

### For the `DATE` data type, the format is YYYY-MM-DD.
### SELECT statements are used to fetch data from a database.
### name specifies the column to query data from.

SELECT name FROM table_name; 

### '*' allows you to select every column in a table without having to name each one individually.
SELECT * FROM table_name; 

### ALTER TABLE changes an existing table. 

ALTER TABLE table_name
ADD COLUMN new_column_name data_type; ==>  ADD COLUMN is used to add a column to the table.
### We cannot specify what position to add a column to a table. By default, a new column will always be added at the end of the table. 

ALTER TABLE table_name
DROP COLUMN column_name; ==> DROP COLUMN is used to delete a column from the table.

ALTER TABLE table_name
RENAME COLUMN old_column_name TO new_column_name;  ==> RENAME COLUMN is used to change the name of a column.

### UPDATE statement edits a row in a table.
### SET is a clause that indicates the column to edit.
### WHERE is a clause that indicates which row(s) to update with the new column value.

UPDATE celebs 
SET twitter_handle = '@taylorswift13' 
WHERE id = 4;

### Two columns can be compared using WHERE

SELECT x, y
FROM coordinates
WHERE x > y;

### The ALTER statement is used to modify columns. With ALTER, you can add columns, remove them, or even modify them.
### The UPDATE statement is used to modify rows. However, UPDATE can only update a row, and cannot remove or add rows.

### DELETE FROM statement deletes one or more rows from a table. 
### IS NULL is a condition in SQL that returns true when the value is NULL and false otherwise.

DELETE FROM celebs 
WHERE twitter_handle IS NULL;

### To delete only a specific number of rows, we can utilize the LIMIT statement.

DELETE FROM table WHERE condition LIMIT 5;

### CONSTRAINTS are applied after defining the data type for a column and provide rules for how that column can be used, 
allowing the database to reject data that doesn't meet specified restrictions.
### PRIMARY KEY columns can be used to uniquely identify the row.
### UNIQUE columns have a different value for every row.
This is similar to PRIMARY KEY except a table can have many different UNIQUE columns.

CREATE TABLE celebs (
   id INTEGER PRIMARY KEY, 
   name TEXT UNIQUE,
   date_of_birth TEXT NOT NULL,
   date_of_death TEXT DEFAULT 'Not Applicable' );

### AS is allows you to rename a column or table using an alias.

SELECT name AS 'Titles' FROM movies;

### We can alias multiple columns at a time in the same query.

SELECT course_id AS "Course ID", exercise_id AS "Exercise ID" 
FROM bugs;

### DISTINCT is used to return unique values in the output.

SELECT tools 
FROM inventory;

tools
Hammer           
Nails
Nails
Nails
........................
SELECT DISTINCT tools 
FROM inventory;

tools
Hammer
Nails

### LIKE operator in SQL is used to search for patterns or specific character sequences within text columns. 
### We use LIKE however, we must always wrap the pattern within a pair of quotations, whether for matching a number or a string.

SELECT * 
FROM movies
WHERE id LIKE '2__';  ///  WHERE name LIKE 'Se_en'; 

### '_' can be replaced by a single character. ==> Se_en => Seven

SELECT * 
FROM movies 
WHERE name LIKE '%man%'; ==> ‘Batman’ ‘Man of Steel’

### '%' can be replaced by a any sequence of characters or characters. 
### LIKE is not case sensitive. 

** When using SQL LIKE operators, how do we search for patterns containing the actual characters “%” or “_”?
-- When searching for a pattern containing the specific characters % or _, we can utilize the escape character \.

This query will match any titles that end with '100%'.

SELECT *
FROM books
WHERE title LIKE '% 100\%';

### Unknown values are indicated by NULL.
### It is not possible to test for NULL values with comparison operators, such as = and !=.
### Instead, we will have to use these operators: IS NULL // IS NOT NULL

SELECT name
FROM movies 
WHERE imdb_rating IS NOT NULL;

### BETWEEN operator is used in a WHERE clause to filter the result set within a certain range. 
### When the values are text, BETWEEN filters the result set for within the alphabetical range.

SELECT *
FROM movies
WHERE year BETWEEN 1990 AND 1999;

### AND combines the two conditions.
### With AND, both conditions must be true for the row to be included in the result.

SELECT * 
FROM movies
WHERE year BETWEEN 1990 AND 1999
          AND genre = 'romance';

### OR combines the two conditions.
### With OR, if any of the conditions are true, then the row is added to the result.

SELECT *
FROM movies
WHERE year > 2014
   OR genre = 'action';

### ORDER BY sorts the results.

SELECT *
FROM movies
WHERE imdb_rating > 8
ORDER BY year DESC;   // DESC is used to sort the results in descending order, (high to low or Z-A). 
ORDER BY name ASC;    // ASC is used to sort the results in ascending order, (low to high or A-Z).
............................
SELECT year, name
FROM movies
ORDER BY year ASC, name DESC;

### When ordering by more than one column, it will first order the data on the first column, 
then, keeping the previous column order, it will order on the next column, and so on.

### LIMIT is a clause that lets you specify the maximum number of rows the result set will have.
### It is not supported in all SQL databases.

###### In SQL, what happens if we set a LIMIT value that is greater than the total number of rows?

SELECT *
FROM names
LIMIT 100;

--- Say the table `name` has only 90 rows. 
Then, since 100 is greater than the number of rows, 
it will just return what rows are there.

### CASE statement allows us to create different outputs (usually in the SELECT statement).
### It is SQL’s way of handling if-then logic.
### The CASE statement must end with END.

SELECT name,
 CASE
  WHEN imdb_rating > 8 THEN 'Fantastic'        // If the rating is above 8, then it is Fantastic.
  WHEN imdb_rating > 6 THEN 'Poorly Received'  // If the rating is above 6, then it is Poorly Received.
  ELSE 'Avoid at All Costs'                    // The ELSE gives us the string if all the above conditions are false.
 END
FROM movies;
