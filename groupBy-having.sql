-- SQLBook: Code
select count(*) as total_emps from employees group by department
-- SQLBook: Code
SELECT 
    department,
    COUNT(*) AS total_emps,
    GROUP_CONCAT(employee_name, ', ') AS employee_names
FROM employees
where department IS NOT NULL 
GROUP BY department
-- SQLBook: Code
SELECT department, COUNT(*) AS total_department_employee
FROM employees
WHERE department IS NOT NULL
GROUP BY department;
-- SQLBook: Code
select city, avg(salary) as avg_salary from employees where city is NOT NULL group by city
-- SQLBook: Code
select department, count(*) as active_emps from employees where employment_status='active' group by department
-- SQLBook: Code
select department, sum(salary) as total_Salary from employees where city='mumbai' GROUP BY department
-- SQLBook: Code

SELECT department, COUNT(*) AS total_employee_department
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
-- SQLBook: Code
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city
HAVING AVG(salary) > 70000;
-- SQLBook: Code
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING average_salary BETWEEN 60000 AND 80000;

SELECT department, COUNT(*) AS total_employee_department
FROM employees
WHERE employment_status = 'Active'
GROUP BY department
HAVING COUNT(*) >= 4;

select email, count(*) as dup_email_count from employees GROUP BY email HAVING dup_email_count>1