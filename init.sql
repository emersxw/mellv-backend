CREATE TABLE books (
  ID SERIAL PRIMARY KEY,
  author VARCHAR(255) NOT NULL,
  title VARCHAR(255) NOT NULL
);

INSERT INTO books (author, title)
VALUES  ('J.K. Rowling', 'Harry Potter');










CREATE TABLE products (ID SERIAL PRIMARY KEY, product_name VARCHAR(100), product_type INTEGER, price NUMERIC(15,6), size VARCHAR(50), product_description VARCHAR(5000), product_image VARCHAR(500));