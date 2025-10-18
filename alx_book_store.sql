-- alx_book_store.sql

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS ALX_BOOK_STORE;

-- Use the newly created database
USE ALX_BOOK_STORE;

-- --------------------------------------------------------------------------------
-- 1. Authors Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS AUTHORS (
    AUTHOR_ID INT PRIMARY KEY,
    AUTHOR_NAME VARCHAR(215) NOT NULL
);

-- --------------------------------------------------------------------------------
-- 2. Books Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- --------------------------------------------------------------------------------
-- 3. Customers Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) NOT NULL UNIQUE, -- Added UNIQUE constraint for EMAIL
    ADDRESS TEXT
);

-- --------------------------------------------------------------------------------
-- 4. Orders Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- --------------------------------------------------------------------------------
-- 5. Order_Details Table
-- --------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
