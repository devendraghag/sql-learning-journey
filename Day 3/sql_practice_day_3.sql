-- ============================================================
-- SQL JOIN PRACTICE FILE (ORACLE 18)
-- DATABASE: PracticeSQL
-- PHASE 3 (JOINS) + PHASE 1,2 (FILTER + AGGREGATION)
-- ============================================================

-- ============================================================
-- 1. BASIC INNER JOIN
-- ============================================================

-- Get employee name with department name
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- Get employee name, salary, and department
SELECT e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

-- Interview Q: Difference between INNER JOIN and LEFT JOIN?


-- ============================================================
-- 2. INNER JOIN WITH FILTER (PHASE 1)
-- ============================================================

-- Employees with salary > 50000 and department IT
SELECT e.name, e.salary, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.salary > 50000
AND d.dept_name = 'IT';

-- Employees hired after 2021 in Finance
SELECT e.name, e.hire_date, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.hire_date > DATE '2021-01-01'
AND d.dept_name = 'Finance';


-- ============================================================
-- 3. INNER JOIN WITH AGGREGATION (PHASE 2)
-- ============================================================

-- Total salary per department
SELECT d.dept_name, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Average salary per department > 40000
SELECT d.dept_name, AVG(e.salary) avg_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 40000;

-- Count employees per department
SELECT d.dept_name, COUNT(*) emp_count
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


-- ============================================================
-- 4. LEFT JOIN (IMPORTANT)
-- ============================================================

-- All employees with department (even if no dept)
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- Customers with their orders
SELECT c.customer_name, o.amount
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- Customers with no orders
SELECT c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Interview Q: Why LEFT JOIN is used for finding missing data?


-- ============================================================
-- 5. RIGHT JOIN
-- ============================================================

-- All departments with employees
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- Departments with no employees
SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;


-- ============================================================
-- 6. FULL OUTER JOIN
-- ============================================================

-- All employees and all departments
SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

-- Interview Q: When to use FULL OUTER JOIN?


-- ============================================================
-- 7. MULTIPLE TABLE JOIN (CHAIN JOIN)
-- ============================================================

-- Customers + Orders + (basic filter)
SELECT c.customer_name, o.order_date, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount > 1000;

-- Total order amount per customer
SELECT c.customer_name, SUM(o.amount) total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name;

-- Customers from Mumbai with total orders > 1000
SELECT c.customer_name, SUM(o.amount) total_amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.city = 'Mumbai'
GROUP BY c.customer_name
HAVING SUM(o.amount) > 1000;


-- ============================================================
-- 8. SELF JOIN
-- ============================================================

-- Employees in same department
SELECT e1.name emp1, e2.name emp2, e1.dept_id
FROM employees e1
JOIN employees e2
ON e1.dept_id = e2.dept_id
AND e1.emp_id <> e2.emp_id;

-- Interview Q: What is SELF JOIN and where used?


-- ============================================================
-- 9. JOIN + ORDER BY + DISTINCT
-- ============================================================

-- Distinct departments with employees
SELECT DISTINCT d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY d.dept_name;

-- Top salaries (basic sort)
SELECT e.name, d.dept_name, e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;


-- ============================================================
-- 10. INTERVIEW-LEVEL QUESTIONS (NO ADVANCED SQL)
-- ============================================================

-- Q1: Department with highest total salary
SELECT d.dept_name, SUM(e.salary) total_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_salary DESC;

-- Q2: Customer who placed highest single order
SELECT c.customer_name, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.amount DESC;

-- Q3: Number of orders per city
SELECT c.city, COUNT(o.order_id) order_count
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Q4: Employees count per department (descending)
SELECT d.dept_name, COUNT(e.emp_id) emp_count
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY emp_count DESC;

-- Q5: Customers with order amount between 1000 and 2000
SELECT c.customer_name, o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.amount BETWEEN 1000 AND 2000;


-- ============================================================
-- END OF FILE
-- ============================================================