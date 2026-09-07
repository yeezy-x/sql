-- SQLBook: Code
select * from employees
-- SQLBook: Code
select employee_name, department, salary from employees
-- SQLBook: Code
select department from employees where department is not NULL
-- SQLBook: Code
select DISTINCT department from employees
-- SQLBook: Code
select * from employees WHERE department='IT'
-- SQLBook: Code
select * FROM employees WHERE salary > 50000
-- SQLBook: Code
select * FROM employees WHERE salary > 50000 AND department='IT'
-- SQLBook: Code
select * FROM employees where department IN ('IT', 'Finance')
-- SQLBook: Code
select * FROM employees where employment_status <> 'ACTIVE'
-- SQLBook: Code
select * FROM employees where NOT employment_status= 'ACTIVE'
-- SQLBook: Code
#between is inclusive
select * from employees where salary BETWEEN 40000 AND 60000
-- SQLBook: Code
select * from employees where employee_name LIKE 'A%'
-- SQLBook: Code
select * from employees WHERE email LIKE '%@gmail.com'
-- SQLBook: Code
select * from employees WHERE employee_name LIKE 'S%' AND employment_status='ACTIVE'
-- SQLBook: Code
select * from employees where manager_id IS NULL
-- SQLBook: Code
select * from employees where manager_id='NULL'
-- SQLBook: Code
SELECT *
FROM employees
WHERE email IS NOT NULL;
-- SQLBook: Code
select * FROM employees where salary IS NOT NULL ORDER BY salary ASC
-- SQLBook: Code
select * from employees where department IS NOT NULL ORDER BY department DESC, salary ASC 
-- SQLBook: Code
select * from employees where department IS NOT NULL ORDER BY department DESC, salary ASC LIMIT 5
-- SQLBook: Code
select * from employees where department IN('IT', 'Finance') AND salary BETWEEN 70000 AND 100000 ORDER BY salary DESC LIMIT 3