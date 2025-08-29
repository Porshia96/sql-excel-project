CREATE DATABASE sales_data_analysis;

-- Customer table 

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sales table

CREATE TABLE sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    sale_date DATE)
    ;
    
INSERT INTO customers (first_name, last_name, email, phone_number, address, city, country)
VALUES ('Samantha', 'Dean', 'samanthadean@gmail.com', '0725845655', 'Goodwood', 'Cape Town', 'South Africa'),
('Joel', 'Braid', 'joelbraid@outlook.com', '0755515445', 'Pinelands', 'New Jersey', 'America'),
('Veronica', 'Jack', 'veronicajack@gmail.com', '0755633225', 'Parklands', 'Bloemfontein', 'South Africa'),
('Portia', 'Ngwenya', 'portiangwenya@yahoo.com', '0755289944', 'Khayelitsha', 'Cape Town', 'South Africa'),
('John', 'George', 'Johngeorge@icloud.com', '0662582265', 'Dimbaza', 'King Williams Town', 'South Africa'),
('Asanda', 'Mxini', 'asandamxini@gmail.com', '0725558555', 'Mdantsane', 'East London', 'South Africa')
;

INSERT INTO sales (customer_id, product, quantity, price, sale_date)
VALUES (1, 'Laptop', 1, 8000, '2025-07-08'),
(2, 'Headphones', 1, 200, '2025-07-09'), 
(3, 'Mouse', 3, 600, '2025-07-10'),
(4, 'Phone', 1, 7000, '2025-07-11'),
(5, 'Keyboard', 2, 800, '2025-07-13'),
(6, 'Charger', 1, 400, '2025-07-15')
;


INSERT INTO customers (first_name, last_name, email, phone_number, address, city, country)
VALUES ('Jason', 'Merulo', 'jasonmerula@gmail.com', '0755454545', 'Boston', 'East London', 'South Africa'),
('Noah', 'Joseph', 'noahjoseph@yahoo.com', '0785256655', 'Mannenburg', 'King Williams Town', 'South Africa'),
('Maria', 'Van Burg', 'mariavanburg@gmail.com', '0725855595', 'Soweto', 'Joburg', 'South Africa'),
('Peter', 'Tino', 'petertino@icloud.com', '0883743849', 'Hillcrest', 'Joburg', 'South Africa')
;

INSERT INTO sales (customer_id, product, quantity, price, sale_date)
VALUES (7, 'Phone', 2, 12000, '2025-07-16'),
(8, 'Speaker', 3, 1600, '2025-07-17'),
(9, 'Laptop', 2, 16000, '2025-07-18'),
(10, 'Phone', 1, 9000, '2025-07-18')
;

ALTER TABLE sales
ADD COLUMN brand VARCHAR(50)
;

UPDATE sales
SET brand = 'Acer'
WHERE customer_id = 1;

SELECT *
FROM sales;

UPDATE sales
SET brand = CASE customer_id
	WHEN 2 THEN 'Volkano'
    WHEN 3 THEN 'Logitech'
    WHEN 4 THEN 'Samsung'
    WHEN 5 THEN 'Logitech'
    WHEN 6 THEN 'Tecno'
    WHEN 7 THEN 'Samsung'
    WHEN 8 THEN 'Volkano'
    WHEN 9 THEN 'Asus'
    WHEN 10 THEN 'Apple'
    ELSE brand
END;
    
-- Analyzing data
    
SELECT *
FROM customers
WHERE city = 'Cape Town';

SELECT *
FROM sales 
ORDER BY price DESC
;

-- Join

SELECT customers.customer_id, sales.price
FROM customers
JOIN sales
	ON customers.customer_id = sales.customer_id;
    
SELECT customers.city, sales.brand
FROM customers
JOIN sales
	ON customers.customer_id = sales.customer_id;
    
SELECT customers.first_name, sales.product
FROM customers
CROSS JOIN sales
	ON customers.customer_id = sales.customer_id;
    
