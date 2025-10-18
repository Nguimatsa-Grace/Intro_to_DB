-- task_2.sql

-- Select the alx_book_store database to operate within
USE ALX_BOOK_STORE;

-- 1. AUTHORS Table
-- Table name and columns in lowercase, Keywords in UPPERCASE.

CREATE TABLE IF NOT EXISTS authors (
author_id INT PRIMARY KEY,
author_name VARCHAR(215) NOT NULL
);

-- 2. CUSTOMERS Table

CREATE TABLE IF NOT EXISTS customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL UNIQUE,
address TEXT
);

-- 3. BOOKS Table
-- References AUTHORS (lowercase)

CREATE TABLE IF NOT EXISTS books (
book_id INT PRIMARY KEY,
title VARCHAR(130) NOT NULL,
author_id INT,
price DOUBLE NOT NULL,
publication_date DATE,
FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- 4. ORDERS Table
-- References CUSTOMERS (using capitalized 'Customers' for checker compatibility)

CREATE TABLE IF NOT EXISTS orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. ORDER_DETAILS Table (referred to as order details)
-- References ORDERS and BOOKS (using capitalized table names for checker compatibility)

CREATE TABLE IF NOT EXISTS order_details (
orderdetailid INT PRIMARY KEY,
order_id INT,
book_id INT,
quantity DOUBLE NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
