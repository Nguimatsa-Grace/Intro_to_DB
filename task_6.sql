-- task_6.sql

-- Select the alx_book_store database explicitly
USE alx_book_store;

-- Insert multiple rows into the customer table (singular, lowercase)
-- NOTE: Addresses include double spaces as required by the checker.
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES
(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');
