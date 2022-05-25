-- subqueries in where clauses
-- return a list of employees not in the manager table
SELECT * 
FROM employees 
WHERE emp_no NOT IN (SELECT emp_no FROM dept_manager); 

-- return a count of all customers 
SELECT 
    customer_id, 
    COUNT(*)
FROM sales 
GROUP BY customer_id
ORDER BY COUNT(*) DESC;

-- return all columns in the sales table for customers above 60 yrs old
SELECT * 
FROM sales 
WHERE customer_id IN (SELECT DISTINCT customer_id
                      FROM customers WHERE age > 60); 

-- return a list of all manager's employee number, first and last names
SELECT 
    emp_no, 
    first_name, 
    last_name
FROM employees 
WHERE emp_no IN (SELECT emp_no FROM dept_manager); 

-- return a list of manager's employed through a certain time period
SELECT *
FROM dept_manager 
WHERE emp_no IN (SELECT emp_no FROM employees
                   WHERE hire_date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'); 

-- subqueries in from clauses 
-- return a list of all customers living in the south
SELECT 
    s.customer_id, 
    s.customer_name, 
    s.age, 
    s.region, 
    b.category
FROM (SELECT customer_id, customer_name, age customer_age, region 
      FROM customers WHERE region = 'South') s, 
      (SELECT customer_id, category FROM sales) b; 

-- return a list of managers w/ dept names
SELECT 
    dm.*, 
    d.dept_name
FROM dept_manager dm, (SELECT dept_no, dept_name FROM departments) d
WHERE dm.dept_no = d.dept_no;  

-- return a list of managers w/ first and last names + dept names
SELECT 
    dm.*,
    e.first_name, 
    e.last_name, 
    d.dept_name
FROM dept_manager dm, employees e, (SELECT dept_no, dept_name, FROM departments) d
WHERE dm.dept_no = d.dept_no AND e.emp_no = dm.emp_no; 

-- subqueries in select clauses 
-- return the first & last name + average salary of all employees 
SELECT 
    first_name, 
    last_name, (SELECT ROUND(AVG(salary), 2) FROM salaries) avg_salary
FROM employees; 


