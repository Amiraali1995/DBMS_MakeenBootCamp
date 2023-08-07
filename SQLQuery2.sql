--create database test;
/*CREATE TABLE books (
    id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    publication_year INT,
    price DECIMAL(10, 2)
);*/
/*INSERT INTO books (id, title, author, publication_year, price)
VALUES
    (1, 'Book A', 'Author X', 2021, 25.99),
    (2, 'Book B', 'Author Y', 2019, 19.95),
    (3, 'Book C', 'Author Z', 2020, 29.50);
*/
-- Retrieve all books from the database
SELECT * FROM books;

-- Retrieve books published after 2019
SELECT * FROM books WHERE publication_year > 2019;

-- Retrieve the total price of all books
SELECT SUM(price) AS total_price FROM books;
/*
ALTER TABLE books
ADD CONSTRAINT CHK_PositivePrice CHECK (price >= 0);
*/
UPDATE books SET price = price * 0.9 WHERE publication_year < 2020;
UPDATE books SET price = price * 1.1 WHERE publication_year >= 2020;
-- Changes will be committed automatically by SQL Server if there are no errors
-- or rolled back automatically if any update fails





