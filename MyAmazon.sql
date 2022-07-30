-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'my_trade' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS my_trade;
CREATE DATABASE my_trade;
-- connect via psql
\c my_trade

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

CREATE TABLE users (
    id SERIAL,
    name TEXT NOT NULL,
    address TEXT,
    email TEXT UNIQUE,
    phone TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE products (
    id SERIAL,
    name TEXT NOT NULL,
    price REAL NOT NULL,
    amountinstock INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE carts (
    id SERIAL,
    user_id INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE payments (
    id SERIAL,
    user_id INT NOT NULL,
    cardnumber TEXT NOT NULL,
    cardaddress TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products_carts (
    product_id INT NOT NULL,
    cart_id INT NOT NULL,
    count INT NOT NULL
);

-- Add Constraints
ALTER TABLE carts
ADD CONSTRAINT fk_carts_users
FOREIGN KEY (user_id)
REFERENCES users (id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_users 
FOREIGN KEY (user_id) 
REFERENCES users (id);

ALTER TABLE products_carts
ADD CONSTRAINT fk_products_carts_products 
FOREIGN KEY (product_id) 
REFERENCES products (id);

ALTER TABLE products_carts
ADD CONSTRAINT fk_products_carts_carts 
FOREIGN KEY (cart_id) 
REFERENCES carts (id);

-- Remove data from all tables
TRUNCATE TABLE users, products, carts, payments, products_carts 
CASCADE;

-- Insert Data into tables
INSERT INTO users(name, address, email, phone)
VALUES ('apple','dd','apple@google.com','000-000-0000'),
('bannana','dd','bannana@google.com','000-000-0001'),
('cherry','dd','cherry@google.com','000-000-0002'),
('durian','dd','durian@google.com','000-000-0003');

INSERT INTO products(name, price, amountinstock)
VALUES ('eggplants','2.00','100'),
('figs','2.50','100'),
('guavas','3.00','100'),
('hazelnuts','3.05','100');

INSERT INTO carts(user_id)(
	SELECT id
	FROM users WHERE users is NOT NULL
);

INSERT INTO payments(user_id, cardnumber, cardaddress)
VALUES (1,'2222-2222-2222','dd'),
(2,'2222-2222-2223','dd'),
(3,'2222-2222-2224','dd'),
(4,'2222-2222-2225','dd');

INSERT INTO  products_carts(product_id, cart_id, count)
VALUES (1,1,2),
(2,1,2),
(3,1,2),
(4,1,10),
(1,2,2),
(2,2,2),
(4,2,10),
(1,3,3),
(2,3,5),
(3,3,5),
(4,3,12);
