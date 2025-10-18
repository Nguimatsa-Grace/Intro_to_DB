-- task_2.sql

-- Select the alx_book_store database to operate within
USE ALX_BOOK_STORE;

-- 1. Authors Table
-- Table name: Authors (Capitalized)

CREATE TABLE IF NOT EXISTS Authors (
author_id INT PRIMARY KEY,
author_name VARCHAR(215) NOT NULL
);

-- 2. Customers Table
-- Table name: Customers (Capitalized)

CREATE TABLE IF NOT EXISTS Customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(215) NOT NULL,
email VARCHAR(215) NOT NULL UNIQUE,
address TEXT
);

-- 3. Books Table
-- Table name: Books (Capitalized)
-- References Authors (Capitalized)

CREATE TABLE IF NOT EXISTS Books (
book_id INT PRIMARY KEY,
title VARCHAR(130) NOT NULL,
author_id INT,
price DOUBLE NOT NULL,
publication_date DATE,
FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- 4. Orders Table
-- Table name: Orders (Capitalized)
-- References Customers (Capitalized)

CREATE TABLE IF NOT EXISTS Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE NOT NULL,
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Order_Details Table
-- Table name: Order_Details (Capitalized with underscore)
-- References Orders and Books (Capitalized)

CREATE TABLE IF NOT EXISTS Order_Details (
orderdetailid INT PRIMARY KEY,
order_id INT,
book_id INT,
quantity DOUBLE NOT NULL,
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
