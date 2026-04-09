-- ============================================
-- SQL PRACTICE FILE: PHASE 2 (AGGREGATIONS)
-- DATABASE: PracticeSQL
-- ORACLE 18c COMPATIBLE
-- Covers: Phase 1 + Phase 2 ONLY
-- ============================================

-- Tables Used:
-- employees, customers, orders, products
-- :contentReference[oaicite:0]{index=0}

-- ============================================
-- 1. BASIC AGGREGATE FUNCTIONS
-- ============================================

-- Total number of employees
SELECT COUNT(*) FROM employees;

-- Total salary payout
SELECT SUM(salary) FROM employees;

-- Average salary
SELECT AVG(salary) FROM employees;

-- Minimum salary
SELECT MIN(salary) FROM employees;

-- Maximum salary
SELECT MAX(salary) FROM employees;


-- ============================================
-- 2. AGGREGATES WITH WHERE (FILTERING)
-- ============================================

-- Count employees with salary > 40000
SELECT COUNT(*) FROM employees WHERE salary > 40000;

-- Total salary of IT department (dept_id = 2)
SELECT SUM(salary) FROM employees WHERE dept_id = 2;

-- Average order amount above 1000
SELECT AVG(amount) FROM orders WHERE amount > 1000;

-- Max product price below 20000
SELECT MAX(price) FROM products WHERE price < 20000;


-- ============================================
-- 3. GROUP BY BASICS
-- ============================================

-- Total salary per department
SELECT dept_id, SUM(salary) FROM employees GROUP BY dept_id;

-- Count employees per department
SELECT dept_id, COUNT(*) FROM employees GROUP BY dept_id;

-- Average salary per department
SELECT dept_id, AVG(salary) FROM employees GROUP BY dept_id;

-- Total orders per customer
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;


-- ============================================
-- 4. GROUP BY + WHERE
-- ============================================

-- Salary stats for employees earning > 40000
SELECT dept_id, AVG(salary) FROM employees WHERE salary > 40000 GROUP BY dept_id;

-- Orders above 1000 grouped by customer
SELECT customer_id, COUNT(*) FROM orders WHERE amount > 1000 GROUP BY customer_id;


-- ============================================
-- 5. GROUP BY + HAVING (FILTER GROUPS)
-- ============================================

-- Departments with avg salary > 45000
SELECT dept_id, AVG(salary) FROM employees GROUP BY dept_id HAVING AVG(salary) > 45000;

-- Customers with more than 1 order
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id HAVING COUNT(*) > 1;


-- ============================================
-- 6. MULTIPLE AGGREGATES TOGETHER
-- ============================================

-- Salary summary per department
SELECT dept_id,COUNT(*) AS total_emp,SUM(salary) AS total_salary,AVG(salary) AS avg_salary,MIN(salary) AS min_salary,MAX(salary) AS max_salary FROM employees GROUP BY dept_id;

-- Order summary
SELECT customer_id,COUNT(*) AS total_orders,SUM(amount) AS total_amount,AVG(amount) AS avg_amount FROM orders GROUP BY customer_id;


-- ============================================
-- 7. GROUP BY MULTIPLE COLUMNS
-- ============================================

-- Orders grouped by customer and date
SELECT customer_id, order_date, COUNT(*) FROM orders GROUP BY customer_id, order_date;

-- Employees grouped by dept and hire date
SELECT dept_id, hire_date, COUNT(*) FROM employees GROUP BY dept_id, hire_date;


-- ============================================
-- 8. DISTINCT WITH AGGREGATES
-- ============================================

-- Count distinct departments
SELECT COUNT(DISTINCT dept_id) FROM employees;

-- Count distinct cities
SELECT COUNT(DISTINCT city) FROM customers;


-- ============================================
-- 9. ORDER BY WITH AGGREGATES
-- ============================================

-- Departments sorted by avg salary
SELECT dept_id, AVG(salary) AS avg_sal FROM employees GROUP BY dept_id ORDER BY avg_sal DESC;

-- Customers sorted by total order amount
SELECT customer_id, SUM(amount) AS total_amt FROM orders GROUP BY customer_id ORDER BY total_amt DESC;


-- ============================================
-- 10. COMBINING WHERE + GROUP BY + HAVING + ORDER
-- ============================================

-- Departments where salary > 40000 and avg > 45000
SELECT dept_id, AVG(salary) AS avg_sal FROM employees WHERE salary > 40000 GROUP BY dept_id HAVING AVG(salary) > 45000 ORDER BY avg_sal DESC;

-- Customers with high-value orders (>1000)
SELECT customer_id, SUM(amount) AS total_amt FROM orders WHERE amount > 1000 GROUP BY customer_id HAVING SUM(amount) > 2000 ORDER BY total_amt DESC;


-- ============================================
-- 11. NULL HANDLING (IMPORTANT EDGE CASE)
-- ============================================

-- Count ignores NULL   
SELECT COUNT(salary) FROM employees;

-- Count all rows
SELECT COUNT(*) FROM employees;


-- ============================================
-- END OF PHASE 2 PRACTICE
-- ============================================
-- ============================================
-- PHASE 2: INTERVIEW PRACTICE (Q + ANSWERS)
-- DATABASE: PracticeSQL
-- ORACLE 18c ONLY
-- NO JOINS / NO SUBQUERIES
-- ============================================

-- Dataset reference:
-- employees, customers, orders, products
-- :contentReference[oaicite:0]{index=0}

-- ============================================
-- ? SECTION 1: BASIC AGGREGATION
-- ============================================

-- Q1: Find total number of employees
SELECT COUNT(*) FROM employees;

-- Q2: Find total salary paid to all employees
SELECT SUM(salary) FROM employees;

-- Q3: Find average salary of employees
SELECT AVG(salary) FROM employees;

-- Q4: Find highest and lowest salary in company
SELECT MAX(salary), MIN(salary) FROM employees;

-- Q5: Find total number of products
SELECT COUNT(*) FROM products;


-- ============================================
-- ? SECTION 2: AGGREGATION WITH FILTER
-- ============================================

-- Q6: Count employees earning more than 50000
SELECT COUNT(*) FROM employees WHERE salary > 50000;

-- Q7: Find total salary of employees in department 2
SELECT SUM(salary) FROM employees WHERE dept_id = 2;

-- Q8: Find average salary of employees hired after 2021
SELECT AVG(salary)
FROM employees
WHERE hire_date > TO_DATE('2021-01-01','YYYY-MM-DD');

-- Q9: Find maximum order amount greater than 1000
SELECT MAX(amount) FROM orders WHERE amount > 1000;

-- Q10: Count customers from Mumbai
SELECT COUNT(*) FROM customers WHERE city = 'Mumbai';


-- ============================================
-- ? SECTION 3: GROUP BY BASICS
-- ============================================

-- Q11: Count employees in each department
SELECT dept_id, COUNT(*) FROM employees GROUP BY dept_id;

-- Q12: Find total salary per department
SELECT dept_id, SUM(salary) FROM employees GROUP BY dept_id;

-- Q13: Find average salary per department
SELECT dept_id, AVG(salary) FROM employees GROUP BY dept_id;

-- Q14: Count number of orders per customer
SELECT customer_id, COUNT(*) FROM orders GROUP BY customer_id;

-- Q15: Find total order amount per customer
SELECT customer_id, SUM(amount) FROM orders GROUP BY customer_id;


-- ============================================
-- ? SECTION 4: GROUP BY + WHERE
-- ============================================

-- Q16: Count employees per department where salary > 40000
SELECT dept_id, COUNT(*)
FROM employees
WHERE salary > 40000
GROUP BY dept_id;

-- Q17: Find total salary per department for employees hired after 2020
SELECT dept_id, SUM(salary)
FROM employees
WHERE hire_date > TO_DATE('2020-01-01','YYYY-MM-DD')
GROUP BY dept_id;

-- Q18: Count orders per customer where amount > 1000
SELECT customer_id, COUNT(*)
FROM orders
WHERE amount > 1000
GROUP BY customer_id;

-- Q19: Find avg salary per department where salary between 30000 and 50000
SELECT dept_id, AVG(salary)
FROM employees
WHERE salary BETWEEN 30000 AND 50000
GROUP BY dept_id;

-- Q20: Count customers per city where city is Mumbai or Pune
SELECT city, COUNT(*)
FROM customers
WHERE city IN ('Mumbai','Pune')
GROUP BY city;


-- ============================================
-- ? SECTION 5: HAVING
-- ============================================

-- Q21: Find departments with more than 3 employees
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 3;

-- Q22: Find departments with avg salary > 45000
SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 45000;

-- Q23: Find customers having more than 1 order
SELECT customer_id, COUNT(*)
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Q24: Find customers whose total order amount > 2000
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) > 2000;

-- Q25: Find departments where max salary > 60000
SELECT dept_id, MAX(salary)
FROM employees
GROUP BY dept_id
HAVING MAX(salary) > 60000;


-- ============================================
-- ? SECTION 6: MULTIPLE AGGREGATES
-- ============================================

-- Q26: Department summary (count, sum, avg)
SELECT dept_id,
       COUNT(*) AS total_emp,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id;

-- Q27: Customer order summary
SELECT customer_id,
       COUNT(*) AS total_orders,
       SUM(amount) AS total_amount,
       AVG(amount) AS avg_amount
FROM orders
GROUP BY customer_id;

-- Q28: Product price stats
SELECT MIN(price), MAX(price), AVG(price)
FROM products;

-- Q29: Employee salary stats
SELECT COUNT(*), MIN(salary), MAX(salary)
FROM employees;

-- Q30: Order stats
SELECT COUNT(*), SUM(amount)
FROM orders;


-- ============================================
-- ? SECTION 7: ORDER BY
-- ============================================

-- Q31: Departments sorted by avg salary DESC
SELECT dept_id, AVG(salary) avg_sal
FROM employees
GROUP BY dept_id
ORDER BY avg_sal DESC;

-- Q32: Customers sorted by total order amount DESC
SELECT customer_id, SUM(amount) total_amt
FROM orders
GROUP BY customer_id
ORDER BY total_amt DESC;

-- Q33: Cities sorted by number of customers DESC
SELECT city, COUNT(*) total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;

-- Q34: Departments sorted by total salary ASC
SELECT dept_id, SUM(salary) total_sal
FROM employees
GROUP BY dept_id
ORDER BY total_sal ASC;

-- Q35: Top 3 departments by avg salary
SELECT dept_id, AVG(salary) avg_sal
FROM employees
GROUP BY dept_id
ORDER BY avg_sal DESC
FETCH FIRST 3 ROWS ONLY;


-- ============================================
-- ? SECTION 8: DISTINCT
-- ============================================

-- Q36: Count distinct departments
SELECT COUNT(DISTINCT dept_id) FROM employees;

-- Q37: Count distinct cities
SELECT COUNT(DISTINCT city) FROM customers;

-- Q38: Count distinct salaries
SELECT COUNT(DISTINCT salary) FROM employees;

-- Q39: Count distinct order dates
SELECT COUNT(DISTINCT order_date) FROM orders;

-- Q40: Count distinct product prices
SELECT COUNT(DISTINCT price) FROM products;


-- ============================================
-- ? SECTION 9: MIXED INTERVIEW QUESTIONS
-- ============================================

-- Q41: Departments with total salary > 150000
SELECT dept_id, SUM(salary)
FROM employees
GROUP BY dept_id
HAVING SUM(salary) > 150000;

-- Q42: Customers with >=2 orders and total > 2000
SELECT customer_id,
       COUNT(*) total_orders,
       SUM(amount) total_amt
FROM orders
GROUP BY customer_id
HAVING COUNT(*) >= 2 AND SUM(amount) > 2000;

-- Q43: Departments with avg salary between 40000 and 55000
SELECT dept_id, AVG(salary)
FROM employees
GROUP BY dept_id
HAVING AVG(salary) BETWEEN 40000 AND 55000;

-- Q44: Cities having more than 3 customers
SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) > 3;

-- Q45: Customers where max order > 1500
SELECT customer_id, MAX(amount)
FROM orders
GROUP BY customer_id
HAVING MAX(amount) > 1500;

-- Q46: Departments where min salary < 35000
SELECT dept_id, MIN(salary)
FROM employees
GROUP BY dept_id
HAVING MIN(salary) < 35000;

-- Q47: Customers with avg order between 1000 and 1500
SELECT customer_id, AVG(amount)
FROM orders
GROUP BY customer_id
HAVING AVG(amount) BETWEEN 1000 AND 1500;

-- Q48: Departments having exactly 2 employees
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id
HAVING COUNT(*) = 2;

-- Q49: Customers with total amount between 1000 and 3000
SELECT customer_id, SUM(amount)
FROM orders
GROUP BY customer_id
HAVING SUM(amount) BETWEEN 1000 AND 3000;

-- Q50: Departments sorted by number of employees DESC
SELECT dept_id, COUNT(*) total_emp
FROM employees
GROUP BY dept_id
ORDER BY total_emp DESC;


-- ============================================
-- END OF FILE
-- ============================================