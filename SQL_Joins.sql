-- Retrieve data from the dept_manager_dup & departments_dup tables in the database
SELECT * 
FROM dept_manager_dup;

SELECT * 
FROM departments_dup;

-- Retrieve data from the two tables using an INNER JOIN
SELECT 
    m.emp_no, 
    m.dept_no, 
    d.dept_name 
FROM dept_manager_dup m 
INNER JOIN departments_dup d 
ON m.dept_no = d.dept_no 
ORDER BY m.dept_no; 

-- Retrieve data from the two tables using a LEFT JOIN
SELECT m.dept_no, m.emp_no, d.dept_name
FROM dept_manager_dup m
LEFT JOIN departments_dup d 
ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- Retrieve data from the two tables using a RIGHT JOIN
SELECT 
    m.dept_no, 
    m.emp_no, 
    d.dept_name
FROM dept_manager_dup m 
RIGHT OUTER JOIN departments_dup d 
ON m.dept_no = d.dept_no 
ORDER BY dept_no; 

-- Retrieve data from tables using JOIN & WHERE statements together
SELECT 
    e.first_name, 
    e.last_name, 
FROM employees e
JOIN  s 
ON e.emp_no = s.emp_no
WHERE s.salary > 125000;

-- Pull the employee number, f_name, l_name & salary of employees earning above 125K/year
SELECT 
    e.first_name, 
    e.last_name, 
    s.salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
WHERE s.salary > 125000;

-- Retrieve data in the employees database using aggregate funcs. w/ joins
-- Calcuating average salary for male and female
SELECT 
    e.emp_no, 
    e.gender, 
    AVG(s.salary) AS average_salary
FROM employees e
JOIN salaries s 
ON e.emp_no = s.emp_no
GROUP BY e.emp_no, gender; 

-- COUNT of males & females in managerial positions
SELECT 
    e.gender,
    COUNT(dm.emp_no)
FROM employees e 
JOIN dept_manager dm 
ON e.emp_no = dm.emp_no 
GROUP BY e.gender; 

-- Retrieve data by joining more than two Tables in SQL
-- Pull a list of all managers' f_name & l_name, dept_no, hire date, to_date, 
-- & department name
SELECT 
    e.first_name, 
    e.last_name, 
    m.dept_no, 
    e.hire_date, 
    m.to_date, 
    d.dept_name
FROM departments d
JOIN dept_manager m 
ON d.dept_no = m.dept_no
JOIN employees e 
ON m.emp_no = e.emp_no;



