
-- DATABASE: PracticeSQL

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price INT
);

-- INSERT DATA

INSERT INTO departments VALUES
(1,'HR'),(2,'IT'),(3,'Finance'),(4,'Sales'),(5,'Marketing');

INSERT INTO employees VALUES
(1,'Asha',30000,1,'2022-01-10'),
(2,'Ravi',50000,2,'2021-03-15'),
(3,'Neha',40000,3,'2020-07-20'),
(4,'Karan',60000,2,'2019-11-01'),
(5,'Meena',35000,1,'2023-02-18'),
(6,'Raj',45000,4,'2021-06-25'),
(7,'Pooja',38000,5,'2022-09-10'),
(8,'Amit',52000,2,'2020-04-12'),
(9,'Sneha',41000,3,'2021-12-01'),
(10,'Vikas',47000,4,'2018-05-30'),
(11,'Nina',33000,5,'2023-01-11'),
(12,'Arjun',55000,2,'2019-07-14'),
(13,'Rohit',49000,4,'2022-03-22'),
(14,'Kavya',37000,1,'2020-10-05'),
(15,'Deepak',62000,2,'2017-08-19'),
(16,'Simran',36000,5,'2021-11-23'),
(17,'Manish',43000,3,'2022-06-30'),
(18,'Anita',39000,1,'2023-04-01'),
(19,'Yash',51000,4,'2020-02-17'),
(20,'Priya',48000,5,'2021-09-09');

INSERT INTO customers VALUES
(1,'Rahul','Mumbai'),
(2,'Sneha','Pune'),
(3,'Amit','Delhi'),
(4,'Neha','Bangalore'),
(5,'Raj','Chennai'),
(6,'Pooja','Mumbai'),
(7,'Karan','Delhi'),
(8,'Meena','Pune'),
(9,'Vikas','Hyderabad'),
(10,'Anita','Mumbai'),
(11,'Rohit','Delhi'),
(12,'Simran','Chennai'),
(13,'Arjun','Pune'),
(14,'Kavya','Bangalore'),
(15,'Deepak','Mumbai'),
(16,'Nina','Hyderabad'),
(17,'Yash','Delhi'),
(18,'Priya','Mumbai'),
(19,'Manish','Pune'),
(20,'Asha','Chennai');

INSERT INTO orders VALUES
(1,1,'2023-01-01',500),
(2,2,'2023-01-05',1200),
(3,3,'2023-01-07',800),
(4,4,'2023-01-10',1500),
(5,5,'2023-01-12',2000),
(6,6,'2023-01-15',700),
(7,7,'2023-01-18',1100),
(8,8,'2023-01-20',900),
(9,9,'2023-01-22',1300),
(10,10,'2023-01-25',1700),
(11,11,'2023-01-28',600),
(12,12,'2023-02-01',1400),
(13,13,'2023-02-03',1600),
(14,14,'2023-02-05',1800),
(15,15,'2023-02-07',2200),
(16,16,'2023-02-09',750),
(17,17,'2023-02-11',1250),
(18,18,'2023-02-13',950),
(19,19,'2023-02-15',1350),
(20,20,'2023-02-18',1750);

INSERT INTO products VALUES
(1,'Laptop',60000),
(2,'Mobile',20000),
(3,'Tablet',15000),
(4,'Monitor',12000),
(5,'Keyboard',2000),
(6,'Mouse',1000),
(7,'Printer',8000),
(8,'Scanner',7000),
(9,'Camera',25000),
(10,'Headphones',3000),
(11,'Speaker',4000),
(12,'Smartwatch',10000),
(13,'Router',3500),
(14,'SSD',5000),
(15,'Hard Drive',4500),
(16,'Power Bank',1500),
(17,'Microphone',3500),
(18,'Webcam',2500),
(19,'Projector',30000),
(20,'Charger',1200);
