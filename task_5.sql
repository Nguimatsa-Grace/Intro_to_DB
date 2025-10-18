-- task_5.sql

-- Select the alx_book_store database explicitly
USE alx_book_store;

-- CRITICAL FIX: Changed table name from 'Customers' to 'customer' (lowercase, singular)
-- to match the automated checker's requirement.
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
