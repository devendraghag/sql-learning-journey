-- DATABASE: PracticeSQL (Oracle Compatible)

-- DROP tables if re-running (optional)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE orders';
    EXECUTE IMMEDIATE 'DROP TABLE employees';
    EXECUTE IMMEDIATE 'DROP TABLE customers';
    EXECUTE IMMEDIATE 'DROP TABLE products';
    EXECUTE IMMEDIATE 'DROP TABLE departments';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

-- TABLES

CREATE TABLE departments (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER,
    dept_id NUMBER,
    hire_date DATE,
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    city VARCHAR2(50)
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    amount NUMBER,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    price NUMBER
);

-- INSERT DATA

-- Departments
INSERT ALL
    INTO departments VALUES (1,'HR')
    INTO departments VALUES (2,'IT')
    INTO departments VALUES (3,'Finance')
    INTO departments VALUES (4,'Sales')
    INTO departments VALUES (5,'Marketing')
SELECT * FROM dual;

-- Employees
INSERT ALL
    INTO employees VALUES (1,'Asha',30000,1, DATE '2022-01-10')
    INTO employees VALUES (2,'Ravi',50000,2, DATE '2021-03-15')
    INTO employees VALUES (3,'Neha',40000,3, DATE '2020-07-20')
    INTO employees VALUES (4,'Karan',60000,2, DATE '2019-11-01')
    INTO employees VALUES (5,'Meena',35000,1, DATE '2023-02-18')
    INTO employees VALUES (6,'Raj',45000,4, DATE '2021-06-25')
    INTO employees VALUES (7,'Pooja',38000,5, DATE '2022-09-10')
    INTO employees VALUES (8,'Amit',52000,2, DATE '2020-04-12')
    INTO employees VALUES (9,'Sneha',41000,3, DATE '2021-12-01')
    INTO employees VALUES (10,'Vikas',47000,4, DATE '2018-05-30')
    INTO employees VALUES (11,'Nina',33000,5, DATE '2023-01-11')
    INTO employees VALUES (12,'Arjun',55000,2, DATE '2019-07-14')
    INTO employees VALUES (13,'Rohit',49000,4, DATE '2022-03-22')
    INTO employees VALUES (14,'Kavya',37000,1, DATE '2020-10-05')
    INTO employees VALUES (15,'Deepak',62000,2, DATE '2017-08-19')
    INTO employees VALUES (16,'Simran',36000,5, DATE '2021-11-23')
    INTO employees VALUES (17,'Manish',43000,3, DATE '2022-06-30')
    INTO employees VALUES (18,'Anita',39000,1, DATE '2023-04-01')
    INTO employees VALUES (19,'Yash',51000,4, DATE '2020-02-17')
    INTO employees VALUES (20,'Priya',48000,5, DATE '2021-09-09')
SELECT * FROM dual;

-- Customers
INSERT ALL
    INTO customers VALUES (1,'Rahul','Mumbai')
    INTO customers VALUES (2,'Sneha','Pune')
    INTO customers VALUES (3,'Amit','Delhi')
    INTO customers VALUES (4,'Neha','Bangalore')
    INTO customers VALUES (5,'Raj','Chennai')
    INTO customers VALUES (6,'Pooja','Mumbai')
    INTO customers VALUES (7,'Karan','Delhi')
    INTO customers VALUES (8,'Meena','Pune')
    INTO customers VALUES (9,'Vikas','Hyderabad')
    INTO customers VALUES (10,'Anita','Mumbai')
    INTO customers VALUES (11,'Rohit','Delhi')
    INTO customers VALUES (12,'Simran','Chennai')
    INTO customers VALUES (13,'Arjun','Pune')
    INTO customers VALUES (14,'Kavya','Bangalore')
    INTO customers VALUES (15,'Deepak','Mumbai')
    INTO customers VALUES (16,'Nina','Hyderabad')
    INTO customers VALUES (17,'Yash','Delhi')
    INTO customers VALUES (18,'Priya','Mumbai')
    INTO customers VALUES (19,'Manish','Pune')
    INTO customers VALUES (20,'Asha','Chennai')
SELECT * FROM dual;

-- Orders
INSERT ALL
    INTO orders VALUES (1,1, DATE '2023-01-01',500)
    INTO orders VALUES (2,2, DATE '2023-01-05',1200)
    INTO orders VALUES (3,3, DATE '2023-01-07',800)
    INTO orders VALUES (4,4, DATE '2023-01-10',1500)
    INTO orders VALUES (5,5, DATE '2023-01-12',2000)
    INTO orders VALUES (6,6, DATE '2023-01-15',700)
    INTO orders VALUES (7,7, DATE '2023-01-18',1100)
    INTO orders VALUES (8,8, DATE '2023-01-20',900)
    INTO orders VALUES (9,9, DATE '2023-01-22',1300)
    INTO orders VALUES (10,10, DATE '2023-01-25',1700)
    INTO orders VALUES (11,11, DATE '2023-01-28',600)
    INTO orders VALUES (12,12, DATE '2023-02-01',1400)
    INTO orders VALUES (13,13, DATE '2023-02-03',1600)
    INTO orders VALUES (14,14, DATE '2023-02-05',1800)
    INTO orders VALUES (15,15, DATE '2023-02-07',2200)
    INTO orders VALUES (16,16, DATE '2023-02-09',750)
    INTO orders VALUES (17,17, DATE '2023-02-11',1250)
    INTO orders VALUES (18,18, DATE '2023-02-13',950)
    INTO orders VALUES (19,19, DATE '2023-02-15',1350)
    INTO orders VALUES (20,20, DATE '2023-02-18',1750)
SELECT * FROM dual;

-- Products
INSERT ALL
    INTO products VALUES (1,'Laptop',60000)
    INTO products VALUES (2,'Mobile',20000)
    INTO products VALUES (3,'Tablet',15000)
    INTO products VALUES (4,'Monitor',12000)
    INTO products VALUES (5,'Keyboard',2000)
    INTO products VALUES (6,'Mouse',1000)
    INTO products VALUES (7,'Printer',8000)
    INTO products VALUES (8,'Scanner',7000)
    INTO products VALUES (9,'Camera',25000)
    INTO products VALUES (10,'Headphones',3000)
    INTO products VALUES (11,'Speaker',4000)
    INTO products VALUES (12,'Smartwatch',10000)
    INTO products VALUES (13,'Router',3500)
    INTO products VALUES (14,'SSD',5000)
    INTO products VALUES (15,'Hard Drive',4500)
    INTO products VALUES (16,'Power Bank',1500)
    INTO products VALUES (17,'Microphone',3500)
    INTO products VALUES (18,'Webcam',2500)
    INTO products VALUES (19,'Projector',30000)
    INTO products VALUES (20,'Charger',1200)
SELECT * FROM dual;

COMMIT;