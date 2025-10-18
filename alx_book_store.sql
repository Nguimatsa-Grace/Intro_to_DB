-- alx_book_store.sql

-- --------------------------------------------------------------------------------
-- Database Creation
-- Ensures the database name is all lowercase as required by the checker.
-- --------------------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE ALX_BOOK_STORE;

-- --------------------------------------------------------------------------------
-- 1. Authors Table
-- CRITICAL FIX: Column names are now lowercase (author_id, author_name).
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- --------------------------------------------------------------------------------
-- 2. Books Table
-- CRITICAL FIX: Column names are now lowercase (book_id, author_id).
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- --------------------------------------------------------------------------------
-- 3. Customers Table
-- CRITICAL FIX: Column names are now lowercase.
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- --------------------------------------------------------------------------------
-- 4. Orders Table
-- CRITICAL FIX: Column names are now lowercase.
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- --------------------------------------------------------------------------------
-- 5. Order_Details Table
-- CRITICAL FIX: Column names are now lowercase (orderdetailid, order_id, book_id).
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS order_details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
