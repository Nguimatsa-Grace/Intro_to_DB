-- alx_book_store.sql

-- --------------------------------------------------------------------------------
-- Database Creation
-- --------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE ALX_BOOK_STORE;

-- --------------------------------------------------------------------------------
-- 1. Authors Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- --------------------------------------------------------------------------------
-- 2. Books Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- FIX: Foreign key now references 'authors' (lowercase)
    FOREIGN KEY (author_id) REFERENCES authors(author_id) 
);

-- --------------------------------------------------------------------------------
-- 3. Customers Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- --------------------------------------------------------------------------------
-- 4. Orders Table
-- CRITICAL FIX: The referenced table name is capitalized (Customers).
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) -- <--- CAPITAL 'C'
);

-- --------------------------------------------------------------------------------
-- 5. Order_Details Table
-- CRITICAL FIX: The referenced table names are capitalized (Orders, Books).
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS order_details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), -- <--- CAPITAL 'O'
    FOREIGN KEY (book_id) REFERENCES Books(book_id)   -- <--- CAPITAL 'B'
);
