-- ===============================
-- ? PHASE 1 PRACTICE (BASIC ONLY)
-- ===============================

-- 1. Employees with salary less than 40000
SELECT name, salary FROM employees WHERE salary < 40000;

-- 2. Employees not in department 2
SELECT * FROM employees WHERE dept_id <> 2;

-- 3. Employees hired before 2021
SELECT name, hire_date FROM employees WHERE hire_date < DATE '2021-01-01';

-- 4. Customers not from Mumbai
SELECT * FROM customers WHERE city <> 'Mumbai';

-- 5. Customers from Delhi sorted by name
SELECT customer_name, city FROM customers WHERE city = 'Delhi' ORDER BY customer_name;

-- 6. Products with price >= 10000
SELECT product_name, price FROM products WHERE price >= 10000;

-- 7. Products not between 5000 and 20000
SELECT * FROM products WHERE price NOT BETWEEN 5000 AND 20000;

-- 8. Employees with salary = 45000 OR 47000
SELECT * FROM employees WHERE salary = 45000 OR salary = 47000;

-- 9. Employees whose name contains 'ee'
SELECT * FROM employees WHERE name LIKE '%ee%';

-- 10. Customers whose name starts with 'S'
SELECT * FROM customers WHERE customer_name LIKE 'S%';

-- 11. Employees whose name does NOT start with 'A'
SELECT * FROM employees WHERE name NOT LIKE 'A%';

-- 12. Products sorted by highest price but only top 3
SELECT product_name, price FROM products ORDER BY price DESC FETCH FIRST 3 ROWS ONLY;

-- 13. Employees sorted by hire_date (oldest first)
SELECT name, hire_date FROM employees ORDER BY hire_date ASC;

-- 14. Employees with salary between 30000 and 45000 sorted descending
SELECT name, salary FROM employees WHERE salary BETWEEN 30000 AND 45000 ORDER BY salary DESC;

-- 15. Customers from Mumbai, Pune, or Delhi
SELECT * FROM customers WHERE city IN ('Mumbai', 'Pune', 'Delhi');

-- 16. Products where price is exactly 1000, 2000, or 3000
SELECT * FROM products WHERE price IN (1000, 2000, 3000);

-- 17. Employees with salary NOT greater than 50000
SELECT * FROM employees WHERE salary <= 50000;

-- 18. Employees hired in 2022
SELECT * FROM employees WHERE hire_date BETWEEN DATE '2022-01-01' AND DATE '2022-12-31';

-- 19. Customers sorted by city then name
SELECT customer_name, city FROM customers ORDER BY city ASC, customer_name ASC;

-- 20. Products with name ending in 'r'
SELECT * FROM products WHERE product_name LIKE '%r';

-- ===============================
-- ? PHASE 1 INTERVIEW PRACTICE
-- ===============================

-- 21. Employees with salary greater than or equal to 48000 and not in department 2
SELECT * FROM employees WHERE salary >= 48000 AND dept_id <> 2;

-- 22. Employees whose salary is between 35000 and 55000 but not equal to 50000
SELECT * FROM employees WHERE salary BETWEEN 35000 AND 55000 AND salary <> 50000;

-- 23. Employees whose name starts with 'S' or ends with 'a'
SELECT * FROM employees WHERE name LIKE 'S%' OR name LIKE '%a';

-- 24. Employees whose name has exactly 5 characters
SELECT * FROM employees WHERE name LIKE '_____';

-- 25. Employees whose name has 'a' as second character
SELECT * FROM employees WHERE name LIKE '_a%';

-- 26. Customers from cities other than Mumbai, Pune, Delhi
SELECT * FROM customers WHERE city NOT IN ('Mumbai','Pune','Delhi');

-- 27. Customers whose name does not contain 'a'
SELECT * FROM customers WHERE customer_name NOT LIKE '%a%';

-- 28. Products with price less than 5000 or greater than 20000
SELECT * FROM products WHERE price < 5000 OR price > 20000;

-- 29. Products whose name starts with 'P' and price greater than 5000
SELECT * FROM products WHERE product_name LIKE 'P%' AND price > 5000;

-- 30. Products whose name contains 'o' but not ending with 'r'
SELECT * FROM products WHERE product_name LIKE '%o%' AND product_name NOT LIKE '%r';

-- 31. Employees hired after 2020 and salary less than 50000
SELECT * FROM employees WHERE hire_date > DATE '2020-01-01' AND salary < 50000;

-- 32. Employees hired before 2022 or salary greater than 55000
SELECT * FROM employees WHERE hire_date < DATE '2022-01-01' OR salary > 55000;

-- 33. Employees sorted by salary ascending and name descending
SELECT name, salary FROM employees ORDER BY salary ASC, name DESC;

-- 34. Employees with lowest 3 salaries
SELECT name, salary FROM employees ORDER BY salary ASC FETCH FIRST 3 ROWS ONLY;

-- 35. Products sorted by price descending but skip top 2 and get next 3
SELECT product_name, price FROM products ORDER BY price DESC OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;

-- 36. Employees whose name contains 'i' and salary between 30000 and 50000
SELECT * FROM employees WHERE name LIKE '%i%' AND salary BETWEEN 30000 AND 50000;

-- 37. Customers whose name starts with 'A' or 'M'
SELECT * FROM customers WHERE customer_name LIKE 'A%' OR customer_name LIKE 'M%';

-- 38. Customers whose city starts with 'B' or ends with 'e'
SELECT * FROM customers WHERE city LIKE 'B%' OR city LIKE '%e';

-- 39. Products whose price is not equal to 1000, 2000, 3000
SELECT * FROM products WHERE price NOT IN (1000,2000,3000);

-- 40. Employees whose name does not have 'e' anywhere
SELECT * FROM employees WHERE name NOT LIKE '%e%';

-- 41. Employees hired in 2021 sorted by latest first
SELECT * FROM employees WHERE hire_date BETWEEN DATE '2021-01-01' AND DATE '2021-12-31' ORDER BY hire_date DESC;

-- 42. Employees with salary exactly 30000, 40000, or 50000
SELECT * FROM employees WHERE salary IN (30000,40000,50000);

-- 43. Products with name length 6 characters
SELECT * FROM products WHERE product_name LIKE '______';

-- 44. Products whose name second letter is 'o'
SELECT * FROM products WHERE product_name LIKE '_o%';

-- 45. Customers sorted by name descending and city ascending
SELECT customer_name, city FROM customers ORDER BY customer_name DESC, city ASC;

-- 46. Employees whose salary is outside 35000 to 55000 range
SELECT * FROM employees WHERE salary NOT BETWEEN 35000 AND 55000;

-- 47. Employees whose name starts with vowel
SELECT * FROM employees WHERE name LIKE 'A%' OR name LIKE 'E%' OR name LIKE 'I%' OR name LIKE 'O%' OR name LIKE 'U%';

-- 48. Products whose name contains 'a' and price less than 10000
SELECT * FROM products WHERE product_name LIKE '%a%' AND price < 10000;

-- 49. Customers whose city is exactly 5 characters
SELECT * FROM customers WHERE city LIKE '_____';

-- 50. Employees sorted by hire_date descending and salary ascending
SELECT name, hire_date, salary FROM employees ORDER BY hire_date DESC, salary ASC;

