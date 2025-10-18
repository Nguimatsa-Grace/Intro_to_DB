-- task_2.sql

-- Select the alx_book_store database to operate within
USE ALX_BOOK_STORE;

-- 1. AUTHORS Table
-- Table name is now CAPITALIZED, columns remain lowercase.

CREATE TABLE IF NOT EXISTS AUTHORS (
author_id INT PRIMARY KEY,
author_name VARCHAR(215) NOT NULL
);

-- 2. CUSTOMERS Table

CREATE TABLE IF NOT EXISTS CUSTOMERS (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL UNIQUE,
address TEXT
);

-- 3. BOOKS Table
-- References AUTHORS (capitalized)

CREATE TABLE IF NOT EXISTS BOOKS (
book_id INT PRIMARY KEY,
title VARCHAR(130) NOT NULL,
author_id INT,
price DOUBLE NOT NULL,
publication_date DATE,
FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- 4. ORDERS Table
-- References CUSTOMERS (capitalized)

CREATE TABLE IF NOT EXISTS ORDERS (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customer_id)
);

-- 5. ORDER_DETAILS Table
-- References ORDERS and BOOKS (capitalized)

CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
orderdetailid INT PRIMARY KEY,
order_id INT,
book_id INT,
quantity DOUBLE NOT NULL,
FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
);
