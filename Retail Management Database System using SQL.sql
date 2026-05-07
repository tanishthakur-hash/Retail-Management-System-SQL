-- Create Database
CREATE DATABASE Retail_Management_System;

USE Retail_Management_System;

---------------------------------------------------
-- 1. RETAILERS TABLE
---------------------------------------------------
CREATE TABLE retailers (
    retailer_id INT PRIMARY KEY,
    retailer_name VARCHAR(100),
    owner_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO retailers VALUES
(1,'Smart Mart','Rakesh Sharma','Bhopal','MP','9876543210','smart@gmail.com'),
(2,'Tech World','Amit Patel','Delhi','Delhi','9876543211','tech@gmail.com'),
(3,'Fashion Hub','Priya Verma','Indore','MP','9876543212','fashion@gmail.com'),
(4,'Fresh Basket','Deepak Jain','Pune','MH','9876543213','fresh@gmail.com'),
(5,'Book Planet','Neha Singh','Lucknow','UP','9876543214','book@gmail.com');

---------------------------------------------------
-- 2. PRODUCTS TABLE
---------------------------------------------------
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);

INSERT INTO products VALUES
(101,'Laptop','Electronics','Dell',55000,20),
(102,'Mobile Phone','Electronics','Samsung',25000,35),
(103,'T-Shirt','Clothing','Levis',1200,50),
(104,'Rice Bag','Grocery','Fortune',900,100),
(105,'Novel Book','Books','Penguin',450,40);

---------------------------------------------------
-- 3. CUSTOMERS TABLE
---------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15),
    gender VARCHAR(10)
);

INSERT INTO customers VALUES
(1,'Rahul Sharma','Bhopal','9991110001','Male'),
(2,'Sneha Patel','Delhi','9991110002','Female'),
(3,'Aman Verma','Indore','9991110003','Male'),
(4,'Pooja Singh','Lucknow','9991110004','Female'),
(5,'Karan Mehta','Pune','9991110005','Male');

---------------------------------------------------
-- 4. ORDERS TABLE
---------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    retailer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id)
);

INSERT INTO orders VALUES
(1001,1,1,'2026-01-10',55000),
(1002,2,2,'2026-01-11',25000),
(1003,3,3,'2026-01-12',1200),
(1004,4,4,'2026-01-13',900),
(1005,5,5,'2026-01-14',450);

---------------------------------------------------
-- 5. ORDER_DETAILS TABLE
---------------------------------------------------
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_details VALUES
(1,1001,101,1,55000),
(2,1002,102,1,25000),
(3,1003,103,1,1200),
(4,1004,104,1,900),
(5,1005,105,1,450);

---------------------------------------------------
-- 6. EMPLOYEES TABLE
---------------------------------------------------
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    retailer_id INT,
    position VARCHAR(50),
    salary DECIMAL(10,2),

    FOREIGN KEY (retailer_id) REFERENCES retailers(retailer_id)
);

INSERT INTO employees VALUES
(1,'Rohit Kumar',1,'Manager',45000),
(2,'Anjali Roy',2,'Sales Executive',30000),
(3,'Vikas Yadav',3,'Cashier',22000),
(4,'Simran Kaur',4,'Store Keeper',25000),
(5,'Harish Nair',5,'Accountant',35000);

---------------------------------------------------
-- 7. SUPPLIERS TABLE
---------------------------------------------------
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO suppliers VALUES
(1,'ABC Electronics','Mumbai','8881110001'),
(2,'Fashion Traders','Delhi','8881110002'),
(3,'Book House','Kolkata','8881110003'),
(4,'Fresh Foods Ltd','Pune','8881110004'),
(5,'Office Supply Co','Chennai','8881110005');

---------------------------------------------------
-- 8. PAYMENTS TABLE
---------------------------------------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    payment_date DATE,

    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO payments VALUES
(1,1001,'UPI','Completed','2026-01-10'),
(2,1002,'Credit Card','Completed','2026-01-11'),
(3,1003,'Cash','Completed','2026-01-12'),
(4,1004,'Debit Card','Pending','2026-01-13'),
(5,1005,'UPI','Completed','2026-01-14');

---------------------------------------------------
-- SHOW ALL TABLES
---------------------------------------------------
SHOW TABLES;

---------------------------------------------------
-- VIEW DATA
---------------------------------------------------
SELECT * FROM retailers;
SELECT * FROM products;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_details;
SELECT * FROM employees;
SELECT * FROM suppliers;
SELECT * FROM payments;